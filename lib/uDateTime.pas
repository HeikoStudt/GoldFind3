// ============================================================================
// Date and time related functions
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

unit uDateTime; // Date/time related functions

// ----------------------------------------------------------------------------
// Contains functions related with date and time.
// ----------------------------------------------------------------------------

interface

uses Windows, SysUtils;

type
   TUnixTime    = Integer;
   TTimeStamp   = String;
   TRfcDateTime = String;
   TRfcTimezone = String;

   tDateTimeArr = array of tDateTime;

function HoursToDateTime  ( Hours  : Integer ): TDateTime;
function MinutesToDateTime( Minutes: Integer ): TDateTime;
function SecondsToDateTime( Seconds: Integer ): TDateTime;

function NowBiasMinutes: Integer;
function NowBias: TDateTime; // GMT = Local + Bias
function NowGMT : TDateTime;
function NowRfcTimezone: TRfcTimeZone;

function DateTimeToUnixTime( DateTime: TDateTime ): TUnixTime;
function UnixTimeToDateTime( UnixTime: TUnixTime ): TDateTime;

function DateTimeToTimeStamp( DateTime: TDateTime ): TTimeStamp;
function TimeStampToDateTime( TimeStamp: TTimeStamp ): TDateTime;

function DateTimeGMTToRfcDateTime( DateTime   : TDateTime;
                                   RfcTimezone: TRfcTimezone ): TRfcDateTime;
function RfcDateTimeToDateTimeGMT( RfcDateTime: TRfcDateTime; ErrorDefault: TDateTime ): TDateTime; overload;
function RfcDateTimeToDateTimeGMT( RfcDateTime: TRfcDateTime ): TDateTime; overload;

function RfcTimezoneToBiasMinutes( RfcTimezone: TRfcTimezone ): Integer;
function BiasMinutesToRfcTimezone( BiasMin: Integer ): TRfcTimeZone;
function DateTimeToRfcTimezone( DateTime: TDateTime ): TRfcTimeZone;

function DateTimeToSystemTime( DateTime: TDateTime ): TSystemTime;
function SystemTimeIsDaylight( SystemTime: TSystemTime ): Boolean;
function DateTimeIsDaylight( DateTime: TDateTime ): Boolean;
function DateTimeToBiasMinutes( DateTime: TDateTime ): Integer;
function DateTimeGMTToLocal( DateTime: TDateTime ): TDateTime;
function DateTimeLocalToGMT( DateTime: TDateTime ): TDateTime;

{IMAP}
function ImapDateTimeToDateTime( ImapDateTime: String ) : TDateTime;
function ImapDateTextToDateTime( ImapDateText: String ) : TDateTime;
function DateTimeGMTToImapDateTime( DateTime   : TDateTime;
                                    RfcTimezone: TRfcTimezone ) : String;
{/IMAP}

// ----------------------------------------------------------------------------

Const
   RFC_DAY_NAMES   = 'SunMonTueWedThuFriSat';
   RFC_MONTH_NAMES = 'JanFebMarAprMayJunJulAugSepOctNovDec';

implementation

uses uTools;

const
   TIME_ZONE_ID_UNKNOWN  = 0;
   TIME_ZONE_ID_STANDARD = 1;
   TIME_ZONE_ID_DAYLIGHT = 2;


// ----------------------------------------------------------------------------

function HoursToDateTime( Hours: Integer ): TDateTime;
begin
   Result := ( Hours / 24.0 );
end;

function MinutesToDateTime( Minutes: Integer ): TDateTime;
begin
   Result := ( Minutes / 60.0 / 24.0 );
end;

function SecondsToDateTime( Seconds: Integer ): TDateTime;
begin
   Result := ( Seconds / 60.0 / 60.0 / 24.0 );
end;

// ----------------------------------------------------------------------------

function NowBiasMinutes: Integer;
var   TZI      : TTimeZoneInformation;
      TZResult : Integer;
begin
   TZResult := GetTimeZoneInformation(TZI);

   case TZResult of
      TIME_ZONE_ID_UNKNOWN : Result := TZI.Bias;
      TIME_ZONE_ID_STANDARD: Result := TZI.Bias + TZI.StandardBias;
      TIME_ZONE_ID_DAYLIGHT: Result := TZI.Bias + TZI.DaylightBias;
      else                   Result := 0;
   end;
