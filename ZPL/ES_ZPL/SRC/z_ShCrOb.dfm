object FormShwCurObj: TFormShwCurObj
  Left = 358
  Top = 176
  Width = 613
  Height = 450
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwCurObj'
  Color = clBtnFace
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 450
  Constraints.MinWidth = 600
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
  object dbgrSps: TDBGrid
    Left = 0
    Top = 29
    Width = 605
    Height = 394
    Hint = 
      #1063#1090#1086#1073#1099' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1089#1085#1103#1090#1100' '#1084#1072#1083#1080#1085#1086#1074#1091#1102' '#1084#1077#1090#1082#1091' '#1085#1072' '#1085#1091#1078#1085#1086#1084' '#1087#1086#1083#1077', '#1097#1077#1083#1082#1085#1080#1090 +
      #1077' '#1084#1099#1096#1082#1086#1081' '#1085#1072' '#1079#1072#1075#1086#1083#1086#1074#1082#1077' '#1087#1086#1083#1103
    Align = alClient
    DataSource = dsrcSps
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = pop
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = dbgrSpsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdObj'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dolgnost'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Oklad'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDBNK'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShBnk'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LICSCH'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      605
      29)
    object sBtnPrt: TSpeedButton
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Hint = #1053#1072' '#1087#1077#1095#1072#1090#1100' '#1074#1099#1074#1086#1076#1103#1090#1089#1103' '#1087#1086#1083#1103' '#1089' "'#1084#1072#1083#1080#1085#1086#1074#1099#1084#1080'" '#1079#1072#1075#1086#1083#1086#1074#1082#1072#1084#1080
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
    object LabelCntRec: TLabel
      Left = 219
      Top = 8
      Width = 74
      Height = 13
      Caption = #1047#1072#1087#1080#1089#1077#1081' '#1061#1061#1061#1061
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 336
      Top = 8
      Width = 63
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072':'
    end
    object Label2: TLabel
      Left = 89
      Top = 0
      Width = 116
      Height = 27
      Hint = 
        #1063#1090#1086#1073#1099' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1089#1085#1103#1090#1100' '#1084#1072#1083#1080#1085#1086#1074#1091#1102' '#1084#1077#1090#1082#1091' '#1085#1072' '#1087#1086#1083#1077', '#1097#1077#1083#1082#1085#1080#1090#1077' '#1084#1099#1096#1082#1086 +
        #1081' '#1085#1072' '#1079#1072#1075#1086#1083#1086#1074#1082#1077' '#1087#1086#1083#1103
      Alignment = taCenter
      AutoSize = False
      Caption = #1053#1072' '#1087#1077#1095#1072#1090#1100' '#1074#1099#1074#1086#1076#1103#1090#1089#1103' "'#1084#1072#1083#1080#1085#1086#1074#1099#1077'" '#1087#1086#1083#1103
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object rBtnSortByFIO: TRadioButton
      Left = 409
      Top = 13
      Width = 113
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
      TabOrder = 1
      OnClick = rBtnSortByTabNClick
    end
    object BitBtn1: TBitBtn
      Left = 528
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 2
      Kind = bkClose
    end
    object rBtnSortByTabN: TRadioButton
      Left = 409
      Top = -1
      Width = 77
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '- '#1087#1086' '#1058#1072#1073#1053#1088
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rBtnSortByTabNClick
    end
  end
  object LbxColNames: TListBox
    Left = 16
    Top = 144
    Width = 65
    Height = 49
    BorderStyle = bsNone
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object LbxColTitles: TListBox
    Left = 16
    Top = 200
    Width = 65
    Height = 49
    BorderStyle = bsNone
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object qrySps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select s.TabN, u.Fam, u.Ima, u.Otch, u.Id, bl.KdBnk, bl.LicSch'
      '   from z_Sps s Left Outer Join z_Upi u on u.TabN = s.TabN'
      
        '                Left outer join GETWRKBNKLS (s.TabN, s.DtProc) b' +
        'l on 1 = 1'
      'where s.DtProc = '#39'11/01/2006'#39' and s.KdObj = 1020')
    Left = 96
    Top = 96
  end
  object cdsSps: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TABN'
        DataType = ftInteger
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'FAM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IMA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KDBNK'
        DataType = ftSmallint
      end
      item
        Name = 'LICSCH'
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <
      item
        Name = 'OnTabN'
        Fields = 'TabN'
      end
      item
        Name = 'OnFIO'
        CaseInsFields = 'Fam;Ima;Otch'
        Fields = 'Fam;Ima;Otch'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'OnKdObjTabN'
        Fields = 'KdObj;TabN'
      end
      item
        Name = 'OnKdObjFIO'
        Fields = 'KdObj;Fam;Ima;Otch'
      end>
    IndexName = 'OnTabN'
    Params = <>
    ProviderName = 'dspSps'
    StoreDefs = True
    OnCalcFields = cdsSpsCalcFields
    Left = 160
    Top = 96
    object cdsSpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object cdsSpsKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsSpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 30
      Calculated = True
    end
    object cdsSpsFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object cdsSpsIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object cdsSpsOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
    object cdsSpsID: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090'.'
      FieldName = 'ID'
      Size = 10
    end
    object cdsSpsOklad: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldKind = fkCalculated
      FieldName = 'Oklad'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object cdsSpsKDBNK: TSmallintField
      DisplayLabel = #1050#1086#1076' '#1041#1085#1082
      FieldName = 'KDBNK'
    end
    object cdsSpsShBnk: TStringField
      DisplayLabel = #1064#1080#1092#1088' '#1073#1072#1085#1082#1072
      FieldKind = fkCalculated
      FieldName = 'ShBnk'
      Calculated = True
    end
    object cdsSpsLICSCH: TStringField
      DisplayLabel = #1051#1080#1094'. '#1089#1095#1077#1090
      FieldName = 'LICSCH'
      Size = 25
    end
    object cdsSpsDolgnost: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldKind = fkCalculated
      FieldName = 'Dolgnost'
      Size = 65
      Calculated = True
    end
  end
  object dsrcSps: TDataSource
    DataSet = cdsSps
    Left = 176
    Top = 112
  end
  object dspSps: TDataSetProvider
    DataSet = qrySps
    Left = 128
    Top = 96
  end
  object qryPere: TQuery
    DatabaseName = 'DbMain'
    Left = 248
    Top = 96
  end
  object pop: TPopupMenu
    AutoPopup = False
    Left = 192
    Top = 192
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1083#1102' '#1058#1072#1073'.'#1085'-'#1088
        Checked = True
        GroupIndex = 3
        RadioItem = True
        OnClick = popSortByTabNClick
      end
      object popSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        GroupIndex = 3
        RadioItem = True
        OnClick = popSortByFIOClick
      end
    end
  end
end
