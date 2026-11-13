object FormInvSt: TFormInvSt
  Left = 323
  Top = 296
  Width = 601
  Height = 406
  ActiveControl = dbgrSps
  BorderIcons = [biSystemMenu]
  Caption = 'FormInvSt'
  Color = clBtnFace
  Constraints.MinHeight = 400
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 31
    Hint = #1047#1072#1087#1080#1089#1077#1081' '#1089' '#1079#1072#1084#1077#1095#1072#1085#1080#1103#1084#1080
    Align = alTop
    BevelOuter = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    DesignSize = (
      593
      31)
    object sBtnPrt: TSpeedButton
      Left = 428
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1079#1072#1087#1080#1089#1077#1081' '#1089' '#1079#1072#1084#1077#1095#1072#1085#1080#1103#1084#1080
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object LabelCntRec: TLabel
      Left = 92
      Top = 9
      Width = 62
      Height = 13
      Hint = #1042#1089#1077#1075#1086' '#1079#1072#1087#1080#1089#1077#1081
      Caption = 'LabelCntRec'
      ParentShowHint = False
      ShowHint = True
    end
    object LabelCntNotes: TLabel
      Left = 176
      Top = 9
      Width = 84
      Height = 13
      Caption = 'LabelCntNotes'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 352
      Top = 3
      Width = 23
      Height = 25
      Hint = #1060#1080#1083#1100#1090#1088
      Caption = 'F'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = SpeedButton1Click
    end
    object bBtnCancel: TBitBtn
      Left = 515
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
      Hints.Strings = (
        #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
        #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      TabOrder = 1
    end
  end
  object dbgrSps: TDBGrid
    Left = 0
    Top = 31
    Width = 593
    Height = 348
    Align = alClient
    Color = 11992294
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
    OnEnter = dbgrSpsEnter
    OnExit = dbgrSpsExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKATP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEND'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MYNOTES'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MYMETKA'
        Visible = False
      end>
  end
  object qrySps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select distinct s.TabN, pr.KdKatP, k.ShKatP, pr.Inv, u.Fam, u.Im' +
        'a, u.Otch,'
      '        Cast(NULL as TimeStamp) as DtBeg,'
      '        Cast(NULL as TimeStamp) as DtEnd,'
      
        '        Cast(Null as Char(65)) as MyNotes, Cast(Null as Char(1))' +
        ' as MyMetka'
      ' from z_Sps s Left Outer Join Z_Upi u on u.TabN = s.TabN'
      
        '      Left outer join z_GetWrkPereOnDate(s.TabN, s.DtProc) pr on' +
        ' 1=1'
      '      Left Outer Join Z_KatPers k on k.KdKatP = pr.KdKatP'
      'where s.DtProc = '#39'01/01/2012'#39' and pr.Inv >= 1'
      'order by pr.KdKatP, s.TabN')
    Left = 56
    Top = 96
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
  object cdsSps: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSps'
    OnCalcFields = cdsSpsCalcFields
    OnFilterRecord = cdsSpsFilterRecord
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
    object cdsSpsDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
    end
    object cdsSpsDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
    end
    object cdsSpsMYNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'MYNOTES'
      FixedChar = True
      Size = 65
    end
    object cdsSpsMYMETKA: TStringField
      FieldName = 'MYMETKA'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcSps: TDataSource
    DataSet = cdsSps
    Left = 72
    Top = 160
  end
  object popPrt: TPopupMenu
    Left = 440
    Top = 56
    object popPrtAll: TMenuItem
      Caption = '- '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      OnClick = popPrtAllClick
    end
    object popPrtBadRecs: TMenuItem
      Caption = '- '#1090#1086#1083#1100#1082#1086' '#1079#1072#1084#1077#1095#1072#1085#1080#1103
      OnClick = popPrtBadRecsClick
    end
  end
end
