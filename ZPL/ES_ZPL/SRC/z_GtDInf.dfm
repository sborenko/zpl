object FormGetDopInf: TFormGetDopInf
  Left = 426
  Top = 260
  BorderStyle = bsDialog
  Caption = 'FormGetDopInf'
  ClientHeight = 97
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    258
    97)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelFamIO: TLabel
    Left = 199
    Top = 6
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'LabelFamIO'
  end
  object LabelTabN: TLabel
    Left = 4
    Top = 6
    Width = 53
    Height = 13
    Caption = 'LabelTabN'
  end
  object Label1: TLabel
    Left = 4
    Top = 26
    Width = 80
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    FocusControl = dbeKdObj
  end
  object Label2: TLabel
    Left = 4
    Top = 49
    Width = 83
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089'.'
    FocusControl = dbeKdKatP
  end
  object sBtnObj: TSpeedButton
    Left = 241
    Top = 23
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000E0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7700700000778888870077777777777777007770777777877700770007777888
      7700700000778888870000000008887888007700077778787700770007777888
      770077000777788877007777777777777700}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnObjClick
  end
  object sBtnKatP: TSpeedButton
    Left = 241
    Top = 46
    Width = 15
    Height = 20
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000E0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7700700000778888870077777777777777007770777777877700770007777888
      7700700000778888870000000008887888007700077778787700770007777888
      770077000777788877007777777777777700}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnKatPClick
  end
  object bBtnOk: TBitBtn
    Left = 90
    Top = 70
    Width = 75
    Height = 25
    Hint = #1042#1074#1086#1076
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 181
    Top = 70
    Width = 75
    Height = 25
    Hint = #1054#1090#1082#1072#1079
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Kind = bkCancel
  end
  object dbeShObj: TDBEdit
    Left = 120
    Top = 23
    Width = 121
    Height = 21
    Hint = #1064#1080#1092#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    DataField = 'ShObj'
    DataSource = dsrcTmp
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeShKatP: TDBEdit
    Left = 120
    Top = 46
    Width = 121
    Height = 21
    Hint = #1064#1080#1092#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
    DataField = 'ShKatP'
    DataSource = dsrcTmp
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeKdObj: TDBEdit
    Left = 89
    Top = 23
    Width = 32
    Height = 21
    Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    DataField = 'KdObj'
    DataSource = dsrcTmp
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeKdKatP: TDBEdit
    Left = 89
    Top = 46
    Width = 32
    Height = 21
    Hint = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
    DataField = 'KdKatP'
    DataSource = dsrcTmp
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'ShObj'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ShKatP'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 64
    object cdsTmpKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsTmpKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsTmpShObj: TStringField
      FieldName = 'ShObj'
    end
    object cdsTmpShKatP: TStringField
      FieldName = 'ShKatP'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 48
    Top = 64
  end
end
