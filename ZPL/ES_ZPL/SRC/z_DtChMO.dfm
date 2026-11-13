object FormChDatMO: TFormChDatMO
  Left = 339
  Top = 246
  Width = 750
  Height = 450
  BorderIcons = [biSystemMenu]
  Caption = 'FormChDatMO'
  Color = clBtnFace
  Constraints.MaxWidth = 750
  Constraints.MinHeight = 450
  Constraints.MinWidth = 650
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
  object LabelFamio: TLabel
    Left = 0
    Top = 31
    Width = 742
    Height = 16
    Align = alTop
    Alignment = taCenter
    Caption = 'LabelFamio'
    Color = 11009242
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 47
    Width = 742
    Height = 369
    Align = alClient
    Color = 11009242
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrTmpDrawColumnCell
    OnEnter = dnGridEnter
    OnExit = dnGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSch'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Nach'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Udrg'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Vupl'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Ost'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_VDlg'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Vzvr'
        Width = 75
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      742
      31)
    object LabelCntRec: TLabel
      Left = 94
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnFilter: TSpeedButton
      Left = 418
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1060#1080#1083#1100#1090#1088
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
      Spacing = 2
      Visible = False
      OnClick = sBtnFilterClick
    end
    object sBtnPrt: TSpeedButton
      Left = 576
      Top = 4
      Width = 75
      Height = 25
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
      Spacing = 2
      OnClick = sBtnPrtClick
    end
    object sBtnFilter2: TSpeedButton
      Left = 498
      Top = 4
      Width = 75
      Height = 25
      Hint = #1060#1080#1083#1100#1090#1088' '#1085#1072' '#1090#1086#1083#1100#1082#1086' "'#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077'" '#1079#1072#1087#1080#1089#1080
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 2
      Caption = #1060#1080#1083#1100#1090#1088
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
      OnClick = sBtnFilter2Click
    end
    object bBtnCancel: TBitBtn
      Left = 664
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcTmp
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
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
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Sm_Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Ost'
        DataType = ftFloat
      end
      item
        Name = 'Sm_VDlg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vzvr'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnTabNPSchNR'
        Fields = 'TabN;PSch;NR'
      end
      item
        Name = 'OnPSch'
        Fields = 'PSch'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsTmpAfterScroll
    Left = 96
    Top = 88
    object cdsTmpNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsTmpTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
      OnGetText = cdsTmpTabNGetText
    end
    object cdsTmpPSch: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'PSch'
      Size = 10
    end
    object cdsTmpSm_Nach: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'Sm_Nach'
      DisplayFormat = '0.00'
    end
    object cdsTmpSm_Udrg: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1080#1103
      FieldName = 'Sm_Udrg'
      DisplayFormat = '0.00'
    end
    object cdsTmpSm_Vupl: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1072#1090#1099
      FieldName = 'Sm_Vupl'
      DisplayFormat = '0.00'
    end
    object cdsTmpSm_Ost: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1082#1080' ('#1057#1072#1083#1100#1076#1086')'
      FieldName = 'Sm_Ost'
      DisplayFormat = '0.00'
    end
    object cdsTmpSm_VDlg: TFloatField
      DisplayLabel = #1074' '#1044#1086#1083#1075#1058#1052
      FieldName = 'Sm_VDlg'
    end
    object cdsTmpSm_Vzvr: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088#1072#1090#1044#1086#1083#1075#1086#1074' '#1055#1052
      FieldName = 'Sm_Vzvr'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 112
    Top = 96
  end
  object qrySps: TQuery
    Left = 56
    Top = 88
  end
  object cdsSvd: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Sm_Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Ost'
        DataType = ftFloat
      end
      item
        Name = 'Sm_VDlg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vzvr'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnPSch'
        Fields = 'PSch'
      end>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 88
    object cdsSvdNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsSvdPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsSvdSm_Nach: TFloatField
      FieldName = 'Sm_Nach'
    end
    object cdsSvdSm_Udrg: TFloatField
      FieldName = 'Sm_Udrg'
    end
    object cdsSvdSm_Vupl: TFloatField
      FieldName = 'Sm_Vupl'
    end
    object cdsSvdSm_Ost: TFloatField
      FieldName = 'Sm_Ost'
    end
    object cdsSvdSm_VDlg: TFloatField
      FieldName = 'Sm_VDlg'
    end
    object cdsSvdSm_Vzvr: TFloatField
      FieldName = 'Sm_Vzvr'
    end
  end
  object qryNach: TQuery
    Left = 56
    Top = 144
  end
  object qryUdrg: TQuery
    Left = 96
    Top = 144
  end
  object qryVupl: TQuery
    Left = 136
    Top = 144
  end
  object qryVDlg: TQuery
    Left = 176
    Top = 144
  end
  object qryVzvr: TQuery
    Left = 216
    Top = 144
  end
  object qryFamIO: TQuery
    Left = 56
    Top = 200
  end
end
