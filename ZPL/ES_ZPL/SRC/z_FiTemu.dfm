object FormFiTemu: TFormFiTemu
  Left = 458
  Top = 301
  BorderStyle = bsDialog
  Caption = 'FormFiTemu'
  ClientHeight = 115
  ClientWidth = 383
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
    Left = 7
    Top = 19
    Width = 109
    Height = 13
    Caption = #1050#1086#1076' '#1090#1077#1084#1099' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
    FocusControl = dbeKdTemu
  end
  object Label2: TLabel
    Left = 7
    Top = 51
    Width = 80
    Height = 13
    Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
    FocusControl = DBEdit1
  end
  object dbeKdTemu: TDBEdit
    Left = 152
    Top = 78
    Width = 73
    Height = 24
    TabStop = False
    DataField = 'KdTemu'
    DataSource = dsrcFT
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnEnter = dbeNmTemuEnter
    OnExit = dbeNmTemuExit
  end
  object bBtnOkByKdTemu: TBitBtn
    Left = 268
    Top = 15
    Width = 110
    Height = 26
    Caption = #1048#1089#1082#1072#1090#1100' '#1087#1086' '#1082#1086#1076#1091
    ModalResult = 1
    TabOrder = 1
    OnClick = bBtnOkByKdTemuClick
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
    Spacing = 0
  end
  object bBtnCancel: TBitBtn
    Left = 268
    Top = 84
    Width = 110
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 83
    Top = 78
    Width = 65
    Height = 24
    Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080
    TabStop = False
    DataField = 'NmSch'
    DataSource = dsrcFT
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Visible = False
    OnEnter = dbeNmTemuEnter
    OnExit = dbeNmTemuExit
  end
  object bBtnOkByNmTemu: TBitBtn
    Left = 268
    Top = 47
    Width = 110
    Height = 26
    Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080
    Caption = #1055#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = bBtnOkByNmTemuClick
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
  object DBComboKdTemu: TDBComboBox
    Left = 187
    Top = 15
    Width = 78
    Height = 24
    DataField = 'KdTemu'
    DataSource = dsrcFT
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnEnter = DBComboKdTemuEnter
    OnExit = DBComboKdTemuExit
  end
  object DBComboNmTemu: TDBComboBox
    Left = 145
    Top = 47
    Width = 120
    Height = 24
    Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080
    DataField = 'NmSch'
    DataSource = dsrcFT
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
    OnEnter = DBComboKdTemuEnter
    OnExit = DBComboKdTemuExit
  end
  object LbxSvKdTemu: TListBox
    Left = 123
    Top = 9
    Width = 25
    Height = 25
    TabStop = False
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object LbxSvNmTemu: TListBox
    Left = 131
    Top = 17
    Width = 25
    Height = 25
    TabStop = False
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 8
    Visible = False
  end
  object cdsFT: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'NmSch'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 27
    Top = 79
    Data = {
      430000009619E0BD0100000018000000020000000000030000004300064B6454
      656D750200010000000000054E6D536368010049000000010005574944544802
      00020014000000}
    object cdsFTKdTemu: TSmallintField
      FieldName = 'KdTemu'
    end
    object cdsFTNmSch: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
      FieldName = 'NmSch'
    end
  end
  object dsrcFT: TDataSource
    DataSet = cdsFT
    Left = 51
    Top = 79
  end
  object qryFi: TQuery
    Left = 105
    Top = 48
  end
end
