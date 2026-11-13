object FormGetPeriod: TFormGetPeriod
  Left = 384
  Top = 197
  ActiveControl = meMesBeg
  BorderStyle = bsDialog
  Caption = 'FormGetPeriod'
  ClientHeight = 100
  ClientWidth = 297
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
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 2
    Top = 2
    Width = 293
    Height = 70
  end
  object LabelPrompt: TLabel
    Left = 10
    Top = 8
    Width = 167
    Height = 13
    Caption = #1055#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1087#1077#1088#1077#1089#1095#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076':'
  end
  object Label2: TLabel
    Left = 171
    Top = 30
    Width = 15
    Height = 13
    Caption = #1087#1086':'
  end
  object Label3: TLabel
    Left = 82
    Top = 53
    Width = 206
    Height = 13
    Caption = '('#1086' '#1073' '#1072'   '#1084' '#1077' '#1089' '#1103' '#1094' '#1072'   '#1074' '#1082' '#1083' '#1102' '#1095' '#1080' '#1090' '#1077' '#1083' '#1100' '#1085' '#1086')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 30
    Width = 9
    Height = 13
    Caption = #1089':'
  end
  object BitBtn1: TBitBtn
    Left = 117
    Top = 74
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 8
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 221
    Top = 74
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 9
    Kind = bkCancel
  end
  object UpDownMesBeg: TUpDown
    Left = 56
    Top = 28
    Width = 16
    Height = 20
    Associate = meMesBeg
    Min = 1
    Max = 12
    Position = 1
    TabOrder = 1
    Thousands = False
  end
  object meMesBeg: TMaskEdit
    Left = 30
    Top = 28
    Width = 26
    Height = 20
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '1'
  end
  object meGodBeg: TMaskEdit
    Left = 70
    Top = 28
    Width = 44
    Height = 20
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '1999'
  end
  object UpDownGodBeg: TUpDown
    Left = 114
    Top = 28
    Width = 16
    Height = 20
    Associate = meGodBeg
    Min = 1999
    Max = 3000
    Position = 1999
    TabOrder = 3
    Thousands = False
  end
  object meMesEnd: TMaskEdit
    Left = 190
    Top = 28
    Width = 26
    Height = 20
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = '1'
  end
  object UpDownMesEnd: TUpDown
    Left = 216
    Top = 28
    Width = 16
    Height = 20
    Associate = meMesEnd
    Min = 1
    Max = 12
    Position = 1
    TabOrder = 5
    Thousands = False
  end
  object meGodEnd: TMaskEdit
    Left = 230
    Top = 28
    Width = 44
    Height = 20
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = '1999'
  end
  object UpDownGodEnd: TUpDown
    Left = 274
    Top = 28
    Width = 16
    Height = 20
    Associate = meGodEnd
    Min = 1999
    Max = 3000
    Position = 1999
    TabOrder = 7
    Thousands = False
  end
end
