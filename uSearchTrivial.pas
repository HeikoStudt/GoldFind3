unit uSearchTrivial;

interface

uses uSearchBase, cArticle;

type
  ShiftTab_Type = array[#0..#255] of Byte;
  tTrivialSearch = class(tSearchBase)
    public
      function find(Article : tArticle; const SearchPattern : String) : Boolean; overload; override;
      function FindPosInArt(Article : tArticle; const SearchPattern : String) : toSearchResult; overload; override;
  end;

implementation

uses SysUtils;

function LoCase( c : Char ) : Char;
begin
     if (c>='A') and (c<='Z') then c:=chr( ord(c) + $20 );
     LoCase := c;
end;

function StrIQuickSearch( Base: PChar; Find: String ) : PChar;
var  tstr : PChar;
     i : Integer;
     flen, tlen : Integer;
     shft: array[#0..#255] of Byte;
     limit, flen1: Integer;
     pFind : PChar;
begin
     StrIQuickSearch := nil; {Default: Nicht gefunden}

     flen := Length(Find);
     if flen=0 then exit; {kein Suchtext}

     tlen := strlen(Base);
     if flen>tlen then exit; {kein Text}

     tstr := Base;
     tlen := strlen(Base);

     limit := tlen-flen;
     flen1 := flen - 1;

     {Shift-Tabelle für Quicksearch erstellen}
     { Mismatch-Default = Verschiebung um (Suchlänge+1) }
     for i:=0 to 255 do shft[chr(i)] := flen+1;

     {Suchtext vorbereiten}
     GetMem( pFind, flen+1 );
     Find := UpperCase(Find);
     StrPCopy( pFind, Find );

     { Verschiebung für Zeichen im Suchstring }
     for i:=0 to flen-1 do begin
        shft[ LoCase(pFind[i]) ] := flen - i;
        shft[ UpCase(pFind[i]) ] := flen - i;
     end;

     {Quicksearch}
     repeat
        i := flen1;
        while Upcase((tstr+i)^)=(pFind+i)^ do begin
           if i=0 then begin
              StrIQuickSearch:=tstr;
              FreeMem( pFind, flen+1 );
              exit;
           end;
           dec(i);
        end;
        tstr := (tstr + shft[ (tstr+flen)^ ]);
     until (tstr-Base)>=limit;
     FreeMem( pFind, flen+1 );
end;

function tTrivialSearch.find(Article : tArticle; const SearchPattern: String): Boolean;
var
  BaseStr, SP : String;
  HdrPosIdx : Integer;
  SrchCont, SrchHdr : String;
begin
  Result := False; //Default: Nicht gefunden
  if length(SearchPattern) = 0 then exit;

  if soCaseSensitive in fToSearch then
    SP := SearchPattern
  else
    SP := UpperCase(SearchPattern);

  if SP[1]='@' then begin
    SrchHdr  := copy(SP, 2, pos(':', SP)-1);
    SrchCont := copy(SP, pos(':', SP)+1, length(SP));
    HdrPosIdx := 0;
    while (HdrPosIdx>-1) and not (Result) do
      if soCaseSensitive in fToSearch then
        Result := pos(SrchCont, Article.HeaderAfterIdx( SrchHdr, HdrPosIdx))>0
      else
        Result := pos(SrchCont, UpperCase(Article.HeaderAfterIdx( SrchHdr, HdrPosIdx)))>0;

  end else begin
    if soCaseSensitive in fToSearch then
      BaseStr := getTextpartFromArticle(Article, fToSearch)
    else
      BaseStr := uppercase(getTextpartFromArticle(Article, fToSearch));
    if (BaseStr='') then exit;

    Result := StrIQuickSearch( PChar(BaseStr), SP ) <> nil;
  end;
end;

function tTrivialSearch.FindPosInArt(Article : tArticle; const SearchPattern: String): toSearchResult;
var
  s : String;
  i : integer;
  Anzahl : integer;
  SP : String;
begin
  SetLength(result,0);
  Anzahl := 0;

  if soCaseSensitive in fToSearch then begin
    SP := SearchPattern;
    s := getTextpartFromArticle(Article, fToSearch);
  end else begin
    SP := UpperCase(SearchPattern);;
    s := UpperCase(getTextpartFromArticle(Article, fToSearch));
  end;
  if (s='') then exit;

  i := pos(SP,s);
  while i<>0 do begin
    inc(Anzahl);
    SetLength(Result, Anzahl);
    Result[Anzahl-1].BeginPos := i-3;
    Result[Anzahl-1].EndPos := i + length(SP)-3;
    s[i] := #1;
    i := pos(SP,s);
  end;
end;

(*
function TForm1.StrIFindQ( Base: PChar; fp: Byte ) : PChar;
var  tstr : PChar;
     i : Integer;
     flen, tlen : Integer;
     shft: ShiftTab_Type;
     limit, flen1: Integer;
     fstr : PChar;
begin
     StrIFindQ := nil; {Default: Nicht gefunden}

     flen := FindPart[fp].Len;
     if flen=0 then exit; {kein Suchtext}

     tlen := strlen(Base);
     if flen>tlen then exit; {kein Text}

     fstr := FindPart[fp].Txt;
     shft := FindPart[fp].Shift;

     tstr := Base;
     tlen := strlen(Base);

     limit := tlen-flen;
     flen1 := flen - 1;

     {Quicksearch}
     repeat
        i := flen1;
        while Upcase((tstr+i)^)=(fstr+i)^ do begin
           if i=0 then begin StrIFindQ:=tstr; exit; end;
           dec(i);
        end;
        tstr := (tstr + shft[ (tstr+flen)^ ]);
     until (tstr-Base)>=limit;
end;

function StrIFindHdr( Base, Find, HdrNam: PChar ) : PChar;
var  p, bl, fl : Integer;
     HdrBase, HdrEnd: PChar;
begin
     StrIFindHdr := nil; {Default: Nicht gefunden}

     fl := strlen( Find );
     if fl=0 then exit;  {kein Suchtext}

     {Headerbeginn suchen}
     HdrBase := StrIQuickSearch( Base, #13#10 + HdrNam + ' ' );
     if HdrBase=nil then begin
        HdrBase := StrIQuickSearch( Base, #13#3 + HdrNam + ' ' ); // teilweise auch #13#3!
        if HdrBase=nil then exit;
     end;

     HdrBase := (HdrBase+StrLen(HdrNam)+3);

     {Headerende/-länge ermitteln}
     HdrEnd := StrScan(HdrBase,#13);
     if HdrEnd=nil then exit;
     bl := (HdrEnd-HdrBase);
     if bl<fl then exit; {kein genügend langer Basistext}

     for p:=0 to bl-fl do begin
        if StrLIComp( HdrBase, Find, fl )=0 then begin
           StrIFindHdr := HdrBase; {Gefunden}
           exit;
        end;
        inc( HdrBase );
     end;
end;
*)

end.
