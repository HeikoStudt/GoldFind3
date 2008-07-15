unit uSearchRegexp;

interface

uses uSearchBase, cArticle, uPERLRE;

type
  tRegExpSearch = class(tSearchBase) //RegExp-Search (very wide used and many possibilities)
    public
      function find(Article : tArticle; const SearchPattern : String) : Boolean; overload; override;
      function FindPosInArt(Article : tArticle; const SearchPattern : String) : toSearchResult; overload; override;
  end;

implementation

function tRegExpSearch.FindPosInArt(Article : tArticle; const SearchPattern: String): toSearchResult;
var
  Hdr, s: String;
  HdrPosIdx, OffSetIdx: Integer;
  OffSet, Anzahl, i: Integer;
  fPERLOpt : Integer;
begin
   fPerlOpt := PCRE_MULTILINE;
   if not (soCaseSensitive in fToSearch) then
      fPerlOpt := fPerlOpt OR PCRE_CASELESS;

   Anzahl    := 0;
   OffSet    := 0;
   OffSetIdx := 0;
   HdrPosIdx := 0;
   SetLength(Result, Anzahl);

   if length(SearchPattern)=0 then exit; {kein Suchtext}

   if SearchPattern[1]='@' then begin
     while HdrPosIdx>-1 do begin
       Hdr := Article.HeaderAfterIdx( copy(SearchPattern, 2, pos(':', SearchPattern)-1), HdrPosIdx);
       for i := OffSetIdx to HdrPosIdx-1 do
         OffSet := OffSet + length(Article.Headerline[i]);
       OffSetIdx := HdrPosIdx;

       while regex.MatchRSO(copy(SearchPattern, pos(':', SearchPattern)+1, length(SearchPattern)), Hdr, fPerlOpt ) do begin
         inc(Anzahl);
         SetLength(Result, Anzahl);
         Result[Anzahl-1].BeginPos := OffSet + regex.SubExp[0].StartP - 3;
         Result[Anzahl-1].EndPos   := Result[Anzahl-1].BeginPos + regex.SubExp[0].len;
         if length(Hdr)>regex.SubExp[0].StartP then
           Hdr[regex.SubExp[0].StartP] := #1;
       end;
     end;
   end else begin
     s := getTextpartFromArticle(Article, fToSearch);
     if (s='') then exit;

     while regex.MatchRSO( SearchPattern, s, fPerlOpt ) do begin
       inc(Anzahl);
       SetLength(Result, Anzahl);
       Result[Anzahl-1].BeginPos := regex.SubExp[0].StartP -3;
       Result[Anzahl-1].EndPos   := Result[Anzahl-1].BeginPos + regex.SubExp[0].len;
       if length(s)>regex.SubExp[0].StartP then
         s[regex.SubExp[0].StartP] := #1
       else break;
     end;
   end;
end;

function tRegExpSearch.find(Article : tArticle; const SearchPattern: String): Boolean;
var
  Hdr, s: String;
  HdrPosIdx : Integer;
  fPERLOpt : Integer;
begin
  fPerlOpt := PCRE_MULTILINE;
  if not (soCaseSensitive in fToSearch) then
     fPerlOpt := fPerlOpt OR PCRE_CASELESS;

  Result := False; {Default: Nicht gefunden}

  if length(SearchPattern)=0 then exit; //kein Suchtext
  if SearchPattern[1]='@' then begin
    while (HdrPosIdx>-1) and not (Result) do begin
      Hdr := Article.HeaderAfterIdx( copy(SearchPattern, 2, pos(':', SearchPattern)-1), HdrPosIdx);
      Result := regex.MatchRSO(copy(SearchPattern, pos(':', SearchPattern)+1, length(SearchPattern)), Hdr, fPerlOpt )
    end
  end else begin
    s := getTextpartFromArticle(Article, fToSearch);
    if (s='') then exit;
    Result := regex.MatchRSO(SearchPattern, s, fPerlOpt )
  end;
end;

end.
