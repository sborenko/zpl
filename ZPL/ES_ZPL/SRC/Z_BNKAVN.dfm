object FormBankiVedAvns: TFormBankiVedAvns
  Left = 317
  Top = 161
  Width = 450
  Height = 385
  HelpContext = 70
  BorderIcons = [biSystemMenu]
  Caption = 'FormBankiVedAvns'
  Color = clBtnFace
  Constraints.MaxWidth = 580
  Constraints.MinHeight = 344
  Constraints.MinWidth = 450
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
    Left = 176
    Top = 32
    Height = 326
    Beveled = True
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 32
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      442
      32)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 2
      Width = 75
      Height = 27
      Hint = #1055#1077#1095#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1073#1072#1085#1082#1072
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 365
      Top = 2
      Width = 75
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object ChBoxPrtZero: TCheckBox
      Left = 84
      Top = 8
      Width = 157
      Height = 17
      Hint = #1042#1099#1074#1086#1076#1080#1090#1100' '#1083#1080' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1089' '#1085#1091#1083#1077#1074#1099#1084#1080' '#1089#1091#1084#1084#1072#1084#1080
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1085#1091#1083#1077#1074#1099#1077' '#1089#1091#1084#1084#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object rBtnByNu: TRadioButton
      Left = 240
      Top = 16
      Width = 113
      Height = 14
      Hint = #1055#1077#1095#1072#1090#1100' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077' "'#1057#1091#1084#1084#1099' '#1087#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1084'"'
      Caption = #1087#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1084
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object rBtnByOtkl: TRadioButton
      Left = 240
      Top = 3
      Width = 113
      Height = 14
      Hint = #1055#1077#1095#1072#1090#1100' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077' "'#1057#1091#1084#1084#1099' '#1087#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084'"'
      Caption = #1087#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = True
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 32
    Width = 176
    Height = 326
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'PanelLeft'
    Constraints.MinWidth = 165
    TabOrder = 1
    DesignSize = (
      176
      326)
    object dbgrBanki: TDBGrid
      Left = 0
      Top = 0
      Width = 176
      Height = 293
      Hint = #1057#1087#1080#1089#1086#1082' '#1073#1072#1085#1082#1086#1074
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsrcBanki
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'KDBNK'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHBNK'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMBNK'
          Width = 74
          Visible = True
        end>
    end
    object rBtnAll: TRadioButton
      Left = 7
      Top = 295
      Width = 113
      Height = 17
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1074#1089#1077#1084' '#1073#1072#1085#1082#1072#1084' ('#1087#1077#1095#1072#1090#1100' '#1079#1072#1087#1088#1077#1097#1077#1085#1072')'
      Anchors = [akLeft, akBottom]
      Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      OnClick = rBtnAllClick
    end
    object rBtnCurrent: TRadioButton
      Left = 7
      Top = 310
      Width = 145
      Height = 17
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1073#1072#1085#1082#1072' ('#1074#1086#1079#1084#1086#1078#1085#1072' '#1087#1077#1095#1072#1090#1100')'
      Anchors = [akLeft, akBottom]
      Caption = #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1073#1072#1085#1082#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = rBtnCurrentClick
    end
  end
  object PanelRight: TPanel
    Left = 179
    Top = 32
    Width = 263
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object dbgrAvns: TDBGrid
      Left = 0
      Top = 0
      Width = 263
      Height = 293
      Hint = #1057#1091#1084#1084#1099' '#1072#1074#1072#1085#1089#1086#1074' '#1087#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084' '#1080' '#1087#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1084
      Align = alClient
      DataSource = dsrcAvns
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = popMnu
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TABN'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FamIO'
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LICSCH'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMOTKL'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMNU'
          Width = 51
          Visible = True
        end>
    end
    object PanelRB: TPanel
      Left = 0
      Top = 293
      Width = 263
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object LabelOtkl: TLabel
        Left = 6
        Top = 3
        Width = 45
        Height = 13
        Hint = #1048#1090#1086#1075#1080' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077' "'#1057#1091#1084#1084#1099' '#1087#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084'"'
        Caption = 'LabelOtkl'
        ParentShowHint = False
        ShowHint = True
      end
      object LabelNU: TLabel
        Left = 6
        Top = 18
        Width = 42
        Height = 13
        Hint = #1048#1090#1086#1075#1080' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077' "'#1057#1091#1084#1084#1099' '#1087#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1084'"'
        Caption = 'LabelNU'
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object qryBanki: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Banki')
    Left = 32
    Top = 152
    object qryBankiNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_BANKI.NR'
    end
    object qryBankiKDBNK: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_BANKI.KDBNK'
    end
    object qryBankiSHBNK: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHBNK'
      Origin = 'DbMain.Z_BANKI.SHBNK'
      Size = 10
    end
    object qryBankiNMBNK: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
      FieldName = 'NMBNK'
      Origin = 'DbMain.Z_BANKI.NMBNK'
      Size = 35
    end
    object qryBankiNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_BANKI.NOTES'
      Size = 35
    end
  end
  object dsrcBanki: TDataSource
    DataSet = qryBanki
    OnDataChange = dsrcBankiDataChange
    Left = 48
    Top = 168
  end
  object qryAvns: TQuery
    OnCalcFields = qryAvnsCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_AVANSOTKLNU ('#39'02/01/2004'#39')'
      'order by Fam, Ima, Otch'
      '')
    Left = 208
    Top = 160
    object qryAvnsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryAvnsFamImaOtch: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'FamImaOtch'
      Size = 55
      Calculated = True
    end
    object qryAvnsNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
    end
    object qryAvnsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053'-'#1088
      DisplayWidth = 5
      FieldName = 'TABN'
    end
    object qryAvnsFAM: TStringField
      DisplayWidth = 24
      FieldName = 'FAM'
    end
    object qryAvnsIMA: TStringField
      DisplayWidth = 18
      FieldName = 'IMA'
      Size = 15
    end
    object qryAvnsOTCH: TStringField
      DisplayWidth = 24
      FieldName = 'OTCH'
    end
    object qryAvnsID: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090'.'#1085'-'#1088
      DisplayWidth = 12
      FieldName = 'ID'
      Size = 10
    end
    object qryAvnsDTBEG: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DTBEG'
    end
    object qryAvnsLICSCH: TStringField
      DisplayLabel = #1051#1080#1094'.'#1089#1095#1077#1090
      DisplayWidth = 30
      FieldName = 'LICSCH'
      FixedChar = True
      Size = 25
    end
    object qryAvnsKDBNK: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDBNK'
    end
    object qryAvnsNOTES: TStringField
      DisplayWidth = 30
      FieldName = 'NOTES'
      FixedChar = True
      Size = 25
    end
    object qryAvnsSUMOTKL: TFloatField
      DisplayLabel = #1057#1084#1055#1086#1054#1090#1082#1083
      DisplayWidth = 12
      FieldName = 'SUMOTKL'
      DisplayFormat = ',0.00'
    end
    object qryAvnsSUMNU: TFloatField
      DisplayLabel = #1057#1084#1055#1086#1053#1059
      DisplayWidth = 12
      FieldName = 'SUMNU'
      DisplayFormat = ',0.00'
    end
  end
  object dsrcAvns: TDataSource
    DataSet = qryAvns
    Left = 224
    Top = 176
  end
  object popMnu: TPopupMenu
    Left = 291
    Top = 136
    object popSortByFIO: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
      Checked = True
      OnClick = popSortByFIOClick
    end
    object popSortByLS: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1083#1080#1094#1077#1074#1099#1084' '#1089#1095#1077#1090#1072#1084
      OnClick = popSortByLSClick
    end
  end
end