end;

function NowBias: TDateTime;
begin
   Result := MinutesToDateTime( NowBiasMinutes );
end;

function NowGMT : TDateTime;
begin
   Result := Now + NowBias;
end;

// ----------------------------------------------------------------------------

function DateTimeToUnixTime( DateTime: TDateTime ): TUnixTime;
begin
   Result := Round( ( DateTime - EncodeDate(1970,1,1) ) * 86400 );
end;

function UnixTimeToDateTime( UnixTime: TUnixTime ): TDateTime;
var  Days, Hours, Mins, Secs, h: Integer;
begin
   Secs := UnixTime;

   if Secs>=0 then begin
      Days := Secs div 86400;
      Secs := Secs mod 86400;
   end else begin
      h    := Secs and $1;
      Secs := Secs shr 1;

      Days := Secs div (86400 shr 1);
      Secs := Secs mod (86400 shr 1);

      Secs := (Secs shl 1) or h;
   end;

   Hours := Secs div 3600;  Secs := Secs mod 3600;
   Mins  := Secs div 60;    Secs := Secs mod 60;

   Result := EncodeDate(1970,1,1) + Days + EncodeTime(Hours,Mins,Secs,0);
end;

// ----------------------------------------------------------------------------

function DateTimeToTimeStamp( DateTime: TDateTime ) : TTimeStamp;
begin
   Result := FormatDateTime( 'yyyymmddhhnnss', DateTime )
end;

function TimeStampToDateTime( TimeStamp: TTimeStamp ) : TDateTime;
begin
   if length(TimeStamp)<>14 then begin
      Result := 0;
   end else begin
      try
         Result := EncodeDate( strtoint   ( copy(TimeStamp, 1,4)    ),
                               strtointdef( copy(TimeStamp, 5,2), 1 ),
                               strtointdef( copy(TimeStamp, 7,2), 1 ) )
                 + EncodeTime( strtointdef( copy(TimeStamp, 9,2), 0 ),
                               strtointdef( copy(TimeStamp,11,2), 0 ),
                               strtointdef( copy(TimeStamp,13,2), 0 ), 0 );
      except
         Result := 0;
      end;
   end;
end;

// ----------------------------------------------------------------------------

function DateTimeGMTToRfcDateTime( DateTime   : TDateTime;
                                   RfcTimezone: TRfcTimezone ) : TRfcDateTime;
var  sDT     : String;
     DOW, MOY: Integer;
begin
   if RfcTimezone='' then RfcTimezone:='GMT';

   DateTime := DateTime - MinutesToDateTime( RfcTimezoneToBiasMinutes( RfcTimezone ) );

   sDT := FormatDateTime( 'dd"."mm"."yyyy hh":"nn":"ss', DateTime );
   DOW := DayOfWeek( DateTime );  // 1=Sun, ..., 7=Sat
   MOY := strtoint( copy( sDT, 4, 2 ) );

   // Date: Fri, 27 Mar 1998 12:12:50 +1300

   Result := copy( RFC_DAY_NAMES, DOW*3-2, 3 ) + ',' + ' '
           + copy( sDT, 1, 2 ) + ' '
           + copy( RFC_MONTH_NAMES, MOY*3-2, 3 ) + ' '
           + copy( sDT, 7, 4 ) + ' '
           + copy( sDT, 12, 8 ) + ' '
           + RfcTimezone;
end;

function RfcDateTimeToDateTimeGMT( RfcDateTime: TRfcDateTime ) : TDateTime;
const OldDefault = 29221.0; // =EncodeDate(1980,1,1)
begin
   try
     Result := RfcDateTimeToDateTimeGMT( RfcDateTime, OldDefault );
   except
     Result := OldDefault;
   end
end;

function RfcDateTimeToDateTimeGMT( RfcDateTime: TRfcDateTime; ErrorDefault: TDateTime ) : TDateTime;
var  s, h, tz : String;
     i, yyyy, mm, dd, hh, nn, ss : Integer;
