object FormMkDr8: TFormMkDr8
  Left = 330
  Top = 183
  Width = 500
  Height = 300
  Caption = 'FormMkDr8'
  Color = clBtnFace
  Constraints.MinHeight = 300
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
  object Splitter1: TSplitter
    Left = 137
    Top = 30
    Height = 230
    Beveled = True
    Color = clAqua
    ParentColor = False
  end
  object Label2: TLabel
    Left = 0
    Top = 260
    Width = 492
    Height = 13
    Align = alBottom
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dbgrLst: TDBGrid
    Left = 0
    Top = 30
    Width = 137
    Height = 230
    Align = alLeft
    DataSource = dsrcLst
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrLstDrawColumnCell
    OnDblClick = dbgrLstDblClick
    OnKeyDown = dbgrLstKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NmDtProc'
        Title.Caption = #1055#1077#1088#1080#1086#1076#1099
        Width = 97
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object sBtnContinue: TSpeedButton
      Left = 3
      Top = 2
      Width = 89
      Height = 27
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      Enabled = False
      OnClick = sBtnContinueClick
    end
    object Label1: TLabel
      Left = 98
      Top = 2
      Width = 346
      Height = 27
      AutoSize = False
      Caption = 
        #1050#1083#1072#1074#1080#1096#1077#1081'           '#1080#1083#1080' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1086#1090#1084#1077#1090#1100#1090#1077' '#1087#1077#1088#1080#1086#1076#1099', '#1074 +
        #1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1074' '#1086#1090#1095#1077#1090', '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object sBtnF8: TSpeedButton
      Left = 154
      Top = 2
      Width = 24
      Height = 17
      Caption = 'F8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = dbgrLstDblClick
    end
    object SpeedButton1: TSpeedButton
      Left = 457
      Top = 2
      Width = 33
      Height = 27
      OnClick = SpeedButton1Click
    end
  end
  object dbgrTmp: TDBGrid
    Left = 140
    Top = 30
    Width = 352
    Height = 230
    Align = alClient
    DataSource = dsrcTmp
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
        FieldName = 'FamIO'
        Width = 92
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
        FieldName = 'ID'
        Width = 67
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
        FieldName = 'KDVIDN'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 60
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
        FieldName = 'CHAS'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDVED'
        Width = 15
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDBRIG'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 15
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPZ'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KTS'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTS'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRR'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRPV'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KTO'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRKR'
        Width = 23
        Visible = True
      end>
  end
  object lbxF8: TListBox
    Left = 72
    Top = 160
    Width = 49
    Height = 49
    BorderStyle = bsNone
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object qryLst: TQuery
    OnCalcFields = qryLstCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct DtProc'
      'from Z_NU')
    Left = 32
    Top = 104
    object qryLstDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Visible = False
      DisplayFormat = 'mm-yyyy'
    end
    object qryLstNmDtProc: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmDtProc'
      Size = 25
      Calculated = True
    end
  end
  object dsrcLst: TDataSource
    DataSet = qryLst
    Left = 48
    Top = 120
  end
  object qryTmp: TQuery
    OnCalcFields = qryTmpCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select upi.Fam, upi.Ima, upi.Otch, upi.ID, nu.* '
      'from Z_Nu nu'
      '  Left outer join Z_UPI upi on z_upi.Tabn = nu.Tabn'
      '  order by DtProc, Fam, Ima, Otch')
    Left = 224
    Top = 144
    object qryTmpFAM: TStringField
      FieldName = 'FAM'
    end
    object qryTmpIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryTmpOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryTmpID: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'ID'
      Size = 10
    end
    object qryTmpNR: TIntegerField
      FieldName = 'NR'
    end
    object qryTmpDTPROC: TDateTimeField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'DTPROC'
      DisplayFormat = 'mm-yyyy'
    end
    object qryTmpTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryTmpKDOBJ: TSmallintField
      DisplayLabel = #1054#1073
      FieldName = 'KDOBJ'
    end
    object qryTmpKDVED: TSmallintField
      DisplayLabel = #1042#1076
      FieldName = 'KDVED'
    end
    object qryTmpKDBRIG: TSmallintField
      DisplayLabel = #1041#1088
      FieldName = 'KDBRIG'
    end
    object qryTmpKDKATP: TSmallintField
      DisplayLabel = #1050#1090
      FieldName = 'KDKATP'
    end
    object qryTmpDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095
      FieldName = 'DT_BEG'
    end
    object qryTmpDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1050#1086#1085
      FieldName = 'DT_END'
    end
    object qryTmpKDVIDN: TSmallintField
      DisplayLabel = #1042#1080#1076
      FieldName = 'KDVIDN'
    end
    object qryTmpPDN: TSmallintField
      DisplayLabel = #1055#1076#1053
      FieldName = 'PDN'
    end
    object qryTmpGODN: TSmallintField
      FieldName = 'GODN'
    end
    object qryTmpMESN: TSmallintField
      FieldName = 'MESN'
    end
    object qryTmpCHAS: TFloatField
      DisplayLabel = #1063#1072#1089'.'
      FieldName = 'CHAS'
    end
    object qryTmpSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object qryTmpSPZ: TStringField
      DisplayLabel = #1064#1055#1047
      FieldName = 'SPZ'
      Size = 10
    end
    object qryTmpKTS: TStringField
      FieldName = 'KTS'
      Size = 10
    end
    object qryTmpDTS: TStringField
      FieldName = 'DTS'
      Size = 10
    end
    object qryTmpNOTES: TStringField
      FieldName = 'NOTES'
      Size = 13
    end
    object qryTmpPRR: TSmallintField
      FieldName = 'PRR'
    end
    object qryTmpPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object qryTmpKTO: TSmallintField
      FieldName = 'KTO'
    end
    object qryTmpPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object qryTmpZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1055#1077#1088#1080#1086#1076
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm-yyyy'
    end
    object qryTmpFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 25
      Calculated = True
    end
  end
  object dsrcTmp: TDataSource
    DataSet = qryTmp
    Left = 240
    Top = 160
  end
end
