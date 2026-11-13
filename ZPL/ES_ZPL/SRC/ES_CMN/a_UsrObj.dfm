object FormUsrObj: TFormUsrObj
  Left = 309
  Top = 203
  Width = 577
  Height = 487
  ActiveControl = TvObj
  BorderIcons = [biSystemMenu]
  Caption = 'FormUsrObj'
  Color = clBtnFace
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 680
  Constraints.MinHeight = 355
  Constraints.MinWidth = 545
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    569
    460)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 252
    Top = 31
    Height = 429
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      569
      31)
    object Label1: TLabel
      Left = 6
      Top = 2
      Width = 283
      Height = 26
      AutoSize = False
      Caption = 
        #1050#1083#1072#1074#1080#1096#1077#1081' <F8> '#1080#1083#1080' '#1082#1085#1086#1087#1082#1086#1081' "F8" '#1074#1099#1073#1077#1088#1080#1090#1077' '#1074' '#1087#1088#1072#1074#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1087#1086#1076#1088#1072#1079#1076 +
        #1077#1083#1077#1085#1080#1103', '#1076#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102'.'
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
      Top = 1
      Width = 22
      Height = 17
      Caption = 'F8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Spacing = 0
      OnClick = sBtnF8Click
    end
    object bBtnClose: TBitBtn
      Left = 491
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkClose
    end
  end
  object dbgrUsrObj: TDBGrid
    Left = 255
    Top = 31
    Width = 314
    Height = 429
    Align = alClient
    DataSource = dsrcUsrObj
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrUsrObjDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHOBJ'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMOBJ'
        Width = 131
        Visible = True
      end>
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 31
    Width = 252
    Height = 429
    Align = alLeft
    Caption = 'PanelLeft'
    Constraints.MinWidth = 200
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 1
      Top = 305
      Width = 250
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Color = clTeal
      ParentColor = False
      Visible = False
    end
    object TvObj: TTreeView
      Left = 1
      Top = 1
      Width = 250
      Height = 304
      Align = alClient
      Indent = 19
      RightClickSelect = True
      TabOrder = 0
      OnChange = TvObjChange
      OnCustomDrawItem = TvObjCustomDrawItem
      Items.Data = {
        030000002C0000000000000000000000FFFFFFFFFFFFFFFF0000000001000000
        133130303020C1DEC4C6C5D22020C1DEC4C6C5D24A0000000000000000000000
        FFFFFFFFFFFFFFFF0000000000000000313134303320CAE0F420D2C749CAD220
        20CAE0F42EF3EBE5EAF2F02EE7E0F1EEE169E220692069EDF42DEAEEEC20F2E5
        F5ED300000000000000000000000FFFFFFFFFFFFFFFF00000000020000001733
        30303020D1CFC5D62020D1CFC5D6D1D0C5C4D1D2C2C038000000000000000000
        0000FFFFFFFFFFFFFFFF00000000000000001F3339323820D3CAD620C8C4CF20
        20D3CAD620EFF0E820C8C4CF202831303429400000000000000000000000FFFF
        FFFFFFFFFFFF0000000000000000273339333120CACDD620CFCA2020CACDD620
        22CFEEEBE8F2E5F5CAEEEDF1E0EBF22220283130342939000000000000000000
        0000FFFFFFFFFFFFFFFF0000000000000000203430303020CDC8D72020CDE0F3
        F7EDEE2DE8F1F1EBE5E4EEE2E0F2E5F1EAE0FF}
    end
    object dbgrObj: TDBGrid
      Left = 1
      Top = 308
      Width = 250
      Height = 120
      Align = alBottom
      Color = clBtnFace
      Constraints.MinHeight = 120
      DataSource = dsrcObj
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMOBJ'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AINDX'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PINDX'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LVL'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INDX'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HSCH'
          Width = 14
          Visible = True
        end>
    end
  end
  object LbxF8: TListBox
    Left = 473
    Top = 220
    Width = 57
    Height = 231
    Anchors = [akTop, akRight, akBottom]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object qryObj: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KdObj  order by AIndx, Lvl, PIndx')
    Left = 64
    Top = 256
  end
  object dsrcObj: TDataSource
    DataSet = qryObj
    Left = 80
    Top = 280
  end
  object qryUsrObj: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.*, o.ShObj, o.NmObj, o.AIndx, o.HsCh'
      ' from z_Usr_Obj u'
      '         Left Outer Join z_KdObj o on o.KdObj = u.KdObj'
      'order by o.AIndx')
    UpdateObject = updUsrObj
    Left = 272
    Top = 144
    object qryUsrObjNR: TIntegerField
      FieldName = 'NR'
    end
    object qryUsrObjKDUSR: TSmallintField
      FieldName = 'KDUSR'
    end
    object qryUsrObjKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryUsrObjSHOBJ: TStringField
      DisplayLabel = #1064#1092#1088#1055#1076#1088
      FieldName = 'SHOBJ'
      Size = 15
    end
    object qryUsrObjNMOBJ: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      FieldName = 'NMOBJ'
      Size = 65
    end
    object qryUsrObjAINDX: TSmallintField
      FieldName = 'AINDX'
    end
    object qryUsrObjHSCH: TStringField
      FieldName = 'HSCH'
      FixedChar = True
      Size = 1
    end
  end
  object updUsrObj: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Usr_Obj'
      'set'
      '  KDUSR = :KDUSR,'
      '  KDOBJ = :KDOBJ'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Usr_Obj'
      '  (KDUSR, KDOBJ)'
      'values'
      '  (:KDUSR, :KDOBJ)')
    DeleteSQL.Strings = (
      'delete from z_Usr_Obj'
      'where'
      '  NR = :OLD_NR')
    Left = 368
    Top = 144
  end
  object cdsUsrObj: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'KDUSR'
        DataType = ftSmallint
      end
      item
        Name = 'KDOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'SHOBJ'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NMOBJ'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'AINDX'
        DataType = ftSmallint
      end
      item
        Name = 'HSCH'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'OnAIndx'
        Fields = 'AIndx'
      end>
    IndexName = 'OnAIndx'
    Params = <>
    ProviderName = 'dspUsrObj'
    StoreDefs = True
    Left = 280
    Top = 184
  end
  object dsrcUsrObj: TDataSource
    DataSet = cdsUsrObj
    Left = 296
    Top = 200
  end
  object dspUsrObj: TDataSetProvider
    DataSet = qryUsrObj
    Left = 304
    Top = 144
  end
end