begin
   s := TrimWhSpace( RfcDateTime );
   if s='' then begin Result:=ErrorDefault; exit; end;

   try
      // Date: Fri, 27 Mar 1998 12:12:50 +1300

      i := Pos( ',', s );
      if (i>0) and (i<10) then begin
         System.Delete( s, 1, i ); // "Tue,", "Tuesday,"
         s := TrimWhSpace(s);
      end;

      i := Pos(' ',s);
      dd := strtoint( copy(s,1,i-1) );
      System.Delete( s, 1, i );
      s := TrimWhSpace(s);

      i := Pos(' ',s);
      h := lowercase( copy(s,1,i-1) );
      mm := ( ( Pos(h,LowerCase(RFC_MONTH_NAMES)) - 1 ) div 3 ) + 1;
      System.Delete( s, 1, i );
      s := TrimWhSpace(s);

      i := Pos(' ',s);
      yyyy := strtoint( copy(s,1,i-1) );
      if yyyy<100 then begin
         if yyyy>=50 then yyyy:=yyyy+1900 else yyyy:=yyyy+2000;
      end;
      System.Delete( s, 1, i );
      s := TrimWhSpace(s);

      i := Pos(' ',s);
      if i=0 then begin
         h := s;
         tz := '';
      end else begin
         h := TrimWhSpace( copy(s,1,i-1) );
         tz := UpperCase( TrimWhSpace( copy(s,i+1,32) ) );
      end;

      i:=Pos(':',h); if i=2 then h:='0'+h;
      hh := strtoint( copy(h,1,2) );
      nn := strtoint( copy(h,4,2) );
      ss := strtoint( copy(h,7,2) );

      Result := EncodeDate( yyyy, mm, dd )
              + MinutesToDateTime( RfcTimezoneToBiasMinutes( tz ) ) // -> GMT
              + EncodeTime( hh, nn, ss, 0 );
   except
      Result := ErrorDefault
   end;
end;

// ----------------------------------------------------------------------------

function RfcTimezoneToBiasMinutes( RfcTimeZone: TRfcTimeZone ): Integer;
begin
   Result := 0;
   if RfcTimeZone='' then exit;

   if RfcTimeZone[1] in [ '+', '-' ] then begin

      Result := strtointdef( copy(RfcTimeZone,2,2), 0 ) * 60
              + strtointdef( copy(RfcTimeZone,4,2), 0 );
      if (Result<0) or (Result>=24*60) then Result:=0;
      if RfcTimeZone[1]='+' then Result:=-Result;

   end else begin

      RfcTimeZone := UpperCase( RfcTimeZone );

      if      RfcTimeZone='GMT' then Result:=  0
      else if RfcTimeZone='UT'  then Result:=  0

      else if RfcTimeZone='EST' then Result:= -5*60
      else if RfcTimeZone='EDT' then Result:= -4*60
      else if RfcTimeZone='CST' then Result:= -6*60
      else if RfcTimeZone='CDT' then Result:= -5*60
      else if RfcTimeZone='MST' then Result:= -7*60
      else if RfcTimeZone='MDT' then Result:= -6*60
      else if RfcTimeZone='PST' then Result:= -8*60
      else if RfcTimeZone='PDT' then Result:= -7*60

      else if RfcTimeZone='A'   then Result:= -1*60
      else if RfcTimeZone='B'   then Result:= -2*60
      else if RfcTimeZone='C'   then Result:= -3*60
      else if RfcTimeZone='D'   then Result:= -4*60
      else if RfcTimeZone='E'   then Result:= -5*60
      else if RfcTimeZone='F'   then Result:= -6*60
      else if RfcTimeZone='G'   then Result:= -7*60
      else if RfcTimeZone='H'   then Result:= -8*60
      else if RfcTimeZone='I'   then Result:= -9*60
      else if RfcTimeZone='K'   then Result:=-10*60
      else if RfcTimeZone='L'   then Result:=-11*60
      else if RfcTimeZone='M'   then Result:=-12*60
      else if RfcTimeZone='N'   then Result:=  1*60
      else if RfcTimeZone='O'   then Result:=  2*60
      else if RfcTimeZone='P'   then Result:=  3*60
      else if RfcTimeZone='Q'   then Result:=  4*60
      else if RfcTimeZone='R'   then Result:=  5*60
      else if RfcTimeZone='S'   then Result:=  6*60
      else if RfcTimeZone='T'   then Result:=  7*60
      else if RfcTimeZone='U'   then Result:=  8*60
      else if RfcTimeZone='V'   then Result:=  9*60
      else if RfcTimeZone='W'   then Result:= 10*60
      else if RfcTimeZone='X'   then Result:= 11*60
      else if RfcTimeZone='Y'   then Result:= 12*60
      else if RfcTimeZone='Z'   then Result:=  0;

   end;
