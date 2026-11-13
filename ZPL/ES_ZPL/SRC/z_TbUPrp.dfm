object FormTabsUdrgPrp: TFormTabsUdrgPrp
  Left = 349
  Top = 236
  Width = 558
  Height = 505
  Caption = 'FormTabsUdrgPrp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      550
      29)
    object LabelActivePage: TLabel
      Left = 8
      Top = 8
      Width = 81
      Height = 13
      Caption = 'LabelActivePage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 472
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 550
    Height = 449
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
    end
  end
end
