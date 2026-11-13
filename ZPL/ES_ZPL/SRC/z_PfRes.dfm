object FormPfRes: TFormPfRes
  Left = 228
  Top = 267
  Width = 991
  Height = 656
  BorderIcons = [biSystemMenu]
  Caption = 'FormPfRes'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 983
    Height = 629
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'ts1'
      object dbgrPfRes: TDBGrid
        Left = 0
        Top = 31
        Width = 975
        Height = 567
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcPfRes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPfResDrawColumnCell
        OnDblClick = dbgrPfResDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 106
            Visible = True
          end
          item
            Color = clSkyBlue
            Expanded = False
            FieldName = 'Sm_Total'
            Width = 91
            Visible = True
          end
          item
            Color = clSkyBlue
            Expanded = False
            FieldName = 'Sm_Max'
            Width = 82
            Visible = True
          end
          item
            Color = clSkyBlue
            Expanded = False
            FieldName = 'Sm_Ins'
            Visible = True
          end
          item
            Color = 11205604
            Expanded = False
            FieldName = 'Sum_Total'
            Width = 86
            Visible = True
          end
          item
            Color = 11205604
            Expanded = False
            FieldName = 'Sum_Max'
            Width = 85
            Visible = True
          end
          item
            Color = 11205604
            Expanded = False
            FieldName = 'Sum_Ins'
            Visible = True
          end
          item
            Color = 10217209
            Expanded = False
            FieldName = 'Razn_Ins'
            Visible = True
          end
          item
            Color = clSkyBlue
            Expanded = False
            FieldName = 'Sm_SvPrg'
            Visible = True
          end
          item
            Color = clSkyBlue
            Expanded = False
            FieldName = 'Sm_EsvPrp'
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 975
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          975
          31)
        object LabelCntRec: TLabel
          Left = 91
          Top = 9
          Width = 61
          Height = 14
          Hint = #1050'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1090#1072#1073#1083#1080#1094#1077
          Caption = 'LabelCntRec'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object sBtnTts: TSpeedButton
          Left = 181
          Top = 3
          Width = 75
          Height = 25
          Hint = #1048#1090#1086#1075#1080' '#1087#1086' '#1090#1072#1073#1083#1080#1094#1077
          Caption = #1048#1090#1086#1075#1080
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307AFAFA7033333337F333F337F3333377AFAFAFA773
            333337333333373F333307FAFAFAF70333337F3333F3337F333307AFAFAFA703
            33337F3333F3337F333307FAFAFAF703333373F333F333733333778FAFAFA773
            333337F3333337F333333078FAFA70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnTtsClick
        end
        object LabelOrder: TLabel
          Left = 523
          Top = 8
          Width = 63
          Height = 16
          Caption = 'LabelOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object bBtnCancel: TBitBtn
          Left = 898
          Top = 3
          Width = 75
          Height = 25
          Hint = #1047#1072#1082#1088#1099#1090#1100
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Kind = bkCancel
          Spacing = 0
        end
        object DBNav: TDBNavigator
          Left = 5
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcPfRes
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object rBtnAllRec: TRadioButton
          Left = 264
          Top = 9
          Width = 91
          Height = 17
          Hint = #1060#1080#1083#1100#1090#1088' '#1074#1099#1082#1083#1102#1095#1077#1085
          Caption = #1041#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = True
          OnClick = rBtnBadRecClick
        end
        object rBtnBadRec: TRadioButton
          Left = 360
          Top = 9
          Width = 152
          Height = 17
          Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' "'#1087#1083#1086#1093#1080#1077'" '#1079#1072#1087#1080#1089#1080
          Caption = #1058#1086#1083#1100#1082#1086' "'#1087#1083#1086#1093#1080#1077'" '#1079#1072#1087#1080#1089#1080
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = rBtnBadRecClick
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 975
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          975
          31)
        object Label4: TLabel
          Left = 91
          Top = 9
          Width = 61
          Height = 14
          Hint = #1050'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1090#1072#1073#1083#1080#1094#1077
          Caption = 'LabelCntRec'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object SpeedButton1: TSpeedButton
          Left = 181
          Top = 3
          Width = 75
          Height = 25
          Hint = #1048#1090#1086#1075#1080' '#1087#1086' '#1090#1072#1073#1083#1080#1094#1077
          Caption = #1048#1090#1086#1075#1080
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307AFAFA7033333337F333F337F3333377AFAFAFA773
            333337333333373F333307FAFAFAF70333337F3333F3337F333307AFAFAFA703
            33337F3333F3337F333307FAFAFAF703333373F333F333733333778FAFAFA773
            333337F3333337F333333078FAFA70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnTtsClick
        end
        object Label5: TLabel
          Left = 523
          Top = 8
          Width = 63
          Height = 16
          Caption = 'LabelOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object BitBtn1: TBitBtn
          Left = 898
          Top = 3
          Width = 75
          Height = 25
          Hint = #1047#1072#1082#1088#1099#1090#1100
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Kind = bkCancel
          Spacing = 0
        end
        object DBNavigator1: TDBNavigator
          Left = 5
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcPfRes
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object RadioButton1: TRadioButton
          Left = 264
          Top = 9
          Width = 91
          Height = 17
          Hint = #1060#1080#1083#1100#1090#1088' '#1074#1099#1082#1083#1102#1095#1077#1085
          Caption = #1041#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = True
          OnClick = rBtnBadRecClick
        end
        object RadioButton2: TRadioButton
          Left = 360
          Top = 9
          Width = 152
          Height = 17
          Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' "'#1087#1083#1086#1093#1080#1077'" '#1079#1072#1087#1080#1089#1080
          Caption = #1058#1086#1083#1100#1082#1086' "'#1087#1083#1086#1093#1080#1077'" '#1079#1072#1087#1080#1089#1080
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = rBtnBadRecClick
        end
      end
      object dbgrRes2: TDBGrid
        Left = 0
        Top = 31
        Width = 975
        Height = 567
        Align = alClient
        Color = 13041131
        DataSource = dsrcRes2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 141
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSmTtsCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSvPrgCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSmMaxCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSmEsvCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'eSmTtsCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'eSmMaxCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'eSmInsCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Esv-InsCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSmTtsPps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSvPrgPps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSmMaxPps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zSmEsvPps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'eSmTtsPps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'eSmMaxPps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'eSmInsPps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Esv-InsPps'
            Visible = True
          end>
      end
    end
  end
  object PanelRes: TPanel
    Left = 384
    Top = 713
    Width = 413
    Height = 160
    BevelInner = bvLowered
    Color = clMoneyGreen
    TabOrder = 0
    Visible = False
    DesignSize = (
      413
      160)
    object Label1: TLabel
      Left = 116
      Top = 16
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042' Z_NU:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 202
      Top = 16
      Width = 106
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042' e04t06c.dbf:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object LabelSmTotal: TLabel
      Left = 121
      Top = 40
      Width = 87
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LabelSmTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSumTotal: TLabel
      Left = 223
      Top = 40
      Width = 85
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      Caption = 'LabelSumTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSmMax: TLabel
      Left = 121
      Top = 64
      Width = 87
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LabelSmMax'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSumMax: TLabel
      Left = 229
      Top = 64
      Width = 79
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      Caption = 'LabelSumMax'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSmIns: TLabel
      Left = 121
      Top = 88
      Width = 87
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LabelSmIns'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSumIns: TLabel
      Left = 235
      Top = 88
      Width = 73
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      Caption = 'LabelSumIns'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSmSvPrg: TLabel
      Left = 121
      Top = 112
      Width = 87
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LabelSmSvPrg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSumSvPrg: TLabel
      Left = 218
      Top = 112
      Width = 90
      Height = 13
      Hint = #1042#1099#1095#1080#1089#1083#1077#1085#1086
      Alignment = taRightJustify
      Caption = 'LabelSumSvPrg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelSmEsvPrp: TLabel
      Left = 121
      Top = 136
      Width = 87
      Height = 13
      Hint = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1080#1079' '#1090#1072#1073#1083#1080#1094
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LabelSmEsvPrp'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label13: TLabel
      Left = 10
      Top = 40
      Width = 74
      Height = 13
      Caption = #1057#1091#1084#1084#1099' Totals :'
    end
    object Label14: TLabel
      Left = 10
      Top = 64
      Width = 65
      Height = 13
      Caption = #1057#1091#1084#1084#1099' Max :'
    end
    object Label15: TLabel
      Left = 10
      Top = 88
      Width = 59
      Height = 13
      Caption = #1057#1091#1084#1084#1099' Ins :'
    end
    object Label16: TLabel
      Left = 10
      Top = 112
      Width = 80
      Height = 13
      Caption = #1057#1084' '#1057#1074#1055#1086#1088#1086#1075#1086#1074' :'
    end
    object Label17: TLabel
      Left = 10
      Top = 136
      Width = 103
      Height = 13
      Caption = #1057#1084' '#1059#1076#1077#1088#1078'.'#1089' '#1087#1088#1077#1076#1087#1088'.'
    end
    object Label3: TLabel
      Left = 332
      Top = 16
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1056#1072#1079#1085#1080#1094#1099' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object LabelDSumTotal: TLabel
      Left = 317
      Top = 40
      Width = 85
      Height = 13
      Hint = #1042#1099#1095#1080#1089#1083#1077#1085#1086
      Alignment = taRightJustify
      Caption = 'LabelSumTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelDSumMax: TLabel
      Left = 323
      Top = 64
      Width = 79
      Height = 13
      Hint = #1042#1099#1095#1080#1089#1083#1077#1085#1086
      Alignment = taRightJustify
      Caption = 'LabelSumMax'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelDSumIns: TLabel
      Left = 329
      Top = 88
      Width = 73
      Height = 13
      Hint = #1042#1099#1095#1080#1089#1083#1077#1085#1086
      Alignment = taRightJustify
      Caption = 'LabelSumIns'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelDSumSvPrg: TLabel
      Left = 303
      Top = 112
      Width = 99
      Height = 13
      Hint = #1042#1099#1095#1080#1089#1083#1077#1085#1086
      Alignment = taRightJustify
      Caption = 'LabelDSumSvPrg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object sBtnClosePanel: TSpeedButton
      Left = 395
      Top = 3
      Width = 16
      Height = 17
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1080#1090#1086#1075#1080
      Anchors = [akTop, akRight]
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnClosePanelClick
    end
  end
  object dsrcPfRes: TDataSource
    Left = 64
    Top = 112
  end
  object pop: TPopupMenu
    Left = 68
    Top = 171
    object popHead: TMenuItem
      Caption = '== '#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' =='
      Enabled = False
    end
    object popOrdByID: TMenuItem
      Caption = '- '#1087#1086' '#1048#1044
      Checked = True
      OnClick = popOrdByIDClick
    end
    object popOrdByTabN: TMenuItem
      Caption = '- '#1087#1086' '#1058#1072#1073'.'#1085'-'#1088#1091
      OnClick = popOrdByTabNClick
    end
    object popOrdByFIO: TMenuItem
      Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080', '#1048#1084#1077#1085#1080', '#1054#1090#1095#1077#1089#1090#1074#1091
      OnClick = popOrdByFIOClick
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 160
  end
  object dsrcRes2: TDataSource
    DataSet = FormPfMain.cdsPfRes2
    Left = 196
    Top = 115
  end
end
