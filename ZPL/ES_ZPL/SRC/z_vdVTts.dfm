object FormVedTts: TFormVedTts
  Left = 450
  Top = 326
  Width = 383
  Height = 275
  BorderIcons = [biSystemMenu]
  Caption = 'FormVedTts'
  Color = clBtnFace
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 275
  Constraints.MinWidth = 375
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 375
    Height = 241
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      DesignSize = (
        367
        210)
      object dbgrVidTts: TDBGrid
        Left = 0
        Top = 0
        Width = 367
        Height = 187
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clInfoBk
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object BitBtn1: TBitBtn
        Left = 291
        Top = 191
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
        Kind = bkClose
        Spacing = 0
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      DesignSize = (
        367
        210)
      object dbgrSpzTts: TDBGrid
        Left = 0
        Top = 0
        Width = 367
        Height = 188
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clCream
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object BitBtn2: TBitBtn
        Left = 291
        Top = 191
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
        Kind = bkClose
        Spacing = 0
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      DesignSize = (
        367
        210)
      object BitBtn3: TBitBtn
        Left = 291
        Top = 191
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        Kind = bkClose
        Spacing = 0
      end
      object dbgrObjTts: TDBGrid
        Left = 0
        Top = 0
        Width = 367
        Height = 187
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clCream
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object ts4: TTabSheet
      Caption = 'ts4'
      ImageIndex = 3
      DesignSize = (
        367
        210)
      object BitBtn4: TBitBtn
        Left = 291
        Top = 191
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        Kind = bkClose
        Spacing = 0
      end
      object dbgrKatTts: TDBGrid
        Left = 0
        Top = 0
        Width = 367
        Height = 187
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clInfoBk
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object dsrcTts: TDataSource
    Left = 72
    Top = 88
  end
end
