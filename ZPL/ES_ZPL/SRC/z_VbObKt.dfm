object FormVbObjKatP: TFormVbObjKatP
  Left = 1220
  Top = 237
  Width = 523
  Height = 640
  BorderIcons = [biSystemMenu]
  Caption = 'FormVbObjKatP'
  Color = clBtnFace
  Constraints.MinHeight = 485
  Constraints.MinWidth = 368
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
  object panelMain: TPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 606
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object SplitterObjKatP: TSplitter
      Left = 2
      Top = 299
      Width = 365
      Height = 9
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Color = clTeal
      ParentColor = False
    end
    object panelFilter: TPanel
      Left = 2
      Top = 2
      Width = 365
      Height = 55
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 11
        Width = 114
        Height = 13
        Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 128
        Top = 10
        Width = 89
        Height = 13
        Caption = '('#1073#1077#1079' '#1074#1099#1073#1086#1088#1072' '#1042#1057#1045')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnObj: TSpeedButton
        Left = 260
        Top = 3
        Width = 78
        Height = 23
        Hint = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnObjClick
      end
      object sBtnObjClear: TSpeedButton
        Left = 339
        Top = 3
        Width = 17
        Height = 23
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 33
        Width = 147
        Height = 13
        Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1084#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 160
        Top = 33
        Width = 89
        Height = 13
        Caption = '('#1073#1077#1079' '#1074#1099#1073#1086#1088#1072' '#1042#1057#1045')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnKatP: TSpeedButton
        Left = 260
        Top = 27
        Width = 78
        Height = 23
        Hint = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnKatPClick
      end
      object sBtnKatPClear: TSpeedButton
        Left = 339
        Top = 27
        Width = 17
        Height = 23
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object dbgrObj: TDBGrid
      Left = 2
      Top = 57
      Width = 365
      Height = 242
      Hint = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      Align = alClient
      Color = clCream
      DataSource = dsrcObj
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'KdObj'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShObj'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NmObj'
          Width = 162
          Visible = True
        end>
    end
    object dbgrKatP: TDBGrid
      Left = 2
      Top = 308
      Width = 365
      Height = 257
      Hint = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      Align = alBottom
      Color = clInfoBk
      DataSource = dsrcKatP
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
          FieldName = 'KdKatP'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShKatP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NmKatP'
          Width = 195
          Visible = True
        end>
    end
    object panelButtons: TPanel
      Left = 2
      Top = 565
      Width = 365
      Height = 39
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 3
      DesignSize = (
        365
        39)
      object bBtnOk: TBitBtn
        Left = 189
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1044#1072#1087#1077#1077
        Default = True
        ModalResult = 1
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          04000000000068010000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
          4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
          0000334A23333364A233333F38333333F383333300003366A6333342A2333333
          F383333F3383333300003334A263364AA3333333F338333F3833333300003336
          4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
          8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
          4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
          0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
          F333333383333333000033334AAA2233333333333F3333383333333300003333
          34A223333333333333F333833333333300003333334A443333333333333F3833
          33333333000033333342A63333333333333F33833333333300003333334AA633
          33333333333F3383333333330000333333666333333333333338883333333333
          0000}
        NumGlyphs = 2
      end
      object bBtnCancel1: TBitBtn
        Left = 274
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1082#1072#1079
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object cdsObj: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'ShObj'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmObj'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'AIndx'
        DataType = ftInteger
      end
      item
        Name = 'PIndx'
        DataType = ftInteger
      end
      item
        Name = 'Lvl'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'cdsObjOnKdObj'
        Fields = 'KdObj'
      end>
    IndexName = 'cdsObjOnKdObj'
    Params = <>
    StoreDefs = True
    Left = 384
    Top = 16
    object cdsObjNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsObjKdObj: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KdObj'
    end
    object cdsObjShObj: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'ShObj'
      Size = 15
    end
    object cdsObjNmObj: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      FieldName = 'NmObj'
      Size = 65
    end
    object cdsObjAIndx: TIntegerField
      FieldName = 'AIndx'
    end
    object cdsObjPIndx: TIntegerField
      FieldName = 'PIndx'
    end
    object cdsObjLvl: TIntegerField
      FieldName = 'Lvl'
    end
  end
  object dsrcObj: TDataSource
    DataSet = cdsObj
    Left = 400
    Top = 24
  end
  object cdsKatP: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'ShKatP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmKatP'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <
      item
        Name = 'cdsKatPOnKdKatP'
        Fields = 'KdKatP'
      end>
    IndexName = 'cdsKatPOnKdKatP'
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 16
    object cdsKatPNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsKatPKdKatP: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KdKatP'
    end
    object cdsKatPShKatP: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'ShKatP'
      Size = 10
    end
    object cdsKatPNmKatP: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'NmKatP'
      Size = 35
    end
  end
  object dsrcKatP: TDataSource
    DataSet = cdsKatP
    Left = 456
    Top = 24
  end
  object qryTmp: TQuery
    Left = 460
    Top = 58
  end
end
