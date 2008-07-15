// ============================================================================
// Delphi-interface for Philip Hazel's PCRE Vr. 3.1
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

{$ALIGN ON}           // suggested
{$BOOLEVAL OFF}       // mandatory
{$LONGSTRINGS ON}     // mandatory
{$IOCHECKS ON}        // mandatory
{$EXTENDEDSYNTAX ON}  // mandatory
{$WRITEABLECONST OFF} // suggested
{.$DEBUGINFO ON}       // suggested
{.$LOCALSYMBOLS ON}    // suggested
{.$REFERENCEINFO ON}   // suggested

{$DEFINE NEW_FEATURE_NAMED_SUBSTRING}

unit uPCRE; // Delphi-interface for Philip Hazel's PCRE Vr. 3.1

// ----------------------------------------------------------------------------
// Contains a Delphi-interface for:
//    Perl-Compatible Regular Expressions (PCRE) Vr. 3.1
//    Written by Philip Hazel (<ph10@cam.ac.uk>).
//    Copyright (c) 1997-2000 University of Cambridge
//    ftp://ftp.cus.cam.ac.uk/pub/software/programs/pcre/
// When using PCRE for own programs, be aware of its license (see below).
// ----------------------------------------------------------------------------


// ============================================================================
{
   PCRE LICENCE
   ------------

   PCRE is a library of functions to support regular expressions whose syntax
   and semantics are as close as possible to those of the Perl 5 language.

   Written by: Philip Hazel <ph10@cam.ac.uk>

   University of Cambridge Computing Service,
   Cambridge, England. Phone: +44 1223 334714.

   Copyright (c) 1997-2000 University of Cambridge

   Permission is granted to anyone to use this software for any purpose on any
   computer system, and to redistribute it freely, subject to the following
   restrictions:

   1. This software is distributed in the hope that it will be useful,
      but WITHOUT ANY WARRANTY; without even the implied warranty of
      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

   2. The origin of this software must not be misrepresented, either by
      explicit claim or by omission.

   3. Altered versions must be plainly marked as such, and must not be
      misrepresented as being the original software.

   4. If PCRE is embedded in any software that is released under the GNU
      General Purpose Licence (GPL), then the terms of that licence shall
      supersede any condition above with which it is incompatible.
}
// ============================================================================


{------------------------------------------------------------------------------

   Steps to create the needed object-files with Borland C++ Builder 3:

   1. Load and unzip PCRE-sources from:
      ftp://ftp.cus.cam.ac.uk/pub/software/programs/pcre/pcre-3.1.tar.gz

   2. Create config.h:
      rename config.in config.h
      change: #define HAVE_STRERROR 1
      change: #define HAVE_MEMMOVE  1

   3. Create pcre.h:
      rename pcre.in pcre.h
      change: #define PCRE_MAJOR 3
      change: #define PCRE_MINOR 1
      change: #define PCRE_DATE  09-Feb-2000
      (note: values taken from configure.in)

   4. Create chartables.c:
      bcc32 dftables.c
      dftables >chartables.c

   5. Create object-files:
      bcc32 -c -DSTATIC maketables.c
      bcc32 -c -DSTATIC get.c
      bcc32 -c -DSTATIC study.c
      bcc32 -c -DSTATIC pcre.c
      bcc32 -c -DSTATIC pcreposix.c

   6. Create pcretest and test object-files:
      bcc32 -DSTATIC pcretest.c pcre.obj get.obj study.obj maketables.obj pcreposix.obj
      pcretest testdata\testinput1 testtry
      fc testtry testdata\testoutput1
      pcretest -i testdata\testinput2 testtry
      fc testtry testdata\testoutput2
      pcretest testdata\testinput3 testtry
      fc testtry testdata\testoutput3

   The three object-files covered by this interface (pcre.obj, study.obj and
   [optionally] get.obj) are included with this distribution. They are built
   from the original sources with the steps and modifications noted above.

------------------------------------------------------------------------------}

interface


{$DEFINE PCRE_INCLUDE_GET} // remove dot to additionally link "get.obj"

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

   // Exec-time and get-time error codes
   PCRE_ERROR_NOMATCH      = (-1);
   PCRE_ERROR_NULL         = (-2);
   PCRE_ERROR_BADOPTION    = (-3);
   PCRE_ERROR_BADMAGIC     = (-4);
   PCRE_ERROR_UNKNOWN_NODE = (-5);
   PCRE_ERROR_NOMEMORY     = (-6);
   PCRE_ERROR_NOSUBSTRING  = (-7);

   // Request types for pcre_fullinfo()
   PCRE_INFO_OPTIONS      = 0;
   PCRE_INFO_SIZE         = 1;
   PCRE_INFO_CAPTURECOUNT = 2;
   PCRE_INFO_BACKREFMAX   = 3;
   PCRE_INFO_FIRSTCHAR    = 4;
   PCRE_INFO_FIRSTTABLE   = 5;
   PCRE_INFO_LASTLITERAL  = 6;

