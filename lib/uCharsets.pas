unit uCharsets; //By Micha³ Bartoszkiewicz

interface

uses Windows, Classes;

function GetCharsetCodePage(CharsetName: string): Integer;
function GetCodePageCharset(CodePage: Integer): string;
function GetCodePageFullName(CodePage: Integer): string;
function GetCodePageFamily(CodePage: Integer): Integer;

procedure EnumCharsets(SList: TStrings);
procedure EnumCodePages(SList: TStrings);

function GetLocaleCodePage(Locale: LCID): Integer;
function GetKeyboardLocale: LCID; 

function CodePageToUnicode(const Text: AnsiString; CodePage: Integer): WideString;
function UnicodeToCodePage(const Text: WideString; CodePage: Integer): AnsiString;
function CodePageToCodePage(const Text: AnsiString; SourceCP, DestCP: Integer): AnsiString;
function KeyToUnicode(Key: AnsiChar): WideChar;

const
	cpUTF7 = 65000;
	cpUTF8 = 65001;

const
	aTab: AnsiChar = #$09;
	aCR: AnsiChar  = #$0D;
	aLF: AnsiChar  = #$0A;
	aSpace: AnsiChar = #$20;

	aCRLF: AnsiString = #$0D + #$0A;

	wTab: WideChar = #$0009;
	wCR: WideChar  = #$000D;
	wLF: WideChar  = #$000A;
	wSpace: WideChar = #$0020;

	wCRLF: WideString = #$000D + #$000A;

function HeaderToUnicode(Header: string): WideString; //GoldFind

implementation

uses Registry, SysUtils, uEncoding;

function HeaderToUnicode(Header: string): WideString;
var
  CP: Integer;
  Charset: string;
begin
  Header := DecodeHeadervalue(Header[1], Length(Header), Charset);
  try
    if CharSet<>'' then
      CP := GetCharsetCodePage(Charset)
    else
      CP := CP_ACP;
    if (CP = -1) then
      CP := CP_ACP;
    Result := CodePageToUnicode(Header, CP);
  except
  end;
end; //2045 //2046


const
	MIMEKey = '\MIME\Database';

function GetCharsetCodePage(CharsetName: string): Integer;
var
	Reg: TRegistry;
