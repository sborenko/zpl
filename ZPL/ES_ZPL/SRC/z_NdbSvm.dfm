object FormNdbSovm: TFormNdbSovm
  Left = 354
  Top = 305
  Width = 700
  Height = 368
  BorderIcons = [biSystemMenu]
  Caption = 'FormNdbSovm'
  Color = clBtnFace
  Constraints.MaxWidth = 1055
  Constraints.MinHeight = 365
  Constraints.MinWidth = 700
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
    Top = 310
    Width = 692
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      692
      31)
    object bBtnCancel: TBitBtn
      Left = 614
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
  object dbgrNdb: TDBGrid
    Left = 0
    Top = 0
    Width = 692
    Height = 310
    Align = alClient
    Color = 13565421
    DataSource = dsrcNdb
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
        FieldName = 'SPSRSCH'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMPROC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
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
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPRBEG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPRBEG'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPREND'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPREND'
        Width = 61
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
        FieldName = 'DKR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DHD'
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
  object qryNdb: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_ViNadb where TabN = 1239 and Sovm = 1 '
      'order by Dt_Beg')
    Left = 104
    Top = 56
    object qryNdbNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VINADB.NR'
    end
    object qryNdbKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VINADB.KDSPS'
    end
    object qryNdbSPSRSCH: TSmallintField
      DisplayLabel = #1057#1087#1089#1073#1056#1072#1089#1095
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_VINADB.SPSRSCH'
    end
    object qryNdbTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VINADB.TABN'
    end
    object qryNdbVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VINADB.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNdbSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.Z_VINADB.SHVIDN'
      Size = 15
    end
    object qryNdbSUMPROC: TFloatField
      DisplayLabel = #1057#1084'/'#1055#1088#1094
      FieldName = 'SUMPROC'
      Origin = 'DbMain.Z_VINADB.SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryNdbSP: TStringField
      DisplayLabel = #1088'/%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_VINADB.SP'
      Size = 1
    end
    object qryNdbPRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
      Origin = 'DbMain.Z_VINADB.PRCSOVM'
    end
    object qryNdbDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_VINADB.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_VINADB.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VINADB.KDOBJ'
    end
    object qryNdbKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VINADB.KDKATP'
    end
    object qryNdbPRCHS: TStringField
      FieldName = 'PRCHS'
      Origin = 'DbMain.Z_VINADB.PRCHS'
      Size = 1
    end
    object qryNdbPRSMM: TStringField
      FieldName = 'PRSMM'
      Origin = 'DbMain.Z_VINADB.PRSMM'
      Size = 1
    end
    object qryNdbKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VINADB.KDSPZ'
    end
    object qryNdbSPEC_NR: TIntegerField
      DisplayLabel = 'Spec_NR'
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VINADB.SPEC_NR'
    end
    object qryNdbNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VINADB.NOTES'
      Size = 25
    end
    object qryNdbNRPRBEG: TStringField
      DisplayLabel = #8470#1087#1088#1053#1072#1095
      FieldName = 'NRPRBEG'
      Origin = 'DbMain.Z_VINADB.NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPRBEG: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1053#1072#1095
      FieldName = 'DTPRBEG'
      Origin = 'DbMain.Z_VINADB.DTPRBEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbNRPREND: TStringField
      DisplayLabel = #8470#1087#1088#1054#1082#1086#1085#1095
      FieldName = 'NRPREND'
      Origin = 'DbMain.Z_VINADB.NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPREND: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1054#1082#1086#1085#1095'.'
      FieldName = 'DTPREND'
      Origin = 'DbMain.Z_VINADB.DTPREND'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbNRPKT: TIntegerField
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_VINADB.NRPKT'
    end
    object qryNdbDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
      Origin = 'DbMain.Z_VINADB.DTVPKT'
    end
    object qryNdbPRC_WT: TFloatField
      FieldName = 'PRC_WT'
      Origin = 'DbMain.Z_VINADB.PRC_WT'
    end
    object qryNdbZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.Z_VINADB.ZP13'
      Size = 1
    end
    object qryNdbOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.Z_VINADB.OTP'
      Size = 1
    end
    object qryNdbBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.Z_VINADB.BLN'
      Size = 1
    end
    object qryNdbDKR: TStringField
      FieldName = 'DKR'
      Origin = 'DbMain.Z_VINADB.DKR'
      Size = 1
    end
    object qryNdbOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.Z_VINADB.OTPUSKN'
      Size = 1
    end
    object qryNdbBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.Z_VINADB.BOLNIC'
      Size = 1
    end
    object qryNdbSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.Z_VINADB.SPRM'
      Size = 1
    end
    object qryNdbCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.Z_VINADB.CPRM'
      Size = 1
    end
    object qryNdbSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.Z_VINADB.SSRK'
      FixedChar = True
      Size = 1
    end
    object qryNdbDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.Z_VINADB.DETI'
      Size = 1
    end
    object qryNdbDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.Z_VINADB.DETIM'
      Size = 1
    end
    object qryNdbDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.Z_VINADB.DETIK'
      Size = 1
    end
    object qryNdbDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.Z_VINADB.DETIG'
      Size = 1
    end
    object qryNdbIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.Z_VINADB.IND'
      Size = 1
    end
    object qryNdbDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.Z_VINADB.DHD'
      Size = 1
    end
    object qryNdbOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.Z_VINADB.OKLFND'
      Size = 1
    end
    object qryNdbCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.Z_VINADB.CBUDG'
      Size = 1
    end
    object qryNdbSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.Z_VINADB.SNDB'
      Size = 1
    end
    object qryNdbSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.Z_VINADB.SPDN'
      Size = 1
    end
    object qryNdbSWSB: TStringField
      FieldName = 'SWSB'
      Origin = 'DbMain.Z_VINADB.SWSB'
      Size = 1
    end
    object qryNdbSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.Z_VINADB.SPRF'
      Size = 1
    end
    object qryNdbSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.Z_VINADB.SPENS'
      Size = 1
    end
    object qryNdbSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.Z_VINADB.SALIM'
      Size = 1
    end
    object qryNdbCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.Z_VINADB.CNDB'
      Size = 1
    end
    object qryNdbSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.Z_VINADB.SSOCSTRAH'
      Size = 1
    end
    object qryNdbSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.Z_VINADB.SBZR'
      Size = 1
    end
    object qryNdbSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.Z_VINADB.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNdbSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.Z_VINADB.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNdbSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.Z_VINADB.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNdbSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.Z_VINADB.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNdbSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_VINADB.SOVM'
      Size = 1
    end
    object qryNdbSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.Z_VINADB.SPOV'
      Size = 1
    end
    object qryNdbKEKV: TStringField
      FieldName = 'KEKV'
      Origin = 'DbMain.Z_VINADB.KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNdbKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
      Origin = 'DbMain.Z_VINADB.KDSCHDT'
    end
    object qryNdbKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
      Origin = 'DbMain.Z_VINADB.KDSCHKT'
    end
  end
  object dsrcNdb: TDataSource
    DataSet = qryNdb
    Left = 120
    Top = 72
  end
end
