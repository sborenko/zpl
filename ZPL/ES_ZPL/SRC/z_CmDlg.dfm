object FormDlgCloseMonth: TFormDlgCloseMonth
  Left = 423
  Top = 579
  BorderStyle = bsDialog
  Caption = 'FormDlgCloseMonth'
  ClientHeight = 217
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    276
    217)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 217
    Height = 13
    Caption = #1042#1089#1077#1075#1086' '#1074' '#1089#1087#1080#1089#1082#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 4
    Top = 28
    Width = 222
    Height = 13
    Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1085#1086' .....................................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 48
    Width = 221
    Height = 13
    Caption = #1053#1077' '#1088#1072#1089#1089#1095#1080#1090#1072#1085#1086' ................................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 4
    Top = 68
    Width = 217
    Height = 13
    Caption = #1047#1072#1087#1088#1077#1097#1077#1085#1086' '#1082' '#1088#1072#1089#1095#1077#1090#1091' .....................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCntAll: TLabel
    Left = 218
    Top = 8
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblCntAll'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LblCntWithSch: TLabel
    Left = 218
    Top = 28
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblCntWithSch'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LblCntBezSch: TLabel
    Left = 218
    Top = 48
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblCntBezSch'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    OnDblClick = LblCntBezSchDblClick
  end
  object LblCntZapr: TLabel
    Left = 218
    Top = 68
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblCntZapr'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    OnDblClick = LblCntZaprDblClick
  end
  object Label5: TLabel
    Left = 4
    Top = 88
    Width = 221
    Height = 13
    Caption = #1054#1089#1090#1072#1090#1082#1080' '#1089#1091#1084#1084' '#1085#1072' '#1088#1091#1082#1080' ...................................'
  end
  object Label6: TLabel
    Left = 64
    Top = 104
    Width = 160
    Height = 13
    Caption = '- '#1082'-'#1074#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' .....................'
  end
  object Label7: TLabel
    Left = 4
    Top = 124
    Width = 236
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1086#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' .......................'
    Color = clBtnFace
    ParentColor = False
  end
  object Label8: TLabel
    Left = 64
    Top = 140
    Width = 157
    Height = 13
    Caption = '- '#1082'-'#1074#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' ....................'
  end
  object LblSmDlgPrp: TLabel
    Left = 192
    Top = 88
    Width = 79
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblSmDlgPrp'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LblCntDlgPrp: TLabel
    Left = 218
    Top = 104
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblCntDlgPrp'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LblSmDlgTM: TLabel
    Left = 192
    Top = 124
    Width = 79
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblSmDlgTM'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LblCntDlgTM: TLabel
    Left = 218
    Top = 140
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblCntDlgTM'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    OnDblClick = LblCntDlgTMDblClick
  end
  object sBtnDlgDetails: TSpeedButton
    Left = 4
    Top = 160
    Width = 268
    Height = 23
    Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077' '#1086' '#1076#1086#1083#1075#1072#1093' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
    OnClick = sBtnDlgDetailsClick
  end
  object bBtnCancel: TBitBtn
    Left = 210
    Top = 189
    Width = 62
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
    Spacing = 0
  end
  object bBtnDelAll: TBitBtn
    Left = 102
    Top = 189
    Width = 106
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1089#1077
    ModalResult = 1
    TabOrder = 0
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
  object bBtnSetAll: TBitBtn
    Left = 4
    Top = 189
    Width = 96
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1087#1088#1077#1090' '#1074#1089#1077#1084
    ModalResult = 1
    TabOrder = 2
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
end
