object FormShDets: TFormShDets
  Left = 359
  Top = 183
  Width = 580
  Height = 425
  BorderIcons = [biSystemMenu]
  Caption = 'FormShDets'
  Color = clBtnFace
  Constraints.MaxHeight = 800
  Constraints.MaxWidth = 780
  Constraints.MinHeight = 425
  Constraints.MinWidth = 580
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 572
    Height = 398
    ActivePage = tsWithZapret
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object tsBezRasch: TTabSheet
      Caption = 'tsBezRasch'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 564
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          564
          31)
        object sBtnPrt1: TSpeedButton
          Left = 394
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
          Visible = False
        end
        object bBtnCancel1: TBitBtn
          Left = 486
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
      object dbgr1: TDBGrid
        Left = 0
        Top = 31
        Width = 564
        Height = 336
        Align = alClient
        Color = 13429757
        DataSource = dsrc1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fam'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ima'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Otch'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            Width = 88
            Visible = True
          end>
      end
    end
    object tsWithZapret: TTabSheet
      Caption = 'tsWithZapret'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 564
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          564
          31)
        object sBtnPrt2: TSpeedButton
          Left = 394
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
          Visible = False
        end
        object bBtnCancel2: TBitBtn
          Left = 486
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
      object dbgr2: TDBGrid
        Left = 0
        Top = 31
        Width = 564
        Height = 336
        Align = alClient
        Color = clSkyBlue
        DataSource = dsrc2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToVupl'
            Width = 89
            Visible = True
          end>
      end
    end
    object tsWithDlgTM: TTabSheet
      Caption = 'tsWithDlgTM'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 564
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          564
          31)
        object sBtnPrt3: TSpeedButton
          Left = 394
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
          Visible = False
        end
        object bBtnCancel3: TBitBtn
          Left = 486
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
      object dbgr3: TDBGrid
        Left = 0
        Top = 31
        Width = 564
        Height = 336
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrc3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMesGod'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmDlg'
            Visible = True
          end>
      end
    end
  end
  object qryTmp: TQuery
    Left = 40
    Top = 96
  end
  object cds1: TClientDataSet
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
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
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
        Name = 'Notes'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 96
    Top = 96
    object cds1NR: TAutoIncField
      DisplayLabel = #1053#1088
      FieldName = 'NR'
    end
    object cds1TabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cds1Fam: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'Fam'
    end
    object cds1Ima: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'Ima'
      Size = 15
    end
    object cds1Otch: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'Otch'
    end
    object cds1ID: TStringField
      DisplayLabel = #1048#1044
      FieldName = 'ID'
      Size = 10
    end
    object cds1KdSps: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KdSps'
    end
    object cds1KdObj: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KdObj'
    end
    object cds1KdKatP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'KdKatP'
    end
    object cds1Notes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'Notes'
      Size = 45
    end
  end
  object cds2: TClientDataSet
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
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 10
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
        Name = 'SmToVupl'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cds2CalcFields
    Left = 152
    Top = 96
    object cds2NR: TAutoIncField
      DisplayLabel = #1053#1088
      FieldName = 'NR'
    end
    object cds2TabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cds2FamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object cds2Fam: TStringField
      FieldName = 'Fam'
    end
    object cds2Ima: TStringField
      FieldName = 'Ima'
      Size = 15
    end
    object cds2Otch: TStringField
      FieldName = 'Otch'
    end
    object cds2ID: TStringField
      DisplayLabel = #1048#1044
      FieldName = 'ID'
      Size = 10
    end
    object cds2KdObj: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KdObj'
    end
    object cds2KdKatP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'KdKatP'
    end
    object cds2SmToVupl: TFloatField
      DisplayLabel = #1057#1084#1050#1042#1099#1087#1083#1072#1090#1077
      FieldName = 'SmToVupl'
      DisplayFormat = '#.00'
    end
  end
  object dsrc1: TDataSource
    DataSet = cds1
    Left = 112
    Top = 112
  end
  object cds3: TClientDataSet
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
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 10
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
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SmDlg'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cds3CalcFields
    Left = 200
    Top = 96
    object cds3NR: TAutoIncField
      DisplayLabel = #1053#1088
      FieldName = 'NR'
    end
    object cds3TabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cds3FamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object cds3Fam: TStringField
      FieldName = 'Fam'
    end
    object cds3Ima: TStringField
      FieldName = 'Ima'
      Size = 15
    end
    object cds3Otch: TStringField
      FieldName = 'Otch'
    end
    object cds3ID: TStringField
      DisplayLabel = #1048#1044
      FieldName = 'ID'
      Size = 10
    end
    object cds3KdObj: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KdObj'
    end
    object cds3KdKatP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'KdKatP'
    end
    object cds3ZaMesGod: TDateField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yyyy'
    end
    object cds3SmDlg: TFloatField
      DisplayLabel = #1057#1084#1044#1086#1083#1075#1072
      FieldName = 'SmDlg'
      DisplayFormat = '#.00'
    end
  end
  object dsrc2: TDataSource
    DataSet = cds2
    Left = 160
    Top = 112
  end
  object dsrc3: TDataSource
    DataSet = cds3
    Left = 216
    Top = 112
  end
end
