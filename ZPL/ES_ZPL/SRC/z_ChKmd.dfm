object FormCheckKmd: TFormCheckKmd
  Left = 375
  Top = 335
  Width = 651
  Height = 343
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormCheckKmd'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 260
  Constraints.MinWidth = 560
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
  object dbgrChKmd: TDBGrid
    Left = 0
    Top = 31
    Width = 643
    Height = 285
    Align = alClient
    Color = 12974784
    DataSource = dsrcCheck
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrChKmdDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtProc'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtBeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtEnd'
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'DtProcZp'
        Width = 42
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'Sm1206'
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'Spec_NrZp'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      643
      31)
    object sBtnCheckPrt: TSpeedButton
      Left = 465
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
    object sBtnCheckClose: TSpeedButton
      Left = 565
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      Spacing = 0
      OnClick = sBtnCheckCloseClick
    end
  end
  object cdsCheck: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end
      item
        Name = 'Spec_NrZp'
        DataType = ftInteger
      end
      item
        Name = 'DtProcZp'
        DataType = ftDate
      end
      item
        Name = 'Sm1206'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 96
    object cdsCheckNR: TIntegerField
      DisplayLabel = 'NR_Kmd'
      FieldName = 'NR'
    end
    object cdsCheckDtProc: TDateField
      DisplayLabel = #1056#1052#1077#1089'_'#1050#1084#1076
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsCheckTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsCheckFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsCheckDtBeg: TDateField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DtBeg'
    end
    object cdsCheckDtEnd: TDateField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DtEnd'
    end
    object cdsCheckSpec_NrZp: TIntegerField
      DisplayLabel = #1057#1087#1077#1094'_'#1053#1088#1047#1087
      FieldName = 'Spec_NrZp'
    end
    object cdsCheckDtProcZp: TDateField
      DisplayLabel = #1056#1052#1077#1089'_'#1047#1087
      FieldName = 'DtProcZp'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsCheckSm1206: TFloatField
      DisplayLabel = #1057#1084'1206'
      FieldName = 'Sm1206'
      DisplayFormat = '0.00'
    end
  end
  object dsrcCheck: TDataSource
    DataSet = cdsCheck
    Left = 64
    Top = 112
  end
end
