// ============================================================================
// Wrapper-class and additional tools for PCRE-functions.
// Copyright (c) 1999, Juergen Haible. All Rights Reserved.
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

unit cPCRE; // Wrapper-class and additional tools for PCRE-functions.

{$ALIGN ON}           // suggested
{$BOOLEVAL OFF}       // mandatory
{$LONGSTRINGS ON}     // mandatory
{$IOCHECKS ON}        // mandatory
{$EXTENDEDSYNTAX ON}  // mandatory
{$WRITEABLECONST OFF} // suggested
{$DEBUGINFO ON}       // suggested
{$LOCALSYMBOLS ON}    // suggested
{$REFERENCEINFO ON}   // suggested

{$DEFINE NEW_FEATURE_NAMED_SUBSTRING}

// ----------------------------------------------------------------------------
// Contains a wrapper-class for Philip Hazel's PCRE (see uPCRE.pas for details)
// and some functions related with regular expressions.
// ----------------------------------------------------------------------------
// +++  Credits  +++  :-)  +++  Credits  +++  :-)  +++  Credits  +++  :-) +++
// Although the wrapper-class uses a slightly different approach, parts of it
// are at least inspired by the concepts used in "uperlre". "uperlre" is a
// wrapper-class for PCRE written by Luu Tran (<xnews@newsguy.com>), author
// of "XNews"-newsreader (see http://xnews.newsguy.com/ for more details).
// ----------------------------------------------------------------------------

interface

uses SysUtils, Classes, uPCRE;

const
   // Options
   PCRE_CASELESS       = $0001;
   PCRE_MULTILINE      = $0002;
   PCRE_DOTALL         = $0004;
   PCRE_EXTENDED       = $0008;
   PCRE_ANCHORED       = $0010;
   PCRE_DOLLAR_ENDONLY = $0020;
   PCRE_EXTRA          = $0040;
   PCRE_NOTBOL         = $0080;
   PCRE_NOTEOL         = $0100;
   PCRE_UNGREEDY       = $0200;
   PCRE_NOTEMPTY       = $0400;

   PCRE_UTF8           = $0800; // Run in UTF-8 mode
   PCRE_NO_UTF8_CHECK  = $2000; // Do not check the pattern for UTF-8 validity
                                // (only relevant if PCRE_UTF8 is set)

const
   TPCRE_MAXSUBVECTORS = 20;

type
   TPCRESubVectorElems = ( PtrStart, PtrEnd );
   TPCRESubVector      = array[TPCRESubVectorElems] of Integer;
   TPCRESubVectors     = array[0..TPCRE_MAXSUBVECTORS] of TPCRESubVector;

   TPCRE = class
      private
         pcre        : _pcre;
         pcre_extra  : _pcre_extra;

         FSubVecCount: Integer;
         FSubVectors : TPCRESubVectors;

         FSubjectPtr : PChar;
         FSubjectLen : Integer;
         FSubjectPos : LongInt;

         FAutoStudy  : Boolean;
         FOptCompile : Integer;
         FOptStudy   : Integer;
         FOptExec    : Integer;

         function  GetMatchCount: Integer;
         function  GetMatchOffset( Index: Integer ): Integer;
         function  GetMatchLength( Index: Integer ): Integer;
         function  GetMatchString( Index: Integer ): String;

         procedure Cleanup;

      public
         property  AutoStudy : Boolean read FAutoStudy  write FAutoStudy;
         property  OptCompile: Integer read FOptCompile write FOptCompile;
         property  OptStudy  : Integer read FOptStudy   write FOptStudy;
         property  OptExec   : Integer read FOptExec    write FOptExec;

         property  MatchCount: Integer                    read GetMatchCount;
         property  MatchOffset[ Index: Integer ]: Integer read GetMatchOffset;
         property  MatchLength[ Index: Integer ]: Integer read GetMatchLength;
         property  MatchString[ Index: Integer ]: String  read GetMatchString;

         procedure Compile( Pattern: PChar );
         procedure Study;
         function  Exec( ASubjectPtr: PChar; ASubjectPos: Integer ): Boolean;

         function  Match( Pattern, Subject: PChar ): Boolean;
{$IFDEF NEW_FEATURE_NAMED_SUBSTRING}
         function  get_named_substring( ASubjectPtr: String;
            const ASubStringNamePtr: PChar;var ASubStringValue: String ): Integer;
{$ENDIF}

         constructor Create( AAutoStudy: Boolean; AOptCompile: Integer );
         destructor Destroy; override;
   end;

   EPCRE = class( Exception );


function  RE_Match  ( const Text, RegEx: String;
                      const REOpts: Integer ): Boolean;
function  RE_Extract( const Text, RegEx: String;
                      const REOpts: Integer ): String;
