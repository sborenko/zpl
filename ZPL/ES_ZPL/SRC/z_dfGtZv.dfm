object FormGetNrZviln: TFormGetNrZviln
  Left = 354
  Top = 543
  Width = 400
  Height = 250
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetNrZviln'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 400
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
    Top = 186
    Width = 392
    Height = 30
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      392
      30)
    object LabelCntRec: TLabel
      Left = 16
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object BitBtn1: TBitBtn
      Left = 235
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 315
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgrID: TDBGrid
    Left = 0
    Top = 0
    Width = 392
    Height = 186
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcID
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrIDDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_ZVILN'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fam'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ima'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Otch'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sovm'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_NAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_DOX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_DOX'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_PRIYN'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_PILG'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZNAKA'
        Width = 28
        Visible = True
      end>
  end
  object qryID: TQuery
    DatabaseName = 'D:\MY_JOBS\WRK_S\ZP_1DF\DBFS\D_00\K2004_4\'
    SQL.Strings = (
      'Select * from d_404_id where (not D_ZVILN is null)')
    Left = 80
    Top = 96
  end
  object dsrcID: TDataSource
    DataSet = qryID
    Left = 96
    Top = 112
  end
end
