unit uoTools;

interface

function MakeAbsolutPath(SourcePath, BasePath : String) : String;
function StrCenter(str : String; len : Integer) : String;
function StrLeft(str : String; len : Integer) : String;
function StrRight(str : String; len : Integer) : String;


type
 tFrom = class
  private
    N  : String;
    MA : string;
    procedure setFrom (s : string);
    function  getFrom : string;
  public
    property Name        : string read N       write N;
    property EMailAdress : string read MA      write MA;
    property Whole       : string read getFrom write setFrom;
  end;

implementation

uses sysutils, uEncoding;


//----------------------------------------------------------------- //tFrom
procedure tFrom.setFrom(s : String);
begin
  //s := DecodeHeaderValue( s[1], length(s) );
  //Umstellen zu Name|MailAdresse
  //Schreiben nach N|MA
  Name := '';
  EMailAdress := '';
  if s='' then exit;
  if s[length(s)]='>' then begin
    if pos('<',s)>1 then
      Name      := copy(s,1,pos('<',s)-2)
    else
      Name      := '';
    EMailAdress := copy(s,pos('<',s)+1,pos('>',s)-pos('<',s)-1);
  end else if s[length(s)]=')' then begin
    Name        := copy(s,pos('(',s)+1,pos(')',s)-pos('(',s)-1);
    EMailAdress := copy(s,1,pos('(',s)-1)
  end else if (pos('<',s)=0) and (pos('(',s)=0) and (pos('@',s)<>0) then begin
    Name        := '';
    EMailAdress := trim(s);
//    Log(lDetail, 'No Name is given!');
  end else
//    Log(lInfo,'Unknown From format!');
  name := trim(name);
  EMailAdress := trim(EMailAdress);
{  if name<>'' then
    if (pos('ISO-8859-1',uppercase(name))>0) or (pos('ISO-8859-2',uppercase(name))>0) then
      name := DecodeISO(name);}
  if (copy(name,1,1)='"') then
    if (name[length(name)]='"') then
      name := trim(copy(name,2,length(name)-2))
end;

function tFrom.getFrom;
begin
  Result := N+' <'+MA+'>';
end;


{ Static }

function StrCenter(str : String; len : Integer) : String;
var i, links, rechts : Integer;
begin
  Result := '';
  links  := (len-length(str)) div 2;
  rechts := (len-length(str)) - links;
  for i := 1 to links do Result := Result + ' ';
  Result := Result + str;
  for i := 1 to rechts do Result := Result + ' ';
end;

function StrLeft(str : String; len : Integer) : String;
var i, rechts : Integer;
begin
  rechts := (len-length(str));
  Result := str;
  for i := 1 to rechts do Result := Result + ' ';
end;

function StrRight(str : String; len : Integer) : String;
var i, links : Integer;
begin
  Result := '';
  links := (len-length(str));
  for i := 1 to links do Result := Result + ' ';
  Result := Result + str;
end;

function MakeAbsolutPath(SourcePath, BasePath : String) : String;
begin
  if pos(':\',SourcePath)=2 then
    Result := IncludeTrailingBackSlash(SourcePath)
  else
    Result := IncludeTrailingBackSlash(BasePath + SourcePath)
end;


end.
