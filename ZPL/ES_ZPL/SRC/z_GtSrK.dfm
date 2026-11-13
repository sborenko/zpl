object FormGtSrK: TFormGtSrK
  Left = 212
  Top = 220
  Width = 900
  Height = 500
  ActiveControl = dbgrRS
  BorderIcons = [biSystemMenu]
  Caption = 'FormGtSrK'
  Color = clBtnFace
  Constraints.MaxWidth = 900
  Constraints.MinHeight = 500
  Constraints.MinWidth = 770
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    892
    473)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 442
    Width = 892
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      892
      31)
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 892
      Height = 2
      Align = alTop
      Shape = bsFrame
    end
    object sBtnDbg: TSpeedButton
      Left = 289
      Top = 4
      Width = 35
      Height = 25
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' / '#1059#1073#1088#1072#1090#1100' dbg-Grid'#39#1099
      Caption = 'Dbg'
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnDbgClick
    end
    object sBtnCalendar: TSpeedButton
      Left = 260
      Top = 4
      Width = 25
      Height = 25
      Hint = #1042#1089#1090#1088#1086#1077#1085#1085#1099#1081' '#1082#1072#1083#1077#1085#1076#1072#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnCalendarClick
    end
    object bBtnOk: TBitBtn
      Left = 735
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 815
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgrNU: TDBGrid
    Left = 145
    Top = 0
    Width = 463
    Height = 442
    Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1079#1072' '#1076#1074#1072' '#1087#1088#1077#1076#1096#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1084#1077#1089#1103#1094#1072
    Align = alClient
    Color = 12383740
    DataSource = dsrcNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrNUDrawColumnCell
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'VIDN'
        ReadOnly = True
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        ReadOnly = True
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        ReadOnly = True
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        ReadOnly = True
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        ReadOnly = True
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        ReadOnly = True
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        ReadOnly = True
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        ReadOnly = True
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSRK'
        ReadOnly = True
        Width = 2
        Visible = True
      end>
  end
  object PanelRight: TPanel
    Left = 608
    Top = 0
    Width = 284
    Height = 442
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = PanelRightResize
    object PanelR2: TPanel
      Left = 0
      Top = 32
      Width = 284
      Height = 390
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 74
        Top = 256
        Width = 108
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1076#1083#1103' '#1089#1088#1077#1076#1085#1077#1075#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 81
        Top = 277
        Width = 101
        Height = 13
        Caption = #1044#1085#1077#1081' '#1076#1083#1103' '#1089#1088#1077#1076#1085#1077#1075#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 97
        Top = 298
        Width = 85
        Height = 13
        Caption = #1057#1088#1077#1076#1085#1077#1044#1085#1077#1074#1085#1086#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 51
        Top = 208
        Width = 89
        Height = 13
        Caption = #1041#1102#1076#1078#1077#1090#1085#1099#1093' '#1076#1085#1077#1081':'
      end
      object LabelMes1: TLabel
        Left = 147
        Top = 169
        Width = 58
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '1-'#1081' '#1084#1077#1089#1103#1094
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object LabelMes2: TLabel
        Left = 211
        Top = 169
        Width = 58
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '2-'#1081' '#1084#1077#1089#1103#1094
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object LabelBudg1: TLabel
        Left = 157
        Top = 208
        Width = 46
        Height = 13
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' "'#1073#1102#1076#1078#1077#1090#1085#1099#1093'" '#1076#1085#1077#1081' '#1074' '#1084#1077#1089#1103#1094#1077
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1041#1102#1076#1078'1'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LabelBudg2: TLabel
        Left = 221
        Top = 208
        Width = 46
        Height = 13
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' "'#1073#1102#1076#1078#1077#1090#1085#1099#1093'" '#1076#1085#1077#1081' '#1074' '#1084#1077#1089#1103#1094#1077
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1041#1102#1076#1078'2'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label9: TLabel
        Left = 52
        Top = 223
        Width = 88
        Height = 13
        Caption = #1055#1088#1086#1087#1091#1097#1077#1085#1086' '#1076#1085#1077#1081':'
        Color = clBtnFace
        ParentColor = False
      end
      object LabelProp1: TLabel
        Left = 157
        Top = 223
        Width = 46
        Height = 13
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1087#1091#1097#1077#1085#1085#1099#1093' '#1076#1085#1077#1081
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1086#1087'1'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LabelProp2: TLabel
        Left = 221
        Top = 223
        Width = 46
        Height = 13
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1087#1091#1097#1077#1085#1085#1099#1093' '#1076#1085#1077#1081
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1086#1087'2'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label12: TLabel
        Left = 50
        Top = 238
        Width = 90
        Height = 13
        Caption = #1054#1090#1088#1072#1073#1086#1090#1072#1085#1086' '#1076#1085#1077#1081':'
        Color = clBtnFace
        ParentColor = False
      end
      object LabelZachet1: TLabel
        Left = 157
        Top = 238
        Width = 46
        Height = 13
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1090#1088#1072#1073#1086#1090#1072#1085#1085#1099#1093' '#1076#1085#1077#1081' ('#1074' '#1079#1072#1095#1105#1090')'
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1047#1072#1095#1077#1090'1'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LabelZachet2: TLabel
        Left = 221
        Top = 238
        Width = 46
        Height = 13
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1090#1088#1072#1073#1086#1090#1072#1085#1085#1099#1093' '#1076#1085#1077#1081' ('#1074' '#1079#1072#1095#1105#1090')'
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1047#1072#1095#1077#1090'2'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LabelBlock: TLabel
        Left = 0
        Top = 0
        Width = 284
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelBlock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 20
        Top = 188
        Width = 120
        Height = 13
        Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1086#1082#1083#1072#1076#1072':'
        FocusControl = dbeKoefOkl1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelSm1206: TLabel
        Left = 18
        Top = 354
        Width = 164
        Height = 25
        Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1087#1086' '#1074#1080#1076#1091' 1206 ('#1047#1087#1047#1072#1044#1085#1080#1050#1086#1084#1072#1085#1076')'
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1087#1086' '#1074#1080#1076#1091' 1206 ('#1047#1087#1047#1072#1044#1085#1080#1050#1086#1084#1072#1085#1076'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        WordWrap = True
      end
      object Label6: TLabel
        Left = 25
        Top = 340
        Width = 157
        Height = 13
        Alignment = taCenter
        Caption = #1056#1072#1073#1086#1095#1080#1093' '#1076#1085#1077#1081' '#1074' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 5
        Top = 313
        Width = 179
        Height = 25
        Hint = #1057#1088#1077#1076#1085#1077#1044#1085#1077#1074#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072' '#1080' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1074' '#1084#1077#1089#1103#1094#1077' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1057#1088#1077#1076#1085#1077#1044#1085#1077#1074#1085#1086#1077' '#1054#1082#1083#1072#1076#1072#1053#1072#1076#1073#1072#1074#1086#1082' '#1074' '#1084#1077#1089#1103#1094#1077' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        WordWrap = True
      end
      object dbgrRS: TDBGrid
        Left = 0
        Top = 13
        Width = 284
        Height = 152
        Align = alTop
        Color = 12383740
        DataSource = dsrcRS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            FieldName = 'cMes'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShGrV'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmGrV'
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SmDSrK'
            Width = 74
            Visible = True
          end>
      end
      object dbeCntDnDSrdn: TDBEdit
        Left = 192
        Top = 274
        Width = 75
        Height = 21
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' '#1076#1083#1103' '#1088#1072#1089#1095#1105#1090#1072' '#1089#1088#1077#1076#1085#1077#1044#1085#1077#1074#1085#1086#1075#1086
        DataField = 'CntDnDSrdn'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeSmDSrdn: TDBEdit
        Left = 192
        Top = 253
        Width = 75
        Height = 21
        Hint = #1057#1091#1084#1084#1072' '#1076#1083#1103' '#1088#1072#1089#1095#1105#1090#1072' '#1089#1088#1077#1076#1085#1077#1044#1085#1077#1074#1085#1086#1075#1086
        DataField = 'SmDSrdn'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeSmSrdn: TDBEdit
        Left = 192
        Top = 295
        Width = 75
        Height = 21
        Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1044#1085#1077#1074#1085#1086#1075#1086
        TabStop = False
        Color = clLime
        DataField = 'SmSrdn'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
      end
      object dbeKoefOkl1: TDBEdit
        Left = 152
        Top = 185
        Width = 52
        Height = 21
        DataField = 'KoefOkl1'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeKoefOkl2: TDBEdit
        Left = 216
        Top = 185
        Width = 52
        Height = 21
        DataField = 'KoefOkl2'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeDnejKmd: TDBEdit
        Left = 192
        Top = 337
        Width = 75
        Height = 21
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1076#1085#1077#1081' '#1074' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1077
        TabStop = False
        Color = clBtnFace
        DataField = 'DnejKmd'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 7
      end
      object dbeSm1206: TDBEdit
        Left = 192
        Top = 358
        Width = 75
        Height = 21
        Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1087#1086' '#1074#1080#1076#1091' 1206 ('#1047#1087#1047#1072#1044#1085#1080#1050#1086#1084#1072#1085#1076')'
        TabStop = False
        Color = clBtnFace
        DataField = 'Sm1206'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 8
      end
      object dbeSrdnInMesKmd: TDBEdit
        Left = 192
        Top = 316
        Width = 75
        Height = 21
        Hint = #1057#1088#1077#1076#1085#1077#1044#1085#1077#1074#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072' '#1080' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1074' '#1084#1077#1089#1103#1094#1077' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
        TabStop = False
        Color = clBtnFace
        DataField = 'SmSrdnInMesKmd'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 6
      end
    end
  end
  object dbgrPrDn: TDBGrid
    Left = 394
    Top = 331
    Width = 197
    Height = 107
    Anchors = [akRight, akBottom]
    Color = 11861218
    DataSource = dsrcPrDn
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DtBeg'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtEnd'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CntPrDn'
        Width = 37
        Visible = True
      end>
  end
  object dbgrMes: TDBGrid
    Left = 0
    Top = 0
    Width = 145
    Height = 442
    Align = alLeft
    DataSource = dsrcMes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Step'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtMes'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PropDay'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WrkDay'
        Width = 13
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Uvoln'
        Width = 15
        Visible = True
      end>
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select SSRK, VidN, ShVidN, DtProc, ZaMesGod, Dt_Beg, Dt_End, Cha' +
        's, Summa'
      'from ViNuMain'
      'where TabN = 4346 and ZaMesGod >= '#39'01/01/2011'#39' and '
      '      ZaMesGod <= '#39'02/01/2011'#39' and VidN < '#39'6001'#39
      'order By ZaMesGod, VidN')
    Left = 40
    Top = 96
    object qryNUSSRK: TStringField
      DisplayWidth = 6
      FieldName = 'SSRK'
      FixedChar = True
      Size = 1
    end
    object qryNUVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNUSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 18
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNUDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      DisplayWidth = 7
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      DisplayWidth = 22
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryNUDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      DisplayWidth = 22
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNUDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      DisplayWidth = 22
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNUCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      DisplayWidth = 12
      FieldName = 'CHAS'
    end
    object qryNUSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
  end
  object dsrcNU: TDataSource
    DataSet = cdsNU
    Left = 144
    Top = 112
  end
  object cdsNU: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SSRK'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VIDN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SHVIDN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DTPROC'
        DataType = ftDateTime
      end
      item
        Name = 'ZAMESGOD'
        DataType = ftDateTime
      end
      item
        Name = 'DT_BEG'
        DataType = ftDateTime
      end
      item
        Name = 'DT_END'
        DataType = ftDateTime
      end
      item
        Name = 'CHAS'
        DataType = ftFloat
      end
      item
        Name = 'SUMMA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 96
    object cdsNUSSRK: TStringField
      DisplayLabel = #1057#1088#1050
      FieldName = 'SSRK'
      FixedChar = True
      Size = 1
    end
    object cdsNUVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsNUSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsNUDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object cdsNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object cdsNUDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNUDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNUCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object cdsNUSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
  end
  object cdsRS: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ZaMG'
        DataType = ftDate
      end
      item
        Name = 'nMes'
        DataType = ftSmallint
      end
      item
        Name = 'cMes'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'GrVid'
        DataType = ftSmallint
      end
      item
        Name = 'ShGrV'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SmGrV'
        DataType = ftFloat
      end
      item
        Name = 'SmDSrK'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnMesGrVid'
        Fields = 'nMes;GrVid'
      end>
    IndexName = 'OnMesGrVid'
    Params = <>
    StoreDefs = True
    Left = 704
    Top = 80
    Data = {
      920000009619E0BD0100000018000000070000000000030000009200045A614D
      470400060000000000046E4D6573020001000000000004634D65730100490000
      0001000557494454480200020003000547725669640200010000000000055368
      477256010049000000010005574944544802000200140005536D477256080004
      000000000006536D4453724B08000400000000000000}
    object cdsRSZaMG: TDateField
      FieldName = 'ZaMG'
    end
    object cdsRSnMes: TSmallintField
      FieldName = 'nMes'
    end
    object cdsRScMes: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094
      FieldName = 'cMes'
      Size = 3
    end
    object cdsRSGrVid: TSmallintField
      DisplayLabel = #1042#1080#1076#1099
      FieldName = 'GrVid'
    end
    object cdsRSShGrV: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1074#1080#1076#1086#1074
      FieldName = 'ShGrV'
    end
    object cdsRSSmGrV: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SmGrV'
      DisplayFormat = '#.00'
    end
    object cdsRSSmDSrK: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090
      FieldName = 'SmDSrK'
      DisplayFormat = '#.00'
    end
  end
  object dsrcRS: TDataSource
    DataSet = cdsRS
    Left = 720
    Top = 96
  end
  object cdsPrDn: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end
      item
        Name = 'CntPrDn'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 312
    Top = 390
    object cdsPrDnDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cdsPrDnDtEnd: TDateField
      FieldName = 'DtEnd'
    end
    object cdsPrDnCntPrDn: TSmallintField
      FieldName = 'CntPrDn'
    end
  end
  object dsrcPrDn: TDataSource
    DataSet = cdsPrDn
    Left = 330
    Top = 400
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KoefOkl1'
        DataType = ftFloat
      end
      item
        Name = 'KoefOkl2'
        DataType = ftFloat
      end
      item
        Name = 'CntDnDSrdn'
        DataType = ftSmallint
      end
      item
        Name = 'SmDSrdn'
        DataType = ftFloat
      end
      item
        Name = 'SmSrdn'
        DataType = ftFloat
      end
      item
        Name = 'SmSrdnInMesKmd'
        DataType = ftFloat
      end
      item
        Name = 'DnejKmd'
        DataType = ftFloat
      end
      item
        Name = 'Sm1206'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 646
    Top = 126
    object cdsTmpKoefOkl1: TFloatField
      FieldName = 'KoefOkl1'
      OnValidate = cdsTmpKoefOklValidate
      DisplayFormat = '#.00'
    end
    object cdsTmpKoefOkl2: TFloatField
      FieldName = 'KoefOkl2'
      OnValidate = cdsTmpKoefOklValidate
      DisplayFormat = '#.00'
    end
    object cdsTmpCntDnDSrdn: TSmallintField
      FieldName = 'CntDnDSrdn'
      OnValidate = cdsTmpCntDnDSrdnValidate
    end
    object cdsTmpSmDSrdn: TFloatField
      FieldName = 'SmDSrdn'
      OnValidate = cdsTmpSmDSrdnValidate
      DisplayFormat = '#.00'
    end
    object cdsTmpSmSrdn: TFloatField
      FieldName = 'SmSrdn'
      DisplayFormat = '#.00'
    end
    object cdsTmpSmSrdnInMesKmd: TFloatField
      FieldName = 'SmSrdnInMesKmd'
      DisplayFormat = '#.000'
    end
    object cdsTmpDnejKmd: TFloatField
      FieldName = 'DnejKmd'
    end
    object cdsTmpSm1206: TFloatField
      FieldName = 'Sm1206'
      DisplayFormat = '0.00'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 664
    Top = 144
  end
  object cdsMes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Step'
        DataType = ftSmallint
      end
      item
        Name = 'DtMes'
        DataType = ftDate
      end
      item
        Name = 'WrkDay'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PropDay'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Uvoln'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 328
    Data = {
      860000009619E0BD010000001800000005000000000003000000860004537465
      7002000100000000000544744D657304000600000000000657726B4461790100
      4900000001000557494454480200020001000750726F70446179010049000000
      01000557494454480200020001000555766F6C6E010049000000010005574944
      54480200020001000000}
    object cdsMesStep: TSmallintField
      FieldName = 'Step'
    end
    object cdsMesDtMes: TDateField
      FieldName = 'DtMes'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsMesWrkDay: TStringField
      FieldName = 'WrkDay'
      Size = 1
    end
    object cdsMesPropDay: TStringField
      FieldName = 'PropDay'
      Size = 1
    end
    object cdsMesUvoln: TStringField
      FieldName = 'Uvoln'
      Size = 1
    end
  end
  object dsrcMes: TDataSource
    DataSet = cdsMes
    Left = 40
    Top = 344
  end
  object qryEDays: TQuery
    Left = 40
    Top = 176
  end
  object qryTmp: TQuery
    Left = 40
    Top = 136
  end
  object qryOklNdb: TQuery
    Left = 40
    Top = 224
  end
end
