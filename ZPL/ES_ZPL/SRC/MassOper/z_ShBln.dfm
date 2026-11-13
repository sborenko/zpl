object FormShowBln: TFormShowBln
  Left = 359
  Top = 157
  Width = 767
  Height = 598
  BorderIcons = [biSystemMenu]
  Caption = 'FormShowBln'
  Color = clBtnFace
  Constraints.MaxWidth = 1500
  Constraints.MinHeight = 450
  Constraints.MinWidth = 652
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 759
    Height = 571
    ActivePage = tsBln
    Align = alClient
    TabOrder = 0
    object tsBln: TTabSheet
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
      object Splitter2: TSplitter
        Left = 380
        Top = 30
        Height = 513
        Beveled = True
        Color = clGreen
        MinSize = 100
        ParentColor = False
      end
      object dbgrVBln: TDBGrid
        Left = 0
        Top = 30
        Width = 380
        Height = 513
        Hint = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
        Align = alLeft
        Color = 14540270
        Constraints.MaxWidth = 500
        Constraints.MinWidth = 380
        DataSource = dsrcVBln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        OnDrawColumnCell = dbgrVBlnDrawColumnCell
        OnDblClick = dbgrVBlnDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERLIST'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRLIST'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNTDAYS'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRZ'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTZ'
            Width = 38
            Visible = True
          end>
      end
      object PanelRight: TPanel
        Left = 383
        Top = 30
        Width = 368
        Height = 513
        Align = alClient
        BevelOuter = bvNone
        Constraints.MinWidth = 360
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 325
          Width = 368
          Height = 3
          Cursor = crVSplit
          Align = alTop
          Beveled = True
          Color = clGreen
          ParentColor = False
        end
        object dbgrRBln: TDBGrid
          Left = 0
          Top = 190
          Width = 368
          Height = 135
          Hint = #1057#1091#1084#1084#1099' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
          Align = alTop
          Color = 15654365
          DataSource = dsrcRBln
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'ZAMESGOD'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SMZARABOTKA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOEFZP'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNTDAYS'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmZpKoef'
              Width = 91
              Visible = True
            end>
        end
        object dbgrOtkl: TDBGrid
          Left = 0
          Top = 328
          Width = 368
          Height = 185
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' ('#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081')'
          Align = alClient
          Color = 14544605
          DataSource = dsrcOtkl
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
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
              FieldName = 'VIDN'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHVIDN'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAMESGOD'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShObj'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShKatP'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCHBU'
              Width = 23
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Width = 14
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 40
              Visible = True
            end>
        end
        object PanelRTop: TPanel
          Left = 0
          Top = 0
          Width = 368
          Height = 190
          Align = alTop
          BevelOuter = bvNone
          Constraints.MinWidth = 350
          TabOrder = 2
          OnResize = PanelRTopResize
          object PanelKart: TPanel
            Left = 5
            Top = 4
            Width = 342
            Height = 183
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 27
              Width = 49
              Height = 13
              Caption = #8470' '#1083#1080#1089#1090#1082#1072
              FocusControl = dbeNrList
            end
            object Label5: TLabel
              Left = 8
              Top = 75
              Width = 64
              Height = 13
              Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
              FocusControl = dbeDtBeg
            end
            object Label6: TLabel
              Left = 266
              Top = 75
              Width = 24
              Height = 13
              Caption = #1076#1085#1077#1081
              FocusControl = dbeCntDays
            end
            object Label7: TLabel
              Left = 156
              Top = 75
              Width = 32
              Height = 13
              Caption = #1086#1082#1086#1085#1095'.'
              FocusControl = dbeDtEnd
            end
            object Label8: TLabel
              Left = 168
              Top = 27
              Width = 30
              Height = 13
              Caption = #1042#1080#1076' '#1053
              FocusControl = dbeVidN
            end
            object Label9: TLabel
              Left = 103
              Top = 97
              Width = 48
              Height = 13
              Caption = '% '#1086#1087#1083#1072#1090#1099
              FocusControl = dbeProcOpl
            end
            object Label10: TLabel
              Left = 45
              Top = 158
              Width = 63
              Height = 13
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              FocusControl = dbeNotes
            end
            object LabelAlgRasch: TLabel
              Left = 296
              Top = 10
              Width = 33
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'LabelAlgRasch'
              Visible = False
            end
            object Label2: TLabel
              Left = 8
              Top = 97
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = #1057#1088#1044#1085'.'
            end
            object Label4: TLabel
              Left = 195
              Top = 97
              Width = 70
              Height = 13
              Caption = #1057#1091#1084#1084#1072' '#1086#1073#1097#1072#1103
            end
            object dbtFamIO: TDBText
              Left = 8
              Top = 5
              Width = 327
              Height = 17
              Alignment = taCenter
              DataField = 'FamIO'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object dbtOldKdVidN: TDBText
              Left = 218
              Top = 27
              Width = 28
              Height = 17
              Hint = #1057#1090#1072#1088#1099#1081' '#1074#1080#1076
              Alignment = taCenter
              DataField = 'OLDKDVIDN'
              DataSource = dsrcVBln
              ParentShowHint = False
              ShowHint = True
            end
            object dbtSpec_NR: TDBText
              Left = 262
              Top = 5
              Width = 71
              Height = 17
              Hint = 'Spec_NR'
              Alignment = taRightJustify
              DataField = 'SPEC_NR'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clPurple
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object LabelPredNr: TLabel
              Left = 40
              Top = 51
              Width = 98
              Height = 13
              Caption = #1055#1088#1086#1076#1086#1083#1078'.'#1083#1080#1089#1090#1082#1072' '#8470
              FocusControl = dbePredNr
            end
            object LabelPredDt: TLabel
              Left = 232
              Top = 51
              Width = 11
              Height = 13
              Caption = #1086#1090
              FocusControl = dbePredDt
            end
            object Label11: TLabel
              Left = 5
              Top = 119
              Width = 53
              Height = 13
              Caption = #1057#1090#1072#1078' '#1086#1073#1097'.'
            end
            object Label12: TLabel
              Left = 128
              Top = 121
              Width = 41
              Height = 13
              Caption = #1057#1090#1072#1078' 12'
            end
            object Label13: TLabel
              Left = 235
              Top = 119
              Width = 48
              Height = 13
              Caption = '% '#1086#1087#1083#1072#1090#1099
            end
            object dbeAlgRasch: TDBEdit
              Left = 223
              Top = 4
              Width = 19
              Height = 21
              Color = clCream
              DataField = 'ALGRASCH'
              DataSource = dsrcVBln
              TabOrder = 14
              Visible = False
            end
            object dbeNrList: TDBEdit
              Left = 92
              Top = 24
              Width = 73
              Height = 21
              Color = clCream
              DataField = 'NRLIST'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object dbeDtBeg: TDBEdit
              Left = 83
              Top = 72
              Width = 71
              Height = 21
              Color = clCream
              DataField = 'DTBEG'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
            object dbeCntDays: TDBEdit
              Left = 298
              Top = 72
              Width = 37
              Height = 21
              Hint = #1050'-'#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1090#1076#1085#1077#1081
              Color = clCream
              DataField = 'CNTDAYS'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
            end
            object dbeDtEnd: TDBEdit
              Left = 189
              Top = 72
              Width = 71
              Height = 21
              Color = clCream
              DataField = 'DTEND'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
            end
            object dbeVidN: TDBEdit
              Left = 199
              Top = 24
              Width = 39
              Height = 21
              Color = clCream
              DataField = 'VIDN'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object dbeProcOpl: TDBEdit
              Left = 155
              Top = 94
              Width = 36
              Height = 21
              Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099
              Color = clCream
              DataField = 'PROCOPL'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
            end
            object dbeNotes: TDBEdit
              Left = 112
              Top = 155
              Width = 223
              Height = 21
              Color = clCream
              DataField = 'NOTES'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 13
            end
            object dbeShVidN: TDBEdit
              Left = 248
              Top = 24
              Width = 87
              Height = 21
              Color = clCream
              DataField = 'ShVidN'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object dbeSmSrdn: TDBEdit
              Left = 45
              Top = 94
              Width = 52
              Height = 21
              Hint = #1055#1088#1080#1085#1103#1090#1072#1103' '#1082' '#1088#1072#1089#1095#1077#1090' '#1089#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086
              DataField = 'SMSRDN'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
            end
            object dbeSmBln: TDBEdit
              Left = 268
              Top = 94
              Width = 67
              Height = 21
              Hint = #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1084#1091
              DataField = 'SMBLN'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
            end
            object dbePredNr: TDBEdit
              Left = 144
              Top = 48
              Width = 81
              Height = 21
              TabStop = False
              DataField = 'PredNR'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object dbePredDt: TDBEdit
              Left = 249
              Top = 48
              Width = 86
              Height = 21
              TabStop = False
              DataField = 'PredDt'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
            end
            object dbChBoxFirst5: TDBCheckBox
              Left = 128
              Top = 138
              Width = 206
              Height = 16
              TabStop = False
              Alignment = taLeftJustify
              Caption = #1055#1077#1088#1074#1099#1077' 5 '#1076#1085#1077#1081' '#1079#1072' '#1089#1095#1077#1090' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
              DataField = 'DAY5FIRST'
              DataSource = dsrcVBln
              TabOrder = 8
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbeStgCmn: TDBEdit
              Left = 62
              Top = 116
              Width = 51
              Height = 21
              DataField = 'STGCMN'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
            end
            object dbeStg12: TDBEdit
              Left = 172
              Top = 116
              Width = 51
              Height = 21
              DataField = 'STG12'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 16
            end
            object dbePrcOpl: TDBEdit
              Left = 286
              Top = 116
              Width = 50
              Height = 21
              DataField = 'PROCOPL'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 17
            end
            object dbeSerList: TDBEdit
              Left = 58
              Top = 24
              Width = 35
              Height = 21
              DataField = 'SERLIST'
              DataSource = dsrcVBln
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 30
        Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1076#1083#1103' '#1079#1072#1103#1074#1082#1080' '#1074' '#1060#1057#1057
        Align = alTop
        Anchors = [akTop, akRight]
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        DesignSize = (
          751
          30)
        object sBtnAllMes: TSpeedButton
          Left = 4
          Top = 2
          Width = 156
          Height = 25
          Hint = #1042#1099#1074#1086#1076#1080#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1080#1079' '#1041#1044' '#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' 12 '#1084#1077#1089#1103#1094#1077#1074
          GroupIndex = 1
          Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' 12 '#1084#1077#1089#1103#1094#1077#1074
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
            FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
            FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
            FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
            00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
            55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
            5555777577775755555550FBFB0555555555575FFF7555555555570000755555
            5555557777555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnAllMesClick
        end
        object sBtnCurMes: TSpeedButton
          Left = 164
          Top = 2
          Width = 113
          Height = 25
          Hint = #1042#1099#1074#1086#1076#1080#1090#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
          GroupIndex = 1
          Down = True
          Caption = #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1080#1081
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnCurMesClick
        end
        object LabelSortInf: TLabel
          Left = 372
          Top = 2
          Width = 70
          Height = 13
          Caption = 'LabelSortInf'
          Transparent = True
        end
        object LabelFilter: TLabel
          Left = 372
          Top = 15
          Width = 116
          Height = 13
          Caption = #1060#1080#1083#1100#1090#1088' '#1085#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object sBtnPrt: TSpeedButton
          Left = 513
          Top = 2
          Width = 67
          Height = 25
          Hint = #1042#1080#1076#1080#1090' '#1085#1077' '#1090#1086#1083#1100#1082#1086' "'#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1077'" '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1095#1072#1090#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnPrtClick
        end
        object Label1: TLabel
          Left = 299
          Top = 2
          Width = 55
          Height = 13
          Caption = #1047#1072#1087#1080#1089#1077#1081':'
        end
        object LabelCountRec: TLabel
          Left = 286
          Top = 15
          Width = 74
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'LabelCountRec'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbtnF8: TSpeedButton
          Left = 481
          Top = 2
          Width = 25
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'F8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbtnF8Click
        end
        object bBtnClose: TBitBtn
          Left = 659
          Top = 2
          Width = 78
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          OnClick = bBtnCloseClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          Spacing = 0
        end
        object sbtnHlp: TBitBtn
          Left = 634
          Top = 2
          Width = 22
          Height = 25
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnClick = sbtnHlpClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
            33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
            FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
            FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
            FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
            FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
            FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
            3333333773FFFF77333333333FBFBF3333333333377777333333}
          NumGlyphs = 2
        end
      end
      object lbxF8: TListBox
        Left = 144
        Top = 144
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
    object tsPgr: TTabSheet
      Caption = #1055#1086#1075#1088#1077#1073#1072#1083#1100#1085#1099#1077
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 30
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          751
          30)
        object LabelSortInfPgr: TLabel
          Left = 388
          Top = 10
          Width = 57
          Height = 13
          Caption = 'LabelSortInf'
          Transparent = True
        end
        object sBtnPrt2: TSpeedButton
          Left = 240
          Top = 2
          Width = 78
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1095#1072#1090#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnPrt2Click
        end
        object Label16: TLabel
          Left = 299
          Top = 2
          Width = 46
          Height = 13
          Caption = #1047#1072#1087#1080#1089#1077#1081':'
        end
        object labelCountRecPgr: TLabel
          Left = 286
          Top = 15
          Width = 74
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'LabelCountRec'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sBtnF8_2: TSpeedButton
          Left = 206
          Top = 2
          Width = 25
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'F8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sBtnF8_2Click
        end
        object bBtnClose2: TBitBtn
          Left = 390
          Top = 2
          Width = 78
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          OnClick = bBtnCloseClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          Spacing = 0
        end
        object bBtnHlp2: TBitBtn
          Left = 359
          Top = 2
          Width = 22
          Height = 25
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnClick = sbtnHlpClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
            33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
            FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
            FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
            FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
            FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
            FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
            3333333773FFFF77333333333FBFBF3333333333377777333333}
          NumGlyphs = 2
        end
      end
      object dbgrPgr: TDBGrid
        Left = 0
        Top = 30
        Width = 751
        Height = 513
        Align = alClient
        Color = 14544605
        DataSource = dsrcPgr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = popPgr
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPgrDrawColumnCell
        OnDblClick = sBtnF8_2Click
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPD'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTDOC'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERDOC'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NDOC'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDP'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAMP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMAP'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCHP'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTZ'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRZ'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRACT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTACT'
            Visible = True
          end>
      end
      object lbxF8_2: TListBox
        Left = 696
        Top = 192
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 2
        Visible = False
      end
    end
  end
  object PanelHlp: TPanel
    Left = 416
    Top = 360
    Width = 473
    Height = 257
    Caption = 'PanelHlp'
    TabOrder = 1
    Visible = False
    DesignSize = (
      473
      257)
    object Memo1: TMemo
      Left = 9
      Top = 15
      Width = 453
      Height = 225
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '  '
        #1050#1083#1072#1074#1080#1096#1077#1081' <F8> '#1080#1083#1080'  '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '
        #1074#1099#1076#1077#1083#1080#1090#1077' '#1079#1072#1087#1080#1089#1080' '#1076#1083#1103
        #1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1074' '#1079#1072#1103#1074#1082#1091'-'#1088#1072#1089#1095#1077#1090' '#1080' '#1074' '#1076#1086#1076#1072#1090#1082#1080'. ')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnChange = Memo1Change
    end
  end
  object qryVBln: TQuery
    CachedUpdates = True
    AfterPost = qryVBlnAfterPost
    OnCalcFields = qryVBlnCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_VBln'
      '')
    UpdateObject = updVbln
    Left = 152
    Top = 88
    object qryVBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object qryVBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VBLN.KDSPS'
    end
    object qryVBlnDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VBLN.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryVBlnTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VBLN.TABN'
    end
    object qryVBlnFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryVBlnALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VBLN.ALGRASCH'
    end
    object qryVBlnNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VBLN.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVBlnSERLIST: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SERLIST'
      Origin = 'DbMain.Z_VBLN.SERLIST'
      Size = 5
    end
    object qryVBlnNRLIST: TStringField
      DisplayLabel = #8470#1083#1080#1089#1090#1082#1072
      FieldName = 'NRLIST'
      Origin = 'DbMain.Z_VBLN.NRLIST'
      Size = 15
    end
    object qryVBlnDTLIST: TDateTimeField
      FieldName = 'DTLIST'
      Origin = 'DbMain.Z_VBLN.DTLIST'
    end
    object qryVBlnDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VBLN.DTBEG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryVBlnDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VBLN.DTEND'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryVBlnCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VBLN.CNTDAYS'
    end
    object qryVBlnVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VBLN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVBlnShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryVBlnOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_VBLN.OLDKDVIDN'
    end
    object qryVBlnCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VBLN.CNTCHAS'
    end
    object qryVBlnPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VBLN.PROCOPL'
    end
    object qryVBlnKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VBLN.KDOBJ'
    end
    object qryVBlnKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VBLN.KDKATP'
    end
    object qryVBlnKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VBLN.KDSPZ'
    end
    object qryVBlnNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VBLN.NOTES'
      Size = 35
    end
    object qryVBlnSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VBLN.SMSRDN'
    end
    object qryVBlnSMBLN: TFloatField
      FieldName = 'SMBLN'
      Origin = 'DbMain.Z_VBLN.SMBLN'
    end
    object qryVBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VBLN.SPEC_NR'
    end
    object qryVBlnDAY5FIRST: TStringField
      FieldName = 'DAY5FIRST'
      Origin = 'DbMain.Z_VBLN.DAY5FIRST'
      FixedChar = True
      Size = 1
    end
    object qryVBlnLISTCONT: TStringField
      FieldName = 'LISTCONT'
      Origin = 'DbMain.Z_VBLN.LISTCONT'
      FixedChar = True
      Size = 1
    end
    object qryVBlnPREDSPEC_NR: TIntegerField
      FieldName = 'PREDSPEC_NR'
      Origin = 'DbMain.Z_VBLN.PREDSPEC_NR'
    end
    object qryVBlnPredNR: TStringField
      FieldKind = fkCalculated
      FieldName = 'PredNR'
      Size = 15
      Calculated = True
    end
    object qryVBlnPredDt: TDateField
      FieldKind = fkCalculated
      FieldName = 'PredDt'
      Calculated = True
    end
    object qryVBlnPRBLN: TSmallintField
      FieldName = 'PRBLN'
      Origin = 'DbMain.Z_VBLN.PRBLN'
    end
    object qryVBlnKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VBLN.KDTEMU'
    end
    object qryVBlnLNKSTOTP: TIntegerField
      FieldName = 'LNKSTOTP'
      Origin = 'DbMain.Z_VBLN.LNKSTOTP'
    end
    object qryVBlnSHEMA: TSmallintField
      FieldName = 'SHEMA'
      Origin = 'DbMain.Z_VBLN.SHEMA'
    end
    object qryVBlnSTGCMN: TFloatField
      FieldName = 'STGCMN'
      Origin = 'DbMain.Z_VBLN.STGCMN'
    end
    object qryVBlnSTG12: TFloatField
      FieldName = 'STG12'
      Origin = 'DbMain.Z_VBLN.STG12'
    end
    object qryVBlnDTZ: TDateTimeField
      DisplayLabel = #1044#1090#1047
      FieldName = 'DTZ'
      Origin = 'DbMain.Z_VBLN.DTZ'
    end
    object qryVBlnNRZ: TIntegerField
      DisplayLabel = #1053#1088#1047
      FieldName = 'NRZ'
      Origin = 'DbMain.Z_VBLN.NRZ'
    end
  end
  object dsrcVBln: TDataSource
    DataSet = qryVBln
    OnDataChange = dsrcVBlnDataChange
    Left = 168
    Top = 104
  end
  object qryRBln: TQuery
    OnCalcFields = qryRBlnCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcVBln
    SQL.Strings = (
      'Select * from Z_RBln'
      'where Spec_NR = :Spec_NR'
      'order by ZaMesGod')
    Left = 288
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryRBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_RBLN.NR'
    end
    object qryRBlnTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_RBLN.TABN'
    end
    object qryRBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_RBLN.SPEC_NR'
    end
    object qryRBlnZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_RBLN.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryRBlnSMZARABOTKA: TFloatField
      DisplayLabel = #1057#1084#1084#1047#1072#1088#1072#1073#1086#1090#1082#1072
      FieldName = 'SMZARABOTKA'
      Origin = 'DbMain.Z_RBLN.SMZARABOTKA'
      DisplayFormat = '#.00'
    end
    object qryRBlnKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090
      FieldName = 'KOEFZP'
      Origin = 'DbMain.Z_RBLN.KOEFZP'
    end
    object qryRBlnCNTDAYS: TFloatField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_RBLN.CNTDAYS'
    end
    object qryRBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_RBLN.KDSPS'
    end
    object qryRBlnSmZpKoef: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090
      FieldKind = fkCalculated
      FieldName = 'SmZpKoef'
      DisplayFormat = '#.00'
      Calculated = True
    end
  end
  object dsrcRBln: TDataSource
    DataSet = qryRBln
    Left = 304
    Top = 224
  end
  object qryOtkl: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcVBln
    SQL.Strings = (
      'select * from ViOtkl'
      'where DtProc = :DtProc and TabN = :TabN and '
      '                        (Spec_NR = :Spec_NR or Notes = :NrList)'
      'order by ZaMesGod, VidN')
    Left = 305
    Top = 317
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'NrList'
        ParamType = ptUnknown
      end>
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryOtklDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 3
    end
    object qryOtklSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VIOTKL.SHVIDN'
      Size = 15
    end
    object qryOtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object qryOtklShObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 15
      Lookup = True
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object qryOtklShKatP: TStringField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 15
      Lookup = True
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 13
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm-yy'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryOtklKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryOtklSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      Origin = 'DbMain.VIOTKL.SCHBU'
      Size = 10
    end
    object qryOtklPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VIOTKL.PSCH'
      Size = 10
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 312
    Top = 336
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 24
    Top = 136
    object popHead: TMenuItem
      Caption = '==          '#1041' '#1086' '#1083' '#1100' '#1085' '#1080' '#1095' '#1085' '#1099' '#1077'        =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16453
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16462
      OnClick = popAddClick
      object popAddBln: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1081
        OnClick = popAddBlnClick
      end
      object popAddDekr: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1089#1095#1077#1090' '#1076#1077#1082#1088#1077#1090#1085#1099#1093
        OnClick = popAddDekrClick
      end
      object popAddSocD: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1084#1086#1097#1100' '#1087#1088#1080' '#1087#1086#1093#1086#1088#1086#1085#1072#1093
        Visible = False
        OnClick = popAddSocDClick
      end
    end
    object popView: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16469
      OnClick = popDelClick
    end
    object popSep1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object popMetki: TMenuItem
      Caption = #1052#1077#1090#1082#1080' ...'
      object popMetkiSet: TMenuItem
        Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1085#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077
        OnClick = popMetkiSetClick
      end
      object popMetkiClear: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1091' '#1089#1086' '#1074#1089#1077#1093' '#1085#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1093
        OnClick = popMetkiClearClick
      end
      object NUnmarkGroup: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080' '#1089' '#1079#1072#1087#1080#1089#1077#1081' '#1075#1088#1091#1087#1087#1099
        OnClick = NUnmarkGroupClick
      end
      object N2: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1091' '#1086#1073' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1080' '#1089#1086' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081'  '
        Visible = False
        OnClick = N2Click
      end
    end
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popSortMesTabN: TMenuItem
        Caption = ' '#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094', '#1058#1072#1073'.'#1053#1088
        Checked = True
        OnClick = popSortClick
      end
      object popSortTabNMes: TMenuItem
        Caption = ' '#1058#1072#1073'.'#1053#1088', '#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
        OnClick = popSortClick
      end
      object NSortByMesFam: TMenuItem
        Caption = ' '#1056#1072#1089#1095#1105#1090#1085'.'#1084#1077#1089'., '#1060#1048#1054','
        OnClick = popSortClick
      end
      object NSortByFamMes: TMenuItem
        Caption = ' '#1060#1048#1054', '#1056#1072#1089#1095#1105#1090#1085'.'#1084#1077#1089'.'
        OnClick = popSortClick
      end
    end
    object popFilter: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088' ...'
      object popFilterByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = popFilterByTabNClick
      end
      object popFilterOff: TMenuItem
        Caption = '- '#1073#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        Checked = True
        OnClick = popFilterOffClick
      end
    end
  end
  object qryTmp: TQuery
    Left = 80
    Top = 224
  end
  object qryPgr: TQuery
    CachedUpdates = True
    BeforePost = qryPgrBeforePost
    AfterPost = qryPgrAfterPost
    AfterDelete = qryPgrAfterDelete
    OnCalcFields = qryPgrCalcFields
    OnNewRecord = qryPgrNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_exp_fss')
    UpdateObject = updPgr
    Left = 104
    Top = 296
    object qryPgrNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_EXP_FSS.NR'
    end
    object qryPgrDTPROC: TDateTimeField
      DisplayLabel = 'DtProc'
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_EXP_FSS.DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryPgrTIPD: TSmallintField
      DisplayLabel = #1058#1080#1087#1044
      FieldName = 'TIPD'
      Origin = 'DbMain.Z_EXP_FSS.TIPD'
    end
    object qryPgrTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
      Origin = 'DbMain.Z_EXP_FSS.TABN'
    end
    object qryPgrFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qryPgrID: TStringField
      DisplayLabel = #1048#1053#1053
      FieldKind = fkCalculated
      FieldName = 'ID'
      Size = 12
      Calculated = True
    end
    object qryPgrDTDOC: TDateTimeField
      DisplayLabel = #1044#1090#1057#1074'-'#1074#1072
      FieldName = 'DTDOC'
      Origin = 'DbMain.Z_EXP_FSS.DTDOC'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPgrSERDOC: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SERDOC'
      Origin = 'DbMain.Z_EXP_FSS.SERDOC'
      Size = 10
    end
    object qryPgrNDOC: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NDOC'
      Origin = 'DbMain.Z_EXP_FSS.NDOC'
      Size = 15
    end
    object qryPgrIDP: TStringField
      DisplayLabel = #1048#1053#1053' '#1047
      FieldName = 'IDP'
      Origin = 'DbMain.Z_EXP_FSS.IDP'
      Size = 15
    end
    object qryPgrFAMP: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1047
      FieldName = 'FAMP'
      Origin = 'DbMain.Z_EXP_FSS.FAMP'
      Size = 25
    end
    object qryPgrIMAP: TStringField
      DisplayLabel = #1048#1084#1103' '
      FieldName = 'IMAP'
      Origin = 'DbMain.Z_EXP_FSS.IMAP'
      Size = 25
    end
    object qryPgrOTCHP: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086' '#1047
      FieldName = 'OTCHP'
      Origin = 'DbMain.Z_EXP_FSS.OTCHP'
      Size = 25
    end
    object qryPgrSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1047
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_EXP_FSS.SUMMA'
    end
    object qryPgrDTZ: TDateTimeField
      FieldName = 'DTZ'
      Origin = 'DbMain.Z_EXP_FSS.DTZ'
    end
    object qryPgrNRZ: TIntegerField
      FieldName = 'NRZ'
      Origin = 'DbMain.Z_EXP_FSS.NRZ'
    end
    object qryPgrNRACT: TStringField
      DisplayLabel = #1053#1088#1040#1082#1090
      FieldName = 'NRACT'
      Origin = 'DbMain.Z_EXP_FSS.NRACT'
      Size = 15
    end
    object qryPgrDTACT: TDateTimeField
      DisplayLabel = #1044#1090#1040#1082#1090
      FieldName = 'DTACT'
      Origin = 'DbMain.Z_EXP_FSS.DTACT'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcPgr: TDataSource
    DataSet = qryPgr
    Left = 120
    Top = 320
  end
  object updPgr: TUpdateSQL
    ModifySQL.Strings = (
      'update z_exp_fss'
      'set'
      '  DTPROC = :DTPROC,'
      '  TIPD = :TIPD,'
      '  TABN = :TABN,'
      '  DTDOC = :DTDOC,'
      '  SERDOC = :SERDOC,'
      '  NDOC = :NDOC,'
      '  IDP = :IDP,'
      '  FAMP = :FAMP,'
      '  IMAP = :IMAP,'
      '  OTCHP = :OTCHP,'
      '  SUMMA = :SUMMA,'
      '  DTZ = :DTZ,'
      '  NRZ = :NRZ,'
      '  NRACT = :NRACT,'
      '  DTACT = :DTACT'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_exp_fss'
      
        '  (DTPROC, TIPD, TABN, DTDOC, SERDOC, NDOC, IDP, FAMP, IMAP, OTC' +
        'HP, '
      'SUMMA, '
      '   DTZ, NRZ, NRACT, DTACT)'
      'values'
      
        '  (:DTPROC, :TIPD, :TABN, :DTDOC, :SERDOC, :NDOC, :IDP, :FAMP, :' +
        'IMAP, '
      ':OTCHP, '
      '   :SUMMA, :DTZ, :NRZ, :NRACT, :DTACT)')
    DeleteSQL.Strings = (
      'delete from z_exp_fss'
      'where'
      '  NR = :OLD_NR')
    Left = 136
    Top = 336
  end
  object popPgr: TPopupMenu
    OnPopup = popPgrPopup
    Left = 76
    Top = 136
    object popPgrHead: TMenuItem
      Caption = '==  '#1055#1086#1075#1088#1077#1073#1077#1085#1080#1077'  =='
      Enabled = False
    end
    object popPgrAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object popPgrAdd2: TMenuItem
        Caption = '- '#1074' '#1044#1086#1076#1072#1090#1086#1082' 2'
        OnClick = popPgrAdd2Click
      end
      object popPgrAdd5: TMenuItem
        Caption = '- '#1074' '#1044#1086#1076#1072#1090#1086#1082' 5'
        OnClick = popPgrAdd5Click
      end
    end
    object popPgrEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popPgrEdtClick
    end
    object popPgrDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popPgrDelClick
    end
  end
  object updVbln: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_VBln'
      'set'
      '  DTZ = :DTZ,'
      '  NRZ = :NRZ'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_VBln'
      '  (DTZ, NRZ)'
      'values'
      '  (:DTZ, :NRZ)')
    DeleteSQL.Strings = (
      'delete from Z_VBln'
      'where'
      '  NR = :OLD_NR')
    Left = 188
    Top = 128
  end
  object qryZNr: TQuery
    Left = 100
    Top = 88
  end
  object qryUpd: TQuery
    Left = 20
    Top = 232
  end
  object popPrint: TPopupMenu
    OnPopup = popPrintPopup
    Left = 601
    Top = 22
    object PopPrintRegistry: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1083#1080#1089#1090#1086#1074
      object PopPrintRegBuh: TMenuItem
        Caption = #1044#1083#1103' &'#1073#1091#1093#1075#1072#1083#1090#1077#1088#1080#1080
        OnClick = PopPrintRegistryClick
      end
      object PopPrintRegPlan: TMenuItem
        Caption = #1044#1083#1103' &'#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
        OnClick = PopPrintRegistryClick
      end
    end
    object popPrintReest: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1083#1080#1089#1090#1086#1074
      Visible = False
      OnClick = popPrintReestClick
    end
    object popPrintProt: TMenuItem
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      object NPrintProtCommon: TMenuItem
        Caption = #1054#1073#1097#1080#1081
        OnClick = NPrintProtCommonClick
      end
      object NPrintProtByZajavk: TMenuItem
        Caption = #1056#1072#1079#1076#1077#1083#1100#1085#1086' '#1087#1086' '#1079#1072#1103#1074#1082#1072#1084
        OnClick = NPrintProtByZajavkClick
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopPrintRequest: TMenuItem
      Caption = #1047#1072#1103#1074#1082#1072'-'#1088#1072#1089#1095#1077#1090
      OnClick = PopPrintRequestClick
    end
    object popPrintDodadok1: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1086#1082' 1.1 '
      object NPrintNotesCommon: TMenuItem
        Caption = #1054#1073#1097#1080#1081
        OnClick = NPrintNotesCommonClick
      end
      object NPrintNotesByZajavk: TMenuItem
        Caption = #1056#1072#1079#1076#1077#1083#1100#1085#1086' '#1087#1086' '#1079#1072#1103#1074#1082#1072#1084
        OnClick = NPrintNotesByZajavkClick
      end
    end
    object popPrintDodadok2: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1086#1082' 1.2'
      object NPrintAppdx2Common: TMenuItem
        Caption = '&'#1054#1073#1097#1080#1081
        OnClick = NPrintAppdx2CommonClick
      end
      object NPrintAppdx2Separated: TMenuItem
        Caption = '&'#1056#1072#1079#1076#1077#1083#1100#1085#1086' '#1087#1086' '#1079#1072#1103#1074#1082#1072#1084
        OnClick = NPrintAppdx2SeparatedClick
      end
    end
    object popPrintAppdx3: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1086#1082' 1.3'
      object NPrintAppdx3Common: TMenuItem
        Caption = #1054#1073#1097#1080#1081
        OnClick = NPrintAppdx3CommonClick
      end
      object NPrintAppdx3Separated: TMenuItem
        Caption = #1056#1072#1079#1076#1077#1083#1100#1085#1086' '#1087#1086' '#1079#1072#1103#1074#1082#1072#1084
        OnClick = NPrintAppdx3SeparatedClick
      end
    end
    object popPrintPVK: TMenuItem
      Caption = #1055#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103' '#1087#1088#1086' '#1074#1080#1087#1083#1072#1090#1091' '#1082#1086#1096#1090#1110#1074
      OnClick = popPrintPVKClick
    end
    object popPrintExportXML: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' XML'
      object NXml11: TMenuItem
        Caption = '1.1'
        OnClick = NXml11Click
      end
      object NXml13: TMenuItem
        Caption = '1.3'
        OnClick = NXml13Click
      end
    end
    object ExportToJSON: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' JSON'
      object JsonDesease: TMenuItem
        Caption = '1.1'
        OnClick = JsonDeseaseClick
      end
      object JsonPregnacy: TMenuItem
        Caption = '1.2'
        OnClick = JsonPregnacyClick
      end
      object JsonAccident: TMenuItem
        Caption = '1.3'
        OnClick = JsonAccidentClick
      end
    end
  end
end
