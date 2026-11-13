object FormShowVeds: TFormShowVeds
  Left = 325
  Top = 150
  Width = 695
  Height = 538
  BorderStyle = bsSizeToolWin
  Caption = 'FormShowVeds'
  Color = clBtnFace
  Constraints.MaxWidth = 905
  Constraints.MinHeight = 475
  Constraints.MinWidth = 695
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
    Left = 279
    Top = 32
    Height = 479
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 687
    Height = 32
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      687
      32)
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 3
      Width = 75
      Height = 25
    end
    object sBtnPrt: TSpeedButton
      Left = 83
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = sBtnPrtClick
    end
    object bBtnClose: TBitBtn
      Left = 608
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
  end
  object dbgrLst: TDBGrid
    Left = 0
    Top = 32
    Width = 279
    Height = 479
    Align = alLeft
    DataSource = dsrcLst
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        FieldName = 'DtProc'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VedNr'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TypeVed'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VedDate'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmKss'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmBnk'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmOther'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notes'
        Visible = True
      end>
  end
  object dbgrVed: TDBGrid
    Left = 282
    Top = 32
    Width = 405
    Height = 479
    Align = alClient
    DataSource = dsrcVed
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrVedDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'KdObj'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidN'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShSpZ'
        Width = 50
        Visible = True
      end>
  end
  object LbxF8: TListBox
    Left = 32
    Top = 256
    Width = 121
    Height = 177
    BorderStyle = bsNone
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select v.dtProc, v.VedNR, v.VedDate, -Sum(nu.Summa) as SumVed'
      'from z_VedNR v, z_nu nu'
      'where (v.typeved containing ("vd_")) and'
      '      (nu.DtProc = v.DtProc) and'
      '      (nu.Spec_NR = v.VedNR)'
      'group by v.dtProc, v.VedNR, v.VedDate')
    Left = 168
    Top = 96
  end
  object cdsLst: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'VedNr'
        DataType = ftInteger
      end
      item
        Name = 'TypeVed'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'VedDate'
        DataType = ftDate
      end
      item
        Name = 'SmKss'
        DataType = ftFloat
      end
      item
        Name = 'SmBnk'
        DataType = ftFloat
      end
      item
        Name = 'SmOther'
        DataType = ftFloat
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsLstAfterScroll
    Left = 72
    Top = 176
    object cdsLstNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsLstDtProc: TDateField
      DisplayLabel = #1052#1077#1089#1103#1094
      FieldName = 'DtProc'
      DisplayFormat = 'mm-yy'
    end
    object cdsLstVedNr: TIntegerField
      DisplayLabel = #1053#1088#1042#1077#1076
      FieldName = 'VedNr'
    end
    object cdsLstTypeVed: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TypeVed'
      Size = 12
    end
    object cdsLstVedDate: TDateField
      DisplayLabel = #1044#1090#1042#1077#1076#1086#1084
      FieldName = 'VedDate'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsLstSmKss: TFloatField
      DisplayLabel = #1057#1084#1042#1050#1072#1089#1089#1091
      FieldName = 'SmKss'
      DisplayFormat = '#.00'
    end
    object cdsLstSmBnk: TFloatField
      DisplayLabel = #1057#1084#1042#1041#1072#1085#1082
      FieldName = 'SmBnk'
      DisplayFormat = '#.00'
    end
    object cdsLstSmOther: TFloatField
      DisplayLabel = #1057#1084#1055#1088#1086#1095
      FieldName = 'SmOther'
      DisplayFormat = '#.00'
    end
    object cdsLstNotes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095
      FieldName = 'Notes'
    end
  end
  object cdsVed: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'kdKatP'
        DataType = ftInteger
      end
      item
        Name = 'NrInVidN'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsVedCalcFields
    Left = 368
    Top = 168
    object cdsVedKdSps: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      DisplayWidth = 9
      FieldName = 'KdSps'
    end
    object cdsVedTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 9
      FieldName = 'TabN'
    end
    object cdsVedFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 16
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsVedVidN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      DisplayWidth = 6
      FieldName = 'VidN'
      Size = 3
    end
    object cdsVedSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 11
      FieldName = 'Summa'
      DisplayFormat = '#.00'
    end
    object cdsVedKdSpZ: TSmallintField
      DisplayWidth = 11
      FieldName = 'KdSpZ'
    end
    object cdsVedKdObj: TIntegerField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      DisplayWidth = 11
      FieldName = 'KdObj'
    end
    object cdsVedkdKatP: TIntegerField
      DisplayWidth = 15
      FieldName = 'kdKatP'
    end
    object cdsVedNrInVidN: TIntegerField
      FieldName = 'NrInVidN'
    end
    object cdsVedShSpZ: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'ShSpZ'
      Size = 10
      Calculated = True
    end
  end
  object dsrcVed: TDataSource
    DataSet = cdsVed
    Left = 384
    Top = 184
  end
  object dsrcLst: TDataSource
    DataSet = cdsLst
    Left = 88
    Top = 184
  end
  object qryVed: TQuery
    Left = 352
    Top = 120
  end
end
