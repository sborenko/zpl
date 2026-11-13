object FormDr8_1: TFormDr8_1
  Left = 346
  Top = 212
  Width = 577
  Height = 320
  BorderIcons = [biSystemMenu]
  Caption = #1042#1074#1086#1076' '#1079#1072#1076#1072#1085#1080#1103' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1087#1086' '#1092#1086#1088#1084#1077' '#1044#1088'-8'
  Color = clBtnFace
  Constraints.MaxWidth = 577
  Constraints.MinHeight = 320
  Constraints.MinWidth = 577
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    569
    293)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrPeriodu: TDBGrid
    Left = 0
    Top = 0
    Width = 121
    Height = 264
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcPeriodu
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Period'
        Title.Caption = #1052#1077#1089#1103#1094#1099
        Width = 67
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 406
    Top = 267
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 494
    Top = 267
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object PanelMsg: TPanel
    Left = 124
    Top = 4
    Width = 445
    Height = 259
    BevelInner = bvLowered
    TabOrder = 3
    object LabelMsg: TLabel
      Left = 83
      Top = 9
      Width = 311
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1042' '#1090#1072#1073#1083#1080#1095#1082#1077' '#1089#1083#1077#1074#1072' '#1074#1099#1074#1077#1076#1077#1085#1099' '#1084#1077#1089#1103#1094#1099', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1074' '#1041#1072#1079#1077' '#1076#1072#1085#1085#1099#1093' '#1080#1084#1077#1102#1090 +
        #1089#1103' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103#1093':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 7
      Top = 92
      Width = 173
      Height = 13
      Caption = #1050#1086#1076' '#1045#1044#1056#1055#1054#1059' '#1042#1072#1096#1077#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
    end
    object Label7: TLabel
      Left = 7
      Top = 132
      Width = 142
      Height = 13
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
    end
    object Label8: TLabel
      Left = 246
      Top = 132
      Width = 52
      Height = 13
      Caption = #1080' '#1090#1077#1083#1077#1092#1086#1085
    end
    object Label9: TLabel
      Left = 383
      Top = 132
      Width = 53
      Height = 13
      Caption = #1076#1080#1088#1077#1082#1090#1086#1088#1072
    end
    object Label10: TLabel
      Left = 7
      Top = 152
      Width = 176
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080#1084#1103' '#1086#1090#1095#1077#1089#1090#1074#1086' '#1076#1080#1088#1077#1082#1090#1086#1088#1072
    end
    object Label11: TLabel
      Left = 7
      Top = 172
      Width = 142
      Height = 13
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
    end
    object Label12: TLabel
      Left = 246
      Top = 172
      Width = 52
      Height = 13
      Caption = #1080' '#1090#1077#1083#1077#1092#1086#1085
    end
    object Label13: TLabel
      Left = 380
      Top = 172
      Width = 56
      Height = 13
      Caption = #1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
    end
    object Label14: TLabel
      Left = 7
      Top = 192
      Width = 179
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080#1084#1103' '#1086#1090#1095#1077#1089#1090#1074#1086' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
    end
    object Label15: TLabel
      Left = 7
      Top = 212
      Width = 187
      Height = 13
      Caption = #1050#1086#1076' '#1076#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1075#1086' '#1086#1088#1075#1072#1085#1091
    end
    object Label16: TLabel
      Left = 336
      Top = 212
      Width = 54
      Height = 13
      Caption = #1080' '#1077#1075#1086' '#1044#1055#1048
    end
    object Label1: TLabel
      Left = 9
      Top = 40
      Width = 430
      Height = 42
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1088#1080' '#1084#1077#1089#1103#1094#1072', '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1080#1077' '#1082#1074#1072#1088#1090#1072#1083', '#1087#1088#1086#1074#1077#1088#1100#1090#1077' ('#1080', '#1077#1089#1083#1080' '#1085#1091 +
        #1078#1085#1086', '#1080#1089#1087#1088#1072#1074#1100#1090#1077') '#1088#1077#1082#1074#1080#1079#1080#1090#1099' '#1042#1072#1096#1077#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1080' '#1042#1072#1096#1077#1075#1086' '#1076#1077#1088#1078#1072#1074#1085#1086#1075#1086' ' +
        #1087#1086#1076#1072#1090#1082#1086#1074#1086#1075#1086' '#1086#1088#1075#1072#1085#1091' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1074#1086#1076'".'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 7
      Top = 111
      Width = 64
      Height = 13
      Caption = #1045#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
    end
    object Label17: TLabel
      Left = 7
      Top = 233
      Width = 69
      Height = 13
      Caption = #1045#1075#1086' '#1085#1072#1079#1074#1072#1085#1080#1077
    end
    object meFirmKod: TMaskEdit
      Left = 364
      Top = 90
      Width = 75
      Height = 20
      AutoSize = False
      EditMask = '##########'
      MaxLength = 10
      TabOrder = 0
      Text = '          '
    end
    object edFirmNm: TEdit
      Left = 167
      Top = 110
      Width = 272
      Height = 20
      AutoSize = False
      MaxLength = 35
      TabOrder = 1
      Text = 'edFirmNm'
    end
    object meIdRuk: TMaskEdit
      Left = 167
      Top = 130
      Width = 75
      Height = 20
      AutoSize = False
      EditMask = '##########'
      MaxLength = 10
      TabOrder = 2
      Text = '          '
    end
    object mePhoneRuk: TMaskEdit
      Left = 304
      Top = 130
      Width = 73
      Height = 20
      Hint = #1058#1077#1083#1077#1092#1086#1085' '#1074#1074#1086#1076#1080#1090#1077' '#1073#1077#1079' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1077#1081
      AutoSize = False
      EditMask = '9999999999;1; '
      MaxLength = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '          '
    end
    object edFioRuk: TEdit
      Left = 195
      Top = 150
      Width = 244
      Height = 20
      AutoSize = False
      MaxLength = 35
      TabOrder = 4
      Text = 'edFioRuk'
    end
    object meIdBuh: TMaskEdit
      Left = 167
      Top = 170
      Width = 75
      Height = 20
      AutoSize = False
      EditMask = '##########'
      MaxLength = 10
      TabOrder = 5
      Text = '          '
    end
    object mePhoneBuh: TMaskEdit
      Left = 304
      Top = 170
      Width = 73
      Height = 20
      Hint = #1058#1077#1083#1077#1092#1086#1085' '#1074#1074#1086#1076#1080#1090#1077' '#1073#1077#1079' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1077#1081
      AutoSize = False
      EditMask = '9999999999;1; '
      MaxLength = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Text = '          '
    end
    object edFioBuh: TEdit
      Left = 195
      Top = 190
      Width = 244
      Height = 20
      AutoSize = False
      MaxLength = 35
      TabOrder = 7
      Text = 'edFioBuh'
    end
    object meInspKod: TMaskEdit
      Left = 235
      Top = 210
      Width = 75
      Height = 20
      AutoSize = False
      EditMask = '##########'
      MaxLength = 10
      TabOrder = 8
      Text = '          '
    end
    object meInspDPI: TMaskEdit
      Left = 399
      Top = 210
      Width = 40
      Height = 20
      AutoSize = False
      EditMask = '####'
      MaxLength = 4
      TabOrder = 9
      Text = '    '
    end
    object edInspNm: TEdit
      Left = 115
      Top = 230
      Width = 324
      Height = 20
      AutoSize = False
      MaxLength = 65
      TabOrder = 10
      Text = 'edInspNm'
    end
  end
  object qryPeriodu: TQuery
    Active = True
    OnCalcFields = qryPerioduCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct  DtProc from Z_NU'
      'where dtProc >= '#39'01/01/2006'#39)
    Left = 40
    Top = 64
    object qryPerioduDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryPerioduPeriod: TStringField
      FieldKind = fkCalculated
      FieldName = 'Period'
      Calculated = True
    end
  end
  object dsrcPeriodu: TDataSource
    DataSet = qryPeriodu
    Left = 56
    Top = 88
  end
end
