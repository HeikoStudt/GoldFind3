object frmAbout: TfrmAbout
  Left = 246
  Top = 291
  BorderStyle = bsSingle
  Caption = 'About...'
  ClientHeight = 293
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgAbout: TImage
    Left = 8
    Top = 8
    Width = 49
    Height = 49
    Picture.Data = {
      07544269746D617076020000424D760200000000000076000000280000002000
      000020000000010004000000000000020000C40E0000C40E0000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00FFFFFF000000000F000000000FFFFFFFFFFFF033033003000330330330FF
      FFFFFFFFF03B0BB0BB303BB0BB0B30FFFFFFFFFFFF03BBBB3000003BBBB30FFF
      FFFFFFFF0000000001F8F1000000000FFFFFFFF03BB000330FF8FF033000BB30
      FFFFFFF0BBBB03B30FF8FF03B30BBBB0FFFFFFF300BB0BB308888803BB0BB003
      FFFFFFFF0BB30BB000000000BB03BB0FFFFFFFFF0B303B03333033330B300B0F
      FFFFFFFF000BB03BBBB0BBBB30BB000FFFFFFFFFF03BB03BBB000BBB30BB300F
      FFFFFFFFF0BBBBBBB00000BBBBBBB0FFFFFFFFFFF0BBBBBBB00000BBBBBBB0FF
      FFFFFFFFF0BBBB03333333330BBBB0FFFFFFFFFFFF3BBB30000B00003BBB01FF
      FFFFFFFFFF30BB08700B00780BB01FFFFFFFFFFFF30BBB08700B00780BBB01FF
      FFFFFFFFF300BB0F800B008F03BB30FFFFFFFFFFF3010BBFFF0B0FFF00BB01FF
      FFFFFFFFFF0110BBF70B07F800000FFFFFFFFFFFFF01110BB00B000001FFFFFF
      FFFFFFFFF0611190BB3B33001FFFFFFFFFFFFFFFF06619990B00001FFFFFFFFF
      FFFFFFFF066EE99990FFFF0FFFFFFFFFFFFFFFF066EEEE000FFFFF0FFFFFFFFF
      FFFFFF066EEE00FF0FFFFF0FFFFFFFFFFFFFF066EEE0FFF0FFFFBFF0FFFFFFFF
      FFFF066EEE09FFF0FFFFBBF0FFFFFFFFFFFF06EEE09FFF00BBBFBFF00FFFFFFF
      FFFFF0EE0FFFF07FFFBBFFFF70FFFFFFFFFFFF00FFFFFFFFFFBFFFFFFFFFFFFF
      FFFF}
    Stretch = True
  end
  object lCopyright: TLabel
    Left = 72
    Top = 35
    Width = 342
    Height = 16
    Caption = '(c) Copyright by Heiko Studt <Heiko.Studt@goldpool.org>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lGF: TLabel
    Left = 72
    Top = 16
    Width = 48
    Height = 13
    Caption = 'GoldFind3'
  end
  object btnOK: TBitBtn
    Left = 8
    Top = 264
    Width = 89
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object mLicense: TMemo
    Left = 0
    Top = 64
    Width = 537
    Height = 193
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    Lines.Strings = (
      'License using GoldFind 3'
      '¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯'
      'The copyright of '#39'GoldFind 3.x'#39' is herbely granted.'
      ''
      
        'The license of '#39'GoldFind 3.x'#39' is "postcardware". This means you ' +
        'can use'
      
        'it as you wish, but you have to write a postcard as "purchase". ' +
        'But even'
      
        'if you have written such a postcard, you won'#39't get any support f' +
        'or this'
      'software. There is no warranty.'
      ''
      'Your postcard have to be send to'
      ''
      '  Heiko Studt'
      '  Suedeschstr. 9'
      '  48429 Rheine'
      '  Germany'
      ''
      
        'Allthough the author don'#39't gurantee any support on this software' +
        ' you can'
      
        'contact him by email to his email-address Heiko.Studt@goldpool.o' +
        'rg.'
      ''
      ''
      
        '================================================================' +
        '============'
      'GoldFind 3'
      
        'Copyright (c) 2002-2008, Heiko Studt (<Heiko.Studt@goldpool.org>' +
        ').'
      ''
      'Heiko Studt'
      'Suedeschstr. 9'
      '48429 Rheine'
      ''
      ''
      'Based upon:'
      'AgtFind.'
      
        'Copyright (c) 1996-2001, Juergen Haible (<juergen.haible@t-onlin' +
        'e.de>).'
      'GoldFind 2'
      
        'Copyright (c) 2002,      Heiko Studt (<Heiko.Studt@goldpool.org>' +
        ').'
      'GoldFind 2'
      'Copyright (c) 2004       Miroslav Sabljic (<mirsablj@inet.hr>)'
      ''
      ''
      ''
      
        'This software is postcardware. You have to send me a postcard if' +
        ' you want'
      'to use it. However you may try it out without sending one.'
      ''
      
        'Permission is hereby granted, with a postcard to me as a charge,' +
        ' to any'
      
        'person obtaining a copy of this software and associated document' +
        'ation files'
      
        '(the "Software"), to deal in the Software without restriction, i' +
        'ncluding '
      
        'without limitation the rights to use, copy, modify, merge, publi' +
        'sh, '
      
        'distribute, but not sell copies of the Software, and to permit p' +
        'ersons '
      
        'to whom the Software is furnished to do so, subject to the follo' +
        'wing '
      'conditions:'
      ''
      
        'The above copyright notice and this permission notice shall be i' +
        'ncluded in'
      'all copies or substantial portions of the Software.'
      ''
      
        'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, ' +
        'EXPRESS OR'
      
        'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT' +
        'ABILITY,'
      
        'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVEN' +
        'T SHALL THE'
      
        'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR' +
        ' OTHER'
      
        'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ' +
        'ARISING'
      
        'FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OT' +
        'HER DEALINGS'
      'IN THE SOFTWARE.'
      
        '================================================================' +
        '============'
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
end
