object FormEBnkL2: TFormEBnkL2
  Left = 343
  Top = 192
  Width = 600
  Height = 445
  BorderIcons = [biSystemMenu]
  Caption = 'FormEBnkL2'
  Color = clBtnFace
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 445
  Constraints.MinWidth = 600
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
  object Splitter2: TSplitter
    Left = 334
    Top = 0
    Height = 387
    Beveled = True
    MinSize = 50
  end
  object Panel1: TPanel
    Left = 0
    Top = 387
    Width = 592
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      592
      31)
    object bBtnOk: TBitBtn
      Left = 426
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 515
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgrUpi: TDBGrid
    Left = 0
    Top = 0
    Width = 334
    Height = 387
    Hint = #1047#1072#1087#1080#1089#1080' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
    Align = alLeft
    Color = clCream
    Constraints.MinWidth = 250
    DataSource = dsrcUpi
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrUpiDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POL'
        Visible = True
      end>
  end
  object dbgrNU: TDBGrid
    Left = 337
    Top = 0
    Width = 255
    Height = 387
    Hint = 
      #1055#1086'-'#1084#1077#1089#1103#1095#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093' / '#1091#1076#1077#1088#1078#1072#1085#1080#1103#1093' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1058#1072#1073 +
      '.'#1053#1088'.'
    Align = alClient
    Color = clCream
    Constraints.MinWidth = 200
    DataSource = dsrcNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MYMG'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMNACH'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMUDRG'
        Visible = True
      end>
  end
  object qryUpi: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Upi where Id = "1487501225"')
    Left = 80
    Top = 160
    object qryUpiNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UPI.NR'
    end
    object qryUpiTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UPI.TABN'
    end
    object qryUpiID: TStringField
      DisplayLabel = #1048#1044
      FieldName = 'ID'
      Origin = 'DbMain.Z_UPI.ID'
      Size = 10
    end
    object qryUpiFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
      Origin = 'DbMain.Z_UPI.FAM'
    end
    object qryUpiIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Origin = 'DbMain.Z_UPI.IMA'
      Size = 15
    end
    object qryUpiOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
      Origin = 'DbMain.Z_UPI.OTCH'
    end
    object qryUpiDOB: TDateTimeField
      FieldName = 'DOB'
      Origin = 'DbMain.Z_UPI.DOB'
    end
    object qryUpiPOL: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'POL'
      Origin = 'DbMain.Z_UPI.POL'
      Size = 1
    end
    object qryUpiPRUV: TSmallintField
      FieldName = 'PRUV'
      Origin = 'DbMain.Z_UPI.PRUV'
    end
    object qryUpiOBJFROM: TSmallintField
      FieldName = 'OBJFROM'
      Origin = 'DbMain.Z_UPI.OBJFROM'
    end
    object qryUpiOLDTABN: TIntegerField
      FieldName = 'OLDTABN'
      Origin = 'DbMain.Z_UPI.OLDTABN'
    end
    object qryUpiLASTDTPRM: TDateTimeField
      FieldName = 'LASTDTPRM'
      Origin = 'DbMain.Z_UPI.LASTDTPRM'
    end
    object qryUpiLASTDTUVL: TDateTimeField
      FieldName = 'LASTDTUVL'
      Origin = 'DbMain.Z_UPI.LASTDTUVL'
    end
    object qryUpiMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_UPI.MYNOTES'
      FixedChar = True
      Size = 25
    end
    object qryUpiPRARC: TSmallintField
      FieldName = 'PRARC'
      Origin = 'DbMain.Z_UPI.PRARC'
    end
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    OnDataChange = dsrcUpiDataChange
    Left = 88
    Top = 176
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'Select TabN, KdSps, DtProc as MyMG, SmNach, SmUdrg, SmVupl'
      'from GETNU_TOTS_DTPROC (:TabN)'
      'order by DtProc, KdSps'
      '')
    Left = 400
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryNUTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryNUKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryNUMYMG: TDateTimeField
      DisplayLabel = #1052#1077#1089#1043#1086#1076
      FieldName = 'MYMG'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNUSMNACH: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'SMNACH'
      DisplayFormat = '#.00'
    end
    object qryNUSMUDRG: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1086
      FieldName = 'SMUDRG'
      DisplayFormat = '#.00'
    end
    object qryNUSMVUPL: TFloatField
      DisplayLabel = #1050' '#1074#1099#1087#1083'.'
      FieldName = 'SMVUPL'
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 408
    Top = 176
  end
end
