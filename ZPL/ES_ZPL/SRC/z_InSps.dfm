object FormInSps: TFormInSps
  Left = 468
  Top = 309
  BorderStyle = bsDialog
  Caption = 'FormInSps'
  ClientHeight = 90
  ClientWidth = 193
  Color = clBtnFace
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
  object Label3: TLabel
    Left = 4
    Top = 39
    Width = 60
    Height = 13
    Caption = #1074' '#1057#1087#1080#1089#1086#1082' '#8470
    FocusControl = dbeShSps
  end
  object sBtnKdSps: TSpeedButton
    Left = 99
    Top = 36
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
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
    OnClick = sBtnKdSpsClick
  end
  object LabelFamIO: TLabel
    Left = 4
    Top = 4
    Width = 123
    Height = 13
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082' '#1048#1074#1072#1085#1086#1074#1072' '#1058'.'#1058'.'
  end
  object LabelKdObj: TLabel
    Left = 4
    Top = 19
    Width = 150
    Height = 13
    Caption = #1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
  end
  object dbeKdSps: TDBEdit
    Left = 77
    Top = 36
    Width = 22
    Height = 21
    DataField = 'KdSps'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnDblClick = sBtnKdSpsClick
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeShSps: TDBEdit
    Left = 113
    Top = 36
    Width = 78
    Height = 21
    DataField = 'ShSps'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnDblClick = sBtnKdSpsClick
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnApply: TBitBtn
    Left = 36
    Top = 62
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 2
    OnClick = bBtnApplyClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bBtnCancel: TBitBtn
    Left = 116
    Top = 62
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    Kind = bkCancel
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsTmpCalcFields
    Left = 8
    Top = 32
    object cdsTmpKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsTmpShSps: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShSps'
      Size = 15
      Calculated = True
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 16
    Top = 40
  end
  object qryTmp: TQuery
    Top = 64
  end
end
