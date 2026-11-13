object FormSvodByVidN: TFormSvodByVidN
  Left = 368
  Top = 114
  Width = 550
  Height = 627
  BorderIcons = [biSystemMenu]
  Caption = 'FormSvodByVidN'
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
    Width = 542
    Height = 564
    Align = alClient
    DataSource = dsrcSvd
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMVIDN'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZNAK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      542
      29)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 3
      Width = 65
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      Spacing = 2
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 464
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qrySvd: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select KdObj, VidN, ShVidN, NmVidN, Znak, Sum(Summa) as Summa '
      ' from GetNuWithZnak ('#39'03/01/2006'#39')'
      ' where VidN < "8600" '
      ' group by KdObj, VidN, ShVidN, NmVidN, Znak'
      'UNION'
      
        'Select Cast('#39'27777'#39' as SmallInt) as KdObj, VidN, ShVidN, NmVidN,' +
        ' Znak, Sum(Summa) as Summa '
      ' from GetNuWithZnak ('#39'03/01/2006'#39')'
      ' where VidN < "8600" '
      ' group by VidN, ShVidN, NmVidN, Znak')
    Left = 48
    Top = 120
    object qrySvdKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qrySvdVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qrySvdSHVIDN: TStringField
      FieldName = 'SHVIDN'
      FixedChar = True
      Size = 15
    end
    object qrySvdNMVIDN: TStringField
      FieldName = 'NMVIDN'
      FixedChar = True
      Size = 64
    end
    object qrySvdZNAK: TSmallintField
      FieldName = 'ZNAK'
    end
    object qrySvdSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
  end
  object dsrcSvd: TDataSource
    DataSet = qrySvd
    Left = 64
    Top = 136
  end
end
