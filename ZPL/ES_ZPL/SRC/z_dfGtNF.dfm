object FormGetNrFam: TFormGetNrFam
  Left = 326
  Top = 439
  Width = 400
  Height = 250
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetNrFam'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 392
    Height = 186
    ActivePage = TabSheet1
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object dbgrID: TDBGrid
        Left = 0
        Top = 0
        Width = 384
        Height = 155
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcID
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
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
            FieldName = 'D_ZVILN'
            Width = 41
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
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object dbgrTts: TDBGrid
        Left = 0
        Top = 0
        Width = 384
        Height = 162
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcTts
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrTtsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TIN'
            Title.Caption = #1058#1048#1053
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Komn'
            Title.Caption = #1050#1086#1084#1085
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Title.Caption = #1058#1072#1073#1053#1088
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
            Width = 175
            Visible = True
          end>
      end
    end
  end
  object qryID: TQuery
    DatabaseName = 'D:\MY_JOBS\WRK_S\ZP_1DF\DBFS\D_00\K2004_4\'
    SQL.Strings = (
      'Select * from d_404_id where (Fam Like "%'#1050#1054#1051'%")')
    Left = 32
    Top = 80
  end
  object dsrcID: TDataSource
    DataSet = qryID
    Left = 48
    Top = 96
  end
  object qryTts: TQuery
    DatabaseName = 'D_Res'
    SQL.Strings = (
      '    Select NR, TIN, Komn, TabN, FamIO '
      '  from t_tx2004 '
      '   where (TabN <> -99) and (FamIO Like "%'#1055#1054#1053#1054#1052#1040#1056'%")'
      'order by TIN, Komn')
    Left = 108
    Top = 83
  end
  object dsrcTts: TDataSource
    DataSet = qryTts
    Left = 120
    Top = 96
  end
end