end;

function BiasMinutesToRfcTimezone( BiasMin: Integer ): TRfcTimeZone;
begin
   if BiasMin=0 then begin
      Result := 'GMT';
   end else begin
      if BiasMin<0 then Result:='+' else Result:='-';
      BiasMin := abs( BiasMin );
      Result := Result + Format( '%.2d%.2d', [ BiasMin div 60, BiasMin mod 60 ])
   end;
end;

function NowRfcTimezone: TRfcTimeZone;
begin
   Result := BiasMinutesToRfcTimezone( NowBiasMinutes );
end;

function DateTimeToRfcTimezone( DateTime: TDateTime ): TRfcTimeZone;
begin
   Result := BiasMinutesToRfcTimezone( DateTimeToBiasMinutes( DateTime ) );
end;

// ----------------------------------------------------------------------------

function DateTimeToSystemTime( DateTime: TDateTime ): TSystemTime;
begin
   with Result do begin
      DecodeDate( DateTime, wYear, wMonth, wDay );
      DecodeTime( DateTime, wHour, wMinute, wSecond, wMilliseconds );
      wDayOfWeek := DayOfWeek( DateTime ) - 1;
   end;
end;

function SystemTimeIsDaylight( SystemTime: TSystemTime ): Boolean;
var  XX, DB, DE: TDateTime;
     y, m, d: Word;
     TZI: TTimeZoneInformation;
begin
   Result := False;

   GetTimeZoneInformation( TZI );

   if TZI.StandardDate.wMonth=0 then exit; // no Daylight-infos

   if TZI.StandardDate.wYear=0 then begin
      // day-in-month-format (wDayOfWeek, wDay)
      with TZI.DaylightDate do begin
         DB := EncodeDate( SystemTime.wYear, wMonth, 1 );
         while DayOfWeek(DB){Sun=1}-1<>wDayOfWeek{Sun=0} do DB:=DB+1;
         dec( wDay );
         while wDay>0 do begin
            XX := DB + 7;
            DecodeDate( XX, y, m, d );
            if m<>wMonth then break;
            DB := XX;
            dec( wDay );
         end;
      end;
      with TZI.StandardDate do begin
         DE := EncodeDate( SystemTime.wYear, wMonth, 1 );
         while DayOfWeek(DE){Sun=1}-1<>wDayOfWeek{Sun=0} do DE:=DE+1;
         dec( wDay );
         while wDay>0 do begin
            XX := DE + 7;
            DecodeDate( XX, y, m, d );
            if m<>wMonth then break;
            DE := XX;
            dec( wDay );
         end;
      end;
   end else begin
      // absolute format
      DB := EncodeDate( SystemTime.wYear, TZI.DaylightDate.wMonth, TZI.DaylightDate.wDay );
      DE := EncodeDate( SystemTime.wYear, TZI.StandardDate.wMonth, TZI.StandardDate.wDay );
   end;

   DB := DB + EncodeTime( TZI.DaylightDate.wHour,   TZI.DaylightDate.wMinute,
                          TZI.DaylightDate.wSecond, TZI.DaylightDate.wMilliSeconds );
   DE := DE + EncodeTime( TZI.StandardDate.wHour,   TZI.StandardDate.wMinute,
                          TZI.StandardDate.wSecond, TZI.StandardDate.wMilliSeconds );

   XX := EncodeDate( SystemTime.wYear, SystemTime.wMonth, SystemTime.wDay );
   if DB<DE then begin
      if (XX>=DB) and (XX<DE) then Result:=True;
   end else begin
      if (XX>=DB) or  (XX<DE) then Result:=True;
   end;
end;

function DateTimeIsDaylight( DateTime: TDateTime ): Boolean;
begin
   Result := SystemTimeIsDaylight( DateTimeToSystemTime( DateTime ) );
