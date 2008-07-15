unit uMPArticle;

//Originally programmed by Martin German as tImapMessage for Hamster
//Modified, reduced and so on by Heiko Studt

interface

uses Classes, cArticle;

type

  TMPArticle = class( TArticle )
    private
      ContentType    : String;
      ContentSubtype : String;
      BodyLines      : Integer;
      Parts          : Array of TMPArticle;

      procedure ParseMessage;
    public
      Procedure SetText(s : string);
      function  GetPartText(idx : integer) : string;
      function  GetPartsCount : integer;
      function  GetPartTyp(idx : integer) : String;

      Constructor Create(s : string); overload;
      Constructor Create; overload;
      Destructor Destroy; override;
  end;


implementation

uses Sysutils, uTools;

CONST CRLF = #13#10;

function QuotedStringOrToken( s: String ): String;
    function PosWhSpace( s : String ) : Integer;
    var  j: Integer;
    begin
         Result := Pos( ' ', s );
         if Result=0 then begin
            Result := Pos( #9, s );
         end else begin
            j := Pos( #9, s );
            if (j>0) and (j<Result) then Result:=j;
         end;
    end;

var  i : Integer;
begin
     s := TrimWhSpace( s );  // Bugfix
     i := Length(s);
     if (i > 1) and (s[1] = '"') then begin
        i := Pos( '"' , Copy(s,2,i-1) ) + 1;
        if i > 1 then begin                                   // Quoted string
            Result := Copy( s, 2, i-2 );
            exit
        end
     end;                                                      // Token
     i := PosWhSpace( s ) - 1;
     if i = -1 then i := Length(s);
     Result := Copy( s, 1, i );
end;



procedure TMPArticle.ParseMessage;
var
     i, BoundaryLength : Integer;
     s, BoundaryString : String;
     CurrentPart       : Integer;
begin
     BodyLines := -1;            // don't count the body lines unless requested
     BoundaryString := '';
     SetLength( Parts, 0 );

     s := HeaderWOCRLF[ 'Content-Type:' ];
     if s = '' then s := 'text/plain';
     i := Pos( '/', s );
     if i > 0 then begin
        ContentType    := Uppercase( Copy( s, 1, i-1 ) );
        ContentSubtype := Uppercase( Copy( s, i+1, Length(s)-i ) );
        i := Pos( ';', ContentSubtype );
        if i > 0 then SetLength( ContentSubtype, i-1 );
     end;{ else
        Log( LOGID_WARN, 'Error parsing Header ''Content-Type''.' );}

     if ContentType = 'MULTIPART' then begin
        i := Pos( 'BOUNDARY=', uppercase(s) );
        if i > 0 then begin
           System.Delete( s, 1, i+8 );
           s := QuotedStringOrToken( s );

           // If a boundary delimiter line appears to end with white space,
           // the white space must be presumed to have been added by a gateway,
           // and must be deleted.
           while s[Length(s)] in [#9,' '] do System.Delete( s, Length(s), 1 );

           // The CRLF preceding the boundary delimiter line is conceptually
           // attached to the boundary so that it is possible to have a part
           // that does not end with a CRLF (line break).
           BoundaryString := CRLF + '--' + s;
           BoundaryLength := Length( BoundaryString );
        end else begin
//           Log( LOGID_WARN, 'Error parsing Multipart message: ''boundary'' not found.' );
           exit
        end;

        CurrentPart := -1;
        s := FullBody;

        i := Pos( BoundaryString, s );
        while i > 0 do begin
           if CurrentPart > -1 then begin
              SetLength( Parts, CurrentPart + 1 );
              try
                Parts[CurrentPart] := TMPArticle.Create(Copy( s, 1, i-1 )); //Changed
              except
                 on E:Exception do begin
//                    Log( LOGID_ERROR, 'Exception parsing multipart message: ' + E.Message );
                    Parts[CurrentPart].Free;
                    SetLength( Parts, CurrentPart );
                 end
              end
           end;
           System.Delete( s, 1, i-1+BoundaryLength );
           if Copy(s,1,2) = '--' then break;                  // last body part
           i := Pos( CRLF, s );
           if i > 0 then System.Delete( s, 1, i+1 )
           else break;                                        // unexpected end
           i := Pos( BoundaryString, s );
           inc( CurrentPart )
        end
     end

     else if (ContentType = 'MESSAGE') and (ContentSubtype = 'RFC822') then begin
        try
           SetLength( Parts, 1 );
           Parts[0] := TMPArticle.Create(FullBody); //Changed
        except
           on E:Exception do begin
//              Log( LOGID_ERROR, 'Exception parsing RFC822 message: ' + E.Message );
              if Length(Parts) > 0 then Parts[0].Free;
              SetLength( Parts, 0 );
           end
        end
     end
end;
{
procedure TImapMessage.LoadFromFile( const FileName: String );
Var s: String;
begin
   With TFileStream.Create( FileName, fmOpenRead or fmShareDenyWrite ) do try
      SetLength(s, Size);
      If Size > 0 then Read( s[1], Size );
   finally
      Free
   end;
   Text := S;
   ParseMessage
end;
}
destructor TMPArticle.Destroy;
var  i : Integer;
begin
     for i := 0 to High( Parts ) do FreeAndNil( Parts[i] );
     inherited Destroy;
end;


constructor TMPArticle.Create(s: string);
begin
  inherited Create;
  Text := s;
  ParseMessage;
end;

procedure TMPArticle.SetText(s: string);
begin
  Text := s;
  ParseMessage;
end;

function TMPArticle.GetPartText(idx: integer): string;
begin
  if idx<0 then
    Result := ''
  else if idx=0 then
    Result := FullHeader
  else begin
    if length(Parts)>=idx then
      Result := Parts[idx-1].Text
    else
      Result := '';
  end;
end;

constructor TMPArticle.Create;
begin
  inherited;
  Text := '';
end;

function TMPArticle.GetPartsCount: integer;
begin
  Result := length(Parts)
end;

function TMPArticle.GetPartTyp(idx: integer): String;
begin
  if idx>0 then begin
    if idx=1 then begin
      Result := 'TEXT/PLAIN'
    end else begin
      if length(Parts)>=idx then
        Result := Parts[idx-1].ContentType + '/' + Parts[idx-1].ContentSubType 
      else
        Result := ''
    end
  end else
    Result := ''
end;

end.
