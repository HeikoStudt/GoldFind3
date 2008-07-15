// ============================================================================
// Hamster, a free news- and mailserver for personal, family and workgroup use.
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

unit cIndexRc;

interface

uses SysUtils, Classes, Windows, uTools;

type
  TIndexedRecords = class
    private
      CritSect  : TRTLCriticalSection;
      FMemPtr   : PChar;
      FMemSize  : LongInt;
      FUseSize  : LongInt;
      FRecSize  : LongInt;
      FSorted   : Boolean;
      FChanged  : Boolean;
      FFilename : String;

      procedure QuickSort( CompareOffset, L, R: Integer );  //JH //Purge-Fix
//      procedure QuickSort( L, R: Integer );
//      procedure SetSorted( NewSorted: Boolean ); // JAWO 13.08.01 (Purge)

      procedure RecIns( Index: Integer );
      procedure RecInsert( Index: Integer; const Data );

    protected
      procedure RecSet( Index: Integer; const Data );
      procedure RecKeyFindPos( const Data;
                               KeySize: LongInt;
                               WantInsertPos: Boolean;
                               out Index: Integer );
      function  GetCount: LongInt;
      function  RecKeyInsPosOf( KeySize: LongInt; const Data ): Integer;
      procedure RecGet( Index: Integer; var Data );
    public
      property  Filename: String read FFilename;
      property  Count  : LongInt read GetCount;
      property  Sorted : Boolean read FSorted; //  write SetSorted; // JAWO 13.08.01 (Purge)
      property  Changed: Boolean read FChanged write FChanged;
      property  RecSize: LongInt read FRecSize;

      function  RecKeyIndexOf ( KeySize: LongInt; const Data ): Integer;

      procedure RecDelete( Index: Integer );
      procedure RecAdd( out Index: Integer; const Data );
      function  RecPtr( Index: Integer ): PChar;

      procedure Add   ( const Data );
      procedure Remove( const Data );
      procedure RemoveKey( const Data; KeySize: LongInt );
      function  ContainsKey( const Data; KeySize: LongInt ): Boolean;

      procedure Clear;
      procedure Pack;
      //procedure Sort;
      procedure Sort; overload;                                //JH //Purge-Fix
      procedure Sort( CompareOffset: Integer ); overload;      //JH //Purge-Fix
      function  Unsorted: boolean; // JAWO 13.08.01 (Purge)

      procedure Enter;
      procedure Leave;

      procedure LoadFromFile;
      procedure SaveToFile;
      procedure FlushToFile;

      constructor Create( AFilename : String;
                          ARecSize  : Longint);
                // ASorted   : Boolean ); obsolete // JAWO 13.08.01 (Purge)
      destructor Destroy; override;
  end;

implementation

//Uses cLogFile;

// ---------------------------------------------------------------- Tools -----

function LongCompare( p1, p2: Pointer ): Integer;
begin
     if PLongInt(p1)^<PLongInt(p2)^ then begin
        Result := -1;
        exit;
     end else begin
        if PLongInt(p1)^>PLongInt(p2)^ then begin
           Result := +1;
           exit;
        end else begin
           Result := 0;
        end;
     end;
end;

// ------------------------------------------------------ TIndexedRecords -----

procedure TIndexedRecords.QuickSort( CompareOffset, L, R: Integer ); //JH //Purge-Fix
//procedure TIndexedRecords.QuickSort( L, R: Integer );
var  I, J     : Integer;
     P, DI, DJ: Pointer;
begin
     GetMem( DI, FRecSize );
     GetMem( DJ, FRecSize );

     repeat
        I := L;
        J := R;
//        P := RecPtr( (L+R) div 2 );
        P := RecPtr( (L+R) div 2 ) + CompareOffset; //JH //Purge-Fix
        repeat
           // while MemCompare( RecPtr(I), P, FRecSize ) < 0 do inc( I );
           // while MemCompare( RecPtr(J), P, FRecSize ) > 0 do dec( J );
//           while LongCompare( RecPtr(I), P ) < 0 do inc( I );
//           while LongCompare( RecPtr(J), P ) > 0 do dec( J );
           while LongCompare( RecPtr(I) + CompareOffset, P ) < 0 do inc( I ); //JH //Purge-Fix
           while LongCompare( RecPtr(J) + CompareOffset, P ) > 0 do dec( J ); //JH //Purge-Fix

           if I <= J then begin
              RecGet( I, DI^ );
              RecGet( J, DJ^ );
              RecSet( J, DI^ );
              RecSet( I, DJ^ );
              inc( I );
              dec( J );
           end;
        until I > J;
        if L < J then QuickSort( CompareOffset, L, J ); //JH //Purge-Fix
        // if I < R then QuickSort( CompareOffset, I, R ); // JAWO 13.08.01 (Purge)
        L := I;
     until I >= R;

     FreeMem( DI, FRecSize );
     FreeMem( DJ, FRecSize );
