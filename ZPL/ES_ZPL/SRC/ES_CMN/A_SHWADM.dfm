object FormAdm: TFormAdm
  Left = 296
  Top = 228
  Width = 260
  Height = 207
  ActiveControl = dbgrPsw
  BorderIcons = [biSystemMenu]
  Caption = 'FormAdm'
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 300
  Constraints.MinHeight = 180
  Constraints.MinWidth = 260
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    252
    180)
  PixelsPerInch = 96
  TextHeight = 13
  object sBtnEdt: TSpeedButton
    Left = 4
    Top = 152
    Width = 92
    Height = 25
    Hint = #1042#1082#1083' / '#1042#1099#1082#1083' '#1088#1077#1078#1080#1084' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1090#1072#1073#1083#1080#1094#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
    AllowAllUp = True
    Anchors = [akLeft, akBottom]
    GroupIndex = 2
    Caption = #1055#1088#1072#1074#1082#1072' (F9)'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
    Spacing = 2
    OnClick = sBtnEdtClick
  end
  object bBtnClose: TBitBtn
    Left = 173
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    Kind = bkCancel
    Spacing = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 252
    Height = 152
    ActivePage = ts1
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = tsButtons
    TabOrder = 1
    OnChange = PageControl1Change
    object ts1: TTabSheet
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      object dbgrPsw: TDBGrid
        Left = 0
        Top = 0
        Width = 244
        Height = 121
        Align = alClient
        DataSource = dsrcPsw
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = dbgrPswKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'USRNAME'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USRPSW'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USRLVL'
            Width = 52
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #1055#1072#1084#1103#1090#1082#1072
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 244
        Height = 121
        Align = alClient
        Color = clBtnFace
        Lines.Strings = (
          '                       '#1059#1088#1086#1074#1085#1080' '#1076#1086#1089#1090#1091#1087#1072':'
          '  1 - '#1042#1089#1077' '#1087#1088#1072#1074#1072', '#1082#1088#1086#1084#1077' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103
          '  2 - '#1080' '#1090'.'#1076'.'
          '  3 -'
          '  4 -'
          '  '#1055#1086#1079#1099#1074#1085#1086#1081' - '#1085#1077' '#1073#1086#1083#1077#1077' 15 '#1089#1080#1084#1074#1086#1083#1086#1074'.'
          '  '#1055#1072#1088#1086#1083#1100' - '#1085#1077' '#1073#1086#1083#1077#1077' 10 '#1089#1080#1084#1074#1086#1083#1086#1074'.')
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object tblPsw: TTable
    BeforeOpen = tblPswBeforeOpen
    BeforeClose = tblPswBeforeClose
    DatabaseName = 'VSK_DT'
    TableName = 'vsk_usr.DB'
    Left = 128
    Top = 72
    object tblPswNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblPswUSRNAME: TStringField
      DisplayLabel = #1055#1086#1079#1099#1074#1085#1086#1081
      FieldName = 'USRNAME'
      Size = 15
    end
    object tblPswUSRPSW: TStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'USRPSW'
      Size = 10
    end
    object tblPswUSRLVL: TSmallintField
      DisplayLabel = #1059#1088#1086#1074#1077#1085#1100
      FieldName = 'USRLVL'
    end
  end
  object dsrcPsw: TDataSource
    DataSet = tblPsw
    Left = 144
    Top = 80
  end
end
