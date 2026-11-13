object Form2: TForm2
  Left = 215
  Top = 117
  Width = 756
  Height = 540
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 278
    Top = 0
    Height = 472
    Beveled = True
  end
  object dbgrTotsNU: TDBGrid
    Left = 0
    Top = 0
    Width = 278
    Height = 472
    Align = alLeft
    DataSource = dsrcTotsNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MesRus'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMNACH'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMUDRG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmNaRuki'
        Width = 56
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 472
    Width = 748
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 281
    Top = 0
    Width = 467
    Height = 472
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qryTotsNU: TQuery
    OnCalcFields = qryTotsNUCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from GETNU_TOTS_DTPROC (:TabN)')
    Left = 92
    Top = 308
    ParamData = <
      item
        DataType = ftString
        Name = 'TabN'
        ParamType = ptUnknown
        Value = 23838
      end>
    object qryTotsNUTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryTotsNUSMNACH: TFloatField
      FieldName = 'SMNACH'
      DisplayFormat = ',0.00'
    end
    object qryTotsNUSMUDRG: TFloatField
      FieldName = 'SMUDRG'
      DisplayFormat = ',0.00'
    end
    object qryTotsNUMesRus: TStringField
      FieldKind = fkCalculated
      FieldName = 'MesRus'
      Calculated = True
    end
    object qryTotsNUSmNaRuki: TFloatField
      DisplayLabel = #1050' '#1074#1099#1087#1083#1072#1090#1077
      FieldKind = fkCalculated
      FieldName = 'SmNaRuki'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryTotsNUDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
  end
  object dsrcTotsNU: TDataSource
    DataSet = qryTotsNU
    Left = 104
    Top = 328
  end
end
