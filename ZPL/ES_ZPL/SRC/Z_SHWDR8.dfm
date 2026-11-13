object FormShwDr8: TFormShwDr8
  Left = 355
  Top = 217
  Width = 604
  Height = 392
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwDr8'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 350
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
    Top = 96
    Width = 596
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clMaroon
    ParentColor = False
  end
  object dbgrTotals: TDBGrid
    Left = 0
    Top = 29
    Width = 596
    Height = 67
    Align = alTop
    DataSource = dsrcTotals
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dbgrDr8: TDBGrid
    Left = 0
    Top = 99
    Width = 596
    Height = 266
    Align = alClient
    DataSource = dsrcDr8
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NP'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIOD'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RIK'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYP'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIN'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_DOX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_TAX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_DOX'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_PRIYN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_ZVILN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_PILG'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZNAKA'
        Width = 24
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      596
      29)
    object sBtnPrt: TSpeedButton
      Left = 3
      Top = 2
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object sBtnCopy: TSpeedButton
      Left = 80
      Top = 2
      Width = 75
      Height = 25
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1072' '#1076#1080#1089#1082#1077#1090#1091
      Caption = #1044#1080#1089#1082#1077#1090#1072
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = sBtnCopyClick
    end
    object LabelCntOsn: TLabel
      Left = 164
      Top = 1
      Width = 61
      Height = 13
      Caption = 'LabelCntOsn'
    end
    object LabelCntSovm: TLabel
      Left = 163
      Top = 13
      Width = 69
      Height = 13
      Caption = 'LabelCntSovm'
    end
    object bBtnCancel: TBitBtn
      Left = 519
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qryNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Nu nu'
      '  where (nu.ZaMesGod in ('#39'06/01/2003'#39', '#39'02/01/2004'#39'))'
      'order by nu.TabN, nu.ZaMesGod, nu.KdVidN')
    Left = 87
    Top = 48
  end
  object dsrcNu: TDataSource
    DataSet = qryNu
    Left = 103
    Top = 64
  end
  object tblDr8: TTable
    Active = True
    OnCalcFields = tblDr8CalcFields
    DatabaseName = 'ES_IND'
    TableName = 'da06.dbf'
    Left = 40
    Top = 122
    object tblDr8NP: TFloatField
      FieldName = 'NP'
    end
    object tblDr8PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object tblDr8RIK: TSmallintField
      FieldName = 'RIK'
    end
    object tblDr8KOD: TStringField
      FieldName = 'KOD'
      Size = 10
    end
    object tblDr8TYP: TSmallintField
      FieldName = 'TYP'
    end
    object tblDr8TIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object tblDr8S_NAR: TFloatField
      FieldName = 'S_NAR'
    end
    object tblDr8S_DOX: TFloatField
      FieldName = 'S_DOX'
    end
    object tblDr8S_TAXN: TFloatField
      FieldName = 'S_TAXN'
    end
    object tblDr8S_TAXP: TFloatField
      FieldName = 'S_TAXP'
    end
    object tblDr8OZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object tblDr8D_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object tblDr8D_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object tblDr8OZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object tblDr8OZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object tblDr8FamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object tblDr8TabN: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TabN'
      Calculated = True
    end
  end
  object sdsTotals: TSimpleDataSet
    Aggregates = <>
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 144
    Top = 48
  end
  object dsrcTotals: TDataSource
    DataSet = sdsTotals
    Left = 160
    Top = 64
  end
  object dsrcDr8: TDataSource
    DataSet = tblDr8
    Left = 56
    Top = 138
  end
  object qryPereInf: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from GetWrkPere ( :nTabN, :dDtBeg, :dDtEnd )')
    Left = 216
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'nTabN'
        ParamType = ptUnknown
        Value = 3
      end
      item
        DataType = ftUnknown
        Name = 'dDtBeg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dDtEnd'
        ParamType = ptUnknown
      end>
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'dbf'
    Filter = #1060#1072#1081#1083#1099' dBase, FoxPro (.dbf)|*.dbf'
    InitialDir = 'd:\temp'
    Options = [ofHideReadOnly, ofNoLongNames, ofEnableSizing]
    Left = 136
    Top = 184
  end
end
