object FormVvFam: TFormVvFam
  Left = 552
  Top = 333
  ActiveControl = edFam
  BorderStyle = bsDialog
  Caption = 'FormVvFam'
  ClientHeight = 131
  ClientWidth = 268
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
    Top = 10
    Width = 144
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1089#1082#1086#1084#1091#1102' '#1092#1072#1084#1080#1083#1080#1102':'
  end
  object bBtnOk: TBitBtn
    Left = 103
    Top = 102
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
    Left = 187
    Top = 102
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    Kind = bkCancel
  end
  object edFam: TEdit
    Left = 156
    Top = 7
    Width = 107
    Height = 21
    TabOrder = 0
    Text = 'edFam'
    OnEnter = edFamEnter
    OnExit = edFamExit
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 28
    Width = 256
    Height = 70
    Caption = '  '#1057#1087#1086#1089#1086#1073' '#1087#1086#1080#1089#1082#1072':  '
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object RBtn1: TRadioButton
      Left = 13
      Top = 14
      Width = 204
      Height = 17
      Caption = #1087#1086' '#1090#1086#1095#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102' '#1092#1072#1084#1080#1083#1080#1080
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RBtn3: TRadioButton
      Left = 13
      Top = 48
      Width = 229
      Height = 17
      Caption = #1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1090#1077' '#1092#1072#1084#1080#1083#1080#1080
      TabOrder = 2
    end
    object RBtn2: TRadioButton
      Left = 13
      Top = 31
      Width = 204
      Height = 17
      Caption = #1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1089' '#1085#1072#1095#1072#1083#1072' '#1092#1072#1084#1080#1083#1080#1080
      TabOrder = 1
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select upi.Fam, upi.Ima, upi.Otch, sps.*'
      '   from Z_Sps sps, Z_Upi upi '
      
        '   where (sps.dtProc = '#39'12/01/2003'#39') and (upi.TabN = sps.TabN) a' +
        'nd'
      '                     (upper(upi.Fam) containing('#39#1077#1085#1082#39'))')
    Left = 13
    Top = 101
  end
end
