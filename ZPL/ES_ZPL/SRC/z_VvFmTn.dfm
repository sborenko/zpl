object FormVvFmTn: TFormVvFmTn
  Left = 541
  Top = 397
  BorderStyle = bsDialog
  Caption = 'FormVvFmTn'
  ClientHeight = 217
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = -1
    Width = 94
    Height = 29
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1048#1089#1082#1086#1084#1099#1081' '#1090#1072#1073#1077#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
    WordWrap = True
  end
  object Label2: TLabel
    Left = 21
    Top = 45
    Width = 49
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object Label3: TLabel
    Left = 18
    Top = 135
    Width = 77
    Height = 13
    Hint = #1048#1097#1077#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102
    Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1048#1044
    ParentShowHint = False
    ShowHint = True
  end
  object bBtnOkTabN: TBitBtn
    Left = 247
    Top = 3
    Width = 80
    Height = 25
    Hint = #1042#1074#1086#1076' '#1058#1072#1073'.'#1085#1086#1084#1077#1088#1072
    Caption = #1042#1074#1086#1076#1058#1072#1073#1053
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = DBComboBoxTabNDblClick
    OnEnter = bBtnEnter
    OnExit = bBtnExit
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
    Spacing = 0
  end
  object bBtnCancel: TBitBtn
    Left = 247
    Top = 177
    Width = 80
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    OnEnter = bBtnEnter
    OnExit = bBtnExit
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 63
    Width = 208
    Height = 67
    Caption = ' '#1057#1087#1086#1089#1086#1073' '#1087#1086#1080#1089#1082#1072' '#1092#1072#1084#1080#1083#1080#1080': '
    TabOrder = 9
    object rBtnCase0: TRadioButton
      Left = 10
      Top = 15
      Width = 188
      Height = 17
      Caption = '- '#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1090#1077' '
      TabOrder = 0
    end
    object rBtnCase1: TRadioButton
      Left = 10
      Top = 31
      Width = 188
      Height = 17
      Caption = '- '#1087#1086' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102' '#1086#1090' '#1085#1072#1095#1072#1083#1072
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rBtnCase2: TRadioButton
      Left = 10
      Top = 47
      Width = 188
      Height = 17
      Caption = '- '#1087#1086' '#1087#1086#1083#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102
      TabOrder = 2
    end
  end
  object DBComboBoxTabN: TDBComboBox
    Left = 136
    Top = 4
    Width = 78
    Height = 21
    Hint = #1042#1074#1086#1076' '#1058#1072#1073'.'#1085#1086#1084#1077#1088#1072
    DataField = 'TabN'
    DataSource = dsrcVv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = DBComboBoxTabNDblClick
    OnEnter = DBComboBoxEnter
    OnExit = DBComboBoxExit
    OnKeyUp = DBComboBoxTabNKeyUp
  end
  object LbxSvTabN: TListBox
    Left = 168
    Top = 71
    Width = 25
    Height = 25
    TabStop = False
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 10
    Visible = False
  end
  object DBComboBoxFam: TDBComboBox
    Left = 80
    Top = 42
    Width = 134
    Height = 21
    Hint = #1042#1074#1086#1076' '#1092#1072#1084#1080#1083#1080#1080
    DataField = 'Fam'
    DataSource = dsrcVv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnDblClick = DBComboBoxFamDblClick
    OnEnter = DBComboBoxEnter
    OnExit = DBComboBoxExit
    OnKeyUp = DBComboBoxFamKeyUp
  end
  object LbxSvFam: TListBox
    Left = 176
    Top = 79
    Width = 25
    Height = 25
    TabStop = False
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 11
    Visible = False
  end
  object DBComboBoxID: TDBComboBox
    Left = 104
    Top = 132
    Width = 110
    Height = 21
    Hint = #1042#1074#1086#1076' '#1048#1044
    DataField = 'ID'
    DataSource = dsrcVv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnDblClick = DBComboBoxIDDblClick
    OnEnter = DBComboBoxEnter
    OnExit = DBComboBoxExit
  end
  object LbxSvID: TListBox
    Left = 184
    Top = 87
    Width = 25
    Height = 25
    TabStop = False
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 12
    Visible = False
  end
  object rBtnTabN: TRadioButton
    Left = 224
    Top = 6
    Width = 17
    Height = 17
    Caption = 'rBtnTabN'
    Checked = True
    TabOrder = 7
    TabStop = True
  end
  object rBtnFam: TRadioButton
    Left = 224
    Top = 44
    Width = 17
    Height = 17
    Caption = 'rBtnFam'
    TabOrder = 8
  end
  object rBtnInn: TRadioButton
    Left = 224
    Top = 134
    Width = 17
    Height = 17
    Caption = 'rBtnInn'
    TabOrder = 13
  end
  object bBtnOkFam: TBitBtn
    Left = 247
    Top = 41
    Width = 80
    Height = 25
    Hint = #1042#1074#1086#1076' '#1092#1072#1084#1080#1083#1080#1080
    Caption = #1042#1074#1086#1076#1060#1072#1084
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = DBComboBoxFamDblClick
    OnEnter = bBtnEnter
    OnExit = bBtnExit
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
    Spacing = 0
  end
  object bBtnOkID: TBitBtn
    Left = 247
    Top = 129
    Width = 80
    Height = 25
    Hint = #1042#1074#1086#1076' '#1048#1044
    Caption = #1042#1074#1086#1076' '#1048#1044
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = DBComboBoxIDDblClick
    OnEnter = bBtnEnter
    OnExit = bBtnExit
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
    Spacing = 0
  end
  object cdsVv: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'OnNrDesc'
        DescFields = 'NR'
        Fields = 'NR'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 19
    Top = 158
    object cdsVvTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsVvFam: TStringField
      FieldName = 'Fam'
      Size = 25
    end
    object cdsVvID: TStringField
      FieldName = 'ID'
      Size = 10
    end
  end
  object dsrcVv: TDataSource
    DataSet = cdsVv
    Left = 48
    Top = 158
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.TabN, u.Fam, u.Ima, u.Otch, u.Id, s.KdSps, s.KdObj,'
      ' s.KdKatP'
      ' from Z_Upi u '
      ' Left Outer Join Z_Sps s on (s.TabN  = u.TabN) and '
      '                     (s.dtProc = '#39'02/01/2019'#39')  '
      ' where upper(u.Fam) starting with '#39#1041#1051#1040#1046#39
      ' order by u.Fam, u.Ima, u.Otch')
    Left = 5
    Top = 2
  end
end
