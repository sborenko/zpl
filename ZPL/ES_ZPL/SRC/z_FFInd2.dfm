object FormCreFIndx2: TFormCreFIndx2
  Left = 297
  Top = 420
  Width = 840
  Height = 425
  ActiveControl = dbgrFix
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormCreFIndx2'
  Color = clBtnFace
  Constraints.MinHeight = 425
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 832
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      832
      31)
    object sBtnStep1: TSpeedButton
      Left = 253
      Top = 3
      Width = 25
      Height = 25
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' Z_Pere '#1079#1072#1087#1080#1089#1077#1081' '#1089' Dt_Beg = 01-10-2014'
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep1Click
    end
    object sBtnStep2: TSpeedButton
      Left = 281
      Top = 3
      Width = 25
      Height = 25
      Hint = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1076#1072#1090#1099' '#1087#1088#1080#1105#1084#1072' '#1080' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
      Caption = '2'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep2Click
    end
    object sBtnStep3: TSpeedButton
      Left = 309
      Top = 3
      Width = 25
      Height = 25
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1084#1080' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1093' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
      Caption = '3'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep3Click
    end
    object sBtnStep4: TSpeedButton
      Left = 337
      Top = 3
      Width = 25
      Height = 25
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1080' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1089#1091#1084#1084#1099
      Caption = '4'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep4Click
    end
    object LabelCntFixRec: TLabel
      Left = 86
      Top = 10
      Width = 75
      Height = 13
      Caption = 'LabelCntFixRec'
    end
    object sBtnSaveToBD: TSpeedButton
      Left = 585
      Top = 3
      Width = 86
      Height = 25
      Hint = #1057#1086#1079#1088#1072#1085#1080#1090#1100' '#1074' '#1041#1072#1079#1091' '#1044#1072#1085#1085#1099#1093
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = sBtnSaveToBDClick
    end
    object sBtnPrt: TSpeedButton
      Left = 675
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
      Enabled = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFD0000000000000000000000FDFDFDFD0007070707
        0707070707000700FDFD000000000000000000000000000700FD000707070707
        07FBFBFB0707000000FD00070707070707F8F8F80707000700FD000000000000
        0000000000000007070000070707070707070707070007000700FD0000000000
        00000000000700070000FDFD00FFFFFFFFFFFFFFFF0007000700FDFDFD00FF00
        00000000FF00000000FDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00FF
        0000000000FF00FDFDFDFDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00
        0000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object sBtnGoToTabN: TSpeedButton
      Left = 457
      Top = 3
      Width = 25
      Height = 25
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1058#1072#1073#1053#1088' '#1074' '#1075#1083#1072#1074#1085#1086#1081' '#1092#1086#1088#1084#1077
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        04000000000068010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
        4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
        0000334A23333364A233333F38333333F383333300003366A6333342A2333333
        F383333F3383333300003334A263364AA3333333F338333F3833333300003336
        4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
        8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
        4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
        0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
        F333333383333333000033334AAA2233333333333F3333383333333300003333
        34A223333333333333F333833333333300003333334A443333333333333F3833
        33333333000033333342A63333333333333F33833333333300003333334AA633
        33333333333F3383333333330000333333666333333333333338883333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnGoToTabNClick
    end
    object sBtnLoadCds: TSpeedButton
      Left = 165
      Top = 3
      Width = 86
      Height = 25
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1089' '#1076#1080#1089#1082#1072
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = sBtnLoadCdsClick
    end
    object sBtnSaveCds: TSpeedButton
      Left = 365
      Top = 3
      Width = 86
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1085#1072' '#1076#1080#1089#1082
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = sBtnSaveCdsClick
    end
    object bBtnClose: TBitBtn
      Left = 754
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = bBtnCloseClick
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 3
      Top = 3
      Width = 80
      Height = 25
      DataSource = dstcFix
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrFix: TDBGrid
    Left = 0
    Top = 31
    Width = 832
    Height = 360
    Align = alClient
    Color = clMoneyGreen
    DataSource = dstcFix
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrFixDrawColumnCell
    OnEnter = dbgrFixEnter
    OnExit = dbgrFixExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        ReadOnly = True
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        ReadOnly = True
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtPriem'
        ReadOnly = True
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtUvoln'
        ReadOnly = True
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdObj'
        ReadOnly = True
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdKatP'
        ReadOnly = True
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO'
        ReadOnly = True
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CmbOkl'
        ReadOnly = True
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtBeg_0'
        ReadOnly = True
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OklNdb_0'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtBeg_1'
        ReadOnly = True
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OklNdb_1'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmDelta'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmDeltaON'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IndxNotes'
        ReadOnly = True
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmOldIndx'
        ReadOnly = True
        Width = 53
        Visible = True
      end
      item
        Color = 13429757
        Expanded = False
        FieldName = 'SmFixIndx'
        Visible = True
      end>
  end
  object qryTmp: TQuery
    Left = 32
    Top = 88
  end
  object cdsFix: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'DtPriem'
        DataType = ftDate
      end
      item
        Name = 'DtUvoln'
        DataType = ftDate
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'SO'
        DataType = ftSmallint
      end
      item
        Name = 'CmbOkl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DtBeg_0'
        DataType = ftDate
      end
      item
        Name = 'OklTrf_0'
        DataType = ftFloat
      end
      item
        Name = 'OklNdb_0'
        DataType = ftFloat
      end
      item
        Name = 'DtBeg_1'
        DataType = ftDate
      end
      item
        Name = 'OklTrf_1'
        DataType = ftFloat
      end
      item
        Name = 'OklNdb_1'
        DataType = ftFloat
      end
      item
        Name = 'SmDelta'
        DataType = ftFloat
      end
      item
        Name = 'SmDeltaON'
        DataType = ftFloat
      end
      item
        Name = 'SmOldIndx'
        DataType = ftFloat
      end
      item
        Name = 'SmFixIndx'
        DataType = ftFloat
      end
      item
        Name = 'IndxNotes'
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <
      item
        Name = 'IndexOnNR'
        Fields = 'NR'
      end>
    IndexName = 'IndexOnNR'
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 88
    object cdsFixNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsFixTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsFixFamIO: TStringField
      FieldName = 'FamIO'
      Size = 45
    end
    object cdsFixDtPriem: TDateField
      FieldName = 'DtPriem'
    end
    object cdsFixDtUvoln: TDateField
      FieldName = 'DtUvoln'
    end
    object cdsFixKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsFixKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsFixSO: TSmallintField
      FieldName = 'SO'
    end
    object cdsFixCmbOkl: TStringField
      FieldName = 'CmbOkl'
      Size = 1
    end
    object cdsFixDtBeg_0: TDateField
      FieldName = 'DtBeg_0'
    end
    object cdsFixOklTrf_0: TFloatField
      FieldName = 'OklTrf_0'
      DisplayFormat = '#.00'
    end
    object cdsFixOklNdb_0: TFloatField
      FieldName = 'OklNdb_0'
      DisplayFormat = '#.00'
    end
    object cdsFixDtBeg_1: TDateField
      FieldName = 'DtBeg_1'
    end
    object cdsFixOklTrf_1: TFloatField
      FieldName = 'OklTrf_1'
      DisplayFormat = '#.00'
    end
    object cdsFixOklNdb_1: TFloatField
      FieldName = 'OklNdb_1'
      DisplayFormat = '#.00'
    end
    object cdsFixSmDelta: TFloatField
      FieldName = 'SmDelta'
      DisplayFormat = '#.00'
    end
    object cdsFixSmDeltaON: TFloatField
      FieldName = 'SmDeltaON'
      DisplayFormat = '#.00'
    end
    object cdsFixIndxNotes: TStringField
      FieldName = 'IndxNotes'
      Size = 25
    end
    object cdsFixSmOldIndx: TFloatField
      FieldName = 'SmOldIndx'
      DisplayFormat = '#.00'
    end
    object cdsFixSmFixIndx: TFloatField
      FieldName = 'SmFixIndx'
      DisplayFormat = '#.00'
    end
  end
  object dstcFix: TDataSource
    DataSet = cdsFix
    Left = 80
    Top = 96
  end
  object qryON: TQuery
    Left = 32
    Top = 128
  end
  object qryOtkl: TQuery
    Left = 32
    Top = 176
  end
  object qrySps: TQuery
    Left = 32
    Top = 224
  end
  object qryFIndx: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_FixIndx'
      '')
    UpdateObject = updFIndx
    Left = 160
    Top = 88
    object qryFIndxNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_FIXINDX.NR'
    end
    object qryFIndxTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_FIXINDX.TABN'
    end
    object qryFIndxLASTDTUV: TDateTimeField
      FieldName = 'LASTDTUV'
      Origin = 'DbMain.Z_FIXINDX.LASTDTUV'
    end
    object qryFIndxFIXMES: TDateTimeField
      FieldName = 'FIXMES'
      Origin = 'DbMain.Z_FIXINDX.FIXMES'
    end
    object qryFIndxFIXSMM: TFloatField
      FieldName = 'FIXSMM'
      Origin = 'DbMain.Z_FIXINDX.FIXSMM'
    end
    object qryFIndxNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_FIXINDX.NOTES'
      Size = 35
    end
    object qryFIndxF_SMM: TFloatField
      FieldName = 'F_SMM'
      Origin = 'DbMain.Z_FIXINDX.F_SMM'
    end
    object qryFIndxD_OKLNDB: TFloatField
      FieldName = 'D_OKLNDB'
      Origin = 'DbMain.Z_FIXINDX.D_OKLNDB'
    end
    object qryFIndxDEL: TStringField
      FieldName = 'DEL'
      Origin = 'DbMain.Z_FIXINDX.DEL'
      FixedChar = True
      Size = 1
    end
    object qryFIndxMYFLD: TStringField
      FieldName = 'MYFLD'
      Origin = 'DbMain.Z_FIXINDX.MYFLD'
      FixedChar = True
      Size = 3
    end
  end
  object updFIndx: TUpdateSQL
    ModifySQL.Strings = (
      'update z_FixIndx'
      'set'
      '  TABN = :TABN,'
      '  LASTDTUV = :LASTDTUV,'
      '  FIXMES = :FIXMES,'
      '  FIXSMM = :FIXSMM,'
      '  NOTES = :NOTES,'
      '  F_SMM = :F_SMM,'
      '  D_OKLNDB = :D_OKLNDB,'
      '  DEL = :DEL,'
      '  MYFLD = :MYFLD'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_FixIndx'
      '  (TABN, LASTDTUV, FIXMES, FIXSMM, NOTES, F_SMM, D_OKLNDB, DEL, '
      'MYFLD)'
      'values'
      
        '  (:TABN, :LASTDTUV, :FIXMES, :FIXSMM, :NOTES, :F_SMM, :D_OKLNDB' +
        ', :DEL, '
      '   :MYFLD)')
    DeleteSQL.Strings = (
      'delete from z_FixIndx'
      'where'
      '  NR = :OLD_NR')
    Left = 176
    Top = 104
  end
end
