object FormSpZDet: TFormSpZDet
  Left = 421
  Top = 217
  Width = 508
  Height = 300
  BorderIcons = [biSystemMenu]
  Caption = 'FormSpZDet'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 500
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
    Width = 500
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    Constraints.MinWidth = 500
    TabOrder = 0
    DesignSize = (
      500
      31)
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 3
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
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 423
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
  object dbgrDet: TDBGrid
    Left = 0
    Top = 31
    Width = 500
    Height = 235
    Align = alClient
    Color = clCream
    DataSource = dsrcDet
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrDetDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Title.Caption = #1058#1072#1073#1053#1088
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Title.Caption = #1042#1080#1076#1053
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDVIDN'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Title.Caption = #1064#1092#1088#1042#1080#1076#1072
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ_2'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRR'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRPV'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KTO'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRKR'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MYNOTES'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPECPS'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDOBJ'
        Width = 24
        Visible = True
      end>
  end
  object dsrcDet: TDataSource
    Left = 32
    Top = 80
  end
end
