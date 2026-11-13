object FormVubMes: TFormVubMes
  Left = 376
  Top = 365
  Width = 175
  Height = 285
  ActiveControl = dbgrNU
  BorderIcons = [biSystemMenu]
  Caption = 'FormVubMes'
  Color = clBtnFace
  Constraints.MaxWidth = 175
  Constraints.MinHeight = 285
  Constraints.MinWidth = 175
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    167
    258)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrNU: TDBGrid
    Left = 2
    Top = 0
    Width = 163
    Height = 229
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RusMes'
        Width = 128
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 22
    Top = 232
    Width = 71
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
    Spacing = 2
  end
  object bBtnCancel: TBitBtn
    Left = 95
    Top = 232
    Width = 71
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
    Spacing = 2
  end
  object qryNU: TQuery
    OnCalcFields = qryNUCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct DtProc '
      'from Z_NU'
      'where (DtProc <> :d_RDate)'
      '')
    Left = 64
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'd_RDate'
        ParamType = ptUnknown
      end>
    object qryNUDTPROC: TDateTimeField
      DisplayWidth = 12
      FieldName = 'DTPROC'
      DisplayFormat = 'mm-yyyy'
    end
    object qryNURusMes: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094'('#1099') '#1082' '#1087#1077#1088#1077#1089#1095#1077#1090#1091
      FieldKind = fkCalculated
      FieldName = 'RusMes'
      Calculated = True
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 80
    Top = 64
  end
end