end;

procedure TIndexedRecords.Sort;  //JH //Purge-Fix
begin
     Sort( 0 );
end;

procedure TIndexedRecords.Sort( CompareOffset: Integer ); //JH //Purge-Fix
//procedure TIndexedRecords.Sort;
begin
   Enter;
   try
     if FUseSize>0 then begin
        // if FUseSize>0 then QuickSort( CompareOffset, 0, Count-1 ); //JH //Purge-Fix
        QuickSort( CompareOffset, 0, Count-1 ); //JH //Purge-Fix
        FSorted := (CompareOffset=0); // JAWO 13.08.01 (Purge)
     end
   finally Leave end
end;

{
procedure TIndexedRecords.SetSorted( NewSorted: Boolean );
begin
     Enter;
     try
        if NewSorted and not FSorted then Sort;
        FSorted := NewSorted;
     finally Leave end;
end;
}

function TIndexedRecords.GetCount: LongInt;
begin
     Enter;
     try
        if FRecSize>0 then Result := FUseSize div FRecSize
                      else Result := 0;
     finally Leave end;
end;

procedure TIndexedRecords.Clear;
begin
     Enter;
     try
        FUseSize := 0;
        FChanged := True;
     finally Leave end;
end;

procedure TIndexedRecords.Pack;
begin
     Enter;
     try
        if FUseSize<FMemSize then begin
           FMemSize := FUseSize;
           ReallocMem( FMemPtr, FMemSize );
        end;
     finally Leave end;
end;

function TIndexedRecords.RecPtr( Index: Integer ): PChar;
begin
     Enter;
     try
        Result := FMemPtr + Index * FRecSize;
     finally Leave end;
end;

procedure TIndexedRecords.RecGet( Index: Integer; var Data );
begin
     Enter;
     try
        if (Index>=0) and (Index<Count) then begin
           Move( RecPtr(Index)^, Data, FRecSize );
        end;
     finally Leave end;
end;

procedure TIndexedRecords.RecSet( Index: Integer; const Data );
begin
     Enter;
     try
        if (Index>=0) and (Index<Count) then begin
           Move( Data, RecPtr(Index)^, FRecSize );
           FChanged := True;
        end;
     finally Leave end;
end;

procedure TIndexedRecords.RecAdd( out Index: Integer; const Data );
begin
     Enter;
     try
        if FSorted then begin
           Index := RecKeyInsPosOf( RecSize, Data );
        end else begin
           Index := Count;
        end;
        RecInsert( Index, Data );
     finally Leave end;
end;

procedure TIndexedRecords.RecIns( Index: Integer );
var  reserved: LongInt;
begin
     Enter;
     try
        if (Index>=0) and (Index<=Count) then begin
           inc( FUseSize, FRecSize );
           if FUseSize>FMemSize then begin
              reserved := Count div 100; // pre-alloc for 1% of current count
              if reserved<1 then reserved:=1;
              FMemSize := FUseSize + FRecSize * reserved;
              ReallocMem( FMemPtr, FMemSize );
           end;
           if Index<>Count-1 then begin
              Move( RecPtr(Index)^,
                    RecPtr(Index+1)^,
                    FRecSize*(Count-Index-1) );
           end;
           FChanged := True;
        end;
     finally Leave end;
end;

procedure TIndexedRecords.RecInsert( Index: Integer; const Data );
begin
     Enter;
     try
        if (Index>=0) and (Index<=Count) then begin
           RecIns( Index );
           RecSet( Index, Data );
        end;
     finally Leave end;
end;

procedure TIndexedRecords.RecDelete( Index: Integer );
begin
     Enter;
     try
        if (Index>=0) and (Index<Count) then begin
           if Index<>Count-1 then begin
              Move( RecPtr(Index+1)^,
                    RecPtr(Index)^,
                    FRecSize*(Count-Index-1) );
           end;
           dec( FUseSize, FRecSize );
           FChanged := True;
        end;
     finally Leave end;
end;

procedure TIndexedRecords.RecKeyFindPos( const Data;
                                         KeySize: LongInt;
                                         WantInsertPos: Boolean;
                                         out   Index: Integer );
var  i, res, min, max, InsPos: Integer;
     P: PChar;
begin
     if FSorted then begin

        Index  := -1;
        InsPos := 0;

        min := 0;
        max := Count-1;

        repeat
           if min>max then break;
           i := ( min + max ) div 2;

           // res := MemCompare( RecPtr(i), @Data, KeySize );
           res := LongCompare( RecPtr(i), @Data );

           if res<0 then begin
              min := i+1;
              InsPos := min; //=compared-pos.+1
           end else begin
              if res>0 then begin
                 InsPos := i;
                 max := i-1;
              end else begin
                 InsPos := i; //=compared-pos.
                 Index  := i; // = already in list
                 break;
              end;
           end;

        until False;

        if WantInsertPos then Index:=InsPos;

     end else begin

        if WantInsertPos then begin
           Index := Count; // append
        end else begin
           Index := -1;
           P := RecPtr( 0 );
           for i:=0 to Count-1 do begin
              if CompareMem( P, @Data, KeySize ) then begin
                 Index := i;
                 break;
              end;
              inc( P, FRecSize );
           end;
        end;

     end;

