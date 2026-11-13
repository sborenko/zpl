object FormTUpi: TFormTUpi
  Left = 138
  Top = 289
  Width = 785
  Height = 467
  BorderIcons = [biSystemMenu]
  Caption = 'FormTUpi'
  Color = clBtnFace
  Constraints.MaxWidth = 975
  Constraints.MinHeight = 390
  Constraints.MinWidth = 785
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
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      777
      30)
    object sBtnToArc: TSpeedButton
      Left = 591
      Top = 2
      Width = 40
      Height = 25
      Hint = #1055#1086#1084#1077#1089#1090#1080#1090#1100' '#1074' '#1072#1088#1093#1080#1074
      Anchors = [akTop, akRight]
      Caption = #1040#1088#1093' !'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnToArcClick
    end
    object sBtnUpi1: TSpeedButton
      Left = 3
      Top = 2
      Width = 73
      Height = 25
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1083#1080#1095#1085#1086#1075#1086' '#1089#1086#1089#1090#1072#1074#1072
      AllowAllUp = True
      GroupIndex = 7
      Down = True
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnUpi1Click
    end
    object sBtnUpi2: TSpeedButton
      Left = 79
      Top = 2
      Width = 67
      Height = 25
      Hint = #1051#1080#1095#1085#1099#1081' '#1089#1086#1089#1090#1072#1074' '#1089' '#1087#1086#1076#1088#1086#1073#1085#1086#1089#1090#1103#1084#1080
      AllowAllUp = True
      GroupIndex = 7
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnUpi2Click
    end
    object LabelSort: TLabel
      Left = 410
      Top = 8
      Width = 184
      Height = 13
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1085#1086' '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sBtnAddInSpsCurMes: TSpeedButton
      Left = 260
      Top = 2
      Width = 67
      Height = 25
      Hint = 
        #1042#1074#1077#1089#1090#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072'|'#1042#1074#1077#1089#1090#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1089 +
        #1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' ('#1077#1089#1083#1080' '#1077#1075#1086' '#1085#1077#1090' '#1074' '#1089#1087#1080#1089#1082#1077')'
      Caption = #1042' '#1089#1087#1080#1089#1086#1082' !'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnAddInSpsCurMesClick
    end
    object LabelCntRec: TLabel
      Left = 331
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnRefresh: TSpeedButton
      Left = 148
      Top = 2
      Width = 29
      Height = 25
      Hint = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnRefreshClick
    end
    object bBtnCancel: TBitBtn
      Left = 704
      Top = 2
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
    object bBtnOk: TBitBtn
      Left = 633
      Top = 2
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      Default = True
      TabOrder = 1
      OnClick = bBtnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object chBoxOnlyActive: TCheckBox
      Left = 475
      Top = 7
      Width = 99
      Height = 17
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' "'#1073#1086#1077#1074#1099#1093'" '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Anchors = [akTop, akRight]
      Caption = #1058#1086#1083#1100#1082#1086' '#1073#1086#1077#1074#1099#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = chBoxOnlyActiveClick
    end
    object DBNavigator1: TDBNavigator
      Left = 178
      Top = 2
      Width = 80
      Height = 25
      DataSource = dsrcUpi
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 30
    Width = 777
    Height = 389
    ActivePage = tsUpi2
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object tsUpi1: TTabSheet
      Caption = 'tsUpi1'
      object dbgrUpi1: TDBGrid
        Left = 0
        Top = 0
        Width = 769
        Height = 358
        Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
        Align = alClient
        Color = clCream
        DataSource = dsrcUpi
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = popUpi
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrUpi1DrawColumnCell
        OnDblClick = dbgrUpi1DblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LicSch'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtBegLS'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShBnk'
            Width = 68
            Visible = True
          end>
      end
    end
    object tsUpi2: TTabSheet
      Caption = 'tsUpi2'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 161
        Top = 26
        Height = 332
        Beveled = True
        Color = clTeal
        ParentColor = False
      end
      object PageControl2: TPageControl
        Left = 164
        Top = 26
        Width = 605
        Height = 332
        ActivePage = tsNadb
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        OnChange = PageControl2Change
        object tsPrmUv: TTabSheet
          Caption = #1055#1088#1080#1077#1084'/'#1059#1074#1086#1083#1100#1085#1077#1085#1080#1077
          ImageIndex = 4
          object dbgrPrmUv: TDBGrid
            Left = 0
            Top = 0
            Width = 597
            Height = 301
            Hint = #1055#1088#1080#1077#1084' / '#1059#1074#1086#1083#1100#1085#1077#1085#1080#1103' '#1085#1072' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
            Align = alClient
            Color = clCream
            DataSource = dsrcPrmUv
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbgrPrmUvDblClick
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'DT_PRIEM'
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_UVOLN'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_PRIKAZA'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_PRIKAZA'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_PRUVOLN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_PRUVOLN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTES'
                Width = 182
                Visible = True
              end>
          end
        end
        object tsPere: TTabSheet
          Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
          object dbgrPere: TDBGrid
            Left = 0
            Top = 0
            Width = 597
            Height = 301
            Hint = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' ('#1094#1074#1077#1090#1086#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1079#1072#1087#1080#1089#1080' '#1089' '#1082#1086#1084#1073#1080#1085#1080#1088#1086#1074#1072#1085#1085#1099#1084' '#1086#1082#1083#1072#1076#1086#1084')'
            Align = alClient
            Color = clCream
            DataSource = dsrcPere
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrPereDrawColumnCell
            OnDblClick = dbgrPereDblClick
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 18
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCWRKTIME'
                Title.Caption = '%'#1056#1073#1042#1088
                Width = 19
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDOBJ'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShObj'
                Title.Caption = #1055#1076#1088
                Width = 38
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShKatP'
                Title.Caption = #1050#1090#1075#1088
                Width = 28
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShSO'
                Title.Caption = #1057#1080#1089#1054#1087#1083
                Width = 29
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmCmbOkl'
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AVANS'
                Title.Caption = #1040#1074#1072#1085#1089
                Width = 31
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SP_AV'
                Title.Caption = '%'
                Width = 16
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOLGNOST'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_PRIKAZA'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_PRIKAZA'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Spz'
                Width = 31
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PR_PENS'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShSovm'
                Title.Caption = #1057#1086#1074#1084#1077#1089#1090'.'
                Width = 26
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShPdNlg'
                Title.Caption = #1057#1093#1055#1076#1085
                Width = 23
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCLG'
                Width = 36
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INV'
                Width = 21
                Visible = True
              end>
          end
        end
        object tsNadb: TTabSheet
          Caption = #1053#1072#1076#1073#1072#1074#1082#1080
          ImageIndex = 1
          object dbgrNadb: TDBGrid
            Left = 0
            Top = 0
            Width = 597
            Height = 301
            Hint = #1053#1072#1076#1073#1072#1074#1082#1080
            Align = alClient
            Color = clCream
            DataSource = dsrcNadb
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrNadbDrawColumnCell
            OnDblClick = dbgrNadbDblClick
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 18
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIDN'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShVidN'
                Title.Caption = #1064#1080#1092#1088#1042#1080#1076#1072
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMPROC'
                Title.Caption = #1057#1091#1084#1055#1088#1086#1094
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SP'
                Width = 17
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_END'
                Title.Caption = #1044#1090#1054#1082#1086#1085#1095'.'
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDOBJ'
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShObj'
                Title.Caption = #1055#1086#1076#1088'.'
                Width = 29
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShVed'
                Title.Caption = #1042#1077#1076#1086#1084
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NmKatP'
                Title.Caption = #1050#1090#1075#1055#1077#1088#1089
                Width = 24
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Spz'
                Title.Caption = #1064#1055#1047
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRC_WT'
                Visible = True
              end>
          end
        end
        object tsUdrg: TTabSheet
          Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103
          ImageIndex = 2
          object dbgrUdrg: TDBGrid
            Left = 0
            Top = 0
            Width = 597
            Height = 301
            Hint = #1059#1076#1077#1088#1078#1072#1085#1080#1103
            Align = alClient
            Color = clCream
            DataSource = dsrcUdrg
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrUdrgDrawColumnCell
            OnDblClick = dbgrUdrgDblClick
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIDN'
                Width = 38
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShVidN'
                Title.Caption = #1064#1080#1092#1088#1042#1080#1076#1072
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMDOLG'
                Title.Caption = #1057#1084#1044#1086#1083#1075#1072
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMVZN'
                Title.Caption = #1042#1079#1085#1086#1089
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SP'
                Width = 15
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_END'
                Title.Caption = #1044#1090#1054#1082#1086#1085#1095'.'
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMDOK'
                Title.Caption = #8470' '#1076#1086#1082'.'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SpZ'
                Title.Caption = #1057#1041#1059
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KOMU'
                Title.Caption = #1050#1086#1084#1091' '#1085#1072#1087#1088#1072#1074#1080#1090#1100
                Width = 109
                Visible = True
              end>
          end
        end
        object tsTotsNU: TTabSheet
          Caption = #1048#1090#1086#1075#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
          ImageIndex = 3
          object LabelTotsMsg: TLabel
            Left = 0
            Top = 288
            Width = 597
            Height = 13
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = 'LabelTotsMsg'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Splitter2: TSplitter
            Left = 0
            Top = 54
            Width = 597
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            Beveled = True
            Color = clGreen
            ParentColor = False
            Visible = False
          end
          object dbgrTotsNU: TDBGrid
            Left = 0
            Top = 0
            Width = 597
            Height = 54
            Hint = #1048#1090#1086#1075#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
            Align = alClient
            Color = clCream
            DataSource = dsrcTotsNU
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbgrTotsNUDblClick
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'MYMG'
                Title.Caption = #1042' '#1084#1077#1089#1103#1094#1077
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MesRus'
                Title.Caption = #1053#1072#1079#1074'. '#1084#1077#1089#1103#1094#1072
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMNACH'
                Title.Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMUDRG'
                Title.Caption = #1059#1076#1077#1088#1078#1072#1085#1086
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMVUPL'
                Title.Caption = #1042#1099#1087#1083#1072#1095#1077#1085#1086
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmNaRuki'
                Visible = True
              end>
          end
          object dbgrNuDet: TDBGrid
            Left = 0
            Top = 57
            Width = 597
            Height = 231
            Hint = 
              #1047#1072#1087#1080#1089#1080' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' / '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094'|'#1047#1072#1087#1080#1089#1080 +
              ' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' / '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' ('#1087#1086' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094 +
              #1077') '#1084#1077#1089#1103#1094
            Align = alBottom
            Color = clCream
            DataSource = dsrcNuDet
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Visible = False
            OnDrawColumnCell = dbgrNuDetDrawColumnCell
            OnDblClick = dbgrTotsNUDblClick
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 22
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIDN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SHVIDN'
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
                FieldName = 'OLDKDVIDN'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZAMESGOD'
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHAS'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMMA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_END'
                Width = 73
                Visible = True
              end>
          end
        end
      end
      object PanelLeft: TPanel
        Left = 0
        Top = 26
        Width = 161
        Height = 332
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object dbgrUpi2: TDBGrid
          Left = 0
          Top = 0
          Width = 161
          Height = 332
          Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
          Align = alClient
          Color = clCream
          DataSource = dsrcUpi
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popUpi
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrUpi2DrawColumnCell
          OnDblClick = dbgrUpi2DblClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'TABN'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FamIO'
              Width = 85
              Visible = True
            end>
        end
      end
      object PanelID: TPanel
        Left = 0
        Top = 0
        Width = 769
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'PanelID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object TabCtrlAlf: TTabControl
    Left = 0
    Top = 419
    Width = 777
    Height = 21
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Style = tsButtons
    TabOrder = 2
    Tabs.Strings = (
      '*'
      #1040
      #1041
      #1042
      #1043
      #1044
      #1045
      #1025
      #1028
      #1046
      #1047
      #1048
      #1030
      #1049
      #1050
      #1051
      #1052
      #1053
      #1054
      #1055
      #1056
      #1057
      #1058
      #1059
      #1060
      #1061
      #1062
      #1063
      #1064
      #1065
      #1069
      #1070
      #1071)
    TabIndex = 0
    TabWidth = 20
    OnChange = TabCtrlAlfChange
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 380
    Top = 140
    object popMnuHead: TMenuItem
      Caption = '== H e a d =='
      Enabled = False
    end
    object popMnuEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popMnuEdtClick
    end
    object popMnuAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popMnuAddClick
    end
    object popMnuDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popMnuDelClick
    end
    object popMnuSep1: TMenuItem
      Caption = '-'
    end
    object popMnuShwDetails: TMenuItem
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1087#1086#1076#1088#1086#1073#1085#1086'    (DblClick)'
      OnClick = popMnuShwDetailsClick
    end
    object popMnuSortNuDet: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popMnuSortNuDetByVidN: TMenuItem
        Caption = '- '#1087#1086' '#1074#1080#1076#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
        OnClick = popMnuSortNuDetByVidNClick
      end
      object popMnuSortNuDetByZaMG: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1103#1094#1043#1086#1076'"'
        Checked = True
        OnClick = popMnuSortNuDetByZaMGClick
      end
    end
    object popMnuSposobVubDet: TMenuItem
      Caption = #1057#1087#1086#1089#1086#1073' '#1074#1099#1073#1086#1088#1082#1080' ...'
      object popMnuSposobVubDetByCurSps: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1089#1087#1080#1089#1082#1091
        Checked = True
        OnClick = popMnuSposobVubDetByCurSpsClick
      end
      object popMnuSposobVubDetByAllSps: TMenuItem
        Caption = '- '#1087#1086' '#1074#1089#1077#1084' '#1089#1087#1080#1089#1082#1072#1084
        OnClick = popMnuSposobVubDetByAllSpsClick
      end
    end
    object popMnuTotsCase: TMenuItem
      Caption = #1048#1090#1086#1075#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' ...'
      Visible = False
      object popMnuTotsByDtProc: TMenuItem
        Caption = '- '#1087#1086' '#1084#1077#1089#1103#1094#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        Checked = True
        OnClick = popMnuTotsByDtProcClick
      end
      object popMnuTotsByZaMesGod: TMenuItem
        Caption = '- '#1087#1086' '#1084#1077#1089#1103#1094#1091' "'#1047#1072#1052#1077#1089#1043#1086#1076'"'
        OnClick = popMnuTotsByZaMesGodClick
      end
    end
    object popMnuPrtTots: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1074#1086#1076#1082#1080
      Enabled = False
      OnClick = popMnuPrtTotsClick
    end
    object popMnuNewPoisk: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ShortCut = 16454
      OnClick = popUpiNewPoiskClick
    end
  end
  object popUpi: TPopupMenu
    OnPopup = popUpiPopup
    Left = 80
    Top = 120
    object popUpiHead: TMenuItem
      Caption = '== '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' =='
      Enabled = False
    end
    object popUpiEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popUpiEdtClick
    end
    object popUpiAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popUpiAddClick
    end
    object popUpiDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popUpiDelClick
    end
    object popUpiSep1: TMenuItem
      Caption = '-'
    end
    object popUpiNewPoisk: TMenuItem
      Caption = #1055#1086#1080#1089#1082' ...'
      ShortCut = 16454
      OnClick = popUpiNewPoiskClick
    end
    object popUpiSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popUpiSortFamIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        Checked = True
        OnClick = popUpiSortFamIOClick
      end
      object popUpiSortTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = popUpiSortTabNClick
      end
      object popUpiSortByID: TMenuItem
        Caption = '- '#1087#1086' '#1085#1072#1083#1086#1075#1086#1074#1086#1084#1091' '#1048#1044
        OnClick = popUpiSortByIDClick
      end
    end
    object popUpiPrt: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      object popUpiPrtSpov: TMenuItem
        Caption = '- '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1057#1055#1054#1042' ('#1048#1053#1044#1040#1053#1048')'
        Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "ZaMesGod"'
        OnClick = popUpiPrtSpovClick
      end
      object popUpiPrtKred: TMenuItem
        Caption = '- '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1082#1088#1077#1076#1080#1090#1086#1074
        Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "ZaMesGod"'
        OnClick = popUpiPrtKredClick
      end
      object popUpiPrtSubs: TMenuItem
        Caption = '- '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1089#1091#1073#1089#1080#1076#1080#1081', '#1082#1072#1082' '#1087#1086' 1'#1044#1060
        Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "DtProc"'
        OnClick = popUpiPrtSubsClick
      end
      object popUpiPrtSprDhd: TMenuItem
        Caption = '- '#1089#1087#1088#1072#1074#1082#1080' '#1086' '#1076#1086#1093#1086#1076#1072#1093', '#1082#1072#1082' '#1087#1086' 1'#1044#1060' ('#1089' '#1087#1086#1076#1086#1093#1086#1076#1085#1099#1084')'
        Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "DtProc"'
        OnClick = popUpiPrtSprDhdClick
      end
      object popUpiPrtSprNlg: TMenuItem
        Caption = '- '#1089#1087#1088#1072#1074#1082#1080' '#1074' '#1085#1072#1083#1086#1075#1086#1074#1091#1102' '#1080#1085#1089#1087'. '#1092'.'#8470'2, '#1082#1072#1082' '#1087#1086' 1'#1044#1060
        Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "DtProc"'
        OnClick = popUpiPrtSprNlgClick
      end
      object popUpiArhivka: TMenuItem
        Caption = '- "'#1040#1088#1093#1080#1074#1082#1080'"'
        Hint = #1055#1077#1095#1072#1090#1100' '#1072#1088#1093#1080#1074#1082#1080' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        OnClick = popUpiArhivkaClick
      end
    end
    object popUpiSets: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' ...'
      object popUpiSetFont: TMenuItem
        Caption = '- '#1096#1088#1080#1092#1090' '#1090#1072#1073#1083#1080#1094
        OnClick = popUpiSetFontClick
      end
      object popUpiSetFon: TMenuItem
        Caption = '- '#1092#1086#1085' '#1090#1072#1073#1083#1080#1094
        OnClick = popUpiSetFonClick
      end
    end
    object popUpiSep2: TMenuItem
      Caption = '-'
    end
    object popUpiCheckUvoln: TMenuItem
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1091#1074#1086#1083#1077#1085#1085#1099#1093
      OnClick = popUpiCheckUvolnClick
    end
  end
  object qryTmp: TQuery
    Left = 32
    Top = 168
  end
  object qryTotsNU: TQuery
    AfterScroll = qryTotsNUAfterScroll
    OnCalcFields = qryTotsNUCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'Select TabN, KdSps, DtProc as MyMG, SmNach, SmUdrg, SmVupl'
      'from GETNU_TOTS_DTPROC (:TabN)')
    Left = 256
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryTotsNUTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryTotsNUMYMG: TDateTimeField
      FieldName = 'MYMG'
      DisplayFormat = 'mm/yyyy'
    end
    object qryTotsNUKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryTotsNUSMNACH: TFloatField
      FieldName = 'SMNACH'
      DisplayFormat = ',0.00'
    end
    object qryTotsNUSMVUPL: TFloatField
      FieldName = 'SMVUPL'
      DisplayFormat = ',0.00'
    end
    object qryTotsNUSMUDRG: TFloatField
      FieldName = 'SMUDRG'
      DisplayFormat = ',0.00'
    end
    object qryTotsNUMesRus: TStringField
      FieldKind = fkCalculated
      FieldName = 'MesRus'
      Calculated = True
    end
    object qryTotsNUSmNaRuki: TFloatField
      DisplayLabel = #1050' '#1074#1099#1087#1083#1072#1090#1077
      FieldKind = fkCalculated
      FieldName = 'SmNaRuki'
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
  object dsrcTotsNU: TDataSource
    DataSet = qryTotsNU
    Left = 264
    Top = 344
  end
  object qryNuDet: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcTotsNU
    SQL.Strings = (
      'select * '
      'from Vinu_Main '
      'where DtProc = "09/01/2006" and TabN = 23838 and'
      '          VidN < "8000"'
      'order by ZaMesGod, VidN')
    Left = 320
    Top = 328
    object qryNuDetVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VINU_MAIN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuDetSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VINU_MAIN.SHVIDN'
      Size = 15
    end
    object qryNuDetPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VINU_MAIN.PSCH'
      Size = 10
    end
    object qryNuDetSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINU_MAIN.SCHBU'
      Size = 10
    end
    object qryNuDetOLDKDVIDN: TSmallintField
      DisplayLabel = #1057#1090#1042#1080#1076
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.VINU_MAIN.OLDKDVIDN'
    end
    object qryNuDetVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
      Origin = 'DbMain.VINU_MAIN.VID_KDSPZ'
    end
    object qryNuDetKEKV: TStringField
      FieldName = 'KEKV'
      Origin = 'DbMain.VINU_MAIN.KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNuDetNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VINU_MAIN.NR'
    end
    object qryNuDetDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINU_MAIN.DTPROC'
    end
    object qryNuDetZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINU_MAIN.ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNuDetTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VINU_MAIN.TABN'
    end
    object qryNuDetCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.VINU_MAIN.CHAS'
    end
    object qryNuDetSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VINU_MAIN.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryNuDetDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINU_MAIN.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNuDetDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.VINU_MAIN.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNuDetKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINU_MAIN.KDSPS'
    end
    object qryNuDetKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINU_MAIN.KDOBJ'
    end
    object qryNuDetKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.VINU_MAIN.KDKATP'
    end
    object qryNuDetKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VINU_MAIN.KDSPZ'
    end
    object qryNuDetPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.VINU_MAIN.PDN'
    end
    object qryNuDetNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.VINU_MAIN.NOTES'
      Size = 25
    end
    object qryNuDetPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VINU_MAIN.PRR'
    end
    object qryNuDetPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VINU_MAIN.PRPV'
    end
    object qryNuDetKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VINU_MAIN.KTO'
    end
    object qryNuDetPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VINU_MAIN.PRKR'
    end
    object qryNuDetMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VINU_MAIN.MYNOTES'
      Size = 25
    end
    object qryNuDetSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VINU_MAIN.SPECPS'
    end
    object qryNuDetSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VINU_MAIN.SPEC_NR'
    end
    object qryNuDetOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.VINU_MAIN.OLDKDOBJ'
    end
    object qryNuDetZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.VINU_MAIN.ZP13'
      Size = 1
    end
    object qryNuDetOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.VINU_MAIN.OTP'
      Size = 1
    end
    object qryNuDetBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.VINU_MAIN.BLN'
      Size = 1
    end
    object qryNuDetOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.VINU_MAIN.OTPUSKN'
      Size = 1
    end
    object qryNuDetBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.VINU_MAIN.BOLNIC'
      Size = 1
    end
    object qryNuDetSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.VINU_MAIN.SPRM'
      Size = 1
    end
    object qryNuDetCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.VINU_MAIN.CPRM'
      Size = 1
    end
    object qryNuDetDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.VINU_MAIN.DETI'
      Size = 1
    end
    object qryNuDetDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.VINU_MAIN.DETIM'
      Size = 1
    end
    object qryNuDetDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.VINU_MAIN.DETIK'
      Size = 1
    end
    object qryNuDetDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.VINU_MAIN.DETIG'
      Size = 1
    end
    object qryNuDetIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.VINU_MAIN.IND'
      Size = 1
    end
    object qryNuDetDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.VINU_MAIN.DHD'
      Size = 1
    end
    object qryNuDetOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.VINU_MAIN.OKLFND'
      Size = 1
    end
    object qryNuDetCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VINU_MAIN.CBUDG'
      Size = 1
    end
    object qryNuDetSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.VINU_MAIN.SNDB'
      Size = 1
    end
    object qryNuDetSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.VINU_MAIN.SPDN'
      Size = 1
    end
    object qryNuDetSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.VINU_MAIN.SPRF'
      Size = 1
    end
    object qryNuDetSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.VINU_MAIN.SPENS'
      Size = 1
    end
    object qryNuDetSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.VINU_MAIN.SALIM'
      Size = 1
    end
    object qryNuDetCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.VINU_MAIN.CNDB'
      Size = 1
    end
    object qryNuDetSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.VINU_MAIN.SSOCSTRAH'
      Size = 1
    end
    object qryNuDetSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.VINU_MAIN.SBZR'
      Size = 1
    end
    object qryNuDetSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.VINU_MAIN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNuDetSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.VINU_MAIN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNuDetSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.VINU_MAIN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNuDetSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.VINU_MAIN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNuDetSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINU_MAIN.SOVM'
      Size = 1
    end
    object qryNuDetSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.VINU_MAIN.SPOV'
      Size = 1
    end
    object qryNuDetNMVIDN: TStringField
      FieldName = 'NMVIDN'
      Origin = 'DbMain.VINU_MAIN.NMVIDN'
      Size = 64
    end
    object qryNuDetNMSCH: TStringField
      FieldName = 'NMSCH'
      Origin = 'DbMain.VINU_MAIN.NMSCH'
      Size = 65
    end
  end
  object dsrcNuDet: TDataSource
    DataSet = qryNuDet
    Left = 328
    Top = 344
  end
  object qryPrmUv: TQuery
    CachedUpdates = True
    AfterPost = qryPrmUvAfterPost
    AfterDelete = qryPrmUvAfterDelete
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'select * from z_PrmUv'
      'where KdSps = 0 and TabN = :TabN'
      'order by Dt_Priem'
      '')
    UpdateObject = updPrmUv
    Left = 288
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TabN'
        ParamType = ptUnknown
      end>
    object qryPrmUvNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRMUV.NR'
    end
    object qryPrmUvKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
    end
    object qryPrmUvTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PRMUV.TABN'
    end
    object qryPrmUvDT_PRIEM: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1077#1084#1072
      FieldName = 'DT_PRIEM'
      Origin = 'DbMain.Z_PRMUV.DT_PRIEM'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvDT_UVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085
      FieldName = 'DT_UVOLN'
      Origin = 'DbMain.Z_PRMUV.DT_UVOLN'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvNR_PRIKAZA: TStringField
      DisplayLabel = #1053#1088#1055#1088#1055#1088#1080#1077#1084
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PRMUV.NR_PRIKAZA'
      Size = 10
    end
    object qryPrmUvDT_PRIKAZA: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1055#1088#1080#1077#1084
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PRMUV.DT_PRIKAZA'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvNR_PRUVOLN: TStringField
      DisplayLabel = #1053#1088#1055#1088#1059#1074#1086#1083#1085
      FieldName = 'NR_PRUVOLN'
      Origin = 'DbMain.Z_PRMUV.NR_PRUVOLN'
      Size = 10
    end
    object qryPrmUvDT_PRUVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1059#1074#1086#1083#1085
      FieldName = 'DT_PRUVOLN'
      Origin = 'DbMain.Z_PRMUV.DT_PRUVOLN'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PRMUV.NOTES'
      Size = 35
    end
  end
  object dsrcPrmUv: TDataSource
    DataSet = qryPrmUv
    Left = 296
    Top = 216
  end
  object qryPere: TQuery
    CachedUpdates = True
    BeforeInsert = qryPereBeforeInsert
    AfterPost = qryPereAfterPost
    AfterDelete = qryPereAfterDelete
    OnCalcFields = qryPereCalcFields
    OnNewRecord = qryPereNewRecord
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'Select * from Z_PERE'
      'where TabN = :TabN'
      'order by Dt_Beg, NR')
    UpdateObject = updPere
    Left = 344
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object qryPereKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_PERE.KDSPS'
    end
    object qryPereShSps: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShSps'
      Size = 15
      Calculated = True
    end
    object qryPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PERE.TABN'
    end
    object qryPereDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_PERE.DT_BEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPereDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_PERE.DT_END'
      OnSetText = DateFieldSetText
    end
    object qryPereKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_PERE.KDKATP'
      OnValidate = FldKdKatPValidate
    end
    object qryPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'DbMain.Z_PERE.SO'
      OnValidate = FldSoValidate
    end
    object qryPereOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_PERE.OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryPereSmCmbOkl: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076'('#1058#1072#1088#1080#1092')'
      FieldKind = fkCalculated
      FieldName = 'SmCmbOkl'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object qryPereAVANS: TFloatField
      FieldName = 'AVANS'
      Origin = 'DbMain.Z_PERE.AVANS'
    end
    object qryPereSP_AV: TStringField
      FieldName = 'SP_AV'
      Origin = 'DbMain.Z_PERE.SP_AV'
      Size = 1
    end
    object qryPereKDDOLGN: TSmallintField
      FieldName = 'KDDOLGN'
      Origin = 'DbMain.Z_PERE.KDDOLGN'
    end
    object qryPereDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNOST'
      Origin = 'DbMain.Z_PERE.DOLGNOST'
      Size = 40
    end
    object qryPerePR_PENS: TSmallintField
      DisplayLabel = #1055#1077#1085#1089#1080#1086#1085#1077#1088
      FieldName = 'PR_PENS'
      Origin = 'DbMain.Z_PERE.PR_PENS'
    end
    object qryPereSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_PERE.SOVM'
      OnValidate = FldSovmValidate
    end
    object qryPereShSovm: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShSovm'
      Size = 15
      Calculated = True
    end
    object qryPerePDNLG: TSmallintField
      FieldName = 'PDNLG'
      Origin = 'DbMain.Z_PERE.PDNLG'
      OnValidate = FldPdNlgValidate
    end
    object qryPerePROCLG: TFloatField
      DisplayLabel = '% '#1083#1100#1075#1086#1090#1099
      FieldName = 'PROCLG'
      Origin = 'DbMain.Z_PERE.PROCLG'
    end
    object qryPereKOLMIN: TSmallintField
      DisplayLabel = #1050'-'#1074#1086' '#1084#1080#1085#1080#1084#1091#1084#1086#1074
      FieldName = 'KOLMIN'
      Origin = 'DbMain.Z_PERE.KOLMIN'
    end
    object qryPereShSO: TStringField
      DisplayLabel = #1057#1080#1089#1090#1054#1087#1083
      FieldKind = fkCalculated
      FieldName = 'ShSO'
      Size = 25
      Calculated = True
    end
    object qryPereShPdNlg: TStringField
      DisplayLabel = #1057#1093#1055#1076#1053#1083#1075
      FieldKind = fkCalculated
      FieldName = 'ShPdNlg'
      Size = 25
      Calculated = True
    end
    object qryPereKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PERE.KDOBJ'
      OnValidate = FldKdObjJValidate
    end
    object qryPereShObj: TStringField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 10
      Calculated = True
    end
    object qryPereShKatP: TStringField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldKind = fkCalculated
      FieldName = 'ShKatP'
      Size = 10
      Calculated = True
    end
    object qryPereNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PERE.NOTES'
      Size = 35
    end
    object qryPereNPD: TSmallintField
      FieldName = 'NPD'
      Origin = 'DbMain.Z_PERE.NPD'
      OnValidate = qryPereNPDValidate
    end
    object qryPerePRCWRKTIME: TFloatField
      DisplayLabel = '%'#1056#1072#1073#1042#1088#1077#1084
      FieldName = 'PRCWRKTIME'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object qryPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_PERE.KDSPZ'
    end
    object qryPereSpz: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'Spz'
      Size = 15
      Calculated = True
    end
    object qryPerePRFS: TSmallintField
      DisplayLabel = #1055#1088#1092#1057#1079
      FieldName = 'PRFS'
      Origin = 'DbMain.Z_PERE.PRFS'
    end
    object qryPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_PERE.OLDKDOBJ'
    end
    object qryPereNR_PRIKAZA: TStringField
      DisplayLabel = #8470' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PERE.NR_PRIKAZA'
      Size = 10
    end
    object qryPereRAZR: TSmallintField
      DisplayLabel = #1056#1072#1079#1088'.'
      FieldName = 'RAZR'
      Origin = 'DbMain.Z_PERE.RAZR'
    end
    object qryPereDT_PRIKAZA: TDateTimeField
      DisplayLabel = #1044#1090' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PERE.DT_PRIKAZA'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPereRANG: TSmallintField
      DisplayLabel = #1056#1072#1085#1075
      FieldName = 'RANG'
      Origin = 'DbMain.Z_PERE.RANG'
    end
    object qryPereINV: TSmallintField
      DisplayLabel = #1048#1085#1074'.'
      FieldName = 'INV'
      Origin = 'DbMain.Z_PERE.INV'
    end
    object qryPerePRDEKR: TStringField
      DisplayLabel = #1044#1077#1082#1088
      FieldName = 'PRDEKR'
      Origin = 'DbMain.Z_PERE.PRDEKR'
      FixedChar = True
      Size = 1
    end
    object qryPereCMBOKL: TStringField
      FieldName = 'CMBOKL'
      Origin = 'DbMain.Z_PERE.CMBOKL'
      FixedChar = True
      Size = 1
    end
    object qryPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_PERE.SPEC_NR'
    end
    object qryPereNRPKT: TIntegerField
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_PERE.NRPKT'
    end
    object qryPereDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
      Origin = 'DbMain.Z_PERE.DTVPKT'
    end
    object qryPereNOINDX: TStringField
      FieldName = 'NOINDX'
      Origin = 'DbMain.Z_PERE.NOINDX'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcPere: TDataSource
    DataSet = qryPere
    Left = 352
    Top = 216
  end
  object updPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_PERE'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  NPD = :NPD,'
      '  PRCWRKTIME = :PRCWRKTIME,'
      '  SO = :SO,'
      '  OKLTRF = :OKLTRF,'
      '  AVANS = :AVANS,'
      '  SP_AV = :SP_AV,'
      '  KDDOLGN = :KDDOLGN,'
      '  DOLGNOST = :DOLGNOST,'
      '  KDSPZ = :KDSPZ,'
      '  PR_PENS = :PR_PENS,'
      '  SOVM = :SOVM,'
      '  PDNLG = :PDNLG,'
      '  PROCLG = :PROCLG,'
      '  KOLMIN = :KOLMIN,'
      '  PRFS = :PRFS,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NOTES = :NOTES,'
      '  INV = :INV,'
      '  RANG = :RANG,'
      '  RAZR = :RAZR,'
      '  DT_END = :DT_END,'
      '  PRDEKR = :PRDEKR,'
      '  CMBOKL = :CMBOKL,'
      '  SPEC_NR = :SPEC_NR,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  NOINDX = :NOINDX'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_PERE'
      
        '  (KDSPS, TABN, DT_BEG, KDOBJ, KDKATP, NPD, PRCWRKTIME, SO, OKLT' +
        'RF, '
      'AVANS, SP_AV, '
      
        '   KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM, PDNLG, PROCLG, KOLMI' +
        'N, '
      'PRFS, '
      
        '   NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RANG, RAZR, DT_END, PRDEK' +
        'R, '
      'CMBOKL, '
      '   SPEC_NR, NRPKT, DTVPKT, NOINDX)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_BEG, :KDOBJ, :KDKATP, :NPD, :PRCWRKTIME, :' +
        'SO, '
      ':OKLTRF, '
      
        '   :AVANS, :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :PR_PENS, :SOVM,' +
        ' '
      ':PDNLG, '
      
        '   :PROCLG, :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIKAZA, :NOTES, :I' +
        'NV, '
      ':RANG, '
      '   :RAZR, :DT_END, :PRDEKR, :CMBOKL, :SPEC_NR, :NRPKT, :DTVPKT, '
      ':NOINDX)')
    DeleteSQL.Strings = (
      'delete from Z_PERE'
      'where'
      '  NR = :OLD_NR')
    Left = 360
    Top = 232
  end
  object qryNadb: TQuery
    CachedUpdates = True
    AfterPost = qryNadbAfterPost
    AfterDelete = qryNadbAfterDelete
    OnCalcFields = qryNadbCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'select * from z_Nadb'
      'where TabN = :TabN'
      'order by Dt_Beg, VidN')
    UpdateObject = updNadb
    Left = 480
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryNadbNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NADB.NR'
    end
    object qryNadbKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NADB.KDSPS'
    end
    object qryNadbSPSRSCH: TIntegerField
      FieldName = 'SPSRSCH'
    end
    object qryNadbTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NADB.TABN'
    end
    object qryNadbVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NADB.VIDN'
      OnValidate = FldVidNValidate
      FixedChar = True
      Size = 4
    end
    object qryNadbSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      FieldName = 'SUMPROC'
      Origin = 'DbMain.Z_NADB.SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryNadbSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_NADB.SP'
      Size = 1
    end
    object qryNadbPRCSOVM: TFloatField
      DisplayLabel = '% '#1089#1086#1074#1084
      FieldName = 'PRCSOVM'
      Origin = 'DbMain.Z_NADB.PRCSOVM'
    end
    object qryNadbDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NADB.DT_BEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NADB.DT_END'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NADB.KDOBJ'
      OnValidate = FldKdObjJValidate
    end
    object qryNadbKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1055#1077#1088#1089
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NADB.KDKATP'
      OnValidate = FldKdKatPValidate
    end
    object qryNadbPRCHS: TStringField
      FieldName = 'PRCHS'
      Origin = 'DbMain.Z_NADB.PRCHS'
      Size = 1
    end
    object qryNadbPRSMM: TStringField
      FieldName = 'PRSMM'
      Origin = 'DbMain.Z_NADB.PRSMM'
      Size = 1
    end
    object qryNadbNmKatP: TStringField
      DisplayLabel = #1050#1090#1055#1077#1088#1089
      FieldKind = fkCalculated
      FieldName = 'NmKatP'
      Size = 10
      Calculated = True
    end
    object qryNadbShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryNadbShObj: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 10
      Calculated = True
    end
    object qryNadbKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NADB.KDSPZ'
    end
    object qryNadbSpz: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'Spz'
      Size = 15
      Calculated = True
    end
    object qryNadbSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryNadbNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NADB.NOTES'
      Size = 25
    end
    object qryNadbNRPRBEG: TStringField
      DisplayLabel = #8470#1053#1072#1095#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'NRPRBEG'
      Origin = 'DbMain.Z_NADB.NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNadbDTPRBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DTPRBEG'
      Origin = 'DbMain.Z_NADB.DTPRBEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbNRPREND: TStringField
      DisplayLabel = #8470#1050#1086#1085#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'NRPREND'
      Origin = 'DbMain.Z_NADB.NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNadbDTPREND: TDateTimeField
      DisplayLabel = #1044#1090#1050#1086#1085#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DTPREND'
      Origin = 'DbMain.Z_NADB.DTPREND'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbNRPKT: TIntegerField
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_NADB.NRPKT'
    end
    object qryNadbDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
      Origin = 'DbMain.Z_NADB.DTVPKT'
    end
    object qryNadbPRC_WT: TFloatField
      DisplayLabel = '% '#1056#1072#1073#1042#1088
      FieldName = 'PRC_WT'
      Origin = 'DbMain.Z_NADB.PRC_WT'
    end
    object qryNadbSPOV_MERGE: TStringField
      FieldName = 'SPOV_MERGE'
      Size = 1
    end
  end
  object dsrcNadb: TDataSource
    DataSet = qryNadb
    Left = 488
    Top = 216
  end
  object updNadb: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Nadb'
      'set'
      '  KDSPS = :KDSPS,'
      '  SPSRSCH = :SPSRSCH,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  PRCSOVM = :PRCSOVM,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCHS = :PRCHS,'
      '  PRSMM = :PRSMM,'
      '  KDSPZ = :KDSPZ,'
      '  SPEC_NR = :SPEC_NR,'
      '  NOTES = :NOTES,'
      '  NRPRBEG = :NRPRBEG,'
      '  DTPRBEG = :DTPRBEG,'
      '  NRPREND = :NRPREND,'
      '  DTPREND = :DTPREND,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  PRC_WT = :PRC_WT,'
      '  SPOV_MERGE = :SPOV_MERGE'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Nadb'
      
        '  (KDSPS, SPSRSCH, TABN, VIDN, SUMPROC, SP, PRCSOVM, DT_BEG, DT_' +
        'END, '
      'KDOBJ, '
      
        '   KDKATP, PRCHS, PRSMM, KDSPZ, SPEC_NR, NOTES, NRPRBEG, DTPRBEG' +
        ', '
      'NRPREND, '
      '   DTPREND, NRPKT, DTVPKT, PRC_WT, SPOV_MERGE)'
      'values'
      
        '  (:KDSPS, :SPSRSCH, :TABN, :VIDN, :SUMPROC, :SP, :PRCSOVM, :DT_' +
        'BEG, '
      ':DT_END, '
      
        '   :KDOBJ, :KDKATP, :PRCHS, :PRSMM, :KDSPZ, :SPEC_NR, :NOTES, :N' +
        'RPRBEG, '
      '   :DTPRBEG, :NRPREND, :DTPREND, :NRPKT, :DTVPKT, :PRC_WT, '
      ':SPOV_MERGE)')
    DeleteSQL.Strings = (
      'delete from z_Nadb'
      'where'
      '  NR = :OLD_NR')
    Left = 496
    Top = 232
  end
  object qryUdrg: TQuery
    CachedUpdates = True
    AfterPost = qryUdrgAfterPost
    AfterDelete = qryUdrgAfterDelete
    OnCalcFields = qryUdrgCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'select * from z_Uderg'
      'where TabN = :TabN'
      'order by Dt_Beg, VidN')
    UpdateObject = updUdrg
    Left = 536
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryUdrgNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UDERG.NR'
    end
    object qryUdrgKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_UDERG.KDSPS'
    end
    object qryUdrgTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UDERG.TABN'
    end
    object qryUdrgVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_UDERG.VIDN'
      OnValidate = FldVidNValidate
      FixedChar = True
      Size = 4
    end
    object qryUdrgSUMDOLG: TFloatField
      DisplayLabel = #1054#1073#1097#1057#1084#1044#1086#1083#1075#1072
      FieldName = 'SUMDOLG'
      Origin = 'DbMain.Z_UDERG.SUMDOLG'
      DisplayFormat = '#.00'
    end
    object qryUdrgSUMVZN: TFloatField
      DisplayLabel = #1057#1084'(%)'#1059#1076#1088#1078
      FieldName = 'SUMVZN'
      Origin = 'DbMain.Z_UDERG.SUMVZN'
      DisplayFormat = '#.00'
    end
    object qryUdrgSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_UDERG.SP'
      Size = 1
    end
    object qryUdrgNOMDOK: TStringField
      DisplayLabel = #8470' '#1076#1086#1082'-'#1090#1072
      FieldName = 'NOMDOK'
      Origin = 'DbMain.Z_UDERG.NOMDOK'
      Size = 10
    end
    object qryUdrgDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_UDERG.DT_BEG'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUdrgDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_UDERG.DT_END'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUdrgKDRSSCH: TIntegerField
      FieldName = 'KDRSSCH'
      Origin = 'DbMain.Z_UDERG.KDRSSCH'
    end
    object qryUdrgKOMU: TStringField
      DisplayLabel = #1050#1086#1084#1091' '#1085#1072#1087#1088#1072#1074#1083#1103#1090#1100
      FieldName = 'KOMU'
      Origin = 'DbMain.Z_UDERG.KOMU'
      Size = 95
    end
    object qryUdrgShVidN: TStringField
      DisplayLabel = #1042#1080#1076#1059#1076#1077#1088#1078
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 10
      Calculated = True
    end
    object qryUdrgKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_UDERG.KDSPZ'
    end
    object qryUdrgPROC_PSB: TFloatField
      FieldName = 'PROC_PSB'
      Origin = 'DbMain.Z_UDERG.NR'
    end
    object qryUdrgSpz: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'SpZ'
      Size = 15
      Calculated = True
    end
    object qryUdrgADRES: TStringField
      FieldName = 'ADRES'
      Origin = 'DbMain.Z_UDERG.ADRES'
      Size = 250
    end
    object qryUdrgKDPST: TIntegerField
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_UDERG.KDPST'
    end
    object qryUdrgShPst: TStringField
      DisplayLabel = #1055#1086#1095#1090#1072
      FieldKind = fkCalculated
      FieldName = 'ShPst'
      Size = 10
      Calculated = True
    end
    object qryUdrgPOSTA: TStringField
      FieldName = 'POSTA'
      Origin = 'DbMain.Z_UDERG.POSTA'
      FixedChar = True
      Size = 1
    end
    object qryUdrgNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_UDERG.NOTES'
      Size = 150
    end
    object qryUdrgNOMSBERBANK: TStringField
      FieldName = 'NOMSBERBANK'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgLICSCHET: TStringField
      FieldName = 'LICSCHET'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgRSCHET: TStringField
      FieldName = 'RSCHET'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgBANK: TStringField
      FieldName = 'BANK'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 55
    end
    object qryUdrgOKPOBANKA: TStringField
      FieldName = 'OKPOBANKA'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_UDERG.SPSRSCH'
    end
    object qryUdrgSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_UDERG.SPEC_NR'
    end
    object qryUdrgNmPst: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmPst'
      Size = 65
      Calculated = True
    end
    object qryUdrgS_P: TStringField
      DisplayLabel = '%'
      FieldKind = fkCalculated
      FieldName = 'S_P'
      Size = 1
      Calculated = True
    end
    object qryUdrgNRPOST: TStringField
      FieldName = 'NRPOST'
      Origin = 'DbMain.Z_UDERG.NRPOST'
      Size = 10
    end
    object qryUdrgDTPOST: TDateTimeField
      FieldName = 'DTPOST'
      Origin = 'DbMain.Z_UDERG.DTPOST'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcUdrg: TDataSource
    DataSet = qryUdrg
    Left = 544
    Top = 216
  end
  object updUdrg: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Uderg'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  SUMDOLG = :SUMDOLG,'
      '  SUMVZN = :SUMVZN,'
      '  SPSRSCH = :SPSRSCH,'
      '  SP = :SP,'
      '  NOMDOK = :NOMDOK,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDSPZ = :KDSPZ,'
      '  KDRSSCH = :KDRSSCH,'
      '  KOMU = :KOMU,'
      '  ADRES = :ADRES,'
      '  KDPST = :KDPST,'
      '  POSTA = :POSTA,'
      '  NOTES = :NOTES,'
      '  NOMSBERBANK = :NOMSBERBANK,'
      '  LICSCHET = :LICSCHET,'
      '  RSCHET = :RSCHET,'
      '  BANK = :BANK,'
      '  OKPOBANKA = :OKPOBANKA,'
      '  PROC_PSB = :PROC_PSB,'
      '  SPEC_NR = :SPEC_NR,'
      '  NRPOST = :NRPOST,'
      '  DTPOST = :DTPOST'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Uderg'
      
        '  (KDSPS, TABN, VIDN, SUMDOLG, SUMVZN, SPSRSCH, SP, NOMDOK, DT_B' +
        'EG, '
      'DT_END, '
      
        '   KDSPZ, KDRSSCH, KOMU, ADRES, KDPST, POSTA, NOTES, NOMSBERBANK' +
        ', '
      'LICSCHET, '
      '   RSCHET, BANK, OKPOBANKA, PROC_PSB, SPEC_NR, NRPOST, DTPOST)'
      'values'
      
        '  (:KDSPS, :TABN, :VIDN, :SUMDOLG, :SUMVZN, :SPSRSCH, :SP, :NOMD' +
        'OK, '
      ':DT_BEG, '
      
        '   :DT_END, :KDSPZ, :KDRSSCH, :KOMU, :ADRES, :KDPST, :POSTA, :NO' +
        'TES, '
      ':NOMSBERBANK, '
      '   :LICSCHET, :RSCHET, :BANK, :OKPOBANKA, :PROC_PSB, :SPEC_NR, '
      ':NRPOST, '
      '   :DTPOST)')
    DeleteSQL.Strings = (
      'delete from z_Uderg'
      'where'
      '  NR = :OLD_NR')
    Left = 552
    Top = 232
  end
  object updPrmUv: TUpdateSQL
    ModifySQL.Strings = (
      'update z_PrmUv'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_PRIEM = :DT_PRIEM,'
      '  DT_UVOLN = :DT_UVOLN,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NR_PRUVOLN = :NR_PRUVOLN,'
      '  DT_PRUVOLN = :DT_PRUVOLN,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_PrmUv'
      
        '  (KDSPS, TABN, DT_PRIEM, DT_UVOLN, NR_PRIKAZA, DT_PRIKAZA, NR_P' +
        'RUVOLN, '
      '   DT_PRUVOLN, NOTES)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_PRIEM, :DT_UVOLN, :NR_PRIKAZA, :DT_PRIKAZA' +
        ', :NR_PRUVOLN, '
      '   :DT_PRUVOLN, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_PrmUv'
      'where'
      '  NR = :OLD_NR')
    Left = 312
    Top = 232
  end
  object dsrcUpi: TDataSource
    DataSet = DmMain.qryUpi
    OnDataChange = dsrcUpiDataChange
    Left = 32
    Top = 120
  end
  object qryDPere: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    DataSource = dsrcPere
    SQL.Strings = (
      'Select * from Z_CmbOkl'
      'where Spec_NR = :Spec_NR'
      'order by OklTrf desc')
    UpdateObject = updDPere
    Left = 393
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryDPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_CMBOKL.NR'
    end
    object qryDPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_CMBOKL.TABN'
    end
    object qryDPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_CMBOKL.SPEC_NR'
    end
    object qryDPerePRCOKL: TFloatField
      DisplayLabel = '%'#1086#1082#1083#1072#1076#1072
      FieldName = 'PRCOKL'
      Origin = 'DbMain.Z_CMBOKL.OKLTRF'
    end
    object qryDPereOKLTRF: TFloatField
      DisplayLabel = #1057#1084#1054#1082#1083#1072#1076#1072
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_CMBOKL.OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryDPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_CMBOKL.KDSPZ'
    end
    object qryDPereSpz: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'Spz'
      Size = 10
      Calculated = True
    end
    object qryDPereNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_CMBOKL.NOTES'
      Size = 35
    end
  end
  object dsrcDPere: TDataSource
    DataSet = qryDPere
    Left = 401
    Top = 216
  end
  object updDPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_CmbOkl'
      'set'
      '  TABN = :TABN,'
      '  SPEC_NR = :SPEC_NR,'
      '  PRCOKL = :PRCOKL,'
      '  OKLTRF = :OKLTRF,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_CmbOkl'
      '  (TABN, SPEC_NR, PRCOKL, OKLTRF, KDSPZ, NOTES)'
      'values'
      '  (:TABN, :SPEC_NR, :PRCOKL, :OKLTRF, :KDSPZ, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_CmbOkl'
      'where'
      '  NR = :OLD_NR')
    Left = 409
    Top = 232
  end
end