procedure RE_Parse  ( const Text, RegEx: String;
                      const REOpts: Integer;
                      Parts: TStrings );
procedure RE_Split  ( const Text, RegEx: String;
                      const REOpts: Integer;
                      PartsWanted: Integer;
                      Parts: TStrings );

function EscRegex( const re: string):string;


implementation

{$IFDEF BETA}
uses cLogFile;
{$ENDIF}

function EscRegex( const re: string):string;
var i,n:integer;
begin
  n:=0; SetLength( Result, Length(re) shl 1); // over estimate length
  for i:=1 to Length( re) do
  begin
    inc( n);
    if (re[i] in ['!','$','^','*','(',')','+',
                  '-','=','[',']','\',',','.','{','}','|',
                  ':','?']) then
    begin
      Result[n]:='\'; inc( n);
    end;
    Result[n]:=re[i];
  end;
  SetLength( Result, n);
end;

// ----------------------------------------------------------------------------

function RE_Match( const Text, RegEx: String; const REOpts: Integer ): Boolean;
var  RE: TPCRE;
begin
   RE := TPCRE.Create( False, REOpts );
   try
      Result := RE.Match( PChar(RegEx), PChar(Text) );
   finally
      RE.Free;
   end;
end;

function RE_Extract( const Text, RegEx: String; const REOpts: Integer ): String;
var  RE: TPCRE;
begin
   Result := '';
   RE := TPCRE.Create( False, REOpts );
   try
      if RE.Match( PChar(RegEx), PChar(Text) ) then begin
         Result := RE.MatchString[0]; 
      end;
   finally
      RE.Free;
   end;
end;

procedure RE_Parse( const Text, RegEx: String; const REOpts: Integer;
                    Parts: TStrings );
var  RE: TPCRE;
     i : Integer;
begin
   RE := TPCRE.Create( False, REOpts );
   try
      Parts.Clear;
      if RE.Match( PChar(RegEx), PChar(Text) ) then begin
         for i:=1 to RE.MatchCount do begin
            Parts.Add( RE.MatchString[i] );
         end;
      end;
   finally
      RE.Free;
   end;
end;

procedure RE_Split( const Text, RegEx: String;
                    const REOpts: Integer;     
                    PartsWanted: Integer;
                    Parts: TStrings );
var  RE: TPCRE;
     TempText: PChar;
     TempPos, PartsLeft: Integer;
begin
   RE := TPCRE.Create( False, REOpts );
   try
      TempText  := PChar( Text );
      TempPos   := 0;
      PartsLeft := PartsWanted;
      Parts.Clear;

      RE.Compile( PChar(RegEx) );
      RE.Study;

      while (PartsLeft>1) or (PartsWanted<0) do begin // split parts
         if (TempText+TempPos)^ = #0 then break;
         if not RE.Exec( TempText, TempPos ) then break;
         Parts.Add( copy( Text, TempPos+1, RE.MatchOffset[0]-TempPos ) );
         TempPos := RE.MatchOffset[0] + RE.MatchLength[0];
         dec( PartsLeft );
      end;
      if (TempText+TempPos)^ <> #0 then begin // add remainder (if any)
         Parts.Add( (TempText+TempPos) );
         dec( PartsLeft );
      end;
      while (PartsLeft>0) and (PartsWanted>0) do begin // fill up with empty strings
         Parts.Add( '' );
         dec( PartsLeft );
      end;
   finally
      RE.Free;
   end;
end;

// ----------------------------------------------------------------------------

function TPCRE.GetMatchCount: Integer;
begin
   if FSubVecCount<=0 then Result := 0 else Result := FSubVecCount;
end;

function TPCRE.GetMatchOffset( Index: Integer ): Integer;
begin
   Result := -1;
   if Index<FSubVecCount then begin                           
      Result := FSubVectors[Index][PtrStart];
   end;
end;

function TPCRE.GetMatchLength( Index: Integer ): Integer;
begin
   Result := 0;
   if Index<FSubVecCount then begin
      Result := FSubVectors[Index][PtrEnd] - FSubVectors[Index][PtrStart];
   end;
end;

function TPCRE.GetMatchString( Index: Integer ): String;
var  i: Integer;
begin
   Result := '';
   if Index<FSubVecCount then begin
      i := FSubVectors[Index][PtrEnd] - FSubVectors[Index][PtrStart];
      If i > 0 then begin
         SetLength( Result, i );
         Move( ( FSubjectPtr + FSubVectors[Index][PtrStart] )^, Result[1], i )
      end
   end;
end;

procedure TPCRE.Cleanup;
begin
   if Assigned( pcre_extra ) then FreeMem( pcre_extra );
   if Assigned( pcre       ) then FreeMem( pcre       );
   pcre_extra := nil;
   pcre       := nil;
end;

procedure TPCRE.Compile( Pattern: PChar );
var  errptr   : PChar;
     erroffset: Int;
