object FormTSbu: TFormTSbu
  Left = 316
  Top = 240
  Width = 669
  Height = 510
  ActiveControl = TV
  BorderIcons = [biSystemMenu]
  Caption = 'FormTSbu'
  Color = clBtnFace
  Constraints.MinHeight = 390
  Constraints.MinWidth = 342
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = popTree
  OnClose = FormClose
  OnCreate = FormCreate
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object LabelPopMsg: TLabel
    Left = 0
    Top = 0
    Width = 661
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1099#1079#1099#1074#1072#1081#1090#1077' '#1074#1089#1087#1083#1099#1074#1072#1102#1097#1077#1077' '#1084#1077#1085#1102' '#1087#1088#1072#1074#1086#1081' '#1082#1083#1072#1074#1080#1096#1077#1081' '#1084#1099#1096#1082#1080
    Color = clAqua
    ParentColor = False
    Visible = False
  end
  object LabelNotFound: TLabel
    Left = 0
    Top = 13
    Width = 661
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1077#1085#1085#1099#1081' '#1089#1095#1077#1090' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LabelIsSborny: TLabel
    Left = 0
    Top = 26
    Width = 661
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1077#1085#1085#1099#1081' '#1089#1095#1077#1090' - '#1089#1073#1086#1088#1085#1099#1081'. '#1053#1072' '#1085#1077#1075#1086' '#1086#1090#1085#1086#1089#1080#1090#1100' '#1085#1077#1083#1100#1079#1103'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LabelErr3: TLabel
    Left = 0
    Top = 39
    Width = 661
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1057#1076#1077#1083#1072#1081#1090#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1074#1099#1073#1086#1088' '#1080#1079' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1089#1095#1077#1090#1086#1074'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 455
    Width = 661
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      661
      28)
    object LabelMsg: TLabel
      Left = 2
      Top = 1
      Width = 367
      Height = 26
      AutoSize = False
      Caption = 
        #1050#1083#1072#1074#1080#1096#1077#1081' <F8> '#1080#1083#1080' '#1082#1085#1086#1087#1082#1086#1081' '#1089' '#1079#1077#1083#1077#1085#1086#1081' '#1087#1090#1080#1095#1082#1086#1081' '#1080#1083#1080' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' ' +
        #1084#1099#1096#1082#1080' '#1074#1099#1076#1077#1083#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1089#1095#1077#1090#1072' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1074#1086#1076'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object sBtnSelCurrent: TSpeedButton
      Left = 369
      Top = 3
      Width = 23
      Height = 25
      Hint = #1052#1077#1090#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102
      Anchors = [akLeft, akBottom]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnSelCurrentClick
    end
    object sBtnSelAll: TSpeedButton
      Left = 394
      Top = 3
      Width = 23
      Height = 25
      Hint = #1052#1077#1090#1080#1090#1100' '#1074#1089#1077
      Anchors = [akLeft, akBottom]
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
      Visible = False
      OnClick = sBtnSelAllClick
    end
    object sBtnUnSelAll: TSpeedButton
      Left = 419
      Top = 3
      Width = 24
      Height = 25
      Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077
      Anchors = [akLeft, akBottom]
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
      Visible = False
      OnClick = sBtnUnSelAllClick
    end
    object sBtnPSCH: TSpeedButton
      Left = 436
      Top = 3
      Width = 43
      Height = 25
      Hint = 'ParentSchetBU'
      Anchors = [akRight, akBottom]
      Caption = 'PSch'
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnPSCHClick
    end
    object sBtnPrt: TSpeedButton
      Left = 3
      Top = 3
      Width = 65
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Anchors = [akLeft, akBottom]
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
      Left = 522
      Top = 3
      Width = 65
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      OnClick = bBtnOkClick
      Kind = bkOK
      Spacing = 0
    end
    object bBtnCancel: TBitBtn
      Left = 588
      Top = 3
      Width = 73
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
    object ChBoxFullExpand: TCheckBox
      Left = 73
      Top = 2
      Width = 89
      Height = 28
      Hint = #1042#1089#1077#1075#1076#1072' '#1087#1088#1080' '#1086#1090#1082#1088#1099#1090#1080#1080' '#1092#1086#1088#1084#1099' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1088#1072#1079#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1089#1095#1077#1090#1086#1074
      Alignment = taLeftJustify
      Caption = #1054#1090#1082#1088#1099#1074#1072#1090#1100' '#1088#1072#1079#1074#1077#1088#1085#1091#1090#1099#1084
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      WordWrap = True
      OnClick = ChBoxFullExpandClick
    end
    object chBoxV: TCheckBox
      Left = 486
      Top = 5
      Width = 24
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akRight, akBottom]
      Caption = '#'
      TabOrder = 3
      OnClick = chBoxVClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 52
    Width = 359
    Height = 403
    Align = alClient
    Caption = 'Panel2'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    OnClick = ChBoxFullExpandClick
    DesignSize = (
      359
      403)
    object SplitterSbu: TSplitter
      Left = 1
      Top = 287
      Width = 357
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Color = clTeal
      ParentColor = False
    end
    object TV: TTreeView
      Left = 1
      Top = 11
      Width = 357
      Height = 276
      Hint = #1044#1077#1088#1077#1074#1086' '#1089#1095#1077#1090#1086#1074
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 14612478
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HideSelection = False
      Indent = 19
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popTree
      ReadOnly = True
      RightClickSelect = True
      ShowHint = True
      TabOrder = 0
      OnChange = TVChange
      OnCustomDrawItem = TVCustomDrawItem
      OnDblClick = TVDblClick
      OnEnter = TVEnter
      OnExit = TVExit
      OnKeyDown = TVKeyDown
    end
    object dbgrSBU: TDBGrid
      Left = 1
      Top = 290
      Width = 357
      Height = 112
      Align = alBottom
      Color = clMoneyGreen
      DataSource = dsrcSbu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrSBUDrawColumnCell
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'NR'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDSCH'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDPSCH'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SCHBU'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PSCH'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SCH_17'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PS_17'
          Width = 42
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ARC'
          Width = 16
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMSCH'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AINDX'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PINDX'
          Width = 18
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'LVL'
          Width = 13
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INDX'
          Width = 14
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HSCH'
          Width = 15
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOPPRIZN'
          Width = 1
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OLDSCHET'
          Width = 1
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_GORD'
          Width = 1
          Visible = True
        end>
    end
    object PanelSvSch: TPanel
      Left = 94
      Top = 138
      Width = 212
      Height = 146
      Anchors = [akRight, akBottom]
      Caption = 'PanelSvSch'
      TabOrder = 2
      object sBtnPanelSvSch: TSpeedButton
        Left = 187
        Top = 122
        Width = 22
        Height = 21
        Hint = #1047#1072#1082#1088#1099#1090#1100
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
        Spacing = 0
        OnClick = sBtnPanelSvSchClick
      end
      object dbgrSvSch: TDBGrid
        Left = 1
        Top = 1
        Width = 210
        Height = 120
        Hint = #1057#1086#1093#1088#1072#1085#1105#1085#1085#1099#1077' '#1088#1072#1079#1074#1105#1088#1085#1091#1090#1099#1077' '#1091#1079#1083#1099
        Align = alTop
        BorderStyle = bsNone
        Color = clMoneyGreen
        Ctl3D = False
        DataSource = dsrcSvSch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
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
            FieldName = 'KdSch'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SchBU'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSch'
            Width = 61
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 357
      Height = 10
      Align = alTop
      BevelOuter = bvNone
      Color = clMoneyGreen
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnClick = Panel4Click
      DesignSize = (
        357
        10)
      object sBtnExpandTV: TSpeedButton
        Left = 28
        Top = -2
        Width = 10
        Height = 10
        Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1076#1077#1088#1077#1074#1086
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'v'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = popTreeFullExpandClick
      end
      object sBtnCollapseTV: TSpeedButton
        Tag = 2
        Left = 322
        Top = -2
        Width = 10
        Height = 10
        Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1076#1077#1088#1077#1074#1086
        AllowAllUp = True
        Anchors = [akTop, akRight]
        GroupIndex = 2
        Caption = 'v'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = popTreeFullCollapseClick
      end
    end
    object dbcbf: TDBGrid
      Left = -1
      Top = 2
      Width = 359
      Height = 133
      DataSource = dsrctmpf
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      OnDblClick = dbcbfDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'kdSch'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sch_17'
          Title.Alignment = taCenter
          Title.Caption = #1057#1095#1077#1090
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NmSch'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1095#1077#1090#1072
          Width = 261
          Visible = True
        end>
    end
  end
  object PanelNabor: TPanel
    Left = 359
    Top = 52
    Width = 302
    Height = 403
    Align = alRight
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'PanelNabor'
    TabOrder = 2
    object LabelCntSel: TLabel
      Left = 0
      Top = 386
      Width = 298
      Height = 13
      Align = alBottom
      Alignment = taCenter
      Caption = 'LabelCntSel'
    end
    object dbgrTmp: TDBGrid
      Left = 0
      Top = 0
      Width = 298
      Height = 386
      Align = alClient
      BorderStyle = bsNone
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
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'SchBU'
          Title.Caption = #1057#1095#1077#1090
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NmSch'
          Title.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 226
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 392
    Top = 352
    Width = 185
    Height = 41
    Caption = 'Panel3'
    TabOrder = 3
    Visible = False
  end
  object qryTmp: TQuery
    Left = 219
    Top = 131
  end
  object popTree: TPopupMenu
    OnPopup = popTreePopup
    Left = 64
    Top = 16
    object popTreeSep1: TMenuItem
      Caption = '= = =    '#1056#1072#1073#1086#1090#1072' '#1089#1086' '#1089#1095#1077#1090#1072#1084#1080'    = = ='
      Enabled = False
    end
    object popTreeEdtWithDate: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1079#1072#1076#1072#1085#1085#1086#1081' '#1076#1072#1090#1099' ...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1095#1105#1090' '#1080'/'#1080#1083#1080' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1079#1072#1076#1072#1085#1085#1086#1081' '#1076#1072#1090#1099
      Visible = False
    end
    object popTreeFind: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1089#1095#1105#1090#1072
      ShortCut = 114
      OnClick = popTreeFindClick
    end
    object popTreeEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
      OnClick = popTreeEdtClick
    end
    object popTreeListObdt: TMenuItem
      Caption = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1089#1095#1077#1090#1091
    end
    object popTreeAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      object popTreeAddInRoot: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1095#1105#1090' '#1074' '#1082#1086#1088#1077#1085#1100
        Hint = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1076#1086#1073#1072#1074#1083#1103#1077#1090#1089#1103' '#1074' '#1082#1086#1088#1077#1085#1100' '#1087#1086#1083#1077#1076#1085#1080#1084
        Visible = False
        OnClick = popTreeAddInRootClick
      end
      object popTreeAddLastInCurrent: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1095#1105#1090' '#1087#1086#1089#1083#1077#1076#1085#1080#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
        Checked = True
        Visible = False
        OnClick = popTreeAddLastInCurrentClick
      end
      object popTreeAddFirstInCurrent: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1095#1105#1090' '#1087#1077#1088#1074#1099#1084' '#1074' '#1090#1077#1082#1097#1080#1081' '#1091#1079#1077#1083' ('#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100')'
        Checked = True
        Visible = False
        OnClick = popTreeAddFirstInCurrentClick
      end
      object popTreeInsertBeforeCurrent: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1095#1105#1090' '#1085#1086#1074#1099#1081' '#1074#1087#1077#1088#1077#1076#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072
        Checked = True
        OnClick = popTreeInsertBeforeCurrentClick
      end
      object popTreeCreNewParentMovInNewNode: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1059#1047#1051#1054#1042#1054#1049' '#1089#1095#1105#1090
        Hint = 
          '  '#1057#1086#1079#1076#1072#1089#1090#1089#1103' '#1085#1086#1074#1099#1081' '#1059#1047#1051#1054#1042#1054#1049' '#1089#1095#1105#1090' ('#1089' '#1073#1077#1079#1099#1084#1103#1085#1085#1099#1084' "'#1076#1080#1090#1105#1084'") '#1076#1083#1103' '#1087#1086#1089#1083#1077#1076 +
          #1091#1102#1097#1077#1075#1086' '#1074#1074#1086#1076#1072' '#1080#1083#1080' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1074' '#1085#1077#1075#1086' "'#1076#1080#1090#1077#1081'"'
        OnClick = popTreeCreNewParentMovInNewNodeClick
      end
      object popTreeMovInNewNode: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1059#1047#1051#1054#1042#1054#1049',  '#1090#1077#1082#1091#1097#1080#1081' '#1074#1074#1077#1089#1090#1080' '#1074#1085#1091#1090#1088#1100
        Hint = 
          #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1091#1079#1083#1086#1074#1086#1081' '#1101#1083#1077#1084#1077#1085#1090', '#1090#1077#1082#1091#1097#1080#1081' '#1074#1074#1077#1089#1090#1080' '#1074#1086' '#1074#1085#1086#1074#1100' '#1089#1086#1079#1076#1072#1085#1085#1099#1081 +
          ' '#1074' '#1082#1072#1095#1077#1089#1090#1074#1077' '#1087#1077#1088#1074#1086#1075#1086' '#1076#1086#1095#1077#1088#1085#1077#1075#1086
        Visible = False
        OnClick = popTreeMovInNewNodeClick
      end
      object popTreeAddInNode: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1095#1105#1090' '#1074#1085#1091#1090#1088#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1091#1079#1083#1072
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1089#1095#1105#1090' '#1074#1085#1091#1090#1088#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1059#1047#1051#1054#1042#1054#1043#1054' '#1089#1095#1105#1090#1072
        Visible = False
        OnClick = popTreeAddInNodeClick
      end
    end
    object popTreeMove: TMenuItem
      Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      object popTreeMoveInTo: TMenuItem
        Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074#1085#1091#1090#1088#1100' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
        Hint = #1059#1079#1077#1083'-'#1087#1088#1080#1077#1084#1085#1080#1082' '#1076#1086#1083#1078#1077#1085' '#1091#1078#1077' '#1089#1091#1097#1077#1089#1090#1074#1086#1074#1072#1090#1100
        OnClick = popTreeMoveInToClick
      end
      object popTreeMoveTo: TMenuItem
        Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
        Hint = 
          #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1089#1095#1105#1090' '#1074#1087#1077#1088#1077#1076#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072' ('#1085#1072' '#1090#1086#1084' '#1078#1077'  '#1091#1088#1086#1074#1085#1077', '#1095#1090#1086' '#1080' ' +
          #1079#1072#1076#1072#1085#1085#1099#1081' '#1091#1079#1077#1083')'
        OnClick = popTreeMoveToClick
      end
    end
    object popTreeDel: TMenuItem
      Caption = #1059' '#1076' '#1072' '#1083' '#1080' '#1090' '#1100'   '#1101' '#1083' '#1077' '#1084' '#1077' '#1085' '#1090
      Hint = #1055#1077#1088#1077#1076' '#1091#1076#1072#1083#1077#1085#1080#1077#1084' '#1073#1091#1076#1077#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1072' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1103
      OnClick = popTreeDelClick
    end
    object popTreeSep2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object popTvRaznoe: TMenuItem
      Caption = #1056#1072#1079#1085#1086#1077
      Visible = False
      object popTreePanelSvSch: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1089#1086#1093#1088#1072#1085#1105#1085#1085#1099#1093' '#1089#1095#1077#1090#1086#1074
        Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1089#1086#1093#1088#1072#1085#1105#1085#1085#1099#1093' '#1088#1072#1079#1074#1105#1088#1085#1091#1090#1099#1093' '#1089#1095#1077#1090#1086#1074
        Visible = False
        OnClick = popTreePanelSvSchClick
      end
      object popTreeChngNmTemu: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1090#1077#1084'...'
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1090#1077#1084', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1079#1072#1076#1072#1085#1085#1086#1081' '#1076#1072#1090#1099
        Visible = False
        OnClick = popTreeChngNmTemuClick
      end
      object popTreeSaveToTable: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1041#1044
        Hint = 
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1089#1095#1077#1090#1086#1074' '#1074' '#1090#1072#1073#1083#1080#1094#1099' Kd_Sbu '#1080' Sbu_Txt ('#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1077 +
          ' '#1079#1072#1087#1080#1089#1080' '#1091#1076#1072#1083#1103#1102#1090#1089#1103')'
        Visible = False
        OnClick = popTreeSaveToTableClick
      end
      object popTreeLoadFromTable: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1041#1044
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1077#1088#1077#1074#1072' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' Kd_Sbu'
        Visible = False
        OnClick = popTreeLoadFromTableClick
      end
      object popTreeLoadFromTvSbu: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1092#1072#1081#1083#1072
        Visible = False
        OnClick = popTreeLoadFromTvSbuClick
      end
    end
    object popTreeSep3: TMenuItem
      Caption = '-'
    end
    object popShwWhat: TMenuItem
      Caption = #1063#1090#1086' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100
      object popShwBoth: TMenuItem
        Caption = '- '#1085#1086#1074#1099#1077' '#1080' '#1089#1090#1072#1088#1099#1077' '#1089#1095#1077#1090#1072
        Checked = True
        OnClick = popShwBothClick
      end
      object popShwNew: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1085#1086#1074#1099#1077' ('#1089' 2017 '#1075'.)'
        OnClick = popShwNewClick
      end
      object popShwOld: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1089#1090#1072#1088#1099#1077' ( '#1076#1086' 2017 '#1075'.)'
        Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1090#1072#1088#1077' '#1089#1095#1077#1090#1072' '#1076#1086' 2017 '#1075'.'
        OnClick = popShwOldClick
      end
    end
    object popArc: TMenuItem
      Caption = #1040#1093#1080#1074#1085#1099#1077' '#1089#1095#1077#1090#1072' ...'
      Visible = False
      object popArcNoShw: TMenuItem
        Caption = '- '#1089#1082#1088#1099#1074#1072#1090#1100
        Checked = True
        OnClick = popArcNoShwClick
      end
      object popArcShw: TMenuItem
        Caption = '- '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100
        OnClick = popArcShwClick
      end
    end
    object popTreeFullExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTreeFullExpandClick
    end
    object popTreeFullCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTreeFullCollapseClick
    end
    object popTreeVubor: TMenuItem
      Caption = #1042#1099#1073#1086#1088
      Visible = False
      OnClick = TVDblClick
    end
  end
  object qrySbu: TQuery
    CachedUpdates = True
    AfterPost = qrySbuAfterPost
    AfterDelete = qrySbuAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from Kd_Sbu '
      '  order by AIndx, Lvl, PIndx'
      '')
    UpdateObject = updSbu
    Left = 24
    Top = 192
    object qrySbuNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.KD_SBU.NR'
    end
    object qrySbuKDSCH: TSmallintField
      FieldName = 'KDSCH'
      Origin = 'DbMain.KD_SBU.KDSCH'
    end
    object qrySbuSCHBU: TStringField
      FieldName = 'SCHBU'
      Origin = 'DbMain.KD_SBU.SCHBU'
      Size = 15
    end
    object qrySbuSCH_17: TStringField
      FieldName = 'SCH_17'
      Origin = 'DbMain.KD_SBU.SCH_17'
      FixedChar = True
      Size = 15
    end
    object qrySbuPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.KD_SBU.PSCH'
      Size = 15
    end
    object qrySbuNMSCH: TStringField
      DisplayWidth = 65
      FieldName = 'NMSCH'
      Origin = 'DbMain.KD_SBU.NMSCH'
      Size = 128
    end
    object qrySbuAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.KD_SBU.AINDX'
    end
    object qrySbuPINDX: TSmallintField
      FieldName = 'PINDX'
      Origin = 'DbMain.KD_SBU.PINDX'
    end
    object qrySbuLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.KD_SBU.LVL'
    end
    object qrySbuINDX: TSmallintField
      FieldName = 'INDX'
      Origin = 'DbMain.KD_SBU.INDX'
    end
    object qrySbuHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.KD_SBU.HSCH'
      FixedChar = True
      Size = 1
    end
    object qrySbuDOPPRIZN: TSmallintField
      FieldName = 'DOPPRIZN'
      Origin = 'DbMain.KD_SBU.DOPPRIZN'
    end
    object qrySbuOLDSCHET: TStringField
      FieldName = 'OLDSCHET'
      Origin = 'DbMain.KD_SBU.OLDSCHET'
      FixedChar = True
      Size = 5
    end
    object qrySbuNR_GORD: TStringField
      FieldName = 'NR_GORD'
      Origin = 'DbMain.KD_SBU.NR_GORD'
      Size = 10
    end
    object qrySbuPS_17: TStringField
      FieldName = 'PS_17'
      Origin = 'DbMain.KD_SBU.PS_17'
      FixedChar = True
      Size = 15
    end
    object qrySbuKDPSCH: TSmallintField
      FieldName = 'KDPSCH'
      Origin = 'DbMain.KD_SBU.KDPCH'
    end
    object qrySbuARC: TStringField
      FieldName = 'ARC'
      Origin = 'DbMain.KD_SBU.ARC'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcSbu: TDataSource
    DataSet = qrySbu
    Left = 38
    Top = 210
  end
  object updSbu: TUpdateSQL
    ModifySQL.Strings = (
      'update Kd_Sbu'
      'set'
      '  KDSCH = :KDSCH,'
      '  KDPSCH = :KDPSCH,'
      '  SCHBU = :SCHBU,'
      '  SCH_17 = :SCH_17,'
      '  PSCH = :PSCH,'
      '  AINDX = :AINDX,'
      '  LVL = :LVL,'
      '  PS_17 = :PS_17,'
      '  NMSCH = :NMSCH,'
      '  PINDX = :PINDX,'
      '  INDX = :INDX,'
      '  HSCH = :HSCH,'
      '  DOPPRIZN = :DOPPRIZN,'
      '  OLDSCHET = :OLDSCHET,'
      '  NR_GORD = :NR_GORD,'
      '  ARC = :ARC'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Kd_Sbu'
      
        '  (KDSCH, KDPSCH, SCHBU, SCH_17, PSCH, AINDX, LVL, PS_17, NMSCH,' +
        ' PINDX, '
      '   INDX, HSCH, DOPPRIZN, OLDSCHET, NR_GORD, ARC)'
      'values'
      
        '  (:KDSCH, :KDPSCH, :SCHBU, :SCH_17, :PSCH, :AINDX, :LVL, :PS_17' +
        ', :NMSCH, '
      '   :PINDX, :INDX, :HSCH, :DOPPRIZN, :OLDSCHET, :NR_GORD, :ARC)')
    DeleteSQL.Strings = (
      'delete from Kd_Sbu'
      'where'
      '  NR = :OLD_NR')
    Left = 54
    Top = 226
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
        Name = 'KdSbu'
        DataType = ftInteger
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmSch'
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
  object qryXXX: TQuery
    Left = 256
    Top = 128
  end
  object cdsSvSch: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdSch'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 267
    Top = 396
    object cdsSvSchKdSch: TSmallintField
      FieldName = 'KdSch'
    end
    object cdsSvSchSchBU: TStringField
      FieldName = 'SchBU'
      Size = 15
    end
    object cdsSvSchPSch: TStringField
      FieldName = 'PSch'
      Size = 15
    end
  end
  object dsrcSvSch: TDataSource
    DataSet = cdsSvSch
    Left = 280
    Top = 408
  end
  object cdsXXX: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdSch'
        DataType = ftSmallint
      end
      item
        Name = 'Sch'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Lvl'
        DataType = ftSmallint
      end
      item
        Name = 'AIndx'
        DataType = ftSmallint
      end
      item
        Name = 'PIndx'
        DataType = ftSmallint
      end
      item
        Name = 'Indx'
        DataType = ftSmallint
      end
      item
        Name = 'NmSch'
        DataType = ftString
        Size = 65
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 284
    object cdsXXXNR: TSmallintField
      FieldName = 'NR'
    end
    object cdsXXXKdSch: TSmallintField
      FieldName = 'KdSch'
    end
    object cdsXXXSch: TStringField
      FieldName = 'Sch'
      Size = 15
    end
    object cdsXXXAIndx: TSmallintField
      FieldName = 'AIndx'
    end
    object cdsXXXLvl: TSmallintField
      FieldName = 'Lvl'
    end
    object cdsXXXIndx: TSmallintField
      FieldName = 'Indx'
    end
    object cdsXXXPIndx: TSmallintField
      FieldName = 'PIndx'
    end
    object cdsXXXNmSch: TStringField
      FieldName = 'NmSch'
      Size = 65
    end
  end
  object cdsDbg: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Node'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'KdSch'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Sch_17'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'KdPSch'
        DataType = ftSmallint
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PS_17'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NmSch'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'NmPSch'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'Lvl'
        DataType = ftSmallint
      end
      item
        Name = 'AIndx'
        DataType = ftSmallint
      end
      item
        Name = 'PIndx'
        DataType = ftSmallint
      end
      item
        Name = 'Indx'
        DataType = ftSmallint
      end
      item
        Name = 'HsCh'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 12
    object cdsDbgNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsDbgNode: TStringField
      FieldName = 'Node'
      Size = 7
    end
    object cdsDbgKdSch: TSmallintField
      FieldName = 'KdSch'
    end
    object cdsDbgSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsDbgSch_17: TStringField
      FieldName = 'Sch_17'
      Size = 12
    end
    object cdsDbgKdPSch: TSmallintField
      FieldName = 'KdPSch'
    end
    object cdsDbgPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsDbgPS_17: TStringField
      FieldName = 'PS_17'
      Size = 12
    end
    object cdsDbgNmSch: TStringField
      FieldName = 'NmSch'
      Size = 65
    end
    object cdsDbgNmPSch: TStringField
      FieldName = 'NmPSch'
      Size = 65
    end
    object cdsDbgLvl: TSmallintField
      FieldName = 'Lvl'
    end
    object cdsDbgAIndx: TSmallintField
      FieldName = 'AIndx'
    end
    object cdsDbgPIndx: TSmallintField
      FieldName = 'PIndx'
    end
    object cdsDbgIndx: TSmallintField
      FieldName = 'Indx'
    end
    object cdsDbgHsCh: TBooleanField
      FieldName = 'HsCh'
    end
  end
  object dsrctmpf: TDataSource
    DataSet = qryTmp
    Left = 176
    Top = 132
  end
end