type
   // Types
   _pcre       = Pointer;
   _pcre_extra = Pointer;

   Int     = LongInt;
   PInt    = ^Int;
   PPChar  = ^PChar;
   PPPChar = ^PPChar;

// Functions

// const char * pcre_version(void)
 function _pcre_version: PChar; cdecl; external;
//function pcre_version(): PChar; register; external;

// pcre * pcre_compile(const char *pattern, int options, const char **errorptr,
//   int *erroroffset, const unsigned char *tables)
function _pcre_compile( const pattern : PChar;
                        options       : Int;
                        const errorptr: PPChar;
                        erroroffset   : PInt;
                        const tables  : PChar ): _pcre; cdecl; external;
//                        const tables  : PChar ): _pcre; register; external;

// int pcre_exec(const pcre *external_re, const pcre_extra *external_extra,
//   const char *subject, int length, int start_offset, int options,
//   int *offsets, int offsetcount)
function _pcre_exec( const external_re   : _pcre;
                     const external_extra: _pcre_extra;
                     const subject       : PChar;
                     length              : Int;
                     startoffset         : Int;
                     options             : Int;
                     offsets             : PInt;
//                     offsetcount         : Int ): Int; register; external;
                     offsetcount         : Int ): Int; cdecl; external;

// int pcre_info(const pcre *external_re, int *optptr, int *first_char)
function _pcre_info( const external_re: _pcre;
                     optptr           : PInt;
//                     first_char       : PInt ): Int; register; external;
                     first_char       : PInt ): Int; cdecl; external;

// int pcre_fullinfo(const pcre *external_re, const pcre_extra *study_data,
//       int what, void *where)
function _pcre_fullinfo( const external_re: _pcre;
                         const study_data : _pcre_extra;
                         what             : Int;
//                         where            : Pointer ): Int; register; external;
                         where            : Pointer ): Int; cdecl; external;

// pcre_extra * pcre_study(const pcre *external_re, int options,
//       const char **errorptr)
function _pcre_study( const external_re: _pcre;
                      options          : Int;
//                      const errorptr   : PPChar ): _pcre_extra; register; external;
                      const errorptr   : PPChar ): _pcre_extra; cdecl; external;

{$IFDEF PCRE_INCLUDE_GET}
// int pcre_copy_substring(const char *subject, int *ovector, int stringcount,
//     int stringnumber, char *buffer, int size)
function _pcre_copy_substring( const subject: PChar;
                               ovector      : PInt;
                               stringcount  : Int;
                               stringnumber : Int;
                               buffer       : PChar;
//                               size         : Int ): Int; register; external;
                               size         : Int ): Int; cdecl; external;

// int pcre_get_substring(const char *subject, int *ovector, int stringcount,
//   int stringnumber, const char **stringptr)
function _pcre_get_substring( const subject  : PChar;
                              ovector        : PInt;
                              stringcount    : Int;
                              stringnumber   : Int;
//                              const stringptr: PPChar ): Int; register; external;
                              const stringptr: PPChar ): Int; cdecl; external;

// int pcre_get_substring_list(const char *subject, int *ovector,
//   int stringcount, const char ***listptr)
function _pcre_get_substring_list( const subject: PChar;
                                   ovector      : PInt;
                                   stringcount  : Int;
//                                   const listptr: PPPChar ): Int; register; external;
                                   const listptr: PPPChar ): Int; cdecl; external;

{$IFDEF NEW_FEATURE_NAMED_SUBSTRING}
// int pcre_get_named_substring(const pcre *code, const char *subject,
//   int *ovector, int stringcount, const char *stringname, const char **stringptr);
function _pcre_get_named_substring( const external_re: _pcre;
                                    const subject    : PChar;
                                          ovector    : PInt;
                                          stringcount: Int;
                                    const stringname : PChar;
                                    const stringValue: PPChar): Int; cdecl; external;
// PCRE_DATA_SCOPE void pcre_free_substring(const char *);
procedure _pcre_free_substring(stringname : PChar)cdecl; external;
// PCRE_DATA_SCOPE void pcre_free_substring_list(const char **);

{$ENDIF}

//type usChar = array of Char;
//     PusChar = ^usChar;

//var __pcre_default_tables: usChar ; // external 'pcre_chartables.obj'; //= _pcre_default_tables;

//const unsigned char _pcre_default_tables[] = {

//const uschar _pcre_utf8_table4[] = {

//unsigned char *name_table;

//  (void)pcre_fullinfo(
//    re,                       /* the compiled pattern */
//    NULL,                     /* no extra data - we didn't study the pattern */
//    PCRE_INFO_NAMETABLE,      /* address of the table */
//    &name_table);             /* where to put the answer */

// ----------------------------------------------------------------------------
{$ENDIF}

implementation

uses SysUtils;

// Link PCRE-objectfiles:

{.$LINK pcre.obj}
{.$LINK pcre.lib}

