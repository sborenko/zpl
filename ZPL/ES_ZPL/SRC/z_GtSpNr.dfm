object FormGetSpecNR: TFormGetSpecNR
  Left = 367
  Top = 180
  Width = 650
  Height = 400
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetSpecNR'
  Color = clBtnFace
  Constraints.MaxHeight = 785
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 385
  Constraints.MinWidth = 500
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 642
    Height = 343
    ActivePage = ts3
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object dbgrVOtp: TDBGrid
        Left = 0
        Top = 0
        Width = 634
        Height = 312
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcVOtp
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrVOtpDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRPRIK'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPRIK'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNTDAYS'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RK'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTEND'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROCOPL'
            Width = 27
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object dbgrVBln: TDBGrid
        Left = 0
        Top = 0
        Width = 634
        Height = 312
        Align = alClient
        Color = clGradientActiveCaption
        DataSource = dsrcVBln
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrVBlnDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRLIST'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTLIST'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTEND'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNTDAYS'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROCOPL'
            Visible = True
          end>
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object dbgrUdrg: TDBGrid
        Left = 0
        Top = 0
        Width = 634
        Height = 312
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcUdrg
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
            Width = 16
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMVZN'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMDOK'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOMU'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADRES'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 43
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 343
    Width = 642
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      642
      30)
    object bBtnOk: TBitBtn
      Left = 478
      Top = 1
      Width = 75
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 566
      Top = 1
      Width = 75
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryVOtp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Votp'
      'where TabN = 57721')
    Left = 52
    Top = 91
    object qryVOtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VOTP.NR'
    end
    object qryVOtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VOTP.KDSPS'
    end
    object qryVOtpDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089#1103#1094
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VOTP.DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryVOtpTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VOTP.TABN'
    end
    object qryVOtpCUROKLTRF: TFloatField
      FieldName = 'CUROKLTRF'
      Origin = 'DbMain.Z_VOTP.CUROKLTRF'
    end
    object qryVOtpALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VOTP.ALGRASCH'
    end
    object qryVOtpUSEKOEFOKL: TStringField
      FieldName = 'USEKOEFOKL'
      Origin = 'DbMain.Z_VOTP.USEKOEFOKL'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHMATPOM: TStringField
      FieldName = 'NCHMATPOM'
      Origin = 'DbMain.Z_VOTP.NCHMATPOM'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VOTP.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVOtpRK: TStringField
      DisplayLabel = #1088'/'#1082
      FieldName = 'RK'
      Origin = 'DbMain.Z_VOTP.RK'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNRPRIK: TStringField
      DisplayLabel = #8470#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'NRPRIK'
      Origin = 'DbMain.Z_VOTP.NRPRIK'
      Size = 15
    end
    object qryVOtpDTPRIK: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DTPRIK'
      Origin = 'DbMain.Z_VOTP.DTPRIK'
    end
    object qryVOtpDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VOTP.DTBEG'
    end
    object qryVOtpCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VOTP.CNTDAYS'
    end
    object qryVOtpDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VOTP.DTEND'
    end
    object qryVOtpCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VOTP.CNTCHAS'
    end
    object qryVOtpVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VOTP.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVOtpPROCOPL: TFloatField
      DisplayLabel = '%'#1086#1087#1083#1072#1090#1099
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VOTP.PROCOPL'
    end
    object qryVOtpKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VOTP.KDOBJ'
    end
    object qryVOtpKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VOTP.KDKATP'
    end
    object qryVOtpKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VOTP.KDSPZ'
    end
    object qryVOtpNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VOTP.NOTES'
      Size = 35
    end
    object qryVOtpSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VOTP.SMSRDN'
    end
    object qryVOtpSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VOTP.SPEC_NR'
    end
    object qryVOtpSMOTP: TFloatField
      FieldName = 'SMOTP'
      Origin = 'DbMain.Z_VOTP.SMOTP'
    end
  end
  object dsrcVOtp: TDataSource
    DataSet = qryVOtp
    Left = 72
    Top = 104
  end
  object qryVBln: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_VBln'
      '')
    Left = 116
    Top = 91
    object qryVBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object qryVBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VBLN.KDSPS'
    end
    object qryVBlnDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VBLN.DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryVBlnTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VBLN.TABN'
    end
    object qryVBlnALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VBLN.ALGRASCH'
    end
    object qryVBlnNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VBLN.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVBlnNRLIST: TStringField
      DisplayLabel = #8470#1083#1080#1089#1090#1082#1072
      FieldName = 'NRLIST'
      Origin = 'DbMain.Z_VBLN.NRLIST'
      Size = 15
    end
    object qryVBlnDTLIST: TDateTimeField
      DisplayLabel = #1044#1090#1042#1099#1076#1072#1095#1080
      FieldName = 'DTLIST'
      Origin = 'DbMain.Z_VBLN.DTLIST'
    end
    object qryVBlnDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VBLN.DTBEG'
    end
    object qryVBlnDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VBLN.DTEND'
    end
    object qryVBlnCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VBLN.CNTDAYS'
    end
    object qryVBlnVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VBLN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVBlnOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_VBLN.OLDKDVIDN'
    end
    object qryVBlnCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VBLN.CNTCHAS'
    end
    object qryVBlnPROCOPL: TFloatField
      DisplayLabel = '%'#1086#1087#1083#1072#1090#1099
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VBLN.PROCOPL'
    end
    object qryVBlnKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VBLN.KDOBJ'
    end
    object qryVBlnKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VBLN.KDKATP'
    end
    object qryVBlnKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VBLN.KDSPZ'
    end
    object qryVBlnNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VBLN.NOTES'
      Size = 35
    end
    object qryVBlnSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VBLN.SMSRDN'
    end
    object qryVBlnSMBLN: TFloatField
      FieldName = 'SMBLN'
      Origin = 'DbMain.Z_VBLN.SMBLN'
    end
    object qryVBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VBLN.SPEC_NR'
    end
  end
  object dsrcVBln: TDataSource
    DataSet = qryVBln
    Left = 136
    Top = 104
  end
  object qryUdrg: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Uderg'
      'where vidN = '#39'6101'#39)
    Left = 180
    Top = 91
    object qryUdrgNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UDERG.NR'
    end
    object qryUdrgKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_UDERG.KDSPS'
    end
    object qryUdrgTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UDERG.TABN'
    end
    object qryUdrgVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_UDERG.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryUdrgOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_UDERG.OLDKDVIDN'
    end
    object qryUdrgSUMDOLG: TFloatField
      FieldName = 'SUMDOLG'
      Origin = 'DbMain.Z_UDERG.SUMDOLG'
    end
    object qryUdrgSUMVZN: TFloatField
      DisplayLabel = '% / '#1057#1091#1084#1084#1072
      FieldName = 'SUMVZN'
      Origin = 'DbMain.Z_UDERG.SUMVZN'
    end
    object qryUdrgSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_UDERG.SPSRSCH'
    end
    object qryUdrgSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_UDERG.SP'
      Size = 1
    end
    object qryUdrgNOMDOK: TStringField
      DisplayLabel = #8470#1076#1086#1082'-'#1090#1072
      FieldName = 'NOMDOK'
      Origin = 'DbMain.Z_UDERG.NOMDOK'
      Size = 10
    end
    object qryUdrgDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_UDERG.DT_BEG'
    end
    object qryUdrgDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_UDERG.DT_END'
    end
    object qryUdrgKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_UDERG.KDSPZ'
    end
    object qryUdrgKDRSSCH: TIntegerField
      FieldName = 'KDRSSCH'
      Origin = 'DbMain.Z_UDERG.KDRSSCH'
    end
    object qryUdrgKOMU: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'KOMU'
      Origin = 'DbMain.Z_UDERG.KOMU'
      Size = 95
    end
    object qryUdrgADRES: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'ADRES'
      Origin = 'DbMain.Z_UDERG.ADRES'
      Size = 250
    end
    object qryUdrgKDPST: TIntegerField
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_UDERG.KDPST'
    end
    object qryUdrgPOSTA: TStringField
      FieldName = 'POSTA'
      Origin = 'DbMain.Z_UDERG.POSTA'
      FixedChar = True
      Size = 1
    end
    object qryUdrgNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_UDERG.NOTES'
      Size = 150
    end
    object qryUdrgNOMSBERBANK: TStringField
      FieldName = 'NOMSBERBANK'
      Origin = 'DbMain.Z_UDERG.NOMSBERBANK'
      Size = 15
    end
    object qryUdrgLICSCHET: TStringField
      FieldName = 'LICSCHET'
      Origin = 'DbMain.Z_UDERG.LICSCHET'
      Size = 15
    end
    object qryUdrgRSCHET: TStringField
      FieldName = 'RSCHET'
      Origin = 'DbMain.Z_UDERG.RSCHET'
      Size = 15
    end
    object qryUdrgBANK: TStringField
      FieldName = 'BANK'
      Origin = 'DbMain.Z_UDERG.BANK'
      Size = 55
    end
    object qryUdrgOKPOBANKA: TStringField
      FieldName = 'OKPOBANKA'
      Origin = 'DbMain.Z_UDERG.OKPOBANKA'
      Size = 15
    end
    object qryUdrgPROC_PSB: TFloatField
      FieldName = 'PROC_PSB'
      Origin = 'DbMain.Z_UDERG.PROC_PSB'
    end
    object qryUdrgSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_UDERG.SPEC_NR'
    end
  end
  object dsrcUdrg: TDataSource
    DataSet = qryUdrg
    Left = 200
    Top = 104
  end
end
