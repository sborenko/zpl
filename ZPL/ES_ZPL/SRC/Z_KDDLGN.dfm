object FormGtDolgn: TFormGtDolgn
  Left = 371
  Top = 319
  Width = 403
  Height = 290
  BorderIcons = [biSystemMenu]
  Caption = 'FormGtDolgn'
  Color = clBtnFace
  Constraints.MaxWidth = 550
  Constraints.MinHeight = 290
  Constraints.MinWidth = 403
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
  object dbgrDolgn: TDBGrid
    Left = 0
    Top = 0
    Width = 395
    Height = 228
    Align = alClient
    DataSource = DmMain.dsrcDolgn
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = popMnu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrDolgnDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KDDOLGN'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHDOLGN'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMDOLGN'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 84
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 228
    Width = 395
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      395
      28)
    object sBtnPodklZpZ: TSpeedButton
      Left = 4
      Top = 2
      Width = 78
      Height = 25
      Hint = #1058#1086#1083#1100#1082#1086' '#1087#1088#1080' bFlagDbg = true'
      Caption = 'AddFromZpZ'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = popAddFromZpZClick
    end
    object sBtnPrt: TSpeedButton
      Left = 172
      Top = 2
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
      Left = 241
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 320
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 112
    Top = 80
    object popHead: TMenuItem
      Caption = '== '#1044#1086#1083#1078#1085#1086#1089#1090#1080' =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnClick = popDelClick
    end
    object popAddFromZpZ: TMenuItem
      Caption = 'AddFromZpZ (Only with bFlagDbg)'
      Enabled = False
      Hint = #1058#1086#1083#1100#1082#1086' '#1087#1088#1080' bFlagDbg = true'
      OnClick = popAddFromZpZClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object N3: TMenuItem
        Caption = '- '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
      end
    end
  end
  object qryTmp: TQuery
    Left = 216
    Top = 152
  end
end
