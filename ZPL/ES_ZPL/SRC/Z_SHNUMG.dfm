object FormShowNuMG: TFormShowNuMG
  Left = 455
  Top = 426
  Width = 850
  Height = 304
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormShowNuMG'
  Color = clBtnFace
  Constraints.MaxHeight = 650
  Constraints.MaxWidth = 1000
  Constraints.MinHeight = 250
  Constraints.MinWidth = 850
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
  object SplitMsg: TSplitter
    Left = 0
    Top = 74
    Width = 834
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object dbgrNU: TDBGrid
    Left = 0
    Top = 77
    Width = 834
    Height = 159
    Hint = 
      '"'#1046#1080#1088#1085#1099#1084'" '#1074#1099#1076#1077#1083#1077#1085#1099' '#1074#1080#1076#1099', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1074' '#1088#1072#1089#1095#1077#1090' '#1089#1091#1084#1084#1099'. "'#1041#1083#1077#1076#1085#1099#1084'" - '#1085 +
      #1077' '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1077'. '#1057#1080#1085#1080#1084' - "'#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1077'" '#1074#1080#1076#1099'. '#1046#1105#1083#1090#1099#1084' - "'#1073#1102#1076#1078#1077#1090#1085 +
      #1099#1077'" '#1074#1080#1076#1099'.'
    Align = alClient
    Color = clMoneyGreen
    DataSource = DsrcNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrNUDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Title.Caption = #1042' '#1084#1077#1089#1103#1094#1077
        Width = 35
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'ZAMESGOD'
        Title.Caption = #1047#1072' '#1084#1077#1089#1103#1094
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Title.Caption = #1063#1072#1089#1099
        Width = 44
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'SUMMA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = #1057#1091#1084#1084#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 58
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
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Title.Caption = #1055#1076#1053
        Width = 19
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHOBJ'
        Title.Caption = #1055#1076#1088
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKATP'
        Title.Caption = #1050#1090#1075#1088
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPZ'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Title.Caption = #1057#1086#1074#1084#1042#1080#1076
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTP'
        Title.Caption = #1054#1090#1087#1057#1084
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLN'
        Title.Caption = #1041#1083#1085#1057#1084
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DKR'
        Title.Caption = #1044#1082#1088#1057#1084
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CBUDG'
        Title.Caption = #1041#1102#1076#1078#1063
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Title.Caption = #1055#1088#1080#1084#1077#1095'.'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NdbDtBeg'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NdbDtEnd'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Width = 55
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 236
    Width = 834
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      834
      29)
    object sBtnStayOnTop: TSpeedButton
      Left = 2
      Top = 3
      Width = 25
      Height = 25
      Hint = #1042#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080
      AllowAllUp = True
      GroupIndex = 7
      Down = True
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStayOnTopClick
    end
    object LabelTotals: TLabel
      Left = 34
      Top = 8
      Width = 67
      Height = 13
      Hint = 
        #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' - '#1088#1072#1089#1095#1105#1090#1085#1086#1077' '#1087#1086' '#1082#1072#1083#1077#1085#1076#1072#1088#1102' '#1080' E_Days. '#1057#1091#1084#1084#1072' - '#1080#1079' '#1090#1072#1073#1083#1080#1094 +
        #1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081'.'
      Caption = 'LabelTotals'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object sBtnMsg: TSpeedButton
      Left = 723
      Top = 3
      Width = 25
      Height = 25
      Hint = #1055#1086#1076#1089#1082#1072#1079#1082#1072
      Anchors = [akTop, akRight]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
        33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
        FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
        FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
        FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
        FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
        FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
        3333333773FFFF77333333333FBFBF3333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnMsgClick
    end
    object sBtnNdbSvm: TSpeedButton
      Left = 645
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1077#1081
      Anchors = [akTop, akRight]
      Caption = #1053#1072#1076#1073#1057#1086#1074#1084
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnNdbSvmClick
    end
    object bBtnClose: TBitBtn
      Left = 751
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = bBtnCloseClick
      Kind = bkClose
      Spacing = 0
    end
    object ChBoxSepDetails: TCheckBox
      Left = 472
      Top = 7
      Width = 161
      Height = 17
      Caption = #1056#1072#1079#1076#1083#1103#1090#1100' '#1087#1086' '#1090#1080#1087#1091' '#1086#1090#1087#1091#1089#1082#1072
      TabOrder = 1
      OnClick = ChBoxSepDetailsClick
    end
  end
  object PanelMsg: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    Color = clMoneyGreen
    TabOrder = 2
    object MemoMsg: TMemo
      Left = 0
      Top = 0
      Width = 834
      Height = 74
      TabStop = False
      Align = alClient
      Alignment = taCenter
      BevelOuter = bvRaised
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Lines.Strings = (
        
          #1042' '#1089#1090#1088#1086#1082#1077' '#1074' '#1085#1080#1078#1085#1077#1081' '#1095#1072#1089#1090#1080' '#1101#1082#1088#1072#1085#1072' - '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081', '#1088#1072#1089#1089#1095#1080#1090#1072#1085#1085#1086#1077' '#1087 +
          #1086' '#1082#1072#1083#1077#1085#1076#1072#1088#1102' '#1089' '#1091#1095#1105#1090#1086#1084' '#1090#1072#1073#1083#1080#1094#1099' '
        #1085#1077#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1093' '#1076#1085#1077#1081'.'
        
          #1042' '#1090#1072#1073#1083#1080#1094#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' - '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081', '#1088#1072#1089#1095#1080#1090#1072#1085#1085#1086#1077' '#1089' '#1091#1095#1105#1090#1086#1084'  '#1076#1072 +
          #1090#1099' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1087#1088#1080#1105#1084#1072' '#1085#1072' '#1088#1072#1073#1086#1090#1091', '
        #1085#1077#1086#1087#1083#1072#1095#1080#1074#1072#1077#1084#1099#1093' '#1074#1080#1076#1086#1074' '#1080' '#1074#1086#1079#1084#1086#1078#1085#1099#1093' '
        #1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' "'#1073#1102#1076#1078#1077#1090#1085#1099#1084'" '#1074#1080#1076#1072#1084'.')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object QryNu: TQuery
    OnCalcFields = QryNuCalcFields
    DatabaseName = 'DbMain'
    DataSource = FormEOtp.dsrc_ROtp
    SQL.Strings = (
      'Select ob.ShObj, kp.ShKatP, nu.*'
      ' from ViNu_Main nu '
      ' Left Outer Join z_Kdobj ob on (ob.KdObj = nu.KdObj) '
      ' Left Outer Join z_KatPers kp on (kp.KdKatP = nu.KdKatP) '
      
        ' where (nu.TabN = 46038) and (nu.ZaMesGod = '#39'12/01/2006'#39') and Vi' +
        'dN < "6000" '
      ' order by DtProc,  VidN,  ZaMesGod')
    Left = 208
    Top = 96
    object QryNuNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NU.NR'
    end
    object QryNuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_NU.DTPROC'
      DisplayFormat = 'mm-yy'
    end
    object QryNuTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NU.TABN'
    end
    object QryNuVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Size = 3
    end
    object QryNuSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 15
      FieldName = 'SHVIDN'
    end
    object QryNuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NU.KDOBJ'
    end
    object QryNuSHOBJ: TStringField
      FieldName = 'SHOBJ'
      Size = 15
    end
    object QryNuKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NU.KDKATP'
    end
    object QryNuSHKATP: TStringField
      FieldName = 'SHKATP'
      Size = 10
    end
    object QryNuDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NU.DT_BEG'
      DisplayFormat = 'dd-mm-yy'
    end
    object QryNuDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NU.DT_END'
      DisplayFormat = 'dd-mm-yy'
    end
    object QryNuPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.Z_NU.PDN'
    end
    object QryNuCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_NU.CHAS'
      DisplayFormat = '#.00'
    end
    object QryNuSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_NU.SUMMA'
      DisplayFormat = '0.00'
    end
    object QryNuKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object QryNuSPZ: TStringField
      DisplayLabel = #1064#1055#1047
      FieldKind = fkCalculated
      FieldName = 'SPZ'
      Origin = 'DbMain.Z_NU.SPZ'
      Size = 10
      Calculated = True
    end
    object QryNuNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NU.NOTES'
      Size = 13
    end
    object QryNuPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_NU.PRR'
    end
    object QryNuPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_NU.PRPV'
    end
    object QryNuKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_NU.KTO'
    end
    object QryNuPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_NU.PRKR'
    end
    object QryNuZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_NU.ZAMESGOD'
      DisplayFormat = 'mm-yy'
    end
    object QryNuSPEC_NR: TIntegerField
      DisplayLabel = 'Spec_NR'
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NU.SPEC_NR'
    end
    object QryNuPSCH: TStringField
      FieldName = 'PSCH'
      Size = 10
    end
    object QryNuSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 10
    end
    object QryNuNMSCH: TStringField
      FieldName = 'NMSCH'
      Size = 65
    end
    object QryNuNMVIDN: TStringField
      FieldName = 'NMVIDN'
      Size = 64
    end
    object QryNuOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object QryNuVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
    end
    object QryNuKEKV: TStringField
      FieldName = 'KEKV'
      FixedChar = True
      Size = 4
    end
    object QryNuKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
    end
    object QryNuMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object QryNuSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object QryNuOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object QryNuZP13: TStringField
      FieldName = 'ZP13'
      Size = 1
    end
    object QryNuOTP: TStringField
      FieldName = 'OTP'
      Size = 1
    end
    object QryNuBLN: TStringField
      FieldName = 'BLN'
      Size = 1
    end
    object QryNuDKR: TStringField
      FieldName = 'DKR'
      Size = 1
    end
    object QryNuOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Size = 1
    end
    object QryNuBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Size = 1
    end
    object QryNuSPRM: TStringField
      FieldName = 'SPRM'
      Size = 1
    end
    object QryNuCPRM: TStringField
      FieldName = 'CPRM'
      Size = 1
    end
    object QryNuDETI: TStringField
      FieldName = 'DETI'
      Size = 1
    end
    object QryNuDETIM: TStringField
      FieldName = 'DETIM'
      Size = 1
    end
    object QryNuDETIK: TStringField
      FieldName = 'DETIK'
      Size = 1
    end
    object QryNuDETIG: TStringField
      FieldName = 'DETIG'
      Size = 1
    end
    object QryNuIND: TStringField
      FieldName = 'IND'
      Size = 1
    end
    object QryNuDHD: TStringField
      FieldName = 'DHD'
      Size = 1
    end
    object QryNuOKLFND: TStringField
      FieldName = 'OKLFND'
      Size = 1
    end
    object QryNuCBUDG: TStringField
      DisplayLabel = #1063#1041#1102#1076#1078
      FieldName = 'CBUDG'
      Size = 1
    end
    object QryNuSNDB: TStringField
      FieldName = 'SNDB'
      Size = 1
    end
    object QryNuSPDN: TStringField
      FieldName = 'SPDN'
      Size = 1
    end
    object QryNuSPRF: TStringField
      FieldName = 'SPRF'
      Size = 1
    end
    object QryNuSPENS: TStringField
      FieldName = 'SPENS'
      Size = 1
    end
    object QryNuSALIM: TStringField
      FieldName = 'SALIM'
      Size = 1
    end
    object QryNuCNDB: TStringField
      FieldName = 'CNDB'
      Size = 1
    end
    object QryNuSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Size = 1
    end
    object QryNuSBZR: TStringField
      FieldName = 'SBZR'
      Size = 1
    end
    object QryNuSP_PF: TStringField
      FieldName = 'SP_PF'
      FixedChar = True
      Size = 1
    end
    object QryNuSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object QryNuSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object QryNuSP_FZ: TStringField
      FieldName = 'SP_FZ'
      FixedChar = True
      Size = 1
    end
    object QryNuSOVM: TStringField
      FieldName = 'SOVM'
      Size = 1
    end
    object QryNuSPOV: TStringField
      FieldName = 'SPOV'
      Size = 1
    end
    object QryNuKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
    end
    object QryNuSCHDT: TStringField
      FieldName = 'SCHDT'
      Size = 10
    end
    object QryNuKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
    end
    object QryNuSCHKT: TStringField
      FieldName = 'SCHKT'
      Size = 10
    end
    object QryNuSSRK: TStringField
      FieldName = 'SSRK'
      FixedChar = True
      Size = 1
    end
    object QryNuNdbDtBeg: TDateTimeField
      DisplayLabel = #1053#1076#1073#1044#1090#1053#1072#1095
      FieldKind = fkCalculated
      FieldName = 'NdbDtBeg'
      DisplayFormat = 'dd/mm/yy'
      Calculated = True
    end
    object QryNuNdbDtEnd: TDateTimeField
      DisplayLabel = #1053#1076#1073#1044#1090#1054#1082#1086#1085#1095
      FieldKind = fkCalculated
      FieldName = 'NdbDtEnd'
      DisplayFormat = 'dd/mm/yy'
      Calculated = True
    end
    object QryNuNuSovm: TStringField
      FieldName = 'NuSovm'
      Size = 1
    end
  end
  object DsrcNU: TDataSource
    DataSet = QryNu
    Left = 216
    Top = 112
  end
end
