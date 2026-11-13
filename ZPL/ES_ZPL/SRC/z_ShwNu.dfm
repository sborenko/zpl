object FormShwNu: TFormShwNu
  Left = 408
  Top = 195
  Width = 700
  Height = 520
  ActiveControl = dbgrNuD
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormShwNu'
  Color = clBtnFace
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 365
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 364
    Width = 692
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clGreen
    ParentColor = False
  end
  object LabelFamIO: TLabel
    Left = 0
    Top = 0
    Width = 692
    Height = 16
    Align = alTop
    Alignment = taCenter
    Caption = 'LabelFamIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgrNuD: TDBGrid
    Left = 0
    Top = 16
    Width = 692
    Height = 348
    Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1087#1086#1076#1088#1086#1073#1085#1086
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcNuD
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrNuDDrawColumnCell
    OnEnter = dbgrNuDEnter
    OnExit = dbgrNuDExit
    Columns = <
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 48
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
        FieldName = 'ZAMESGOD'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 34
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
        FieldName = 'PDN'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTPUSKN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOLNIC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRM'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPRM'
        Width = 13
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETI'
        Width = 19
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIM'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIK'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIG'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND'
        Width = 15
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DHD'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLFND'
        Width = 15
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CBUDG'
        Width = 15
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNDB'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPDN'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRF'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPENS'
        Width = 13
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALIM'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNDB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSOCSTRAH'
        Width = 13
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SBZR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_PF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FSTVP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FSNV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPOV'
        Visible = True
      end>
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 367
    Width = 692
    Height = 126
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'PanelBottom'
    TabOrder = 1
    DesignSize = (
      692
      126)
    object sBtnStOnTop: TSpeedButton
      Left = 635
      Top = 70
      Width = 25
      Height = 25
      Hint = #1042#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080
      AllowAllUp = True
      Anchors = [akRight, akBottom]
      GroupIndex = 7
      Down = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
        77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
        07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStOnTopClick
    end
    object Label1: TLabel
      Left = 607
      Top = 8
      Width = 43
      Height = 13
      Hint = #1055#1086' '#1074#1089#1077#1084' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
      Anchors = [akTop, akRight]
      Caption = #1053#1072' '#1088#1091#1082#1080':'
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 607
      Top = 24
      Width = 79
      Height = 15
      Hint = #1055#1086' '#1074#1089#1077#1084' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object sBtnUchKart: TSpeedButton
      Left = 635
      Top = 42
      Width = 25
      Height = 25
      Hint = #1050#1072#1088#1090#1086#1090#1077#1082#1072'|'#1042#1082#1102#1095#1080#1090#1100' / '#1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1089#1080#1085#1093#1088#1086#1085#1085#1099#1081' '#1087#1086#1082#1072#1079' "'#1082#1072#1088#1090#1086#1090#1077#1082#1080'"'
      AllowAllUp = True
      Anchors = [akRight, akBottom]
      GroupIndex = 8
      Down = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object dbgrNuS: TDBGrid
      Left = 0
      Top = 0
      Width = 597
      Height = 126
      Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089#1074#1086#1076#1085#1086' ('#1057#1095#1077#1090', '#1057#1091#1073#1057#1095', '#1042#1080#1076')'
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clCream
      DataSource = dsrcNuS
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrNuSDrawColumnCell
      OnEnter = dbgrNuDEnter
      OnExit = dbgrNuDExit
    end
    object bBtnCancel: TBitBtn
      Left = 607
      Top = 98
      Width = 81
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = bBtnCancelClick
      Kind = bkCancel
    end
  end
  object qryNuS: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select PSCH, SchBU, VidN, ShVidN, Sum(summa) as SMM'
      '  from vinu_main '
      'where dtproc = '#39'11/01/2006'#39' and tabn = 23838 and VidN < '#39'8000'#39
      'group by PSCH, SchBU, VidN, ShVidN')
    Left = 160
    Top = 88
    object qryNuSPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object qryNuSSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryNuSVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuSSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNuSSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
  end
  object qryNuD: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ViNu_Main'
      'where TabN = 23838 and DtProc = "11/01/2006" and VidN < "8000"'
      'order by VidN, ZaMesGod')
    Left = 64
    Top = 56
    object qryNuDVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VINU_MAIN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuDSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VINU_MAIN.SHVIDN'
      Size = 15
    end
    object qryNuDPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Origin = 'DbMain.VINU_MAIN.PSCH'
      Size = 10
    end
    object qryNuDSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINU_MAIN.SCHBU'
      Size = 10
    end
    object qryNuDOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.VINU_MAIN.OLDKDVIDN'
    end
    object qryNuDVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
      Origin = 'DbMain.VINU_MAIN.VID_KDSPZ'
    end
    object qryNuDKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
      Origin = 'DbMain.VINU_MAIN.KDSCHDT'
    end
    object qryNuDSCHDT: TStringField
      FieldName = 'SCHDT'
      Origin = 'DbMain.VINU_MAIN.SCHDT'
      Size = 10
    end
    object qryNuDKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
      Origin = 'DbMain.VINU_MAIN.KDSCHKT'
    end
    object qryNuDSCHKT: TStringField
      FieldName = 'SCHKT'
      Origin = 'DbMain.VINU_MAIN.SCHKT'
      Size = 10
    end
    object qryNuDKEKV: TStringField
      FieldName = 'KEKV'
      Origin = 'DbMain.VINU_MAIN.KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNuDNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VINU_MAIN.NR'
    end
    object qryNuDDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINU_MAIN.DTPROC'
    end
    object qryNuDZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072' '#1052#1077#1089#1103#1094
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINU_MAIN.ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNuDTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VINU_MAIN.TABN'
    end
    object qryNuDCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.VINU_MAIN.CHAS'
    end
    object qryNuDSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VINU_MAIN.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryNuDDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINU_MAIN.DT_BEG'
    end
    object qryNuDDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.VINU_MAIN.DT_END'
    end
    object qryNuDKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINU_MAIN.KDSPS'
    end
    object qryNuDKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINU_MAIN.KDOBJ'
    end
    object qryNuDKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088
      FieldName = 'KDKATP'
      Origin = 'DbMain.VINU_MAIN.KDKATP'
    end
    object qryNuDKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VINU_MAIN.KDSPZ'
    end
    object qryNuDPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.VINU_MAIN.PDN'
    end
    object qryNuDNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.VINU_MAIN.NOTES'
      Size = 25
    end
    object qryNuDPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VINU_MAIN.PRR'
    end
    object qryNuDPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VINU_MAIN.PRPV'
    end
    object qryNuDKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VINU_MAIN.KTO'
    end
    object qryNuDPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VINU_MAIN.PRKR'
    end
    object qryNuDMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VINU_MAIN.MYNOTES'
      Size = 25
    end
    object qryNuDSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VINU_MAIN.SPECPS'
    end
    object qryNuDSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VINU_MAIN.SPEC_NR'
    end
    object qryNuDOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.VINU_MAIN.OLDKDOBJ'
    end
    object qryNuDZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.VINU_MAIN.ZP13'
      Size = 1
    end
    object qryNuDOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.VINU_MAIN.OTP'
      Size = 1
    end
    object qryNuDBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.VINU_MAIN.BLN'
      Size = 1
    end
    object qryNuDOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.VINU_MAIN.OTPUSKN'
      Size = 1
    end
    object qryNuDBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.VINU_MAIN.BOLNIC'
      Size = 1
    end
    object qryNuDSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.VINU_MAIN.SPRM'
      Size = 1
    end
    object qryNuDCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.VINU_MAIN.CPRM'
      Size = 1
    end
    object qryNuDDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.VINU_MAIN.DETI'
      Size = 1
    end
    object qryNuDDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.VINU_MAIN.DETIM'
      Size = 1
    end
    object qryNuDDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.VINU_MAIN.DETIK'
      Size = 1
    end
    object qryNuDDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.VINU_MAIN.DETIG'
      Size = 1
    end
    object qryNuDIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.VINU_MAIN.IND'
      Size = 1
    end
    object qryNuDDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.VINU_MAIN.DHD'
      Size = 1
    end
    object qryNuDOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.VINU_MAIN.OKLFND'
      Size = 1
    end
    object qryNuDCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VINU_MAIN.CBUDG'
      Size = 1
    end
    object qryNuDSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.VINU_MAIN.SNDB'
      Size = 1
    end
    object qryNuDSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.VINU_MAIN.SPDN'
      Size = 1
    end
    object qryNuDSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.VINU_MAIN.SPRF'
      Size = 1
    end
    object qryNuDSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.VINU_MAIN.SPENS'
      Size = 1
    end
    object qryNuDSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.VINU_MAIN.SALIM'
      Size = 1
    end
    object qryNuDCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.VINU_MAIN.CNDB'
      Size = 1
    end
    object qryNuDSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.VINU_MAIN.SSOCSTRAH'
      Size = 1
    end
    object qryNuDSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.VINU_MAIN.SBZR'
      Size = 1
    end
    object qryNuDSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.VINU_MAIN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNuDSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.VINU_MAIN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNuDSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.VINU_MAIN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNuDSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.VINU_MAIN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNuDSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINU_MAIN.SOVM'
      Size = 1
    end
    object qryNuDSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.VINU_MAIN.SPOV'
      Size = 1
    end
    object qryNuDNMVIDN: TStringField
      FieldName = 'NMVIDN'
      Origin = 'DbMain.VINU_MAIN.NMVIDN'
      Size = 64
    end
    object qryNuDNMSCH: TStringField
      FieldName = 'NMSCH'
      Origin = 'DbMain.VINU_MAIN.NMSCH'
      Size = 65
    end
  end
  object dsrcNuD: TDataSource
    DataSet = qryNuD
    Left = 80
    Top = 72
  end
  object dsrcNuS: TDataSource
    DataSet = qryNuS
    Left = 176
    Top = 104
  end
end
