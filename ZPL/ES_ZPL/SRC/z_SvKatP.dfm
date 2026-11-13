object FormSvodByKatP: TFormSvodByKatP
  Left = 374
  Top = 173
  Width = 550
  Height = 627
  BorderIcons = [biSystemMenu]
  Caption = 'FormSvodByKatP'
  Color = clBtnFace
  Constraints.MaxWidth = 550
  Constraints.MinHeight = 350
  Constraints.MinWidth = 390
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
  object dbgrSvd: TDBGrid
    Left = 0
    Top = 29
    Width = 534
    Height = 559
    Align = alClient
    DataSource = dsrcSvd
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrSvdDrawColumnCell
    OnDblClick = dbgrSvdDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKATP'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMVIDN'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZNAK'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      534
      29)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 2
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
    object bBtnCancel: TBitBtn
      Left = 456
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qrySvd: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select n.PSch, k.ShKatP, n.KdKatP, n.VidN, n.ShVidN, n.NmVidN, n' +
        '.Znak,'
      ' Sum(n.Summa) as Summa '
      ' from GetNuwithznak ('#39'03/01/2006'#39') n'
      ' Left outer join z_KatPers k on k.KdKatP = n.KdKatP'
      ' where n.vidN < "5000" '
      
        ' group by n.PSCH, n.KdKatP, k.ShKatP, n.VidN, n.ShVidN, n.NmVidN' +
        ', n.Znak')
    Left = 48
    Top = 120
    object qrySvdPSCH: TStringField
      DisplayLabel = #1057#1080#1085#1090#1057#1095#1077#1090
      DisplayWidth = 8
      FieldName = 'PSCH'
      FixedChar = True
      Size = 10
    end
    object qrySvdSHKATP: TStringField
      DisplayLabel = #1064#1092#1088#1050#1072#1090#1055#1077#1088#1089
      DisplayWidth = 10
      FieldName = 'SHKATP'
      Size = 10
    end
    object qrySvdKDKATP: TSmallintField
      DisplayLabel = #1050#1086#1076#1050#1072#1090#1055#1077#1088#1089
      DisplayWidth = 4
      FieldName = 'KDKATP'
    end
    object qrySvdVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      DisplayWidth = 7
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qrySvdSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      DisplayWidth = 17
      FieldName = 'SHVIDN'
      FixedChar = True
      Size = 15
    end
    object qrySvdNMVIDN: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074#1080#1076#1072
      FieldName = 'NMVIDN'
      FixedChar = True
      Size = 64
    end
    object qrySvdSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object qrySvdZNAK: TSmallintField
      DisplayLabel = #1047#1085#1072#1082
      DisplayWidth = 5
      FieldName = 'ZNAK'
    end
  end
  object dsrcSvd: TDataSource
    DataSet = qrySvd
    Left = 64
    Top = 136
  end
end