{$LINK pcre\pcre_compile.obj}
{$LINK pcre\pcre_config.obj}
{$LINK pcre\pcre_dfa_exec.obj}
{$LINK pcre\pcre_exec.obj}
{$LINK pcre\pcre_fullinfo.obj}
//  pcre_get.obj \
{$LINK pcre\pcre_globals.obj}
{$LINK pcre\pcre_info.obj}
{.$LINK pcre\pcre_maketables.obj}
{..$LINK \Projects\pcre-7.0\pcre_newline.obj}
{$LINK pcre\pcre_ord2utf8.obj}
{$LINK pcre\pcre_refcount.obj}

{.$LINK study.obj}
{$LINK pcre\pcre_study.obj}
{$LINK pcre\pcre_tables.obj}
{$LINK pcre\pcre_chartables.obj}
{$LINK pcre\pcre_try_flipped.obj}
{$LINK pcre\pcre_ucp_searchfuncs.obj}
{$LINK pcre\pcre_valid_utf8.obj}
{$LINK pcre\pcre_version.obj}
{$LINK pcre\pcre_xclass.obj}


{$IFDEF PCRE_INCLUDE_GET}
{.$LINK get.obj}
{$LINK pcre\pcre_get.obj}
{$ENDIF}

// Declarations needed just to make compiler happy:


// function _pcre_malloc( size: Cardinal ): Pointer; cdecl; external;
// procedure _pcre_free( block: Pointer ); cdecl; external;

// ----------------------------------------------------------------------------

// Replacements for functions of C-runtime-library used in PCRE:

type
   size_t = Cardinal;

//const unsigned char _pcre_default_tables[] = {
//var __pcre_default_tables: ^Char;cdecl; //= _pcre_default_tables;
{.$EXTERNALSYM __pcre_default_tables}

// void *malloc(size_t size);
function _malloc( size: size_t ): Pointer; cdecl;
begin
   Result := AllocMem( size );
end;

// void free(void *block);
procedure _free( block: Pointer ); cdecl;
begin
   FreeMem( block );
end;

// void *memset(void *s, int c, size_t n);
function _memset( s: Pointer; c: Integer; n: size_t ): Pointer; cdecl;
begin
   FillChar( s^, n, c );
   Result := s;
end;

// void *memmove(void *dest, const void *src, size_t n);
function _memmove( dest: Pointer; src: Pointer; n: size_t ): Pointer; cdecl;
begin
   try
      Move( src^, dest^, n );
   except end;

   Result := dest;
end;

// int memcmp(const void *s1, const void *s2, size_t n);
function _memcmp( const s1: Pointer;const s2: Pointer; n: size_t ): Integer; cdecl;
var p1,p2:^Char;
begin
   p1 := s1;
   p2 := s2;
   Result := 0;
   while ( (Char(p1^)<>'\0' ) and (Char(p2^)<>'\0' ) and (n>0) ) do
   begin
      Result := Integer(Char(p1^) > Char(p2^) );
      dec(n);
      inc(p1);
      inc(p2);
   end;
end;

// void *memcpy(void *dest, const void *src, size_t n);
function _memcpy( const dest: Pointer;const  src: Pointer; n: size_t ): Pointer; cdecl;
begin
   Move( src^, dest^, n );
   Result := dest;
end;

// int isdigit(int c);
//function _isdigit( const c: Integer ): Integer; cdecl;
//begin
//   Result := Integer((Char(c)>='0') and (Char(c)<='9'));
//end;

//const cToLower =  Integer('a') xor Integer('z') ;
// int isalnum(int c);
//function _isalnum( const c: Integer ): Integer; cdecl;
//begin
//   Result := Integer(((Char(c)>='0') and (Char(c)<='9')) or
//                     ((Char(c or cToLower)>='a') and (Char(c or cToLower)<='z')));
//end;

//int islower(int c);
//function _islower( const c: Integer ): cdecl;
//begin
////   Result := IsCharLower( Char(c) );
//   Result := Integer((Char(c)>='a') and (Char(c)<='z'));
//end;

//int isupper(int c);
//function _isupper( const c: Integer ): Integer; cdecl;
//begin
////   Result := IsCharLower( Char(c) );
//   Result := Integer((Char(c)>='A') and (Char(c)<='Z'));
//end;

//size_t strlen(const char *s);
function _strlen( const s: PChar ): size_t; cdecl;
begin
   Result := StrLen( s );
end;

// char *strchr(const char *s, int c);
//function _strchr( const s: PChar; c: Integer ): PChar; cdecl;
//begin
//   Result := StrScan( s, Char(c) );
//end;

// int strcmp(const char *s1, const char *s2);
//function _strcmp( const s1, s2: PChar ): Integer; cdecl;
//begin
//   Result := StrComp( s1, s2 );
//end;

// int strncmp(const char *s1, const char *s2, size_t  maxlen);
function _strncmp( const s1, s2: PChar; maxlen: size_t ): Integer; cdecl;
begin
   Result := StrLComp( s1, s2, maxlen );
end;

// ----------------------------------------------------------------------------

end.


//  [Fehler] uPCRE.pas(403): E2065 Ungenügende Forward- oder External-Deklaration: '__pcre_default_tables'
