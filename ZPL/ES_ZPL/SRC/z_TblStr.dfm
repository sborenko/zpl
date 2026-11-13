object FormTabsUdrg: TFormTabsUdrg
  Left = 332
  Top = 392
  Width = 625
  Height = 597
  BorderIcons = [biSystemMenu]
  Caption = 'FormTabsUdrg'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 525
  Constraints.MinWidth = 625
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 617
    Height = 541
    ActivePage = tsCmb2004
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnChange = PageControl1Change
    object tsCmb2004: TTabSheet
      Hint = '"'#1050#1086#1085#1090#1088#1086#1083#1100#1085#1099#1077'" '#1094#1080#1092#1088#1099' '
      Caption = #1062#1080#1092#1088#1099' '#1089' 2004 '#1075'.'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      object Splitter3: TSplitter
        Left = 0
        Top = 391
        Width = 609
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
        Width = 609
        Height = 391
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
            Width = 58
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
      object MemoHlp: TMemo
        Left = 0
        Top = 394
        Width = 609
        Height = 116
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
          
            #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1083#1100#1075#1086#1090#1085#1080#1082#1086#1074'; "'#1057#1084#1055#1092#1052#1072#1093'" - '#1087#1086#1088#1086#1075' '#1089#1091#1084#1084#1099', '#1089 +
            ' '#1082#1086#1090#1086#1088#1086#1081' '#1091#1076#1077#1088#1078#1080#1074#1072#1102#1090#1089#1103' '#1074#1079#1085#1086#1089#1099' '#1074' '#1055#1060', '#1060#1057#1057', '
          #1060#1047'; "'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1103'" - '#1089#1074#1086#1073#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090' "'#1085#1072' '#1087#1072#1084#1103#1090#1100'".'
          '')
        ReadOnly = True
        TabOrder = 1
      end
    end
    object tsShkPPS: TTabSheet
      Hint = #1064#1082#1072#1083#1099' '#1076#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1074' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076' '#1076#1083#1103' '#1055#1055#1057
      Caption = #1064#1082#1072#1083#1072' '#1055#1060' '#1076#1083#1103' '#1055#1055#1057
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      object PanelShkPps: TPanel
        Left = 82
        Top = 2
        Width = 475
        Height = 435
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel2: TPanel
          Left = 2
          Top = 2
          Width = 193
          Height = 431
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 0
            Top = 182
            Width = 193
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            Beveled = True
            Color = clAqua
            ParentColor = False
          end
          object dbgrPpsMes: TDBGrid
            Left = 0
            Top = 0
            Width = 193
            Height = 182
            Align = alClient
            BorderStyle = bsNone
            Color = clCream
            DataSource = dsrcPpsMes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = popMnu
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'MesGod'
                Title.Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' ('#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076')'
                Width = 156
                Visible = True
              end>
          end
          object dbgrPps: TDBGrid
            Left = 0
            Top = 185
            Width = 193
            Height = 246
            Align = alBottom
            BorderStyle = bsNone
            Color = clCream
            Constraints.MinHeight = 120
            DataSource = dsrcPps
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = popMnu
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'POROG'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMM'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRC'
                Width = 47
                Visible = True
              end>
          end
        end
        object PanelMsgPps: TPanel
          Left = 214
          Top = 53
          Width = 242
          Height = 311
          BevelOuter = bvNone
          TabOrder = 1
          object Label6: TLabel
            Left = 7
            Top = 8
            Width = 233
            Height = 28
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1053#1059#1051#1071' '#1076#1086' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1074#1079#1085#1086#1089' '#1074' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076 +
              ' '#1085#1077' '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103'.'
            WordWrap = True
          end
          object Label8: TLabel
            Left = 7
            Top = 35
            Width = 233
            Height = 57
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1076#1086' '#1074#1090#1086#1088#1086#1075#1086' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091#1084 +
              #1084#1072' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' '#1087 +
              #1077#1088#1074#1099#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label9: TLabel
            Left = 7
            Top = 90
            Width = 233
            Height = 55
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1074#1090#1086#1088#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1076#1086' '#1090#1088#1077#1090#1100#1077#1075#1086' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091 +
              #1084#1084#1072' '#1074#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1074#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' ' +
              #1074#1090#1086#1088#1086#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label10: TLabel
            Left = 7
            Top = 143
            Width = 233
            Height = 17
            Alignment = taCenter
            AutoSize = False
            Caption = #1048' '#1090'. '#1076'. ...'
            WordWrap = True
          end
          object Label11: TLabel
            Left = 7
            Top = 154
            Width = 233
            Height = 55
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1057' '#1089#1091#1084#1084' '#1086#1090' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1080' '#1074#1099#1096#1077' '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091#1084#1084#1072' '#1087#1086#1089#1083#1077#1076 +
              #1085#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' '#1087#1086#1089#1083 +
              #1077#1076#1085#1080#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label12: TLabel
            Left = 7
            Top = 212
            Width = 233
            Height = 94
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1053#1077' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1099' '#1079#1072' '#1042#1057#1045' '#1084#1077#1089#1103#1094#1099'. '#1044#1086#1089#1090#1072#1090#1086#1095#1085#1086' '#1080#1084#1077#1090#1100' '#1090 +
              #1086#1083#1100#1082#1086' '#1090#1072#1073#1083#1080#1094#1099' '#1090#1077#1093' '#1084#1077#1089#1103#1094#1077#1074', '#1082#1086#1075#1076#1072' '#1087#1088#1086#1080#1079#1086#1096#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1087#1086#1088#1086#1075#1072#1093' '#1080 +
              #1083#1080' '#1087#1086#1089#1090#1086#1103#1085#1085#1099#1093' '#1089#1091#1084#1084#1072#1093' '#1080#1083#1080' '#1074' '#1087#1088#1086#1094#1077#1085#1090#1072#1093'. '#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1089#1091#1084#1084 +
              #1099' '#1074#1079#1085#1086#1089#1072' '#1074' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1073#1077#1088#1077#1090' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1091#1102' '#1090#1072#1073 +
              #1083#1080#1094#1091'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
        end
        object PanelAfterAddPps: TPanel
          Left = 8
          Top = 336
          Width = 199
          Height = 86
          Color = clOlive
          TabOrder = 2
          Visible = False
          object SpeedButton5: TSpeedButton
            Left = 87
            Top = 58
            Width = 107
            Height = 23
            Caption = #1041#1091#1076#1077#1090' '#1089#1076#1077#1083#1072#1085#1086' !'
            OnClick = SpeedButton5Click
          end
          object Memo2: TMemo
            Left = 7
            Top = 6
            Width = 185
            Height = 48
            Alignment = taCenter
            Lines.Strings = (
              #1048#1089#1087#1088#1072#1074#1100#1090#1077', '#1077#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1079#1072#1087#1080#1089#1080' '#1074' '
              #1085#1086#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '
              #1088#1091#1082#1086#1074#1086#1076#1103#1097#1080#1084#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080'.')
            TabOrder = 0
          end
        end
      end
    end
    object tsShkNePPS: TTabSheet
      Hint = #1064#1082#1072#1083#1099' '#1076#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1074' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076' '#1076#1083#1103' '#1074#1089#1077#1093', '#1082#1088#1086#1084#1077' '#1055#1055#1057
      Caption = #1064#1082#1072#1083#1072' '#1055#1060' '#1085#1077#1055#1055#1057
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      object PanelShkNePps: TPanel
        Left = 82
        Top = 2
        Width = 475
        Height = 435
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel4: TPanel
          Left = 2
          Top = 2
          Width = 193
          Height = 431
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter4: TSplitter
            Left = 0
            Top = 182
            Width = 193
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            Beveled = True
            Color = clAqua
            ParentColor = False
          end
          object dbgrNePpsMes: TDBGrid
            Left = 0
            Top = 0
            Width = 193
            Height = 182
            Align = alClient
            Color = clInfoBk
            DataSource = dsrcNePpsMes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = popMnu
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'MesGod'
                Title.Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' ('#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076')'
                Width = 156
                Visible = True
              end>
          end
          object dbgrNePpsPF: TDBGrid
            Left = 0
            Top = 185
            Width = 193
            Height = 246
            Align = alBottom
            Color = clInfoBk
            Constraints.MinHeight = 120
            DataSource = dsrcNePpsPF
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = popMnu
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'POROG'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMM'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRC'
                Width = 47
                Visible = True
              end>
          end
        end
        object PanelMsgNePps: TPanel
          Left = 214
          Top = 53
          Width = 242
          Height = 311
          BevelOuter = bvNone
          TabOrder = 1
          object Label13: TLabel
            Left = 7
            Top = 8
            Width = 233
            Height = 28
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1053#1059#1051#1071' '#1076#1086' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1074#1079#1085#1086#1089' '#1074' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076 +
              ' '#1085#1077' '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103'.'
            WordWrap = True
          end
          object Label14: TLabel
            Left = 7
            Top = 35
            Width = 233
            Height = 57
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1076#1086' '#1074#1090#1086#1088#1086#1075#1086' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091#1084 +
              #1084#1072' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' '#1087 +
              #1077#1088#1074#1099#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label15: TLabel
            Left = 7
            Top = 90
            Width = 233
            Height = 55
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1074#1090#1086#1088#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1076#1086' '#1090#1088#1077#1090#1100#1077#1075#1086' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091 +
              #1084#1084#1072' '#1074#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1074#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' ' +
              #1074#1090#1086#1088#1086#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label16: TLabel
            Left = 7
            Top = 143
            Width = 233
            Height = 17
            Alignment = taCenter
            AutoSize = False
            Caption = #1048' '#1090'. '#1076'. ...'
            WordWrap = True
          end
          object Label17: TLabel
            Left = 7
            Top = 154
            Width = 233
            Height = 55
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1057' '#1089#1091#1084#1084' '#1086#1090' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1080' '#1074#1099#1096#1077' '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091#1084#1084#1072' '#1087#1086#1089#1083#1077#1076 +
              #1085#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' '#1087#1086#1089#1083 +
              #1077#1076#1085#1080#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label18: TLabel
            Left = 7
            Top = 212
            Width = 233
            Height = 94
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1053#1077' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1099' '#1079#1072' '#1042#1057#1045' '#1084#1077#1089#1103#1094#1099'. '#1044#1086#1089#1090#1072#1090#1086#1095#1085#1086' '#1080#1084#1077#1090#1100' '#1090 +
              #1086#1083#1100#1082#1086' '#1090#1072#1073#1083#1080#1094#1099' '#1090#1077#1093' '#1084#1077#1089#1103#1094#1077#1074', '#1082#1086#1075#1076#1072' '#1087#1088#1086#1080#1079#1086#1096#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1087#1086#1088#1086#1075#1072#1093' '#1080 +
              #1083#1080' '#1087#1086#1089#1090#1086#1103#1085#1085#1099#1093' '#1089#1091#1084#1084#1072#1093' '#1080#1083#1080' '#1074' '#1087#1088#1086#1094#1077#1085#1090#1072#1093'. '#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1089#1091#1084#1084 +
              #1099' '#1074#1079#1085#1086#1089#1072' '#1074' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1073#1077#1088#1077#1090' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1091#1102' '#1090#1072#1073 +
              #1083#1080#1094#1091'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
        end
        object PanelAfterAddNePps: TPanel
          Left = 8
          Top = 336
          Width = 199
          Height = 86
          Color = clOlive
          TabOrder = 2
          Visible = False
          object SpeedButton1: TSpeedButton
            Left = 87
            Top = 58
            Width = 107
            Height = 23
            Caption = #1041#1091#1076#1077#1090' '#1089#1076#1077#1083#1072#1085#1086' !'
            OnClick = SpeedButton1Click
          end
          object Memo3: TMemo
            Left = 7
            Top = 6
            Width = 185
            Height = 48
            Alignment = taCenter
            Lines.Strings = (
              #1048#1089#1087#1088#1072#1074#1100#1090#1077', '#1077#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1079#1072#1087#1080#1089#1080' '#1074' '
              #1085#1086#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '
              #1088#1091#1082#1086#1074#1086#1076#1103#1097#1080#1084#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080'.')
            TabOrder = 0
          end
        end
      end
    end
    object tsSocStrahBln: TTabSheet
      Caption = #1042' '#1089#1086#1094#1089#1090#1088#1072#1093' '#1087#1086' '#1073#1086#1083#1077#1079#1085#1080
      ImageIndex = 4
      object PanelMsgSS: TPanel
        Left = 240
        Top = 60
        Width = 340
        Height = 357
        BevelInner = bvLowered
        TabOrder = 0
        object Label19: TLabel
          Left = 18
          Top = 23
          Width = 305
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = #1044#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1074' '#1060#1057#1057' '#1089#1077#1081#1095#1072#1089' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          WordWrap = True
        end
        object Label20: TLabel
          Left = 18
          Top = 50
          Width = 309
          Height = 35
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1055#1077#1088#1077#1076' '#1088#1072#1089#1095#1077#1090#1072#1084#1080' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1089' '#1079#1072#1082#1083#1072#1076#1082#1080' "'#1062#1080#1092#1088#1099' '#1089' 2004 '#1075'." '#1074#1099#1073#1080#1088#1072#1102#1090 +
            #1089#1103' '#1076#1074#1077' '#1094#1080#1092#1088#1099
          WordWrap = True
        end
        object Label21: TLabel
          Left = 18
          Top = 91
          Width = 309
          Height = 30
          AutoSize = False
          Caption = 
            '1. "'#1055#1088#1078#1052#1080#1085#1053#1043'" - '#1089#1091#1084#1084#1072' '#1087#1088#1086#1078#1080#1090#1086#1095#1085#1086#1075#1086' '#1084#1080#1085#1080#1084#1091#1084#1072', '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072#1103' '#1085#1072' '#1085#1072 +
            #1095#1072#1083#1086' '#1075#1086#1076#1072
          WordWrap = True
        end
        object Label22: TLabel
          Left = 18
          Top = 124
          Width = 309
          Height = 27
          AutoSize = False
          Caption = '2. "'#1057#1084#1055#1092#1052#1072#1093'" - '#1089#1091#1084#1084#1072' '#1087#1086#1088#1086#1075#1072' '#1076#1083#1103' '#1074#1079#1085#1086#1089#1086#1074' '#1074' '#1055#1060', '#1060#1057#1057', '#1060#1047
          WordWrap = True
        end
        object Label26: TLabel
          Left = 45
          Top = 307
          Width = 256
          Height = 34
          Alignment = taCenter
          AutoSize = False
          Caption = #1057#1083#1077#1076#1080#1090#1077' '#1079#1072' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1089#1090#1100#1102' '#1094#1080#1092#1088' '#1074' '#1090#1072#1073#1083#1080#1094#1077' "'#1062#1080#1092#1088#1099' '#1089' 2004 '#1075'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          WordWrap = True
        end
        object Label31: TLabel
          Left = 42
          Top = 163
          Width = 264
          Height = 36
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1057' '#1079#1072#1088#1072#1073#1086#1090#1082#1086#1074' '#1076#1086' "'#1055#1088#1078#1052#1080#1085#1053#1043'", '#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086', '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' 0.5 % '#1087#1086' ' +
            #1074#1080#1076#1091' 6303 ('#1089#1090#1072#1088#1099#1081' 398)'
          WordWrap = True
        end
        object Label32: TLabel
          Left = 42
          Top = 204
          Width = 264
          Height = 45
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1057' '#1079#1072#1088#1072#1073#1086#1090#1082#1086#1074' '#1074#1099#1096#1077' "'#1055#1088#1078#1052#1080#1085#1053#1043'" '#1076#1086' "'#1057#1084#1055#1092#1052#1072#1093'", '#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086', '#1091#1076#1077#1088#1078#1080#1074 +
            #1072#1077#1090#1089#1103' 1.0 % '#1087#1086' '#1074#1080#1076#1091' 6304 ('#1089#1090#1072#1088#1099#1081' 396)'
          WordWrap = True
        end
        object Label33: TLabel
          Left = 45
          Top = 254
          Width = 256
          Height = 45
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1057' '#1079#1072#1088#1072#1073#1086#1090#1082#1086#1074' '#1074#1099#1096#1077' "'#1057#1084#1055#1092#1052#1072#1093'" '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' 1.0 % '#1086#1090' '#1089#1091#1084#1084#1099' '#1087#1086#1088#1086#1075#1072' "' +
            #1057#1084#1055#1092#1052#1072#1093'" '#1087#1086' '#1074#1080#1076#1091' 6304 ('#1089#1090#1072#1088#1099#1081' 396)'
          WordWrap = True
        end
      end
    end
    object tsBZR: TTabSheet
      Caption = #1042' '#1092#1086#1085#1076' '#1079#1072#1085#1103#1090#1086#1089#1090#1080
      ImageIndex = 5
      object PanelMsgFZ: TPanel
        Left = 240
        Top = 68
        Width = 340
        Height = 333
        BevelInner = bvLowered
        TabOrder = 0
        object Label27: TLabel
          Left = 18
          Top = 32
          Width = 305
          Height = 29
          Alignment = taCenter
          AutoSize = False
          Caption = #1044#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1074' '#1092#1086#1085#1076' '#1079#1072#1085#1103#1090#1086#1089#1090#1080' '#1089#1077#1081#1095#1072#1089' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          WordWrap = True
        end
        object Label28: TLabel
          Left = 16
          Top = 70
          Width = 313
          Height = 44
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1055#1077#1088#1077#1076' '#1088#1072#1089#1095#1077#1090#1072#1084#1080' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1089' '#1079#1072#1082#1083#1072#1076#1082#1080' "'#1062#1080#1092#1088#1099' '#1089' 2004 '#1075'." '#1074#1099#1073#1080#1088#1072#1077#1090 +
            #1089#1103' '#1094#1080#1092#1088#1072' "'#1057#1084#1055#1092#1052#1072#1093'" - '#1089#1091#1084#1084#1072' '#1087#1086#1088#1086#1075#1072' '#1076#1083#1103' '#1074#1079#1085#1086#1089#1086#1074' '#1074' '#1055#1060', '#1060#1057#1057', '#1060#1047
          WordWrap = True
        end
        object Label34: TLabel
          Left = 45
          Top = 270
          Width = 256
          Height = 34
          Alignment = taCenter
          AutoSize = False
          Caption = #1057#1083#1077#1076#1080#1090#1077' '#1079#1072' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1089#1090#1100#1102' '#1094#1080#1092#1088' '#1074' '#1090#1072#1073#1083#1080#1094#1077' "'#1062#1080#1092#1088#1099' '#1089' 2004 '#1075'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          WordWrap = True
        end
        object Label24: TLabel
          Left = 50
          Top = 147
          Width = 264
          Height = 45
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1057' '#1079#1072#1088#1072#1073#1086#1090#1082#1086#1074' '#1076#1086' "'#1057#1084#1055#1092#1052#1072#1093'" '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' 0.5 % '#1087#1086' '#1074#1080#1076#1091' 6501 ('#1089#1090#1072#1088#1099 +
            #1081' 372)'
          WordWrap = True
        end
        object Label25: TLabel
          Left = 53
          Top = 185
          Width = 256
          Height = 45
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1057' '#1079#1072#1088#1072#1073#1086#1090#1082#1086#1074' '#1086#1090' "'#1057#1084#1055#1092#1052#1072#1093'", '#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086', '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' 0.5 % '#1086#1090' '#1089 +
            #1091#1084#1084#1099' '#1087#1086#1088#1086#1075#1072' "'#1057#1084#1055#1092#1052#1072#1093'" '#1087#1086' '#1074#1080#1076#1091' 6501 ('#1089#1090#1072#1088#1099#1081' 372)'
          WordWrap = True
        end
      end
    end
    object tsPdnDo2004: TTabSheet
      Caption = #1055#1086#1076#1086#1093#1086#1076#1085#1099#1081' '#1076#1086' 2004 '#1075'.'
      object PanelPdnDo2004: TPanel
        Left = 82
        Top = 2
        Width = 475
        Height = 434
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object PanelLeft: TPanel
          Left = 2
          Top = 2
          Width = 193
          Height = 430
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 0
            Top = 196
            Width = 193
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            Beveled = True
            Color = clAqua
            ParentColor = False
          end
          object dbgrPdnMes: TDBGrid
            Left = 0
            Top = 0
            Width = 193
            Height = 196
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = dsrcPdnMes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = popMnu
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'MesGod'
                Title.Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' ('#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076')'
                Width = 156
                Visible = True
              end>
          end
          object dbgrPdN: TDBGrid
            Left = 0
            Top = 199
            Width = 193
            Height = 231
            Align = alBottom
            BorderStyle = bsNone
            Color = clBtnFace
            Constraints.MinHeight = 120
            DataSource = dsrcPdN
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = popMnu
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'POROG'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMM'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRC'
                Width = 47
                Visible = True
              end>
          end
        end
        object PanelMsgPdnDo2004: TPanel
          Left = 214
          Top = 53
          Width = 242
          Height = 324
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 7
            Top = 8
            Width = 233
            Height = 28
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1053#1059#1051#1071' '#1076#1086' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1087#1086#1076#1086#1093#1086#1076#1085#1099#1081' '#1085#1072#1083#1086#1075' '#1085#1077' '#1091#1076#1077 +
              #1088#1078#1080#1074#1072#1077#1090#1089#1103'.'
            WordWrap = True
          end
          object Label2: TLabel
            Left = 7
            Top = 35
            Width = 233
            Height = 57
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1076#1086' '#1074#1090#1086#1088#1086#1075#1086' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091#1084 +
              #1084#1072' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' '#1087 +
              #1077#1088#1074#1099#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label3: TLabel
            Left = 7
            Top = 90
            Width = 233
            Height = 55
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1090' '#1074#1090#1086#1088#1086#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1076#1086' '#1090#1088#1077#1090#1100#1077#1075#1086' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086') '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091 +
              #1084#1084#1072' '#1074#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1074#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' ' +
              #1074#1090#1086#1088#1086#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label4: TLabel
            Left = 7
            Top = 143
            Width = 233
            Height = 17
            Alignment = taCenter
            AutoSize = False
            Caption = #1048' '#1090'. '#1076'. ...'
            WordWrap = True
          end
          object Label5: TLabel
            Left = 7
            Top = 154
            Width = 233
            Height = 55
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1057' '#1089#1091#1084#1084' '#1086#1090' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1087#1086#1088#1086#1075#1072' '#1080' '#1074#1099#1096#1077' '#1091#1076#1077#1088#1078#1080#1074#1072#1077#1090#1089#1103' '#1055#1086#1089#1090#1057#1091#1084#1084#1072' '#1087#1086#1089#1083#1077#1076 +
              #1085#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1055#1088#1086#1094#1077#1085#1090' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1086#1090' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' '#1087#1086#1089#1083 +
              #1077#1076#1085#1080#1081' '#1087#1086#1088#1086#1075'.'
            WordWrap = True
          end
          object Label7: TLabel
            Left = 7
            Top = 212
            Width = 233
            Height = 94
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1053#1077' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1099' '#1079#1072' '#1042#1057#1045' '#1084#1077#1089#1103#1094#1099'. '#1044#1086#1089#1090#1072#1090#1086#1095#1085#1086' '#1080#1084#1077#1090#1100' '#1090 +
              #1086#1083#1100#1082#1086' '#1090#1072#1073#1083#1080#1094#1099' '#1090#1077#1093' '#1084#1077#1089#1103#1094#1077#1074', '#1082#1086#1075#1076#1072' '#1087#1088#1086#1080#1079#1086#1096#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1087#1086#1088#1086#1075#1072#1093' '#1080 +
              #1083#1080' '#1087#1086#1089#1090#1086#1103#1085#1085#1099#1093' '#1089#1091#1084#1084#1072#1093' '#1080#1083#1080' '#1074' '#1087#1088#1086#1094#1077#1085#1090#1072#1093'. '#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1089#1091#1084#1084 +
              #1099' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1073#1077#1088#1077#1090' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1091#1102' '#1090#1072#1073#1083#1080#1094#1091'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
        end
        object PanelAfterAddTbl: TPanel
          Left = 8
          Top = 338
          Width = 199
          Height = 86
          Color = clOlive
          TabOrder = 2
          Visible = False
          object sBtnBuSdelano: TSpeedButton
            Left = 87
            Top = 58
            Width = 107
            Height = 23
            Caption = #1041#1091#1076#1077#1090' '#1089#1076#1077#1083#1072#1085#1086' !'
            OnClick = sBtnBuSdelanoClick
          end
          object Memo1: TMemo
            Left = 7
            Top = 6
            Width = 185
            Height = 48
            Alignment = taCenter
            Lines.Strings = (
              #1048#1089#1087#1088#1072#1074#1100#1090#1077', '#1077#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1079#1072#1087#1080#1089#1080' '#1074' '
              #1085#1086#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '
              #1088#1091#1082#1086#1074#1086#1076#1103#1097#1080#1084#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080'.')
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      617
      29)
    object LabelActivePage: TLabel
      Left = 8
      Top = 8
      Width = 81
      Height = 13
      Caption = 'LabelActivePage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 539
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
    Left = 211
    Top = 224
  end
  object pop: TPopupMenu
    Left = 211
    Top = 192
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
  object qryPdnMes: TQuery
    OnCalcFields = qryPdnMesCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select distinct DtProc'
      'from Z_TblPdn'
      'where not (DtProc is null)'
      'order by DtProc')
    Left = 24
    Top = 208
    object qryPdnMesDTPROC: TDateTimeField
      DisplayWidth = 12
      FieldName = 'DTPROC'
    end
    object qryPdnMesMesGod: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Calculated = True
    end
  end
  object dsrcPdnMes: TDataSource
    DataSet = qryPdnMes
    Left = 40
    Top = 224
  end
  object qryPdN: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcPdnMes
    SQL.Strings = (
      'select * from Z_TblPdN'
      'where DtProc = :DtProc'
      'order by Porog ')
    Left = 16
    Top = 321
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
        Size = 8
      end>
    object qryPdNNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TBLPDN.NR'
    end
    object qryPdNDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_TBLPDN.DTPROC'
    end
    object qryPdNPOROG: TFloatField
      DisplayLabel = #1055#1086#1088#1086#1075
      FieldName = 'POROG'
      Origin = 'DbMain.Z_TBLPDN.POROG'
    end
    object qryPdNSMM: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1057#1091#1084#1084#1072
      FieldName = 'SMM'
      Origin = 'DbMain.Z_TBLPDN.SMM'
    end
    object qryPdNPRC: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'PRC'
      Origin = 'DbMain.Z_TBLPDN.PRC'
    end
  end
  object dsrcPdN: TDataSource
    DataSet = qryPdN
    Left = 32
    Top = 337
  end
  object qryPpsMes: TQuery
    OnCalcFields = qryPpsMesCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select distinct DtProc'
      'from Z_TblPPS'
      'where not (DtProc is null)'
      'order by DtProc')
    Left = 72
    Top = 208
    object DateTimeField1: TDateTimeField
      DisplayWidth = 12
      FieldName = 'DTPROC'
    end
    object StringField1: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Calculated = True
    end
  end
  object dsrcPpsMes: TDataSource
    DataSet = qryPpsMes
    Left = 88
    Top = 224
  end
  object qryPps: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcPpsMes
    SQL.Strings = (
      'select * from Z_TblPPS'
      'where DtProc = :DtProc'
      'order by Porog ')
    Left = 64
    Top = 320
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
      end>
    object qryPpsNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TBLPDN.NR'
    end
    object qryPpsDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_TBLPDN.DTPROC'
    end
    object qryPpsPOROG: TFloatField
      DisplayLabel = #1055#1086#1088#1086#1075
      FieldName = 'POROG'
      Origin = 'DbMain.Z_TBLPDN.POROG'
    end
    object qryPpsSMM: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1057#1091#1084#1084#1072
      FieldName = 'SMM'
      Origin = 'DbMain.Z_TBLPDN.SMM'
    end
    object qryPpsPRC: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'PRC'
      Origin = 'DbMain.Z_TBLPDN.PRC'
    end
  end
  object dsrcPps: TDataSource
    DataSet = qryPps
    Left = 80
    Top = 336
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 136
    Top = 176
    object popMnuHead: TMenuItem
      Caption = '== H e a d =='
      Enabled = False
    end
    object popAddMes: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      Hint = 
        #1058#1072#1073#1083#1080#1094#1072' '#1076#1086#1073#1072#1074#1083#1103#1077#1090#1089#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077#1084' '#1073#1083#1080#1078#1072#1081#1096#1077#1075#1086' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1093' '#1084#1077#1089#1103#1094#1077 +
        #1074' '#1080' '#1079#1072#1090#1077#1084', '#1087#1088#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080', '#1088#1077#1076#1072#1082#1090#1080#1088#1091#1077#1090#1089#1103
      OnClick = popAddMesClick
    end
    object popDelMes: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      Hint = #1059#1076#1072#1083#1103#1077#1090#1089#1103' '#1090#1072#1073#1083#1080#1094#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnClick = popDelMesClick
    end
    object popMnuEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = popMnuEdtClick
    end
    object popMnuAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = popMnuAddClick
    end
    object popMnuDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = popMnuDelClick
    end
  end
  object qryTmp: TQuery
    Left = 168
    Top = 280
  end
  object qry2Tmp: TQuery
    Left = 200
    Top = 280
  end
  object qryNePpsMes: TQuery
    OnCalcFields = qryNePpsMesCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select distinct DtProc'
      'from Z_TblPF'
      'where not (DtProc is null)'
      'order by DtProc')
    Left = 128
    Top = 208
    object qryNePpsMesDTPROC: TDateTimeField
      DisplayWidth = 12
      FieldName = 'DTPROC'
    end
    object qryNePpsMesMesGod: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Calculated = True
    end
  end
  object dsrcNePpsMes: TDataSource
    DataSet = qryNePpsMes
    Left = 144
    Top = 224
  end
  object qryNePpsPF: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcNePpsMes
    SQL.Strings = (
      'select * from Z_TblPF'
      'where DtProc = :DtProc'
      'order by Porog ')
    Left = 112
    Top = 320
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
      end>
    object qryNePpsPFNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TBLPDN.NR'
    end
    object qryNePpsPFDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_TBLPDN.DTPROC'
    end
    object qryNePpsPFPOROG: TFloatField
      DisplayLabel = #1055#1086#1088#1086#1075
      FieldName = 'POROG'
      Origin = 'DbMain.Z_TBLPDN.POROG'
    end
    object qryNePpsPFSMM: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1057#1091#1084#1084#1072
      FieldName = 'SMM'
      Origin = 'DbMain.Z_TBLPDN.SMM'
    end
    object qryNePpsPFPRC: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'PRC'
      Origin = 'DbMain.Z_TBLPDN.PRC'
    end
  end
  object dsrcNePpsPF: TDataSource
    DataSet = qryNePpsPF
    Left = 128
    Top = 336
  end
end
