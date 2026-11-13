object FormSpsLgt: TFormSpsLgt
  Left = 385
  Top = 272
  Width = 490
  Height = 350
  ActiveControl = dbgrLgt
  BorderIcons = [biSystemMenu]
  Caption = 'FormSpsLgt'
  Color = clBtnFace
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 350
  Constraints.MinWidth = 490
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
    Width = 482
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      482
      31)
    object sBtnPrt: TSpeedButton
      Left = 323
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
    object LabelCntRec: TLabel
      Left = 95
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object bBtnCancel: TBitBtn
      Left = 406
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
      Left = 4
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcLgt
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrLgt: TDBGrid
    Left = 0
    Top = 31
    Width = 482
    Height = 292
    Align = alClient
    Color = 11861218
    DataSource = dsrcLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrLgtEnter
    OnExit = dbgrLgtExit
    Columns = <
      item
        Expanded = False
        FieldName = 'PRCLGT'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_PILG'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Width = 28
        Visible = True
      end>
  end
  object qryLgt: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct s.TabN, u.Fam, u.Ima, u.Otch, p.* '
      'from z_Sps s Left Outer Join z_Upi u on u.TabN = s.Tabn'
      
        '             Left Outer Join Get_Lgota(s.TabN, '#39'03/01/2011'#39', '#39'03' +
        '/31/2011'#39') p on 1=1'
      
        'where s.DtProc = '#39'03/01/2011'#39' and p.PrcLgt > 0 order by s.TabN, ' +
        'p.PrcLgt')
    Left = 48
    Top = 88
  end
  object dspLgt: TDataSetProvider
    DataSet = qryLgt
    Left = 88
    Top = 88
  end
  object cdsLgt: TClientDataSet
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
        Name = 'OZN_PILG'
        DataType = ftSmallint
      end
      item
        Name = 'CNT'
        DataType = ftSmallint
      end
      item
        Name = 'PRCLGT'
        DataType = ftFloat
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
        Name = 'OnPrcFIO'
        CaseInsFields = 'Fam;Ima;Otch'
        Fields = 'PrcLgt;Fam;Ima;Otch'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    ProviderName = 'dspLgt'
    StoreDefs = True
    Left = 128
    Top = 88
    object cdsLgtTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object cdsLgtFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object cdsLgtIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object cdsLgtOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
    object cdsLgtOZN_PILG: TSmallintField
      DisplayLabel = #1054#1079#1085#1055#1110#1083#1100#1075#1080
      FieldName = 'OZN_PILG'
    end
    object cdsLgtCNT: TSmallintField
      DisplayLabel = #1050'-'#1074#1086#1051#1100#1075#1086#1090
      FieldName = 'CNT'
    end
    object cdsLgtPRCLGT: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090
      FieldName = 'PRCLGT'
    end
  end
  object dsrcLgt: TDataSource
    DataSet = cdsLgt
    Left = 144
    Top = 104
  end
  object pop: TPopupMenu
    Left = 48
    Top = 128
    object popHead: TMenuItem
      Caption = '= = '#1057#1086#1090#1088#1080#1088#1086#1074#1082#1072' = ='
      Enabled = False
    end
    object popOrderByPrcFIO: TMenuItem
      Caption = '- '#1087#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      Checked = True
      OnClick = popOrderByPrcFIOClick
    end
    object popOrderByTabN: TMenuItem
      Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
      OnClick = popOrderByTabNClick
    end
    object popOrderByFIO: TMenuItem
      Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080', '#1048#1084#1077#1085#1080', '#1054#1090#1095#1077#1089#1090#1074#1091
      OnClick = popOrderByFIOClick
    end
  end
end
