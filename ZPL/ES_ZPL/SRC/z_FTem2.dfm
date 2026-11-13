object FormFTem2: TFormFTem2
  Left = 362
  Top = 298
  Width = 532
  Height = 465
  BorderIcons = [biSystemMenu]
  Caption = 'FormFTem2'
  Color = clBtnFace
  Constraints.MinHeight = 465
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
    Top = 181
    Width = 524
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      524
      31)
    object LabelMsg: TLabel
      Left = 1
      Top = 1
      Width = 336
      Height = 29
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelMsg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object bBtnOk: TBitBtn
      Left = 376
      Top = 3
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      OnClick = bBtnOkClick
      Kind = bkOK
      Spacing = 0
    end
    object BitBtn2: TBitBtn
      Left = 452
      Top = 3
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrGrp: TDBGrid
    Left = 0
    Top = 31
    Width = 524
    Height = 150
    Align = alTop
    Constraints.MinHeight = 150
    DataSource = dsrcGrp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrGrpDrawColumnCell
    OnEnter = dbgrGrpEnter
    OnExit = dbgrGrpExit
  end
  object dbgrPgr: TDBGrid
    Left = 0
    Top = 184
    Width = 524
    Height = 254
    Align = alClient
    Constraints.MinHeight = 250
    DataSource = dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrPgrDblClick
    OnEnter = dbgrGrpEnter
    OnExit = dbgrGrpExit
    Columns = <
      item
        Expanded = False
        FieldName = 'Grp'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NmGrp'
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdTemuGrp'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pgr'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NmPgr'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdTemuPgr'
        Visible = True
      end>
  end
  object qryTmp: TQuery
    Left = 40
    Top = 80
  end
  object cdsGrp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Grp'
        DataType = ftSmallint
      end
      item
        Name = 'NmGrp'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'KdTemuGrp'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 96
    Top = 64
    Data = {
      520000009619E0BD010000001800000003000000000003000000520003477270
      0200010000000000054E6D477270010049000000010005574944544802000200
      2300094B6454656D7547727002000100000000000000}
    object cdsGrpGrp: TSmallintField
      FieldName = 'Grp'
    end
    object cdsGrpNmGrp: TStringField
      FieldName = 'NmGrp'
      Size = 35
    end
    object cdsGrpKdTemuGrp: TSmallintField
      FieldName = 'KdTemuGrp'
    end
  end
  object cdsPgr: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Grp'
        DataType = ftSmallint
      end
      item
        Name = 'NmGrp'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'KdTemuGrp'
        DataType = ftSmallint
      end
      item
        Name = 'Pgr'
        DataType = ftSmallint
      end
      item
        Name = 'NmPgr'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'KdTemuPgr'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    IndexFieldNames = 'Grp'
    MasterFields = 'Grp'
    MasterSource = dsrcGrp
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 184
    Data = {
      8A0000009619E0BD0100000018000000060000000000030000008A0003477270
      0200010000000000054E6D477270010049000000010005574944544802000200
      2300094B6454656D754772700200010000000000035067720200010000000000
      054E6D5067720100490000000100055749445448020002002300094B6454656D
      7550677202000100000000000000}
    object cdsPgrGrp: TSmallintField
      FieldName = 'Grp'
    end
    object cdsPgrNmGrp: TStringField
      FieldName = 'NmGrp'
      Size = 35
    end
    object cdsPgrKdTemuGrp: TSmallintField
      FieldName = 'KdTemuGrp'
    end
    object cdsPgrPgr: TSmallintField
      FieldName = 'Pgr'
    end
    object cdsPgrNmPgr: TStringField
      FieldName = 'NmPgr'
      Size = 35
    end
    object cdsPgrKdTemuPgr: TSmallintField
      FieldName = 'KdTemuPgr'
    end
  end
  object dsrcGrp: TDataSource
    DataSet = cdsGrp
    Left = 104
    Top = 80
  end
  object dsrcPgr: TDataSource
    DataSet = cdsPgr
    Left = 112
    Top = 208
  end
end
