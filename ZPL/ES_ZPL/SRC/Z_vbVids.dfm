object FormVbVidu: TFormVbVidu
  Left = 265
  Top = 124
  Width = 800
  Height = 595
  BorderIcons = [biSystemMenu]
  Caption = 'FormVbVidu'
  Color = clBtnFace
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 595
  Constraints.MinWidth = 700
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 568
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #1057#1095#1077#1090#1072' '#1080' '#1074#1080#1076#1099
      object LabelObjUvaga: TLabel
        Left = 0
        Top = 0
        Width = 784
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = #1042#1085#1080#1084#1072#1085#1080#1077'!  '#1053#1072' 2-'#1081' '#1089#1090#1088'. '#1087#1086#1084#1077#1095#1077#1085#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081': 12 '
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object PanelRight: TPanel
        Left = 630
        Top = 13
        Width = 154
        Height = 524
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          154
          524)
        object LabelCntRec: TLabel
          Left = 5
          Top = 242
          Width = 144
          Height = 13
          Alignment = taCenter
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = #1042#1089#1077#1075#1086' '#1074#1080#1076#1086#1074' 567'
        end
        object LabelCntMetok: TLabel
          Left = 5
          Top = 255
          Width = 144
          Height = 13
          Alignment = taCenter
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = #1055#1086#1084#1077#1095#1077#1085#1086' 567'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label1: TLabel
          Left = 7
          Top = 268
          Width = 141
          Height = 43
          Alignment = taCenter
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 
            #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1080#1083#1080' '#1082#1083#1072#1074#1080#1096#1077#1081' <F8> '#1084#1086#1078#1085#1086' '#1087#1086#1084#1077#1090#1080#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086 +
            ' '#1074#1080#1076#1086#1074'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object sBtnF8Vids: TSpeedButton
          Left = 85
          Top = 281
          Width = 23
          Height = 16
          Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091
          Anchors = [akRight, akBottom]
          Caption = 'F8'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = dbgrViduDblClick
        end
        object sBtnDelMetki: TSpeedButton
          Left = 12
          Top = 468
          Width = 133
          Height = 25
          Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1077' '#1084#1077#1090#1082#1080
          Anchors = [akRight, akBottom]
          Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnDelMetkiClick
        end
        object sBtnSetMetkiAll: TSpeedButton
          Left = 12
          Top = 442
          Width = 133
          Height = 25
          Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1074#1080#1076#1099
          Anchors = [akRight, akBottom]
          Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnSetMetkiAllClick
        end
        object Label3: TLabel
          Left = 7
          Top = 309
          Width = 141
          Height = 81
          Alignment = taCenter
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 
            #1045#1089#1083#1080' '#1085#1077#1090' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093' '#1074#1080#1076#1086#1074', '#1090#1086', '#1085#1077#1079#1072#1074#1080#1089#1080#1084#1086' '#1086#1090' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1087#1077#1088#1077#1082#1083#1102#1095#1072 +
            #1090#1077#1083#1077#1081' "'#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1074#1080#1076#1072#1084'", '#1074#1099#1073#1086#1088#1082#1072' '#1073#1091#1076#1077#1090' '#1076#1077#1083#1072#1090#1100#1089#1103' '#1087#1086' '#1074#1089#1077#1084' '#1074#1080#1076#1072#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object Label2: TLabel
          Left = 11
          Top = 28
          Width = 139
          Height = 43
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1042' '#1074#1077#1088#1093#1085#1077#1081' '#1083#1077#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1080#1085' '#1080#1079' '#1089#1095#1077#1090#1086#1074' - '#1080#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086 +
            #1074#1072#1085#1080#1103'.'
          WordWrap = True
        end
        object Label4: TLabel
          Left = 11
          Top = 175
          Width = 135
          Height = 67
          Alignment = taCenter
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = 
            #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1074#1099#1073#1086#1088#1082#1080' '#1080#1083#1080', '#1085#1072#1086#1073#1086#1088#1086#1090', '#1074#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1074#1099#1073#1086#1088#1082#1091' '#1090#1086#1083#1100#1082#1086' '#1079#1072 +
            #1076#1072#1085#1085#1099#1077' '#1074#1080#1076#1099', '#1084#1086#1078#1085#1086' '#1074' '#1085#1080#1078#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1077'.'
          WordWrap = True
        end
        object sBtnGoToObj: TSpeedButton
          Left = 3
          Top = 1
          Width = 150
          Height = 25
          Hint = 
            #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1089#1090#1088'.2 '#1076#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1086#1090' '#1082#1086#1090#1086#1088#1099#1093' '#1085#1072#1095#1080#1089#1083#1077#1085#1099 +
            ' '#1074#1099#1073#1080#1088#1072#1077#1084#1099#1077' '#1089#1091#1084#1084#1099
          Caption = #1053#1072' '#1089#1090#1088'.2 ( '#1087#1086#1076#1088#1072#1079#1076'.)'
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
            4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
            0000334A23333364A233333F38333333F383333300003366A6333342A2333333
            F383333F3383333300003334A263364AA3333333F338333F3833333300003336
            4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
            8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
            4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
            0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
            F333333383333333000033334AAA2233333333333F3333383333333300003333
            34A223333333333333F333833333333300003333334A443333333333333F3833
            33333333000033333342A63333333333333F33833333333300003333334AA633
            33333333333F3383333333330000333333666333333333333338883333333333
            0000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnGoToObjClick
        end
        object Label6: TLabel
          Left = 7
          Top = 69
          Width = 139
          Height = 68
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1042' '#1074#1077#1088#1093#1085#1077#1081' '#1087#1088#1072#1074#1086#1081' - '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1084#1086#1078#1085#1086' '#1074#1099#1076#1077#1083#1080#1090#1100' '#1085#1077#1086#1073#1093#1086#1076#1080 +
            #1084#1099#1077' '#1057#1091#1073#1057#1095#1077#1090#1072' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1089#1095#1077#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object LabelCntSelSchBu: TLabel
          Left = 11
          Top = 136
          Width = 139
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'LabelCntSelSchBu'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object bBtnOk: TBitBtn
          Left = 3
          Top = 497
          Width = 75
          Height = 25
          Hint = #1042#1074#1086#1076' '#1079#1072#1076#1072#1085#1085#1099#1093' '#1091#1089#1083#1086#1074#1080#1081' '#1074#1099#1073#1086#1088#1082#1080
          Anchors = [akRight, akBottom]
          Caption = #1042#1074#1086#1076
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Kind = bkOK
        end
        object bBtnCancel: TBitBtn
          Left = 79
          Top = 497
          Width = 75
          Height = 25
          Hint = #1054#1090#1082#1072#1079' '#1086#1090' '#1074#1074#1086#1076#1072
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1082#1072#1079
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Kind = bkCancel
        end
        object grBoxVids: TGroupBox
          Left = 10
          Top = 389
          Width = 136
          Height = 50
          Hint = #1050#1072#1082' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077' '#1084#1077#1090#1082#1072#1084#1080
          Anchors = [akRight, akBottom]
          Caption = ' '#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1074#1080#1076#1072#1084': '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          object rBtnVidsIncl: TRadioButton
            Left = 6
            Top = 14
            Width = 100
            Height = 17
            Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1084' '#1074#1080#1076#1072#1084
            Caption = '- '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1084
            Checked = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TabStop = True
          end
          object rBtnVidsExcl: TRadioButton
            Left = 6
            Top = 31
            Width = 122
            Height = 13
            Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082#1086' '#1074#1089#1077#1084' '#1074#1080#1076#1072#1084', '#1082#1088#1086#1084#1077' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093
            Caption = '- '#1082#1088#1086#1084#1077' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
      end
      object PanelSch: TPanel
        Left = 0
        Top = 13
        Width = 630
        Height = 524
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 205
          Width = 630
          Height = 3
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object dbgrVidu: TDBGrid
          Left = 0
          Top = 208
          Width = 630
          Height = 316
          Hint = 
            #1042#1080#1076#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081', '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1077' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' ('#1082#1088#1086#1084#1077' "'#1076#1077#1090#1089#1082#1080#1093'" '#1080' "'#1057#1086 +
            #1094#1057#1090#1088#1072#1093#1086#1074#1089#1082#1080#1093'")'
          Align = alClient
          Color = clCream
          DataSource = dsrcVidu
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrViduDrawColumnCell
          OnDblClick = dbgrViduDblClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          OnKeyDown = dbgrViduKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'VIDN'
              ReadOnly = True
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHVIDN'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMVIDN'
              ReadOnly = True
              Width = 213
              Visible = True
            end>
        end
        object PanelSchTop: TPanel
          Left = 0
          Top = 0
          Width = 630
          Height = 205
          Align = alTop
          BevelOuter = bvNone
          Caption = 'PanelSchTop'
          Constraints.MaxHeight = 250
          Constraints.MinHeight = 185
          TabOrder = 1
          object dbgrSchBU: TDBGrid
            Left = 343
            Top = 0
            Width = 287
            Height = 205
            Align = alClient
            Color = clCream
            DataSource = dsrcSchBU
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrSchBUDrawColumnCell
            OnDblClick = dbgrSchBUDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'PSCH'
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SCHBU'
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KdSch'
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNT'
                Width = 47
                Visible = True
              end>
          end
          object PanelSchTopLeft: TPanel
            Left = 0
            Top = 0
            Width = 343
            Height = 205
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              343
              205)
            object dbgrPSch: TDBGrid
              Left = 0
              Top = 0
              Width = 343
              Height = 142
              Hint = 
                #1057#1095#1077#1090#1072' - '#1080#1089#1090#1086#1095#1085#1080#1082#1080' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1073#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1074' '#1090 +
                #1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
              Align = alTop
              Anchors = [akLeft, akTop, akRight, akBottom]
              Color = clCream
              DataSource = dsrcPSch
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnEnter = dbGridEnter
              OnExit = dbGridExit
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PSCH'
                  Width = 68
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NmPSch'
                  Width = 169
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KdPSch'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CNT'
                  Width = 32
                  Visible = True
                end>
            end
            object grBoxScheta: TGroupBox
              Left = 188
              Top = 145
              Width = 149
              Height = 57
              Hint = #1050#1072#1082' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077' '#1084#1077#1090#1082#1072#1084#1080
              Anchors = [akRight, akBottom]
              Caption = ' '#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1057#1091#1073#1057#1095#1077#1090#1072#1084': '
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              object rBtnSchIncl: TRadioButton
                Left = 6
                Top = 17
                Width = 100
                Height = 17
                Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1084' '#1057#1091#1073#1057#1095#1077#1090#1072#1084
                Caption = '- '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1084
                Checked = True
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TabStop = True
              end
              object rBtnSchExcl: TRadioButton
                Left = 6
                Top = 36
                Width = 122
                Height = 13
                Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082#1086' '#1074#1089#1077#1084' '#1057#1091#1073#1057#1095#1077#1090#1072#1084', '#1082#1088#1086#1084#1077' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093
                Caption = '- '#1082#1088#1086#1084#1077' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
            end
          end
        end
      end
    end
    object ts2: TTabSheet
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' "'#1086#1090'"'
      ImageIndex = 1
      DesignSize = (
        784
        537)
      object LabelCntObj: TLabel
        Left = 642
        Top = 196
        Width = 144
        Height = 13
        Alignment = taCenter
        Anchors = [akRight, akBottom]
        AutoSize = False
        Caption = #1042#1089#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076'. 567'
      end
      object LabelCntSelObj: TLabel
        Left = 642
        Top = 209
        Width = 144
        Height = 13
        Alignment = taCenter
        Anchors = [akRight, akBottom]
        AutoSize = False
        Caption = #1055#1086#1084#1077#1095#1077#1085#1086'. 567'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 644
        Top = 222
        Width = 141
        Height = 96
        Alignment = taCenter
        Anchors = [akRight, akBottom]
        AutoSize = False
        Caption = 
          #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1080#1083#1080' '#1082#1083#1072#1074#1080#1096#1077#1081' <F8> '#1084#1086#1078#1085#1086' '#1087#1086#1084#1077#1090#1080#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086 +
          ' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081'. '#1055#1086#1084#1077#1095#1077#1085#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1074#1099#1076#1077#1083#1103#1102#1090#1089#1103' '#1094#1074#1077#1090#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object sBtnF8Obj: TSpeedButton
        Left = 722
        Top = 235
        Width = 23
        Height = 16
        Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091
        Anchors = [akRight, akBottom]
        Caption = 'F8'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = dbgrNuObjDblClick
      end
      object Label8: TLabel
        Left = 644
        Top = 322
        Width = 141
        Height = 96
        Alignment = taCenter
        Anchors = [akRight, akBottom]
        AutoSize = False
        Caption = 
          #1045#1089#1083#1080' '#1085#1077#1090' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1090#1086', '#1085#1077#1079#1072#1074#1080#1089#1080#1084#1086' '#1086#1090' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1087 +
          #1077#1088#1077#1082#1083#1102#1095#1072#1090#1077#1083#1077#1081' "'#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1087#1086#1076#1088#1072#1079#1076'.", '#1074#1099#1073#1086#1088#1082#1072' '#1073#1091#1076#1077#1090' '#1076#1077#1083#1072#1090#1100#1089#1103' '#1087#1086' ' +
          #1074#1089#1077#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object sBtnObjSelAll: TSpeedButton
        Left = 649
        Top = 483
        Width = 133
        Height = 25
        Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        Anchors = [akRight, akBottom]
        Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnObjSelAllClick
      end
      object sBtnObjUnSelAll: TSpeedButton
        Left = 649
        Top = 511
        Width = 133
        Height = 25
        Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1077' '#1084#1077#1090#1082#1080
        Anchors = [akRight, akBottom]
        Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnObjUnSelAllClick
      end
      object Label5: TLabel
        Left = 655
        Top = 59
        Width = 117
        Height = 50
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1086#1090' '#1082#1086#1090#1086#1088#1099#1093' '#1073#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1099' '#1089#1091#1084#1084#1099'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object sBtnGoToVids: TSpeedButton
        Left = 634
        Top = 16
        Width = 150
        Height = 25
        Hint = 
          #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1089#1090#1088'.2 '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1074#1080#1076#1086#1074' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1089#1095#1077#1090#1086#1074'-'#1080#1089#1090#1086#1095#1085#1080#1082#1086#1074 +
          ' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        Anchors = [akTop, akRight]
        Caption = #1053#1072' '#1089#1090#1088'.1 ('#1057#1095#1077#1090#1072' '#1080' '#1074#1080#1076#1099')'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
          44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
          00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
          33833F333383F33300003333AA463362A433333333383F333833F33300003333
          6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
          33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
          6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
          000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
          333383333333F3330000333333322AAA4333333333333833333F333300003333
          333322A4333333333333338333F333330000333333344A433333333333333338
          3F333333000033333336A24333333333333333833F333333000033333336AA43
          33333333333333833F3333330000333333336663333333333333333888333333
          0000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sBtnGoToVidsClick
      end
      object LabelVidsUvaga: TLabel
        Left = 0
        Top = 0
        Width = 784
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = #1042#1085#1080#1084#1072#1085#1080#1077'!  '#1053#1072' 1-'#1081' '#1089#1090#1088'. '#1087#1086#1084#1077#1095#1077#1085#1086' '#1074#1080#1076#1086#1074': 12 '
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbgrNuObj: TDBGrid
        Left = 0
        Top = 13
        Width = 630
        Height = 524
        Hint = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1086#1090' '#1082#1086#1090#1086#1088#1099#1093' '#1073#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsrcNuObj
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrNuObjDrawColumnCell
        OnDblClick = dbgrNuObjDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        OnKeyDown = dbgrNuObjKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShObj'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmObj'
            Width = 149
            Visible = True
          end>
      end
      object grBoxObj: TGroupBox
        Left = 647
        Top = 422
        Width = 136
        Height = 57
        Hint = #1050#1072#1082' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077' '#1084#1077#1090#1082#1072#1084#1080
        Anchors = [akRight, akBottom]
        Caption = ' '#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1087#1086#1076#1088#1072#1079#1076'. '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object rBtnObjIncl: TRadioButton
          Left = 6
          Top = 17
          Width = 100
          Height = 17
          Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
          Caption = '- '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1084
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = True
        end
        object rBtnObjExcl: TRadioButton
          Left = 6
          Top = 36
          Width = 122
          Height = 13
          Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082#1086' '#1074#1089#1077#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084', '#1082#1088#1086#1084#1077' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093
          Caption = '- '#1082#1088#1086#1084#1077' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1093
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
  end
  object dsrcVidu: TDataSource
    DataSet = qryVidu
    Left = 40
    Top = 336
  end
  object qryVidu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select VidN, ShVidN, NmVidN, Cast(null as Char(1)) as Metka,'
      ' Cast(null as Numeric) as Prc from z_kdVidN'
      ' where (HsCh = "F") and ((VidN < "2600") or (VidN = "2603"))'
      ' order by AIndx')
    Left = 24
    Top = 320
    object qryViduVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryViduSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryViduNMVIDN: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074#1080#1076#1072
      FieldName = 'NMVIDN'
      Size = 64
    end
    object qryViduPRC: TIntegerField
      DisplayLabel = '% '#1086#1090' '#1057#1091#1084#1084
      FieldName = 'PRC'
    end
    object qryViduMETKA: TStringField
      FieldName = 'METKA'
      FixedChar = True
      Size = 1
    end
  end
  object qryPSch: TQuery
    OnCalcFields = qryPSchCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select PSCH, count(NR) as CNT, Round(Sum(Summa), 2) as SMM '
      'from vinuMain where dtProc = "06/01/2017" and VidN < "8000"'
      'group by PSCH')
    Left = 16
    Top = 80
    object qryPSchPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      DisplayWidth = 12
      FieldName = 'PSCH'
      Size = 10
    end
    object qryPSchCNT: TIntegerField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      DisplayWidth = 10
      FieldName = 'CNT'
    end
    object qryPSchSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SMM'
      DisplayFormat = '# ###.00'
    end
    object qryPSchKdPSch: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'KdPSch'
      Calculated = True
    end
    object qryPSchNmPSch: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmPSch'
      Size = 85
      Calculated = True
    end
    object qryPSchSynth: TStringField
      FieldName = 'Synth'
      Size = 1
    end
  end
  object dsrcPSch: TDataSource
    DataSet = qryPSch
    OnDataChange = dsrcPSchDataChange
    Left = 48
    Top = 88
  end
  object qryNuObj: TQuery
    OnCalcFields = qryNuObjCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select distinct kdobj from z_nu '
      'where dtProc = '#39'11/01/2006'#39)
    Left = 172
    Top = 320
    object qryNuObjKDOBJ: TSmallintField
      DisplayLabel = #1050#1086#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryNuObjShObj: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 15
      Calculated = True
    end
    object qryNuObjNmObj: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldKind = fkCalculated
      FieldName = 'NmObj'
      Size = 65
      Calculated = True
    end
  end
  object dsrcNuObj: TDataSource
    DataSet = qryNuObj
    Left = 184
    Top = 336
  end
  object qrySchBU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select  PSCH, SchBU, Count(*) as CNT'
      'from ViNu_Main where dtProc = '#39'11/01/2006'#39' and VidN < '#39'6000'#39
      'group by PSCH, SchBU')
    Left = 324
    Top = 144
  end
  object cdsSchBU: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SCHBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CNT'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'OnPSchSchBU'
        CaseInsFields = 'PSCH;SCHBU'
        Fields = 'PSCH;SCHBU'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsSchBUCalcFields
    Left = 380
    Top = 168
    object cdsSchBUPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      DisplayWidth = 8
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsSchBUSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095#1077#1090
      DisplayWidth = 9
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsSchBUKdSch: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'KdSch'
      Calculated = True
    end
    object cdsSchBUCNT: TIntegerField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      DisplayWidth = 11
      FieldName = 'CNT'
    end
  end
  object dsrcSchBU: TDataSource
    DataSet = cdsSchBU
    Left = 400
    Top = 192
  end
  object dspSchBU: TDataSetProvider
    DataSet = qrySchBU
    Left = 340
    Top = 160
  end
  object qryClc: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Kd_SBU where Sch_17 = :cPSch')
    Left = 124
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cPSch'
        ParamType = ptUnknown
      end>
  end
  object qryClc2: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Kd_SBU where Sch_17 = :cSchBU')
    Left = 460
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cSchBU'
        ParamType = ptUnknown
      end>
  end
end
