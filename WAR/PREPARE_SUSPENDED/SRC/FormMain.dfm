object FrmMain: TFrmMain
  Left = 277
  Top = 181
  Width = 613
  Height = 392
  Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' "'#1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1093' '#1085#1072' '#1074#1088#1077#1084#1103' '#1074#1086#1081#1085#1099'".'
  Color = clBtnFace
  Constraints.MinHeight = 389
  Constraints.MinWidth = 613
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
  object PnlAdmin: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 353
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object LblZipPath: TLabel
      Left = 8
      Top = 128
      Width = 199
      Height = 13
      Caption = #1055#1091#1090#1100' '#1082' '#1072#1088#1093#1080#1074#1072#1084' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
    end
    object LblWarPath: TLabel
      Left = 8
      Top = 176
      Width = 211
      Height = 13
      Caption = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093' "'#1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1093'"'
    end
    object GrpBoxScope: TGroupBox
      Left = 8
      Top = 8
      Width = 257
      Height = 89
      Caption = ' '#1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '
      TabOrder = 0
      object RadioAllEmpl: TRadioButton
        Left = 8
        Top = 24
        Width = 169
        Height = 17
        Caption = '&'#1042#1089#1077
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RadioSelectEmplClick
      end
      object RadioEmplId: TRadioButton
        Left = 8
        Top = 56
        Width = 65
        Height = 17
        Caption = '&'#1058#1072#1073'. '#8470
        TabOrder = 1
        TabStop = True
        OnClick = RadioSelectEmplClick
      end
      object EdtEmplId: TEdit
        Left = 72
        Top = 52
        Width = 117
        Height = 21
        TabOrder = 2
      end
    end
    object EdtZipPath: TEdit
      Left = 8
      Top = 144
      Width = 225
      Height = 21
      TabOrder = 1
      Text = 'EdtZipPath'
      OnExit = EdtPathExit
    end
    object EdtWarPath: TEdit
      Left = 8
      Top = 192
      Width = 225
      Height = 21
      TabOrder = 3
      Text = 'EdtWarPath'
      OnExit = EdtPathExit
    end
    object BtnZipPath: TBitBtn
      Left = 240
      Top = 144
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 2
      OnClick = BtnPathClick
    end
    object BtnWarPath: TBitBtn
      Left = 240
      Top = 192
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 4
      OnClick = BtnPathClick
    end
    object GrpSteps: TGroupBox
      Left = 8
      Top = 224
      Width = 257
      Height = 105
      Caption = ' '#1064#1072#1075#1080' '
      TabOrder = 5
      object ChBoxBackup: TCheckBox
        Left = 8
        Top = 24
        Width = 193
        Height = 17
        Caption = '&'#1057#1086#1079#1076#1072#1085#1080#1077' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080
        TabOrder = 0
      end
      object ChBoxUnzip: TCheckBox
        Left = 8
        Top = 48
        Width = 193
        Height = 17
        Caption = '&'#1056#1072#1089#1087#1072#1082#1086#1074#1082#1072' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1073#1072#1079#1099
        TabOrder = 1
      end
      object ChBoxPrepare: TCheckBox
        Left = 8
        Top = 72
        Width = 193
        Height = 17
        Caption = #1055#1086#1076'&'#1075#1086#1090#1086#1074#1082#1072' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1093
        TabOrder = 2
      end
    end
  end
  object PnlUser: TPanel
    Left = 273
    Top = 0
    Width = 324
    Height = 353
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      324
      353)
    object LblDate: TLabel
      Left = 8
      Top = 12
      Width = 90
      Height = 13
      Caption = #1056#1072#1089#1095#1105#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
    end
    object MemInfo: TMemo
      Left = 8
      Top = 34
      Width = 305
      Height = 295
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
    end
    object DatePicker: TDateTimePicker
      Left = 112
      Top = 8
      Width = 146
      Height = 21
      Date = 45189.403783263890000000
      Time = 45189.403783263890000000
      TabOrder = 0
    end
    object PnlButtons: TPanel
      Left = 1
      Top = 311
      Width = 322
      Height = 41
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        322
        41)
      object BtnRun: TBitBtn
        Left = 153
        Top = 11
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1042#1099'&'#1087#1086#1083#1085#1080#1090#1100
        TabOrder = 0
        OnClick = BtnRunClick
      end
      object BtnExit: TButton
        Left = 240
        Top = 11
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1042'&'#1099#1081#1090#1080
        TabOrder = 1
        OnClick = BtnExitClick
      end
    end
  end
end
