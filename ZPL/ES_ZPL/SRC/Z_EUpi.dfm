object FormEUpi: TFormEUpi
  Left = 167
  Top = 242
  ActiveControl = dbeDtPriem
  BorderStyle = bsDialog
  Caption = 'FormEUpi'
  ClientHeight = 286
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    478
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object bBtnOk: TBitBtn
    Left = 320
    Top = 258
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 0
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 400
    Top = 258
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 478
    Height = 257
    ActivePage = tsAdd
    Align = alTop
    Style = tsButtons
    TabOrder = 2
    object tsAdd: TTabSheet
      Caption = 'tsAdd'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 470
        Height = 226
        Align = alClient
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 14
        Top = 30
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
        Left = 151
        Top = 30
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
        Left = 282
        Top = 30
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
        Left = 14
        Top = 11
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
      object Label5: TLabel
        Left = 391
        Top = 92
        Width = 67
        Height = 13
        Caption = #1044#1072#1090#1072' '#1091#1074#1086#1083#1100#1085'.'
        FocusControl = dbeDtUvoln
      end
      object Label7: TLabel
        Left = 296
        Top = 11
        Width = 77
        Height = 13
        Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1048#1076'.'
        FocusControl = dbeID
      end
      object Label54: TLabel
        Left = 372
        Top = 135
        Width = 82
        Height = 13
        Caption = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1057#1041#1059
        FocusControl = dbeSPZ
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label58: TLabel
        Left = 113
        Top = 135
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
        Left = 114
        Top = 179
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
        Left = 443
        Top = 152
        Width = 15
        Height = 20
        Hint = #1042#1099#1073#1086#1088' '#1057#1041#1059' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
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
      object Label61: TLabel
        Left = 308
        Top = 179
        Width = 62
        Height = 13
        Caption = #1053'-'#1088' '#1087#1088#1080#1082#1072#1079#1072
        FocusControl = dbeNrPrikaza
      end
      object Label62: TLabel
        Left = 383
        Top = 179
        Width = 71
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
        FocusControl = dbeDtPrikaza
      end
      object Label63: TLabel
        Left = 227
        Top = 179
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
        Left = 200
        Top = 194
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
        Left = 193
        Top = 152
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
        Left = 215
        Top = 135
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
      object Label47: TLabel
        Left = 162
        Top = 70
        Width = 58
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        FocusControl = dbeDolgn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 175
        Top = 11
        Width = 37
        Height = 13
        Caption = #1058#1072#1073' '#1085'-'#1088
        OnDblClick = Label13DblClick
      end
      object Label12: TLabel
        Left = 420
        Top = 31
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
      object sBtnKatP: TSpeedButton
        Left = 188
        Top = 107
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
        Left = 116
        Top = 92
        Width = 86
        Height = 13
        Caption = #1050#1072#1090#1077#1075'.'#1087#1077#1088#1089#1086#1085#1072#1083#1072
        WordWrap = True
      end
      object LabelObj: TLabel
        Left = 27
        Top = 92
        Width = 80
        Height = 13
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      end
      object sBtnObj: TSpeedButton
        Left = 99
        Top = 107
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
      object Label18: TLabel
        Left = 14
        Top = 70
        Width = 63
        Height = 13
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
        WordWrap = True
      end
      object sBtnDolgn: TSpeedButton
        Left = 443
        Top = 67
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
        OnClick = sBtnDolgnClick
      end
      object Label16: TLabel
        Left = 302
        Top = 92
        Width = 24
        Height = 13
        Caption = #1056#1072#1085#1075
        FocusControl = dbeRang
      end
      object Label17: TLabel
        Left = 346
        Top = 92
        Width = 37
        Height = 13
        Caption = #1056#1072#1079#1088#1103#1076
        FocusControl = dbeRazr
      end
      object sBtnClearSpZ: TSpeedButton
        Left = 451
        Top = 120
        Width = 15
        Height = 20
        Hint = #1054#1095#1080#1089#1090#1080#1100' '#1087#1086#1083#1077' '#1057#1041#1059
        Caption = 'X'
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sBtnClearSpZClick
      end
      object Label4: TLabel
        Left = 208
        Top = 92
        Width = 70
        Height = 13
        Caption = #1057#1086#1074#1084#1077#1089#1090#1080#1090'-'#1074#1086
      end
      object sBtnSovm: TSpeedButton
        Left = 282
        Top = 107
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
      object sBtnCheckFamExists: TSpeedButton
        Left = 128
        Top = 27
        Width = 16
        Height = 20
        Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1085#1072#1083#1080#1095#1080#1077' '#1092#1072#1084#1080#1083#1080#1080' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        Visible = False
        OnClick = sBtnCheckFamExistsClick
      end
      object dbeOtch: TDBEdit
        Left = 282
        Top = 43
        Width = 136
        Height = 21
        DataField = 'OTCH'
        DataSource = dsrcUpi
        TabOrder = 4
        OnDblClick = sBtnDolgnClick
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDtPriem: TDBEdit
        Left = 85
        Top = 8
        Width = 68
        Height = 21
        Hint = #1054#1085#1072' '#1078#1077' '#1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
        DataField = 'LASTDTPRM'
        DataSource = dsrcUpi
        MaxLength = 10
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = dbeEnter
        OnExit = dbeDtPriemExit
      end
      object dbeDtUvoln: TDBEdit
        Left = 390
        Top = 107
        Width = 68
        Height = 21
        DataField = 'LASTDTUVL'
        DataSource = dsrcUpi
        MaxLength = 10
        TabOrder = 13
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeID: TDBEdit
        Left = 377
        Top = 8
        Width = 81
        Height = 21
        DataField = 'ID'
        DataSource = dsrcUpi
        TabOrder = 1
        OnEnter = dbeEnter
        OnExit = dbeIDExit
      end
      object dbeNrPrikaza: TDBEdit
        Left = 308
        Top = 193
        Width = 74
        Height = 21
        AutoSize = False
        DataField = 'NR_PRIKAZA'
        DataSource = dsrcPere
        TabOrder = 23
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeSPZ: TDBEdit
        Left = 372
        Top = 151
        Width = 72
        Height = 21
        Hint = #1054#1089#1085#1086#1074#1085#1086#1081' '#1089#1095#1077#1090' '#1079#1072#1090#1088#1072#1090' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
        AutoSize = False
        DataField = 'SpZ'
        DataSource = dsrcPere
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 17
        OnDblClick = sBtnVbrSPZClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeSPZKeyDown
      end
      object dbeOklad: TDBEdit
        Left = 215
        Top = 151
        Width = 61
        Height = 21
        Hint = #1054#1082#1083#1072#1076' '#1080#1083#1080' '#1095#1072#1089#1086#1074#1086#1081' '#1090#1072#1088#1080#1092
        AutoSize = False
        DataField = 'OKLTRF'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeAvans: TDBEdit
        Left = 281
        Top = 151
        Width = 61
        Height = 21
        Hint = #1057#1091#1084#1084#1072' '#1080#1083#1080' '#1087#1088#1086#1094#1077#1085#1090' '#1072#1074#1072#1085#1089#1072
        AutoSize = False
        DataField = 'AVANS'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeShSO: TDBEdit
        Left = 112
        Top = 151
        Width = 81
        Height = 21
        Hint = #1057#1080#1089#1090#1077#1084#1072' '#1086#1087#1083#1072#1090#1099
        DataField = 'ShSO'
        DataSource = dsrcPere
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 14
        OnDblClick = sBtnVbrSOClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeShSOKeyDown
      end
      object dbeNmShNlg: TDBEdit
        Left = 114
        Top = 193
        Width = 85
        Height = 21
        Hint = #1057#1093#1077#1084#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
        DataField = 'ShPdNlg'
        DataSource = dsrcPere
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 21
        OnDblClick = sBtnVbrShPdNClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeNmShNlgKeyDown
      end
      object dbeDolgn: TDBEdit
        Left = 224
        Top = 67
        Width = 219
        Height = 21
        AutoSize = False
        DataField = 'DOLGNOST'
        DataSource = dsrcPere
        ReadOnly = True
        TabOrder = 7
        OnDblClick = sBtnDolgnClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeDolgnKeyDown
      end
      object dbeTabNr: TDBEdit
        Left = 218
        Top = 8
        Width = 57
        Height = 21
        Hint = #1058#1072#1073'.'#1085#1086#1084#1077#1088' ('#1087#1088#1080#1089#1074#1072#1080#1074#1072#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080')'
        TabStop = False
        Color = clBtnFace
        DataField = 'TABN'
        DataSource = dsrcUpi
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 26
      end
      object DBCheckBoxPens: TDBCheckBox
        Left = 28
        Top = 167
        Width = 77
        Height = 17
        Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1087#1077#1085#1089#1080#1086#1085#1077#1088
        Alignment = taLeftJustify
        Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088
        DataField = 'PR_PENS'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object DBCheckBoxInv: TDBCheckBox
        Left = 9
        Top = 183
        Width = 96
        Height = 17
        Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1095#1083'.'#1087#1088#1086#1092#1089#1086#1102#1079#1072
        Alignment = taLeftJustify
        Caption = #1063#1083'.'#1087#1088#1086#1092#1089#1086#1102#1079#1072
        DataField = 'PRFS'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object DBCheckBox4: TDBCheckBox
        Left = 276
        Top = 134
        Width = 66
        Height = 17
        Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1086#1082#1083#1072#1076#1072', '#1073#1077#1079' "'#1075#1072#1083#1086#1095#1082#1080'" - '#1087#1086#1089#1090'.'#1089#1091#1084#1084#1072
        TabStop = False
        Alignment = taLeftJustify
        Caption = #1040#1074#1072#1085#1089' (%)'
        DataField = 'SP_AV'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        ValueChecked = '%'
        ValueUnchecked = 'S'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeKatP: TDBEdit
        Left = 115
        Top = 107
        Width = 74
        Height = 21
        Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        DataField = 'ShKatP'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnDblClick = sBtnKatPClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeKatPKeyDown
      end
      object dbeObj: TDBEdit
        Left = 27
        Top = 107
        Width = 71
        Height = 21
        DataField = 'ShObj'
        DataSource = dsrcPere
        TabOrder = 8
        OnDblClick = sBtnObjClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeObjKeyDown
      end
      object dbeDOB: TDBEdit
        Left = 76
        Top = 67
        Width = 75
        Height = 21
        DataField = 'DOB'
        DataSource = dsrcUpi
        TabOrder = 6
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object DBComboBoxPol: TDBComboBox
        Left = 418
        Top = 43
        Width = 40
        Height = 21
        Style = csDropDownList
        DataField = 'POL'
        DataSource = dsrcUpi
        ItemHeight = 13
        Items.Strings = (
          #1052
          #1046)
        TabOrder = 5
        OnEnter = DBComboBoxPolEnter
        OnExit = DBComboBoxPolExit
      end
      object DBCheckBox1: TDBCheckBox
        Left = 40
        Top = 199
        Width = 65
        Height = 17
        Hint = #1057' "'#1075#1072#1083#1086#1095#1082#1086#1081'" - '#1080#1085#1074#1072#1083#1080#1076
        Alignment = taLeftJustify
        Caption = #1048#1085#1074#1072#1083#1080#1076
        DataField = 'INV'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeIma: TDBEdit
        Left = 151
        Top = 43
        Width = 131
        Height = 21
        DataField = 'IMA'
        DataSource = dsrcUpi
        TabOrder = 3
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeFam: TDBEdit
        Left = 14
        Top = 43
        Width = 137
        Height = 21
        DataField = 'FAM'
        DataSource = dsrcUpi
        TabOrder = 2
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeRang: TDBEdit
        Left = 302
        Top = 107
        Width = 44
        Height = 21
        DataField = 'RANG'
        DataSource = dsrcPere
        TabOrder = 11
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeRazr: TDBEdit
        Left = 346
        Top = 107
        Width = 44
        Height = 21
        DataField = 'RAZR'
        DataSource = dsrcPere
        TabOrder = 12
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDtPrikaza: TDBEdit
        Left = 382
        Top = 193
        Width = 76
        Height = 21
        AutoSize = False
        DataField = 'DT_PRIKAZA'
        DataSource = dsrcPere
        TabOrder = 24
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeProcLg: TDBEdit
        Left = 232
        Top = 193
        Width = 42
        Height = 21
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1077#1086#1073#1083#1072#1075#1072#1077#1084#1099#1093' '#1084#1080#1085#1080#1084#1091#1084#1086#1074' '#1087#1086' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1084#1091' '#1085#1072#1083#1086#1075#1091
        DataField = 'PROCLG'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeShSovm: TDBEdit
        Left = 208
        Top = 107
        Width = 74
        Height = 21
        Hint = #1042#1080#1076' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        DataField = 'ShSovm'
        DataSource = dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnDblClick = sBtnSovmClick
        OnEnter = dbeEnter
        OnExit = dbeExit
        OnKeyDown = dbeShSovmKeyDown
      end
    end
    object tsEdt: TTabSheet
      Caption = 'tsEdt'
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 470
        Height = 72
        Align = alClient
        Style = bsRaised
      end
      object Label6: TLabel
        Left = 14
        Top = 30
        Width = 49
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
        FocusControl = dbeFam2
      end
      object Label8: TLabel
        Left = 169
        Top = 30
        Width = 22
        Height = 13
        Caption = #1048#1084#1103
        FocusControl = dbeIma2
      end
      object Label9: TLabel
        Left = 313
        Top = 30
        Width = 47
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        FocusControl = dbeOtch2
      end
      object Label10: TLabel
        Left = 192
        Top = 11
        Width = 178
        Height = 13
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1089#1083#1091#1078#1073#1099
        FocusControl = dbeId2
      end
      object Label11: TLabel
        Left = 14
        Top = 11
        Width = 37
        Height = 13
        Caption = #1058#1072#1073' '#1085'-'#1088
        OnDblClick = Label11DblClick
      end
      object dbeOtch2: TDBEdit
        Left = 311
        Top = 43
        Width = 148
        Height = 21
        DataField = 'OTCH'
        DataSource = dsrcUpi
        TabOrder = 3
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeIma2: TDBEdit
        Left = 167
        Top = 43
        Width = 145
        Height = 21
        DataField = 'IMA'
        DataSource = dsrcUpi
        TabOrder = 2
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeFam2: TDBEdit
        Left = 14
        Top = 43
        Width = 154
        Height = 21
        DataField = 'FAM'
        DataSource = dsrcUpi
        TabOrder = 1
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeId2: TDBEdit
        Left = 377
        Top = 8
        Width = 81
        Height = 21
        DataField = 'ID'
        DataSource = dsrcUpi
        TabOrder = 0
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeTabNr2: TDBEdit
        Left = 72
        Top = 8
        Width = 65
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TABN'
        DataSource = dsrcUpi
        ReadOnly = True
        TabOrder = 5
      end
      object dbgrPere: TDBGrid
        Left = 0
        Top = 72
        Width = 470
        Height = 154
        Align = alBottom
        DataSource = dsrcPere
        PopupMenu = popPere
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPereDrawColumnCell
        OnEditButtonClick = dbgrPereEditButtonClick
        OnKeyDown = dbgrPereKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOLGNOST'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKLTRF'
            Width = 48
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'NmSO'
            Width = 35
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'NmKatP'
            Width = 41
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'NmShPdn'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOLMIN'
            Width = 34
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'SpZ'
            Title.Caption = #1057#1041#1059
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOVM'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PR_PENS'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PRIKAZA'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PRIKAZA'
            Width = 62
            Visible = True
          end>
      end
    end
  end
  object ChBoxAddInCurSps: TCheckBox
    Left = 8
    Top = 262
    Width = 217
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
    TabOrder = 3
  end
  object qryPere: TQuery
    CachedUpdates = True
    BeforeInsert = qryPereBeforeInsert
    BeforePost = qryPereBeforePost
    AfterPost = qryPereAfterPost
    AfterDelete = qryPereAfterDelete
    OnNewRecord = qryPereNewRecord
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'Select * from Z_PERE'
      'where TabN = :TabN')
    UpdateObject = updPere
    Left = 8
    Top = 168
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
    object qryPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'DbMain.Z_PERE.SO'
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
    object qryPereKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PERE.KDOBJ'
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
      LookupResultField = 'SCHBU'
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
    object qryPereSmCmbOkl: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SmCmbOkl'
      Calculated = True
    end
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    Left = 16
    Top = 120
  end
  object updUpi: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_UPI'
      'set'
      '  TABN = :TABN,'
      '  ID = :ID,'
      '  FAM = :FAM,'
      '  IMA = :IMA,'
      '  OTCH = :OTCH,'
      '  DOB = :DOB,'
      '  POL = :POL,'
      '  LASTDTPRM = :LASTDTPRM,'
      '  LASTDTUVL = :LASTDTUVL'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_UPI'
      '  (TABN, ID, FAM, IMA, OTCH, DOB, POL, LASTDTPRM, LASTDTUVL)'
      'values'
      
        '  (:TABN, :ID, :FAM, :IMA, :OTCH, :DOB, :POL, :LASTDTPRM, :LASTD' +
        'TUVL)')
    DeleteSQL.Strings = (
      'delete from Z_UPI'
      'where'
      '  NR = :OLD_NR')
    Left = 24
    Top = 136
  end
  object popPere: TPopupMenu
    Left = 76
    Top = 163
    object popPereHead: TMenuItem
      Caption = '== '#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' =='
      Enabled = False
    end
    object popPereAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popPereAddClick
    end
    object popPereEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popPereEdtClick
    end
    object popPereDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popPereDelClick
    end
  end
  object qryTmp: TQuery
    Left = 24
    Top = 216
  end
  object dsrcPere: TDataSource
    DataSet = qryPere
    Left = 16
    Top = 176
  end
  object updPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_PERE'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  SO = :SO,'
      '  OKLTRF = :OKLTRF,'
      '  AVANS = :AVANS,'
      '  PRCWRKTIME = :PRCWRKTIME,'
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
      '  PRDEKR = :PRDEKR,'
      '  CMBOKL = :CMBOKL,'
      '  SPEC_NR = :SPEC_NR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_PERE'
      
        '  (KDSPS, TABN, DT_BEG, KDOBJ, KDKATP, SO, OKLTRF, AVANS, PRCWRK' +
        'TIME, SP_AV, '
      
        '   KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM, PDNLG, PROCLG, KOLMI' +
        'N, PRFS, '
      
        '   NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RANG, RAZR, DT_END, PRDEK' +
        'R, CMBOKL, '
      '   SPEC_NR)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_BEG, :KDOBJ, :KDKATP, :SO, :OKLTRF, :AVANS' +
        ', :PRCWRKTIME, '
      
        '   :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :PR_PENS, :SOVM, :PDNLG,' +
        ' :PROCLG, '
      
        '   :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIKAZA, :NOTES, :INV, :RANG' +
        ', :RAZR, '
      '   :DT_END, :PRDEKR, :CMBOKL, :SPEC_NR)')
    DeleteSQL.Strings = (
      'delete from Z_PERE'
      'where'
      '  NR = :OLD_NR')
    Left = 24
    Top = 184
  end
  object qryUpi: TQuery
    CachedUpdates = True
    AfterPost = qryUpiAfterPost
    AfterDelete = qryUpiAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Upi'
      'where TabN = 1')
    UpdateObject = updUpi
    Left = 12
    Top = 107
    object qryUpiNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UPI.NR'
    end
    object qryUpiTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UPI.TABN'
    end
    object qryUpiDOB: TDateTimeField
      FieldName = 'DOB'
      Origin = 'DbMain.Z_UPI.DOB'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUpiPOL: TStringField
      FieldName = 'POL'
      Origin = 'DbMain.Z_UPI.POL'
      Size = 1
    end
    object qryUpiID: TStringField
      FieldName = 'ID'
      Origin = 'DbMain.Z_UPI.ID'
      Size = 10
    end
    object qryUpiFAM: TStringField
      FieldName = 'FAM'
      Origin = 'DbMain.Z_UPI.FAM'
    end
    object qryUpiIMA: TStringField
      FieldName = 'IMA'
      Origin = 'DbMain.Z_UPI.IMA'
      Size = 15
    end
    object qryUpiOTCH: TStringField
      FieldName = 'OTCH'
      Origin = 'DbMain.Z_UPI.OTCH'
    end
    object qryUpiLASTDTPRM: TDateTimeField
      FieldName = 'LASTDTPRM'
      Origin = 'DbMain.Z_UPI.LASTDTPRM'
      OnSetText = qryUpiLASTDTPRMSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUpiLASTDTUVL: TDateTimeField
      FieldName = 'LASTDTUVL'
      Origin = 'DbMain.Z_UPI.LASTDTUVL'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
  end
end
