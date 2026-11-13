object FormEAPsb: TFormEAPsb
  Left = 418
  Top = 324
  BorderStyle = bsDialog
  Caption = 'FormEAPsb'
  ClientHeight = 174
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    481
    174)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 134
    Top = 6
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdPst
  end
  object Label4: TLabel
    Left = 3
    Top = 106
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object Label2: TLabel
    Left = 3
    Top = 27
    Width = 83
    Height = 13
    Hint = #1042#1074#1086#1076#1080#1090#1077' 1-'#1077' '#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
    FocusControl = dbeDtBeg
    ParentShowHint = False
    ShowHint = True
  end
  object dbtShPst: TDBText
    Left = 3
    Top = 6
    Width = 126
    Height = 17
    Alignment = taCenter
    DataField = 'SHPST'
    DataSource = DmMain.dsrcPst
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPrcPsb: TLabel
    Left = 3
    Top = 92
    Width = 95
    Height = 13
    Caption = '% '#1087#1086#1095#1090#1086#1074#1086#1075#1086' '#1089#1073#1086#1088#1072
    FocusControl = dbePrcPsb
  end
  object dbtShkala: TDBText
    Left = 6
    Top = 150
    Width = 16
    Height = 17
    DataField = 'SHKALA'
    DataSource = DmMain.dsrcPsb
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dbeKdPst: TDBEdit
    Left = 158
    Top = 3
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDPST'
    DataSource = DmMain.dsrcPst
    Enabled = False
    TabOrder = 0
  end
  object dbeNotes: TDBEdit
    Left = 3
    Top = 120
    Width = 196
    Height = 21
    DataField = 'NOTES'
    DataSource = DmMain.dsrcPsb
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 46
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 124
    Top = 144
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object dbeDtBeg: TDBEdit
    Left = 122
    Top = 24
    Width = 77
    Height = 21
    Hint = #1042#1074#1086#1076#1080#1090#1077' 1-'#1077' '#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072
    DataField = 'DTBEG'
    DataSource = DmMain.dsrcPsb
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcPsb: TDBEdit
    Left = 122
    Top = 89
    Width = 77
    Height = 21
    DataField = 'PRCPSB'
    DataSource = DmMain.dsrcPsb
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbgrPstShk: TDBGrid
    Left = 204
    Top = 3
    Width = 274
    Height = 165
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DmMain.dsrcPstShk
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pop
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrPstShkDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SMFROM'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMCONST'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRC'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 71
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 46
    Width = 196
    Height = 39
    Hint = #1057#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1095#1090#1086#1074#1086#1075#1086' '#1089#1073#1086#1088#1072
    Caption = ' '#1057#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072': '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    object rBtnPrc: TRadioButton
      Left = 23
      Top = 14
      Width = 65
      Height = 17
      Hint = #1055#1086#1089#1090#1086#1103#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084#1099' '#1072#1083#1080#1084#1077#1085#1090#1086#1074
      Caption = #1087#1088#1086#1094#1077#1085#1090
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rBtnPrcClick
    end
    object rBtnShkala: TRadioButton
      Left = 122
      Top = 14
      Width = 56
      Height = 17
      Hint = #1056#1072#1089#1095#1077#1090' '#1087#1086' '#1096#1082#1072#1083#1077
      Caption = #1096#1082#1072#1083#1072
      TabOrder = 1
      OnClick = rBtnShkalaClick
    end
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 352
    Top = 56
    object popHead: TMenuItem
      Caption = '== '#1064#1082#1072#1083#1072' '#1089#1073#1086#1088#1086#1074' =='
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
    end
  end
end
