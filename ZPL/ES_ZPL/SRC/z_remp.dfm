object FormRemPere: TFormRemPere
  Left = 316
  Top = 273
  Width = 428
  Height = 518
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormRemPere'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      420
      31)
    object sBtnGo1: TSpeedButton
      Left = 4
      Top = 2
      Width = 36
      Height = 27
      Caption = 'Go_1'
      Spacing = 0
      OnClick = sBtnGo1Click
    end
    object LabelCntRec: TLabel
      Left = 88
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnGo2: TSpeedButton
      Left = 44
      Top = 2
      Width = 36
      Height = 27
      Caption = 'Go_2'
      Enabled = False
      Spacing = 0
      OnClick = sBtnGo2Click
    end
    object bBtnClose: TBitBtn
      Left = 344
      Top = 2
      Width = 72
      Height = 27
      Anchors = [akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 250
      Top = 2
      Width = 80
      Height = 27
      DataSource = dsrcRem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object dbgrRem: TDBGrid
    Left = 0
    Top = 31
    Width = 420
    Height = 460
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcRem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clWindow
        Expanded = False
        FieldName = 'TABN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 30
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NRPKT'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G0'
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'OKO_0'
        Width = 43
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NKO_0'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G1'
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'OKO'
        Width = 30
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NKO'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G2'
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'OKO2'
        Width = 36
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NKO2'
        Width = 39
        Visible = True
      end>
  end
  object tblRem: TTable
    DatabaseName = 'C_T_E_M_P'
    TableName = 'Pere2019.db'
    Left = 80
    Top = 120
    object tblRemTABN: TIntegerField
      FieldName = 'TABN'
    end
    object tblRemKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object tblRemNRPKT: TIntegerField
      FieldName = 'NRPKT'
    end
    object tblRemG0: TStringField
      FieldName = 'G0'
      Size = 2
    end
    object tblRemOKO_0: TSmallintField
      FieldName = 'OKO_0'
    end
    object tblRemNKO_0: TSmallintField
      FieldName = 'NKO_0'
    end
    object tblRemG1: TStringField
      FieldName = 'G1'
      Size = 2
    end
    object tblRemOKO: TSmallintField
      FieldName = 'OKO'
    end
    object tblRemNKO: TSmallintField
      FieldName = 'NKO'
    end
    object tblRemG2: TStringField
      FieldName = 'G2'
      Size = 2
    end
    object tblRemOKO2: TSmallintField
      FieldName = 'OKO2'
    end
    object tblRemNKO2: TSmallintField
      FieldName = 'NKO2'
    end
  end
  object dsrcRem: TDataSource
    DataSet = tblRem
    Left = 104
    Top = 120
  end
  object qryUpd: TQuery
    Left = 240
    Top = 168
  end
end
