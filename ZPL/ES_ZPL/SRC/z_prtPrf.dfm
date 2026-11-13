object FormPrtProf: TFormPrtProf
  Left = 312
  Top = 195
  Width = 695
  Height = 580
  BorderIcons = [biSystemMenu]
  Caption = 'FormPrtProf'
  Color = clBtnFace
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
    Top = 161
    Width = 687
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 687
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      687
      30)
    object sBtnPrt01: TSpeedButton
      Left = 3
      Top = 3
      Width = 135
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1073#1097#1077#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
      Caption = #1054#1073#1097#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
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
      Spacing = 1
      OnClick = sBtnPrt01Click
    end
    object sBtnPrt02: TSpeedButton
      Left = 141
      Top = 3
      Width = 155
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1079#1076#1077#1083#1100#1085#1099#1084#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1103#1084#1080' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
      Caption = #1056#1072#1079#1076#1077#1083#1100#1085#1099#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
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
      Spacing = 1
      OnClick = sBtnPrt02Click
    end
    object bBtnExit: TBitBtn
      Left = 610
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
  object dbgrNu: TDBGrid
    Left = 0
    Top = 30
    Width = 687
    Height = 131
    Align = alTop
    DataSource = dsrcNU
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dbgrProf: TDBGrid
    Left = 0
    Top = 164
    Width = 687
    Height = 389
    Align = alClient
    DataSource = dsrcProf
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdObj'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NmObj'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShObj'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmNach'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmProf'
        Visible = True
      end>
  end
  object qryNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select nu.TabN, upi.Fam, upi.Ima, upi.Otch, nu.KdObj, '
      
        '                                                  Sum(nu.Summa) ' +
        'as SmProf'
      ' from z_Nu nu'
      '      Left Outer Join z_Upi upi on upi.TabN = nu.TabN'
      'where (nu.DtProc = '#39'2005/09/01'#39') and (nu.VidN = '#39'68'#1072#39')'
      'group by nu.TabN, upi.Fam, upi.Ima, upi.Otch, nu.KdObj'
      '')
    Left = 320
    Top = 56
  end
  object dsrcNU: TDataSource
    DataSet = qryNu
    Left = 336
    Top = 72
  end
  object cdsProf: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'NmObj'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ShObj'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'SmNach'
        DataType = ftFloat
      end
      item
        Name = 'SmProf'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 408
    Data = {
      D70000009619E0BD010000001800000008000000000003000000D700024E5204
      0001000200010007535542545950450200490008004175746F696E6300054B64
      4F626A0400010000000000054E6D4F626A010049000000010005574944544802
      0002002D000553684F626A010049000000010005574944544802000200140005
      46616D494F0100490000000100055749445448020002002D00045461624E0400
      01000000000006536D4E616368080004000000000006536D50726F6608000400
      0000000001000C4155544F494E4356414C55450400010001000000}
    object cdsProfNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsProfKdObj: TIntegerField
      DisplayLabel = #1050#1086#1076#1055#1076#1088#1079#1076
      FieldName = 'KdObj'
    end
    object cdsProfNmObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NmObj'
      Size = 45
    end
    object cdsProfShObj: TStringField
      DisplayLabel = #1064#1092#1088#1055#1086#1076#1088#1072#1079#1076
      FieldName = 'ShObj'
    end
    object cdsProfFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 45
    end
    object cdsProfTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TabN'
    end
    object cdsProfSmNach: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'SmNach'
      DisplayFormat = '#.00'
    end
    object cdsProfSmProf: TFloatField
      DisplayLabel = #1059#1076#1088#1078#1055#1088#1086#1092#1089
      FieldName = 'SmProf'
      DisplayFormat = '#.00'
    end
  end
  object dsrcProf: TDataSource
    DataSet = cdsProf
    Left = 96
    Top = 424
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select nu.TabN, Sum(nu.Summa) as SmNach'
      '  from Z_NU nu, z_KdVidN kvd'
      '  where (nu.DtProc = '#39'2005/09/01'#39') and '
      
        '           (nu.VidN < "60") and (kvd.VidN = nu.VidN) and (kvd.SP' +
        'rf = 1)'
      ' group by nu.TabN')
    Left = 304
    Top = 184
  end
  object dspTmp: TDataSetProvider
    DataSet = qryTmp
    Left = 320
    Top = 200
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp'
    Left = 336
    Top = 216
  end
end
