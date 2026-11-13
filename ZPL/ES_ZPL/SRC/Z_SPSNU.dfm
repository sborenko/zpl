object FormSpsNU: TFormSpsNU
  Left = 352
  Top = 212
  Width = 420
  Height = 400
  BorderIcons = [biSystemMenu]
  Caption = 'FormSpsNU'
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 420
  Constraints.MinHeight = 307
  Constraints.MinWidth = 335
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    412
    373)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 346
    Width = 412
    Height = 27
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1089#1103#1094' '#1080' '#1074#1099#1079#1086#1074#1080#1090#1077' '#1074#1089#1087#1083#1099#1074#1072#1102#1097#1077#1077' '#1084#1077#1085#1102' '#1097#1077#1083#1095#1082#1086#1084' '#1087#1088#1072#1074#1086#1081' '#1082#1085#1086#1087#1082#1080 +
      ' '#1084#1099#1096#1082#1080' '#1080#1083#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1086#1076#1085#1091' '#1080#1079' '#1082#1085#1086#1087#1086#1082' '#1089#1087#1088#1072#1074#1072
    WordWrap = True
  end
  object SpeedButton1: TSpeedButton
    Left = 254
    Top = 47
    Width = 156
    Height = 22
    Anchors = [akTop, akRight]
    Caption = #1055#1086' '#1074#1080#1076#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
    OnClick = popByVidNClick
  end
  object SpeedButton2: TSpeedButton
    Left = 254
    Top = 71
    Width = 156
    Height = 22
    Anchors = [akTop, akRight]
    Caption = #1055#1086' '#1096#1080#1092#1088#1072#1084' '#1079#1072#1090#1088#1072#1090
    OnClick = popByShPZClick
  end
  object SpeedButton3: TSpeedButton
    Left = 254
    Top = 95
    Width = 156
    Height = 22
    Anchors = [akTop, akRight]
    Caption = #1055#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
    OnClick = popByKatPClick
  end
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 28
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      412
      28)
    object LabelMesGod: TLabel
      Left = 2
      Top = 5
      Width = 331
      Height = 20
      Hint = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1076#1083#1103' '#1089#1074#1086#1076#1086#1074' '#1084#1077#1089#1103#1094
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'LabelMesGod'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object bBtnCancel: TBitBtn
      Left = 335
      Top = 2
      Width = 75
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrListNU: TDBGrid
    Left = 0
    Top = 28
    Width = 250
    Height = 317
    Hint = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072' '#1076#1083#1103' '#1089#1074#1086#1076#1086#1074
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcListNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = popMnu
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MesGod'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMM'
        Width = 58
        Visible = True
      end>
  end
  object qryListNU: TQuery
    OnCalcFields = qryListNUCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select DtProc, count(NR) as Cnt, Sum(Summa) as SMM '
      'from Z_NU'
      'group by DtProc')
    Left = 48
    Top = 80
    object qryListNUDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryListNUCNT: TIntegerField
      DisplayLabel = #1050'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
      FieldName = 'CNT'
    end
    object qryListNUMesGod: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1043#1086#1076
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Size = 25
      Calculated = True
    end
    object qryListNUSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
  end
  object dsrcListNU: TDataSource
    DataSet = qryListNU
    OnDataChange = dsrcListNUDataChange
    Left = 72
    Top = 96
  end
  object popMnu: TPopupMenu
    Left = 64
    Top = 144
    object popHead: TMenuItem
      Caption = '== '#1057' '#1074' '#1086' '#1076' '#1099' =='
      Enabled = False
    end
    object popByVidN: TMenuItem
      Caption = '- '#1087#1086' '#1074#1080#1076#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      OnClick = popByVidNClick
    end
    object popByShPZ: TMenuItem
      Caption = '- '#1087#1086' '#1096#1080#1092#1088#1072#1084' '#1079#1072#1090#1088#1072#1090
      OnClick = popByShPZClick
    end
    object popByKatP: TMenuItem
      Caption = '- '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      OnClick = popByKatPClick
    end
  end
end
