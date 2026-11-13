object FormChDblTabN: TFormChDblTabN
  Left = 353
  Top = 301
  Width = 355
  Height = 307
  ActiveControl = dbgrSps
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'FormChDblTabN'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 355
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
    Width = 347
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      347
      31)
    object Label1: TLabel
      Left = 4
      Top = 1
      Width = 219
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1053#1077' '#1076#1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1086#1076#1080#1085#1072#1082#1086#1074#1099#1093' '#1090#1072#1073#1077#1083#1100#1085#1099#1093' '#1085#1086#1084#1077#1088#1086#1074' ('#1058#1072#1073#1053#1088') '#1074' '#1086#1076#1085#1086#1084' '#1089#1087#1080#1089 +
        #1082#1077' ('#1057#1087#1089#1082').'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object SpeedButton1: TSpeedButton
      Left = 244
      Top = 3
      Width = 23
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100
      Anchors = [akTop, akRight]
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
      OnClick = SpeedButton1Click
    end
    object bBtnCancel: TBitBtn
      Left = 269
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrSps: TDBGrid
    Left = 0
    Top = 31
    Width = 347
    Height = 249
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcSps
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrSpsEnter
    OnExit = dbgrSpsExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S1_TABN'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 41
        Visible = True
      end>
  end
  object qrySps: TQuery
    OnCalcFields = qrySpsCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select u.Fam, u.Ima, u.Otch, s1.NR, s1.KdSps, s1.NCH, s1.DtProc,' +
        ' '
      '           s1.TabN as S1_TabN, s2.TaBN as s2_TabN, s1.KdObj'
      'from z_Sps s1, z_Sps s2 , z_upi u '
      ' where s1.DtProc = '#39'10/01/2007'#39' and s2.DtProc = '#39'10/01/2007'#39' and'
      '       s2.TabN = s1.TabN and s2.NR <> s1.NR and u.TabN = s1.TabN'
      ' order by s1.TabN, s1.KdSps')
    Left = 96
    Top = 112
    object qrySpsNR: TIntegerField
      DisplayLabel = 'Sps_NR'
      FieldName = 'NR'
    end
    object qrySpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qrySpsFAM: TStringField
      FieldName = 'FAM'
    end
    object qrySpsIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qrySpsOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qrySpsKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
    end
    object qrySpsNCH: TStringField
      DisplayLabel = #1053#1063
      FieldName = 'NCH'
      FixedChar = True
      Size = 1
    end
    object qrySpsDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qrySpsS1_TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'S1_TABN'
    end
    object qrySpsS2_TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088'_2'
      FieldName = 'S2_TABN'
    end
    object qrySpsKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 112
    Top = 128
  end
end
