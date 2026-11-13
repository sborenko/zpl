object FormQuickUpi: TFormQuickUpi
  Left = 447
  Top = 204
  Width = 514
  Height = 475
  BorderIcons = [biSystemMenu]
  Caption = 'FormQuickUpi'
  Color = clBtnFace
  Constraints.MinHeight = 475
  Constraints.MinWidth = 514
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
  object dbgrUpi: TDBGrid
    Left = 0
    Top = 0
    Width = 498
    Height = 403
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcUPI
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrUpiDblClick
    OnKeyDown = dbgrUpiKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOB'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POL'
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 403
    Width = 498
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      498
      33)
    object Label1: TLabel
      Left = 9
      Top = 10
      Width = 78
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086':'
    end
    object sBtnPoisk: TSpeedButton
      Left = 292
      Top = 4
      Width = 53
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1055#1086#1080#1089#1082
      OnClick = sBtnPoiskClick
    end
    object rBtnFIO: TRadioButton
      Left = 98
      Top = 8
      Width = 91
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = #1060'.'#1048'.'#1054'.'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rBtnFioClick
    end
    object rBtnTabN: TRadioButton
      Left = 159
      Top = 8
      Width = 65
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = #1058#1072#1073'. '#8470
      TabOrder = 1
      OnClick = rBtnTabNClick
    end
    object rBtnTin: TRadioButton
      Left = 225
      Top = 8
      Width = 50
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = #1048#1053#1053
      TabOrder = 2
      OnClick = rBtnTinClick
    end
    object bBtnOk: TBitBtn
      Left = 354
      Top = 4
      Width = 68
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 3
      Kind = bkOK
      Spacing = 0
    end
    object bBtnCancel: TBitBtn
      Left = 431
      Top = 4
      Width = 67
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 4
      Kind = bkCancel
    end
  end
  object qryUpi: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Upi'
      'order by Fam, Ima, Otch')
    Left = 120
    Top = 128
  end
  object cdsUPI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUPI'
    OnCalcFields = cdsUPICalcFields
    Left = 168
    Top = 128
    object cdsUPINR: TIntegerField
      FieldName = 'NR'
    end
    object cdsUPITABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsUPIID: TStringField
      DisplayLabel = #1058#1048#1053
      FieldName = 'ID'
      Size = 10
    end
    object cdsUPIFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object cdsUPIIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object cdsUPIOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
    object cdsUPIDOB: TDateTimeField
      DisplayLabel = #1044#1090#1056#1086#1078#1076
      FieldName = 'DOB'
    end
    object cdsUPIPOL: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'POL'
      Size = 1
    end
    object cdsUPIPRUV: TSmallintField
      FieldName = 'PRUV'
    end
    object cdsUPIOBJFROM: TSmallintField
      FieldName = 'OBJFROM'
    end
    object cdsUPIOLDTABN: TIntegerField
      FieldName = 'OLDTABN'
    end
    object cdsUPIFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dsrcUPI: TDataSource
    DataSet = cdsUPI
    Left = 184
    Top = 144
  end
  object dspUPI: TDataSetProvider
    DataSet = qryUpi
    Left = 136
    Top = 144
  end
  object qryTmp: TQuery
    Left = 272
    Top = 168
  end
end
