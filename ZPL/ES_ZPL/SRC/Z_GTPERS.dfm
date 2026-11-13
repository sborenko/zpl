object FormKatPers: TFormKatPers
  Left = 469
  Top = 251
  Width = 322
  Height = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'FormKatPers'
  Color = clBtnFace
  Constraints.MaxHeight = 560
  Constraints.MaxWidth = 425
  Constraints.MinHeight = 175
  Constraints.MinWidth = 260
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
  object dbgrKatPers: TDBGrid
    Left = 0
    Top = 0
    Width = 314
    Height = 141
    Align = alClient
    DataSource = dsrcKatPers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = popMnu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrKatPersDrawColumnCell
    OnDblClick = dbgrKatPersDblClick
    OnKeyDown = dbgrKatPersKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKATP'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMKATP'
        Width = 171
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 141
    Width = 314
    Height = 27
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      314
      27)
    object sBtnSelCurrent: TSpeedButton
      Left = 3
      Top = 2
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
      Left = 28
      Top = 2
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
      Left = 53
      Top = 2
      Width = 23
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
    object bBtnOk: TBitBtn
      Left = 155
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 231
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryKatPers: TQuery
    CachedUpdates = True
    BeforePost = qryKatPersBeforePost
    AfterPost = qryKatPersAfterPost
    AfterDelete = qryKatPersAfterPost
    DatabaseName = 'DbMain'
    RequestLive = True
    SQL.Strings = (
      'Select * from Z_KatPers')
    UpdateObject = updKatPers
    Left = 24
    Top = 32
    object qryKatPersNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KATPERS.NR'
    end
    object qryKatPersKDKATP: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_KATPERS.KDKATP'
    end
    object qryKatPersSHKATP: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHKATP'
      Origin = 'DbMain.Z_KATPERS.SHKATP'
      Size = 10
    end
    object qryKatPersNMKATP: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'NMKATP'
      Origin = 'DbMain.Z_KATPERS.NMKATP'
      Size = 35
    end
  end
  object dsrcKatPers: TDataSource
    DataSet = qryKatPers
    Left = 32
    Top = 40
  end
  object updKatPers: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_KatPers'
      'set'
      '  SHKATP = :SHKATP,'
      '  NMKATP = :NMKATP'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_KatPers'
      '  (KDKATP, SHKATP, NMKATP)'
      'values'
      '  (:KDKATP, :SHKATP, :NMKATP)')
    DeleteSQL.Strings = (
      'delete from Z_KatPers'
      'where'
      '  NR = :OLD_NR ')
    Left = 40
    Top = 48
  end
  object qryTmp: TQuery
    Left = 176
    Top = 40
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 120
    Top = 56
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
    object popSep: TMenuItem
      Caption = '-'
    end
    object popSets: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' ...'
      object popSetFont: TMenuItem
        Caption = '- '#1096#1088#1080#1092#1090' '#1090#1072#1073#1083#1080#1094#1099
        OnClick = popSetFontClick
      end
      object popSetFon: TMenuItem
        Caption = '- '#1092#1086#1085' '#1090#1072#1073#1083#1080#1094#1099
        OnClick = popSetFonClick
      end
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 88
  end
end
