object FormTObj: TFormTObj
  Left = 292
  Top = 134
  Width = 698
  Height = 485
  ActiveControl = TV
  BorderIcons = [biSystemMenu]
  Caption = 'FormTObj'
  Color = clBtnFace
  Constraints.MaxWidth = 785
  Constraints.MinHeight = 400
  Constraints.MinWidth = 350
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
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 690
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      690
      28)
    object sBtnDelMe: TSpeedButton
      Left = 7
      Top = 4
      Width = 23
      Height = 22
      Visible = False
      OnClick = SpeedButton1Click
    end
    object LabelCntSel: TLabel
      Left = 6
      Top = 8
      Width = 57
      Height = 13
      Caption = 'LabelCntSel'
      Transparent = True
    end
    object sBtnPrt: TSpeedButton
      Left = 489
      Top = 3
      Width = 65
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
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
      Spacing = 2
      OnClick = sBtnPrtClick
    end
    object bBtnOk: TBitBtn
      Left = 556
      Top = 3
      Width = 65
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
      Spacing = 1
    end
    object bBtnCancel: TBitBtn
      Left = 623
      Top = 3
      Width = 65
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 423
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 232
      Width = 381
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Color = clGreen
      ParentColor = False
    end
    object TV: TTreeView
      Left = 0
      Top = 0
      Width = 381
      Height = 205
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HideSelection = False
      HotTrack = True
      Indent = 19
      ParentFont = False
      PopupMenu = popTvObj
      ReadOnly = True
      RightClickSelect = True
      RowSelect = True
      TabOrder = 0
      OnChange = TVChange
      OnCustomDrawItem = TVCustomDrawItem
      OnDblClick = TVDblClick
      OnKeyDown = TVKeyDown
    end
    object dbgrObj: TDBGrid
      Left = 0
      Top = 235
      Width = 381
      Height = 188
      Align = alBottom
      Color = clBtnFace
      DataSource = dsrcObj
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'KDSPS'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHOBJ'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMOBJ'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AINDX'
          Width = 27
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PINDX'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LVL'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INDX'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HSCH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_GORD'
          Visible = True
        end>
    end
    object PanelMsg: TPanel
      Left = 0
      Top = 205
      Width = 381
      Height = 27
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'PanelMsg'
      TabOrder = 2
      DesignSize = (
        381
        27)
      object sBtnSelCurrent: TSpeedButton
        Left = 2
        Top = 1
        Width = 23
        Height = 25
        Hint = #1052#1077#1090#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102
        Caption = 'F8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sBtnSelCurrentClick
      end
      object sBtnSelAll: TSpeedButton
        Left = 26
        Top = 1
        Width = 23
        Height = 25
        Hint = #1052#1077#1090#1080#1090#1100' '#1074#1089#1077
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnSelAllClick
      end
      object sBtnUnSelAll: TSpeedButton
        Left = 50
        Top = 1
        Width = 23
        Height = 25
        Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077
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
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnUnSelAllClick
      end
      object LabelMsg: TLabel
        Left = 78
        Top = 0
        Width = 301
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 
          #1050#1083#1072#1074#1080#1096#1077#1081' <F8> '#1080#1083#1080' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1074#1099#1076#1077#1083#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1087#1086#1076 +
          #1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080' '#1085#1072#1078#1084#1080#1090#1077' "'#1042#1074#1086#1076'"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object PanelDelMsg: TPanel
      Left = 16
      Top = 8
      Width = 185
      Height = 41
      Color = clMoneyGreen
      TabOrder = 3
      Visible = False
      object Label1: TLabel
        Left = 5
        Top = 7
        Width = 178
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = #1046#1076#1080#1090#1077'... '#1055#1088#1086#1074#1077#1088#1103#1077#1090#1089#1103' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080'.'
        Transparent = True
        WordWrap = True
      end
    end
  end
  object PanelNabor: TPanel
    Left = 381
    Top = 0
    Width = 309
    Height = 423
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'PanelNabor'
    TabOrder = 2
    object dbgrTmp: TDBGrid
      Left = 2
      Top = 2
      Width = 305
      Height = 419
      Align = alClient
      Color = clCream
      DataSource = dsrcTmp
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrTmpDblClick
      OnEnter = dbgrTmpEnter
      OnExit = dbgrTmpExit
      Columns = <
        item
          Expanded = False
          FieldName = 'ShObj'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NmObj'
          Width = 200
          Visible = True
        end>
    end
  end
  object popTvObj: TPopupMenu
    OnPopup = popTvObjPopup
    Left = 168
    Top = 144
    object popTvObjVubor: TMenuItem
      Caption = #1042#1099#1073#1086#1088
      OnClick = popTvObjVuborClick
    end
    object popTvObjFullExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTvObjFullExpandClick
    end
    object popTvObjFullCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTvObjFullCollapseClick
    end
    object popTvObjExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = popTvObjExitClick
    end
    object popTvObjSep1: TMenuItem
      Caption = '-'
    end
    object popTvObjAddInRoot: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1088#1077#1085#1100
      Hint = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1076#1086#1073#1072#1074#1083#1103#1077#1090#1089#1103' '#1074' '#1082#1086#1088#1077#1085#1100' '#1087#1086#1083#1077#1076#1085#1080#1084
      OnClick = popTvObjAddInRootClick
    end
    object popTvObjEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popTvObjEdtClick
    end
    object popTvObjAddFirstInCurrent: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1074#1099#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
      OnClick = popTvObjAddFirstInCurrentClick
    end
    object popTvObjAddLastInCurrent: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
      OnClick = popTvObjAddLastInCurrentClick
    end
    object popTvObjInsertBeforeCurrent: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1091#1079#1083#1072
      OnClick = popTvObjInsertBeforeCurrentClick
    end
    object popTvObjAddInNode: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1085#1091#1090#1088#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1091#1079#1083#1072
      OnClick = popTvObjAddInNodeClick
    end
    object popTvObjMoveInTo: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074#1085#1091#1090#1088#1100' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
      Hint = #1059#1079#1077#1083'-'#1087#1088#1080#1077#1084#1085#1080#1082' '#1076#1086#1083#1078#1077#1085' '#1091#1078#1077' '#1089#1091#1097#1077#1089#1090#1074#1086#1074#1072#1090#1100
      OnClick = popTvObjMoveInToClick
    end
    object popTvObjMoveToBefore: TMenuItem
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072' ('#1085#1072' '#1090#1086#1084' '#1078#1077' '#1091#1088#1086#1074#1085#1077')'
      OnClick = popTvObjMoveToBeforeClick
    end
    object popTvObjDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popTvObjDelClick
    end
    object popTvObjSep2: TMenuItem
      Caption = '-'
    end
    object popTvDelMeFirst: TMenuItem
      Caption = #1056#1072#1079#1086#1073#1088#1072#1090#1100#1089#1103' '#1074' '#1101#1090#1086#1081' '#1082#1072#1096#1077' ... !!!'
    end
    object popTvObjSaveToFile: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083' ...'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1074' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083' ...'
      OnClick = popTvObjSaveToFileClick
    end
    object popTvObjLoadFromFile: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072' ...'
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1080#1079' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1092#1072#1081#1083#1072' ...'
      OnClick = popTvObjLoadFromFileClick
    end
    object popTvObjSaveToTable: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1041#1044
      Hint = 
        #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1089#1095#1077#1090#1086#1074' '#1074' '#1090#1072#1073#1083#1080#1094#1099' Kd_Sbu '#1080' Sbu_Txt ('#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1077 +
        ' '#1079#1072#1087#1080#1089#1080' '#1091#1076#1072#1083#1103#1102#1090#1089#1103')'
      OnClick = popTvObjSaveToTableClick
    end
    object popTvObjLoadFromTable: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1041#1044
      Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1077#1088#1077#1074#1072' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' Kd_Sbu'
    end
    object popTvRebuildObjTable: TMenuItem
      Caption = 'RebuildObjTable'
      OnClick = popTvRebuildObjTableClick
    end
  end
  object qryTmp: TQuery
    Left = 24
    Top = 136
  end
  object SaveDialog: TSaveDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 276
    Top = 31
  end
  object OpenDialog: TOpenDialog
    Left = 316
    Top = 31
  end
  object qryObj: TQuery
    CachedUpdates = True
    AfterPost = qryObjAfterPost
    AfterDelete = qryObjAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_KdObj '
      '  order by AIndx, Lvl, PIndx'
      '')
    UpdateObject = updObj
    Left = 16
    Top = 56
    object qryObjNR: TIntegerField
      DisplayWidth = 1
      FieldName = 'NR'
      Origin = 'DbMain.Z_KDOBJ.NR'
    end
    object qryObjKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_KDOBJ.KDSPS'
    end
    object qryObjKDOBJ: TSmallintField
      DisplayWidth = 7
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_KDOBJ.KDOBJ'
    end
    object qryObjSHOBJ: TStringField
      DisplayWidth = 14
      FieldName = 'SHOBJ'
      Origin = 'DbMain.Z_KDOBJ.SHOBJ'
      Size = 15
    end
    object qryObjNMOBJ: TStringField
      DisplayWidth = 30
      FieldName = 'NMOBJ'
      Origin = 'DbMain.Z_KDOBJ.NMOBJ'
      Size = 65
    end
    object qryObjAINDX: TSmallintField
      DisplayWidth = 4
      FieldName = 'AINDX'
      Origin = 'DbMain.Z_KDOBJ.AINDX'
    end
    object qryObjPINDX: TSmallintField
      DisplayWidth = 3
      FieldName = 'PINDX'
      Origin = 'DbMain.Z_KDOBJ.PINDX'
    end
    object qryObjLVL: TSmallintField
      DisplayWidth = 2
      FieldName = 'LVL'
      Origin = 'DbMain.Z_KDOBJ.LVL'
    end
    object qryObjINDX: TSmallintField
      DisplayWidth = 3
      FieldName = 'INDX'
      Origin = 'DbMain.Z_KDOBJ.INDX'
    end
    object qryObjHSCH: TStringField
      DisplayWidth = 2
      FieldName = 'HSCH'
      Origin = 'DbMain.Z_KDOBJ.HSCH'
      FixedChar = True
      Size = 1
    end
    object qryObjKDSPZ: TSmallintField
      DisplayWidth = 15
      FieldName = 'KDSPZ'
    end
    object qryObjKDUPOS: TSmallintField
      DisplayWidth = 15
      FieldName = 'KDUPOS'
    end
    object qryObjKASSA: TSmallintField
      DisplayWidth = 15
      FieldName = 'KASSA'
    end
    object qryObjFIOUPOLN: TStringField
      DisplayWidth = 36
      FieldName = 'FIOUPOLN'
      Size = 25
    end
    object qryObjSBU: TStringField
      FieldName = 'SBU'
      Origin = 'DbMain.Z_KDOBJ.SBU'
      FixedChar = True
      Size = 10
    end
    object qryObjSZATR: TStringField
      FieldName = 'SZATR'
      Origin = 'DbMain.Z_KDOBJ.SZATR'
      FixedChar = True
      Size = 10
    end
    object qryObjSPZ: TStringField
      FieldKind = fkLookup
      FieldName = 'SpZ'
      LookupDataSet = Form_Dm.cdsSbuLU
      LookupKeyFields = 'KDSCH'
      LookupResultField = 'SCHBU'
      KeyFields = 'KDSPZ'
      Size = 10
      Lookup = True
    end
    object qryObjNR_GORD: TStringField
      FieldName = 'NR_GORD'
      Origin = 'DbMain.Z_KDOBJ.NR_GORD'
      FixedChar = True
      Size = 10
    end
  end
  object dsrcObj: TDataSource
    DataSet = qryObj
    Left = 22
    Top = 66
  end
  object updObj: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_KdObj'
      'set'
      '  KDSPS = :KDSPS,'
      '  KDOBJ = :KDOBJ,'
      '  SHOBJ = :SHOBJ,'
      '  NMOBJ = :NMOBJ,'
      '  AINDX = :AINDX,'
      '  PINDX = :PINDX,'
      '  LVL = :LVL,'
      '  INDX = :INDX,'
      '  HSCH = :HSCH,'
      '  SZATR = :SZATR,'
      '  SBU = :SBU,'
      '  KDUPOS = :KDUPOS,'
      '  KASSA = :KASSA,'
      '  FIOUPOLN = :FIOUPOLN,'
      '  KDSPZ = :KDSPZ,'
      '  NR_GORD = :NR_GORD'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_KdObj'
      
        '  (KDSPS, KDOBJ, SHOBJ, NMOBJ, AINDX, PINDX, LVL, INDX, HSCH, SZ' +
        'ATR, '
      'SBU, '
      '   KDUPOS, KASSA, FIOUPOLN, KDSPZ, NR_GORD)'
      'values'
      
        '  (:KDSPS, :KDOBJ, :SHOBJ, :NMOBJ, :AINDX, :PINDX, :LVL, :INDX, ' +
        ':HSCH, '
      '   :SZATR, :SBU, :KDUPOS, :KASSA, :FIOUPOLN, :KDSPZ, :NR_GORD)')
    DeleteSQL.Strings = (
      'delete from Z_KdObj'
      'where'
      '  NR = :OLD_NR')
    Left = 30
    Top = 74
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'ShObj'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmObj'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'AIndx'
        DataType = ftInteger
      end
      item
        Name = 'PIndx'
        DataType = ftInteger
      end
      item
        Name = 'Lvl'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'OnAindx'
        Fields = 'AIndx'
      end>
    IndexName = 'OnAindx'
    Params = <>
    StoreDefs = True
    Left = 549
    Top = 152
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 568
    Top = 168
  end
end
