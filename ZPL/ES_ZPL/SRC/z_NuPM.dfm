object FormNuPM: TFormNuPM
  Left = 317
  Top = 189
  Width = 829
  Height = 589
  ActiveControl = dbgrMes
  BorderIcons = [biSystemMenu]
  Caption = 'FormNuPM'
  Color = clBtnFace
  Constraints.MinHeight = 475
  Constraints.MinWidth = 675
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    821
    555)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 90
    Top = 30
    Height = 525
    Beveled = True
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      821
      30)
    object sBtnRLst: TSpeedButton
      Left = 105
      Top = 3
      Width = 93
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072' ('#1087#1086' '#1084#1077#1089#1103#1094#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103')'
      Caption = #1056#1072#1089#1095'.'#1083#1080#1089#1090#1086#1082
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = PrintRaschList
    end
    object BitBtn1: TBitBtn
      Left = 744
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
    object DBNavigator: TDBNavigator
      Left = 3
      Top = 3
      Width = 100
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
        #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object dbgrMes: TDBGrid
    Left = 0
    Top = 30
    Width = 90
    Height = 525
    Hint = #1052#1077#1089#1103#1094#1099
    Align = alLeft
    Color = clMoneyGreen
    Constraints.MinWidth = 90
    DataSource = dsrcMes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = pop
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrMesDrawColumnCell
    OnEnter = DBGridEnter
    OnExit = DBGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'DtProc'
        Width = 49
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MesGod'
        Width = 68
        Visible = True
      end>
  end
  object PageControl: TPageControl
    Left = 93
    Top = 30
    Width = 728
    Height = 525
    ActivePage = tsByDtProc
    Align = alClient
    Style = tsButtons
    TabOrder = 2
    OnChange = PageControlChange
    OnChanging = PageControlChanging
    object tsByDtProc: TTabSheet
      Caption = #1055#1086' '#1084#1077#1089#1103#1094#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      object Splitter2: TSplitter
        Left = 0
        Top = 169
        Width = 720
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clAqua
        ParentColor = False
      end
      object dbgrOtkl: TDBGrid
        Left = 0
        Top = 0
        Width = 720
        Height = 169
        Hint = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103
        Align = alTop
        Color = clMoneyGreen
        Constraints.MinHeight = 5
        DataSource = dsrcOtkl
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrOtklDrawColumnCell
        OnEnter = DBGridEnter
        OnExit = DBGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 19
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 61
            Visible = True
          end>
      end
      object dbgrNU: TDBGrid
        Left = 0
        Top = 172
        Width = 720
        Height = 302
        Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' / '#1059#1076#1077#1088#1078#1072#1085#1080#1103
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcNU
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrNUDrawColumnCell
        OnEnter = DBGridEnter
        OnExit = DBGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MYNOTES'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 44
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 474
        Width = 720
        Height = 20
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          720
          20)
        object LabelTotalsNU: TLabel
          Left = 128
          Top = 4
          Width = 592
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'LabelTotalsNU'
        end
        object sBtnShowSpecVids: TSpeedButton
          Left = 0
          Top = 3
          Width = 23
          Height = 17
          Hint = #1042#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' ('#1074#1082#1083' / '#1086#1090#1082#1083')'
          AllowAllUp = True
          GroupIndex = 4
          Down = True
          Caption = '.'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008877700
            33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
            703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
            77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
            07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
            780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
            8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
            3333333773FFFF77333333333000003333333333377777333333}
          Layout = blGlyphRight
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnShowSpecVidsClick
        end
        object sBtnSortByVidN: TSpeedButton
          Left = 29
          Top = 3
          Width = 23
          Height = 17
          Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'"'
          GroupIndex = 5
          Down = True
          Caption = #1042#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphRight
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnSortByVidNClick
        end
        object sBtnSortByZaMG: TSpeedButton
          Left = 52
          Top = 3
          Width = 23
          Height = 17
          Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1103#1094#1043#1086#1076'"'
          GroupIndex = 5
          Caption = #1052#1043
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphRight
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnSortByVidNClick
        end
      end
    end
    object tsByZaMesGod: TTabSheet
      Caption = #1055#1086' '#1084#1077#1089#1103#1094#1091' "'#1047#1072#1052#1077#1089#1043#1086#1076'"'
      ImageIndex = 1
      object Splitter3: TSplitter
        Left = 0
        Top = 201
        Width = 720
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clAqua
        ParentColor = False
      end
      object dbgrOtklZaMG: TDBGrid
        Left = 0
        Top = 0
        Width = 720
        Height = 201
        Hint = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103
        Align = alTop
        Color = clSkyBlue
        Constraints.MinHeight = 5
        DataSource = dsrcOtklZaMG
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrOtklZaMGDrawColumnCell
        OnEnter = DBGridEnter
        OnExit = DBGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 56
            Visible = True
          end>
      end
      object dbgrNuZaMG: TDBGrid
        Left = 0
        Top = 204
        Width = 720
        Height = 270
        Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' / '#1059#1076#1077#1088#1078#1072#1085#1080#1103
        Align = alClient
        Color = clSkyBlue
        DataSource = dsrcNuZaMG
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrNuZaMGDrawColumnCell
        OnEnter = DBGridEnter
        OnExit = DBGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MYNOTES'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 49
            Visible = True
          end>
      end
      object PanelTotsZaMG: TPanel
        Left = 0
        Top = 474
        Width = 720
        Height = 20
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          720
          20)
        object LabelTotsZaMG: TLabel
          Left = 216
          Top = 4
          Width = 504
          Height = 11
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'LabelTotsZaMG'
        end
        object sBtnZaMgShowSpecVids: TSpeedButton
          Left = -1
          Top = 3
          Width = 23
          Height = 17
          Hint = #1042#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' ('#1074#1082#1083' / '#1086#1090#1082#1083')'
          AllowAllUp = True
          GroupIndex = 4
          Down = True
          Caption = '.'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008877700
            33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
            703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
            77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
            07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
            780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
            8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
            3333333773FFFF77333333333000003333333333377777333333}
          Layout = blGlyphRight
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnZaMgShowSpecVidsClick
        end
        object sBtnSortByVidN_2: TSpeedButton
          Left = 28
          Top = 3
          Width = 23
          Height = 17
          Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'"'
          GroupIndex = 7
          Caption = #1042#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphRight
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnSortByVidN_2Click
        end
        object sBtnSortByZaMG_2: TSpeedButton
          Left = 51
          Top = 3
          Width = 23
          Height = 17
          Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1056'.'#1052#1077#1089'"'
          GroupIndex = 7
          Down = True
          Caption = #1052#1043
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphRight
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnSortByVidN_2Click
        end
      end
    end
  end
  object PanelTts: TPanel
    Left = 571
    Top = 79
    Width = 227
    Height = 71
    Anchors = [akTop, akRight]
    BevelInner = bvLowered
    Color = 9428986
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    object LabelCntSelRec: TLabel
      Left = 131
      Top = 4
      Width = 72
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '20'
    end
    object LabelSmNach: TLabel
      Left = 111
      Top = 20
      Width = 92
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '7899,85'
    end
    object LabelSmUdrg: TLabel
      Left = 111
      Top = 36
      Width = 92
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LabelSmUdrg'
    end
    object LabelSmTts: TLabel
      Left = 111
      Top = 52
      Width = 92
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LabelSmTts'
    end
    object Label1: TLabel
      Left = 10
      Top = 4
      Width = 99
      Height = 13
      Caption = #1042#1099#1076#1077#1083#1077#1085#1086' '#1079#1072#1087#1080#1089#1077#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 20
      Width = 99
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 36
      Width = 95
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 52
      Width = 69
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1074#1089#1077#1075#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sBtnPatelTtsClose: TSpeedButton
      Left = 209
      Top = 3
      Width = 16
      Height = 17
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sBtnPatelTtsCloseClick
    end
  end
  object qryMes: TQuery
    OnCalcFields = cdsMesCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select distinct TabN, dtProc '
      'from z_NU'
      'where TabN = 7452')
    Left = 32
    Top = 72
    object qryMesTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryMesDTPROC: TDateTimeField
      DisplayLabel = #1052#1077#1089'-'#1043#1086#1076
      FieldName = 'DTPROC'
      DisplayFormat = 'mm-yyyy'
    end
    object qryMesTIP: TStringField
      FieldName = 'TIP'
      Size = 6
    end
  end
  object qryOtkl: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcMes
    SQL.Strings = (
      'Select * from ViOtkl'
      'where DtProc = '#39'07/01/2007'#39
      'and TabN = 1239')
    Left = 200
    Top = 112
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VIOTKL.NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.VIOTKL.KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VIOTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VIOTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VIOTKL.TABN'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VIOTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtklSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VIOTKL.SHVIDN'
      Size = 15
    end
    object qryOtklSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.VIOTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object qryOtklOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.VIOTKL.OLDKDVIDN'
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.VIOTKL.CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VIOTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1050#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VIOTKL.KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055#1050#1076
      FieldName = 'KDKATP'
      Origin = 'DbMain.VIOTKL.KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VIOTKL.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.VIOTKL.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.VIOTKL.PDN'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VIOTKL.KDSPZ'
    end
    object qryOtklSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Origin = 'DbMain.VIOTKL.SCHBU'
      Size = 10
    end
    object qryOtklPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Origin = 'DbMain.VIOTKL.PSCH'
      Size = 10
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.VIOTKL.NOTES'
      Size = 25
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VIOTKL.PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VIOTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VIOTKL.KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VIOTKL.PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VIOTKL.SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VIOTKL.DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VIOTKL.NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VIOTKL.MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VIOTKL.SPECPS'
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.VIOTKL.PBNK'
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 216
    Top = 128
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcMes
    SQL.Strings = (
      'Select * from ViNuMain'
      'where DtProc = '#39'07/01/2007'#39
      'and TabN = 1239'
      '')
    Left = 208
    Top = 312
    object qryNUVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VINUMAIN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNUSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VINUMAIN.SHVIDN'
      Size = 15
    end
    object qryNUTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VINUMAIN.TABN'
    end
    object qryNUKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINUMAIN.KDSPS'
    end
    object qryNUPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Origin = 'DbMain.VINUMAIN.PSCH'
      Size = 10
    end
    object qryNUSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINUMAIN.SCHBU'
      Size = 10
    end
    object qryNUDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINUMAIN.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINUMAIN.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryNUCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.VINUMAIN.CHAS'
    end
    object qryNUSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VINUMAIN.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryNUVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
      Origin = 'DbMain.VINUMAIN.VID_KDSPZ'
    end
    object qryNUVID_SPZ: TStringField
      FieldName = 'VID_SPZ'
      Origin = 'DbMain.VINUMAIN.VID_SPZ'
      Size = 10
    end
    object qryNUVID_KDSCHDT: TSmallintField
      FieldName = 'VID_KDSCHDT'
      Origin = 'DbMain.VINUMAIN.VID_KDSCHDT'
    end
    object qryNUVID_SCHDT: TStringField
      FieldName = 'VID_SCHDT'
      Origin = 'DbMain.VINUMAIN.VID_SCHDT'
      Size = 10
    end
    object qryNUVID_KDSCHKT: TSmallintField
      FieldName = 'VID_KDSCHKT'
      Origin = 'DbMain.VINUMAIN.VID_KDSCHKT'
    end
    object qryNUVID_SCHKT: TStringField
      FieldName = 'VID_SCHKT'
      Origin = 'DbMain.VINUMAIN.VID_SCHKT'
      Size = 10
    end
    object qryNUVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      Origin = 'DbMain.VINUMAIN.VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNUNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VINUMAIN.NR'
    end
    object qryNUDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINUMAIN.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNUDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.VINUMAIN.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNUKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINUMAIN.KDOBJ'
    end
    object qryNUKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088#1055
      FieldName = 'KDKATP'
      Origin = 'DbMain.VINUMAIN.KDKATP'
    end
    object qryNUKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VINUMAIN.KDSPZ'
    end
    object qryNUPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.VINUMAIN.PDN'
    end
    object qryNUNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.VINUMAIN.NOTES'
      Size = 25
    end
    object qryNUPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VINUMAIN.PRR'
    end
    object qryNUPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VINUMAIN.PRPV'
    end
    object qryNUKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VINUMAIN.KTO'
    end
    object qryNUPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VINUMAIN.PRKR'
    end
    object qryNUMYNOTES: TStringField
      DisplayLabel = 'MyNotes'
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VINUMAIN.MYNOTES'
      Size = 25
    end
    object qryNUSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VINUMAIN.SPECPS'
    end
    object qryNUSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VINUMAIN.SPEC_NR'
    end
    object qryNUDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VINUMAIN.DTVDPV'
    end
    object qryNUNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VINUMAIN.NRVDPV'
    end
    object qryNUSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.VINUMAIN.STORN'
      FixedChar = True
      Size = 1
    end
    object qryNUZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.VINUMAIN.ZP13'
      Size = 1
    end
    object qryNUOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.VINUMAIN.OTP'
      Size = 1
    end
    object qryNUBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.VINUMAIN.BLN'
      Size = 1
    end
    object qryNUOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.VINUMAIN.OTPUSKN'
      Size = 1
    end
    object qryNUBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.VINUMAIN.BOLNIC'
      Size = 1
    end
    object qryNUSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.VINUMAIN.SPRM'
      Size = 1
    end
    object qryNUCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.VINUMAIN.CPRM'
      Size = 1
    end
    object qryNUDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.VINUMAIN.DETI'
      Size = 1
    end
    object qryNUDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.VINUMAIN.DETIM'
      Size = 1
    end
    object qryNUDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.VINUMAIN.DETIK'
      Size = 1
    end
    object qryNUDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.VINUMAIN.DETIG'
      Size = 1
    end
    object qryNUIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.VINUMAIN.IND'
      Size = 1
    end
    object qryNUDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.VINUMAIN.DHD'
      Size = 1
    end
    object qryNUOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.VINUMAIN.OKLFND'
      Size = 1
    end
    object qryNUCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VINUMAIN.CBUDG'
      Size = 1
    end
    object qryNUSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.VINUMAIN.SNDB'
      Size = 1
    end
    object qryNUSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.VINUMAIN.SPDN'
      Size = 1
    end
    object qryNUSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.VINUMAIN.SPRF'
      Size = 1
    end
    object qryNUSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.VINUMAIN.SPENS'
      Size = 1
    end
    object qryNUSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.VINUMAIN.SALIM'
      Size = 1
    end
    object qryNUCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.VINUMAIN.CNDB'
      Size = 1
    end
    object qryNUSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.VINUMAIN.SSOCSTRAH'
      Size = 1
    end
    object qryNUSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.VINUMAIN.SBZR'
      Size = 1
    end
    object qryNUSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.VINUMAIN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.VINUMAIN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.VINUMAIN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.VINUMAIN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNUSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINUMAIN.SOVM'
      Size = 1
    end
    object qryNUSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.VINUMAIN.SPOV'
      Size = 1
    end
    object qryNUOZN_PILG: TStringField
      FieldName = 'OZN_PILG'
      Origin = 'DbMain.VINUMAIN.OZN_PILG'
      FixedChar = True
      Size = 10
    end
    object qryNUKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.VINUMAIN.KDBNK'
    end
    object qryNUSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.VINUMAIN.SSRK'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 224
    Top = 328
  end
  object qryOtklZaMG: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcMes
    SQL.Strings = (
      'Select * from ViOtkl'
      'where ZaMesGod = '#39'07/01/2007'#39
      'and TabN = 1239')
    Left = 472
    Top = 112
    object qryOtklZaMGNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VIOTKL.NR'
    end
    object qryOtklZaMGKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.VIOTKL.KDSPS'
    end
    object qryOtklZaMGDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VIOTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZaMGZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VIOTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZaMGTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VIOTKL.TABN'
    end
    object qryOtklZaMGVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VIOTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtklZaMGSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VIOTKL.SHVIDN'
      Size = 15
    end
    object qryOtklZaMGSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.VIOTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object qryOtklZaMGOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.VIOTKL.OLDKDVIDN'
    end
    object qryOtklZaMGCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.VIOTKL.CHAS'
    end
    object qryOtklZaMGSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VIOTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklZaMGKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1050#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VIOTKL.KDOBJ'
    end
    object qryOtklZaMGKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055#1050#1076
      FieldName = 'KDKATP'
      Origin = 'DbMain.VIOTKL.KDKATP'
    end
    object qryOtklZaMGDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VIOTKL.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklZaMGDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.VIOTKL.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklZaMGPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.VIOTKL.PDN'
    end
    object qryOtklZaMGKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VIOTKL.KDSPZ'
    end
    object qryOtklZaMGSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Origin = 'DbMain.VIOTKL.SCHBU'
      Size = 10
    end
    object qryOtklZaMGPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Origin = 'DbMain.VIOTKL.PSCH'
      Size = 10
    end
    object qryOtklZaMGNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.VIOTKL.NOTES'
      Size = 25
    end
    object qryOtklZaMGPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VIOTKL.PRR'
    end
    object qryOtklZaMGPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VIOTKL.PRPV'
    end
    object qryOtklZaMGKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VIOTKL.KTO'
    end
    object qryOtklZaMGPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VIOTKL.PRKR'
    end
    object qryOtklZaMGSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VIOTKL.SPEC_NR'
    end
    object qryOtklZaMGDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VIOTKL.DTVDPV'
    end
    object qryOtklZaMGNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VIOTKL.NRVDPV'
    end
    object qryOtklZaMGMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VIOTKL.MYNOTES'
      Size = 25
    end
    object qryOtklZaMGSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VIOTKL.SPECPS'
    end
    object qryOtklZaMGPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.VIOTKL.PBNK'
    end
  end
  object dsrcOtklZaMG: TDataSource
    DataSet = qryOtklZaMG
    Left = 488
    Top = 128
  end
  object qryNuZaMG: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcMes
    SQL.Strings = (
      'Select * from ViNuMain'
      'where ZaMesGod = '#39'05/01/2015'#39
      'and TabN = 1239'
      ''
      '')
    Left = 472
    Top = 320
    object qryNuZaMGVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VINUMAIN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuZaMGSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VINUMAIN.SHVIDN'
      Size = 15
    end
    object qryNuZaMGTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VINUMAIN.TABN'
    end
    object qryNuZaMGKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINUMAIN.KDSPS'
    end
    object qryNuZaMGPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Origin = 'DbMain.VINUMAIN.PSCH'
      Size = 10
    end
    object qryNuZaMGSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINUMAIN.SCHBU'
      Size = 10
    end
    object qryNuZaMGDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINUMAIN.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryNuZaMGZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINUMAIN.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryNuZaMGCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.VINUMAIN.CHAS'
    end
    object qryNuZaMGSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VINUMAIN.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryNuZaMGVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
      Origin = 'DbMain.VINUMAIN.VID_KDSPZ'
    end
    object qryNuZaMGVID_SPZ: TStringField
      FieldName = 'VID_SPZ'
      Origin = 'DbMain.VINUMAIN.VID_SPZ'
      Size = 10
    end
    object qryNuZaMGVID_KDSCHDT: TSmallintField
      FieldName = 'VID_KDSCHDT'
      Origin = 'DbMain.VINUMAIN.VID_KDSCHDT'
    end
    object qryNuZaMGVID_SCHDT: TStringField
      FieldName = 'VID_SCHDT'
      Origin = 'DbMain.VINUMAIN.VID_SCHDT'
      Size = 10
    end
    object qryNuZaMGVID_KDSCHKT: TSmallintField
      FieldName = 'VID_KDSCHKT'
      Origin = 'DbMain.VINUMAIN.VID_KDSCHKT'
    end
    object qryNuZaMGVID_SCHKT: TStringField
      FieldName = 'VID_SCHKT'
      Origin = 'DbMain.VINUMAIN.VID_SCHKT'
      Size = 10
    end
    object qryNuZaMGVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      Origin = 'DbMain.VINUMAIN.VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNuZaMGNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VINUMAIN.NR'
    end
    object qryNuZaMGDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINUMAIN.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNuZaMGDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.VINUMAIN.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNuZaMGKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1050#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINUMAIN.KDOBJ'
    end
    object qryNuZaMGKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055#1050#1076
      FieldName = 'KDKATP'
      Origin = 'DbMain.VINUMAIN.KDKATP'
    end
    object qryNuZaMGKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VINUMAIN.KDSPZ'
    end
    object qryNuZaMGPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.VINUMAIN.PDN'
    end
    object qryNuZaMGNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.VINUMAIN.NOTES'
      Size = 25
    end
    object qryNuZaMGPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VINUMAIN.PRR'
    end
    object qryNuZaMGPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VINUMAIN.PRPV'
    end
    object qryNuZaMGKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VINUMAIN.KTO'
    end
    object qryNuZaMGPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VINUMAIN.PRKR'
    end
    object qryNuZaMGMYNOTES: TStringField
      DisplayLabel = 'MyNotes'
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VINUMAIN.MYNOTES'
      Size = 25
    end
    object qryNuZaMGSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VINUMAIN.SPECPS'
    end
    object qryNuZaMGSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VINUMAIN.SPEC_NR'
    end
    object qryNuZaMGDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VINUMAIN.DTVDPV'
    end
    object qryNuZaMGNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VINUMAIN.NRVDPV'
    end
    object qryNuZaMGSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.VINUMAIN.STORN'
      FixedChar = True
      Size = 1
    end
    object qryNuZaMGZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.VINUMAIN.ZP13'
      Size = 1
    end
    object qryNuZaMGOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.VINUMAIN.OTP'
      Size = 1
    end
    object qryNuZaMGBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.VINUMAIN.BLN'
      Size = 1
    end
    object qryNuZaMGOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.VINUMAIN.OTPUSKN'
      Size = 1
    end
    object qryNuZaMGBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.VINUMAIN.BOLNIC'
      Size = 1
    end
    object qryNuZaMGSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.VINUMAIN.SPRM'
      Size = 1
    end
    object qryNuZaMGCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.VINUMAIN.CPRM'
      Size = 1
    end
    object qryNuZaMGDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.VINUMAIN.DETI'
      Size = 1
    end
    object qryNuZaMGDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.VINUMAIN.DETIM'
      Size = 1
    end
    object qryNuZaMGDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.VINUMAIN.DETIK'
      Size = 1
    end
    object qryNuZaMGDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.VINUMAIN.DETIG'
      Size = 1
    end
    object qryNuZaMGIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.VINUMAIN.IND'
      Size = 1
    end
    object qryNuZaMGDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.VINUMAIN.DHD'
      Size = 1
    end
    object qryNuZaMGOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.VINUMAIN.OKLFND'
      Size = 1
    end
    object qryNuZaMGCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VINUMAIN.CBUDG'
      Size = 1
    end
    object qryNuZaMGSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.VINUMAIN.SNDB'
      Size = 1
    end
    object qryNuZaMGSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.VINUMAIN.SPDN'
      Size = 1
    end
    object qryNuZaMGSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.VINUMAIN.SPRF'
      Size = 1
    end
    object qryNuZaMGSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.VINUMAIN.SPENS'
      Size = 1
    end
    object qryNuZaMGSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.VINUMAIN.SALIM'
      Size = 1
    end
    object qryNuZaMGCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.VINUMAIN.CNDB'
      Size = 1
    end
    object qryNuZaMGSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.VINUMAIN.SSOCSTRAH'
      Size = 1
    end
    object qryNuZaMGSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.VINUMAIN.SBZR'
      Size = 1
    end
    object qryNuZaMGSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.VINUMAIN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNuZaMGSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.VINUMAIN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNuZaMGSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.VINUMAIN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNuZaMGSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.VINUMAIN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNuZaMGSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINUMAIN.SOVM'
      Size = 1
    end
    object qryNuZaMGSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.VINUMAIN.SPOV'
      Size = 1
    end
    object qryNuZaMGOZN_PILG: TStringField
      FieldName = 'OZN_PILG'
      Origin = 'DbMain.VINUMAIN.OZN_PILG'
      FixedChar = True
      Size = 10
    end
    object qryNuZaMGKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.VINUMAIN.KDBNK'
    end
    object qryNuZaMGSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.VINUMAIN.SSRK'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcNuZaMG: TDataSource
    DataSet = qryNuZaMG
    Left = 488
    Top = 336
  end
  object cdsMes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'Tip'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end>
    IndexDefs = <
      item
        Name = 'OnDtProc'
        Fields = 'DtProc'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsMesAfterScroll
    OnCalcFields = cdsMesCalcFields
    Left = 40
    Top = 136
    Data = {
      4E0000009619E0BD0100000018000000030000000000030000004E0004546162
      4E0400010000000000035469700100490000000100055749445448020002000A
      0006447450726F6304000600000000000000}
    object cdsMesTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsMesTip: TStringField
      FieldName = 'Tip'
      Size = 10
    end
    object cdsMesDtProc: TDateField
      DisplayLabel = #1052#1077#1089#1043#1086#1076
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsMesMesGod: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1043#1086#1076
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Calculated = True
    end
  end
  object pop: TPopupMenu
    Left = 48
    Top = 320
    object popFont: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1096#1088#1080#1092#1090#1072' '#1090#1072#1073#1083#1080#1094
      OnClick = popFontClick
    end
  end
  object qryTmp: TQuery
    Left = 336
    Top = 112
  end
  object dsrcMes: TDataSource
    DataSet = cdsMes
    Left = 56
    Top = 152
  end
end
