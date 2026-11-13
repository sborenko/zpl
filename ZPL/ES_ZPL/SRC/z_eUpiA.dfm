object FormUpiAdd: TFormUpiAdd
  Left = 213
  Top = 86
  BorderStyle = bsSingle
  Caption = #1042#1074#1086#1076' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 616
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 505
    Top = 405
    Width = 98
    Height = 35
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1083#1103' '#1088#1077#1076#1072#1082#1090'. '#1092#1086#1088#1084#1072' '#1085#1077' '#1087#1088#1080#1084#1077#1085#1103#1077#1090#1089#1103'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 616
    Align = alLeft
    TabOrder = 2
    object PanelOldPos: TPanel
      Left = 1
      Top = 144
      Width = 458
      Height = 26
      Align = alTop
      TabOrder = 1
      DesignSize = (
        458
        26)
      object Label47: TLabel
        Left = 9
        Top = 6
        Width = 145
        Height = 13
        Caption = #1057#1090#1072#1088#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
        FocusControl = dbeDolgn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnDolgn: TSpeedButton
        Left = 434
        Top = 3
        Width = 15
        Height = 20
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Anchors = [akTop, akRight]
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnDolgnClick
      end
      object dbeDolgn: TDBEdit
        Left = 160
        Top = 3
        Width = 272
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        DataField = 'DOLGNOST'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnDblClick = sBtnDolgnClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeDolgnKeyDown
      end
    end
    object PanelPrevPos: TPanel
      Left = 1
      Top = 170
      Width = 458
      Height = 85
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        458
        85)
      object labelDkpp: TLabel
        Left = 219
        Top = 3
        Width = 37
        Height = 13
        Caption = #1050#1086#1076' '#1050#1055
      end
      object Label23: TLabel
        Left = 326
        Top = 3
        Width = 52
        Height = 13
        Caption = #1050#1086#1076' '#1047#1050#1055#1055
      end
      object Label24: TLabel
        Left = 5
        Top = 44
        Width = 134
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      end
      object sBtnGetOldOK: TSpeedButton
        Left = 434
        Top = 19
        Width = 15
        Height = 21
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1057#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1054#1050
        Anchors = [akTop, akRight]
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnGetOldOKClick
      end
      object Label25: TLabel
        Left = 219
        Top = 44
        Width = 169
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1077#1089#1089#1080#1080' '#1087#1086' '#1044#1050
      end
      object Label26: TLabel
        Left = 5
        Top = 4
        Width = 153
        Height = 13
        Caption = #1055#1088#1077#1076#1099#1076'. '#1050#1086#1076' '#1080' '#1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1054#1050
      end
      object dbeOldCode: TDBEdit
        Left = 219
        Top = 19
        Width = 106
        Height = 21
        Hint = #1050#1086#1076' '#1055#1060
        TabStop = False
        Color = clBtnFace
        DataField = 'OldCode'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeOldD_zkpp: TDBEdit
        Left = 325
        Top = 19
        Width = 107
        Height = 21
        Hint = #1050#1086#1076' '#1047#1050#1055#1055
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'OldD_Zkpp'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        OnEnter = dbeEnter
        OnExit = dbeOldD_zkppExit
      end
      object dbeOldNameD: TDBEdit
        Left = 4
        Top = 60
        Width = 215
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Color = clBtnFace
        DataField = 'OldNameD'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        OnDblClick = sBtnKdTemuClick
      end
      object dbeOldNameFull: TDBEdit
        Left = 219
        Top = 60
        Width = 230
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'OldNameFull'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
        OnDblClick = sBtnKdTemuClick
      end
      object dbeOldKdOk: TDBEdit
        Left = 4
        Top = 19
        Width = 70
        Height = 21
        DataField = 'OLDKDOK'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeOldDolgnOk: TDBEdit
        Left = 74
        Top = 19
        Width = 145
        Height = 21
        Hint = #1050#1086#1076' '#1055#1060
        TabStop = False
        Color = clBtnFace
        DataField = 'OldDolgnOk'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
    end
    object PanelNewPos: TPanel
      Left = 1
      Top = 255
      Width = 458
      Height = 84
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 3
      DesignSize = (
        458
        84)
      object Label28: TLabel
        Left = 5
        Top = 4
        Width = 144
        Height = 13
        Caption = #1053#1086#1074#1099#1077' '#1050#1086#1076' '#1080' '#1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1054#1050
      end
      object Label32: TLabel
        Left = 5
        Top = 43
        Width = 134
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      end
      object Label33: TLabel
        Left = 219
        Top = 43
        Width = 169
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1077#1089#1089#1080#1080' '#1087#1086' '#1044#1050
      end
      object sBtnGetNewOK: TSpeedButton
        Left = 434
        Top = 19
        Width = 15
        Height = 21
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1054#1050
        Anchors = [akTop, akRight]
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnGetNewOKClick
      end
      object Label30: TLabel
        Left = 219
        Top = 3
        Width = 37
        Height = 13
        Caption = #1050#1086#1076' '#1050#1055
      end
      object Label31: TLabel
        Left = 326
        Top = 3
        Width = 52
        Height = 13
        Caption = #1050#1086#1076' '#1047#1050#1055#1055
      end
      object dbeNewKdOk: TDBEdit
        Left = 4
        Top = 19
        Width = 70
        Height = 21
        DataField = 'NEWKDOK'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeNewDolgnOk: TDBEdit
        Left = 74
        Top = 19
        Width = 145
        Height = 21
        Hint = #1050#1086#1076' '#1055#1060
        TabStop = False
        Color = clBtnFace
        DataField = 'NewDolgnOK'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeNewCode: TDBEdit
        Left = 219
        Top = 19
        Width = 106
        Height = 21
        Hint = #1050#1086#1076' '#1055#1060
        TabStop = False
        Color = clBtnFace
        DataField = 'NewCODE'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeNewD_zkpp: TDBEdit
        Left = 325
        Top = 19
        Width = 106
        Height = 21
        Hint = #1050#1086#1076' '#1047#1050#1055#1055
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'NewD_zkpp'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        OnEnter = dbeEnter
        OnExit = dbeOldD_zkppExit
      end
      object dbeNewNameD: TDBEdit
        Left = 4
        Top = 59
        Width = 215
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Color = clBtnFace
        Ctl3D = True
        DataField = 'NewNameD'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        OnDblClick = sBtnKdTemuClick
      end
      object dbeNewNameFull: TDBEdit
        Left = 211
        Top = 59
        Width = 238
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'NewNameFull'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
        OnDblClick = sBtnKdTemuClick
      end
    end
    object PanelHead: TPanel
      Left = 1
      Top = 1
      Width = 458
      Height = 143
      Align = alTop
      TabOrder = 0
      DesignSize = (
        458
        143)
      object Label1: TLabel
        Left = 4
        Top = 79
        Width = 49
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
        FocusControl = dbeFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 169
        Top = 79
        Width = 22
        Height = 13
        Caption = #1048#1084#1103
        FocusControl = dbeIma
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 304
        Top = 79
        Width = 47
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        FocusControl = dbeOtch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelDtPriem: TLabel
        Left = 4
        Top = 32
        Width = 67
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1088#1080#1077#1084#1072
        FocusControl = dbeDtPriem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 75
        Top = 6
        Width = 197
        Height = 13
        Caption = #1048#1076#1077#1085#1090#1080#1092'. '#8470' '#1085#1072#1083#1086#1075#1086#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
        FocusControl = dbeID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label61: TLabel
        Left = 195
        Top = 32
        Width = 62
        Height = 13
        Caption = #1053'-'#1088' '#1087#1088#1080#1082#1072#1079#1072
        FocusControl = dbeNrPrikaza
      end
      object Label12: TLabel
        Left = 169
        Top = 123
        Width = 20
        Height = 13
        Caption = #1055#1086#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 304
        Top = 123
        Width = 63
        Height = 13
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
        WordWrap = True
      end
      object Label14: TLabel
        Left = 351
        Top = 32
        Width = 11
        Height = 13
        Caption = #1086#1090
      end
      object Label19: TLabel
        Left = 4
        Top = 54
        Width = 88
        Height = 13
        Caption = #1044#1072#1090#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
        FocusControl = dbeDtUvln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 195
        Top = 54
        Width = 62
        Height = 13
        Caption = #1053'-'#1088' '#1087#1088#1080#1082#1072#1079#1072
        FocusControl = dbeNrPrUvoln
      end
      object Label21: TLabel
        Left = 351
        Top = 54
        Width = 11
        Height = 13
        Caption = #1086#1090
      end
      object Bevel0: TBevel
        Left = 5
        Top = 26
        Width = 444
        Height = 4
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Bevel1: TBevel
        Left = 5
        Top = 74
        Width = 444
        Height = 4
        Shape = bsTopLine
      end
      object DBComboBoxPol: TDBComboBox
        Left = 197
        Top = 119
        Width = 43
        Height = 21
        Style = csDropDownList
        DataField = 'POL'
        DataSource = dsrcUpi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        Items.Strings = (
          #1052
          #1046)
        ParentFont = False
        TabOrder = 11
        OnEnter = DBComboBoxPolEnter
        OnExit = DBComboBoxPolExit
      end
      object dbeOtch: TDBEdit
        Left = 304
        Top = 96
        Width = 145
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OTCH'
        DataSource = dsrcUpi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDtPriem: TDBEdit
        Left = 99
        Top = 29
        Width = 80
        Height = 21
        Hint = #1054#1085#1072' '#1078#1077' '#1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
        DataField = 'DT_PRIEM'
        DataSource = dsrcPrmUv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = dbeEnter
        OnExit = dbeDtPriemExit
      end
      object dbeID: TDBEdit
        Left = 281
        Top = 3
        Width = 88
        Height = 21
        Hint = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ID'
        DataSource = dsrcUpi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = dbeEnter
        OnExit = dbeIDExit
      end
      object dbeNrPrikaza: TDBEdit
        Left = 262
        Top = 29
        Width = 80
        Height = 21
        Hint = #1053'-'#1088' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1087#1088#1080#1077#1084#1077
        AutoSize = False
        DataField = 'NR_PRIKAZA'
        DataSource = dsrcPrmUv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDOB: TDBEdit
        Left = 369
        Top = 119
        Width = 80
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DOB'
        DataSource = dsrcUpi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeIma: TDBEdit
        Left = 169
        Top = 96
        Width = 129
        Height = 21
        DataField = 'IMA'
        DataSource = dsrcUpi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeFam: TDBEdit
        Left = 4
        Top = 96
        Width = 157
        Height = 21
        DataField = 'FAM'
        DataSource = dsrcUpi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDtPrikaza: TDBEdit
        Left = 369
        Top = 29
        Width = 80
        Height = 21
        Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1087#1088#1080#1077#1084#1077
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        DataField = 'DT_PRIKAZA'
        DataSource = dsrcPrmUv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDtUvln: TDBEdit
        Left = 99
        Top = 51
        Width = 80
        Height = 21
        DataField = 'DT_UVOLN'
        DataSource = dsrcPrmUv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnEnter = dbeEnter
        OnExit = dbeDtUvlnExit
      end
      object dbeNrPrUvoln: TDBEdit
        Left = 262
        Top = 51
        Width = 80
        Height = 21
        Hint = #1053'-'#1088' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1080
        AutoSize = False
        DataField = 'NR_PRUVOLN'
        DataSource = dsrcPrmUv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDtPrUvoln: TDBEdit
        Left = 369
        Top = 51
        Width = 80
        Height = 21
        Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1080
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        DataField = 'DT_PRUVOLN'
        DataSource = dsrcPrmUv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object DbChBoxCitiz: TDBCheckBox
        Left = 4
        Top = 121
        Width = 105
        Height = 17
        Alignment = taLeftJustify
        Caption = #1043#1088#1072#1078#1076'.'#1059#1082#1088#1072#1080#1085#1099
        DataField = 'UkrCitiz'
        DataSource = dsrcUpi
        TabOrder = 10
        ValueChecked = 'Y'
        ValueUnchecked = ' '
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
    end
    object PanelBottom: TPanel
      Left = 1
      Top = 588
      Width = 458
      Height = 27
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 5
      DesignSize = (
        458
        27)
      object ChBoxAddInCurSps: TCheckBox
        Left = 8
        Top = 5
        Width = 217
        Height = 17
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072', '#1077#1089#1083#1080' '#1087#1086#1079#1074#1086#1083#1103#1077#1090' '#1076#1072#1090#1072' '#1087#1088#1080#1077#1084#1072
        TabStop = False
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object bBtnOk: TBitBtn
        Left = 292
        Top = 1
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1042#1074#1086#1076
        TabOrder = 1
        Kind = bkOK
      end
      object bBtnCancel: TBitBtn
        Left = 374
        Top = 1
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1082#1072#1079
        TabOrder = 2
        Kind = bkCancel
      end
    end
    object PanelOthers: TPanel
      Left = 1
      Top = 339
      Width = 458
      Height = 244
      Align = alTop
      TabOrder = 4
      DesignSize = (
        458
        244)
      object Label54: TLabel
        Left = 328
        Top = 88
        Width = 96
        Height = 13
        Caption = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1057#1041#1059
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label58: TLabel
        Left = 8
        Top = 46
        Width = 84
        Height = 13
        Caption = #1057#1080#1089#1090#1077#1084#1072' '#1086#1087#1083#1072#1090#1099
        FocusControl = dbeShSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label60: TLabel
        Left = 129
        Top = 134
        Width = 99
        Height = 13
        Caption = #1057#1093#1077#1084#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnVbrSPZ: TSpeedButton
        Left = 432
        Top = 104
        Width = 15
        Height = 20
        Hint = #1042#1099#1073#1086#1088' '#1057#1041#1059' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
        Anchors = [akTop, akRight]
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnVbrSPZClick
      end
      object Label63: TLabel
        Left = 387
        Top = 134
        Width = 47
        Height = 13
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1077#1086#1073#1083#1072#1075#1072#1077#1084#1099#1093' '#1084#1080#1085#1080#1084#1091#1084#1086#1074' '#1087#1086' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1084#1091' '#1085#1072#1083#1086#1075#1091
        Caption = '% '#1083#1100#1075#1086#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        WordWrap = True
      end
      object sBtnVbrShPdN: TSpeedButton
        Left = 215
        Top = 151
        Width = 15
        Height = 20
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnVbrShPdNClick
      end
      object sBtnVbrSO: TSpeedButton
        Left = 88
        Top = 63
        Width = 15
        Height = 20
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnVbrSOClick
      end
      object LabelOklTrf1: TLabel
        Left = 134
        Top = 46
        Width = 32
        Height = 13
        Caption = #1054#1082#1083#1072#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnKatP: TSpeedButton
        Left = 237
        Top = 19
        Width = 15
        Height = 20
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnKatPClick
      end
      object Label15: TLabel
        Left = 162
        Top = 4
        Width = 86
        Height = 13
        Caption = #1050#1072#1090#1077#1075'.'#1087#1077#1088#1089#1086#1085#1072#1083#1072
        WordWrap = True
      end
      object LabelObj: TLabel
        Left = 5
        Top = 4
        Width = 80
        Height = 13
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      end
      object sBtnObj: TSpeedButton
        Left = 144
        Top = 19
        Width = 15
        Height = 20
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnObjClick
      end
      object Label16: TLabel
        Left = 361
        Top = 4
        Width = 24
        Height = 13
        Caption = #1056#1072#1085#1075
        FocusControl = dbeRang
        Visible = False
      end
      object Label17: TLabel
        Left = 405
        Top = 4
        Width = 37
        Height = 13
        Caption = #1056#1072#1079#1088#1103#1076
        FocusControl = dbeRazr
        Visible = False
      end
      object Label4: TLabel
        Left = 255
        Top = 4
        Width = 96
        Height = 13
        Caption = #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1086
      end
      object sBtnSovm: TSpeedButton
        Left = 343
        Top = 19
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnSovmClick
      end
      object Label5: TLabel
        Left = 243
        Top = 134
        Width = 72
        Height = 13
        Hint = #1055#1088#1086#1094#1077#1085#1090' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1087#1088#1080' '#1085#1077#1087#1086#1083#1085#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1076#1085#1077
        Caption = '% '#1088#1072#1073#1086#1095'.'#1074#1088#1077#1084'.'
        ParentShowHint = False
        ShowHint = True
      end
      object sBtnKdBnk: TSpeedButton
        Left = 117
        Top = 193
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1041#1072#1085#1082#1080'"'
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnKdBnkClick
      end
      object Label9: TLabel
        Left = 5
        Top = 176
        Width = 25
        Height = 13
        Caption = #1041#1072#1085#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 235
        Top = 176
        Width = 23
        Height = 13
        Caption = #1057#1095#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 328
        Top = 134
        Width = 23
        Height = 13
        Hint = #1055#1088#1086#1089#1090#1072#1074#1083#1103#1077#1090#1089#1103' '#1075#1088#1091#1087#1087#1072' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080' '#1080#1083#1080' 0'
        Caption = #1048#1085#1074'.'
        FocusControl = dbeInv
        ParentShowHint = False
        ShowHint = True
      end
      object sBtnInvDocs: TSpeedButton
        Left = 358
        Top = 150
        Width = 15
        Height = 21
        Hint = #1044#1086#1082#1091#1084#1077#1085#1090#1099', '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1077' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnInvDocsClick
      end
      object sBtnLgt: TSpeedButton
        Left = 432
        Top = 151
        Width = 15
        Height = 21
        Hint = #1055#1077#1088#1077#1095#1077#1085#1100' '#1080' '#1080#1089#1090#1086#1088#1080#1103' '#1083#1100#1075#1086#1090
        Anchors = [akTop, akRight]
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnLgtClick
      end
      object Label22: TLabel
        Left = 5
        Top = 88
        Width = 91
        Height = 13
        Caption = #1058' '#1077' '#1084' '#1072'   '#1053' '#1048' '#1063
        FocusControl = dbeNmTemu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object sBtnKdTemu: TSpeedButton
        Left = 209
        Top = 104
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1090#1077#1084#1099' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1058#1077#1084#1099' '#1053#1048#1063'"'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnKdTemuClick
      end
      object Bevel3: TBevel
        Left = 4
        Top = 42
        Width = 444
        Height = 9
        Shape = bsTopLine
      end
      object Bevel4: TBevel
        Left = 4
        Top = 127
        Width = 444
        Height = 9
        Shape = bsTopLine
      end
      object Bevel5: TBevel
        Left = 4
        Top = 173
        Width = 444
        Height = 9
        Shape = bsTopLine
      end
      object Bevel6: TBevel
        Left = 4
        Top = 216
        Width = 444
        Height = 9
        Shape = bsTopLine
      end
      object LblNotes: TLabel
        Left = 8
        Top = 224
        Width = 63
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      end
      object LblBaseMnth: TLabel
        Left = 328
        Top = 45
        Width = 80
        Height = 13
        Caption = #1041#1072#1079#1086#1074#1099#1081' '#1084#1077#1089#1103#1094
      end
      object dbeOklad: TDBEdit
        Left = 134
        Top = 62
        Width = 61
        Height = 21
        Hint = #1054#1082#1083#1072#1076' '#1080#1083#1080' '#1095#1072#1089#1086#1074#1086#1081' '#1090#1072#1088#1080#1092
        AutoSize = False
        DataField = 'OKLTRF'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeAvans: TDBEdit
        Left = 224
        Top = 62
        Width = 69
        Height = 21
        Hint = #1057#1091#1084#1084#1072' '#1080#1083#1080' '#1087#1088#1086#1094#1077#1085#1090' '#1072#1074#1072#1085#1089#1072
        AutoSize = False
        DataField = 'AVANS'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeShSO: TDBEdit
        Left = 7
        Top = 62
        Width = 81
        Height = 21
        Hint = #1057#1080#1089#1090#1077#1084#1072' '#1086#1087#1083#1072#1090#1099
        DataField = 'ShSO'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 6
        OnDblClick = sBtnVbrSOClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeShSOKeyDown
      end
      object dbeNmShNlg: TDBEdit
        Left = 129
        Top = 150
        Width = 85
        Height = 21
        Hint = #1057#1093#1077#1084#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
        DataField = 'ShPdNlg'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 17
        OnDblClick = sBtnVbrShPdNClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeNmShNlgKeyDown
      end
      object DBCheckBoxPens: TDBCheckBox
        Left = 24
        Top = 132
        Width = 77
        Height = 17
        Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1087#1077#1085#1089#1080#1086#1085#1077#1088
        Alignment = taLeftJustify
        Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088
        DataField = 'PR_PENS'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object DBCheckBoxPrfs: TDBCheckBox
        Left = 5
        Top = 152
        Width = 96
        Height = 17
        Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1095#1083'.'#1087#1088#1086#1092#1089#1086#1102#1079#1072
        Alignment = taLeftJustify
        Caption = #1063#1083'.'#1087#1088#1086#1092#1089#1086#1102#1079#1072
        DataField = 'PRFS'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object DBCheckBox4: TDBCheckBox
        Left = 224
        Top = 45
        Width = 69
        Height = 17
        Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1086#1082#1083#1072#1076#1072', '#1073#1077#1079' "'#1075#1072#1083#1086#1095#1082#1080'" - '#1087#1086#1089#1090'.'#1089#1091#1084#1084#1072
        Alignment = taLeftJustify
        Caption = #1040#1074#1072#1085#1089' (%)'
        DataField = 'SP_AV'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        ValueChecked = '%'
        ValueUnchecked = 'S'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeObj: TDBEdit
        Left = 47
        Top = 19
        Width = 97
        Height = 21
        Hint = #1064#1080#1092#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        DataField = 'ShObj'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = sBtnObjClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeObjKeyDown
      end
      object dbeRang: TDBEdit
        Left = 361
        Top = 19
        Width = 44
        Height = 21
        DataField = 'RANG'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeRazr: TDBEdit
        Left = 405
        Top = 19
        Width = 44
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'RAZR'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Visible = False
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeProcLg: TDBEdit
        Left = 387
        Top = 150
        Width = 42
        Height = 21
        Hint = #1055#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PROCLG'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeShSovm: TDBEdit
        Left = 255
        Top = 19
        Width = 88
        Height = 21
        Hint = #1042#1080#1076' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        DataField = 'ShSovm'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = sBtnSovmClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeShSovmKeyDown
      end
      object dbeKdObj: TDBEdit
        Left = 5
        Top = 19
        Width = 43
        Height = 21
        Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        DataField = 'KDOBJ'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = sBtnObjClick
        OnEnter = dbeKdObjEnter
        OnExit = dbeKdObjExit
        OnKeyDown = dbeObjKeyDown
      end
      object dbePrcWrkTime: TDBEdit
        Left = 243
        Top = 150
        Width = 49
        Height = 21
        Hint = 
          #1055#1088#1080' '#1085#1077#1087#1086#1083#1085#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1076#1085#1077' % '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' ('#1053#1086#1088#1084#1072#1083#1100#1085#1086' 100% '#1080#1083#1080' ' +
          #1087#1091#1089#1090#1086')'
        DataField = 'PRCWRKTIME'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        OnEnter = dbeEnter
        OnExit = dbePrcWrkTimeExit
      end
      object edKatP: TEdit
        Left = 161
        Top = 19
        Width = 75
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = 'edKatP'
        OnDblClick = sBtnKatPClick
        OnEnter = EditEnter
        OnExit = edKatPExit
        OnKeyDown = edKatPKeyDown
      end
      object edSpZ: TEdit
        Left = 328
        Top = 104
        Width = 103
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        Text = 'edSpZ'
        OnDblClick = sBtnVbrSPZClick
        OnEnter = EditEnter
        OnExit = edSpZExit
        OnKeyDown = edSPZKeyDown
      end
      object edShBnk: TEdit
        Left = 5
        Top = 193
        Width = 111
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
        Text = 'edShBnk'
        OnDblClick = sBtnKdBnkClick
        OnEnter = EditEnter
        OnExit = EditExit
        OnKeyDown = edShBnkKeyDown
      end
      object dbeLisSch: TDBEdit
        Left = 235
        Top = 193
        Width = 214
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'LICSCH'
        DataSource = dsrcLS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeInv: TDBEdit
        Left = 328
        Top = 150
        Width = 30
        Height = 21
        Hint = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100'. '#1055#1088#1086#1089#1090#1072#1074#1083#1103#1077#1090#1089#1103' '#1075#1088#1091#1087#1087#1072' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080' (1-3) '#1080#1083#1080' 0'
        DataField = 'INV'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeKdTemu: TDBEdit
        Left = 5
        Top = 104
        Width = 45
        Height = 21
        Hint = #1050#1086#1076' '#1090#1077#1084#1099
        DataField = 'KdTemu'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnEnter = dbeEnter
        OnExit = dbeKdTemuExit
      end
      object dbeNmTemu: TDBEdit
        Left = 50
        Top = 104
        Width = 157
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Color = clBtnFace
        DataField = 'NmTemu'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
      end
      object dbeNPD: TDBEdit
        Left = 292
        Top = 150
        Width = 23
        Height = 21
        Hint = '1 '#1087#1088#1080' '#1085#1077#1087#1086#1083#1085#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1076#1085#1077
        TabStop = False
        Color = clBtnFace
        DataField = 'NPD'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
      end
      object DbeNotes: TDBEdit
        Left = 83
        Top = 220
        Width = 366
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NOTES'
        DataSource = dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
      end
      object DbChBoxBaseMnth: TDBCheckBox
        Left = 328
        Top = 62
        Width = 17
        Height = 17
        DataField = 'BM'
        DataSource = dsrcPere
        TabOrder = 10
        ValueChecked = 'Y'
        ValueUnchecked = ' '
        OnClick = DbChBoxBaseMnthClick
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object DbeBaseMnth: TDBEdit
        Left = 352
        Top = 62
        Width = 65
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DtBM'
        DataSource = dsrcPere
        TabOrder = 11
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
    end
  end
  object dbeKdSpZ: TDBEdit
    Left = 491
    Top = 127
    Width = 71
    Height = 21
    DataField = 'KdSpZ'
    DataSource = dsrcPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object dbeSPZ: TDBEdit
    Left = 575
    Top = 127
    Width = 57
    Height = 21
    Hint = #1054#1089#1085#1086#1074#1085#1086#1081' '#1057#1041#1059
    TabStop = False
    DataField = 'Spz'
    DataSource = dsrcPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
  end
  object DBCheckBoxInv: TDBCheckBox
    Left = 491
    Top = 161
    Width = 69
    Height = 17
    Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1080#1085#1074#1072#1083#1080#1076
    Alignment = taLeftJustify
    Caption = #1048#1085#1074#1072#1083#1080#1076
    DataField = 'INV'
    DataSource = dsrcPere
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
    Visible = False
    OnEnter = DBCheckBoxEnter
    OnExit = DBCheckBoxExit
  end
  object dbeTabNr: TDBEdit
    Left = 491
    Top = 99
    Width = 63
    Height = 21
    Hint = #1058#1072#1073'.'#1085#1086#1084#1077#1088' ('#1087#1088#1080#1089#1074#1072#1080#1074#1072#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080')'
    TabStop = False
    Color = clBtnFace
    DataField = 'TABN'
    DataSource = dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
  object qryPere: TQuery
    CachedUpdates = True
    BeforePost = qryPereBeforePost
    AfterPost = qryPereAfterPost
    OnCalcFields = qryPereCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_PERE'
      'where TabN = :TabN')
    UpdateObject = updPere
    Left = 543
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptInput
        Value = 10005
      end>
    object qryPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object qryPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PERE.TABN'
    end
    object qryPereDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_PERE.DT_BEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPereDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_PERE.DT_END'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryPereKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_PERE.KDKATP'
    end
    object qryPereOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083'/'#1058#1088#1092
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_PERE.OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryPereAVANS: TFloatField
      FieldName = 'AVANS'
      Origin = 'DbMain.Z_PERE.AVANS'
    end
    object qryPereSP_AV: TStringField
      FieldName = 'SP_AV'
      Origin = 'DbMain.Z_PERE.SP_AV'
      Size = 1
    end
    object qryPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'DbMain.Z_PERE.SO'
    end
    object qryPereDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNOST'
      Origin = 'DbMain.Z_PERE.DOLGNOST'
      Size = 40
    end
    object qryPereNR_PRIKAZA: TStringField
      DisplayLabel = #1055#1088#1080#1082#1072#1079' '#8470
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PERE.NR_PRIKAZA'
      Size = 10
    end
    object qryPereDT_PRIKAZA: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PERE.DT_PRIKAZA'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPerePR_PENS: TSmallintField
      DisplayLabel = #1055#1077#1085#1089
      FieldName = 'PR_PENS'
      Origin = 'DbMain.Z_PERE.PR_PENS'
    end
    object qryPereSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_PERE.SOVM'
    end
    object qryPereShSovm: TStringField
      FieldKind = fkLookup
      FieldName = 'ShSovm'
      LookupDataSet = DmMain.cdsSovm
      LookupKeyFields = 'KDSOVM'
      LookupResultField = 'SHSOVM'
      KeyFields = 'SOVM'
      Size = 15
      Lookup = True
    end
    object qryPerePDNLG: TSmallintField
      FieldName = 'PDNLG'
      Origin = 'DbMain.Z_PERE.PDNLG'
    end
    object qryPerePROCLG: TFloatField
      FieldName = 'PROCLG'
      Origin = 'DbMain.Z_PERE.PROCLG'
    end
    object qryPereKOLMIN: TSmallintField
      DisplayLabel = #1050'-'#1074#1086#1052#1080#1085
      FieldName = 'KOLMIN'
      Origin = 'DbMain.Z_PERE.KOLMIN'
    end
    object qryPereNmSO: TStringField
      DisplayLabel = #1057#1080#1089#1090#1054#1087#1083
      FieldKind = fkLookup
      FieldName = 'ShSO'
      LookupDataSet = DmMain.qrySysOpl_LU
      LookupKeyFields = 'KDOPL'
      LookupResultField = 'NMOPL'
      KeyFields = 'SO'
      Size = 25
      Lookup = True
    end
    object qryPereNmShPdn: TStringField
      DisplayLabel = #1057#1093#1055#1076#1053#1083#1075
      FieldKind = fkLookup
      FieldName = 'ShPdNlg'
      LookupDataSet = DmMain.qryShPdn_LU
      LookupKeyFields = 'KDSH'
      LookupResultField = 'SHSH'
      KeyFields = 'PDNLG'
      Size = 25
      Lookup = True
    end
    object qryPereKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_PERE.KDTEMU'
    end
    object qryPereNmTemu: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmTemu'
      Size = 65
      Calculated = True
    end
    object qryPereKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PERE.KDOBJ'
      OnValidate = qryPereKDOBJValidate
    end
    object qryPereNmKatP: TStringField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
      Lookup = True
    end
    object qryPereShObj: TStringField
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
      Lookup = True
    end
    object qryPerePRCWRKTIME: TFloatField
      FieldName = 'PRCWRKTIME'
      Origin = 'DbMain.Z_PERE.PRCWRKTIME'
    end
    object qryPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_PERE.KDSPZ'
    end
    object qryPerePRFS: TSmallintField
      FieldName = 'PRFS'
      Origin = 'DbMain.Z_PERE.PRFS'
    end
    object qryPereNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PERE.NOTES'
      Size = 35
    end
    object qryPereINV: TSmallintField
      FieldName = 'INV'
      Origin = 'DbMain.Z_PERE.INV'
    end
    object qryPereRANG: TSmallintField
      FieldName = 'RANG'
      Origin = 'DbMain.Z_PERE.RANG'
    end
    object qryPereRAZR: TSmallintField
      FieldName = 'RAZR'
      Origin = 'DbMain.Z_PERE.RAZR'
    end
    object qryPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_PERE.OLDKDOBJ'
    end
    object qryPereSpZ: TStringField
      FieldKind = fkLookup
      FieldName = 'SpZ'
      LookupDataSet = Form_Dm.cdsSbuLU
      LookupKeyFields = 'KDSCH'
      LookupResultField = 'SCH_17'
      KeyFields = 'KDSPZ'
      Size = 10
      Lookup = True
    end
    object qryPereKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_PERE.KDSPS'
    end
    object qryPereKDDOLGN: TSmallintField
      FieldName = 'KDDOLGN'
      Origin = 'DbMain.Z_PERE.KDDOLGN'
    end
    object qryPerePRDEKR: TStringField
      FieldName = 'PRDEKR'
      Origin = 'DbMain.Z_PERE.PRDEKR'
      FixedChar = True
      Size = 1
    end
    object qryPereCMBOKL: TStringField
      FieldName = 'CMBOKL'
      Origin = 'DbMain.Z_PERE.CMBOKL'
      FixedChar = True
      Size = 1
    end
    object qryPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_PERE.SPEC_NR'
    end
    object qryPereOLDKDOK: TSmallintField
      FieldName = 'OLDKDOK'
      Origin = 'DbMain.Z_PERE.OLDKDOK'
    end
    object qryPereNEWKDOK: TSmallintField
      FieldName = 'NEWKDOK'
      Origin = 'DbMain.Z_PERE.NEWKDOK'
    end
    object qryPereOldDolgnOk: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldDolgnOk'
      Size = 127
      Calculated = True
    end
    object qryPereOldCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldCode'
      Size = 10
      Calculated = True
    end
    object qryPereOldD_zkpp: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldD_zkpp'
      Size = 10
      Calculated = True
    end
    object qryPereOldNameD: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldNameD'
      Size = 254
      Calculated = True
    end
    object qryPereOldNameFull: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldNameFull'
      Size = 254
      Calculated = True
    end
    object qryPereNewDolgnOK: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewDolgnOK'
      Size = 127
      Calculated = True
    end
    object qryPereNewCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewCode'
      Size = 10
      Calculated = True
    end
    object qryPereNewD_zkpp: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewD_zkpp'
      Size = 10
      Calculated = True
    end
    object qryPereNewNameD: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewNameD'
      Size = 254
      Calculated = True
    end
    object qryPereNewNameFull: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewNameFull'
      Size = 254
      Calculated = True
    end
    object qryPereNPD: TSmallintField
      FieldName = 'NPD'
      Origin = 'DbMain.Z_PERE.NPD'
    end
    object qryPereBM: TStringField
      FieldName = 'BM'
      OnChange = qryPereBMChange
      Size = 1
    end
    object qryPereDtBM: TDateTimeField
      FieldName = 'DtBM'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object qryTmp: TQuery
    Left = 471
    Top = 256
  end
  object dsrcPere: TDataSource
    DataSet = qryPere
    Left = 559
    Top = 24
  end
  object updPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_PERE'
      'set'
      '  NR = :NR,'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  NPD = :NPD,'
      '  PRCWRKTIME = :PRCWRKTIME,'
      '  SO = :SO,'
      '  OKLTRF = :OKLTRF,'
      '  AVANS = :AVANS,'
      '  SP_AV = :SP_AV,'
      '  KDDOLGN = :KDDOLGN,'
      '  DOLGNOST = :DOLGNOST,'
      '  KDSPZ = :KDSPZ,'
      '  PR_PENS = :PR_PENS,'
      '  SOVM = :SOVM,'
      '  PDNLG = :PDNLG,'
      '  PROCLG = :PROCLG,'
      '  KOLMIN = :KOLMIN,'
      '  PRFS = :PRFS,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NOTES = :NOTES,'
      '  INV = :INV,'
      '  RANG = :RANG,'
      '  RAZR = :RAZR,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  PRDEKR = :PRDEKR,'
      '  CMBOKL = :CMBOKL,'
      '  SPEC_NR = :SPEC_NR,'
      '  OLDKDOK = :OLDKDOK,'
      '  NEWKDOK = :NEWKDOK,'
      '  BM=:BM,'
      '  DtBM=:DtBM'
      'where'
      '  NR = :OLD_NR and'
      '  KDSPS = :OLD_KDSPS and'
      '  TABN = :OLD_TABN and'
      '  DT_BEG = :OLD_DT_BEG and'
      '  KDTEMU = :OLD_KDTEMU and'
      '  KDOBJ = :OLD_KDOBJ and'
      '  KDKATP = :OLD_KDKATP and'
      '  NPD = :OLD_NPD and'
      '  PRCWRKTIME = :OLD_PRCWRKTIME and'
      '  SO = :OLD_SO and'
      '  OKLTRF = :OLD_OKLTRF and'
      '  AVANS = :OLD_AVANS and'
      '  SP_AV = :OLD_SP_AV and'
      '  KDDOLGN = :OLD_KDDOLGN and'
      '  DOLGNOST = :OLD_DOLGNOST and'
      '  KDSPZ = :OLD_KDSPZ and'
      '  PR_PENS = :OLD_PR_PENS and'
      '  SOVM = :OLD_SOVM and'
      '  PDNLG = :OLD_PDNLG and'
      '  PROCLG = :OLD_PROCLG and'
      '  KOLMIN = :OLD_KOLMIN and'
      '  PRFS = :OLD_PRFS and'
      '  NR_PRIKAZA = :OLD_NR_PRIKAZA and'
      '  DT_PRIKAZA = :OLD_DT_PRIKAZA and'
      '  NOTES = :OLD_NOTES and'
      '  INV = :OLD_INV and'
      '  RANG = :OLD_RANG and'
      '  RAZR = :OLD_RAZR and'
      '  DT_END = :OLD_DT_END and'
      '  OLDKDOBJ = :OLD_OLDKDOBJ and'
      '  PRDEKR = :OLD_PRDEKR and'
      '  CMBOKL = :OLD_CMBOKL and'
      '  SPEC_NR = :OLD_SPEC_NR and'
      '  OLDKDOK = :OLD_OLDKDOK and'
      '  NEWKDOK = :OLD_NEWKDOK')
    InsertSQL.Strings = (
      'insert into Z_PERE'
      
        '  (NR, KDSPS, TABN, DT_BEG, KDTEMU, KDOBJ, KDKATP, NPD, PRCWRKTI' +
        'ME, '
      'SO, '
      
        '   OKLTRF, AVANS, SP_AV, KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM' +
        ', '
      'PDNLG, '
      
        '   PROCLG, KOLMIN, PRFS, NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RAN' +
        'G, '
      'RAZR, '
      '   DT_END, OLDKDOBJ, PRDEKR, CMBOKL, SPEC_NR, OLDKDOK, '
      'NEWKDOK,IS_PERE,BM,DtBM)'
      'values'
      '  (:NR, :KDSPS, :TABN, :DT_BEG, :KDTEMU, :KDOBJ, :KDKATP, :NPD, '
      ':PRCWRKTIME, '
      
        '   :SO, :OKLTRF, :AVANS, :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :P' +
        'R_PENS, '
      
        '   :SOVM, :PDNLG, :PROCLG, :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIK' +
        'AZA, '
      ':NOTES, '
      
        '   :INV, :RANG, :RAZR, :DT_END, :OLDKDOBJ, :PRDEKR, :CMBOKL, :SP' +
        'EC_NR, '
      '   :OLDKDOK, :NEWKDOK,'#39'Y'#39',:BM,:DtBM)')
    DeleteSQL.Strings = (
      'delete from Z_PERE'
      'where'
      '  NR = :OLD_NR and'
      '  KDSPS = :OLD_KDSPS and'
      '  TABN = :OLD_TABN and'
      '  DT_BEG = :OLD_DT_BEG and'
      '  KDTEMU = :OLD_KDTEMU and'
      '  KDOBJ = :OLD_KDOBJ and'
      '  KDKATP = :OLD_KDKATP and'
      '  NPD = :OLD_NPD and'
      '  PRCWRKTIME = :OLD_PRCWRKTIME and'
      '  SO = :OLD_SO and'
      '  OKLTRF = :OLD_OKLTRF and'
      '  AVANS = :OLD_AVANS and'
      '  SP_AV = :OLD_SP_AV and'
      '  KDDOLGN = :OLD_KDDOLGN and'
      '  DOLGNOST = :OLD_DOLGNOST and'
      '  KDSPZ = :OLD_KDSPZ and'
      '  PR_PENS = :OLD_PR_PENS and'
      '  SOVM = :OLD_SOVM and'
      '  PDNLG = :OLD_PDNLG and'
      '  PROCLG = :OLD_PROCLG and'
      '  KOLMIN = :OLD_KOLMIN and'
      '  PRFS = :OLD_PRFS and'
      '  NR_PRIKAZA = :OLD_NR_PRIKAZA and'
      '  DT_PRIKAZA = :OLD_DT_PRIKAZA and'
      '  NOTES = :OLD_NOTES and'
      '  INV = :OLD_INV and'
      '  RANG = :OLD_RANG and'
      '  RAZR = :OLD_RAZR and'
      '  DT_END = :OLD_DT_END and'
      '  OLDKDOBJ = :OLD_OLDKDOBJ and'
      '  PRDEKR = :OLD_PRDEKR and'
      '  CMBOKL = :OLD_CMBOKL and'
      '  SPEC_NR = :OLD_SPEC_NR and'
      '  OLDKDOK = :OLD_OLDKDOK and'
      '  NEWKDOK = :OLD_NEWKDOK')
    Left = 575
    Top = 40
  end
  object qryPrmUv: TQuery
    CachedUpdates = True
    BeforePost = qryPrmUvBeforePost
    AfterPost = qryPrmUvAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_PrmUv'
      'where TabN = 1')
    UpdateObject = updPrmUv
    Left = 463
    Top = 8
    object qryPrmUvNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRMUV.NR'
    end
    object qryPrmUvKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_PRMUV.KDSPS'
    end
    object qryPrmUvTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PRMUV.TABN'
    end
    object qryPrmUvDT_PRIEM: TDateTimeField
      FieldName = 'DT_PRIEM'
      Origin = 'DbMain.Z_PRMUV.DT_PRIEM'
      OnSetText = qryPrmUvDT_PRIEMSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvDT_UVOLN: TDateTimeField
      FieldName = 'DT_UVOLN'
      Origin = 'DbMain.Z_PRMUV.DT_UVOLN'
      OnSetText = qryPrmUvDT_UVOLNSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PRMUV.NR_PRIKAZA'
      Size = 10
    end
    object qryPrmUvDT_PRIKAZA: TDateTimeField
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PRMUV.DT_PRIKAZA'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvNR_PRUVOLN: TStringField
      FieldName = 'NR_PRUVOLN'
      Origin = 'DbMain.Z_PRMUV.NR_PRUVOLN'
      Size = 10
    end
    object qryPrmUvDT_PRUVOLN: TDateTimeField
      FieldName = 'DT_PRUVOLN'
      Origin = 'DbMain.Z_PRMUV.DT_PRUVOLN'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrmUvNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PRMUV.NOTES'
      Size = 35
    end
  end
  object dsrcPrmUv: TDataSource
    DataSet = qryPrmUv
    Left = 479
    Top = 24
  end
  object updPrmUv: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_PrmUv'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_PRIEM = :DT_PRIEM,'
      '  DT_UVOLN = :DT_UVOLN,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NR_PRUVOLN = :NR_PRUVOLN,'
      '  DT_PRUVOLN = :DT_PRUVOLN,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_PrmUv'
      
        '  (KDSPS, TABN, DT_PRIEM, DT_UVOLN, NR_PRIKAZA, DT_PRIKAZA, NR_P' +
        'RUVOLN, '
      '   DT_PRUVOLN, NOTES)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_PRIEM, :DT_UVOLN, :NR_PRIKAZA, :DT_PRIKAZA' +
        ', :NR_PRUVOLN, '
      '   :DT_PRUVOLN, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_PrmUv'
      'where'
      '  NR = :OLD_NR')
    Left = 495
    Top = 40
  end
  object qryLS: TQuery
    CachedUpdates = True
    BeforePost = qryLSBeforePost
    AfterPost = qryLSAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select first 3 * from z_BankiLS')
    UpdateObject = updLS
    Left = 472
    Top = 330
    object qryLSNR: TIntegerField
      FieldName = 'NR'
    end
    object qryLSTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryLSDTBEG: TDateTimeField
      FieldName = 'DTBEG'
    end
    object qryLSLICSCH: TStringField
      FieldName = 'LICSCH'
      Size = 29
    end
    object qryLSKDBNK: TSmallintField
      FieldName = 'KDBNK'
    end
    object qryLSNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
  end
  object dsrcLS: TDataSource
    DataSet = qryLS
    Left = 488
    Top = 346
  end
  object updLS: TUpdateSQL
    ModifySQL.Strings = (
      'update z_BankiLS'
      'set'
      '  TABN = :TABN,'
      '  DTBEG = :DTBEG,'
      '  LICSCH = :LICSCH,'
      '  KDBNK = :KDBNK,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_BankiLS'
      '  (TABN, DTBEG, LICSCH, KDBNK, NOTES)'
      'values'
      '  (:TABN, :DTBEG, :LICSCH, :KDBNK, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_BankiLS'
      'where'
      '  NR = :OLD_NR')
    Left = 504
    Top = 362
  end
  object dsrcUpi: TDataSource
    Left = 472
    Top = 216
  end
  object qryCalcf: TQuery
    DatabaseName = 'C_T_E_M_P'
    SQL.Strings = (
      'select * from copy856')
    Left = 472
    Top = 418
    object qryCalcfCODE: TStringField
      FieldName = 'CODE'
      Origin = 'C_T_E_M_P."copy856.DBF".CODE'
      Size = 10
    end
    object qryCalcfC_ZKPP: TStringField
      FieldName = 'C_ZKPP'
      Origin = 'C_T_E_M_P."copy856.DBF".C_ZKPP'
      Size = 10
    end
    object qryCalcfC_ETDK: TStringField
      FieldName = 'C_ETDK'
      Origin = 'C_T_E_M_P."copy856.DBF".C_ETDK'
      Size = 10
    end
    object qryCalcfC_DKHP: TStringField
      FieldName = 'C_DKHP'
      Origin = 'C_T_E_M_P."copy856.DBF".C_DKHP'
      Size = 10
    end
    object qryCalcfNAMED: TStringField
      FieldName = 'NAMED'
      Origin = 'C_T_E_M_P."copy856.DBF".NAMED'
      Size = 254
      Transliterate = False
    end
    object qryCalcfNAMEFULL: TStringField
      FieldName = 'NAMEFULL'
      Origin = 'C_T_E_M_P."copy856.DBF".NAMEFULL'
      Size = 254
      Transliterate = False
    end
    object qryCalcfNAME: TStringField
      FieldName = 'NAME'
      Origin = 'C_T_E_M_P."copy856.DBF".NAME'
      Size = 60
      Transliterate = False
    end
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 552
    Top = 216
    object NShowPrevPos: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' &'#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
      OnClick = NShowPrevPosClick
    end
    object NShowOldPos: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1086' &'#1089#1090#1072#1088#1086#1084#1091' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1091
      OnClick = NShowOldPosClick
    end
  end
end
