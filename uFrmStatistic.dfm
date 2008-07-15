object frmStatistic: TfrmStatistic
  Left = 194
  Top = 107
  Width = 614
  Height = 395
  Caption = 'Statistics'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 327
    Width = 606
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnExit: TButton
      Left = 511
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Hide'
      TabOrder = 0
      OnClick = btnExitClick
    end
    object btnMake: TButton
      Left = 56
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Make Statistic'
      TabOrder = 1
      OnClick = btnMakeClick
    end
  end
  object p2: TPanel
    Left = 193
    Top = 0
    Width = 413
    Height = 327
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 0
      Width = 3
      Height = 327
      Cursor = crHSplit
    end
    object pcResult: TPageControl
      Left = 3
      Top = 0
      Width = 410
      Height = 327
      ActivePage = tsText
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpBottom
      object tsText: TTabSheet
        Caption = 'Text'
        object mmResult: TMemo
          Left = 0
          Top = 0
          Width = 402
          Height = 299
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
      object tsGrafik: TTabSheet
        Caption = 'Grafic'
        ImageIndex = 1
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 402
          Height = 299
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            'TChart')
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
        end
      end
    end
  end
  object p1: TPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 327
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object lbStatisticlist: TListBox
      Left = 0
      Top = 0
      Width = 193
      Height = 191
      Align = alClient
      ExtendedSelect = False
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbStatisticlistClick
    end
    object pOptions: TPanel
      Left = 0
      Top = 191
      Width = 193
      Height = 136
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object lFrom: TLabel
        Left = 8
        Top = 8
        Width = 35
        Height = 13
        Caption = 'up from'
        Visible = False
      end
      object lTo: TLabel
        Left = 16
        Top = 32
        Width = 9
        Height = 13
        Caption = 'to'
        Visible = False
      end
      object lParam: TLabel
        Left = 8
        Top = 88
        Width = 36
        Height = 13
        Caption = 'Param: '
        Visible = False
      end
      object chkRank: TCheckBox
        Left = 56
        Top = 64
        Width = 129
        Height = 17
        Caption = 'Sort ranking by ratio'
        TabOrder = 0
        Visible = False
      end
      object dtpFrom: TDateTimePicker
        Left = 56
        Top = 8
        Width = 121
        Height = 21
        CalAlignment = dtaLeft
        Date = 37429.8310802431
        Time = 37429.8310802431
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        Visible = False
      end
      object dtpTo: TDateTimePicker
        Left = 56
        Top = 32
        Width = 121
        Height = 21
        CalAlignment = dtaLeft
        Date = 37429.8311577894
        Time = 37429.8311577894
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
        Visible = False
      end
      object edParam: TEdit
        Left = 8
        Top = 108
        Width = 169
        Height = 21
        TabOrder = 3
        Visible = False
      end
    end
  end
end
