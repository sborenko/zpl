object FormShwNuByY2: TFormShwNuByY2
  Left = 348
  Top = 264
  Width = 580
  Height = 465
  ActiveControl = dbgrNu
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwNuByY2'
  Color = clBtnFace
  Constraints.MinHeight = 380
  Constraints.MinWidth = 580
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      572
      31)
    object DBText1: TDBText
      Left = 16
      Top = 9
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'FamIO'
      DataSource = dsrcNU
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bBtnCancel: TBitBtn
      Left = 494
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 400
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcNU
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object dbgrNu: TDBGrid
    Left = 0
    Top = 31
    Width = 572
    Height = 407
    Align = alClient
    Color = clCream
    DataSource = dsrcNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrNuDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 52
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
        FieldName = 'KDSPS'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 32
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
        FieldName = 'CHAS'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 73
        Visible = True
      end>
  end
  object qryNU: TQuery
    OnCalcFields = qryNUCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select * from ViNuMain where TabN = 1239 and DtProc = '#39'03/01/200' +
        '9'#39)
    Left = 64
    Top = 112
    object qryNUDTPROC: TDateTimeField
      DisplayLabel = #1056#1072#1089#1095#1052#1077#1089#1103#1094
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINUMAIN.DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1103#1094
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINUMAIN.ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
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
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.VINUMAIN.TABN'
    end
    object qryNUKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
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
      DisplayLabel = #1057#1091#1073#1057#1095#1077#1090
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINUMAIN.SCHBU'
      Size = 10
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
      DisplayFormat = '0.00'
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
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINUMAIN.DT_BEG'
    end
    object qryNUDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.VINUMAIN.DT_END'
    end
    object qryNUKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINUMAIN.KDOBJ'
    end
    object qryNUKDKATP: TSmallintField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
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
    object qryNUFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 80
    Top = 128
  end
end
