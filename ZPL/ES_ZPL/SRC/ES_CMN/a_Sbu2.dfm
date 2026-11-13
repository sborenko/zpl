object Form_Sbu2: TForm_Sbu2
  Left = 344
  Top = 142
  Width = 571
  Height = 536
  ActiveControl = TV
  BorderIcons = [biSystemMenu]
  Caption = 'Form_Sbu2'
  Color = clBtnFace
  Constraints.MaxWidth = 750
  Constraints.MinHeight = 390
  Constraints.MinWidth = 342
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object LabelPopMsg: TLabel
    Left = 0
    Top = 0
    Width = 563
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
    Width = 563
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1077#1085#1085#1099#1081' '#1089#1095#1077#1090' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LabelIsSborny: TLabel
    Left = 0
    Top = 26
    Width = 563
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1077#1085#1085#1099#1081' '#1089#1095#1077#1090' - '#1089#1073#1086#1088#1085#1099#1081'. '#1053#1072' '#1085#1077#1075#1086' '#1086#1090#1085#1086#1089#1080#1090#1100' '#1085#1077#1083#1100#1079#1103'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LabelErr3: TLabel
    Left = 0
    Top = 39
    Width = 563
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1057#1076#1077#1083#1072#1081#1090#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1074#1099#1073#1086#1088' '#1080#1079' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1089#1095#1077#1090#1086#1074'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 481
    Width = 563
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      563
      28)
    object sBtnPrt: TSpeedButton
      Left = 358
      Top = 3
      Width = 65
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Anchors = [akRight, akBottom]
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
      Left = 424
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
      Left = 490
      Top = 3
      Width = 73
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 52
    Width = 563
    Height = 429
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object SplitterSbu: TSplitter
      Left = 1
      Top = 313
      Width = 561
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object TV: TTreeView
      Left = 1
      Top = 1
      Width = 561
      Height = 312
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HideSelection = False
      Indent = 19
      ParentFont = False
      PopupMenu = popTree
      ReadOnly = True
      RightClickSelect = True
      TabOrder = 0
      OnChange = TVChange
      OnCustomDrawItem = TVCustomDrawItem
      OnDblClick = TVDblClick
      OnKeyDown = TVKeyDown
    end
    object dbgrSBU: TDBGrid
      Left = 1
      Top = 316
      Width = 561
      Height = 112
      Align = alBottom
      Color = clBtnFace
      DataSource = dsrcSbu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDSCH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDPSCH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SCHBU'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SCH_17'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PSCH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AINDX'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LVL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PS_17'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMSCH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PINDX'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INDX'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HSCH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOPPRIZN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OLDSCHET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_GORD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARC'
          Visible = True
        end>
    end
  end
  object qryTmp: TQuery
    Left = 216
    Top = 128
  end
  object popTree: TPopupMenu
    Left = 64
    Top = 88
    object popTreeFullExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTreeFullExpandClick
    end
    object popTreeFullCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTreeFullCollapseClick
    end
    object popTreeExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = popTreeExitClick
    end
  end
  object qrySbu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from Kd_Sbu '
      '  order by AIndx, Lvl, PIndx'
      '')
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
    object qrySbuKDPSCH: TSmallintField
      FieldName = 'KDPSCH'
      Origin = 'DbMain.KD_SBU.KDPSCH'
    end
    object qrySbuSCHBU: TStringField
      FieldName = 'SCHBU'
      Origin = 'DbMain.KD_SBU.SCHBU'
      Size = 15
    end
    object qrySbuSCH_17: TStringField
      FieldName = 'SCH_17'
      Origin = 'DbMain.KD_SBU.SCH_17'
      Size = 15
    end
    object qrySbuPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.KD_SBU.PSCH'
      Size = 15
    end
    object qrySbuAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.KD_SBU.AINDX'
    end
    object qrySbuLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.KD_SBU.LVL'
    end
    object qrySbuPS_17: TStringField
      FieldName = 'PS_17'
      Origin = 'DbMain.KD_SBU.PS_17'
      Size = 15
    end
    object qrySbuNMSCH: TStringField
      FieldName = 'NMSCH'
      Origin = 'DbMain.KD_SBU.NMSCH'
      Size = 65
    end
    object qrySbuPINDX: TSmallintField
      FieldName = 'PINDX'
      Origin = 'DbMain.KD_SBU.PINDX'
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
end
