object FormGtKli2: TFormGtKli2
  Left = 420
  Top = 261
  BorderStyle = bsDialog
  Caption = 'FormGtKli2'
  ClientHeight = 151
  ClientWidth = 303
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
  object Label1: TLabel
    Left = 92
    Top = 7
    Width = 75
    Height = 13
    Caption = #1054#1050#1055#1054' '#1082#1083#1080#1077#1085#1090#1072
    FocusControl = dbeOkpo
  end
  object Label2: TLabel
    Left = 4
    Top = 28
    Width = 94
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1072
    FocusControl = dbeNmKli
  end
  object Label3: TLabel
    Left = 103
    Top = 28
    Width = 158
    Height = 13
    Caption = '('#1084#1086#1078#1085#1086' '#1083#1102#1073#1091#1102' '#1095#1072#1089#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 3
    Top = 93
    Width = 146
    Height = 13
    Caption = #1055#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' '#1082#1085#1086#1087#1082#1080' "'#1042#1074#1086#1076'":'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 3
    Top = 107
    Width = 297
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1055#1086#1080#1089#1082' '#1074#1077#1076#1077#1090#1089#1103' '#1087#1086' '#1087#1077#1088#1074#1086#1084#1091' '#1053#1077#1055#1091#1089#1090#1086#1084#1091' '#1087#1086#1083#1102'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label6: TLabel
    Left = 3
    Top = 67
    Width = 297
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1055#1088#1080' '#1076#1074#1086#1081#1085#1086#1084' '#1097#1077#1083#1095#1082#1077' '#1084#1099#1096#1082#1086#1081' '#1085#1072' '#1054#1050#1055#1054' '#1080#1083#1080' '#1085#1072#1079#1074#1072#1085#1080#1080' '#1082#1083#1080#1077#1085#1090#1072' '#1087#1086#1080#1089#1082' '#1074#1077#1076 +
      #1077#1090#1089#1103' '#1087#1086' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1077#1084#1091' '#1087#1086#1083#1102'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object dbeOkpo: TDBEdit
    Left = 180
    Top = 4
    Width = 120
    Height = 21
    Hint = #1054#1050#1055#1054' '#1080#1097#1077#1090#1089#1103' '#1087#1086' '#1090#1086#1095#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102
    DataField = 'OKPO'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = dbeOkpoDblClick
    OnEnter = dbeOkpoEnter
    OnExit = dbeOkpoExit
  end
  object dbeNmKli: TDBEdit
    Left = 3
    Top = 44
    Width = 297
    Height = 21
    Hint = #1053#1072#1079#1072#1085#1080#1077' '#1080#1097#1077#1090#1089#1103' "'#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080'"'
    DataField = 'NmKli'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnDblClick = dbeNmKliDblClick
    OnEnter = dbeOkpoEnter
    OnExit = dbeOkpoExit
  end
  object bBtnOk: TBitBtn
    Left = 116
    Top = 123
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    Default = True
    TabOrder = 2
    OnClick = bBtnOkClick
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
    Left = 225
    Top = 123
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
        Name = 'NmKli'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'OKPO'
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    object cdsTmpNmKli: TStringField
      FieldName = 'NmKli'
      Size = 65
    end
    object cdsTmpOKPO: TStringField
      FieldName = 'OKPO'
      Size = 25
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 16
  end
  object cdsKli: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdKli'
        DataType = ftSmallint
      end
      item
        Name = 'OKPO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NmWho'
        DataType = ftString
        Size = 65
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 120
    Data = {
      910000009619E0BD0100000018000000040000000000030000009100024E5204
      0001000200010007535542545950450200490008004175746F696E6300054B64
      4B6C690200010000000000044F4B504F01004900000001000557494454480200
      02001900054E6D57686F01004900000001000557494454480200020041000100
      0C4155544F494E4356414C55450400010001000000}
    object cdsKliNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsKliKdKli: TSmallintField
      FieldName = 'KdKli'
    end
    object cdsKliOKPO: TStringField
      FieldName = 'OKPO'
      Size = 25
    end
    object cdsKliNmWho: TStringField
      FieldName = 'NmWho'
      Size = 65
    end
  end
end
