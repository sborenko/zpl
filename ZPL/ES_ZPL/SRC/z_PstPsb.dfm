object FormPstPsb: TFormPstPsb
  Left = 316
  Top = 195
  Width = 437
  Height = 388
  ActiveControl = dbgrPst
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'FormPstPsb'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 525
  Constraints.MinHeight = 350
  Constraints.MinWidth = 365
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
  object Splitter1: TSplitter
    Left = 0
    Top = 151
    Width = 421
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 321
    Width = 421
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      421
      28)
    object bBtnCancel: TBitBtn
      Left = 353
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 0
      Kind = bkCancel
      Spacing = 1
    end
    object bBtnOk: TBitBtn
      Left = 249
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 1
      Kind = bkOK
      Spacing = 1
    end
  end
  object dbgrPst: TDBGrid
    Left = 0
    Top = 0
    Width = 421
    Height = 151
    Hint = #1042#1080#1076' '#1087#1086#1095#1090#1099
    Align = alTop
    DataSource = DmMain.dsrcPst
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
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrPstDblClick
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KDPST'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHPST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMPST'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_PST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Visible = True
      end>
  end
  object dbgrPsb: TDBGrid
    Left = 0
    Top = 154
    Width = 421
    Height = 167
    Hint = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1095#1090#1086#1074#1099#1093' '#1089#1073#1086#1088#1086#1074' '#1087#1086' '#1090#1077#1082#1097#1077#1081' '#1087#1086#1095#1090#1077
    Align = alClient
    DataSource = DmMain.dsrcPsb
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
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrPsbDblClick
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRCPSB'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKALA'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 186
        Visible = True
      end>
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 160
    Top = 208
    object popHead: TMenuItem
      Caption = '== Head of popMenu =='
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
      OnClick = popDelClick
    end
  end
end
