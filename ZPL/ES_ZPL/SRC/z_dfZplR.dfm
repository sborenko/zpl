object FormDfPromRes: TFormDfPromRes
  Left = 581
  Top = 202
  Width = 618
  Height = 477
  ActiveControl = dbgrID
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormDfPromRes'
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 525
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
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      610
      33)
    object sBtnPrt: TSpeedButton
      Left = 3
      Top = 2
      Width = 74
      Height = 28
      Hint = #1042#1099#1074#1086#1076' '#1086#1090#1095#1077#1090#1072' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
      Caption = #1054#1090#1095#1077#1090
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object sBtnCopyDisk: TSpeedButton
      Left = 79
      Top = 2
      Width = 81
      Height = 28
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072' '#1085#1072' '#1076#1080#1089#1082#1077#1090#1091' '#1076#1083#1103' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1074' '#1044#1055#1048
      Caption = #1044#1080#1089#1082#1077#1090#1072
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnCopyDiskClick
    end
    object LabelCntRec: TLabel
      Left = 448
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object bBtnExit: TBitBtn
      Left = 532
      Top = 2
      Width = 75
      Height = 28
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = bBtnExitClick
      Kind = bkCancel
      Spacing = 0
    end
    object ChBoxZeroLines: TCheckBox
      Left = 163
      Top = 1
      Width = 178
      Height = 17
      Hint = #1053#1077' '#1087#1077#1095#1072#1090#1072#1090#1100' '#1080' '#1085#1077' '#1074#1082#1083#1102#1095#1072#1090#1100' '#1074' '#1092#1072#1081#1083' '#1089#1090#1088#1086#1082#1080' '#1089' '#1085#1091#1083#1077#1074#1099#1084#1080' '#1089#1091#1084#1084#1072#1084#1080
      Caption = #1055#1088#1086#1087#1091#1089#1082#1072#1090#1100' "'#1085#1091#1083#1077#1074#1099#1077'" '#1089#1090#1088#1086#1082#1080
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 1
    end
    object ChBox1000: TCheckBox
      Left = 163
      Top = 15
      Width = 209
      Height = 17
      Caption = #1056#1072#1079#1073#1080#1074#1072#1090#1100' '#1085#1072' 1000-'#1089#1090#1088#1086#1095#1085#1099#1077' '#1087#1086#1088#1094#1080#1080
      Enabled = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object ChBoxDataPodannja: TCheckBox
      Left = 343
      Top = 1
      Width = 93
      Height = 17
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1074' '#1086#1090#1095#1077#1090#1077' '#1090#1077#1082#1091#1097#1091#1102' '#1076#1072#1090#1091', '#1082#1072#1082' "'#1044#1072#1090#1072' '#1087#1086#1076#1072#1085#1085#1103'"'
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1085#1085#1103
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 610
    Height = 391
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    OnChange = PageControl1Change
    object ts1: TTabSheet
      Caption = #1048#1084#1077#1102#1097#1080#1077' '#1048#1044
      object Splitter1: TSplitter
        Left = 0
        Top = 137
        Width = 602
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object Splitter3: TSplitter
        Left = 0
        Top = 228
        Width = 602
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object dbgrID: TDBGrid
        Left = 0
        Top = 0
        Width = 602
        Height = 137
        Hint = #1058#1072#1073#1083#1080#1094#1072' '#1080#1084#1077#1102#1097#1080#1093' '#1058#1048#1053#39#1099' (d_KYY_id.db)'
        Align = alTop
        Color = 11861218
        DataSource = dsrcID
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrIDDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIN'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RecNR'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sovm'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fam'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ima'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Otch'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BadId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_NAR'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_DOX'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXN'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXP'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_DOX'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_PRIYN'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_ZVILN'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_PILG'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZNAKA'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DopRec'
            Visible = True
          end>
      end
      object dbgrId2: TDBGrid
        Left = 0
        Top = 231
        Width = 602
        Height = 129
        Hint = 
          #1047#1072#1087#1088#1086#1089' '#1080#1079' '#1087#1086#1084#1077#1089#1103#1095#1085#1086#1081' "'#1086#1073#1098#1077#1076#1080#1085#1080#1090#1077#1083#1100#1085#1086#1081'" '#1090#1072#1073#1083#1080#1094#1099' cDfFileUni (d__KY' +
          'Y.db) '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1058#1048#1053' ('#1073#1077#1079' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1080', "'#1082#1072#1082' '#1077#1089#1090#1100'")'
        Align = alClient
        Color = 11861218
        DataSource = dsrcId2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrId2DrawColumnCell
        OnDblClick = dbgrId2DblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NoNwBD'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cDir'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fNU'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sovm'
            Width = 32
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'TabN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fam'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ima'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Otch'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BadId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_NAR'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_DOX'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_DOX'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_PRIYN'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_ZVILN'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_PILG'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZNAKA'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DopRec'
            Visible = True
          end>
      end
      object dbgrProm: TDBGrid
        Left = 0
        Top = 140
        Width = 602
        Height = 88
        Hint = 
          #1047#1072#1087#1088#1086#1089' '#1080#1079' tblProm, '#1089#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1085#1085#1099#1081' by TIN, BadID, Sovm, Fam, Ima' +
          ', Otch, Ozn_Dox, Ozn_Pilg, d_Zviln, d_Priyn, Oznaka, DopRec  ('#1090'.' +
          #1077'. '#1082#1074#1072#1088#1090#1072#1083#1100#1085#1086')'
        Align = alTop
        Color = 11861218
        DataSource = dsrcProm
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPromDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'TIN'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sovm'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fam'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ima'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Otch'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_NAR'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_DOX'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXN'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXP'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ozn_Dox'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'd_Priyn'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'd_Zviln'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ozn_Pilg'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Oznaka'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BadID'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DopRec'
            Width = 38
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #1053#1077' '#1080#1084#1077#1102#1097#1080#1077' '#1048#1044
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 201
        Width = 602
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object dbgrFio: TDBGrid
        Left = 0
        Top = 0
        Width = 602
        Height = 201
        Hint = #1058#1072#1073#1083#1080#1094#1072' '#1053#1077#1048#1084#1077#1102#1097#1080#1093' '#1058#1048#1053#39#1086#1074' (d_KYY_fi.db)'
        Align = alTop
        Color = clBtnFace
        DataSource = dsrcFIO
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = pop
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
            FieldName = 'NR'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sovm'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fam'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ima'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Otch'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIN'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BadId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pasport'
            Title.Caption = #1055#1072#1089#1087#1086#1088#1090
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_NAR'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_DOX'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXN'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_DOX'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_PRIYN'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_ZVILN'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_PILG'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZNAKA'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DopRec'
            Visible = True
          end>
      end
      object dbgrFio2: TDBGrid
        Left = 0
        Top = 204
        Width = 602
        Height = 163
        Hint = 
          #1047#1072#1087#1088#1086#1089' '#1080#1079' '#1087#1086#1084#1077#1089#1103#1095#1085#1086#1081' "'#1086#1073#1098#1077#1076#1080#1085#1080#1090#1077#1083#1100#1085#1086#1081'" '#1090#1072#1073#1083#1080#1094#1099' cDfFileUni (d__KY' +
          'Y.db) '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' MyID'
        Align = alClient
        Color = clBtnFace
        DataSource = dsrcFio2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrFio2DblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NoNwBD'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cDir'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fNU'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIN'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BadId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fam'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ima'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Otch'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_NAR'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_DOX'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXN'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_TAXP'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_DOX'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_PRIYN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_ZVILN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZN_PILG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OZNAKA'
            Visible = True
          end>
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 424
    Width = 610
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel2: TPanel
    Left = 197
    Top = 33
    Width = 300
    Height = 22
    BevelOuter = bvNone
    Caption = #1042#1082#1083#1102#1095#1077#1085' '#1088#1077#1078#1080#1084' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1074' '#1090#1072#1073#1083#1080#1094#1077' !!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object qryFio2: TQuery
    DatabaseName = 'D00'
    DataSource = dsrcFIO
    SQL.Strings = (
      'Select *'
      'from dF2_1.db'
      'where (TIN = :TIN)'
      'order by cDir, fNU')
    Left = 248
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIN'
        ParamType = ptUnknown
      end>
    object qryFio2NR: TIntegerField
      FieldName = 'NR'
    end
    object qryFio2NP: TIntegerField
      FieldName = 'NP'
    end
    object qryFio2cDir: TStringField
      FieldName = 'cDir'
      Size = 4
    end
    object qryFio2fNU: TSmallintField
      FieldName = 'fNU'
    end
    object qryFio2TIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object qryFio2TabN: TIntegerField
      FieldName = 'TabN'
    end
    object qryFio2Fam: TStringField
      FieldName = 'Fam'
    end
    object qryFio2Ima: TStringField
      FieldName = 'Ima'
    end
    object qryFio2Otch: TStringField
      FieldName = 'Otch'
    end
    object qryFio2BadId: TStringField
      FieldName = 'BadId'
      Size = 10
    end
    object qryFio2S_NAR: TFloatField
      FieldName = 'S_NAR'
      DisplayFormat = '#.00'
    end
    object qryFio2S_DOX: TFloatField
      FieldName = 'S_DOX'
      DisplayFormat = '#.00'
    end
    object qryFio2S_TAXN: TFloatField
      FieldName = 'S_TAXN'
      DisplayFormat = '#.00'
    end
    object qryFio2S_TAXP: TFloatField
      FieldName = 'S_TAXP'
      DisplayFormat = '#.00'
    end
    object qryFio2OZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object qryFio2D_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object qryFio2D_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object qryFio2OZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object qryFio2OZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object qryFio2NoNwBD: TBooleanField
      FieldName = 'NoNwBD'
    end
  end
  object dsrcID: TDataSource
    DataSet = tblID
    Left = 176
    Top = 128
  end
  object qryId2: TQuery
    DatabaseName = 'D_2006_4'
    DataSource = dsrcID
    SQL.Strings = (
      'Select *'
      'from d__406.db'
      ''
      'order by TIN, Ozn_Dox, fNU, cDir, Ozn_Pilg')
    Left = 88
    Top = 312
    object qryId2NR: TIntegerField
      FieldName = 'NR'
    end
    object qryId2NP: TIntegerField
      FieldName = 'NP'
    end
    object qryId2cDir: TStringField
      FieldName = 'cDir'
      Size = 4
    end
    object qryId2fNU: TSmallintField
      FieldName = 'fNU'
    end
    object qryId2BadId: TStringField
      FieldName = 'BadId'
      Size = 10
    end
    object qryId2TIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object qryId2TabN: TIntegerField
      FieldName = 'TabN'
    end
    object qryId2Sovm: TSmallintField
      FieldName = 'Sovm'
    end
    object qryId2Fam: TStringField
      FieldName = 'Fam'
    end
    object qryId2Ima: TStringField
      FieldName = 'Ima'
    end
    object qryId2Otch: TStringField
      FieldName = 'Otch'
    end
    object qryId2S_NAR: TFloatField
      FieldName = 'S_NAR'
      DisplayFormat = '#.00'
    end
    object qryId2S_DOX: TFloatField
      FieldName = 'S_DOX'
      DisplayFormat = '#.00'
    end
    object qryId2S_TAXN: TFloatField
      FieldName = 'S_TAXN'
      DisplayFormat = '#.00'
    end
    object qryId2S_TAXP: TFloatField
      FieldName = 'S_TAXP'
      DisplayFormat = '#.00'
    end
    object qryId2OZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object qryId2D_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object qryId2D_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object qryId2OZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object qryId2OZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object qryId2NoNwBD: TBooleanField
      FieldName = 'NoNwBD'
    end
    object qryId2DopRec: TStringField
      FieldName = 'DopRec'
      Size = 1
    end
  end
  object dsrcId2: TDataSource
    DataSet = qryId2
    Left = 96
    Top = 328
  end
  object tblID: TTable
    DatabaseName = 'D00'
    TableName = 'd_104_ID.db'
    Left = 168
    Top = 112
    object tblIDNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblIDNP: TIntegerField
      FieldName = 'NP'
    end
    object tblIDTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object tblIDRecNR: TIntegerField
      FieldName = 'RecNR'
    end
    object tblIDTabN: TIntegerField
      FieldName = 'TabN'
    end
    object tblIDSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object tblIDFam: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'Fam'
    end
    object tblIDIma: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'Ima'
    end
    object tblIDOtch: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'Otch'
    end
    object tblIDBadId: TStringField
      FieldName = 'BadId'
      Size = 10
    end
    object tblIDS_NAR: TFloatField
      FieldName = 'S_NAR'
      DisplayFormat = '#.00'
    end
    object tblIDS_DOX: TFloatField
      FieldName = 'S_DOX'
      DisplayFormat = '#.00'
    end
    object tblIDS_TAXN: TFloatField
      FieldName = 'S_TAXN'
      DisplayFormat = '#.00'
    end
    object tblIDS_TAXP: TFloatField
      FieldName = 'S_TAXP'
      DisplayFormat = '#.00'
    end
    object tblIDOZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object tblIDD_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object tblIDD_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object tblIDOZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object tblIDOZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object tblIDDopRec: TStringField
      FieldName = 'DopRec'
      Size = 1
    end
  end
  object tblFIO: TTable
    DatabaseName = 'D00'
    TableName = 'd_104_FI.db'
    Left = 280
    Top = 112
    object tblFIONR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblFIONP: TIntegerField
      FieldName = 'NP'
    end
    object tblFIOTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object tblFIOSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object tblFIOFam: TStringField
      FieldName = 'Fam'
    end
    object tblFIOIma: TStringField
      FieldName = 'Ima'
    end
    object tblFIOOtch: TStringField
      FieldName = 'Otch'
    end
    object tblFIOBadId: TStringField
      FieldName = 'BadId'
      Size = 10
    end
    object tblFIOPasport: TStringField
      FieldName = 'Pasport'
    end
    object tblFIOS_NAR: TFloatField
      FieldName = 'S_NAR'
      DisplayFormat = '#.00'
    end
    object tblFIOS_DOX: TFloatField
      FieldName = 'S_DOX'
      DisplayFormat = '#.00'
    end
    object tblFIOS_TAXN: TFloatField
      FieldName = 'S_TAXN'
      DisplayFormat = '#.00'
    end
    object tblFIOS_TAXP: TFloatField
      FieldName = 'S_TAXP'
      DisplayFormat = '#.00'
    end
    object tblFIOOZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object tblFIOD_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object tblFIOD_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object tblFIOOZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object tblFIOOZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object tblFIODopRec: TStringField
      FieldName = 'DopRec'
      Size = 1
    end
    object tblFIOTabN: TIntegerField
      FieldName = 'TabN'
    end
  end
  object dsrcFIO: TDataSource
    DataSet = tblFIO
    Left = 296
    Top = 128
  end
  object dsrcFio2: TDataSource
    DataSet = qryFio2
    Left = 264
    Top = 336
  end
  object tblForCopy: TTable
    TableType = ttDBase
    Left = 408
    Top = 144
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 88
    Top = 112
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
    object popSep1: TMenuItem
      Caption = '-'
    end
    object popEdtInTable: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1077
      OnClick = popEdtInTableClick
    end
    object popPoisk: TMenuItem
      Caption = #1055#1086#1080#1089#1082' ...'
      object popPoiskByTin: TMenuItem
        Caption = '- '#1087#1086' '#1058#1048#1053#39#1091
        OnClick = popPoiskByTinClick
      end
      object popPoiskByFam: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
        OnClick = popPoiskByFamClick
      end
      object popPoiskWithDUvoln: TMenuItem
        Caption = '- '#1089' '#1076#1072#1090#1072#1084#1080' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
        OnClick = popPoiskWithDUvolnClick
      end
    end
  end
  object qry1000: TQuery
    Left = 368
    Top = 104
  end
  object tbl1000: TTable
    TableName = 't__1000'
    Left = 368
    Top = 144
  end
  object qryTmp: TQuery
    Left = 408
    Top = 104
  end
  object qryProm: TQuery
    DatabaseName = '__KBDE'
    SQL.Strings = (
      
        'Select TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg' +
        ', '
      
        '           d_Zviln, d_Priyn, Oznaka, DopRec, Sum(S_Nar) as S_NAR' +
        ', '
      '           Sum(S_Dox) as S_DOX, Sum(S_TaxN) as S_TAXN, '
      '           Sum(S_TaxP) as S_TAXP'
      'from tblProm where TIN = '#39'1713602260'#39
      
        'group by TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pi' +
        'lg, '
      
        '                                            d_Zviln, d_Priyn, OZ' +
        'NAKA, DopRec')
    Left = 88
    Top = 224
    object qryPromTIN: TStringField
      FieldName = 'TIN'
      Origin = '__KBDE."tblProm.DB".TIN'
      Size = 10
    end
    object qryPromBadID: TStringField
      FieldName = 'BadID'
      Origin = '__KBDE."tblProm.DB".BadId'
      Size = 10
    end
    object qryPromSovm: TSmallintField
      FieldName = 'Sovm'
      Origin = '__KBDE."tblProm.DB".Sovm'
    end
    object qryPromTabN: TIntegerField
      FieldName = 'TabN'
    end
    object qryPromFam: TStringField
      FieldName = 'Fam'
      Origin = '__KBDE."tblProm.DB".Fam'
    end
    object qryPromIma: TStringField
      FieldName = 'Ima'
      Origin = '__KBDE."tblProm.DB".Ima'
    end
    object qryPromOtch: TStringField
      FieldName = 'Otch'
      Origin = '__KBDE."tblProm.DB".Otch'
    end
    object qryPromOzn_Dox: TSmallintField
      FieldName = 'Ozn_Dox'
      Origin = '__KBDE."tblProm.DB".OZN_DOX'
    end
    object qryPromOzn_Pilg: TSmallintField
      FieldName = 'Ozn_Pilg'
      Origin = '__KBDE."tblProm.DB".OZN_PILG'
    end
    object qryPromd_Zviln: TDateField
      FieldName = 'd_Zviln'
      Origin = '__KBDE."tblProm.DB".D_ZVILN'
    end
    object qryPromd_Priyn: TDateField
      FieldName = 'd_Priyn'
      Origin = '__KBDE."tblProm.DB".D_PRIYN'
    end
    object qryPromOznaka: TSmallintField
      FieldName = 'Oznaka'
      Origin = '__KBDE."tblProm.DB".OZNAKA'
    end
    object qryPromDopRec: TStringField
      FieldName = 'DopRec'
      Origin = '__KBDE."tblProm.DB".DopRec'
      Size = 1
    end
    object qryPromS_NAR: TFloatField
      FieldName = 'S_NAR'
      Origin = '__KBDE."tblProm.DB".S_NAR'
      DisplayFormat = '#.00'
    end
    object qryPromS_DOX: TFloatField
      FieldName = 'S_DOX'
      Origin = '__KBDE."tblProm.DB".S_DOX'
      DisplayFormat = '#.00'
    end
    object qryPromS_TAXN: TFloatField
      FieldName = 'S_TAXN'
      Origin = '__KBDE."tblProm.DB".S_TAXN'
      DisplayFormat = '#.00'
    end
    object qryPromS_TAXP: TFloatField
      FieldName = 'S_TAXP'
      Origin = '__KBDE."tblProm.DB".S_TAXP'
      DisplayFormat = '#.00'
    end
  end
  object dsrcProm: TDataSource
    DataSet = qryProm
    Left = 96
    Top = 240
  end
end