end;

function TIndexedRecords.RecKeyInsPosOf( KeySize: LongInt; const Data ): Integer;
begin
     Enter;
     try
        RecKeyFindPos( Data, KeySize, True, Result );
     finally Leave end;
end;

function TIndexedRecords.RecKeyIndexOf( KeySize: LongInt; const Data ): Integer;
begin
     Enter;
     try
        RecKeyFindPos( Data, KeySize, False, Result );
     finally Leave end;
end;

procedure TIndexedRecords.Add( const Data );
var  Index: Integer;
begin
     Enter;
     try
        RecAdd( Index, Data );
     finally Leave end;
end;

procedure TIndexedRecords.RemoveKey( const Data; KeySize: LongInt );
var  Index: Integer;
begin
     Enter;
     try
        Index := RecKeyIndexOf( KeySize, Data );
        if Index>=0 then RecDelete( Index );
     finally Leave end;
end;

procedure TIndexedRecords.Remove( const Data );
begin
     RemoveKey( Data, RecSize );
end;

function TIndexedRecords.ContainsKey( const Data; KeySize: LongInt ): Boolean;
begin
     Enter;
     try
        Result := ( RecKeyIndexOf( KeySize, Data ) >= 0 );
     finally Leave end;
end;

procedure TIndexedRecords.LoadFromFile;
var  FileStream: TFileStream;
begin
     Enter;
     try
        Clear;
        if FileExists( Filename ) then begin
           FileStream := TFileStream.Create( Filename, fmOpenRead );
           FreeMem( FMemPtr, FMemSize );
           FUseSize := ( (FileStream.Size+FRecSize-1) div FRecSize ) * FRecSize;
           FMemSize := FUseSize;
           FMemPtr  := AllocMem( FMemSize );
           FileStream.Read( FMemPtr^, FUseSize );
           FileStream.Free;
        end;
        FChanged := False;
        if UnSorted then begin // JAWO 13.08.01 (Purge)
           Sort;               //   :
           FChanged := true;   //   :
        end;                   //   :
        FSorted := true;       // JAWO 13.08.01 (Purge)
     finally Leave end;
end;

procedure TIndexedRecords.SaveToFile;
begin
   if not FChanged then exit;
   Enter;
   try
      With TFileStreamEx.Create( Filename, fmCreate ) do try
         try
            Write( FMemPtr^, FUseSize );
         except
            on E:Exception do begin
//               Log( LOGID_ERROR, 'cIndexRC.SaveToFile Exception on ' + FileName + ' : ' + E.Message ); // ojb
               raise; // OJB
            end
         end;
         FlushFileBuffers( Handle )
      finally
         free
      end;
      FChanged := False;
   finally Leave end;
end;

procedure TIndexedRecords.FlushToFile;
begin
     Enter;
     try
        if Changed then SaveToFile;
     finally Leave end;
end;

procedure TIndexedRecords.Enter;    
begin
     EnterCriticalSection( CritSect );
end;

procedure TIndexedRecords.Leave;
begin
     LeaveCriticalSection( CritSect );
end;

constructor TIndexedRecords.Create( AFilename: String;
                                    ARecSize : Longint);
                                 // ASorted  : Boolean );  // JAWO 13.08.01 (Purge) removed
begin
     inherited Create;

     InitializeCriticalSection( CritSect );

     FRecSize  := ARecSize;
     FSorted   := true;  // JAWO 13.08.01 (Purge)
     FChanged  := False;
     FFilename := AFilename;

     FUseSize := 0;
     FMemSize := FRecSize;
     FMemPtr  := AllocMem( FMemSize );
end;

destructor TIndexedRecords.Destroy;
begin
     Enter;
     try
        FreeMem( FMemPtr, FMemSize );
     finally Leave end;

     DeleteCriticalSection( CritSect );

     inherited Destroy;
end;

function  TIndexedRecords.Unsorted: boolean; // JAWO 13.08.01 (Purge)

      function LinearSorted: boolean;
      var i1: integer;
          P0, P1: PChar;
      begin
         Result := true;
         P1 := RecPtr(0);
         for i1 := 1 to Count-1 do begin
            P0 := P1;
            P1 := RecPtr(i1);
            if ( LongCompare ( P0, P1 ) > 0 ) then begin
               Result := false;
               break;
           end;
         end;
      end;

begin
   if (FUseSize>0)
      then Result := NOT LinearSorted
      else Result := false;
end;

end.

