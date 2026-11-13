object FormUPoz: TFormUPoz
  Left = 349
  Top = 166
  Width = 675
  Height = 400
  ActiveControl = dbgrUPoz
  BorderIcons = [biSystemMenu]
  Caption = 'FormUPoz'
  Color = clBtnFace
  Constraints.MaxHeight = 580
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 400
  Constraints.MinWidth = 675
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      667
      31)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
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
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 589
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object bBtnOk: TBitBtn
      Left = 512
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 1
      Kind = bkOK
      Spacing = 0
    end
  end
  object dbgrUPoz: TDBGrid
    Left = 0
    Top = 31
    Width = 667
    Height = 342
    Align = alClient
    Color = clInfoBk
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrUPozDblClick
    OnEnter = dbgrUPozEnter
    OnExit = dbgrUPozExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KPR'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPECNAIM'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'B_SCHET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHET'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_SCHET'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Z_SCHET'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Z_SCH_17'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSMETU'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLIMITA'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PPLANA'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMKFK'
        Width = 166
        Visible = True
      end>
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 80
    Top = 80
    object popHead: TMenuItem
      Caption = '== '#1059#1095#1077#1090#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080' =='
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
