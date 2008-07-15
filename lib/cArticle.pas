// ============================================================================
// Classes to handle a single message (e.g. find and get specific header-lines)
// Copyright (c) 1999, Juergen Haible.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
// ============================================================================

unit cArticle; // Class to handle a single message.

// ----------------------------------------------------------------------------
// Contains a class to handle a single message, which, for examples, allows
// direct access to specific header-lines.
// ----------------------------------------------------------------------------

interface

uses
  Classes;

type
  TArticle = class //old
  private
    fHeader: TStringList;
    fBody: String;
    function GetBody: String;
    function GetHeader(Const HdrName: String): String;
    function GetText: String;
    procedure SetBody(const Value: String);
    procedure SetHeader(Const HdrName: String; const Value: String);
    procedure SetText(const Value: String);
    function GetFullHeader: String;
    procedure SetFullHeader(const Value: String);
    Function FindHeaderIdx(Const HdrName: String; Var AktValue: String;
       Const StartIdx: Integer): Integer;
    Function FindHeader(Const HdrName: String; Var AktValue: String): Integer;
    function GetHeaderLine(Const Line: Integer): String;
    function GetHeaderWOCRLF(const HdrName: String): String;
  public
    function GetGMTDateDT: TDateTime;
    // Header
    Property FullHeader: String read GetFullHeader Write SetFullHeader;
    Function HeaderCount: Integer;
    Function HeaderAfterIdx(Const HdrName: String; Var Idx: Integer): String;
    Property Header[Const HdrName: String]: String read GetHeader Write SetHeader; default;
    Property HeaderWOCRLF[Const HdrName: String]: String read GetHeaderWOCRLF;
    Property Headerline[Const Line: Integer]: String read GetHeaderline;
    Procedure AddHeader (Const HdrName, Value: String); overload;
    Procedure AddHeader (Const Hdr: String); overload;
    Procedure AddHeaderFirst (Const HdrName, Value: String);
    procedure AddHeaderAtPos(const HdrName, Value: String; const p: Integer);
    Procedure AddHeaderAfterSpecialHeaders (Const HdrName, Value: String);
    Function DeleteHeader (Const HdrName: String): boolean;
    Function RenameHeader (Const OldHdrName, NewHdrName: String): boolean;
    Function QuotedHeader (Const QuoteWith: String): String;
    // Body
    Property FullBody: String read GetBody Write SetBody;
    // Alltogether
    Property Text: String read GetText Write SetText;
    Function QuotedText (Const QuoteWith: String): String;
    Procedure LoadFromFile(Const FileName: String);
    // Special functions
//    function GetReceivedDT: TDateTime;
//    function GetOurXHeader( Const XNam: String ) : String;
    procedure MimeDecodeHeaders;
    Function AsExportFormat: String;
    // Default
    constructor Create; overload;
    constructor Create (Const AktHeader, AktBody: String); overload;
    destructor Destroy; override;
  end;

function ParseMail( Const h: String ) : String;

implementation

uses SysUtils, uTools, uEncoding, uDateTime;

function ParseMail( Const h: String ) : String;
var  s: String; pAt, p : Byte;
begin
   Result := '???@???';
   if h='' then exit;
   s := h;
   pAt := Pos( '@', s );
   if pAt>0 then begin
      repeat
         p := Pos( ' ', s );
         if p>0 then begin
            if p<pAt
               then s:=Copy(s,p+1,Length(s)-p)
               else s:=Copy(s,1,p-1);
         end;
      until p=0;
   end;

   if s>'' then Result:=s;
end;

Function CompleteHeaderName(Const s: String): String;
begin
   Result := Trim(s);
   If Result > '' then If Result[Length(Result)]<>':' then Result := Result + ':';
   Result := Result + ' '
end;

{ TArticle }

constructor TArticle.Create;
begin
   inherited Create;
   fHeader := TStringList.Create;
end;

constructor TArticle.Create(const AktHeader, AktBody: String);
begin
   Create;
   FullHeader := AktHeader;
   FullBody := AktBody
end;

destructor TArticle.Destroy;
begin
   fHeader.Free;
   inherited
end;

function TArticle.GetText: String;
begin
   Result := FullHeader;
   If FullBody > '' then Result := Result + #13#10 + FullBody
end;

