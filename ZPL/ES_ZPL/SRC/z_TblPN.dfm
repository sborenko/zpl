object FormTblKomb: TFormTblKomb
  Left = 331
  Top = 242
  Width = 565
  Height = 389
  BorderIcons = [biSystemMenu]
  Caption = 'FormTblKomb'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 345
  Constraints.MinWidth = 565
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
  object Splitter1: TSplitter
    Left = 0
    Top = 260
    Width = 557
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clActiveCaption
    ParentColor = False
  end
  object dbgrTPdn: TDBGrid
    Left = 0
    Top = 33
    Width = 557
    Height = 227
    Align = alClient
    DataSource = dsrcTPdn
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrTPdnDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRCPDN'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINZP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINZP2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROGMIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROGMIN2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POROGLG'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROCLG'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM2660'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMLG100'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMLG150'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMLG200'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 98
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      557
      33)
    object sBtnHlp: TSpeedButton
      Left = 440
      Top = 5
      Width = 24
      Height = 25
      Hint = #1042#1099#1079#1086#1074' '#1087#1086#1076#1089#1082#1072#1079#1082#1080
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 7
      Down = True
      Caption = '?'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnHlpClick
    end
    object BitBtn1: TBitBtn
      Left = 479
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object MemoHlp: TMemo
    Left = 0
    Top = 263
    Width = 557
    Height = 99
    Align = alBottom
    Alignment = taCenter
    Color = clBtnFace
    Constraints.MinHeight = 65
    Lines.Strings = (
      
        #1062#1080#1092#1088#1099' '#1080#1079' '#1101#1090#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' '#1080#1089#1087#1086#1083#1100#1079#1091#1102#1090#1089#1103' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1072#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1080#1079' '#1079#1072#1088 +
        #1087#1083#1072#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074'.'
      
        #1042' '#1082#1086#1083#1086#1085#1082#1080'  '#1087#1086#1084#1077#1097#1072#1102#1090#1089#1103'  '#1079#1072#1095#1077#1085#1080#1103': "'#1053#1072#1095#1080#1085#1072#1103' '#1089'" - '#1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074 +
        #1080#1103' '#1094#1080#1092#1088';  "% '#1055#1053'" - '#1089#1090#1072#1074#1082#1072' '#1085#1072#1083#1086#1075#1072' '#1089' '
      
        #1076#1086#1093#1086#1076#1086#1074'; "'#1052#1080#1085#1047#1087#1053#1043'" - '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1079#1072#1088#1087#1083#1072#1090#1072' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1075#1086#1076#1072';  "'#1052#1080#1085#1047 +
        #1087'2" - '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1079#1072#1088#1087#1083#1072#1090#1072', '
      
        #1084#1077#1085#1103#1102#1097#1072#1103#1089#1103' '#1074' '#1075#1086#1076#1091';  "'#1055#1088#1078#1052#1080#1085#1053#1043'" - '#1087#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081' '#1084#1080#1085#1080#1084#1091#1084' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1075 +
        #1086#1076#1072';  "'#1055#1088#1078#1052#1080#1085'2" - '#1087#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081' '
      
        #1084#1080#1085#1080#1084#1091#1084', '#1084#1077#1085#1103#1102#1097#1080#1081#1089#1103' '#1074' '#1075#1086#1076#1091'; "'#1055#1086#1088#1086#1075#1051#1100#1075'" - '#1087#1086#1088#1086#1075', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086 +
        #1075#1086' '#1076#1077#1081#1089#1090#1074#1091#1102#1090' '#1083#1100#1075#1086#1090#1099'; "% '#1051#1100#1075#1086#1090#1099'" - '
      
        #1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1081' '#1087#1087#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099'; "'#1057#1084#1051#1100#1075'100", "'#1057#1084#1051#1100#1075'150", "'#1057#1084#1051#1100#1075'200' +
        '" - '#1089#1091#1084#1084#1099' '#1083#1100#1075#1086#1090' '#1076#1083#1103' '
      
        #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1083#1100#1075#1086#1090#1085#1080#1082#1086#1074'; "'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1103'" - '#1089#1074#1086#1073#1086#1076#1085#1099#1081' '#1090 +
        #1077#1082#1089#1090' "'#1085#1072' '#1087#1072#1084#1103#1090#1100'".'
      '')
    ReadOnly = True
    TabOrder = 2
  end
  object dsrcTPdn: TDataSource
    DataSet = DmMain.qryTPdn
    Left = 48
    Top = 104
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 168
    Top = 128
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
end
