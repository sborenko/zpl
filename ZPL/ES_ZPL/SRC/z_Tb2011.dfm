object FormTb2011: TFormTb2011
  Left = 318
  Top = 273
  Width = 800
  Height = 539
  BorderIcons = [biSystemMenu]
  Caption = 'FormTb2011'
  Color = clBtnFace
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 425
  Constraints.MinWidth = 665
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
  object PageControl: TPageControl
    Left = 0
    Top = 30
    Width = 792
    Height = 482
    ActivePage = tsEsvPrp
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object tsEsvSotr: TTabSheet
      Caption = #1042' '#1045#1057#1042' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ImageIndex = 2
      object Label1: TLabel
        Left = 0
        Top = 438
        Width = 612
        Height = 13
        Align = alBottom
        Alignment = taCenter
        Caption = 
          #1042' '#1082#1086#1083#1086#1085#1082#1072#1093' "%..." '#1091#1082#1072#1079#1072#1085#1099' '#1087#1088#1086#1094#1077#1085#1090#1099' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1076#1086' '#1057#1084#1055#1092#1052#1072#1093', '#1074' '#1082#1086#1083#1086#1085 +
          #1082#1072#1093' "'#1057#1084'..." - '#1089#1091#1084#1084#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089' '#1089#1091#1084#1084#1099' '#1057#1084#1055#1092#1052#1072#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbgrEsv: TDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 438
        Hint = #1059#1076#1077#1088#1078#1072#1085#1080#1103' '#1074' '#1045#1057#1042' '#1089' '#1079#1072#1088#1087#1083#1072#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        Align = alClient
        Color = 13429757
        DataSource = DmMain.dsrcEsv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrEsvDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCCMN'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMCMN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCPPS'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMPPS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCBLN'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMBLN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCDEKR'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDEKR'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCGPD'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMGPD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 68
            Visible = True
          end>
      end
    end
    object tsEsvPrp: TTabSheet
      Caption = #1042' '#1045#1057#1042' '#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      ImageIndex = 6
      object Label23: TLabel
        Left = 0
        Top = 438
        Width = 784
        Height = 13
        Align = alBottom
        Alignment = taCenter
        Caption = 
          #1042' '#1082#1086#1083#1086#1085#1082#1072#1093' "%..." '#1091#1082#1072#1079#1072#1085#1099' '#1087#1088#1086#1094#1077#1085#1090#1099' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1076#1086' '#1057#1084#1055#1092#1052#1072#1093', '#1074' '#1082#1086#1083#1086#1085 +
          #1082#1072#1093' "'#1057#1084'..." - '#1089#1091#1084#1084#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089' '#1089#1091#1084#1084#1099' '#1057#1084#1055#1092#1052#1072#1093
        Color = clInfoBk
        ParentColor = False
      end
      object dbgrEsvP: TDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 438
        Hint = #1055#1083#1072#1090#1077#1078#1080' '#1074' '#1045#1057#1042' '#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
        Align = alClient
        Color = clMoneyGreen
        DataSource = DmMain.dsrcEsvP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrEsvPDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCCMN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMCMN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCINV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMINV'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCBLN'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMBLN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCBLNINV'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMBLNINV'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCDEKR'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDEKR'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCDEKRINV'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDEKRINV'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCGPD'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMGPD'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Visible = True
          end>
      end
    end
    object tsCmb2004: TTabSheet
      Hint = '"'#1050#1086#1085#1090#1088#1086#1083#1100#1085#1099#1077'" '#1094#1080#1092#1088#1099' '
      Caption = #1062#1080#1092#1088#1099' '#1089' 2004 '#1075'.'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      object Splitter3: TSplitter
        Left = 0
        Top = 307
        Width = 784
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
        Color = clActiveCaption
        ParentColor = False
      end
      object dbgrTPdn: TDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 307
        Hint = #1058#1072#1073#1083#1080#1094#1072' "'#1056#1072#1079#1085#1099#1077' '#1094#1080#1092#1088#1099'"'
        Align = alClient
        Color = 11009242
        DataSource = dsrcTPdn
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrTPdnDrawColumnCell
        OnDblClick = dbgrTPdnDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'DTBEG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
            FieldName = 'PRCPDN2'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCWSB'
            Width = 43
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
            Width = 60
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMLG100'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 98
            Visible = True
          end>
      end
      object MemoHlp: TMemo
        Left = 0
        Top = 310
        Width = 784
        Height = 141
        Align = alBottom
        Alignment = taCenter
        Color = clBtnFace
        Constraints.MinHeight = 65
        Lines.Strings = (
          
            #1062#1080#1092#1088#1099' '#1080#1079' '#1101#1090#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' '#1080#1089#1087#1086#1083#1100#1079#1091#1102#1090#1089#1103' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1072#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1080#1079' '#1079#1072#1088 +
            #1087#1083#1072#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1080' '#1080#1079' '#1060#1054#1058' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
          
            #1042' '#1082#1086#1083#1086#1085#1082#1080'  '#1087#1086#1084#1077#1097#1072#1102#1090#1089#1103'  '#1079#1085#1072#1095#1077#1085#1080#1103': "'#1053#1072#1095#1080#1085#1072#1103' '#1089'" - '#1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090 +
            #1074#1080#1103' '#1094#1080#1092#1088';  "% '#1055#1085'1" - '#1089#1090#1072#1074#1082#1072' '#1085#1072#1083#1086#1075#1072' '#1089' '
          
            #1076#1086#1093#1086#1076#1086#1074' <= 10 '#1093' '#1052#1080#1085#1047#1087#1053#1043'; "% '#1055#1085'2" - '#1089#1090#1072#1074#1082#1072' '#1085#1072#1083#1086#1075#1072' '#1089' '#1076#1086#1093#1086#1076#1086#1074' '#1089#1074#1099#1096#1077 +
            ' 10 '#1093' '#1052#1080#1085#1047#1087#1053#1043'; '
          #1050#1086#1083#1086#1085#1082#1072' "% '#1042#1057#1073'" - '#1087#1088#1086#1094#1077#1085#1090' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1087#1086' '#1074#1080#1076#1091' 6007 "'#1042#1086#1077#1085#1085#1099#1081' '#1089#1073#1086#1088'";'
          
            '"'#1052#1080#1085#1047#1087#1053#1043'" - '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1079#1072#1088#1087#1083#1072#1090#1072' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1075#1086#1076#1072';  "'#1052#1080#1085#1047#1087'2" - '#1084#1080#1085 +
            #1080#1084#1072#1083#1100#1085#1072#1103' '#1079#1072#1088#1087#1083#1072#1090#1072', '
          
            #1084#1077#1085#1103#1102#1097#1072#1103#1089#1103' '#1074' '#1075#1086#1076#1091';  "'#1055#1088#1078#1052#1080#1085#1053#1043'" - '#1087#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081' '#1084#1080#1085#1080#1084#1091#1084' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1075 +
            #1086#1076#1072';  "'#1055#1088#1078#1052#1080#1085'2" - '#1087#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081' '
          
            #1084#1080#1085#1080#1084#1091#1084', '#1084#1077#1085#1103#1102#1097#1080#1081#1089#1103' '#1074' '#1075#1086#1076#1091'; "'#1055#1086#1088#1086#1075#1051#1100#1075'" - '#1087#1086#1088#1086#1075', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086 +
            #1075#1086' '#1076#1077#1081#1089#1090#1074#1091#1102#1090' '#1083#1100#1075#1086#1090#1099'; "% '#1051#1100#1075#1086#1090#1099'" - '
          
            #1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099'; "'#1057#1084#1051#1100#1075'100" - '#1089#1091#1084#1084#1072' '#1083#1100#1075#1086#1090#1099' '#1087#1088#1080' 100 ' +
            '% '#1074' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103#1093'. '
          
            #1044#1088#1091#1075#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1087#1088#1086#1094#1077#1085#1090#1072' '#1083#1100#1075#1086#1090#1099' '#1074' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103#1093' '#1088#1072#1089#1089#1095#1080#1090#1099#1074#1072#1102#1090#1089#1103' '#1086#1090 +
            ' '#1101#1090#1086#1075#1086' '#1079#1085#1072#1095#1077#1085#1080#1103'.; '
          
            '"'#1057#1084#1055#1092#1052#1072#1093'" - '#1087#1086#1088#1086#1075' '#1089#1091#1084#1084#1099', '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1091#1076#1077#1088#1078#1080#1074#1072#1102#1090#1089#1103' '#1074#1079#1085#1086#1089#1099' '#1074' '#1045#1057#1042' ('#1055#1060 +
            ', '#1060#1057#1057', '#1060#1047' '#1076#1086' 2011 '#1075'.); '
          '"'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'" - '#1089#1074#1086#1073#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090' "'#1085#1072' '#1087#1072#1084#1103#1090#1100'".'
          '')
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      30)
    object sBtnTabsSotr: TSpeedButton
      Left = 1
      Top = 2
      Width = 185
      Height = 25
      Hint = #1059#1076#1077#1088#1078#1072#1085#1080#1103' '#1074' '#1045#1057#1042' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      GroupIndex = 2
      Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103' '#1074' '#1045#1057#1042' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnTabsSotrClick
    end
    object sBtnTabsPrp: TSpeedButton
      Left = 188
      Top = 2
      Width = 173
      Height = 25
      Hint = #1055#1083#1072#1090#1077#1078#1080' '#1074' '#1045#1057#1042' '#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      GroupIndex = 2
      Caption = #1055#1083#1072#1090#1077#1078#1080' '#1074' '#1045#1057#1042' '#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnTabsSotrClick
    end
    object sBtnCmb2004: TSpeedButton
      Left = 362
      Top = 2
      Width = 150
      Height = 25
      Hint = #1056#1072#1079#1085#1099#1077' '#1094#1080#1092#1088#1099' '#1085#1072#1095#1080#1085#1072#1103' '#1089' 2004 '#1075'.'
      GroupIndex = 2
      Down = True
      Caption = #1062#1080#1092#1088#1099' '#1089' 2004 '#1075'.'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnCmb2004Click
    end
    object BitBtn1: TBitBtn
      Left = 714
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 1
    end
  end
  object dsrcTPdn: TDataSource
    DataSet = DmMain.qryTPdn
    Left = 331
    Top = 104
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 59
    Top = 104
    object popHead: TMenuItem
      Caption = '== '#1050#1086#1084#1073#1080#1085#1080#1088#1086#1074#1072#1085#1085#1072#1103' =='
      Enabled = False
    end
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
