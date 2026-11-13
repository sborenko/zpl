object FormShwEndVupl: TFormShwEndVupl
  Left = 1115
  Top = 371
  Width = 546
  Height = 484
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwEndVupl'
  Color = clBtnFace
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 350
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      538
      30)
    object sBtnPg1: TSpeedButton
      Left = 1
      Top = 3
      Width = 92
      Height = 25
      Hint = #1057#1091#1084#1084#1099' '#1082' '#1074#1099#1087#1083#1072#1090#1077' [ Sum(Summa) for VidN < "8000" ]'
      GroupIndex = 3
      Down = True
      Caption = #1057#1091#1084#1084#1099' '#1085#1072' '#1088#1091#1082#1080
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPg1Click
    end
    object sBtnPg2: TSpeedButton
      Left = 96
      Top = 3
      Width = 80
      Height = 25
      Hint = #1057#1091#1084#1084#1099' '#1042#1044#1086#1083#1075#1058#1052' [  VidN = 2724 ]'
      GroupIndex = 3
      Caption = #1042#1044#1086#1083#1075#1058#1052
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPg2Click
    end
    object sBtnPrt: TSpeedButton
      Left = 376
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
    object sBtnNerasch: TSpeedButton
      Left = 180
      Top = 3
      Width = 93
      Height = 25
      GroupIndex = 3
      Caption = #1053#1077#1088#1072#1089#1095#1080#1090#1072#1085#1085#1099#1077
      OnClick = sBtnNeraschClick
    end
    object BitBtn1: TBitBtn
      Left = 461
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
    object DBNavigator1: TDBNavigator
      Left = 291
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcAll
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 30
    Width = 538
    Height = 427
    ActivePage = ts3
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'ts1'
      object LabelTtAll: TLabel
        Left = 0
        Top = 383
        Width = 530
        Height = 13
        Hint = 'nCntRec, nSmPlus - nSmMinus = nResult'
        Align = alBottom
        Alignment = taCenter
        Caption = 'LabelTtAll'
        ParentShowHint = False
        ShowHint = True
      end
      object dbgrAll: TDBGrid
        Left = 0
        Top = 0
        Width = 530
        Height = 383
        Hint = #1057#1091#1084#1084#1099' '#1082' '#1074#1099#1087#1083#1072#1090#1077' [ Sum(Summa) for VidN < "8000" ]'
        Align = alClient
        Color = clCream
        DataSource = dsrcAll
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
        OnDrawColumnCell = dbgrAllDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object LabelTt2724: TLabel
        Left = 0
        Top = 383
        Width = 530
        Height = 13
        Hint = 'nCntRec, nSmPlus - nSmMinus = nResult'
        Align = alBottom
        Alignment = taCenter
        Caption = 'LabelTt2724'
        ParentShowHint = False
        ShowHint = True
      end
      object dbgrDTM: TDBGrid
        Left = 0
        Top = 0
        Width = 530
        Height = 383
        Hint = #1057#1091#1084#1084#1099' '#1042#1044#1086#1083#1075#1058#1052' [  VidN = 2724 ]'
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcDTM
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
        OnDrawColumnCell = dbgrDTMDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShObj'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Visible = True
          end>
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object lblRecCount: TLabel
        Left = 0
        Top = 380
        Width = 530
        Height = 16
        Align = alBottom
        Alignment = taCenter
        Caption = 'lblRecCount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbrgNerasch: TDBGrid
        Left = 0
        Top = 0
        Width = 530
        Height = 380
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcNerasch
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TabN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Visible = True
          end>
      end
    end
  end
  object qrySps: TQuery
    DatabaseName = 'DbMain'
    Left = 32
    Top = 248
  end
  object cdsAll: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TABN'
        DataType = ftInteger
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
        Name = 'KDOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'SMM'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnTabN'
        Fields = 'TabN'
      end
      item
        Name = 'OnSmm'
        Fields = 'SMM'
      end>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsAllCalcFields
    Left = 24
    Top = 184
    object cdsAllTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
    end
    object cdsAllFAM: TStringField
      FieldName = 'FAM'
    end
    object cdsAllIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsAllOTCH: TStringField
      FieldName = 'OTCH'
    end
    object cdsAllKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1050#1076
      FieldName = 'KDOBJ'
    end
    object cdsAllSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
    object cdsAllFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dspTmp: TDataSetProvider
    Left = 64
    Top = 128
  end
  object dsrcAll: TDataSource
    DataSet = cdsAll
    Left = 40
    Top = 200
  end
  object qryDsp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select n.TabN, u.Fam, u.Ima, u.Otch, n.KdObj, n.Summa as SMM '
      '  from z_NU n Left Outer Join z_Upi u on u.TabN = n.TabN'
      '  where n.dtProc = '#39'07/01/2007'#39' and n.VidN = "2724"')
    Left = 44
    Top = 113
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 156
    Top = 105
    object popHead: TMenuItem
      Caption = '== '#1058#1072#1073#1083#1080#1094#1072' '#1074#1099#1087#1083#1072#1090' =='
      Enabled = False
    end
    object popSortAllByTabN: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1058#1072#1073#1053#1088
      Checked = True
      OnClick = popSortAllByTabNClick
    end
    object popSortAllBySmm: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1057#1091#1084#1084#1077
      OnClick = popSortAllBySmmClick
    end
    object popSortDtmByTabN: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1058#1072#1073#1053#1088
      Checked = True
      OnClick = popSortDtmByTabNClick
    end
    object popSortDtmBySmm: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1057#1091#1084#1084#1077
      OnClick = popSortDtmBySmmClick
    end
  end
  object cdsDTM: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TABN'
        DataType = ftInteger
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
        Name = 'KDOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'SMM'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnTabN'
        Fields = 'TabN'
      end
      item
        Name = 'OnSmm'
        Fields = 'SMM'
      end>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsDTMCalcFields
    Left = 272
    Top = 152
    object cdsDTMTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
    end
    object cdsDTMFAM: TStringField
      FieldName = 'FAM'
    end
    object cdsDTMIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsDTMOTCH: TStringField
      FieldName = 'OTCH'
    end
    object cdsDTMKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1050#1076
      FieldName = 'KDOBJ'
    end
    object cdsDTMSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
    object cdsDTMFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dsrcDTM: TDataSource
    DataSet = cdsDTM
    Left = 288
    Top = 168
  end
  object dsrcNerasch: TDataSource
    DataSet = cdsNerasch
    Left = 292
    Top = 249
  end
  object cdsNerasch: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 276
    Top = 233
    object cdsNeraschTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsNeraschKdObj: TSmallintField
      DisplayLabel = #1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsNeraschKdSps: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KdSps'
    end
    object cdsNeraschFam: TStringField
      FieldName = 'Fam'
      Size = 35
    end
    object cdsNeraschIma: TStringField
      FieldName = 'Ima'
      Size = 30
    end
    object cdsNeraschOtch: TStringField
      FieldName = 'Otch'
      Size = 30
    end
    object cdsNeraschFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
end
