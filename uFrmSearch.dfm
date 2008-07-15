object frmSearch: TfrmSearch
  Left = 220
  Top = 156
  Width = 329
  Height = 219
  AutoSize = True
  Caption = 'Search'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object p1: TPanel
    Left = 0
    Top = 151
    Width = 321
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnBeginSearch: TBitBtn
      Left = 24
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Begin'
      TabOrder = 0
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 176
      Top = 8
      Width = 97
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object gbOpts: TGroupBox
    Left = 176
    Top = 41
    Width = 145
    Height = 110
    Align = alRight
    Caption = 'Options'
    TabOrder = 2
    object chkCase: TCheckBox
      Left = 16
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Case sensitive'
      TabOrder = 2
    end
    object chkHeader: TCheckBox
      Left = 16
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Search header'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkBody: TCheckBox
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Search body'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkUseDates: TCheckBox
      Left = 16
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Use Dates'
      TabOrder = 3
      OnClick = chkUseDatesClick
    end
  end
  object gbTime: TGroupBox
    Left = 0
    Top = 41
    Width = 169
    Height = 110
    Align = alLeft
    Caption = 'Time'
    TabOrder = 1
    object lTo: TLabel
      Left = 40
      Top = 48
      Width = 11
      Height = 16
      Caption = 'to'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lFrom: TLabel
      Left = 8
      Top = 19
      Width = 44
      Height = 16
      Caption = 'up from'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object tlDays: TLabel
      Left = 118
      Top = 78
      Width = 32
      Height = 16
      Caption = 'Days'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dtpTo: TDateTimePicker
      Left = 57
      Top = 46
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 37429.8311577894
      Time = 37429.8311577894
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object dtpFrom: TDateTimePicker
      Left = 57
      Top = 16
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 37429.8310802431
      Time = 37429.8310802431
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = dtpChange
    end
    object btnLastDays: TButton
      Left = 17
      Top = 76
      Width = 35
      Height = 20
      Caption = 'Last'
      TabOrder = 3
      OnClick = btnLastDaysClick
    end
    object edLastDays: TEdit
      Left = 57
      Top = 75
      Width = 57
      Height = 21
      TabOrder = 2
      Text = 'edLastDays'
      OnChange = edLastDaysChange
      OnKeyPress = edLastDaysKeyPress
    end
  end
  object p2: TPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 41
    Align = alTop
    TabOrder = 0
    object lSearch: TLabel
      Left = 9
      Top = 12
      Width = 43
      Height = 16
      Caption = 'Search'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edPattern: TEdit
      Left = 56
      Top = 8
      Width = 257
      Height = 21
      TabOrder = 0
    end
  end
end
