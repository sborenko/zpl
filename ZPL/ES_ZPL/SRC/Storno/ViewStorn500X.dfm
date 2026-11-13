object VieStorn500X: TVieStorn500X
  Left = 496
  Top = 244
  Width = 670
  Height = 450
  BorderIcons = [biSystemMenu]
  Caption = 'FrmStorn500X'
  Color = clBtnFace
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 670
  Constraints.MinHeight = 250
  Constraints.MinWidth = 560
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
  object panelButtons: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      662
      31)
    object btnSetStorn: TSpeedButton
      Left = 190
      Top = 3
      Width = 102
      Height = 25
      Hint = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      Anchors = [akTop, akRight]
      Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = StornoClick
    end
    object btnDelStorn: TSpeedButton
      Left = 302
      Top = 3
      Width = 102
      Height = 25
      Hint = #1057#1085#1103#1090#1100' '#1089#1090#1086#1088#1085#1086' '#1089' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      Anchors = [akTop, akRight]
      Caption = #1057#1085#1103#1090#1100' '#1089#1090#1086#1088#1085#1086
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = UnstornoClick
    end
    object btnClose: TBitBtn
      Left = 583
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object BtnOk: TBitBtn
      Left = 498
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1080#1085#1103#1090#1100
      ModalResult = 1
      TabOrder = 1
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
    end
  end
  object DBGrStorno: TDBGrid
    Left = 0
    Top = 31
    Width = 662
    Height = 392
    Align = alClient
    DataSource = DataStorn500X.PartsDSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopStorno
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrDrawColumnCell
    OnEnter = dbgrEnter
    OnExit = dbgrExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Title.Caption = #1057#1087#1089
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Title.Caption = #1042#1080#1076#1053
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShVidN'
        Title.Caption = #1064#1092#1088#1042#1080#1076#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Title.Caption = #1056#1052#1077#1089
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Title.Caption = #1047#1072#1052#1043
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Title.Caption = #1044#1090#1053#1072#1095#1072#1083#1072
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Title.Caption = #1044#1090#1054#1082#1086#1085#1095
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Title.Caption = #1063#1072#1089#1086#1074
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Title.Caption = #1050#1076#1055#1076#1088
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Title.Caption = #1050#1090#1075#1055#1077#1088#1089
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Title.Caption = #1055#1088#1080#1084#1077#1095
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STORN'
        Title.Caption = #1057#1090#1086#1088#1085
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DTSTORN'
        Title.Caption = #1044#1090#1057#1090#1086#1088#1085
        Width = 79
        Visible = True
      end>
  end
  object PopStorno: TPopupMenu
    OnPopup = PopStornoPopup
    Left = 16
    Top = 80
    object NStorno: TMenuItem
      Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100
      OnClick = StornoClick
    end
    object NUnstorno: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077
      OnClick = UnstornoClick
    end
  end
end
