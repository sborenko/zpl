object FormUpi: TFormUpi
  Left = 325
  Top = 140
  Width = 785
  Height = 554
  BorderIcons = [biSystemMenu]
  Caption = 'FormUpi'
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
      Left = 331
      Top = 8
      Width = 184
      Height = 13
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1085#1086' '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
    end
    object sBtnAddInSpsCurMes: TSpeedButton
      Left = 525
      Top = 2
      Width = 96
      Height = 25
      Hint = 
        #1042#1074#1077#1089#1090#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072'|'#1042#1074#1077#1089#1090#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1089 +
        #1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' ('#1077#1089#1083#1080' '#1077#1075#1086' '#1085#1077#1090' '#1074' '#1089#1087#1080#1089#1082#1077')'
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1077#1089#1090#1080' '#1074' '#1089#1087#1080#1089#1086#1082
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnAddInSpsCurMesClick
    end
    object LabelCntRec: TLabel
      Left = 252
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object bBtnCancel: TBitBtn
      Left = 699
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
    object bBtnOk: TBitBtn
      Left = 623
      Top = 2
      Width = 75
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
      Left = 148
      Top = 7
      Width = 99
      Height = 17
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' "'#1073#1086#1077#1074#1099#1093'" '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Alignment = taLeftJustify
      Caption = #1058#1086#1083#1100#1082#1086' '#1073#1086#1077#1074#1099#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = chBoxOnlyActiveClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 30
    Width = 777
    Height = 497
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
        Height = 484
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
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOB'
            Title.Caption = #1044#1090#1056#1086#1078#1076'.'
            Width = 60
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
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MYPRUV'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LICSCH'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHBNK'
            Width = 71
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
        Height = 440
        Beveled = True
        Color = clAqua
        ParentColor = False
      end
      object PageControl2: TPageControl
        Left = 164
        Top = 26
        Width = 605
        Height = 440
        ActivePage = tsTotsNU
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
            Height = 409
            Hint = #1055#1088#1080#1077#1084' / '#1059#1074#1086#1083#1100#1085#1077#1085#1080#1103' '#1085#1072' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
            Align = alClient
            Color = clCream
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
            OnDblClick = dbgrPrmUvDblClick
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
            Height = 409
            Hint = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
            Align = alClient
            Color = clCream
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
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 18
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PrcWrkTime'
                Title.Caption = '%'#1056#1073#1042#1088
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Title.Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShObj'
                Title.Caption = #1055#1076#1088
                Width = 32
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
                Width = 19
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OKLTRF'
                Width = 26
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
                Width = 15
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
                FieldName = 'SPZ'
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
                FieldName = 'KOLMIN'
                Width = 26
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INV'
                Width = 12
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
            Height = 409
            Hint = #1053#1072#1076#1073#1072#1074#1082#1080
            Align = alClient
            Color = clCream
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
            OnDblClick = dbgrNadbDblClick
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
                Title.Caption = #1042#1080#1076
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
                Title.Caption = '%'
                Width = 17
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Title.Caption = #1044#1090#1053#1072#1095#1072#1083#1072
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
                FieldName = 'SPZ'
                Title.Caption = #1064#1055#1047
                Width = 33
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
            Height = 409
            Hint = #1059#1076#1077#1088#1078#1072#1085#1080#1103
            Align = alClient
            Color = clCream
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
            OnDblClick = dbgrUdrgDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 18
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDVIDN'
                Title.Caption = #1042#1080#1076
                Width = 28
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
                Title.Caption = '%'
                Width = 15
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Title.Caption = #1044#1090#1053#1072#1095#1072#1083#1072
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
                FieldName = 'SPZ'
                Title.Caption = #1057#1041#1059
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KOMU'
                Title.Caption = #1050#1086#1084#1091' '#1085#1072#1087#1088#1072#1074#1080#1090#1100
                Width = 42
                Visible = True
              end>
          end
        end
        object tsTotsNU: TTabSheet
          Caption = #1048#1090#1086#1075#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
          ImageIndex = 3
          object LabelTotsMsg: TLabel
            Left = 0
            Top = 396
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
            Top = 162
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
            Height = 162
            Hint = #1048#1090#1086#1075#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
            Align = alClient
            Color = clCream
            DataSource = dsrcTotsNU
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
            Top = 165
            Width = 597
            Height = 231
            Hint = 
              #1047#1072#1087#1080#1089#1080' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' / '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094'|'#1047#1072#1087#1080#1089#1080 +
              ' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' / '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' ('#1087#1086' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094 +
              #1077') '#1084#1077#1089#1103#1094
            Align = alBottom
            Color = clCream
            DataSource = dsrcNuDet
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
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
        Height = 440
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          161
          440)
        object dbgrUpi2: TDBGrid
          Left = 0
          Top = 0
          Width = 161
          Height = 436
          Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
          Anchors = [akLeft, akTop, akRight, akBottom]
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
  object qryUpi: TQuery
    CachedUpdates = True
    AfterPost = qryUpiAfterPost
    AfterDelete = qryUpiAfterDelete
    AfterScroll = qryUpiAfterScroll
    OnCalcFields = qryUpiCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select Cast(0 as SmallInt) as MyPrUv, u.* ,'
      '           LS.TabN as LSTN, LS.LicSch, bnk.ShBnk '
      'from Z_UPI u '
      '       Left Outer Join Z_BankiLS LS on (LS.TabN = u.Tabn) '
      '       Left Outer Join Z_Banki bnk on (bnk.KdBnk = LS.KdBnk)'
      'order by u.Fam, u.Ima, u.Otch'
      '')
    UpdateObject = updUpi
    Left = 24
    Top = 128
    object qryUpiNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UPI.NR'
    end
    object qryUpiTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UPI.TABN'
    end
    object qryUpiPRUV: TSmallintField
      FieldName = 'PRUV'
      Origin = 'DbMain.Z_UPI.PRUV'
    end
    object qryUpiFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
      Origin = 'DbMain.Z_UPI.FAM'
    end
    object qryUpiIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Origin = 'DbMain.Z_UPI.IMA'
      Size = 15
    end
    object qryUpiOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
      Origin = 'DbMain.Z_UPI.OTCH'
    end
    object qryUpiDOB: TDateTimeField
      FieldName = 'DOB'
    end
    object qryUpiPOL: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'POL'
      Origin = 'DbMain.Z_UPI.POL'
      Size = 1
    end
    object qryUpiID: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      FieldName = 'ID'
      Origin = 'DbMain.Z_UPI.ID'
      Size = 10
    end
    object qryUpiFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryUpiLASTDTPRM: TDateTimeField
      FieldName = 'LASTDTPRM'
      Origin = 'DbMain.Z_UPI.LASTDTPRM'
    end
    object qryUpiLASTDTUVL: TDateTimeField
      FieldName = 'LASTDTUVL'
      Origin = 'DbMain.Z_UPI.LASTDTUVL'
    end
    object qryUpiMYPRUV: TSmallintField
      FieldName = 'MYPRUV'
    end
    object qryUpiMYNOTES: TStringField
      FieldName = 'MYNOTES'
      FixedChar = True
      Size = 25
    end
    object qryUpiLSTN: TIntegerField
      FieldName = 'LSTN'
    end
    object qryUpiLICSCH: TStringField
      DisplayLabel = #1051#1080#1094#1057#1095#1041#1072#1085#1082#1072
      FieldName = 'LICSCH'
      Size = 25
    end
    object qryUpiSHBNK: TStringField
      DisplayLabel = #1064#1092#1088#1041#1072#1085#1082#1072
      FieldName = 'SHBNK'
      Size = 10
    end
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    OnDataChange = dsrcUpiDataChange
    Left = 32
    Top = 136
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 236
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
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1087#1086#1076#1088#1086#1073#1085#1086
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
  object updUpi: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_UPI'
      'set'
      '  TABN = :TABN,'
      '  ID = :ID,'
      '  FAM = :FAM,'
      '  IMA = :IMA,'
      '  OTCH = :OTCH,'
      '  DOB = :DOB,'
      '  POL = :POL,'
      '  PRUV = :PRUV,'
      '  LASTDTPRM = :LASTDTPRM,'
      '  LASTDTUVL = :LASTDTUVL'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_UPI'
      
        '  (TABN, ID, FAM, IMA, OTCH, DOB, POL, PRUV, LASTDTPRM, LASTDTUV' +
        'L)'
      'values'
      
        '  (:TABN, :ID, :FAM, :IMA, :OTCH, :DOB, :POL, :PRUV, :LASTDTPRM,' +
        ' :LASTDTUVL)')
    DeleteSQL.Strings = (
      'delete from Z_UPI'
      'where'
      '  NR = :OLD_NR')
    Left = 40
    Top = 144
  end
  object popUpi: TPopupMenu
    OnPopup = popUpiPopup
    Left = 76
    Top = 124
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
    object popUpiPoisk: TMenuItem
      Caption = #1042#1099#1082#1083#1102#1095#1077#1085'!!! '#1055#1086#1080#1089#1082' ... '
      Visible = False
      object popUpiPoiskFam: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
        OnClick = popUpiPoiskFamClick
      end
      object popUpiPoiskTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = popUpiPoiskTabNClick
      end
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
    Left = 116
    Top = 129
  end
  object qryTotsNU: TQuery
    OnCalcFields = qryTotsNUCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'Select TabN, KdSps, DtProc as MyMG, SmNach, SmUdrg, SmVupl'
      'from GETNU_TOTS_DTPROC (:TabN)')
    Left = 200
    Top = 192
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
    Left = 216
    Top = 208
  end
  object qryNuDet: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * '
      'from Vinu_Main '
      'where DtProc = "09/01/2006" and tabN = 23838 and'
      '          VidN < "8000"'
      'order by ZaMesGod, VidN')
    Left = 220
    Top = 340
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
    Left = 232
    Top = 352
  end
end
