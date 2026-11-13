object FrmCatVidNDeptId: TFrmCatVidNDeptId
  Left = 313
  Top = 197
  Width = 610
  Height = 391
  Caption = 'FrmCatVidNDeptId'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 240
    Width = 602
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    Color = clActiveCaption
    ParentColor = False
  end
  object DbgrReport: TDBGrid
    Left = 0
    Top = 30
    Width = 602
    Height = 210
    Align = alClient
    DataSource = DmCatVidNDeptId.DsrcReport
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object LblYear: TLabel
      Left = 392
      Top = 3
      Width = 112
      Height = 24
      Alignment = taRightJustify
      Caption = 'Report Year'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnPrint: TBitBtn
      Left = 520
      Top = 3
      Width = 75
      Height = 25
      Caption = '&'#1055#1077#1095#1072#1090#1072#1090#1100
      TabOrder = 0
      OnClick = BtnPrintClick
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
    end
  end
  object DbgrMisVidN: TDBGrid
    Left = 0
    Top = 244
    Width = 602
    Height = 120
    Align = alBottom
    DataSource = DmCatVidNDeptId.DsrcMisVidN
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
