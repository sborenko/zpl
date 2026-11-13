object FormOP_042011: TFormOP_042011
  Left = 378
  Top = 320
  Width = 677
  Height = 467
  BorderIcons = [biSystemMenu]
  Caption = 'FormOP_042011'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 669
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      669
      31)
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Hint = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1088#1072#1074#1082#1091' Ozn_Pilg '#1074' Z_NU '#1079#1072' 04-2011'
      Caption = 'Go!'
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object LabelCntRec: TLabel
      Left = 84
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object Label1: TLabel
      Left = 193
      Top = 2
      Width = 352
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1055#1077#1088#1077#1076' '#1079#1072#1087#1091#1089#1082#1086#1084' '#1087#1088#1086#1094#1077#1076#1091#1088#1099' '#1088#1072#1079#1086#1073#1088#1072#1090#1100#1089#1103' '#1089' Ozn_Pilg = ";" '#1080' '#1074#1085#1077#1089#1090#1080' '#1080 +
        #1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1090#1077#1082#1089#1090' '#1080#1089#1093#1086#1076#1085#1080#1082#1072' !!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object bBtnCancel: TBitBtn
      Left = 590
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
  object dbgrOP: TDBGrid
    Left = 0
    Top = 31
    Width = 669
    Height = 409
    Align = alClient
    Color = 15990494
    DataSource = dsrcOP
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 40
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
        FieldName = 'KDKATP'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_PILG'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MYNOTES'
        Width = 59
        Visible = True
      end>
  end
  object qryOP: TQuery
    DatabaseName = 'C_TEMP'
    SQL.Strings = (
      'Select * from pn0411_Lg order by TabN, ZaMesGod'
      '')
    Left = 104
    Top = 128
    object qryOPNR: TIntegerField
      FieldName = 'NR'
      Origin = 'C_TEMP."pn0411_lg.DB".NR'
    end
    object qryOPDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'C_TEMP."pn0411_lg.DB".DTPROC'
    end
    object qryOPZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'C_TEMP."pn0411_lg.DB".ZAMESGOD'
    end
    object qryOPTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'C_TEMP."pn0411_lg.DB".TABN'
    end
    object qryOPVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'C_TEMP."pn0411_lg.DB".VIDN'
      Size = 4
    end
    object qryOPCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'C_TEMP."pn0411_lg.DB".CHAS'
    end
    object qryOPSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'C_TEMP."pn0411_lg.DB".SUMMA'
    end
    object qryOPDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'C_TEMP."pn0411_lg.DB".DT_BEG'
    end
    object qryOPDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'C_TEMP."pn0411_lg.DB".DT_END'
    end
    object qryOPKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'C_TEMP."pn0411_lg.DB".KDSPS'
    end
    object qryOPKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'C_TEMP."pn0411_lg.DB".KDOBJ'
    end
    object qryOPKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'C_TEMP."pn0411_lg.DB".KDKATP'
    end
    object qryOPKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'C_TEMP."pn0411_lg.DB".KDSPZ'
    end
    object qryOPOZN_PILG: TStringField
      FieldName = 'OZN_PILG'
      Origin = 'C_TEMP."pn0411_lg.DB".OZN_PILG'
      Size = 10
    end
    object qryOPPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'C_TEMP."pn0411_lg.DB".PDN'
    end
    object qryOPNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'C_TEMP."pn0411_lg.DB".NOTES'
      Size = 25
    end
    object qryOPPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'C_TEMP."pn0411_lg.DB".PRR'
    end
    object qryOPPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'C_TEMP."pn0411_lg.DB".PRPV'
    end
    object qryOPKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'C_TEMP."pn0411_lg.DB".KTO'
    end
    object qryOPPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'C_TEMP."pn0411_lg.DB".PRKR'
    end
    object qryOPMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'C_TEMP."pn0411_lg.DB".MYNOTES'
      Size = 25
    end
    object qryOPSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'C_TEMP."pn0411_lg.DB".SPECPS'
    end
    object qryOPSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'C_TEMP."pn0411_lg.DB".SPEC_NR'
    end
    object qryOPOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'C_TEMP."pn0411_lg.DB".OLDKDOBJ'
    end
    object qryOPOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'C_TEMP."pn0411_lg.DB".OLDKDVIDN'
    end
    object qryOPDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'C_TEMP."pn0411_lg.DB".DTVDPV'
    end
    object qryOPNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'C_TEMP."pn0411_lg.DB".NRVDPV'
    end
    object qryOPSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'C_TEMP."pn0411_lg.DB".STORN'
      Size = 1
    end
    object qryOPPLG: TSmallintField
      FieldName = 'PLG'
      Origin = 'C_TEMP."pn0411_lg.DB".PLG'
    end
    object qryOPKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'C_TEMP."pn0411_lg.DB".KDBNK'
    end
  end
  object dsrcOP: TDataSource
    DataSet = qryOP
    Left = 120
    Top = 144
  end
  object qryTmp: TQuery
    Left = 208
    Top = 128
  end
end