procedure TArticle.SetText(const Value: String);
Var p: Integer;
begin
   p := Pos(#13#10#13#10, Value);
   If p > 0 then begin
      FullHeader := Copy(Value, 1, p-1);
      FullBody := Copy(Value, p+4, Length(Value))
   end else begin
      FullHeader := Value;
      FullBody := ''
   end
end;

function TArticle.GetBody: String;
begin
   Result := FBody
end;

procedure TArticle.SetBody(const Value: String);
begin
   fBody := Value
end;

function TArticle.GetFullHeader: String;
begin
   Result := fHeader.text
end;

procedure TArticle.SetFullHeader(const Value: String);
Var i: Integer; tl, tmax: Integer; Temp: String; c: Char; bEOL: Boolean;

  Procedure AddChar(Const c: Char);
  begin
     If tl >= tmax then begin
        tmax := tmax + 2048;
        SetLength(Temp, tMax)
     end;
     Inc(tl); Temp[tl] := c
  end;

  Procedure AddLine;
  begin
     If tl > 0 then begin
        fHeader.Add (Copy(Temp, 1, tl));
        tl := 0
     end
  end;

begin
   fHeader.Clear;
   bEOL := false;
   tmax := 2048;
   tl := 0;
   SetLength(Temp, tMax);
   For i := 1 to Length(Value) do begin
      c := Value[i];
      Case c of
         #13, #10: bEOL := true;
         ' ', ^I:
            begin
               If bEOL then begin
                  AddChar(#13);
                  AddChar(#10);
                  bEOL := false
               end;
               AddChar(c)
            end;
         else begin
            If bEOL then begin AddLine; bEOL := false end;
            AddChar(c)
         end
      end;
   end; // For
   AddLine
end;

procedure TArticle.AddHeaderAtPos(Const HdrName, Value: String; Const p: Integer);
Var s: String;
begin
   s := CompleteHeaderName(HdrName) + Value;
   If s = '' then Exit;
   If p < fHeader.Count then fHeader.Insert(p, s)
                        else fHeader.Add(s)
end;

procedure TArticle.AddHeader(const HdrName, Value: String);
Var s: String;
begin
   s := CompleteHeaderName(HdrName) + Value;
   AddHeader (s)
end;

Procedure TArticle.AddHeader (Const Hdr: String);
begin
   fHeader.Add (Hdr)
end;

procedure TArticle.AddHeaderFirst(const HdrName, Value: String);
begin
   AddHeaderAtPos(HdrName, Value, 0)
end;

procedure TArticle.AddHeaderAfterSpecialHeaders(const HdrName,
  Value: String);
Var i: Integer;
begin
   i := 0;
   While (i < fHeader.Count) and (Copy(fHeader[i], 1, 1)='!') do Inc(i);
   AddHeaderAtPos(HdrName, Value, i)
end;

Function TArticle.DeleteHeader(const HdrName: String): boolean;
Var AktValue: String; i: Integer;
begin
  i := FindHeader(HdrName, AktValue);
  Result := i >= 0;
  If Result then fHeader.Delete(i)
end;


function TArticle.GetHeader(Const HdrName: String): String;
Var AktValue: String;
begin
  FindHeader(HdrName, AktValue);
  //GoldFind 3: Wir dekodieren automatisch
  AktValue := DecodeHeaderValue(AktValue[1], length(AktValue));
  Result := AktValue
end;

procedure TArticle.SetHeader(Const HdrName: String; const Value: String);
Var AktValue: String; i: Integer;
begin
  i := FindHeader(HdrName, AktValue);
  If i >= 0 then begin
     If AktValue <> Value then fHeader[i] := CompleteHeaderName(HdrName)+Value
  end else begin
     AddHeader (HdrName, Value)
  end
end;

function TArticle.RenameHeader(const OldHdrName,
  NewHdrName: String): boolean;
Var i: Integer; Value: String;
begin
   DeleteHeader (NewHdrName);
   i := FindHeader ( OldHdrName, Value );
   Result := i >= 0;
   If Result then fHeader[i] := CompleteHeaderName(NewHdrName) + Value
end;

function TArticle.HeaderCount: Integer;
begin
   Result := fHeader.Count
end;

function TArticle.HeaderAfterIdx(const HdrName: String;
  var Idx: Integer): String;
Var AktValue: String;
begin
  Idx := FindHeaderIdx (HdrName, AktValue, Idx);
  Result := AktValue
end;

function TArticle.QuotedHeader(const QuoteWith: String): String;
Var i: Integer;
begin
   With TStringList.Create do try
      Text := FullHeader;
      Result := '';
      For i := 0 to Count-1 do
        Result := Result + QuoteWith + Strings[i] + #13#10 //JW QuotedHeader 13.05.02
   finally
      free
   end
end;

function TArticle.QuotedText(const QuoteWith: String): String;
Var i: Integer;
begin
   With TStringList.Create do try
      Text := GetText;
      Result := '';
      For i := 0 to Count-1 do
        Result := Result + QuoteWith + Strings[i] + #13#10 //JW QuotedHeader 13.05.02
   finally
      free
   end
end;

procedure TArticle.LoadFromFile(const FileName: String);
Var Buf: String;
begin
   With TFileStream.Create ( FileName, fmOpenRead + fmShareDenyNone ) do try
      SetLength(Buf, Size);
      read (Buf[1], Size)
   finally
      free
   end;
   Text := Buf
end;

// ----------------------------------------------------------------
{
function TArticle.GetReceivedDT: TDateTime;
var  s: String;
begin
   Result := 0;
   s := GetOurXHeader( 'Received' );
   if s > '' then Result := TimeStampToDateTime(s);
   if Result = 0 then Result := GetGMTDateDT
end;
}
procedure TArticle.MimeDecodeHeaders;
Var i : Integer; s : String;
begin
   for i := 0 to fHeader.Count-1 do begin
      s := fHeader[i];
      If s > '' then fHeader[i] := DecodeHeadervalue( s[1], length(s) );
   end;
end;

Function TArticle.AsExportFormat: String;
var  DT        : TDateTime;
     hPosFrom, hPosCrlf: Integer; Line, TextBuf: String;
begin
   // introduction line ("From ???@??? Fri Sep 8 13:21:43 1995")
   DT := GetGMTDateDT;
   Result := 'From ' + ParseMail( Header['From:'] ) + ' '
              + copy( RFC_DAY_NAMES, DayOfWeek(DT)*3-2, 3 ) + ' '
              + copy( RFC_MONTH_NAMES, strtoint(FormatDateTime('mm',DT))*3-2, 3 ) + ' '
              + FormatDateTime( 'd hh:nn:ss yyyy', DT ) + #13#10;
   // article-text
   TextBuf := Text;
   repeat
      hPosFrom := Pos( #13#10 + 'From ', TextBuf );
      if hPosFrom > 0 then begin
         Result := Result + copy( TextBuf, 1, hPosFrom + 1);
         system.delete( TextBuf, 1, hPosFrom + 1);
         hPosCrlf := Pos( #13#10, TextBuf );
         if hPosCrlf > 0 then begin
           Line := copy(TextBuf, 1, hPosCrlf + 1);
           system.delete( TextBuf, 1, hPosCrlf + 1)
         end else begin
           Line := TextBuf;
           TextBuf := ''
         end;
         // quote lines with "From ...@..."
         if (copy(Line,1,5)='From ') and (Pos('@',Line)>0) then Line:='>'+Line;
         Result := Result + Line
      end
   until hPosFrom = 0;
   Result := Result + TextBuf
end;

{
function TArticle.GetOurXHeader(Const XNam: String): String;
Var h: String; i: Integer;
begin
   Result := '';
   h := Header[OUR_X_HEADER];
   if h='' then exit;
   i := Pos( LowerCase(XNam), LowerCase(h) );
   if i=0 then exit;
   System.Delete( h, 1, i+length(XNam) );
   i := Pos(' ',h);
   if i>0 then h:=copy(h,1,i-1);
   Result := h
end;
}

function TArticle.FindHeader(const HdrName: String; Var AktValue: String): Integer;
begin
   Result := FindHeaderIdx (HdrName, AktValue, -1)
end;

function TArticle.FindHeaderIdx(const HdrName: String; Var AktValue: String;
  const StartIdx: Integer): Integer;
Var v: String; vl, i: Integer;
begin
   v := Trim(LowerCase(CompleteHeaderName(HdrName)));
   vl := Length(v);
   Result := -1;
   AktValue := '';
   For i := StartIdx+1 to fHeader.Count-1 do begin
      If LowerCase(Copy(fHeader[i], 1, vl))=v then begin
         Result := i;
         AktValue := Copy(fHeader[i], vl+1, Length(fHeader[i])-vl);
         If AktValue > '' then begin
            If AktValue[1] IN [' ', #9] then Delete(Aktvalue, 1, 1);
         end;
         break
      end
   end
end;

function TArticle.GetGMTDateDT: TDateTime;
var s: String;
begin
   s := TrimWhSpace( Header['Date:']);
   if s = ''
      then Result := EncodeDate( 1980, 1, 1 )
      else Result := RfcDateTimeToDateTimeGMT( s )
end;

function TArticle.GetHeaderLine(Const Line: Integer): String;
begin
  Result := fHeader[Line];
end;

function TArticle.GetHeaderWOCRLF(const HdrName: String): String;
Var AktValue: String;
    i       : Integer;
begin
  FindHeader(HdrName, AktValue);
  for i := length(AktValue) downto 1 do
    if AktValue[i] in [#13, #10] then
      system.delete(AktValue,i,1);
  Result := AktValue
end;

end.

