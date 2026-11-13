object FormShwPsPdnNU: TFormShwPsPdnNU
  Left = 414
  Top = 282
  Width = 605
  Height = 345
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormShwPsPdnNU'
  Color = clBtnFace
  Constraints.MaxWidth = 725
  Constraints.MinHeight = 345
  Constraints.MinWidth = 605
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    597
    318)
  PixelsPerInch = 96
  TextHeight = 13
  object sBtnStayOnTop: TSpeedButton
    Left = 3
    Top = 2
    Width = 25
    Height = 25
    Hint = #1042#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080
    AllowAllUp = True
    GroupIndex = 2
    Down = True
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
  object DBText1: TDBText
    Left = 192
    Top = 0
    Width = 65
    Height = 17
    DataField = 'DT_PRIEM'
    DataSource = dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 192
    Top = 14
    Width = 65
    Height = 15
    DataField = 'DT_UVOLN'
    DataSource = dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 32
    Top = 0
    Width = 148
    Height = 26
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1044#1072#1090#1099' '#1087#1088#1080#1077#1084#1072' '#1080' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103' '#1085#1072' '#1087#1088#1086#1074#1077#1088#1103#1077#1084#1099#1081' '#1084#1077#1089#1103#1094
    Transparent = True
    WordWrap = True
  end
  object dbgrNU: TDBGrid
    Left = 0
    Top = 29
    Width = 597
    Height = 289
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clCream
    DataSource = dsrcNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
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
        Width = 60
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
        FieldName = 'SCHBU'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 19
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 55
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 520
    Top = 2
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkCancel
    Spacing = 0
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ViNuMain '
      'where TabN = 2696 and ZaMesGod = '#39'10/01/2007'#39' and VidN < '#39'8000'#39
      'order by VidN, ZaMesGod ')
    Left = 72
    Top = 272
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
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINUMAIN.KDSPS'
    end
    object qryNUPSCH: TStringField
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
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINUMAIN.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072' '#1084#1077#1089'.'
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINUMAIN.ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
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
    end
    object qryNUDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.VINUMAIN.DT_END'
    end
    object qryNUKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINUMAIN.KDOBJ'
    end
    object qryNUKDKATP: TSmallintField
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
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 88
    Top = 280
  end
  object qryPrmUv: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from GET_PRMUVSTATE_ONDATE (5280, '#39'01/01/2007'#39')')
    Left = 144
    Top = 152
    object qryPrmUvTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryPrmUvDT_PRIEM: TDateTimeField
      FieldName = 'DT_PRIEM'
    end
    object qryPrmUvDT_UVOLN: TDateTimeField
      FieldName = 'DT_UVOLN'
    end
  end
  object dsrcPrmUv: TDataSource
    DataSet = qryPrmUv
    Left = 160
    Top = 168
  end
end
