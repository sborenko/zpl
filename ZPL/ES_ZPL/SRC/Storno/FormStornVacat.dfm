object FrmStorn: TFrmStorn
  Left = 239
  Top = 265
  BorderStyle = bsDialog
  Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1072
  ClientHeight = 226
  ClientWidth = 322
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
    322
    226)
  PixelsPerInch = 96
  TextHeight = 13
  object LblVacatSum: TLabel
    Left = 40
    Top = 112
    Width = 152
    Height = 13
    Caption = #1057#1090#1086#1088#1085#1080#1088#1091#1077#1084#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1090#1087#1091#1089#1082#1072
    FocusControl = DbeVacatSum
  end
  object LblSalarySum: TLabel
    Left = 40
    Top = 137
    Width = 153
    Height = 13
    Caption = #1042#1086#1079#1074#1088#1072#1097#1072#1077#1084#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072
  end
  object LblVacatTtls: TLabel
    Left = 8
    Top = 160
    Width = 310
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1091#1084#1084#1072', '#1076#1085#1080' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblSalaryTtls: TLabel
    Left = 8
    Top = 176
    Width = 310
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1091#1084#1084#1072', '#1076#1085#1080' '#1086#1082#1083#1072#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnOk: TBitBtn
    Left = 149
    Top = 199
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object BtnCancel: TBitBtn
    Left = 237
    Top = 199
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object DbeVacatSum: TDBEdit
    Left = 221
    Top = 109
    Width = 80
    Height = 19
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'Summa'
    DataSource = DsrcRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object GrpBoxVacat: TGroupBox
    Left = 8
    Top = 5
    Width = 305
    Height = 49
    Caption = ' '#1057#1090#1086#1088#1085#1080#1088#1091#1077#1084#1099#1081' '#1087#1077#1088#1080#1086#1076' '#1086#1090#1087#1091#1089#1082#1072' '
    TabOrder = 0
    object LblVacatBeg: TLabel
      Left = 27
      Top = 25
      Width = 38
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1085#1072#1095#1072#1083#1086':'
      FocusControl = DbeVacatBeg
    end
    object LblVacatEnd: TLabel
      Left = 164
      Top = 25
      Width = 38
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1086#1082#1086#1085#1095'.:'
      FocusControl = DbeVacatEnd
    end
    object DbeVacatBeg: TDBEdit
      Left = 72
      Top = 22
      Width = 80
      Height = 19
      TabStop = False
      Color = clBtnFace
      Ctl3D = False
      DataField = 'Dt_Beg'
      DataSource = DmStornSpecNr.DsrcParts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DbeVacatEnd: TDBEdit
      Left = 209
      Top = 22
      Width = 80
      Height = 19
      TabStop = False
      Color = clBtnFace
      Ctl3D = False
      DataField = 'Dt_End'
      DataSource = DmStornSpecNr.DsrcParts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GrpBoxStorn: TGroupBox
    Left = 8
    Top = 56
    Width = 305
    Height = 49
    Caption = ' '#1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object LblStornBeg: TLabel
      Left = 27
      Top = 24
      Width = 38
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1089':'
      FocusControl = DbeStornBeg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblStornEnd: TLabel
      Left = 164
      Top = 24
      Width = 38
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1087#1086':'
      FocusControl = DbeStornEnd
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DbeStornBeg: TDBEdit
      Left = 72
      Top = 20
      Width = 80
      Height = 21
      DataField = 'Dt_Beg'
      DataSource = DsrcRec
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = DbeStornBegEnter
      OnExit = DbeStornBegExit
    end
    object DbeStornEnd: TDBEdit
      Left = 209
      Top = 20
      Width = 80
      Height = 21
      DataField = 'Dt_End'
      DataSource = DsrcRec
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = DbeStornBegEnter
      OnExit = DbeStornBegExit
    end
  end
  object TxtSalarySum: TStaticText
    Left = 221
    Top = 136
    Width = 81
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'TxtSalarySum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object DsrcRec: TDataSource
    DataSet = DmStornSpecNr.CdsBuff
    Left = 32
    Top = 176
  end
end
