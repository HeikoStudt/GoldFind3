object frmMainGoldFindWindow: TfrmMainGoldFindWindow
  Left = 63
  Top = 182
  Width = 753
  Height = 445
  Caption = 'GoldFind 3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'GoldFind3.chm'
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object spGroupTree: TSplitter
    Left = 201
    Top = 29
    Width = 4
    Height = 351
    Cursor = crHSplit
    Color = clBtnFace
    MinSize = 20
    ParentColor = False
    ResizeStyle = rsUpdate
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 380
    Width = 745
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 745
    Height = 29
    BorderWidth = 1
    ButtonHeight = 26
    ButtonWidth = 33
    Flat = True
    Images = MainFrm
    Indent = 1
    List = True
    TabOrder = 0
    Transparent = True
    object tbTreeView: TToolButton
      Left = 1
      Top = 0
      AutoSize = True
      Caption = 'Build tree'
      ImageIndex = 8
      MenuItem = mnuCfgBuildTree
      Style = tbsCheck
    end
    object tbChart3D: TToolButton
      Left = 32
      Top = 0
      Hint = 'Show chart in 3D'
      AllowAllUp = True
      Caption = '3D-Chart'
      ImageIndex = 36
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      OnClick = mnuChartin3DClick
    end
  end
  object pGroupTree: TPanel
    Left = 0
    Top = 29
    Width = 201
    Height = 351
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object pnlCombo: TPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lSrc: TLabel
        Left = 178
        Top = 3
        Width = 20
        Height = 16
        Caption = '&Src'
        FocusControl = cbRootElements
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cbRootElements: TComboBox
        Left = 1
        Top = 2
        Width = 176
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnClick = cbRootElementsClick
        OnKeyPress = cbRootElementsKeyPress
      end
    end
    object vstGroupTree: TVirtualStringTree
      Left = 0
      Top = 26
      Width = 201
      Height = 325
      Align = alClient
      AutoExpandDelay = 1
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      ButtonFillMode = fmWindowColor
      CheckImageKind = ckXP
      DrawSelectionMode = smBlendedRectangle
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Sans Serif'
      Header.Font.Style = []
      Header.Height = 10
      Header.Options = [hoAutoResize, hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack]
      HintAnimation = hatNone
      HintMode = hmTooltip
      Images = FolderIC
      IncrementalSearch = isAll
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoSpanColumns, toAutoTristateTracking]
      TreeOptions.MiscOptions = [toInitOnSave, toWheelPanning]
      TreeOptions.PaintOptions = [toShowButtons, toShowRoot, toShowTreeLines, toThemeAware]
      TreeOptions.SelectionOptions = [toExtendedFocus, toMultiSelect, toRightClickSelect]
      TreeOptions.StringOptions = [toSaveCaptions, toShowStaticText]
      OnDblClick = vstGroupTreeDblClick
      OnGetText = vstGroupTreeGetText
      OnPaintText = vstGroupTreePaintText
      OnGetImageIndex = vstGroupTreeGetImageIndex
      OnKeyPress = vstGroupTreeKeyPress
      Columns = <
        item
          Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible]
          Position = 0
          Style = vsOwnerDraw
          Width = 199
        end>
    end
  end
  object pcState: TPageControl
    Left = 205
    Top = 29
    Width = 540
    Height = 351
    ActivePage = tsStatistics
    Align = alClient
    TabOrder = 3
    object tsArticles: TTabSheet
      Caption = '&Articles'
      object p1: TPanel
        Left = 0
        Top = 0
        Width = 532
        Height = 323
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object spViewers: TSplitter
          Left = 0
          Top = 135
          Width = 532
          Height = 5
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Color = clBtnFace
          MinSize = 15
          ParentColor = False
          ResizeStyle = rsUpdate
        end
        object pArtView: TPanel
          Left = 0
          Top = 140
          Width = 532
          Height = 183
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object pOneOverview: TPanel
            Left = 0
            Top = 0
            Width = 532
            Height = 40
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lFrom: TLabel
              Left = 3
              Top = 2
              Width = 32
              Height = 13
              Caption = 'From:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lFromContent: TLabel
              Left = 37
              Top = 2
              Width = 3
              Height = 13
            end
            object lNewsgroups: TLabel
              Left = 104
              Top = 3
              Width = 74
              Height = 13
              Caption = 'Newsgroups:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lNewsgroupsContent: TLabel
              Left = 178
              Top = 3
              Width = 3
              Height = 13
            end
            object lSubject: TLabel
              Left = 3
              Top = 21
              Width = 48
              Height = 13
              Caption = 'Subject:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lSubjectContent: TLabel
              Left = 52
              Top = 21
              Width = 3
              Height = 13
            end
            object lDate: TLabel
              Left = 104
              Top = 21
              Width = 32
              Height = 13
              Caption = 'Date:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lDateContent: TLabel
              Left = 140
              Top = 21
              Width = 3
              Height = 13
            end
            object shRed: TShape
              Left = 0
              Top = 37
              Width = 532
              Height = 3
              Align = alBottom
              Brush.Color = clRed
              Pen.Style = psClear
              Pen.Width = 0
            end
            object shRight: TShape
              Left = 515
              Top = 0
              Width = 19
              Height = 37
              Brush.Color = clBtnFace
              Pen.Color = clRed
              Pen.Style = psClear
              Pen.Width = 2
            end
          end
          object rxreMessage: TRxRichEdit
            Left = 0
            Top = 40
            Width = 532
            Height = 121
            Align = alClient
            AutoVerbMenu = False
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Lucida Sans Unicode'
            Font.Style = []
            HideSelection = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            UndoLimit = 1
            WordWrap = False
            OnKeyPress = rxreMessageKeyPress
          end
          object tcArtView: TTabControl
            Left = 0
            Top = 161
            Width = 532
            Height = 22
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HotTrack = True
            MultiLine = True
            ParentFont = False
            RaggedRight = True
            TabHeight = 17
            TabOrder = 2
            TabPosition = tpBottom
            Tabs.Strings = (
              '-1: &Raw'
              '1: &Body'
              '0: &Header')
            TabIndex = 0
            OnChange = tcArtViewChange
          end
        end
        object vstArticlesView: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 532
          Height = 135
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Lucida Sans Unicode'
          Font.Style = []
          Header.AutoSizeIndex = 5
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Header.Options = [hoColumnResize, hoHotTrack, hoShowImages, hoShowSortGlyphs, hoVisible]
          Header.Style = hsFlatButtons
          HintAnimation = hatNone
          IncrementalSearch = isAll
          LineMode = lmBands
          LineStyle = lsSolid
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoTristateTracking]
          TreeOptions.MiscOptions = [toInitOnSave, toWheelPanning]
          TreeOptions.PaintOptions = [toShowButtons, toShowRoot, toShowTreeLines, toThemeAware]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
          OnCompareNodes = vstArticlesViewCompareNodes
          OnDblClick = vstArticlesViewDblClick
          OnExpanded = vstArticlesViewExpanded
          OnFocusChanged = vstArticlesViewFocusChanged
          OnGetText = vstArticlesViewGetText
          OnHeaderClick = vstArticlesViewHeaderClick
          OnInitChildren = vstArticlesViewInitChildren
          OnKeyPress = vstArticlesViewKeyPress
          Columns = <
            item
              Position = 0
              Width = 190
              WideText = 'Subject'
            end
            item
              Position = 1
              Width = 107
              WideText = 'From'
            end
            item
              Position = 2
              Width = 91
              WideText = 'Date'
            end
            item
              Position = 3
              Width = 62
              WideText = 'Size'
            end>
        end
      end
    end
    object tsStatistics: TTabSheet
      Caption = 'Stat&istics'
      ImageIndex = 1
      object pOptions: TPanel
        Left = 0
        Top = 0
        Width = 532
        Height = 81
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object p4: TPanel
          Left = 2
          Top = 2
          Width = 159
          Height = 77
          Align = alLeft
          TabOrder = 0
          object lStatFrom: TLabel
            Left = 3
            Top = 7
            Width = 44
            Height = 16
            Alignment = taRightJustify
            Caption = 'up fr&om'
            FocusControl = dtpFrom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lStatTo: TLabel
            Left = 35
            Top = 32
            Width = 11
            Height = 16
            Alignment = taRightJustify
            Caption = '&to'
            FocusControl = dtpTo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object tlDays: TLabel
            Left = 111
            Top = 56
            Width = 32
            Height = 16
            Caption = '&Days'
            FocusControl = edLastDays
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dtpFrom: TDateTimePicker
            Left = 49
            Top = 5
            Width = 97
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
          object dtpTo: TDateTimePicker
            Left = 49
            Top = 29
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 37429.8311577894
            Time = 37429.8311577894
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
            OnChange = dtpChange
          end
          object edLastDays: TEdit
            Left = 49
            Top = 53
            Width = 57
            Height = 21
            TabOrder = 2
            Text = 'edLastDays'
            OnChange = edLastDaysChange
            OnKeyPress = edLastDaysKeyPress
          end
          object btnLastDays: TButton
            Left = 12
            Top = 54
            Width = 35
            Height = 20
            Caption = '&Last'
            TabOrder = 3
            OnClick = btnLastDaysClick
          end
        end
        object p5: TPanel
          Left = 161
          Top = 2
          Width = 291
          Height = 77
          Align = alClient
          TabOrder = 1
          object lParam: TLabel
            Left = 7
            Top = 33
            Width = 46
            Height = 16
            Caption = '&Param: '
            FocusControl = edParam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lStati: TLabel
            Left = 6
            Top = 11
            Width = 46
            Height = 16
            Caption = 'St&atistic'
            FocusControl = cbStatiList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cbStatiList: TComboBox
            Left = 64
            Top = 8
            Width = 216
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
            OnChange = cbStatiListChange
          end
          object chkRank: TCheckBox
            Left = 144
            Top = 54
            Width = 137
            Height = 17
            Caption = 'Sort ranking by &ratio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object edParam: TEdit
            Left = 16
            Top = 52
            Width = 120
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
        end
        object p6: TPanel
          Left = 452
          Top = 2
          Width = 78
          Height = 77
          Align = alRight
          TabOrder = 2
          object btnMake: TBitBtn
            Left = 11
            Top = 11
            Width = 57
            Height = 57
            Anchors = [akRight, akBottom]
            Caption = '&Make'
            TabOrder = 0
            OnClick = btnMakeClick
            Glyph.Data = {
              46020000424D460200000000000076000000280000001D0000001D0000000100
              040000000000D001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              777777777777777770007777777777777777777777777777700077777777770F
              FFFFFFFFFFFFFF07700077777777770FFFFFFFFFFFFFFF07700077777777770F
              FFFFFFFFFFFFFF07700077777777770FFFFFFFFFFFFFFF07700077777777770F
              F0F0F0F0FF0F0F07700077777777770F00F0F0F0FF0F0F07700077777777770F
              F000F0F0FF0F0F07700077777777770FF0F000F0FF0F0F07700077777777770F
              F0F0F000FF0F0F07700077777777770FF0F0F0F00F0F0F07700077777777770F
              F0F0F0F0FF0F0F0770007777777770BBFFFFFFFFFFFFFF07700077777777010B
              BFFFFFFFFFFFFF077000777777770110BBFFFFFFFFF000077000777777770111
              0BBFFFFFFFF0F077700077777770611190BBFFFFFFF007777000777777706619
              990B0000000077777000777777066EE99990777777777777700077777066EEEE
              000777777777777770007777066EEE0077777777777777777000777066EEE077
              7777777777777777700077066EEE0977777777777777777770007706EEE09777
              777777777777777770007770EE07777777777777777777777000777700777777
              7777777777777777700077777777777777777777777777777000777777777777
              77777777777777777000}
            Layout = blGlyphTop
          end
        end
      end
      object pcResult: TPageControl
        Left = 0
        Top = 81
        Width = 532
        Height = 242
        ActivePage = tsText
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 1
        OnChange = pcResultChange
        object tsText: TTabSheet
          Caption = 'Te&xt'
          object mmResult: TMemo
            Left = 0
            Top = 0
            Width = 524
            Height = 214
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
        object tsGraphic: TTabSheet
          Caption = '&Graphic'
          ImageIndex = 1
          object Chart: TChart
            Left = 0
            Top = 0
            Width = 524
            Height = 214
            AllowPanning = pmNone
            AnimatedZoom = True
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            Foot.AdjustFrame = False
            Foot.Visible = False
            Gradient.EndColor = clRed
            Title.Text.Strings = (
              '_')
            BottomAxis.DateTimeFormat = 'dd.MM.yyyy'
            BottomAxis.Inverted = True
            BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
            BottomAxis.Title.Font.Color = clBlue
            BottomAxis.Title.Font.Height = -11
            BottomAxis.Title.Font.Name = 'Arial'
            BottomAxis.Title.Font.Style = []
            LeftAxis.Title.Caption = 'Messages'
            LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
            LeftAxis.Title.Font.Color = clBlue
            LeftAxis.Title.Font.Height = -11
            LeftAxis.Title.Font.Name = 'Arial'
            LeftAxis.Title.Font.Style = []
            Legend.Color = 8454016
            Legend.Frame.Visible = False
            Legend.LegendStyle = lsSeries
            Legend.ShadowColor = clGreen
            RightAxis.Labels = False
            TopAxis.Labels = False
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            PopupMenu = popupChart
            TabOrder = 0
            object serieDemo: TFastLineSeries
              Marks.ArrowLength = 8
              Marks.Style = smsValue
              Marks.Transparent = True
              Marks.Visible = False
              SeriesColor = clRed
              ShowInLegend = False
              VertAxis = aBothVertAxis
              LinePen.Color = clRed
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
          end
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Images = ImgListMenu
    Left = 264
    object mnuTopFile: TMenuItem
      Caption = '&File'
      SubMenuImages = ImgListMenu
      object mnuAddHamDB: TMenuItem
        Caption = '&Open Archive'
        object mnuAddDBHamster: TMenuItem
          Caption = '&Hamster'
          OnClick = mnuAddDBHamsterClick
        end
        object mnuHamsterOLE: TMenuItem
          Caption = 'Hamster-&OLE'
          OnClick = mnuAddHamsterOLEClick
        end
        object mnuMBX: TMenuItem
          Caption = '&Unix-MBX'
          OnClick = mnuAddMBXClick
        end
        object mnuAddNNTP: TMenuItem
          Caption = '&NNTP'
          OnClick = mnuAddNNTPClick
        end
        object POP31: TMenuItem
          Caption = '&POP3'
          OnClick = POP31Click
        end
      end
      object mnuSearch: TMenuItem
        Caption = '&Search'
        ImageIndex = 4
        ShortCut = 16454
        OnClick = mnuSearchClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = 'E&xit'
        ImageIndex = 2
        OnClick = mnuExitClick
      end
    end
    object mnuEdit: TMenuItem
      Caption = '&Edit'
      object SelectAll1: TMenuItem
        Action = actEditSelectAll
        Caption = 'Select &All'
      end
      object Copy1: TMenuItem
        Action = actEditCopy
        Caption = '&Copy'
      end
    end
    object mnuTopConfig: TMenuItem
      Caption = '&Config'
      object mnuMainConfig: TMenuItem
        Caption = '&Main Configuration'
        ImageIndex = 7
        ShortCut = 16461
        OnClick = mnuMainConfigClick
      end
      object mnuCfgBuildTree: TMenuItem
        Caption = 'Build &tree'
        ImageIndex = 8
        ShortCut = 16468
        OnClick = mnuCfgBuildTreeClick
      end
      object mnuChartin3D: TMenuItem
        Caption = 'Chart in 3D'
        ImageIndex = 6
        OnClick = mnuChartin3DClick
      end
    end
    object mnuTopHelp: TMenuItem
      Caption = '&Help'
      object mnuHelpContent: TMenuItem
        Caption = '&Content'
        ImageIndex = 0
        ShortCut = 112
        OnClick = mnuHelpContentClick
      end
      object mnuHelpAbout: TMenuItem
        Caption = '&About'
        ImageIndex = 1
        ShortCut = 8304
        OnClick = mnuHelpAboutClick
      end
    end
  end
  object GroupTreeImages: TImageList
    Left = 10
    Top = 63
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600008484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600008484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000084000000840000008400000084000000840000008400
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600008484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600008484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600008484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600008484000000000000000000FFFFFF00840000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600008484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00000000008484840000000000000000000000
      000000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C60084848400848484008484840084848400848484008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000008400C6C6C6000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0084848400FFFFFF00C6C6C60084848400000000000000
      000000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C60084848400000000008484840084848400848484008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000008400000084
      0000008400008400000084000000840000008400000084000000008400000000
      00000000FF000000FF000000840000000000000000000000000000FFFF0000FF
      FF000084840000848400FFFFFF00C6C6C600FFFFFF00008484000084840000FF
      FF0000FFFF0000000000000000000000000000000000FFFFFF0000000000C6C6
      C600FFFFFF0084848400FFFFFF00FFFFFF000000000000000000848484000000
      000000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C60084848400000000008484840084848400848484008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000084000000FF000000FF
      000000FF0000008400000000000084000000840000008400000084000000C6C6
      C6000000FF00000084000000000000000000000000000000000000FFFF000084
      840000FFFF00000000000000000000000000000000000000000000FFFF000084
      840000FFFF000000000000000000000000000000000000000000C6C6C600FFFF
      FF0084848400FFFFFF00FFFFFF00000000000000000000000000000000008484
      840000000000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C60084848400000000000000000084848400848484008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000FF000000FF000000FF
      000000FF000000FF00000000000084000000000000008484000000000000C6C6
      C6008484840000840000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000084848400000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C6008484840084848400848484008484840084848400848484008484
      840084848400C6C6C600C6C6C6000000000000840000FFFFFF0000FF000000FF
      000000FF000000FF00000084000084840000FFFF0000FFFF0000FFFF00008484
      00000084000000840000008400000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000848484000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000FFFFFF0000FF000000FF000000FF
      000000FF00000084000084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      00000000000000840000008400000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000FFFFFF00C6C6C600C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600C6C6C60000000000C6C6C60000FF000000FF000000FF
      000084840000FF00000084848400FFFF0000FFFFFF00FFFF0000FFFF0000FFFF
      0000000000000084000000840000000000000000000000000000000000000000
      000000FFFF00C6C6C6000000000000FFFF0000000000C6C6C60000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000C6C6C60000000000FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF00C6C6C600C6C6C60000000000FFFF0000C6C6C600FFFFFF000084
      0000848400008484000084840000C6C6C600FFFF0000FFFF0000FFFF00008484
      00000084000000840000008400000000000000000000000000000084840000FF
      FF0000848400FFFFFF000000000000FFFF0000000000FFFFFF000084840000FF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00C6C6C600C6C6C600FFFF
      FF0000000000FFFFFF000000000000000000FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FF000000FF00000000000000000000000000000000FFFF000000
      0000FFFFFF00C6C6C600C6C6C60000000000FFFFFF00FFFF000000840000FFFF
      00008484000084840000848400008484000084848400FFFF0000848484000084
      0000C6C6C6000084000000840000000000000000000000000000000000000000
      000000000000C6C6C6008484840000FFFF0084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000008484840000000000FFFFFF0084848400C6C6C600C6C6C600FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FF0000000000000000FFFF000000
      0000FFFFFF00C6C6C600C6C6C6000000000084848400FFFF0000FFFF0000FFFF
      00000084000084840000848400008484000000FF000084000000840000008400
      0000C6C6C600C6C6C60000840000000000000000000000000000000000000000
      000000000000000000000084840000FFFF000084840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000FFFFFF0084848400FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C6000000000084848400FFFFFF00FFFF00000084
      000000840000FF0000008484000084840000848400008484000000FF00008400
      0000840000000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF0000000000008400000000
      0000FFFFFF00C6C6C600C6C6C6000000000000000000C6C6C600C6C6C6000084
      00000084000000840000FF000000848400008484000084840000848400008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF0000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600000000000000000000000000FFFFFF00C6C6
      C600008400000084000000840000FF0000000084000084840000848400008400
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF0000FF000000FF000000FF00000084000000840000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00008484840084848400FFFFFF0000FF000000FF000000FF0000008400000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF000000000001FFFF0000000000010003000000000001000300000000
      0001000300000000000100030000000000010003000000000001000300000000
      00010003000000000001000300000000000100030000000080FFFFFF00000000
      C1FFFFFF00000000FFFFFFFF00000000E00FF8FF0000FC3DC007F07F0000E008
      C007C03F0000C0018003801F00008003C007800F00008001C007000700000001
      C007000300000000C007000100000000E00F800100000000C007800300000000
      E80FC00700000001F83FE00F00000001FFFFF01F00008001FFFFF83F0000C003
      FB3FFC7F0000E007F6DFFEFF0000F01F00000000000000000000000000000000
      000000000000}
  end
  object ImgListMenu: TImageList
    Left = 299
    Top = 65535
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000FFFFFF00FFFFFF00FFFFFF00840084008400
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      00000000000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840084848400848484008484
      840000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000FF000000FF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000FFFFFF00FFFFFF00FFFFFF00008400000084
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      00000000000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BABABA0000000000000000000000000000000000000000000000
      0000BDBEBE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF0000FF
      FF0000000000000000000000000000000000C6C6C60000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF008484840000000000000000000000000000000000FCB3
      B40087424200000000009D9E9E000000000000000000000000009494F9000605
      CE0000000000B2B2B20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400C6C6C6000000840000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600FF00
      000000FF0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600FFFFFF000000000000000000FBC0C000FCB7B800FEAE
      AE0087424200713838000000000000000000ABABF8009A9AF8008989FA000505
      C5000505C00000000000A7A6A600000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000808000008080000080
      800000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000000000C6C6C60000000000008484000084840000FF
      FF0000FFFF00000000000000000000000000C6C6C600C6C6C600C6C6C60000FF
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000008484
      84000000000084848400C6C6C60000000000FBC4C400FCBBBB00FCB1B200FEA8
      A8007E3E3E00572B2C003A1E1E00AFAFF700A0A0F8008F8FF9007D7DFA000405
      BA000404B5000404B100000000009B9B9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      800000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF00000000000000000000000000000000000000000000FFFF000084
      840000FFFF00000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400FFFFFF00000000000000000000000000FCBEBE00FDB4B500FDACAC00FEA2
      A200633131003E202000330000000101AA009494F9008384F9007372FB000304
      AF000303AB000303A70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      80000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FF
      FF0000000000000000000000000000000000C6C6C600C6C6C600C6C6C6008400
      840000FF0000C6C6C600C6C6C600000000000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C60000000000FCB8B800FDB0AF00FEA6A600FBEF
      EF007B4040003A1E1E003300000001018700000000007778FB00ACACFC000302
      A5000303A10002039C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      80000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000C6C6C600C6C6C600C6C6C60000FF
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400FFFFFF00C6C6C6000000000000000000FDB3B300FBEFEF00FCE3E300FCDD
      DE00FED8D7007B404000000000006ADFFC000099FF00000000009E9DF9009696
      F900020296000101920022000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      80000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000084840000FFFF0000FF
      FF0000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C6000000000000FFFF0000000000FCE4E400FCE1E200FDDCDC00FDD5
      D600000000009CE7FA0075E1FB004FDAFC000099FF000192F200000000008D8D
      FA008585F9000102890000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00C6C6C6000000000000FFFF0000000000C6C6C60000FFFF000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600FF00
      000000FF0000C6C6C600C6C6C600000000000000000000000000000000008484
      840000000000C6C6C60000FFFF000000000000000000FDDADA00FED3D300FECE
      CD00A5E8FA0080E2FB005ADCFC0033D5FD000193F5000189E300027FD3000000
      00007C7CFA000000000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000008484000000
      000000FFFF00000000000000000000FFFF0000000000000000000084840000FF
      FF0000000000000000000000000000000000C6C6C600C6C6C600C6C6C60000FF
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C60000FFFF00000000000000000000000000FFCCCC00FFCC
      CC008CE4FA0064DDFB003ED7FD0017D0FE00018BE7000281D6000377C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      84000000000000FFFF008484840000FFFF0084848400C6C6C600000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FFFF00000000000000000000000000000000000000
      00006FE0FB0049D9FD0022D2FE00CCF8F8000282D9000278C600046FB6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000000000FFFF0000FFFF000084840000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      FF0000FF0000C6C6C600C6C6C60000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C60000FFFF00000000000000000000000000000000000000
      000054DBFD00CCF8F800A3F5F50099F5F60077F8F8000470B900046BB0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      000000000000000000000000000000000000000000000000000084840000FFFF
      00000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C60000FF
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FFFF00000000000000000000000000000000000000
      0000A3F5F500A3F5F50091F6F7006FF8F9004CFBFA0027FCFC00046BB0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000084840000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000FFFF00000000000000000000000000000000000000
      00000000000089F7F60065F9F90042FBFB001EFDFD0003FFFE00000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000000000000C0C0C00000000000C0C0C00000000000C0C0
      C00000000000C0C0C000000000000000000084840000FFFF0000FFFF00000000
      FF000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000C6C6C600FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000FFFF00000000000000000000000000000000000000
      0000000000000000000039FBFB0016FEFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000000000000FFFF0000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000840000008400000084000000840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      84000000FF000000FF000000FF000000FF000000FF000000FF000000FF008484
      8400848484008484840000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF0084848400848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000084008484840000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      84008484840000000000000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF008484840084848400000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF008484840000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60084848400848484000000000000000000000084000000FF000000FF000000
      FF00FFFFFF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF0084848400000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF008484840000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00848484008484840000000000000084000000FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF0084848400848484000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF008484840000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF0000008400848484000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000FFFF008484840000FFFF00000000000000
      000000000000000000000000000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF0000008400848484000000000000000000000000000000
      000000000000000084000000000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF008484840000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF0000008400848484000000000000000000000000000000
      00008484000000008400000084000000000000FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF0000008400000000000000000000000000000000000000
      000084840000FFFF00000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000084000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF0084848400000000000000000000000000000000008484
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000000000FF000000FF000000
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000084000000000000000000000000000000000084840000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000FFFF0000FFFF
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000084000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000FF000000FF000000FF000000FF0000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C003000000000000DC03000000000000
      DC03000000000000DFFF000000000000DFF0000000000000DFF0000000000000
      DF00000000000000DF70000000000000DF70000000000000DF7F000000000000
      DC03000000000000DC03000000000000C003000000000000DC03000000000000
      DC03000000000000DFFF000000000000E10F0000F3E7FFFFC0070000C183E7DF
      C00700000001C38F828300000000C38FC00700000001C38FC00700000001C38F
      C00700000001C38FC00700000001C38FE00F00008003E78FC4470000C00FE7DF
      E00F0000F00FE7DFC03F0000F00FE7DFC1FF0000F00FE7D987FF0000F81FE421
      0B3F0000FC7FE40336DF0000FFFFE487FFFFFFBFFC3FFFFFFEFFFF3FF00FFC01
      FC7FFE3FE003FC01DC3FF80FC003FC01EC3FE0078001FC01F83FC0030001FC01
      F83F80010000FC01F81F00010000F801F01F00010000F001900B00010000F003
      F00F00010001E07FF00F00010001E0FFF01F00038003C3FFE83F8007800787FF
      DFFFC00FC00FDFFFFFFFF01FF01FFFFF00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    FileName = 'Hamster.ini'
    Filter = 'Hamster.ini|*.ini'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 193
    Top = 65534
  end
  object FolderIC: TImageList
    Height = 17
    Left = 44
    Top = 62
    Bitmap = {
      494C010129002C00040010001100FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000BB000000010020000000000000BB
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400C6C6C6000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000084840000848400FFFFFF00C6C6C600FFFFFF00008484000084840000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF00000000000000000000000000000000000000000000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FFFF00000000000000000000FFFF0000FF
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF0000FFFF00C6C6C6000000000000FFFF0000000000C6C6C60000FFFF0000FF
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF0000000000FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF000000000000FF
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484840000000000000000000000000000000000000000008484
      8400FFFF0000FFFF000084848400000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000000000000000000000000084848400FFFF
      0000FFFF00008484840000000000000000000000000000000000000000008484
      8400FFFF0000FFFF000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000840000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00848484000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000848484000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00000084000000FF000000FF0000008400FFFFFF00FFFF
      FF00FFFFFF00848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00848484000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0084848400000084000000840084848400FFFFFF00FFFF
      FF00FFFFFF00848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF008484840000FFFF00C6C6C60084848400FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF00FFFFFF00848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF008484840000FFFF00FFFFFF0000FFFF00C6C6C60084848400FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00848484000000000000000000000000000000000084848400FFFF
      FF008484840000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00C6C6C6008484
      8400FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000848484008484
      840000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF0000FFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484000000000000000000000000008484840000FF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00848484000000000000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF008484840000000000000000000000000084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0084848400000000008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000FFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000848484008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00848484000000000084848400FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      8400000000000000FF008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000FF008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF000000FF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF008484840000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0084848400000000000000000084848400FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840000000000000000008484840000FFFF000000
      FF000000FF000000FF000000FF000000FF0000FFFF0084848400848484008484
      84008484840084848400848484000000000000000000848484000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0084848400848484008484
      8400848484008484840084848400000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000FFFFFF0084848400848484008484
      8400848484008484840084848400000000000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84008484840084848400848484000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF000000FF000000FF000000FF000000FF008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000000000000000000084848400FFFF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6000000000084848400000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C600848484000000000084848400000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000008484840084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00000000008484840084848400000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840000000000C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840000000000C6C6C60084848400000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000FFFF0084848400000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60084848400000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF0000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF0084848400848484008484
      8400848484008484840084848400000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
      8400848484008484840084848400000000000000000084848400FFFFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C600FFFFFF0084848400848484008484
      8400848484008484840084848400000000000000000084848400C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60084848400848484008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF00FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600FFFF00008484840000000000000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000C6C6C600FFFF00008484840000000000000000000000000084848400FFFF
      FF0000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C60000FF00008484840000000000000000000000000084848400FFFFFF0000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF
      0000C6C6C60000FF000084848400000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000C6C6C6000000000084848400000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600FFFF0000C6C6C60084848400000000000000000084848400FFFFFF0000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF
      0000C6C6C6000000000084848400000000000000000084848400FFFFFF00C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C60000FF0000C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600848484000000000084848400000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000C6C6C600FFFF00008484840000000000000000008484840000FF0000C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C600848484000000000084848400000000000000000084848400FFFFFF0000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF
      0000C6C6C60000FF0000848484000000000084848400FFFFFF00C6C6C600FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000000000008484840084848400000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600FFFF0000C6C6C600848484000000000084848400FFFFFF00C6C6C60000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF
      0000000000008484840084848400000000000000000084848400FFFFFF00C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C60000FF0000C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840000000000C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000C6C6C600FFFF0000848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840000000000C6C6C60084848400000000000000000084848400FFFFFF0000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF
      0000C6C6C60000FF000084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400FFFF000084848400000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600FFFF0000C6C6C60084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000FF000084848400000000000000000084848400FFFFFF00C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C60000FF0000C6C6C60084848400000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600FFFF0000C6C6C60084848400000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000C6C6C600FFFF000084848400000000000000000084848400FFFFFF00C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C60000FF0000C6C6C60084848400000000000000000084848400FFFFFF0000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF
      0000C6C6C60000FF000084848400000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF0000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFFFF0084848400848484008484
      8400848484008484840084848400000000000000000084848400C6C6C600FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C60084848400848484008484
      8400848484008484840084848400000000000000000084848400FFFFFF00C6C6
      C60000FF0000C6C6C60000FF0000C6C6C600FFFFFF0084848400848484008484
      8400848484008484840084848400000000000000000084848400C6C6C60000FF
      0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60084848400848484008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C6008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C60000FF0000C6C6C60000FF0000C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000840000C6C6C600C6C6C600C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000840000C6C6C600C6C6C600C6C6C6008484
      8400848484000000000000000000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000000000000000000000000084848400C6C6C60000FF0000C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C600008400000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C60000840000008400000084000000840000C6C6C6008484
      8400848484008484840000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C60000840000008400000084000000840000C6C6C6008484
      8400848484008484840000000000000000008484840000FF000000FF000000FF
      000000FF0000FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      0000008400000084000000000000000000008484840084848400C6C6C6008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400008400000084000000000000000000000000000000000000000000008484
      8400C6C6C60000840000C6C6C60000840000C6C6C60000840000C6C6C6008484
      8400848484008484840000000000000000000000000000000000000000008484
      8400C6C6C60000840000C6C6C60000840000C6C6C60000840000C6C6C6008484
      8400848484008484840000000000000000008484840000FF000000FF000000FF
      0000FFFFFF00000000000000000084848400FFFFFF0000FF000000FF000000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000840000008400000084000000000000000000000000000084848400C6C6
      C600C6C6C60000840000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840084848400848484000000000000000000000000000000000084848400C6C6
      C600C6C6C60000840000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484008484840000000000000000008484840000FF0000FFFFFF00FFFF
      FF000000000000FF0000C6C6C60000FF000084848400FFFFFF00FFFFFF0000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000840000008400000084000000000000000000000000000084848400C6C6
      C600008400000084000000840000C6C6C6000084000000840000C6C6C6008484
      840084848400848484000000000000000000000000000000000084848400C6C6
      C600008400000084000000840000C6C6C6008484840084848400848484000000
      00008484840084848400000000000000000084848400FFFFFF00848484000000
      000000840000008400000084000000840000008400008484840084848400FFFF
      FF00008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000840000008400000084000000000000000000000000000084848400C6C6
      C600C6C6C60000840000C6C6C600C6C6C6000084000000840000C6C6C6008484
      840084848400848484008484840000000000000000000000000084848400C6C6
      C600C6C6C600008400008484840084848400C6C6C600C6C6C600C6C6C6008484
      8400848484000000000084848400000000000000000084848400008400000084
      000000840000C6C6C60000FF0000C6C6C60000FF000000000000000000000000
      0000FFFFFF0000840000008400000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000840000008400000084000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000084000000840000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484008484840000000000000000000000000084848400C6C6
      C6008484840084848400C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840084848400000000000000000000000000848484000084
      000000840000C6C6C600C6C6C60000FF000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000084000000000000000000008484840000FF000000FF
      000000FF000000FF000000FF000000FF000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000084000000840000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF0084848400C6C6C600C6C6C600C6C6
      C600FFFFFF00FFFFFF0084848400000000000000000084848400848484008484
      8400C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600FFFFFF00FFFFFF0084848400000000000000000000000000000000008484
      840000840000C6C6C60000FF000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000000000008484840000FF
      000000FF000000FF000000FF000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000840000000000000000000084848400C6C6C600C6C6
      C600FFFFFF00FFFFFF00000000008484840084848400C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF00000000000000000084848400C6C6C600C6C6
      C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000000000000000
      000084848400848484008484840000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000008484
      840000FF000000FF000000FF000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000FF0000000000000000000084848400FFFFFF00FFFF
      FF0084848400848484000000000084848400C6C6C600C6C6C600C6C6C600FFFF
      FF00FFFFFF008484840084848400000000000000000084848400FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000084848400848484008484840000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000000000008484840084848400FFFF
      FF00FFFFFF008484840000000000C6C6C600C6C6C600FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400C6C6C600C6C6C600C6C6C600C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000000000000000000000000084848400C6C6C60000FF0000C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C600008400000000000000000000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000000000000000000000000084848400C6C6C60000FF0000C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C600008400000000000000000000000000008484840000FF000000FF000000FF
      000000FF0000FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      0000008400000084000000000000000000008484840084848400C6C6C6008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400008400000084000000000000000000008484840000FF000000FF000000FF
      000000FF0000FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      0000008400000084000000000000000000008484840084848400C6C6C6008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400008400000084000000000000000000008484840000FF000000FF000000FF
      0000FFFFFF00000000000000000084848400FFFFFF0000FF000000FF000000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      0000FFFFFF00000000000000000084848400FFFFFF0000FF000000FF000000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008400000084000000840000000000008484840000FF0000FFFFFF00FFFF
      FF000000000000FF0000C6C6C60000FF000084848400FFFFFF00FFFFFF0000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008400000084000000840000000000008484840000FF0000FFFFFF008400
      00008400000084000000C6C6C60000FF000084848400FFFFFF00FFFFFF0000FF
      0000008400000084000000840000000000008484840000FF000000FF00008400
      0000840000008400000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000840000008400000000000084848400FFFFFF00848484000000
      000000840000008400000084000000840000008400008484840084848400FFFF
      FF00008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008400000084000000840000000000008484840084000000840000000000
      000000840000008400008400000084000000008400008484840084848400FFFF
      FF000084000000840000008400000000000084848400840000008400000000FF
      000000FF000000FF0000840000008400000000FF000000FF000000FF000000FF
      0000008400000084000000840000000000000000000084848400008400000084
      000000840000C6C6C60000FF000000000000000000000000000000FF00008484
      8400FFFFFF0000840000008400000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00008400000084000000840000000000000000000084000000008400000084
      000000840000C6C6C60000FF00008400000000FF0000C6C6C60000FF00008484
      8400FFFFFF000084000000840000000000008484840084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008400000084000000840000000000000000000000000000848484000084
      000000840000C6C6C600C6C6C6000000000000FFFF0000FFFF000000000000FF
      000084848400FFFFFF000084000000000000000000008484840000FF000000FF
      000000FF000000FF000000FF00000000000000FFFF0000FFFF000000000000FF
      0000FFFFFF000084000000840000000000008400000000000000840000000084
      000084000000C6C6C6008400000000FF00008400000000FF0000C6C6C60000FF
      000084848400FFFFFF00008400000000000084000000848484008400000000FF
      00008400000000FF00008400000000FF00008400000000FF000000FF000000FF
      0000FFFFFF000084000000840000000000000000000000000000000000008484
      840000840000C6C6C60000FF00000000000000FFFF0000840000008400000000
      000000FF000084848400FFFFFF000000000000000000000000008484840000FF
      000000FF000000FF000000FF00000000000000FFFF0084840000848400000000
      000000FF0000FFFFFF0000840000000000008400000000000000000000008484
      840000840000C6C6C60000FF0000C6C6C60084000000C6C6C60000FF0000C6C6
      C60000FF000084848400FFFFFF000000000084000000000000008484840000FF
      000000FF000000FF000000FF000000FF00008400000000FF000000FF000000FF
      000000FF0000FFFFFF0000840000000000000000000000000000000000000000
      00008484840084848400848484008484840000000000FFFF0000008400000084
      0000000000008484840084848400000000000000000000000000000000008484
      840000FF000000FF000000FF000000FF000000000000FFFF0000848400008484
      00000000000000FF0000FFFFFF00000000008400000000000000840000000000
      0000840000008484840084000000848484008400000084848400848484008484
      8400848484008484840084848400000000008400000000000000840000008484
      84008400000000FF00008400000000FF00008400000000FF000000FF000000FF
      000000FF000000FF0000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840000000000FFFF00008484
      0000848400000000000084848400000000000000000084000000000000000000
      0000000000000000000000000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000848484008484840084848400840000008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000008484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000008484000000000000000000000000000000000084000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      00008484000000000000000000000000000084848400C6C6C600FFFF0000C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600848400000000000000000000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000000000000000000000000084848400C6C6C60000FF0000C6C6
      C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C6000084000000000000000000000000000084848400FFFF0000FFFF0000FFFF
      0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFF0000FFFF0000FFFF
      0000848400008484000000000000000000008484840084848400C6C6C6008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400848400008484000000000000000000008484840000FF000000FF000000FF
      000000FF0000FFFFFF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF
      0000008400000084000000000000000000008484840084848400C6C6C6008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      84000084000000840000000000000000000084848400FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000084848400FFFFFF00FFFF0000FFFF0000FFFF
      00008484000084840000848400000000000084848400FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000848400008484000084840000000000008484840000FF000000FF000000FF
      0000FFFFFF00000000000000000084848400FFFFFF0000FF000000FF000000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000840000008400000000000084848400FFFF0000FFFFFF00FFFF
      FF0000000000FFFF0000C6C6C600FFFF000084848400FFFFFF00FFFFFF00FFFF
      00008484000084840000848400000000000084848400FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000848400008484000084840000000000008484840000FF0000FFFFFF00FFFF
      FF000000000000FF0000C6C6C60000FF000084848400FFFFFF00FFFFFF0000FF
      0000008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000084000000840000008400000000000084848400FFFFFF00848484000000
      000084840000848400008484000084840000848400008484840084848400FFFF
      FF008484000084840000848400000000000084848400FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      00008484000084840000848400000000000084848400FFFFFF00848484000000
      000000840000008400000084000000840000008400008484840084848400FFFF
      FF00008400000084000000840000000000008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000008400000084000000840000000000000000000084848400848400008484
      000084840000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF00008484
      8400FFFFFF0084840000848400000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848400008484000084840000000000000000000084848400008400000084
      000000840000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF00008484
      8400FFFFFF0000840000008400000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008400000084000000840000000000000000000000000000848484008484
      000084840000C6C6C600C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      000084848400FFFFFF0084840000000000000000000084848400FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF008484000084840000000000000000000000000000848484000084
      000000840000C6C6C600C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF
      000084848400FFFFFF000084000000000000000000008484840000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000FFFFFF000084000000840000000000000000000000000000000000008484
      840084840000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600FFFF000084848400FFFFFF0000000000000000000000000084848400FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFFFF0084840000000000000000000000000000000000008484
      840000840000C6C6C60000FF0000C6C6C60000FF0000C6C6C60000FF0000C6C6
      C60000FF000084848400FFFFFF000000000000000000000000008484840000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000FFFFFF0000840000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000008484
      8400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFFFF00000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000008484
      840000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000008484
      84008484840084848400000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000008484
      84008484840084848400000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000008484
      84008484840084848400000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000008484
      84008484840084848400000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C600848484000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C600848484000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C600848484000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C600848484000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C600848484000000000084848400FF000000FF000000FF00
      0000FF000000FF000000FF0000008484840000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400000000008484840084000000840000008400
      00008400000084000000840000008484840000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C6008484840000000000848484000000FF000000FF000000
      FF000000FF000000FF000000FF008484840000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000000000C6C6C60084848400C6C6
      C600C6C6C600C6C6C600848484000000000084848400FF000000FFFF0000FFFF
      0000FFFF0000FFFF0000FF0000008484840000000000C6C6C600848484008484
      840084848400C6C6C60084848400000000008484840084000000840000008400
      00008400000084000000840000008484840000000000C6C6C600848484008484
      840084848400C6C6C6008484840000000000848484000000FF000000FF000000
      FF000000FF000000FF000000FF008484840000000000C6C6C600848484008484
      840084848400C6C6C60084848400000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000000000C6C6C600848484008484
      840084848400C6C6C600848484000000000084848400FF000000FFFFFF00FFFF
      0000FFFF0000FFFF0000FF0000008484840000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000008484840084000000FFFFFF008400
      00008400000084000000840000008484840000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000848484000000FF00FFFFFF000000
      FF000000FF000000FF000000FF008484840000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000008484840000FFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000084848400FF000000FF000000FF00
      0000FF000000FF000000FF0000008484840000000000C6C6C600C6C6C600C6C6
      C60000FF0000C6C6C60084848400000000008484840084000000840000008400
      00008400000084000000840000008484840000000000C6C6C600C6C6C600C6C6
      C60000840000C6C6C6008484840000000000848484000000FF000000FF000000
      FF000000FF000000FF000000FF008484840000000000C6C6C600C6C6C600C6C6
      C60000FFFF00C6C6C60084848400000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000000000C6C6C600C6C6C600C6C6
      C6000000FF00C6C6C60084848400000000008484840084848400848484008484
      84008484840084848400848484008484840000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000008484840084848400848484008484
      84008484840084848400848484008484840000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000084848400848484008484
      84008484840084848400848484008484840000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400000000000000000084848400848484008484
      84008484840084848400848484008484840000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600848484008484
      840084848400C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600848484008484
      840084848400C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600848484008484
      840084848400C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600848484008484
      840084848400C6C6C60084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C60084848400C6C6C600848484000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000848484008484840084848400C6C6C60084848400C6C6C60084848400C6C6
      C60084848400C6C6C60000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C60084848400C6C6C60084848400C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400C6C6C6008484840000000000000000000000000084848400C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400C6C6C600C6C6
      C600848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6C600848484000000
      000084848400848484000000000000000000000000000000000084848400C6C6
      C600C6C6C6008484840084848400C6C6C60084848400C6C6C60084848400C6C6
      C60084848400C6C6C60000000000000000000000000084848400C6C6C600C6C6
      C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600C6C6
      C600000000008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000848484008484840000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6C6000000
      000084848400848484000000000000000000000000000000000084848400C6C6
      C600C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400C6C6C6008484840000000000000000000000000084848400C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400C6C6C600C6C6
      C600848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      000084848400848484000000000000000000000000000000000084848400C6C6
      C600C6C6C6008484840084848400C6C6C60084848400C6C6C60084848400C6C6
      C60084848400C6C6C60000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000848484008484840000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6C6008484
      840084848400848484000000000000000000000000000000000084848400C6C6
      C600C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400C6C6C6008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840084848400000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484008484840000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6
      C60084848400848484000000000000000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6
      C600848484008484840000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000008484840084848400000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000008484840084848400000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400C6C6C600C6C6
      C600C6C6C600848484000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484008484840084848400000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484008484840084848400000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C600C6C6C6000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600848484000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000848484000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600840000008400000084000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00C6C6C6008484840000000000848484000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      000000000000000000000000000000000000848484000000840000008400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      840084848400C6C6C6008484840000000000848484000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      000000000000000000000000000000000000848484000000840000008400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000BB0000000100010000000000D80500000000000000000000
      000000000000000000000000FFFFFF00E00F000000000000C007000000000000
      C0070000000000008003000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000E007000000000000C007000000000000
      C007000000000000F81F000000000000FC7F000000000000FFFF000000000000
      FBBF000000000000F9BF000000000000FFFF0000000000000000000000000000
      FFFFFFFFFFFFFFFFC3E183E0FFFFFFFF81C083E08007800781C083E080038003
      81C0808080038003800080008003800380008000800380038000800080038003
      C001C00180038003E083E08380038003E083E083C003C003F1C7F1C7C003C003
      F1C7F1C7FFFFF00FFFFFF1C7FFFFF81FFFFFFFFFFFFFFC3FFFFFFFFFFFFFFE7F
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE000C000E000C000
      C0008000C0008000C0008000CFF89FFC800080009FF89FFC800080009FF09FFC
      000080003FF09FFC0000800000049FFC0000800000049FFC800080009FFC9FFC
      800080009F808000800180019F01BF81C07FC07FC07FDF7FE0FFE0FFE0FFE0FF
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      E000C000E000C000C0008000C0008000C0008000C00080008000800080008000
      8000800080008000000080000000800000008000000080000000800000008000
      800080008000800080008000800080008001800180018001C07FC07FC07FC07F
      E0FFE0FFE0FFE0FFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE000C000E000C000C0008000C0008000C0008000C0008000
      8000800080008000800080008000800000008000000080000000800000008000
      0000800000008000800080008000800080008000800080008001800180018001
      C07FC07FC07FC07FE0FFE0FFE0FFE0FFFFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFFFF8FFF8FFFFFFFFFFC03FC0300070007F003F003
      00030003E001E00100010001E001E00100000000C001C00100000000C001C001
      00000000C000C00080000000C000C000C000800080008000E000C00080008000
      F000E00080018001FE03F00080078007FF07FF07E01FE01FFF8FFF8FF87FF87F
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0007000700070007000300030003000300010001000100010000000000000000
      000000000000000000000000000000008000000080000000C000800040000000
      E000C00060004000F000E00050004000FF83F001BEFFB000FFC3FFC39CFF9CFF
      FFE7FFE7E3FFE3FF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF000700070007000700030003000300030001000100010001
      0000000000000000000000000000000000000000000000008000000080000000
      C0008000C0008000E000C000E000C000F000E000F000E000FFFFF000FFFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF83FF83FF83FF83
      C101C101C101C101C000C000C000C00080008000800080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008000800080008000C000C000C000C000
      FF80FF80FF80FF80FFC0FFC0FFC0FFC0FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFFFC7FFC7FFC7FFC7FFC7FFC7FC007F80180078007C003F001
      80018001C003E00180008000C001C00180008000C001C00180008000C001C001
      80008000C001C00180008000C001C00380008000E001C00380008000F001C007
      C001C001F803E00FE001E001FE07F03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000000000000000FFFFFFC100FF00FFFFFFFF8000FF00FFFFFFFF8000FF00FF
      FFFFFF8000FF00FFFFFFFF8000FF00FFFFFFFF8000FF00FFFFFFFF80FFFFFFFF
      FFFFFFC0FFFFFFFFFFFFFFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000}
  end
  object MainFrm: TImageList
    Height = 20
    Width = 20
    Left = 80
    Top = 64
    Bitmap = {
      494C010125002700040014001400FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000050000000C8000000010020000000000000FA
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00B3B3B3000000000000000000000000000000
      0000000000000000000000000000BFBFBF00BABABB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCB3B400FDAFAF0087424200A5A5A5009D9E9E0000000000000000000000
      00009D9DF8009494F9000605CE000505CD00B5B5B600AEAEAE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCBFBE00FCBA
      BA00FDB1B100FDACAC008742420000000000999999009999990000000000A8A8
      F8009697F8008E8FF9000505CA000605C80000000000ACACAC00A8A9A9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCC2C200FCB9B900FDB4
      B400FDABAC00FEA7A600773B3B00502829003E202000B0B0F700ADACF8009D9D
      F8008C8BF9008383FA000405C0000505BD000504B80000000000A3A3A4009D9D
      9D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCBDBD00FDB3B300FDAF
      AF00FEA6A500FEA1A0005D2E2E003A1E1E00330000000101BA00A3A3F8009191
      F9008080FA007777FA000404B4000304B2000304AE000403AA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCBAB900FDB0B100FDAC
      AC00FEA2A200FE9E9E00502828003A1E1E00330000000101AA000101AA008C8C
      F9007A7AFA007372FB000304AF000303AE000303A9000303A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDB4B400FDABAB00FEA6
      A600FBEFEF00FBEFEF003A1E1E00550000003300000001018700000000000101
      87007070FB00ACACFC000302A5000303A30002029E0002039A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDB1B100FEA8A800FBEF
      EF00FCE2E200FCDFDF007B40400033000000550000000000000064DDFC000000
      0000ACACFC00A1A1FA009A9AF90002029D000202990002029500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBEFEF00FCE2E300FDE0
      E000FDDAD900FEDADA000000000097E6FA0083E3FB005CDCFC0049D8FC000098
      FF00000000003F3FB4009091F9008D8DFA0002018F0001028C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDE1E100FDDADB00FDD7
      D700FFD1D10022000000A1E8FA007BE1FB0066DEFC0040D7FD002DD3FE000092
      F3000189E2000283D9003F3FB4008484F9007D7CFA0001018700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FED7D700FED3
      D300FECECD000000000094E6FA006CDFFC005ADCFC0033D5FD001FD1FE00018F
      EC000284DB00027FD300000000003F3FB4007A7AFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCC
      CC00FFCCCC000000000077E0FB0051DAFC003ED7FD0017D0FE0008CDFF000286
      DD00037CCD000377C40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006ADEFB0043D8FD0030D5FD000CCEFE0000CCFF000282
      D7000377C6000372BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004FD9FC0027D3FE00CCF8F800A3F5F5009BF5F600027A
      C8000470B800046BB10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CCF8F800A3F5F500A1F5F50085F7F70073F8F80050FA
      FA00046BB000046BB00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3F5F5009EF5F50091F6F7006FF8F9005CFAFA003AFB
      FB0016FEFE00046BB00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077F7F70065F9F90042FBFB0030FCFC000EFF
      FE0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000061F9F9004FFBFA002CFDFD001AFDFD0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000008400000084000000000000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000FFFF00000000000000
      000000FFFF000000000000000000008400000084000000000000008400000084
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00FFFFFF00FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF00008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000008484000084
      840000848400000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000840000008400000084000000840000008400000084
      000000840000000000000000000000000000848484000000000000FFFF0000FF
      FF0084848400FFFF0000FFFF0000FFFF0000FFFFFF0000000000000000008484
      8400FFFFFF00FFFF0000FFFF0000FFFF00008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840084848400848484008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00000000000000000000000000008484000000
      FF0000848400848484008484840000000000FFFFFF00FFFFFF00FFFFFF008400
      840084008400FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000840000000000000084000000840000008400000000
      0000008400000000000000000000000000008484840000FFFF00000000000000
      000084848400FFFF0000FFFFFF00FFFFFF0000000000FFFF000000000000FFFF
      000084848400FFFFFF00FFFFFF00FFFF00008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000008484000084
      8400008484000000000000000000000000000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF0000FFFF0000FFFF0000840000000000000084000000840000008400000000
      000000840000000000000000000000000000848484000000000000FFFF0000FF
      FF0084848400FFFFFF0084848400000000008484000084840000848400008484
      0000848400008484840084848400FFFFFF008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF000000
      0000000000000084000000840000000000000000000000840000000000000000
      0000008400000084000000000000000000008484840000FFFF00000000000000
      000000FFFF008484840084840000848400008484000000000000FFFF00000000
      0000FFFF000000000000FFFF000084848400FFFFFF0084840000848400000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF000000000000FF
      FF00008400000084000000840000000000000084000000840000008400000000
      00000084000000840000008400000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084840000848400000000000000000000FFFF
      000000000000FFFF000000000000FFFF000084848400FFFFFF00848400000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840000000000FFFFFF00FFFFFF00FFFFFF000000840000008400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000FFFF000000FF000000FF0000FFFF00000000000000
      000000FFFF00000000000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000FFFF0000FF
      FF00000000008484840084848400848484008484000000000000FFFF00000000
      0000FFFF000000000000FFFF000000000000FFFF000084848400FFFFFF000000
      0000000000000000000000000000000000008484840000000000000000000000
      000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000084840000848400008484000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000FF000000000000FFFF00000000000000
      000000000000000000000000FF000000000000000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000008484000000FF00008484008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000FF000000FF0000000000FF000000FF000000000000000000
      000000000000FF00000000000000000000000000000000000000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000084840000848400008484000000
      0000000000000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000FF000000FF000000FF0000000000FF000000FF000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00008484000084840000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000FF000000FF000000FF0000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000FFFF000084840000848400008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000848400008484
      0000848400008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      FF000000FF00000000000000FF0000000000FF000000FF000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000848400008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF0000000000000000000000FF0000000000FF000000FF000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000848400008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000084848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF0000000000000000000000FF000000000000000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000848400008484000084840000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000848400008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000084848400000000000000
      FF000000000084848400000000008484840000000000FFFFFF00FFFFFF00FFFF
      FF000084000000840000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000FF000000FF000000
      000000000000000000000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000848400008484
      0000848400008484000084840000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF00008484000084840000848400008484000084840000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000084
      840000000000848484000000000000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000084000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000084000000000000008400
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000008484008484840000848400848484000084840084000000FFFFFF008400
      000084000000840000008400000084000000FFFFFF0084000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000840000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000084000000000000008400
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF008400000000000000000000000000000000000000000000000000
      0000848484000084840084848400008484008484840084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000008484840084848400848484000000000000000000840000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000008400
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000008484008484840000848400848484000084840084000000FFFFFF008400
      00008400000084000000FFFFFF00840000008400000084000000000000000000
      0000000000000000000084848400848484000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000848484008484840000000000840000008400
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF008400000000000000000000000000000000000000000000000000
      0000848484000084840084848400008484008484840084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0084000000000000000000
      000000000000848484008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000008484008484840000848400848484000084840084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000008400000000000000000000000000
      0000000000008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000FFFFFF000000000000000000FFFFFF00840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000848484000084840084848400008484008484840084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000848484008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      0000008484008484840000848400848484000084840084848400008484008484
      8400008484008484840000848400848484000000000000000000000000000000
      00008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000084840000000000000000000000000000000000000000000000
      0000000000000000000084848400008484000000000000000000000000000000
      00008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000FFFF
      FF0084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484008484840000000000000000000000000000000000000000000000
      0000000000000000000000848400848484000000000000000000000000000000
      0000848484008484840000000000FFFFFF00FFFFFF0084000000FFFFFF00FFFF
      FF00FFFFFF0084000000FFFFFF00FFFFFF000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000848400848484000000000000FFFF00000000000000000000FF
      FF00000000000084840084848400008484000000000000000000000000000000
      0000000000008484840000000000FFFFFF0084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FF000000FF000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000848400008484000084840000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00848400008484000000FFFF00848400008484000000FFFF00848400008484
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000008484840000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00848400008484000000FFFF00848400008484000000FFFF00848400008484
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000848484000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00848400008484000000FFFF00848400008484000000FFFF00848400008484
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00008484840000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00848400008484000000FFFF00848400008484000000FFFF00848400008484
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF000000000084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00848400008484000000FFFF00848400008484000000FFFF00848400008484
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000FFFF000000000000FFFF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00848400008484000000FFFF00848400008484000000FFFF00848400008484
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084000000000000000000000000000000848484008400
      0000000000000000000084000000000000000000000000000000000000000000
      0000848484000000000000FFFF000000000000FFFF0084848400848484008484
      840084848400848484000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000848484000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084000000000000000000000000000000000000008400
      0000840000008400000084000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000FFFF000000000000FFFF00848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000000000000000000000000000008484840084848400000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000848484008484840000000000FFFFFF000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      00000000000000000000848484008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000000000008400
      000084000000000000008484840000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008400000084000000FFFFFF00FF000000FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000008484840000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      840000000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000000000
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000000000000000000000000000000000000084000000840000008400
      0000840000000000000000000000000000000000840000008400000084000000
      8400000084000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF0084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000840000008400000084000000
      840000008400000084000000840000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000840000008400000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000008400000084000000
      00000000000000008400000084000000840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008400000084000000000000008400
      000000000000000000008484840084848400848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF000084000000840000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000000000000000000000000000008484840084000000000000000000
      0000840000000000000000000000000000000000000000000000000084000000
      00000000000000000000000084000000840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000084000000840000008400
      0000000000000000000084848400000000000000000000000000000000000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000840000008400000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000084000000840000008400
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00008484000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00FFFFFF00FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF00008484000084840000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFF0000FFFF0000FFFF0000FFFFFF0000000000000000008484
      8400FFFFFF00FFFF0000FFFF0000FFFF00008484000084840000848400000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFF0000FFFFFF00FFFFFF0000000000FFFF000000000000FFFF
      000084848400FFFFFF00FFFFFF00FFFF00008484000084840000848400000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0084848400000000008484000084840000848400008484
      0000848400008484840084848400FFFFFF008484000084840000848400000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000848484000000000000000000FFFFFF0084848400848484000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400000000008484840084840000848400008484000000000000FFFF00000000
      0000FFFF000000000000FFFF000084848400FFFFFF0084840000848400000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFF0000000000000000000084848400000000000000
      000000000000000000000000000000000000848484000000000000FFFF0000FF
      FF000000000000FFFF008484840084840000848400000000000000000000FFFF
      000000000000FFFF000000000000FFFF000084848400FFFFFF00848400000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFF00000000000084848400000000000000
      0000000000000000000000000000000000008484840000FFFF00000000000000
      000000FFFF000000000000000000848484008484000000000000FFFF00000000
      0000FFFF000000000000FFFF000000000000FFFF000084848400FFFFFF000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000084848400FFFFFF00FFFFFF000000000084848400848484000000
      000000000000000000000000000000000000848484000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000084848400000000000000
      0000000000000000000000000000000000008484840000FFFF00000000000000
      000000FFFF00000000000000000000FFFF000000000000FFFF00000000000000
      00000000000000FFFF0000000000008484000000000000000000000000000000
      00000000000084848400FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000FFFF00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000848484000000000000FFFF0000FF
      FF0000000000848484008484840084848400848484008484840000FFFF000000
      00000000000000FFFF000000000000FFFF000000000000000000000000000000
      00000000000084848400FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84008484840000000000848484000000000000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000FFFF00000000000000000000000000000000000000
      00000000000084848400FFFFFF00FF000000FF000000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF00000000000000000000FFFF000000
      00000000000000FFFF000000000000FFFF000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000FFFF0000FFFF00000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000FFFF00000000000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848400000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      840000FFFF0000848400000000000084840000FFFF0000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000084840000000000000000000084840000FF
      FF0000FFFF0000000000848484000000000000FFFF0000FFFF00008484000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000848484000084840000FFFF000084840000000000008484000084
      840000FFFF0000848400000000000084840000FFFF0000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840000848400FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF000000000000FFFF0000848400000000000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848400000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF008484000084840000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000848484000084840000FFFF000084840000000000000000000084
      8400008484000000000000FFFF00000000000084840000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000848400008484
      0000FF000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000FFFF000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400008484008484840000000000000000000000
      0000000000000084840000848400008484000084840000000000000000000000
      00000000000000000000000000000000000000FFFF0000848400008484000084
      8400008484000084840000848400008484000084840000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF00008484
      000084840000FF00000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      00008484000084840000FF000000000000000000000000000000000000000000
      000000000000000000008484840000000000FFFFFF000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF008484
      8400000000000000000000000000000000000000000000000000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000848400008484000084
      8400008484000084840000848400008484000084840000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFF00008484000084840000FF0000000000000000000000000000000000
      000000000000000000008484840000FFFF00FFFFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00000000008484
      84000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00008484000084840000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFF00008484000084840000FF00000000000000000000000000
      000000000000FFFFFF008484840000000000FFFFFF000000000000FFFF00FFFF
      FF0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000084840000848400008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFF00008484000084840000FF000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFF00008484000000848400008484000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF0000FFFF000000
      000000FFFF000000000084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFF000000FFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848400008484000084840000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000848400008484
      0000848400008484000084840000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000848484008484
      8400848484008484840000000000FFFFFF00FFFFFF00FFFFFF00840084008400
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000848484008484840084848400848484000000
      0000000000008484840084848400000000000000000000000000848484000000
      00000000000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000084848400FFFFFF00FFFFFF00848484000000
      0000000000008484840084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000848484000000
      0000000000000000000000000000000000008484840084848400848484008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000FFFF0000000000FFFFFF000000000000FFFF000000
      000000FFFF0000000000000000000000000000000000FF000000FF000000FF00
      00000000000000FF000000FF000000FF000000FF000000840000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF0000FFFF000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000FF0000008400000084
      0000008400000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF000000000000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000008400000084
      0000008400000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000008400000084
      0000008400000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000FFFFFF00FFFFFF00FFFFFF00008400000084
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000840000008400000084
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000848484000000
      00000000000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000008400000084000000840000008400000084000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000848484008484840000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF00000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000FFFFFF000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF00000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000848484008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008484840084848400000000000000000000000000000000000000
      000000000000848484008484840000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000848484008484840000000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      84008484840000000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000848484008484840000000000FFFFFF00FFFF
      FF00FF000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484008484840000000000FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000848484008484
      840000000000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000848484008484840000000000FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400000000000000000084848400848484008484840084848400848484008484
      8400000000000000000084848400848484008484840000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00848484008484
      8400FFFFFF00FFFFFF00FFFFFF000084840000848400FF000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400848484008484840084848400848484008484
      8400000000000000000084848400848484008484840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF0000FFFF008484000084840000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000000000
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF0000000000FF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      00000000000000FFFF00000000000000000000FFFF00000000000000000000FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF00008484000084840000FF00
      0000000000000000000000000000000000000000000000000000000084000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400848484008484840000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000848400008484
      0000FF0000000000000000000000000000000000000000008400000084000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000084000000840000008400000084000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF00008484
      000084840000FF00000000000000000000000000840000008400000084000000
      8400000084000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF00FFFFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      00008484000084840000FF000000000000000000840000008400000084000000
      840000008400000084000000840000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00008484000084840000FF0000000000000000008400000084000000
      00000000000000008400000084000000840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000840000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000848400008484000000000000000000000084000000
      00000000000000000000000084000000840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00000000000000000000FFFF00000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000000000840000008400000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      0000FFFF0000FFFF0000FFFF0000848400008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFF0000FFFF0000FFFF0000FFFFFF00000000000000000084848400FFFF
      FF00FFFF0000FFFF0000FFFF0000848400008484000084840000000000000000
      000000000000000000008484840000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000008400000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000084840000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000008484
      8400FFFF0000FFFFFF00FFFFFF0000000000FFFF000000000000FFFF00008484
      8400FFFFFF00FFFFFF00FFFF0000848400008484000084840000000000000000
      000000000000000000008484840000FF000000FF000000FF000000FF0000FFFF
      FF00FFFFFF00FFFFFF0000FF000000FF000000FF000000FF0000008400000084
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF0000FFFF0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF000084840000848400000000000000000000000000000000
      0000840000008400000084000000840000008400000000000000000000000000
      0000848484000000000000000000848484008484840084848400848484000000
      0000000000008484840084848400000000008484840000FF000000FF00008484
      8400FFFFFF008484840000000000848400008484000084840000848400008484
      00008484840084848400FFFFFF00848400008484000084840000000000000000
      000000000000000000008484840000FF000000FF000000FF0000FFFFFF000000
      00000000000084848400FFFFFF0000FF000000FF000000FF0000008400000084
      000000840000000000000000000000000000000000000000000084848400FFFF
      0000FFFF0000FFFF0000FFFFFF00000000000000000084848400FFFFFF00FFFF
      0000FFFF0000FFFF000084840000848400008484000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      000084848400000000000000000084848400FFFFFF00FFFFFF00848484000000
      0000000000008484840084848400000000008484840000FF000000FF000000FF
      00008484840084840000848400008484000000000000FFFF000000000000FFFF
      000000000000FFFF000084848400FFFFFF008484000084840000000000000000
      000000000000000000008484840000FF0000FFFFFF00FFFFFF000000000000FF
      00000000000000FF000084848400FFFFFF00FFFFFF0000FF0000008400000084
      000000840000000000000000000000000000000000000000000084848400FFFF
      0000FFFFFF00FFFFFF0000000000FFFF000000000000FFFF000084848400FFFF
      FF00FFFFFF00FFFF000084840000848400008484000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000008484840000FF000000FF000000FF
      0000FFFFFF008484840084840000848400000000000000000000FFFF00000000
      0000FFFF000000000000FFFF000084848400FFFFFF0084840000000000000000
      0000000000000000000084848400FFFFFF008484840000000000008400000084
      00000084000000840000008400008484840084848400FFFFFF00008400000084
      000000840000000000000000000000000000000000000000000084848400FFFF
      FF00848484000000000084840000848400008484000084840000848400008484
      840084848400FFFFFF0084840000848400008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000008484840000FF0000FFFFFF00FFFF
      FF000000000000FF0000848484008484000000000000FFFF000000000000FFFF
      000000000000FFFF000000000000FFFF000084848400FFFFFF00000000000000
      0000000000000000000000000000848484000084000000840000008400000000
      000000FF00000000000000FF00000000000000FF000084848400FFFFFF000084
      0000008400000000000000000000000000000000000000000000000000008484
      840084840000848400008484000000000000FFFF000000000000FFFF00000000
      0000FFFF000084848400FFFFFF00848400008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000084848400848484000000000084848400FFFFFF00848484000000
      0000008400000084000000840000848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000008484840000840000008400000000
      00000000000000FF00000000000000FF00000000000000FF000084848400FFFF
      FF00008400000000000000000000000000000000000000000000000000000000
      00008484840084840000848400000000000000000000FFFF000000000000FFFF
      000000000000FFFF000084848400FFFFFF008484000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000084848400008400000084
      0000008400000000000000FF00000000000000FF00000000000000FF00008484
      8400FFFFFF000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008400000000
      000000FF00000000000000FF00000000000000FF00000000000000FF00008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000848484008484000000000000FFFF000000000000FFFF00000000
      0000FFFF000000000000FFFF000084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484000084
      000000840000000000000000000000FF00000000000000FF00000000000000FF
      000084848400FFFFFF0000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000000000000FF00000000000000FF00000000000000FF00000000
      000000FF000084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000848484008484840084848400848484000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000848484008484840084848400848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000084848400FFFFFF00FFFFFF00848484000000
      0000000000008484840084848400000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000000000000000000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000050000000C80000000100010000000000600900000000000000000000
      000000000000000000000000FFFFFF00F8FC70000000000000000000C0603000
      0000000000000000800010000000000000000000000000000000000000000000
      0000100000000000000000000000100000000000000000000000100000000000
      0000000000001000000000000000000000001000000000000000000080001000
      0000000000000000800030000000000000000000C000F0000000000000000000
      E001F0000000000000000000F801F0000000000000000000F801F00000000000
      00000000F801F0000000000000000000FC03F0000000000000000000FE07F000
      0000000000000000FF1FF0000000000000000000FFFFF0000000000000000000
      000000000000000000000000F0007FFFFFFFFFFFBE4F000000003FFF00FE01FD
      B64F000000001FFF00C601FEAC07000040000FE000C001FF1D17000030200FEF
      00C601F80117000040000FE800EE01FF19B3000030540FE807EFFFFEA1110000
      006A0F0007C7F00835FF000048550F7807C7100EBD87000081000C1807C7000E
      F93B000080FFF80FFFC7100EF13F00000000F0000FC7B00EF10300000000F000
      0F83BFFEE5330000F800FF800F0100FECD330000F800FF800F0100FECD870000
      0000F0000F0000FE9DFF00000000F0000F0100FE3DFF000080FFF80FFF8300F8
      307F0000C1FFFC1FFFEFFFFFFFFF0000000000000000000000000000FFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFC90000FFFFFFFFFFFFFFFFFFC90000
      FE7FFFFFFFFF803FFFC90000FDB3FFF803F0003FFFC90000FDADFFF803E0003F
      83C90000FDADFFF803E0003E00C90000FE2DFE0003E0003C00490000FFA3FE00
      03E00038003F0000FF8FFE0003E00078003F0000FFDFFE0003E00070001F0000
      FF8FFE0007E00070001F0000FFAFFE000FE00070001F0000FF27FE001FE1F870
      001F0000FF77FE01FFE00078003F0000FF77FE03FFF000F8003F0000FF77FE07
      FFFF0FFC007F0000FFFFFFFFFFFFFFFE00FF0000FFFFFFFFFFFFFFFF83FF0000
      000000000000000000000000FFFFF010E1FFFFFFFFFF0000FFFFF014E5FFFFFF
      FFFF0000FCE7F010E1E0007E00070000FCE7F01001C0003E00070000F843F014
      21C0003E00070000F001FFF421C0003E00070000F001F00001C0003E00070000
      F001F2A803C0003E00070000F0E1F554E7C0003E00070000F0E1F2A8E7C0003E
      00070000F0E1F55407C0003E00070000FFFFF2A8A7C0003E00070000FC1FF001
      57C0003E00070000F9CDF502A7C0003E000F0000FBF1F85557C0003E001F0000
      FBF1FFCAA7C0003E003F0000F9E1FFC007E0007E007F0000FFFFFFD40FFFFFFF
      FFFF0000FFFFFFE1FFFFFFFFFFFF0000000000000000000000000000FF9FF0E1
      EFFFFFFFFFFF00008707F4E5C7FFFFFFFFFF00008E01F0E1ABFFFFFF0E1F0000
      8C007001EFC1F07F0E1F0000A4001421EFC1F07F0E1F0000F2001421EFC1F07F
      001F0000E8000001EFC0407F001F0000C000180300C0007F001F0000E0003CE7
      00C0007F843F0000C0001CE400C0007FCE7F0000E0000FFD00E000FFCE7F0000
      D0001FFD00F041FFF3FF000098003FFDFFF041FFE78700000600FFC03FF8E3FF
      EFC7000001027FC03FF8E3FFEFC7000098832C003FF8E3FFE7370000DC838DC0
      3FFFFFFFF07F0000FC878DC03FFFFFFFFFFF0000E1EF0DFFFFFFFFFFFFFF0000
      000000000000000000000000FFFFFFFFFFFFFFFFFFFF0000F000780001FFFFFF
      FFFF0000F000380001FFFFFC00330000F000180001F001FC00230000F0000800
      01EFFAFC00070000F020080001C0017C018F00000000080001DF8C7C030F0000
      0854080001DF8D7C05AF0000486A080001C001BC04AF00003655080001DFFABC
      008F00004900080001E0053C019F0000369A780001F002BC003F000000057800
      01F8007C003F0000481A780001F801FC003F00008525780001FC01FC017F0000
      FCDA780001FC00FC00FF0000FC00780001FE00FC01FF0000FD20F80001FFFFFF
      FFFF0000FE1FFFFFFFFFFFFFFFFF0000000000000000000000000000FFF87FFF
      FFFFFFFFFFFF0000FFE01F001FF001FFFFFF0000FFE01E000FE000FFFFFF0000
      FFC00E000FE000FE00070000FC400E000FE0FCFC00070000F8000E000FE01CFC
      55470000F8201E000FE00CFCAAA70000F8201E000FE000FD55470000FC787E00
      0FE000FCAAA70000C1FFFE000FE000FD5547000080FFFE000FE000FC2AA70000
      0000FE000FE00079454700000000FE000FE0003C08070000F800FE000FE0001C
      140F0000F800FE000FE000380BFF00000000FE000FE000FE07FF00000000FFAD
      7FC003FD5FFF000080FFFFDEFF8007FB6FFF0000C1FFFFFFFFFFFFFF7FFF0000
      000000000000000000000000FFFFFFFFFFFFFFFFFF1F0000FC03FFFFFFFFFFFF
      F0030000FC03FFDFFFC001FFF7F90000C003FFCFFFC001FFF6180000DC03FFC7
      FFC001FFF6180000DC03FFC3FFC001FFF7F80000DFFFFFC1FFC001FFF0000000
      DFF00FC5FFC001FFF7F80000DFF00FE0FFC001FFFBFC0000DF000FE2FFC001FC
      1C010000DF700FF07FC003080FFF0000DF700FF17FC00100000F0000DF7FFFF8
      3FC00000000F0000DC03FFF83FC0000F800F0000DC03FFFC1FC1000F800F0000
      C003FFFC1FFF8000000F0000DC03FFFE3FFFC000000F0000DC03FFFFFFFFFFF8
      0FFF0000DFFFFFFFFFFFFFFC1FFF0000000000000000000000000000FFFFFFF9
      FFFF9FFFF9FF0000FFFFFFF07FFF07FFF07F000000400FE01FFE01FFE01F0000
      00A00FC007FC007FC0070000FF5FFF8001F8001F80010000FF1FFF0001F0001F
      00010000E001FE0000E0000E00000000EFFC7C0001C0001C00010000EC0C3E01
      FBE0003E00030000EC0C3C0037C0001C00070000EC0C3E800FE0000E000F0000
      EFFC3B200FD0001F801F0000E0003D500798003C203F0000EFFC3E384306007E
      384F0000EFFC380EE10100FC3EE70000F7FE7E3FF09881F9BFF20000F8007D5F
      F8DC83F3FFF80000FFFFFB6FFDFC87F7FFF80000FFFFFFFFFFE1EFFFFFF00000
      000000000000000000000000E000FFFFFFFFFFFFFF5F0000E0007FFFFFFFFFFE
      3F1F0000E0003C001FC001FDF0030000E0001C000FC000FDF7F9000000401C00
      07C000707618000000001C0003C00038F618000000A81C0803C0803DF7F80000
      00D41C0003C0003FF000000000AA1E1503E1503F57F8000000001F1A83F1A83F
      1BFC00008540FF9543F9543004010000C6A0FFC003FC0037F9FF0000E550FFFF
      FFFFFFF618F70000F204FFFDFFFFDFF618E30000FDFBFFFDFFFF8FF7F8C10000
      FDF1FFF07FFF07F000F70000F060FFF8FFFFDFF7F8F70000F8FBFFFDFFFFDFFB
      FC8F0000FDFBFFFFFFFC3FFC01FF0000}
  end
  object popupChart: TPopupMenu
    Left = 258
    Top = 164
    object popChartExport: TMenuItem
      Caption = 'E&xport as file...'
      Hint = 'Export the chart as a BMP/WMF/EMF to a file.'
      OnClick = popChartExportToFileClick
    end
    object popChartExportasBitmap: TMenuItem
      Caption = 'B&itmap to clipboard'
      Hint = 'Export the chart as a bitmap to the clipboard.'
      OnClick = popChartExportasBitmapClick
    end
    object popChartWMFtoclipboard: TMenuItem
      Caption = '&WMF to clipboard'
      Hint = 'Export the chart as a WMF to the clipboard.'
      OnClick = popChartWMFtoclipboardClick
    end
    object popChartEMFtoclipboard: TMenuItem
      Caption = '&EMF to clipboard'
      Hint = 'Export the chart as a EMF to the clipboard.'
      OnClick = popChartEMFtoclipboardClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object popChartDrawaslines: TMenuItem
      Caption = 'Draw as &lines'
      Checked = True
      GroupIndex = 1
      Hint = 'Changes the drawing of the chart to "lines".'
      RadioItem = True
      OnClick = popChartDrawAsClick
    end
    object popChartDrawasbars: TMenuItem
      Caption = 'Draw as &bars'
      GroupIndex = 1
      Hint = 'Changes the drawing of the chart to "bars".'
      RadioItem = True
      OnClick = popChartDrawAsClick
    end
    object popChartDrawasarea: TMenuItem
      Caption = 'Draw as &area'
      GroupIndex = 1
      Hint = 'Changes the drawing of the chart to "area".'
      RadioItem = True
      OnClick = popChartDrawAsClick
    end
    object popChartDrawashorizbars: TMenuItem
      Caption = 'Draw as &horiz bars'
      GroupIndex = 1
      Hint = 'Changes the drawing of the chart to "horiz bar".'
      RadioItem = True
      OnClick = popChartDrawallClick
    end
    object popChartDrawaspie: TMenuItem
      Caption = 'Draw as &pie'
      GroupIndex = 1
      Hint = 'Changes the drawing of the chart to "pie".'
      RadioItem = True
      Visible = False
      OnClick = popChartDrawallClick
    end
    object N3: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object popChartDrawall: TMenuItem
      Caption = '&Draw "all"'
      Checked = True
      GroupIndex = 2
      Hint = 'If graph has more than one item, draw the "all"?'
      OnClick = popChartDrawallClick
    end
    object popChartChartin3D: TMenuItem
      Caption = '&Chart in 3D'
      GroupIndex = 3
      OnClick = mnuChartin3DClick
    end
    object popChartInownWindow: TMenuItem
      Caption = '&Fullscreen'
      GroupIndex = 3
      OnClick = popChartInownWindowClick
    end
  end
  object SavePictureDialog: TSavePictureDialog
    Filter = 
      'Bitmaps (*.bmp)|*.bmp|Erweiterte Metadateien (*.emf)|*.emf|Metad' +
      'ateien (*.wmf)|*.wmf'
    Left = 224
    Top = 160
  end
  object progress: tProgressForm
    Left = 226
    Top = 4
  end
  object ActionList: TActionList
    Left = 336
    Top = 4
    object actEditCopy: TEditCopy
      Category = 'Bearbeiten'
      Caption = '&Kopieren'
      Hint = 'Kopieren'
      ImageIndex = 1
      ShortCut = 16451
      OnExecute = actEditCopyExecute
    end
    object actEditSelectAll: TEditSelectAll
      Category = 'Bearbeiten'
      Caption = 'Alles &markieren'
      ShortCut = 16449
      OnExecute = actEditSelectAllExecute
    end
  end
end
