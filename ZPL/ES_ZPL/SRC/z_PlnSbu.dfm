object FormTreeView: TFormTreeView
  Left = 358
  Top = 93
  Width = 532
  Height = 516
  BorderIcons = [biSystemMenu]
  Caption = 'FormTreeView'
  Color = 11072747
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
  object SplitterSbu: TSplitter
    Left = 0
    Top = 430
    Width = 524
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clTeal
    ParentColor = False
    Visible = False
  end
  object TV: TTreeView
    Left = 0
    Top = 31
    Width = 524
    Height = 399
    Align = alClient
    Color = 13565421
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Indent = 19
    ParentFont = False
    TabOrder = 0
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
    Font.Height = 8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      524
      31)
    object SpeedButton1: TSpeedButton
      Left = 6
      Top = 3
      Width = 90
      Height = 25
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1092#1072#1081#1083#1072
      Caption = 'LoadFromTxt'
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 203
      Top = 3
      Width = 81
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1075#1072#1073#1083#1080#1094#1091' Paradox'
      Caption = 'SaveToTable'
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton2Click
    end
    object sBtnCreObj: TSpeedButton
      Left = 107
      Top = 3
      Width = 81
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1075#1072#1073#1083#1080#1094#1091' Paradox'
      Caption = 'SaveToTable'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnCreObjClick
    end
    object BitBtn1: TBitBtn
      Left = 443
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrSBU: TDBGrid
    Left = 0
    Top = 433
    Width = 524
    Height = 56
    Align = alBottom
    Color = clBtnFace
    DataSource = dsrcSvSch
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'KdSch'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SchBU'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSch'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSCH'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AINDX'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PINDX'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LVL'
        Width = 13
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INDX'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HSCH'
        Width = 15
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOPPRIZN'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDSCHET'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_GORD'
        Width = 42
        Visible = True
      end>
  end
  object cdsSvSch: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdSch'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 203
    Top = 116
    object cdsSvSchKdSch: TSmallintField
      FieldName = 'KdSch'
    end
    object cdsSvSchSchBU: TStringField
      FieldName = 'SchBU'
      Size = 15
    end
    object cdsSvSchPSch: TStringField
      FieldName = 'PSch'
      Size = 15
    end
  end
  object dsrcSvSch: TDataSource
    DataSet = cdsSvSch
    Left = 224
    Top = 144
  end
  object qryTmp: TQuery
    Left = 216
    Top = 128
  end
end
