unit uTools;

interface

uses classes;

type
  TFileStreamEx = class( TFileStream ) // OJB //JW-Chg
    Size : LongWord;
  public
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: LongWord; Origin: Word): Longint; reintroduce;
  end;

function TrimWhSpace( Const s : String ) : String;
function FilterNameOfFrom( F: String ) : String;
function FilterEmailOfFrom(From:String):String;

function ValToPercent( l, g : LongInt ) : String; //AgtFind


function GetMyBuildInfo: String;
function GetMyVersionInfo (Const bBuildInParantheses: Boolean): String;
function GetMyStringFileInfo( StringName, DefResult: String ): String;


implementation

uses sysutils, windows, forms;

function TrimWhSpace( Const s : String ) : String;
Var i, p, l: Integer;
begin
   p := 1; l := Length(s);
   For i := p to l do begin
      If (s[i]=#9) or (s[i]=' ') then Inc(p) else break
   end;
   For i := l downto p do begin
      If (s[i]=#9) or (s[i]=' ') then Dec(l) else break
   end;
   If p > l then Result := ''
   else If (p = 1) and (l=Length(s)) then Result := s
   else Result := Copy(s, p, l-p+1)
end;

function FilterNameOfFrom( F: String ) : String;
var  j : Integer;
     s : String;
begin
     s := F;
     j := Pos( '(', s );
     if j>0 then begin
        System.Delete( s, 1, j );
        j := Pos( ')', s );
        if j>0 then s:=copy(s,1,j-1);
     end else begin
        // From: "xxx" <yyy@zzz>
        j := Pos( '<', s );
        if j>=5 then s := Trim( copy(s,1,j-1) );
        if copy(s,1,1)='"' then System.Delete(s,1,1);
        if copy(s,length(s),1)='"' then System.Delete(s,length(s),1);
     end;

     s := Trim( s );
     if s='' then s:=F;
     Result := s;
end;

function FilterEmailOfFrom(From:String):String; //HRR
var p1,p2 : Integer;
    erg   : String;
    i     : Integer;
begin
  erg:=TrimWhSpace(From);
  repeat
    p1:=0; p2:=0;
    for i:=1 to length(erg) do begin
      if erg[i]='"' then begin
         p1:=p2; p2:=i;
      end;
    end;
    if p1<>0 then begin
      system.delete(erg,p1,p2-p1+1);
      system.insert('dummy',erg,p1);
    end;
  until p1=0;
  i:=pos('<',erg);
  if i>0 then begin
    //name <aaa@bbb>
    system.delete(erg,1,i);
    i:=pos('>',erg);
    if i>0 then erg:=copy(erg,1,i-1);
  end else begin
    i:=pos('(',erg);
    if i>0 then begin
      //aaa@bbb (name)
      erg:=copy(erg,1,i-1);
    end;
  end;
  result:=TrimWhSpace(erg);
end;



{ TFileStreamEx }

{$IFDEF VER130}
Procedure RaiseLastOSError;
begin
   RaiseLastWin32Error
end;
{$ENDIF}

function TFileStreamEx.Read(var Buffer; Count: Integer): Longint;
begin
   Result := inherited Read( Buffer, Count );
   if Count <> Result then begin
      if (Result=0) and (GetLastError<>NO_ERROR) then RaiseLastOSError;
   end;
end;

function TFileStreamEx.Seek(Offset: LongWord; Origin: Word): Longint;
begin
   Result := FileSeek(Handle, Offset, Origin);
   if (Result=-1) and (GetLastError<>NO_ERROR) then RaiseLastOSError;
end;

function TFileStreamEx.Write(const Buffer; Count: Integer): Longint;
begin
   Result := inherited Write( Buffer, Count );
   if Count <> Result then begin
      if (Result=0) and (GetLastError<>NO_ERROR) then RaiseLastOSError;
   end;
end;

function ValToPercent( l, g : LongInt ) : String; //AgtFind
var  Wert : Single;
begin
     if g=0 then g:=1;
     Wert := 100.0 * l / g;
     Result := FloatToStrF( Wert, ffFixed, 7, 2 );
end;


function GetMyBuildInfo: String;
var  vlen, dw: DWord;
     vstr, p : Pointer;
begin
   Result := '?.?';

   vlen := GetFileVersionInfoSize( PChar(Application.ExeName), dw );
   if vlen=0 then exit;

   GetMem( vstr, vlen + 1 );
   try
      if GetFileVersionInfo( PChar(Application.ExeName), dw, vlen, vstr ) then begin
         if VerQueryValue( vstr, '\', p, dw ) then begin
            Result :=  inttostr( hiword(PVSFixedFileInfo(p)^.dwFileVersionMS) ) + '.'
                     + inttostr( loword(PVSFixedFileInfo(p)^.dwFileVersionMS) ) + '.'
                     + inttostr( hiword(PVSFixedFileInfo(p)^.dwFileVersionLS) ) + '.'
                     + inttostr( loword(PVSFixedFileInfo(p)^.dwFileVersionLS) )
         end
      end
   finally
      FreeMem( vstr, vlen + 1 )
   end
end;

function GetMyVersionInfo (Const bBuildInParantheses: Boolean): String;
var  vlen, dw: DWord;
     vstr, p : Pointer;
begin
     Result := '?.?';

     vlen := GetFileVersionInfoSize( PChar(Application.ExeName), dw );
     if vlen=0 then exit;

     GetMem( vstr, vlen + 1 );
     try
        if GetFileVersionInfo( PChar(Application.ExeName), dw, vlen, vstr ) then begin
           if VerQueryValue( vstr, '\', p, dw ) then begin
              Result := 'Vr. '
                               + inttostr( hiword(PVSFixedFileInfo(p)^.dwProductVersionMS) ) + '.'
                               + inttostr( loword(PVSFixedFileInfo(p)^.dwProductVersionMS) ) + ' ';
              If bBuildInParantheses then Result := Result + '(';
              Result := Result + 'Build '
                               + inttostr( hiword(PVSFixedFileInfo(p)^.dwFileVersionMS) ) + '.'
                               + inttostr( loword(PVSFixedFileInfo(p)^.dwFileVersionMS) ) + '.'
                               + inttostr( hiword(PVSFixedFileInfo(p)^.dwFileVersionLS) ) + '.'
                               + inttostr( loword(PVSFixedFileInfo(p)^.dwFileVersionLS) );
              If bBuildInParantheses then Result := Result + ')'
           end;
        end
     finally
        FreeMem( vstr, vlen + 1 )
     end
end;

function GetMyStringFileInfo( StringName, DefResult: String ): String;
var  vlen, dw: DWORD;
     vstr, p : Pointer;
     tmp     : array[0..3] of Byte;
     LangID  : String;
begin
   Result := DefResult;
   vlen := GetFileVersionInfoSize( PChar(Application.ExeName), dw );
   if vlen=0 then exit;

   GetMem( vstr, vlen + 1 );
   if GetFileVersionInfo( PChar(Application.ExeName), dw, vlen, vstr ) then begin
      if VerQueryValue( vstr, '\VarFileInfo\Translation', p, dw ) then begin
         if dw>=4 then begin
            Move( p^, tmp[0], 4 );
            dw := tmp[2] or tmp[3] shl 8 or tmp[0] shl 16 or tmp[1] shl 24;
            LangID := inttohex( dw, 8 );
            if VerQueryValue( vstr, PChar('\StringFileInfo\'+LangID+'\'+StringName), p, dw ) then begin
               Result := String( PChar(p) )
            end
         end
      end
   end;
   FreeMem( vstr, vlen + 1 );
end;



end.
