unit uSearchBase;

interface

uses uDBBase, cArticle;

type
  tSearchBaseClass = class of tSearchBase;

  tVerknuepfung = (hOR, hAND, hNOT);
  tSearchOption = (soHeader, soBody, soCaseSensitive, soUseDate); //soSignature
  tSearchOptions = set of tSearchOption;
  tSearchList = record
     SBList : array of record
        SB     : tSearchBaseClass;
        Patter : String;
        How    : tVerknuepfung;
     end;
//     GlobalOptions : toPatterOptions;
     BeginDate, EndDate : tDateTime; //ToDo: Falsch interpretiert? (+1 Tag)
     ToSearch : tSearchOptions;
     CompletePattern : String;
  end;

  toSearchResult = array of record
     BeginPos, EndPos : Integer; //Position
  end;

  tSearchBase = class //Base Search (Basis-Class)
    private
      function find(DB : tDBBase; ArtNum : Integer; const SearchPattern : String) : Boolean; overload;
    protected
      fBeginDate, fEndDate : tDateTime; //ToDo: Falsch interpretiert? (+1 Tag)
      fNoDate : Boolean;
      fToSearch : tSearchOptions;
      function getTextpartFromArticle(art : tArticle; so : tSearchOptions) : String;
    public
      function find(Article : tArticle; const SearchPattern : String) : Boolean; overload; virtual; abstract;
      function FindPosInArt(Article : tArticle; const SearchPattern : String) : toSearchResult; overload; virtual; abstract;

      function find(const Text : String; WithHeader : Boolean; const SearchPattern : String) : Boolean; overload;
      function FindPosInArt(const Text : String; WithHeader : Boolean; const SearchPattern : String) : toSearchResult; overload;
      //TODO: Progressbar in der Suche einbinden
      function find(DB : tDBBase; BeginArtNum, EndArtNum : Integer; const SearchPattern : String) : toArtList; overload; virtual;

      Constructor Create(vBeginDate, vEndDate : tDateTime;
                                     vToSearch : tSearchOptions);
  end;

implementation

uses Math;

{ tSearchBase }

function tSearchBase.find(DB: tDBBase; ArtNum: Integer;
  const SearchPattern: String): Boolean;
var
  article : tArticle;
  temDT   : tDateTime;
  s       : string;
  i       : integer;
begin
  article := tArticle.create;
  try
    db.GetArticle(ArtNum, s, i);
    article.Text := s;
    temDT := article.GetGMTDateDT;
    Result := fNoDate or (temDT>=fBeginDate) and (temDT<=fEndDate);
    if Result then begin
      Result := Find(article, SearchPattern);
    end;
  finally
    article.free
  end;
end;


constructor tSearchBase.Create(vBeginDate, vEndDate : tDateTime;
                               vToSearch : tSearchOptions);
begin
  inherited Create;
  fBeginDate := vBeginDate;
  fEndDate   := vEndDate;
  fToSearch  := vToSearch;
  fNoDate    := not (soUseDate in vToSearch);
end;

function tSearchBase.find(DB: tDBBase; BeginArtNum, EndArtNum: Integer;
  const SearchPattern: String): toArtList;
var
  Anzahl, i : integer;
begin
  if (BeginArtNum>EndArtNum) then begin
    SetLength(Result, 0);
    exit;
  end;
  SetLength(Result, EndArtNum-BeginArtNum);
  Anzahl := 0;
  BeginArtNum := Max(BeginArtNum, DB.Min);
  EndArtNum   := Min(EndArtNum, DB.Max);
  for i := BeginArtNum to EndArtNum do begin
    if find(db,i,SearchPattern) then begin
      inc(Anzahl);
      Result[Anzahl-1] := i
    end
  end;
  SetLength(Result, Anzahl);
end;

function tSearchBase.find(const Text: String; WithHeader: Boolean;
  const SearchPattern: String): Boolean;
var
  Art : tArticle;
begin
  Result := false;
  try
    if not WithHeader then
      Art := tArticle.create('', Text)
    else begin
      Art := tArticle.create;
      Art.Text := Text;
    end;
    try
      Result := find(Art,SearchPattern);
    finally Art.free end;
  except end;
end;

function tSearchBase.FindPosInArt(const Text: String; WithHeader: Boolean;
  const SearchPattern: String): toSearchResult;
var
  Art : tArticle;
begin
  SetLength(Result, 0);
  try
    if not WithHeader then
      Art := tArticle.create('', Text)
    else begin
      Art := tArticle.create;
      Art.Text := Text;
    end;
    try
      Result := findposinart(Art,SearchPattern);
    finally Art.free end;
  except end;
end;

function tSearchBase.getTextpartFromArticle(art: tArticle;
    so: tSearchOptions): String;
begin
  if (soHeader in so) then begin
    if (soBody in so) then begin
      Result := art.Text
    end else
      Result := art.FullHeader;
  end else if (soBody in so) then begin
      Result := art.FullBody
  end else Result := '';
end;

end.
