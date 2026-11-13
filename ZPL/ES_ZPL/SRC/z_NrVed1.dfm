object FormNrVed: TFormNrVed
  Left = 470
  Top = 354
  BorderStyle = bsDialog
  Caption = 'FormNrVed'
  ClientHeight = 71
  ClientWidth = 246
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
  object LabelMsg: TLabel
    Left = 5
    Top = 6
    Width = 144
    Height = 32
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1076#1083#1103' '#1087#1077#1088#1074#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    FocusControl = dbeVedNR
    WordWrap = True
  end
  object sBtnBezVedNR: TSpeedButton
    Left = 11
    Top = 42
    Width = 94
    Height = 25
    Caption = #1041#1077#1079' '#1085#1091#1084#1077#1088#1072#1094#1080#1080
    OnClick = sBtnBezVedNRClick
  end
  object dbeVedNR: TDBEdit
    Left = 176
    Top = 10
    Width = 65
    Height = 21
    DataField = 'VedNR'
    DataSource = dsrcTmp
    TabOrder = 0
    OnEnter = dbeVedNREnter
    OnExit = dbeVedNRExit
  end
  object bBtnOk: TBitBtn
    Left = 108
    Top = 42
    Width = 65
    Height = 25
    Caption = #1042#1074#1086#1076
    Default = True
    TabOrder = 1
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
    Spacing = 0
  end
  object bBtnCancel: TBitBtn
    Left = 176
    Top = 42
    Width = 65
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
    Spacing = 0
  end
  object cdsTmp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VedNR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Data = {
      280000009619E0BD010000001800000001000000000003000000280005566564
      4E5204000100000000000000}
    object cdsTmpVedNR: TIntegerField
      FieldName = 'VedNR'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 96
    Top = 8
  end
end