begin
   Cleanup;
   errptr := nil;

   pcre := _pcre_compile(
              PChar(Pattern), OptCompile, @errptr, @erroffset, nil
           );
   if Assigned( pcre ) then begin
      FSubjectPos  := 0;
      FSubVecCount := -1;
      if AutoStudy then Study;
   end else begin
      raise EPCRE.Create( 'PCRE/compile: ' + String(errptr) );
   end;
end;

procedure TPCRE.Study;
var  errptr   : PChar;
begin
   if Assigned( pcre ) then begin
      errptr := nil;
      pcre_extra := _pcre_study( pcre, OptStudy, @errptr );
      if errptr<>nil then raise EPCRE.Create( 'PCRE/study: ' + String(errptr) );
   end else begin
      raise EPCRE.Create( 'PCRE/study: .Study without .Compile' );
   end;
end;

function TPCRE.Exec( ASubjectPtr: PChar; ASubjectPos: Integer ): Boolean;
begin
   Result := False;

   if not Assigned( ASubjectPtr ) then begin
      raise EPCRE.Create( 'PCRE/exec: .Exec without Subject' );
      exit;
   end;

   if not Assigned( pcre ) then begin
      raise EPCRE.Create( 'PCRE/exec: .Exec without .Compile' );
      exit;
   end;

   FSubjectPtr := ASubjectPtr;
   FSubjectLen := strlen( FSubjectPtr );
   if ASubjectPos>=0 then FSubjectPos:=ASubjectPos;

{$IFDEF D2005}
   FSubVecCount := _pcre_exec(
                      pcre, pcre_extra,
                      FSubjectPtr, FSubjectLen, FSubjectPos, OptExec,
                      pointer(@FSubVectors), sizeof(FSubVectors) div sizeof(Integer)
                   ); // {AP2} pointer: D2005 Anpassung
{$ELSE}
   FSubVecCount := _pcre_exec(
                      pcre, pcre_extra,
                      FSubjectPtr, FSubjectLen, FSubjectPos, OptExec,
                      @FSubVectors, sizeof(FSubVectors) div sizeof(Integer)
                   );
{$ENDIF}

   if FSubVecCount>=0 then begin
      Result := True;
      FSubjectPos := FSubVectors[0][PtrEnd];
   end;
end;

function TPCRE.Match( Pattern, Subject: PChar ): Boolean;
begin
   Compile( Pattern );
   Result := Exec( Subject, -1 );
end;

{$IFDEF NEW_FEATURE_NAMED_SUBSTRING}
function TPCRE.get_named_substring( ASubjectPtr: String;//const ASubjectPtr: PChar;//
          const ASubStringNamePtr: PChar;var ASubStringValue: String ): Integer;
var retString : PChar;
begin
   retString:= nil;
   ASubStringValue:='';
//   Result:=-1;
   try
{$IFDEF BETA} try {$ENDIF}
      Result:= _pcre_get_named_substring(pcre,@ASubjectPtr[1],
                                  pointer(@FSubVectors),FSubVecCount,
                                  ASubStringNamePtr, @retString);
      if (Result >= 0) and (retString <> nil) then
      begin
         SetString(ASubStringValue, retString,strLen(retString));
{$IFDEF BETA}
         LogRaw( LOGID_BETA, 'TPCRE.get_named_substring('+ASubStringNamePtr^+') = '+ASubStringValue )
      end else if Result < 0 then
         LogRaw( LOGID_BETA, 'TPCRE.get_named_substring: Result < 0 (='+intTostr(Result)+')' )
      else if retString= nil then
         LogRaw( LOGID_BETA, 'TPCRE.get_named_substring: retString= nil' )
{$ENDIF}
      end;

{$IFDEF BETA}
      except
         on E: Exception do begin
            LogRaw( LOGID_ERROR, 'TPCRE.get_named_substring EXCEPTION:'+ e.Message);
            raise;
         end
      end;
{$ENDIF}
   finally
      if retString <> nil then
         _pcre_free_substring(retString);
   end;
end;
{$ENDIF}

constructor TPCRE.Create( AAutoStudy: Boolean; AOptCompile: Integer );
begin
   inherited Create;

   pcre         := nil;
   pcre_extra   := nil;

   FSubVecCount := -1;
   FillChar( FSubVectors, sizeof(FSubVectors), 0 );

   FSubjectPtr  := nil;
   FSubjectLen  := 0;
   FSubjectPos  := 0;

   FAutoStudy   := AAutoStudy;
   FOptCompile  := AOptCompile;
   FOptStudy    := 0;
   FOptExec     := 0;
end;

destructor TPCRE.Destroy;
begin
   Cleanup;
   inherited Destroy;
end;

// ----------------------------------------------------------------------------

end.
