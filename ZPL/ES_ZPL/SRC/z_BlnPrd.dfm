object FormShPredBln: TFormShPredBln
  Left = 423
  Top = 416
  Width = 550
  Height = 381
  BorderIcons = [biSystemMenu]
  Caption = 'FormShPredBln'
  Color = clBtnFace
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 350
  Constraints.MinWidth = 550
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
  object Splitter1: TSplitter
    Left = 0
    Top = 184
    Width = 542
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clGreen
    ParentColor = False
  end
  object dbgrVBln: TDBGrid
    Left = 0
    Top = 0
    Width = 542
    Height = 184
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcVBln
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrVBlnDrawColumnCell
    OnDblClick = dbgrVBlnDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BlnCont'
        Width = 16
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
        FieldName = 'ShVidN'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERLIST'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRLIST'
        Width = 36
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
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEND'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNTDAYS'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROCOPL'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STGCMN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STG12'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 43
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 187
    Width = 542
    Height = 160
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      542
      160)
    object Label1: TLabel
      Left = 322
      Top = 39
      Width = 209
      Height = 34
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 
        #1042' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1083#1080#1089#1090#1082#1080'. '#1042' '#1085#1080#1078#1085#1077#1081' '#1088#1072#1089#1095#1077#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094 +
        #1080#1103' '#1082' '#1085#1080#1084'.'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 322
      Top = 80
      Width = 209
      Height = 43
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 
        #1042#1099#1073#1077#1088#1080#1090#1077' '#1074' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1083#1080#1089#1090#1086#1082'-'#1085#1072#1095#1072#1083#1086' '#1076#1083#1103' '#1074#1074#1086#1076#1080#1084#1086#1075#1086' '#1080' '#1085#1072#1078#1084#1080#1090#1077 +
        ' '#1082#1085#1086#1087#1082#1091' "'#1042#1099#1073#1086#1088'"'
      WordWrap = True
    end
    object bBtnOk: TBitBtn
      Left = 312
      Top = 135
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 467
      Top = 135
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
    object dbgrRBln: TDBGrid
      Left = 0
      Top = 0
      Width = 293
      Height = 160
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clInfoBk
      DataSource = dsrcRBln
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ZAMESGOD'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SMZARABOTKA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOEFZP'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNTDAYS'
          Width = 37
          Visible = True
        end>
    end
  end
  object qryVBln: TQuery
    OnCalcFields = qryVBlnCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_VBln')
    Left = 72
    Top = 48
    object qryVBlnNR: TIntegerField
      FieldName = 'NR'
    end
    object qryVBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryVBlnDTPROC: TDateTimeField
      DisplayLabel = #1042' '#1084#1077#1089#1103#1094#1077
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryVBlnTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryVBlnALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
    end
    object qryVBlnNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVBlnSERLIST: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SERLIST'
      Origin = 'DbMain.Z_VBLN.SERLIST'
      Size = 5
    end
    object qryVBlnNRLIST: TStringField
      DisplayLabel = #1053#1088#1051#1080#1089#1090#1082#1072
      FieldName = 'NRLIST'
      Size = 15
    end
    object qryVBlnDTLIST: TDateTimeField
      DisplayLabel = #1044#1090#1051#1080#1089#1090#1082#1072
      FieldName = 'DTLIST'
    end
    object qryVBlnDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
    end
    object qryVBlnDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
    end
    object qryVBlnCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
    end
    object qryVBlnVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVBlnShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryVBlnDAY5FIRST: TStringField
      FieldName = 'DAY5FIRST'
      FixedChar = True
      Size = 1
    end
    object qryVBlnOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object qryVBlnCNTCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1086#1074
      FieldName = 'CNTCHAS'
    end
    object qryVBlnPROCOPL: TFloatField
      DisplayLabel = '% '#1086#1087#1083#1072#1090#1099
      FieldName = 'PROCOPL'
    end
    object qryVBlnKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qryVBlnKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qryVBlnKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryVBlnNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 35
    end
    object qryVBlnSMSRDN: TFloatField
      FieldName = 'SMSRDN'
    end
    object qryVBlnSMBLN: TFloatField
      FieldName = 'SMBLN'
    end
    object qryVBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryVBlnLISTCONT: TStringField
      FieldName = 'LISTCONT'
      FixedChar = True
      Size = 1
    end
    object qryVBlnBlnCont: TStringField
      DisplayLabel = #1055#1088#1076#1083#1078
      FieldKind = fkCalculated
      FieldName = 'BlnCont'
      Size = 1
      Calculated = True
    end
    object qryVBlnPREDSPEC_NR: TIntegerField
      FieldName = 'PREDSPEC_NR'
    end
    object qryVBlnSTGCMN: TFloatField
      DisplayLabel = #1057#1090#1072#1078#1054#1073#1097
      FieldName = 'STGCMN'
    end
    object qryVBlnSTG12: TFloatField
      DisplayLabel = #1057#1090#1072#1078'12'#1052#1077#1089
      FieldName = 'STG12'
    end
  end
  object dsrcVBln: TDataSource
    DataSet = qryVBln
    Left = 88
    Top = 64
  end
  object qryRBln: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcVBln
    SQL.Strings = (
      'Select * from Z_RBln'
      'where Spec_NR = :Spec_NR'
      'order by ZaMesGod')
    Left = 72
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryRBlnNR: TIntegerField
      FieldName = 'NR'
    end
    object qryRBlnTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryRBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryRBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryRBlnZAMESGOD: TDateTimeField
      DisplayLabel = #1042' '#1084#1077#1089#1103#1094#1077
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryRBlnSMZARABOTKA: TFloatField
      DisplayLabel = #1057#1084#1047#1072#1088#1072#1073#1086#1090#1082#1072
      FieldName = 'SMZARABOTKA'
      DisplayFormat = '#.00'
    end
    object qryRBlnKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090
      FieldName = 'KOEFZP'
    end
    object qryRBlnCNTDAYS: TFloatField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_RBLN.CNTDAYS'
    end
  end
  object dsrcRBln: TDataSource
    DataSet = qryRBln
    Left = 88
    Top = 288
  end
end
