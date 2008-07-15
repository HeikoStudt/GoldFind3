object frmConfig: TfrmConfig
  Left = 302
  Top = 127
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configuration'
  ClientHeight = 303
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object vstOptionList: TVirtualStringTree
    Left = 0
    Top = 0
    Width = 185
    Height = 269
    Align = alLeft
    DragOperations = []
    Header.AutoSizeIndex = -1
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
    IncrementalSearch = isAll
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TreeOptions.AutoOptions = [toAutoExpand, toAutoScroll, toAutoScrollOnExpand, toAutoSpanColumns, toAutoTristateTracking, toAutoDeleteMovedNodes]
    TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages]
    TreeOptions.StringOptions = [toSaveCaptions]
    OnCollapsing = vstOptionListCollapsing
    OnFocusChanged = vstOptionListFocusChanged
    OnFocusChanging = vstOptionListFocusChanging
    OnGetText = vstOptionListGetText
    Columns = <
      item
        Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible]
        Position = 0
        Width = 181
      end>
  end
  object pgConfigs: TPageControl
    Left = 185
    Top = 0
    Width = 320
    Height = 269
    ActivePage = ts1
    Align = alClient
    TabOrder = 1
    TabStop = False
    OnChanging = pgConfigsChanging
    object tsText: TTabSheet
      Caption = 'Text'
      ImageIndex = 2
      OnShow = tsTextShow
      object memText: TMemo
        Left = 0
        Top = 0
        Width = 312
        Height = 241
        Align = alClient
        Lines.Strings = (
          'Welcome to the configuration of GoldFind 3.'
          'On the left hand side you can select the thing you want to '
          'configurate. On the bottom of this page and with each database '
          'you can add a new database. You can apply or cancel the '
          'whole changes with "OK" or "Cancel/Abbrechen".'
          ''
          'Please note: Yet the "cancel" do not work.'
          ''
          'A simple (german) text for the format of DateFormat can be get '
          'on "Help" in treeview.')
        TabOrder = 0
      end
    end
    object ts1: TTabSheet
      Caption = 'Databases'
      OnShow = ts1Show
      object Label1: TLabel
        Left = 16
        Top = 192
        Width = 197
        Height = 13
        Caption = 'For NNTP/POP3: '#39'user>>pass@host:port'#39
      end
      object Label2: TLabel
        Left = 16
        Top = 208
        Width = 113
        Height = 13
        Caption = 'For OLE: '#39'Hamster..App'#39
      end
      object Label3: TLabel
        Left = 16
        Top = 224
        Width = 173
        Height = 13
        Caption = 'For Hamster: '#39'C:}hamster\hamster.ini'#39
      end
      object gbSrvName: TGroupBox
        Left = 15
        Top = 8
        Width = 280
        Height = 50
        Caption = 'DB Name'
        TabOrder = 0
        object edSrvName: TEdit
          Left = 8
          Top = 16
          Width = 209
          Height = 21
          TabOrder = 0
          Text = 'Nothing'
        end
      end
      object rgSrvType: TRadioGroup
        Left = 15
        Top = 70
        Width = 280
        Height = 50
        Caption = 'DB Type'
        Columns = 3
        Items.Strings = (
          'Hamster'
          'NNTP'
          'MBOX'
          'Hamster-OLE'
          'POP3')
        TabOrder = 1
      end
      object gbSrvBasepath: TGroupBox
        Left = 15
        Top = 135
        Width = 280
        Height = 50
        Caption = 'Base Path'
        TabOrder = 2
        object edSrvBP: TEdit
          Left = 8
          Top = 20
          Width = 209
          Height = 21
          TabOrder = 0
        end
        object btnSrvSelect: TButton
          Left = 224
          Top = 16
          Width = 51
          Height = 25
          Caption = 'Path'
          TabOrder = 1
          OnClick = btnSrvSelectClick
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'View'
      ImageIndex = 1
      OnShow = ts2Show
      object rgShowFrom: TRadioGroup
        Left = 15
        Top = 8
        Width = 135
        Height = 73
        Caption = 'How to show From'
        Items.Strings = (
          'Complete'
          'Name'
          'Mailaddress')
        TabOrder = 0
      end
      object gbViewDateFormat: TGroupBox
        Left = 160
        Top = 8
        Width = 135
        Height = 73
        Caption = 'Date format'
        TabOrder = 1
        object edViewDateFormat: TEdit
          Left = 8
          Top = 19
          Width = 103
          Height = 21
          TabOrder = 0
          Text = 'DD.MM.YYYY'
          OnChange = edViewDateFormatChange
        end
        object stViewDFBeispiel: TStaticText
          Left = 8
          Top = 48
          Width = 73
          Height = 17
          Caption = 'Beispiel: NOW'
          TabOrder = 1
        end
      end
      object gbFontGrp: TGroupBox
        Left = 15
        Top = 88
        Width = 280
        Height = 41
        Caption = 'Font: Groups'
        TabOrder = 2
        object stFontGrpName: TStaticText
          Left = 7
          Top = 16
          Width = 78
          Height = 17
          Caption = 'stFontGrpName'
          TabOrder = 0
        end
        object stFontGrpSize: TStaticText
          Left = 133
          Top = 16
          Width = 70
          Height = 17
          Alignment = taRightJustify
          Caption = 'stFontGrpSize'
          TabOrder = 1
        end
        object btnFontGrpChange: TButton
          Left = 191
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Change'
          TabOrder = 2
          OnClick = btnFontGrpChangeClick
        end
      end
      object gbFontOver: TGroupBox
        Left = 15
        Top = 134
        Width = 280
        Height = 41
        Caption = 'Font: Overview'
        TabOrder = 3
        object stFontOverName: TStaticText
          Left = 7
          Top = 16
          Width = 84
          Height = 17
          Caption = 'stFontOverName'
          TabOrder = 0
        end
        object stFontOverSize: TStaticText
          Left = 133
          Top = 16
          Width = 76
          Height = 17
          Alignment = taRightJustify
          Caption = 'stFontOverSize'
          TabOrder = 1
        end
        object btnFontOverChg: TButton
          Left = 191
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Change'
          TabOrder = 2
          OnClick = btnFontOverChgClick
        end
      end
      object gbFonArt: TGroupBox
        Left = 15
        Top = 183
        Width = 280
        Height = 41
        Caption = 'Font: Article'
        TabOrder = 4
        object stFontArtName: TStaticText
          Left = 7
          Top = 16
          Width = 74
          Height = 17
          Caption = 'stFontArtName'
          TabOrder = 0
        end
        object stFontArtSize: TStaticText
          Left = 133
          Top = 16
          Width = 66
          Height = 17
          Alignment = taRightJustify
          Caption = 'stFontArtSize'
          TabOrder = 1
        end
        object btnFontArtChg: TButton
          Left = 191
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Change'
          TabOrder = 2
          OnClick = btnFontArtChgClick
        end
      end
    end
    object tsHighlighter: TTabSheet
      Caption = 'Highlighter'
      ImageIndex = 4
      OnShow = tsHighlighterShow
      object gbHighlighter: TGroupBox
        Left = 15
        Top = 8
        Width = 280
        Height = 209
        Caption = 'What to highlight'
        TabOrder = 0
        object cbStrike: TCheckBox
          Left = 16
          Top = 26
          Width = 97
          Height = 17
          Caption = '-X- Strike'
          TabOrder = 0
        end
        object cbItalic: TCheckBox
          Left = 16
          Top = 58
          Width = 97
          Height = 17
          Caption = '/X/ Italic'
          TabOrder = 1
        end
        object cbBold: TCheckBox
          Left = 16
          Top = 90
          Width = 97
          Height = 17
          Caption = '*X* Bold'
          TabOrder = 2
        end
        object cbUnderline: TCheckBox
          Left = 16
          Top = 122
          Width = 97
          Height = 17
          Caption = '_X_ Underline'
          TabOrder = 3
        end
        object cbQuote: TCheckBox
          Left = 136
          Top = 26
          Width = 121
          Height = 17
          Caption = 'Highlight Quote'
          TabOrder = 5
        end
        object cbLink: TCheckBox
          Left = 136
          Top = 58
          Width = 129
          Height = 17
          Caption = 'Highlight Link'
          TabOrder = 6
        end
        object cbSignature: TCheckBox
          Left = 136
          Top = 90
          Width = 129
          Height = 17
          Caption = 'Highlight Signature'
          TabOrder = 7
        end
        object cbHeaderName: TCheckBox
          Left = 136
          Top = 122
          Width = 137
          Height = 17
          Caption = 'Highlight Headername'
          TabOrder = 8
        end
        object cbHTML: TCheckBox
          Left = 16
          Top = 157
          Width = 137
          Height = 17
          Caption = 'Highlight HTML chars'
          TabOrder = 4
        end
      end
    end
    object tsHelpText: TTabSheet
      Caption = 'Help'
      ImageIndex = 3
      OnShow = tsHelpTextShow
      object memHelpText: TMemo
        Left = 0
        Top = 0
        Width = 312
        Height = 241
        Align = alClient
        Lines.Strings = (
          'c'#9'Zeigt das Datum in dem mit der globalen Variable '
          'ShortDateFormat und die Zeit in dem mit der globalen '
          'Variable '
          'LongTimeFormat angegebenen Format an. Hat der '
          'Nachkommaanteil des Parameters DateTime den Wert Null, '
          'wird '
          'die Zeit nicht angezeigt.'
          'd'#9'Zeigt den Tag als Zahl ohne führende Null an '
          '(1-31).'
          'dd'#9'Zeigt den Tag als Zahl mit führender Null an (1-31).'
          'ddd'#9'Zeigt den Tag als Abkürzung an (Son-Sam) und '
          'verwendet dabei die von der globalen Variable '
          'ShortDayNames '
          'angegebenen Strings.'
          ''
          'dddd'#9'Zeigt den Tag als vollständigen Namen an '
          '(Sonntag - '
          'Samstag) und verwendet dabei die von der globalen Variable '
          'LongDayNames angegebenen Strings.'
          'ddddd'#9'Zeigt das Datum in dem von der globalen Variable '
          'ShortDateFormat angegebenen Format an.'
          'dddddd'#9'Zeigt das Datum in dem von der globalen Variable '
          'LongDateFormat angegebenen Format an.'
          'm'#9'Zeigt den Monat als Zahl ohne führende Null an '
          '(1-12). Folgt der Bezeichner m direkt nach der Angabe h oder '
          'hh, '
          'wird statt des Monats die Minute angezeigt.'
          ''
          'mm'#9'Zeigt den Monat als Zahl mit führender Null an '
          '(01-12). '
          'Folgt der Bezeichner mm direkt nach der Angabe h oder hh, '
          'wird '
          'statt des Monats die Minute angezeigt.'
          'mmm'#9'Zeigt den Monat als Abkürzung an (Jan - Dez) und '
          'verwendet dabei die von der globalen Variable '
          'ShortMonthNames angegebenen Strings.'
          'mmmm'#9'Zeigt den Monat als vollständigen Namen an '
          '(Januar - '
          'Dezember) und verwendet dabei die von der globalen '
          'Variable '
          'LongMonthNames angegebenen Strings.'
          'yy'#9'Zeigt das Jahr als zweistellige Zahl an (00-99).'
          ''
          'yyyy'#9'Zeigt das Jahr als vierstellige Zahl an (0000-9999).'
          'h'#9'Zeigt die Stunde ohne führende Null an (0-23).'
          'hh'#9'Zeigt die Stunde mit führender Null an (00-23).'
          'n'#9'Zeigt die Minute ohne führende Null an (0-59).'
          'nn'#9'Zeigt die Minute mit führender Null an (00-59).'
          's'#9'Zeigt die Sekunde ohne führende Null an (0-59).'
          'ss'#9'Zeigt die Sekunde mit führender Null an (00-59).'
          'z'#9'Zeigt die Millisekunde ohne führende Nullen an '
          '(0-999).'
          'zzz'#9'Zeigt die Millisekunde mit führenden Nullen an '
          '(000-999).'
          ''
          't'#9'Zeigt die Zeit in dem von der globalen Variable '
          'ShortTimeFormat angegebenen Format an.'
          'tt'#9'Zeigt die Zeit in dem von der globalen Variable '
          'LongTimeFormat angegebenen Format an.'
          'am/pm'#9'Verwendet das 12-Stunden-Format für den '
          'führenden '
          'Bezeichner h oder hh und zeigt '#39'am'#39' für Zeitangaben vor 12 '
          'Uhr '
          'mittags oder '#39'pm'#39' für Zeitangaben nach 12 Uhr mittags an. '
          'Der '
          'Bezeichner am/pm kann in Groß-, Klein- oder gemischter '
          'Schreibweise angegeben werden und wird dementsprechend '
          'angezeigt.'
          ''
          'a/p'#9'Verwendet das 12-Stunden-Format für den '
          'führenden '
          'Bezeichner h oder hh und zeigt '#39'a'#39' für Zeitangaben vor 12 '
          'Uhr '
          'mittags oder '#39'p'#39' für Zeitangaben nach 12 Uhr mittags an. Der '
          'Bezeichner a/p kann in Groß-, Klein- oder gemischter '
          'Schreibweise angegeben werden und wird dementsprechend '
          'angezeigt.'
          'ampm'#9'Verwendet das 12-Stunden-Format für den '
          'führenden '
          'Bezeichner h oder hh und zeigt für Zeitangaben vor 12 Uhr '
          'mittags den Inhalt der globalen Variablen TimeAMString oder '
          'für '
          'Zeitangaben nach 12 Uhr mittags den Inhalt der globalen '
          'Variable TimePMString an.'
          ''
          '/'#9'Verwendet das mit der globalen Variable '
          'DateSeparator angegebene Datumstrennzeichen.'
          ':'#9'Verwendet das mit der globalen Variablen '
          'TimeSeparator angegebene Zeittrennzeichen.'
          #39'xx'#39'/"xx"'#9'In halbe oder ganze Anführungszeichen '
          'eingeschlossene Zeichen wirken sich nicht auf die '
          'Formatierung '
          'aus und werden wie eingegeben angezeigt.'
          ''
          'Die Formatbezeichner können beliebig in Groß- oder '
          'Kleinbuchstaben angegeben werden, da sich die '
          'Schreibweise '
          'nicht auf das Ergebnis der Formatierung auswirkt.'
          ''
          'Wird im Parameter Format ein leerer String übergeben, wird '
          'der '
          'Wert des Typs TDateTime entsprechend dem '
          'Formatbezeichner '
          #39'c'#39' formatiert.')
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 269
    Width = 505
    Height = 34
    Align = alBottom
    TabOrder = 2
    object btnOK: TBitBtn
      Left = 3
      Top = 5
      Width = 85
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 98
      Top = 5
      Width = 85
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
    object btnNewServer: TButton
      Left = 420
      Top = 5
      Width = 75
      Height = 25
      Caption = 'New'
      TabOrder = 4
      OnClick = btnNewServerClick
    end
    object btnRemove: TButton
      Left = 331
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 3
      OnClick = btnRemoveClick
    end
    object btnHelp: TBitBtn
      Left = 193
      Top = 5
      Width = 85
      Height = 25
      TabOrder = 2
      OnClick = btnHelpClick
      Kind = bkHelp
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 30
    Left = 16
    Top = 224
  end
  object OpenDialog: TOpenDialog
    FileName = 'Hamster.ini'
    Filter = 'Hamster.ini|*.ini|MBox|*.mbox'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 57
    Top = 230
  end
end
