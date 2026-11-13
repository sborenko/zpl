object FormViPere: TFormViPere
  Left = 545
  Top = 360
  Width = 800
  Height = 350
  BorderIcons = [biSystemMenu]
  Caption = 'FormViPere'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 1300
  Constraints.MinHeight = 350
  Constraints.MinWidth = 800
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
    Width = 792
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      792
      31)
    object LabelSort: TLabel
      Left = 24
      Top = 8
      Width = 55
      Height = 13
      Caption = 'LabelSort'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bBtnCancel: TBitBtn
      Left = 712
      Top = 3
      Width = 77
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrPere: TDBGrid
    Left = 0
    Top = 31
    Width = 792
    Height = 292
    Align = alClient
    Color = 10480861
    DataSource = dsrcPere
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrPereDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'BM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBM'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDTEMU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NPD'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRCWRKTIME'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLTRF'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVANS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_AV'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Z_KPP'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDDOLGN'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOLGNOST'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_PENS'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDNLG'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROCLG'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLMIN'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRFS'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRDEKR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CMBOKL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPKT'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTVPKT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDOK'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NEWKDOK'
        Width = 48
        Visible = True
      end>
  end
  object qryPere: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select first 20 * from Z_Pere '
      'where TabN = 3937 order by Dt_Beg desc')
    Left = 200
    Top = 152
    object qryPereNR: TIntegerField
      FieldName = 'NR'
    end
    object qryPereBM: TStringField
      DisplayLabel = #1041#1052
      FieldName = 'BM'
      FixedChar = True
      Size = 1
    end
    object qryPereDTBM: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1041#1052
      FieldName = 'DTBM'
    end
    object qryPereKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryPereTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryPereDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089
      FieldName = 'DT_BEG'
    end
    object qryPereKDTEMU: TSmallintField
      DisplayLabel = #1050#1076' '#1058#1077#1084#1099
      FieldName = 'KDTEMU'
    end
    object qryPereKDOBJ: TSmallintField
      DisplayLabel = #1050#1076' '#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryPereKDKATP: TSmallintField
      DisplayLabel = #1050#1076' '#1050#1072#1090#1055
      FieldName = 'KDKATP'
    end
    object qryPereNPD: TSmallintField
      DisplayLabel = #1053#1087#1044
      FieldName = 'NPD'
    end
    object qryPerePRCWRKTIME: TFloatField
      DisplayLabel = '% '#1056#1072#1073#1042#1088
      FieldName = 'PRCWRKTIME'
    end
    object qryPereSO: TSmallintField
      DisplayLabel = #1057#1054#1087#1083
      FieldName = 'SO'
    end
    object qryPereOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083#1058#1088#1092
      FieldName = 'OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryPereAVANS: TFloatField
      DisplayLabel = #1040#1074#1072#1085#1089
      FieldName = 'AVANS'
    end
    object qryPereSP_AV: TStringField
      DisplayLabel = '%/'#1057#1084
      FieldName = 'SP_AV'
      Size = 1
    end
    object qryPereCODE: TStringField
      FieldName = 'CODE'
      FixedChar = True
      Size = 10
    end
    object qryPereZ_KPP: TStringField
      FieldName = 'Z_KPP'
      FixedChar = True
      Size = 10
    end
    object qryPereKDDOLGN: TSmallintField
      DisplayLabel = #1050#1076' '#1044#1086#1083#1078#1085
      FieldName = 'KDDOLGN'
    end
    object qryPereDOLGNOST: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'. ('#1044#1086#1083#1078#1085#1086#1089#1090#1100')'
      FieldName = 'DOLGNOST'
      Size = 40
    end
    object qryPereKDSPZ: TSmallintField
      DisplayLabel = 'K'#1076#1057#1041#1059
      FieldName = 'KDSPZ'
    end
    object qryPerePR_PENS: TSmallintField
      DisplayLabel = #1055#1077#1085#1089
      FieldName = 'PR_PENS'
    end
    object qryPereSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084
      FieldName = 'SOVM'
    end
    object qryPerePDNLG: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDNLG'
    end
    object qryPerePROCLG: TFloatField
      DisplayLabel = '% '#1083#1100#1075#1086#1090#1099
      FieldName = 'PROCLG'
    end
    object qryPereKOLMIN: TSmallintField
      DisplayLabel = #1050#1086#1083#1084#1080#1085
      FieldName = 'KOLMIN'
    end
    object qryPerePRFS: TSmallintField
      DisplayLabel = #1055#1088#1086#1092#1089
      FieldName = 'PRFS'
    end
    object qryPereNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Size = 10
    end
    object qryPereDT_PRIKAZA: TDateTimeField
      FieldName = 'DT_PRIKAZA'
    end
    object qryPereNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Size = 35
    end
    object qryPereINV: TSmallintField
      DisplayLabel = #1048#1085#1074
      FieldName = 'INV'
    end
    object qryPereRANG: TSmallintField
      FieldName = 'RANG'
    end
    object qryPereRAZR: TSmallintField
      FieldName = 'RAZR'
    end
    object qryPereDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object qryPerePRDEKR: TStringField
      DisplayLabel = #1055#1088' '#1044#1077#1082#1088
      FieldName = 'PRDEKR'
      FixedChar = True
      Size = 1
    end
    object qryPereCMBOKL: TStringField
      DisplayLabel = #1050#1086#1084#1073#1054#1082#1083
      FieldName = 'CMBOKL'
      FixedChar = True
      Size = 1
    end
    object qryPereSPEC_NR: TIntegerField
      DisplayLabel = #1057#1087#1077#1094'_'#1053#1056
      FieldName = 'SPEC_NR'
    end
    object qryPereNRPKT: TIntegerField
      DisplayLabel = #8470' '#1087#1082#1090
      FieldName = 'NRPKT'
    end
    object qryPereDTVPKT: TDateTimeField
      DisplayLabel = #1044#1090' '#1055#1082#1090
      FieldName = 'DTVPKT'
    end
    object qryPereNOINDX: TStringField
      FieldName = 'NOINDX'
      FixedChar = True
      Size = 1
    end
    object qryPereOLDKDOK: TSmallintField
      FieldName = 'OLDKDOK'
    end
    object qryPereNEWKDOK: TSmallintField
      FieldName = 'NEWKDOK'
    end
  end
  object dsrcPere: TDataSource
    DataSet = qryPere
    Left = 216
    Top = 168
  end
end
