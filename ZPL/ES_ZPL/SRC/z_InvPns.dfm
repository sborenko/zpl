object FormInvNoPens: TFormInvNoPens
  Left = 330
  Top = 132
  Width = 687
  Height = 562
  ActiveControl = dbgrP
  BorderIcons = [biSystemMenu]
  Caption = 'FormInvNoPens'
  Color = clBtnFace
  Constraints.MaxWidth = 765
  Constraints.MinHeight = 500
  Constraints.MinWidth = 650
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
  object Splitter1: TSplitter
    Left = 0
    Top = 317
    Width = 679
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      679
      31)
    object sBtnTotals: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = #1048#1090#1086#1075#1080
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FF3FF3333333333CC30003333333333773777333333333C33
        3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
        33003377333337F33377333333333C333300333F333337F33377339333333C33
        3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
        330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
        330077F377F337F33377993399333C33330077FF773337F33377399993333C33
        33333777733337F333FF333333333C33300033333333373FF7773333333333CC
        3000333333333377377733333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 6
      OnClick = sBtnTotalsClick
    end
    object sBtnPrt: TSpeedButton
      Left = 80
      Top = 3
      Width = 75
      Height = 25
      Hint = #1042#1099#1074#1086#1076' '#1089#1087#1080#1089#1082#1072' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFD0000000000000000000000FDFDFDFD0007070707
        0707070707000700FDFD000000000000000000000000000700FD000707070707
        07FBFBFB0707000000FD00070707070707F8F8F80707000700FD000000000000
        0000000000000007070000070707070707070707070007000700FD0000000000
        00000000000700070000FDFD00FFFFFFFFFFFFFFFF0007000700FDFDFD00FF00
        00000000FF00000000FDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00FF
        0000000000FF00FDFDFDFDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00
        0000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 600
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrP: TDBGrid
    Left = 0
    Top = 31
    Width = 679
    Height = 286
    Hint = #1048#1085#1074#1072#1083#1080#1076#1099' ('#1074#1099#1076#1077#1083#1077#1085#1099' '#1085#1077' '#1076#1086#1089#1090#1080#1075#1096#1080#1077' '#1087#1077#1085#1089#1080#1086#1085#1085#1086#1075#1086' '#1074#1086#1079#1088#1072#1089#1090#1072')'
    Align = alClient
    Color = clCream
    DataSource = dsrcP
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrPDrawColumnCell
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtBeg'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dolgnost'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OklTrf'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrPens'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inv'
        Width = 55
        Visible = True
      end>
  end
  object dbgrNU: TDBGrid
    Left = 0
    Top = 320
    Width = 679
    Height = 215
    Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Align = alBottom
    Color = clCream
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
        FieldName = 'ZAMESGOD'
        Width = 46
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
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 52
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
        FieldName = 'DT_BEG'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 24
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
        FieldName = 'NOTES'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRR'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SBZR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 37
        Visible = True
      end>
  end
  object PanelTts: TPanel
    Left = 144
    Top = 176
    Width = 409
    Height = 125
    TabOrder = 3
    Visible = False
    DesignSize = (
      409
      125)
    object SpeedButton1: TSpeedButton
      Left = 329
      Top = 95
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 207
      Top = 16
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = #1063#1080#1089#1083#1077#1085#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 310
      Top = 16
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = #1060#1054#1058' '#1076#1083#1103' '#1060#1047
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 42
      Width = 176
      Height = 13
      Caption = #1048#1085#1074#1072#1083#1080#1076#1086#1074'   - '#1074#1089#1077#1075#1086': ............'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 58
      Width = 168
      Height = 32
      AutoSize = False
      Caption = '- '#1074' '#1090'.'#1095'. '#1085#1077' '#1076#1086#1089#1090#1080#1075#1096#1080#1093' '#1087#1077#1085#1089#1080#1086#1085#1085#1086#1075#1086' '#1074#1086#1079#1088#1072#1089#1090#1072': ......'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object LabelCntTt: TLabel
      Left = 223
      Top = 43
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'LabelCntTt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSmTt: TLabel
      Left = 328
      Top = 43
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'LabelSmTt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelCntInP: TLabel
      Left = 216
      Top = 73
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'LabelCntInP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSmInPFz: TLabel
      Left = 308
      Top = 73
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'LabelSmInPFz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cdsP: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Dolgnost'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dtBeg'
        DataType = ftDate
      end
      item
        Name = 'PrPens'
        DataType = ftSmallint
      end
      item
        Name = 'Inv'
        DataType = ftSmallint
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 112
    Data = {
      CC0000009619E0BD010000001800000008000000000003000000CC00024E5204
      0001000200010007535542545950450200490008004175746F696E6300045461
      624E04000100000000000546616D494F01004900000001000557494454480200
      0200230008446F6C676E6F737401004900000001000557494454480200020014
      00056474426567040006000000000006507250656E7302000100000000000349
      6E760200010000000000064F6B6C547266080004000000000001000C4155544F
      494E4356414C55450400010001000000}
    object cdsPNR: TAutoIncField
      DisplayLabel = #8470
      DisplayWidth = 3
      FieldName = 'NR'
    end
    object cdsPTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 8
      FieldName = 'TabN'
    end
    object cdsPFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 17
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsPDolgnost: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      DisplayWidth = 8
      FieldName = 'Dolgnost'
    end
    object cdsPdtBeg: TDateField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      DisplayWidth = 12
      FieldName = 'dtBeg'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPPrPens: TSmallintField
      DisplayLabel = #1055#1077#1085#1089#1080#1086#1085#1077#1088
      DisplayWidth = 5
      FieldName = 'PrPens'
    end
    object cdsPInv: TSmallintField
      DisplayLabel = #1048#1085#1074#1072#1083#1080#1076
      DisplayWidth = 4
      FieldName = 'Inv'
    end
    object cdsPOklTrf: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      DisplayWidth = 12
      FieldName = 'OklTrf'
      DisplayFormat = '#.00'
    end
  end
  object dsrcP: TDataSource
    DataSet = cdsP
    Left = 40
    Top = 128
  end
  object qryTmp: TQuery
    Left = 96
    Top = 112
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'select * from ViNuMain where DtProc = '#39'03/01/2007'#39' and tabn = 46' +
        '25')
    Left = 96
    Top = 256
    object qryNUVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
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
    object qryNUPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VINUMAIN.PSCH'
      Size = 10
    end
    object qryNUSCHBU: TStringField
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINUMAIN.SCHBU'
      Size = 10
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
    object qryNUDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINUMAIN.DTPROC'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINUMAIN.ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNUTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VINUMAIN.TABN'
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
    object qryNUDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINUMAIN.DT_BEG'
    end
    object qryNUDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.VINUMAIN.DT_END'
    end
    object qryNUKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINUMAIN.KDSPS'
    end
    object qryNUKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINUMAIN.KDOBJ'
    end
    object qryNUKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
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
      DisplayLabel = #1055#1088#1048#1085#1074
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
      DisplayLabel = #1041#1079#1088
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
      DisplayLabel = #1060#1047
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
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 112
    Top = 264
  end
end
