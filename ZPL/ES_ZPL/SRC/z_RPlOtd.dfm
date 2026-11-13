object FormRepPlOtd: TFormRepPlOtd
  Left = 504
  Top = 395
  Width = 500
  Height = 364
  BorderIcons = [biSystemMenu]
  Caption = 'FormRepPlOtd'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 550
  Constraints.MinHeight = 300
  Constraints.MinWidth = 500
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
  object dbgrMes: TDBGrid
    Left = 0
    Top = 0
    Width = 192
    Height = 325
    Align = alLeft
    DataSource = dsrcMes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MesRus'
        Width = 110
        Visible = True
      end>
  end
  object dbgrGrad: TDBGrid
    Left = 192
    Top = 0
    Width = 191
    Height = 325
    Hint = #1058#1072#1073#1083#1080#1094#1072' '#1075#1088#1072#1076#1072#1094#1080#1081
    Align = alClient
    DataSource = dsrcGrad
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = popGrad
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'P_FROM'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 54
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 383
    Top = 0
    Width = 101
    Height = 325
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      101
      325)
    object Label1: TLabel
      Left = 7
      Top = 44
      Width = 91
      Height = 78
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 
        #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1089#1103#1094', '#1087#1088#1086#1074#1077#1088#1100#1090#1077' '#1080', '#1077#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1086#1090#1088#1077#1076#1072#1082#1090#1080#1088#1091#1081#1090#1077' '#1090#1072#1073#1083#1080#1094#1091' ' +
        #1075#1088#1072#1076#1072#1094#1080#1081'.'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 7
      Top = 192
      Width = 91
      Height = 47
      Alignment = taCenter
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = #1053#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1055#1077#1095#1072#1090#1100'" '#1076#1083#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
      WordWrap = True
    end
    object sBtnPrt: TSpeedButton
      Left = 5
      Top = 264
      Width = 94
      Height = 26
      Anchors = [akRight, akBottom]
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
      Left = 5
      Top = 293
      Width = 94
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qryTmp: TQuery
    Left = 116
    Top = 204
  end
  object tblPln: TTable
    DatabaseName = 'c:\Temp'
    FieldDefs = <
      item
        Name = 'P_From'
        DataType = ftFloat
      end
      item
        Name = 'P_To'
        DataType = ftFloat
      end
      item
        Name = 'Cnt'
        DataType = ftInteger
      end
      item
        Name = 'Smm'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'pln_rpt.db'
    Left = 28
    Top = 204
    object tblPlnP_From: TFloatField
      DisplayLabel = #1057#1084#1054#1090
      FieldName = 'P_From'
      DisplayFormat = '#.00'
    end
    object tblPlnP_To: TFloatField
      DisplayLabel = #1057#1084#1044#1086'('#1074#1082#1083')'
      FieldName = 'P_To'
      DisplayFormat = '#.00'
    end
    object tblPlnCnt: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'Cnt'
    end
    object tblPlnSmm: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Smm'
      DisplayFormat = '#.00'
    end
  end
  object TDataSource
    DataSet = tblPln
    Left = 48
    Top = 216
  end
  object qryGrad: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from zz_poGrad'
      'order by P_From')
    UpdateObject = updGrad
    Left = 220
    Top = 75
    object qryGradNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.ZZ_POGRAD.NR'
    end
    object qryGradDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = 'DbMain.ZZ_POGRAD.DTBEG'
    end
    object qryGradP_FROM: TFloatField
      DisplayLabel = #1053#1080#1078#1085'.'#1087#1086#1088#1086#1075' '#1075#1088#1072#1076#1072#1094#1080#1080
      FieldName = 'P_FROM'
      Origin = 'DbMain.ZZ_POGRAD.P_FROM'
      DisplayFormat = '#.00'
    end
    object qryGradP_TO: TFloatField
      FieldName = 'P_TO'
      Origin = 'DbMain.ZZ_POGRAD.P_TO'
    end
    object qryGradNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.ZZ_POGRAD.NOTES'
      Size = 25
    end
  end
  object qryMes: TQuery
    OnCalcFields = qryMesCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select Distinct DtProc from Z_Sps')
    Left = 24
    Top = 56
    object qryMesDTPROC: TDateTimeField
      DisplayLabel = #1084#1084'-'#1075#1075#1075#1075
      DisplayWidth = 9
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryMesMesRus: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1043#1086#1076
      DisplayWidth = 21
      FieldKind = fkCalculated
      FieldName = 'MesRus'
      Calculated = True
    end
  end
  object dsrcMes: TDataSource
    DataSet = qryMes
    Left = 40
    Top = 72
  end
  object dsrcGrad: TDataSource
    DataSet = qryGrad
    Left = 240
    Top = 88
  end
  object updGrad: TUpdateSQL
    ModifySQL.Strings = (
      'update zz_poGrad'
      'set'
      '  DTBEG = :DTBEG,'
      '  P_FROM = :P_FROM,'
      '  P_TO = :P_TO,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into zz_poGrad'
      '  (DTBEG, P_FROM, P_TO, NOTES)'
      'values'
      '  (:DTBEG, :P_FROM, :P_TO, :NOTES)')
    DeleteSQL.Strings = (
      'delete from zz_poGrad'
      'where'
      '  NR = :OLD_NR')
    Left = 256
    Top = 104
  end
  object popGrad: TPopupMenu
    OnPopup = popGradPopup
    Left = 208
    Top = 40
    object popGradHead: TMenuItem
      Caption = '==  '#1043' '#1088' '#1072' '#1076' '#1072' '#1094' '#1080' '#1080'  =='
      Enabled = False
    end
    object popGradAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popGradAddClick
    end
    object popGradEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popGradEdtClick
    end
    object popGradDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popGradDelClick
    end
  end
  object cdsZpl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZpl'
    Left = 208
    Top = 168
  end
  object dspZpl: TDataSetProvider
    DataSet = qryTmp
    Left = 208
    Top = 136
  end
end
