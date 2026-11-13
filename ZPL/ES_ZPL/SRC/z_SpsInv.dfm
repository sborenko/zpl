object FormSpsInv: TFormSpsInv
  Left = 330
  Top = 259
  Width = 661
  Height = 404
  BorderIcons = [biSystemMenu]
  Caption = 'FormSpsInv'
  Color = clBtnFace
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 360
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
    Width = 653
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      653
      31)
    object LabelCntRec: TLabel
      Left = 92
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnPrt: TSpeedButton
      Left = 488
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
      Left = 575
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 3
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcSps
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrSps: TDBGrid
    Left = 0
    Top = 31
    Width = 653
    Height = 346
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcSps
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrSpsDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKATP'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMDOC'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRDOC'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBEGDOC'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTENDDOC'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTESDOC'
        Width = 83
        Visible = True
      end>
  end
  object qrySps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct s.TabN, pr.KdKatP, k.ShKatP,'
      
        ' pr.Inv, pr.NrDoc, pr.NmDoc, pr.DtBegDoc, pr.DtEndDoc, pr.NotesD' +
        'oc,'
      ' u.Fam, u.Ima, u.Otch from z_Sps s'
      ' Left Outer Join Z_Upi u on u.TabN = s.TabN'
      ' Left outer join z_GetWrkPereOnDate(s.TabN, s.DtProc) pr on 1=1'
      ' Left Outer Join Z_KatPers k on k.KdKatP = pr.KdKatP'
      ' where s.DtProc = '#39'01/01/2013'#39' and pr.Inv >= 1'
      ' order by pr.KdKatP, s.TabN'
      '')
    Left = 56
    Top = 96
  end
  object cdsSps: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSps'
    OnCalcFields = cdsSpsCalcFields
    Left = 56
    Top = 144
    object cdsSpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
    end
    object cdsSpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object cdsSpsKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090
      FieldName = 'KDKATP'
    end
    object cdsSpsSHKATP: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'SHKATP'
      Size = 10
    end
    object cdsSpsINV: TSmallintField
      DisplayLabel = #1048#1085#1074'.'
      FieldName = 'INV'
    end
    object cdsSpsFAM: TStringField
      FieldName = 'FAM'
    end
    object cdsSpsIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsSpsOTCH: TStringField
      FieldName = 'OTCH'
    end
    object cdsSpsNRDOC: TStringField
      DisplayLabel = #8470' '#1076#1086#1082
      FieldName = 'NRDOC'
      Size = 15
    end
    object cdsSpsNMDOC: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'NMDOC'
      Size = 25
    end
    object cdsSpsDTBEGDOC: TDateTimeField
      DisplayLabel = #1044#1090#1044#1086#1082#1053#1072#1095
      FieldName = 'DTBEGDOC'
    end
    object cdsSpsDTENDDOC: TDateTimeField
      DisplayLabel = #1044#1090#1044#1086#1082#1054#1082#1086#1085#1095
      FieldName = 'DTENDDOC'
    end
    object cdsSpsNOTESDOC: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTESDOC'
      Size = 35
    end
  end
  object dsrcSps: TDataSource
    DataSet = cdsSps
    Left = 72
    Top = 160
  end
  object dspSps: TDataSetProvider
    DataSet = qrySps
    Left = 96
    Top = 96
  end
  object pop: TPopupMenu
    Left = 144
    Top = 96
    object popHed: TMenuItem
      Caption = '== '#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' =='
      Enabled = False
    end
    object popSortByFIO: TMenuItem
      Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      OnClick = popSortByFIOClick
    end
    object popSortByKatFIO: TMenuItem
      Caption = '- '#1050#1072#1090#1077#1075#1086#1088#1080#1103', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      Checked = True
      OnClick = popSortByKatFIOClick
    end
  end
  object popPrt: TPopupMenu
    Left = 576
    Top = 72
    object popPrtAll: TMenuItem
      Caption = '- '#1087#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' ('#1074' '#1090'.'#1095'. '#1085#1077' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080')'
      OnClick = popPrtAllClick
    end
    object popPrtOnlyWithDoc: TMenuItem
      Caption = '- '#1087#1077#1095#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080
      OnClick = popPrtOnlyWithDocClick
    end
  end
end
