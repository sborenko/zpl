object FormGoNumbs: TFormGoNumbs
  Left = 314
  Top = 184
  Width = 465
  Height = 450
  ActiveControl = dbgrGo
  BorderIcons = [biSystemMenu]
  Caption = 'FormGoNumbs'
  Color = clBtnFace
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 450
  Constraints.MinWidth = 465
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
  DesignSize = (
    457
    423)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 394
    Width = 287
    Height = 28
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 
      #1042#1074#1077#1076#1080#1090#1077' '#1089#1095#1105#1090', '#1085#1086#1084#1077#1088' '#1078#1091#1088#1085#1072#1083#1072'-'#1086#1088#1076#1077#1088#1072' '#1076#1083#1103' '#1101#1090#1086#1075#1086' '#1089#1095#1105#1090#1072'     '#1080' '#1076#1072#1090#1091', '#1089 +
      ' '#1082#1086#1090#1086#1088#1086#1081' '#1074#1074#1086#1076#1080#1090#1089#1103' '#1101#1090#1086#1090' '#1085#1086#1084#1077#1088' '#1078#1091#1088#1085#1072#1083#1072'-'#1086#1088#1076#1077#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object dbgrGo: TDBGrid
    Left = 2
    Top = 31
    Width = 453
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 11009242
    DataSource = dsrcGo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEditButtonClick = dbgrGoEditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'SCHBU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GONR'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBEG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSBU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 126
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      457
      30)
    object LabelCntRec: TLabel
      Left = 168
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnAdd: TSpeedButton
      Left = 3
      Top = 3
      Width = 25
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = popAddRecClick
    end
    object sBtnEdt: TSpeedButton
      Left = 30
      Top = 3
      Width = 25
      Height = 25
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = popEdtRecClick
    end
    object sBtnDel: TSpeedButton
      Left = 57
      Top = 3
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FF33337F3333F73993777337777993377FFFF77FFFF773339900000000
        9933337777777777773333399FFFFFF997333337F33333337F33333099FFFF99
        07333337F3FF3FFF7F333330F99F099F07333337F77377737F333330FF9999FF
        07333FF7F3FFFF3F7FFF3330F0F99F0F03337777F7777373777F3330FF999FFF
        03333777F3FF3FFF77773330F99F990003333337F77377777333333099FF0990
        33333337F3FF7F37F3333339908F0F9933333337F7737F77FF333399FFFF0039
        93333337FFFF77377FF33990000003339933337777777F3377FF993333333333
        3993377333377333377333333333333333337333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = popDelRecClick
    end
    object dbNavGo: TDBNavigator
      Left = 84
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcGo
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
        #1053#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
        #1053#1072' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
        #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object bBtnClose: TBitBtn
      Left = 379
      Top = 3
      Width = 75
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  end
  object qryGo: TQuery
    CachedUpdates = True
    BeforePost = qryGoBeforePost
    AfterPost = qryGoAfterPost
    AfterDelete = qryGoAfterDelete
    OnNewRecord = qryGoNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Go_Numbs')
    UpdateObject = updGo
    Left = 88
    Top = 120
    object qryGoNR: TIntegerField
      DisplayWidth = 6
      FieldName = 'NR'
      Origin = 'DbMain.GO_NUMBS.NR'
    end
    object qryGoDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      DisplayWidth = 12
      FieldName = 'DTBEG'
      Origin = 'DbMain.GO_NUMBS.DTBEG'
      EditMask = '!99/99/9999;1;_'
    end
    object qryGoKDSBU: TSmallintField
      DisplayLabel = 'KdSbu'
      DisplayWidth = 7
      FieldName = 'KDSBU'
      Origin = 'DbMain.GO_NUMBS.KDSBU'
    end
    object qryGoSCHBU: TStringField
      DisplayLabel = #1057#1095#1105#1090
      DisplayWidth = 8
      FieldName = 'SCHBU'
      Origin = 'DbMain.GO_NUMBS.SCHBU'
      OnValidate = qryGoSCHBUValidate
      FixedChar = True
      Size = 15
    end
    object qryGoGONR: TStringField
      DisplayLabel = #8470' '#1078'/'#1086#1088#1076'.'
      DisplayWidth = 18
      FieldName = 'GONR'
      Origin = 'DbMain.GO_NUMBS.GONR'
      FixedChar = True
      Size = 15
    end
    object qryGoNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 66
      FieldName = 'NOTES'
      Origin = 'DbMain.GO_NUMBS.NOTES'
      Size = 55
    end
  end
  object dsrcGo: TDataSource
    DataSet = qryGo
    Left = 104
    Top = 136
  end
  object updGo: TUpdateSQL
    ModifySQL.Strings = (
      'update Go_Numbs'
      'set'
      '  NR = :NR,'
      '  DTBEG = :DTBEG,'
      '  KDSBU = :KDSBU,'
      '  SCHBU = :SCHBU,'
      '  GONR = :GONR,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Go_Numbs'
      '  (NR, DTBEG, KDSBU, SCHBU, GONR, NOTES)'
      'values'
      '  (:NR, :DTBEG, :KDSBU, :SCHBU, :GONR, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Go_Numbs'
      'where'
      '  NR = :OLD_NR')
    Left = 120
    Top = 152
  end
  object qryTmp: TQuery
    Left = 184
    Top = 120
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 16
    Top = 120
    object popAddRec: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnClick = popAddRecClick
    end
    object popEdtRec: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnClick = popEdtRecClick
    end
    object popDelRec: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnClick = popDelRecClick
    end
  end
end
