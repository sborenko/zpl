object FormFixIndx: TFormFixIndx
  Left = 378
  Top = 148
  Width = 800
  Height = 430
  ActiveControl = dbgrFIndx
  BorderIcons = [biSystemMenu]
  Caption = 'FormFixIndx'
  Color = clBtnFace
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 430
  Constraints.MinWidth = 485
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      792
      31)
    object LabelCntRec: TLabel
      Left = 88
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnPrt: TSpeedButton
      Left = 634
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
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
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 715
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcFIndx
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrFIndx: TDBGrid
    Left = 0
    Top = 31
    Width = 792
    Height = 372
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcFIndx
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrFIndxDrawColumnCell
    OnEnter = dbgrFIndxEnter
    OnExit = dbgrFIndxExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        ReadOnly = True
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIEM'
        ReadOnly = True
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTDTUV'
        ReadOnly = True
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIXMES'
        Width = 61
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'F_SMM'
        Width = 67
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'D_OKLNDB'
        Width = 67
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'FIXSMM'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEL'
        Width = 15
        Visible = True
      end>
  end
  object qryFIndx: TQuery
    CachedUpdates = True
    BeforePost = qryFIndxBeforePost
    AfterPost = qryFIndxAfterPost
    AfterDelete = qryFIndxAfterDelete
    OnCalcFields = qryFIndxCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, pu.Dt_Priem, pu.Dt_Uvoln LastDtUv,'
      ' f.NR, f.TabN, f.FixMes, f.FixSmm, f.Notes, f.F_SMM,'
      ' f.D_OklNdb, f.Del , f.MyFld from z_FixIndx f '
      ' Left Outer Join z_Upi u on u.TabN = f.TabN '
      ' Left Outer Join z_LastPrmUv (f.TabN) pu on 1=1'
      ' order by u.Fam, u.Ima, u.Otch, f.TabN, f.FixMes')
    UpdateObject = updFIndx
    Left = 56
    Top = 104
    object qryFIndxNR: TIntegerField
      FieldName = 'NR'
    end
    object qryFIndxTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryFIndxDT_PRIEM: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1105#1084#1072
      FieldName = 'DT_PRIEM'
    end
    object qryFIndxLASTDTUV: TDateTimeField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085'.'
      FieldName = 'LASTDTUV'
    end
    object qryFIndxFAM: TStringField
      FieldName = 'FAM'
    end
    object qryFIndxIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryFIndxOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryFIndxFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryFIndxFIXMES: TDateTimeField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1085#1072#1095#1072#1083#1072
      FieldName = 'FIXMES'
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qryFIndxFIXSMM: TFloatField
      DisplayLabel = #1060#1080#1082#1089'.'#1057#1091#1084#1084#1072
      FieldName = 'FIXSMM'
      DisplayFormat = '#.00'
    end
    object qryFIndxNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Size = 35
    end
    object qryFIndxF_SMM: TFloatField
      DisplayLabel = #1060#1057#1084#1084'_1'
      FieldName = 'F_SMM'
      DisplayFormat = '#.00'
    end
    object qryFIndxD_OKLNDB: TFloatField
      DisplayLabel = #1044'_'#1054#1082#1083#1053#1076#1073
      FieldName = 'D_OKLNDB'
      DisplayFormat = '#.00'
    end
    object qryFIndxDEL: TStringField
      DisplayLabel = #1059#1076#1083
      FieldName = 'DEL'
      FixedChar = True
      Size = 1
    end
    object qryFIndxMYFLD: TStringField
      FieldName = 'MYFLD'
      FixedChar = True
      Size = 3
    end
  end
  object dsrcFIndx: TDataSource
    DataSet = qryFIndx
    Left = 72
    Top = 112
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
      '  DEL = :DEL'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_FixIndx'
      '  (TABN, LASTDTUV, FIXMES, FIXSMM, NOTES, F_SMM, D_OKLNDB, DEL)'
      'values'
      
        '  (:TABN, :LASTDTUV, :FIXMES, :FIXSMM, :NOTES, :F_SMM, :D_OKLNDB' +
        ', :DEL)')
    DeleteSQL.Strings = (
      'delete from z_FixIndx'
      'where'
      '  NR = :OLD_NR')
    Left = 80
    Top = 120
  end
  object qryTmp: TQuery
    Left = 144
    Top = 104
  end
  object pop: TPopupMenu
    Left = 56
    Top = 168
    object popDelRec: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1092#1080#1079#1080#1095#1077#1089#1082#1080' ("'#1089' '#1082#1086#1085#1094#1072#1084#1080'")'
      OnClick = popDelRecClick
    end
    object popDelUvoln: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1074#1086#1083#1077#1085#1085#1099#1093' '#1076#1086'  ...'
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' "'#1091#1076#1072#1083#1105#1085#1085#1099#1084#1080'" '#1091#1074#1086#1083#1077#1085#1085#1099#1093' '#1085#1072' '#1079#1072#1076#1072#1085#1085#1091#1102' '#1076#1072#1090#1091
      OnClick = popDelUvolnClick
    end
    object popSep1: TMenuItem
      Caption = '-'
    end
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popSortBySm: TMenuItem
        Caption = '- '#1087#1086' '#1089#1091#1084#1084#1077' '#1060#1057#1084#1084'_1'
        OnClick = popSortBySmClick
      end
      object popSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1058#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        OnClick = popSortByTabNClick
      end
      object popSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        OnClick = popSortByFIOClick
      end
    end
  end
end