end;

function DateTimeToBiasMinutes( DateTime: TDateTime ): Integer;
var  TZI: TTimeZoneInformation;
begin
   GetTimeZoneInformation(TZI);
   if DateTimeIsDaylight( DateTime ) then begin
      Result := TZI.Bias + TZI.DayLightBias;
   end else begin
      Result := TZI.Bias + TZI.StandardBias;
   end;
end;

function DateTimeGMTToLocal( DateTime: TDateTime ): TDateTime;
begin
   Result := DateTime - MinutesToDateTime( DateTimeToBiasMinutes(DateTime) ); 
end;

function DateTimeLocalToGMT( DateTime: TDateTime ): TDateTime;
begin
   Result := DateTime + MinutesToDateTime( DateTimeToBiasMinutes(DateTime) );
end;

// ----------------------------------------------------------------------------

{IMAP}
function ImapDateTimeToDateTime( ImapDateTime: String ) : TDateTime;
// RFC 2060
//   date_time ::= <"> date_day_fixed "-" date_month "-" date_year
//                 SPACE time SPACE zone <">
//   date_day        ::= 1*2digit
//   date_month      ::= "Jan" / "Feb" / "Mar" / "Apr" / "May" / "Jun" /
//                       "Jul" / "Aug" / "Sep" / "Oct" / "Nov" / "Dec"
//   date_year       ::= 4digit
//   time ::= 2digit ":" 2digit ":" 2digit
//   zone ::= ("+" / "-") 4digit
var  s, h, tz: String;
     i, yyyy, mm, dd, hh, nn, ss: Integer;
begin
     Result := 29221.0;
     s := TrimWhSpace( ImapDateTime );
     if s = '' then exit;
     try
        i := Pos('-',s);
        dd := strtoint( copy(s,1,i-1) );
        System.Delete( s, 1, i );
        if s = '' then exit;
        i := Pos('-',s);
        h := lowercase( copy(s,1,i-1) );
        mm := ( ( Pos(h,LowerCase(RFC_MONTH_NAMES)) - 1 ) div 3 ) + 1;
        System.Delete( s, 1, i );
        yyyy := strtoint( copy(s,1,4) );
        System.Delete( s, 1, 4 );
        s := TrimWhSpace(s);
        i := Pos(' ',s);
        if i=0 then begin
           h := s;
           tz := '';
        end else begin
           h := TrimWhSpace( copy( s, 1, i-1 ) );
           tz := UpperCase( TrimWhSpace( copy( s, i+1, 32 ) ) );
        end;

        hh := strtoint( copy( h, 1, 2 ) );
        nn := strtoint( copy( h, 4, 2 ) );
        ss := strtoint( copy( h, 7, 2 ) );

        Result := EncodeDate( yyyy, mm, dd )
                  + MinutesToDateTime( RfcTimezoneToBiasMinutes( tz ) ) // -> GMT
                  + EncodeTime( hh, nn, ss, 0 );
     except end
end;

function ImapDateTextToDateTime( ImapDateText: String ) : TDateTime;
//   date_text  ::= date_day "-" date_month "-" date_year
begin
     Result := ImapDateTimeToDateTime( ImapDateText + ' 00:00:00 +0000' )
end;

function DateTimeGMTToImapDateTime( DateTime   : TDateTime;
                                    RfcTimezone: TRfcTimezone ) : String;
var  sDT : String;
     MOY : Integer;
begin
   if RfcTimezone = '' then RfcTimezone := '+0000';

   DateTime := DateTime - MinutesToDateTime( RfcTimezoneToBiasMinutes( RfcTimezone ) );

   sDT := FormatDateTime( 'dd"."mm"."yyyy hh":"nn":"ss', DateTime );
   MOY := strtoint( copy( sDT, 4, 2 ) );

   // Date: 27-Mar-1998 12:12:50 +1300

   Result := copy( sDT, 1, 2 ) + '-'
           + copy( RFC_MONTH_NAMES, MOY*3-2, 3 ) + '-'
           + copy( sDT, 7, 4 ) + ' '
           + copy( sDT, 12, 8 ) + ' '
           + RfcTimezone;
end;
{/IMAP}

end.