begin
	Reg := TRegistry.Create;
	try
		try
			Reg.RootKey := HKEY_CLASSES_ROOT;
			Win32Check(Reg.OpenKey(MIMEKey+'\Charset\'+CharsetName, False));
			while Reg.ValueExists('AliasForCharset') do begin
				CharsetName := Reg.ReadString('AliasForCharset');
				Win32Check(Reg.OpenKey(MIMEKey+'\Charset\'+CharsetName, False));
			end;
			Result := Reg.ReadInteger('InternetEncoding');
		finally
			Reg.Free;
		end;
	except
		Result := -1;
	end;
end;

function GetCodePageCharset(CodePage: Integer): string;
var
	CSList: TStringList;
	Reg: TRegistry;
	i: Integer;
begin
	Reg := TRegistry.Create;
	try
		try
			CSList := TStringList.Create;
			try
				Reg.RootKey := HKEY_CLASSES_ROOT;
				Win32Check(Reg.OpenKey(MIMEKey+'\Charset\', False));
				Reg.GetKeyNames(CSList);
				for i := 0 to CSList.Count-1 do begin
					Reg.OpenKey(CSList[i], False);
					if Reg.ValueExists('InternetEncoding') then begin
						if Reg.ReadInteger('InternetEncoding')=CodePage then begin
							Result := CSList[i];
							Exit;
						end;
					end;
					Reg.OpenKey(MIMEKey+'\Charset\', False);
				end;
			finally
				CSList.Free;
			end;
		finally
			Reg.Free;
		end;
	except
		Result := '';
	end;
end;

function GetCodePageFullName(CodePage: Integer): string;
var
	Reg: TRegistry;
begin
	Reg := TRegistry.Create;
	try
		try
			Reg.RootKey := HKEY_CLASSES_ROOT;
			Win32Check(Reg.OpenKey(MIMEKey+'\Codepage\'+IntToStr(CodePage), False));
			Result := Reg.ReadString('Description');
		finally
			Reg.Free;
		end;
	except
		Result := '';
	end;
end;

function GetCodePageFamily(CodePage: Integer): Integer;
var
	Reg: TRegistry;
begin
	Reg := TRegistry.Create;
	try
		try
			Reg.RootKey := HKEY_CLASSES_ROOT;
			Win32Check(Reg.OpenKey(MIMEKey+'\Codepage\'+IntToStr(CodePage), False));
			if Reg.ValueExists('Family') then
				Result := Reg.ReadInteger('Family')
			else
				Result := CodePage;
		finally
			Reg.Free;
		end;
	except
		Result := -1;
	end;
end;

procedure EnumCharsets(SList: TStrings);
var
	Reg: TRegistry;
	i: Integer;
begin
	Reg := TRegistry.Create;
	try
		Reg.RootKey := HKEY_CLASSES_ROOT;
		Win32Check(Reg.OpenKey(MIMEKey+'\Charset\', False));
		Reg.GetKeyNames(SList);
		i := 0;
		while i<SList.Count do begin
			Reg.OpenKey(SList[i], False);
			if Reg.ValueExists('AliasForCharset') then
				SList.Delete(i)
			else
				Inc(i);
			Reg.OpenKey(MIMEKey+'\Charset\', False);
		end;
	finally
		Reg.Free;
	end;
end;

procedure EnumCodePages(SList: TStrings);
var
	Reg: TRegistry;
begin
	Reg := TRegistry.Create;
	try
		Reg.RootKey := HKEY_CLASSES_ROOT;
		Win32Check(Reg.OpenKey(MIMEKey+'\Codepage\', False));
		Reg.GetKeyNames(SList);
	finally
		Reg.Free;
	end;
end;

(*********)

function GetLocaleCodePage(Locale: LCID): Integer;
begin
	Result := StrToIntDef(GetLocaleStr(Locale and $FFFF, locale_iDefaultANSICodePage, ''), -1);
end;

function GetKeyboardLocale: LCID;
begin
	Result := GetKeyboardLayout(0);
end;

(*********)

function CodePageToUnicode(const Text: AnsiString; CodePage: Integer): WideString;
var
	Len: Integer;
begin
	if Text<>'' then begin
		Len := MultiByteToWideChar(CodePage, 0, PAnsiChar(Text), Length(Text), nil, 0);
		Win32Check(Len<>0);
		SetLength(Result, Len);
		MultiByteToWideChar(CodePage, 0, PAnsiChar(Text), Length(Text), PWideChar(Result), Len);
		SetLength(Result, Len);
	end else
		Result := '';
end;

function UnicodeToCodePage(const Text: WideString; CodePage: Integer): AnsiString;
var
	Len: Integer;
begin
	if Text<>'' then begin
		Len := WideCharToMultiByte(CodePage, 0, PWideChar(Text), Length(Text), nil, 0, nil, nil);
		Win32Check(Len<>0);
		SetLength(Result, Len);
		WideCharToMultiByte(CodePage, 0, PWideChar(Text), Length(Text), PAnsiChar(Result), Len, nil, nil);
		SetLength(Result, Len);
	end else
		Result := '';
end;

function CodePageToCodePage(const Text: AnsiString; SourceCP, DestCP: Integer): AnsiString;
var
	Temp: WideString;
begin
	Temp := CodePageToUnicode(Text, SourceCP);
	Result := UnicodeToCodePage(Temp, DestCP);
end;

function KeyToUnicode(Key: AnsiChar): WideChar;
begin
	Win32Check(MultiByteToWideChar(GetLocaleCodePage(GetKeyboardLocale), mb_UseGlyphChars, @Key, 1, @Result, 1)<>0);
end;

end.
