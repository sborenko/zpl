object FrmArhivSpan: TFrmArhivSpan
  Left = 275
  Top = 131
  Width = 387
  Height = 552
  BorderIcons = [biSystemMenu]
  Caption = 'FormArhivka'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelSpan: TPanel
    Left = 0
    Top = 0
    Width = 379
    Height = 43
    Align = alTop
    Anchors = [akTop]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object LblSpanBeg: TLabel
      Left = 36
      Top = 14
      Width = 64
      Height = 13
      Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076' '#1089':'
    end
    object LbSpanEnd: TLabel
      Left = 223
      Top = 14
      Width = 15
      Height = 13
      Caption = #1087#1086':'
    end
    object DbeSpanBeg: TDBEdit
      Left = 111
      Top = 14
      Width = 89
      Height = 21
      DataField = 'DtBeg'
      DataSource = DsrcShap
      TabOrder = 0
    end
    object DbeSpanEnd: TDBEdit
      Left = 247
      Top = 14
      Width = 89
      Height = 21
      DataField = 'DtEnd'
      DataSource = DsrcShap
      TabOrder = 1
    end
  end
  object PanelEmployee: TPanel
    Left = 0
    Top = 43
    Width = 379
    Height = 113
    Align = alTop
    Anchors = [akTop]
    BevelOuter = bvNone
    TabOrder = 1
    object Label9: TLabel
      Left = 47
      Top = 9
      Width = 95
      Height = 13
      Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
    end
    object BtnTabN: TSpeedButton
      Left = 302
      Top = 5
      Width = 21
      Height = 23
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
        33333377838387733333307BEBEB7033333337F8383838F3333377BEBEBEB773
        333337838383833F333307EBEBEBE703333378383838383F333307BEBEBEB703
        33337F838383838F333307EBEBEBE703333373F838383873333377BEBEBEB773
        33333783838387F33333307BEBEB703333333738F838F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnTabNClick
    end
    object LabelFio0: TLabel
      Left = 12
      Top = 90
      Width = 349
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelFamIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 47
      Top = 37
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = #1060#1072#1084#1080#1083#1080#1103
      WordWrap = True
    end
    object BtnFindFam: TSpeedButton
      Left = 302
      Top = 33
      Width = 21
      Height = 23
      Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080' ('#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1090#1077')'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
        33333377838387733333307B8B8B7033333337F8383838F3333377B8B8B8B773
        333337838383833F3333078B8B8B8703333378383838383F333307B8B8B8B703
        33337F838383838F3333078B8B8B8703333373F838383873333377B8B8B8B773
        33333783838387F33333307B8B8B703333333738F838F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnFindFamClick
    end
    object Label12: TLabel
      Left = 47
      Top = 62
      Width = 134
      Height = 13
      AutoSize = False
      Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' (TIN)'
      FocusControl = dbeTin
    end
    object BtnFindTin: TSpeedButton
      Left = 302
      Top = 59
      Width = 21
      Height = 23
      Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1058#1048#1053' ('#1087#1086' '#1090#1086#1095#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102')'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
        33333377838387733333307B8B8B7033333337F8383838F3333377B8B8B8B773
        333337838383833F3333078B8B8B8703333378383838383F333307B8B8B8B703
        33337F838383838F3333078B8B8B8703333373F838383873333377B8B8B8B773
        33333783838387F33333307B8B8B703333333738F838F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnFindTinClick
    end
    object dbeTabN: TDBEdit
      Left = 239
      Top = 5
      Width = 62
      Height = 21
      DataField = 'TabN'
      DataSource = DsrcShap
      TabOrder = 0
      OnEnter = dbeEnter
      OnExit = dbeTabNExit
    end
    object dbeFam: TDBEdit
      Left = 141
      Top = 33
      Width = 160
      Height = 21
      Hint = #1060#1072#1084#1080#1083#1080#1102' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1084#1086#1078#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077
      DataField = 'Fam'
      DataSource = DsrcShap
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeTin: TDBEdit
      Left = 206
      Top = 59
      Width = 95
      Height = 21
      DataField = 'TIN'
      DataSource = DsrcShap
      TabOrder = 2
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
  end
  object PanelInvList: TPanel
    Left = 0
    Top = 156
    Width = 379
    Height = 266
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      379
      266)
    object LblSelPath: TLabel
      Left = 8
      Top = 243
      Width = 32
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1072#1087#1082#1072
    end
    object DbgrInvList: TDBGrid
      Left = 8
      Top = 9
      Width = 361
      Height = 223
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DsrcInvList
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object EdtSelPath: TEdit
      Left = 48
      Top = 239
      Width = 289
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Text = 'EdtSelPath'
    end
    object BtnSelPath: TBitBtn
      Left = 344
      Top = 237
      Width = 27
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '...'
      TabOrder = 2
      OnClick = BtnSelPathClick
    end
  end
  object PanelParams: TPanel
    Left = 0
    Top = 422
    Width = 379
    Height = 74
    Align = alBottom
    Anchors = [akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label13: TLabel
      Left = 56
      Top = 9
      Width = 123
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object DtPickDtIssue: TDateTimePicker
      Left = 231
      Top = 5
      Width = 85
      Height = 21
      Hint = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Date = 38771.000000000000000000
      Time = 38771.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object GroupBoxScope: TGroupBox
      Left = 16
      Top = 27
      Width = 345
      Height = 41
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object RBtnNoNich: TRadioButton
        Left = 36
        Top = 16
        Width = 69
        Height = 17
        Hint = #1044#1072#1085#1085#1099#1077' '#1073#1077#1079' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1087#1086' '#1053#1048#1063
        Caption = #1041#1077#1079' '#1053#1048#1063
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object RBtnNichOnly: TRadioButton
        Left = 131
        Top = 16
        Width = 86
        Height = 17
        Hint = #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1084' '#1053#1048#1063
        Caption = #1058#1086#1083#1100#1082#1086' '#1053#1048#1063
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object RBtnNichBoth: TRadioButton
        Left = 245
        Top = 16
        Width = 60
        Height = 17
        Hint = #1059#1095#1080#1090#1099#1074#1072#1102#1090#1089#1103' '#1042#1057#1045' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        Caption = #1042#1084#1077#1089#1090#1077
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = True
      end
    end
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 496
    Width = 379
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      379
      29)
    object BtnPrintNew: TSpeedButton
      Left = 202
      Top = 2
      Width = 78
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1087#1086' "'#1082#1086#1084#1087#1072#1082#1090#1085#1086#1081'" '#1092#1086#1088#1084#1077
      Anchors = [akTop, akRight]
      Caption = ' '#1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      Spacing = 0
      OnClick = BtnPrintNewClick
    end
    object BtnExit: TBitBtn
      Left = 292
      Top = 2
      Width = 78
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkClose
      Spacing = 3
    end
  end
  object CdsShap: TClientDataSet
    Aggregates = <>
    FileName = 'c:\Temp\cdsspov.cds'
    FieldDefs = <
      item
        Name = 'ZaGod'
        DataType = ftSmallint
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'DtDoc'
        DataType = ftDate
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'TIN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ArhDtEnd'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 4
    Top = 56
    object CdsShapZaGod: TSmallintField
      FieldName = 'ZaGod'
    end
    object CdsShapArhDtEnd: TDateField
      FieldName = 'ArhDtEnd'
    end
    object CdsShapDtBeg: TDateField
      FieldName = 'DtBeg'
      OnChange = CdsShapDtBegChange
      OnGetText = CdsShapDtGetText
      OnSetText = CdsShapDtSetText
      OnValidate = CdsShapDtValidate
      DisplayFormat = 'mm-yyyy'
      EditMask = '!99-9999;1;_'
    end
    object CdsShapDtEnd: TDateField
      FieldName = 'DtEnd'
      OnChange = CdsShapDtEndChange
      OnGetText = CdsShapDtGetText
      OnSetText = CdsShapDtSetText
      OnValidate = CdsShapDtValidate
      DisplayFormat = 'mm-yyyy'
      EditMask = '!99-9999;1;_'
    end
    object CdsShapTabN: TIntegerField
      FieldName = 'TabN'
      OnSetText = CdsShapTabNSetText
    end
    object CdsShapDtDoc: TDateField
      FieldName = 'DtDoc'
    end
    object CdsShapFam: TStringField
      FieldName = 'Fam'
    end
    object CdsShapFamIO: TStringField
      FieldName = 'FamIO'
      Size = 35
    end
    object CdsShapTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
  end
  object DsrcShap: TDataSource
    DataSet = CdsShap
    Left = 16
    Top = 72
  end
  object QryArh: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select DtProc, ZaMesGod, VidN, ShVidN, NmVidN,'
      
        '       Sum(Chas) as Chasu, Sum(Cast(Summa as numeric(18,2))) as ' +
        'Summa,'
      '        count(*) as CNTREC'
      ' from vinu_main'
      'where TabN = 23838 and dtproc >= '#39'01/01/2006'#39' and'
      '      dtproc <= '#39'10/01/2006'#39' and vidn < '#39'8000'#39
      'group by DtProc, VidN, ShVidN, NmVidN, ZaMesGod')
    Left = 214
    Top = 282
    object QryArhDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      DisplayWidth = 7
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object QryArhZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1103#1094
      DisplayWidth = 7
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object QryArhVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object QryArhSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      DisplayWidth = 16
      FieldName = 'SHVIDN'
      Size = 15
    end
    object QryArhNMVIDN: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1080#1076#1072
      DisplayWidth = 24
      FieldName = 'NMVIDN'
      Size = 64
    end
    object QryArhCHASU: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      DisplayWidth = 7
      FieldName = 'CHASU'
      OnGetText = QryArhCHASUGetText
    end
    object QryArhSUMMA: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
      Precision = 15
      Size = 2
    end
    object QryArhCNTREC: TIntegerField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      DisplayWidth = 8
      FieldName = 'CNTREC'
    end
  end
  object DsrcArh: TDataSource
    DataSet = QryArh
    Left = 240
    Top = 288
  end
  object QryTmp: TQuery
    Left = 212
    Top = 336
  end
  object CdsArh: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'Kvart'
        DataType = ftSmallint
      end
      item
        Name = 'dtProc1'
        DataType = ftDate
      end
      item
        Name = 'dtZaMg1'
        DataType = ftDate
      end
      item
        Name = 'Vidn1'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidn1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Chasu1'
        DataType = ftFloat
      end
      item
        Name = 'Summa1'
        DataType = ftFloat
      end
      item
        Name = 'dtProc2'
        DataType = ftDate
      end
      item
        Name = 'dtZaMg2'
        DataType = ftDate
      end
      item
        Name = 'Vidn2'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidn2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Chasu2'
        DataType = ftFloat
      end
      item
        Name = 'Summa2'
        DataType = ftFloat
      end
      item
        Name = 'dtProc3'
        DataType = ftDate
      end
      item
        Name = 'dtZaMg3'
        DataType = ftDate
      end
      item
        Name = 'Vidn3'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidn3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Chasu3'
        DataType = ftFloat
      end
      item
        Name = 'Summa3'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 300
    Top = 283
  end
  object CdsUni: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmVidN'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'Sm01'
        DataType = ftFloat
      end
      item
        Name = 'Sm02'
        DataType = ftFloat
      end
      item
        Name = 'Sm03'
        DataType = ftFloat
      end
      item
        Name = 'Sm04'
        DataType = ftFloat
      end
      item
        Name = 'Sm05'
        DataType = ftFloat
      end
      item
        Name = 'Sm06'
        DataType = ftFloat
      end
      item
        Name = 'Sm07'
        DataType = ftFloat
      end
      item
        Name = 'Sm08'
        DataType = ftFloat
      end
      item
        Name = 'Sm09'
        DataType = ftFloat
      end
      item
        Name = 'Sm10'
        DataType = ftFloat
      end
      item
        Name = 'Sm11'
        DataType = ftFloat
      end
      item
        Name = 'Sm12'
        DataType = ftFloat
      end
      item
        Name = 'SmYY'
        DataType = ftFloat
      end
      item
        Name = 'SmZa01'
        DataType = ftFloat
      end
      item
        Name = 'SmZa02'
        DataType = ftFloat
      end
      item
        Name = 'SmZa03'
        DataType = ftFloat
      end
      item
        Name = 'SmZa04'
        DataType = ftFloat
      end
      item
        Name = 'SmZa05'
        DataType = ftFloat
      end
      item
        Name = 'SmZa06'
        DataType = ftFloat
      end
      item
        Name = 'SmZa07'
        DataType = ftFloat
      end
      item
        Name = 'SmZa08'
        DataType = ftFloat
      end
      item
        Name = 'SmZa09'
        DataType = ftFloat
      end
      item
        Name = 'SmZa10'
        DataType = ftFloat
      end
      item
        Name = 'SmZa11'
        DataType = ftFloat
      end
      item
        Name = 'SmZa12'
        DataType = ftFloat
      end
      item
        Name = 'NSovm'
        DataType = ftString
        Precision = 1
        Size = 20
      end
      item
        Name = 'VSovm'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 448
    Top = 112
  end
  object popVar: TPopupMenu
    OnPopup = popVarPopup
    Left = 164
    Top = 497
    object PopArcDtProc: TMenuItem
      Caption = #1055#1086' '#1084#1077#1089#1103#1094#1072#1084' '#1088#1072#1089#1095#1105#1090#1072
      Hint = #1055#1086' '#1084#1077#1089#1103#1094#1072#1084', '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1083#1080#1089#1100' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      OnClick = PopArchClick
    end
    object PopArcMnthYear: TMenuItem
      Caption = #1055#1086' '#1084#1077#1089#1103#1094#1072#1084' "'#1047#1072#1052#1077#1089#1043#1086#1076'"'
      Hint = 
        #1055#1086' '#1084#1077#1089#1103#1094#1072#1084', '#1079#1072' '#1082#1086#1090#1086#1088#1099#1077' '#1073#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1085#1077' '#1074#1079#1080#1088#1072#1103' '#1085#1072' '#1090#1086', '#1074' '#1082#1072#1082#1086#1084 +
        ' '#1084#1077#1089#1103#1094#1077' '#1073#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103')'
      OnClick = PopArchClick
    end
    object Sep: TMenuItem
      Caption = '-'
    end
    object PopArcBoth: TMenuItem
      Caption = #1057#1086#1074#1084#1077#1089#1090#1085#1086' '#1086#1073#1072' '#1074#1072#1088#1080#1072#1085#1090#1072
      Hint = #1042' '#1086#1076#1085#1086#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1077' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1100' '#1086#1073#1072' '#1074#1072#1088#1080#1072#1085#1090#1072
      OnClick = PopArchClick
    end
    object N1: TMenuItem
      Caption = '... '#1089' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1087#1086#1083#1075#1086#1076#1072
      OnClick = PopArchClick
    end
  end
  object QryInvList: TQuery
    Left = 24
    Top = 272
    object QryInvListTabN: TIntegerField
      DisplayLabel = #1058#1072#1073'.'#8470
      FieldName = 'TabN'
    end
    object QryInvListFam: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'Fam'
      Size = 35
    end
    object QryInvListIma: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'Ima'
    end
    object QryInvListOtch: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'Otch'
      Size = 25
    end
    object QryInvListDtBeg: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095'.'
      FieldName = 'DtBeg'
    end
    object QryInvListDtEnd: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
      FieldName = 'DtEnd'
    end
  end
  object DsrcInvList: TDataSource
    DataSet = QryInvList
    Left = 40
    Top = 288
  end
end
