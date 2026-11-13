object FormCo2010: TFormCo2010
  Left = 310
  Top = 314
  Width = 694
  Height = 458
  ActiveControl = dbgrDK
  BorderIcons = [biSystemMenu]
  Caption = 'FormCo2010'
  Color = clBtnFace
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
  object Splitter1: TSplitter
    Left = 0
    Top = 237
    Width = 686
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clFuchsia
    MinSize = 100
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 387
    Width = 686
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      686
      37)
    object labelCountRec: TLabel
      Left = 16
      Top = 12
      Width = 70
      Height = 13
      Caption = 'labelCountRec'
    end
    object LabelBatchRec: TLabel
      Left = 352
      Top = 12
      Width = 74
      Height = 13
      Caption = 'LabelBatchRec'
    end
    object bBtnCancel: TBitBtn
      Left = 604
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 1
    end
  end
  object dbgrDK: TDBGrid
    Left = 0
    Top = 41
    Width = 686
    Height = 196
    Hint = #1058#1072#1073#1083#1080#1094#1072' '#1074' '#1059#1055#1054
    Align = alTop
    Color = clSkyBlue
    Ctl3D = True
    DataSource = dsrcDK
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrEnter
    OnExit = dbgrExit
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kdok'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nameok'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C_ZKPP'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAMED'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAMEFULL'
        Width = 212
        Visible = True
      end>
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object sBtnQryDk: TSpeedButton
      Left = 16
      Top = 8
      Width = 75
      Height = 22
      Caption = 'OpenQryDK'
      OnClick = sBtnQryDkClick
    end
    object sBtnBatchMov: TSpeedButton
      Left = 97
      Top = 8
      Width = 75
      Height = 22
      Caption = 'BatchMov'
      OnClick = sBtnBatchMovClick
    end
    object sBtnOpenTblDolgn: TSpeedButton
      Left = 179
      Top = 8
      Width = 75
      Height = 22
      Caption = 'OpenTblDolgn'
      OnClick = sBtnOpenTblDolgnClick
    end
    object SpeedButton4: TSpeedButton
      Left = 264
      Top = 8
      Width = 75
      Height = 22
    end
  end
  object dbgrDolgn: TDBGrid
    Left = 0
    Top = 240
    Width = 686
    Height = 147
    Hint = #1050#1086#1087#1080#1103' '#1074' '#1085#1072#1096#1077#1081' '#1041#1044
    Align = alClient
    Color = 11523823
    DataSource = dsrcDolgn
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrEnter
    OnExit = dbgrExit
  end
  object qryDK: TQuery
    DatabaseName = 'EsDbOK'
    SQL.Strings = (
      'select * from o_dolgnost')
    Left = 504
    Top = 72
    object qryDKCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object qryDKC_ZKPP: TStringField
      FieldName = 'C_ZKPP'
      Size = 10
    end
    object qryDKNAMED: TStringField
      FieldName = 'NAMED'
      Size = 254
      Transliterate = False
    end
    object qryDKNAMEFULL: TStringField
      FieldName = 'NAMEFULL'
      Size = 254
      Transliterate = False
    end
    object qryDKid: TIntegerField
      FieldName = 'id'
      Origin = 'ESDBOK.o_dolgnost.id'
    end
    object qryDKkdok: TIntegerField
      FieldName = 'kdok'
      Origin = 'ESDBOK.o_dolgnost.kdok'
    end
    object qryDKnameok: TStringField
      FieldName = 'nameok'
      Origin = 'ESDBOK.o_dolgnost.nameok'
      Size = 255
      Transliterate = False
    end
  end
  object dsrcDK: TDataSource
    DataSet = qryDK
    Left = 520
    Top = 88
  end
  object popSort: TPopupMenu
    Left = 272
    Top = 96
    object N1: TMenuItem
      Caption = '-  '#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' - '
      Enabled = False
    end
    object popOrderByCode: TMenuItem
      Caption = '-  '#1087#1086' '#1082#1086#1076#1091' '#1044#1050
      Checked = True
    end
    object popOrderByNameOK: TMenuItem
      Caption = '-  '#1087#1086' '#1076#1086#1083#1078#1085#1086#1089#1090#1080' '#1054#1050
    end
  end
  object BatchMove1: TBatchMove
    Left = 280
    Top = 272
  end
  object tblDolgn: TTable
    DatabaseName = 'DbMain'
    IndexName = 'O_DOLGN'
    TableName = 'O_Dolgnost'
    Left = 424
    Top = 304
    object tblDolgnID: TIntegerField
      FieldName = 'ID'
    end
    object tblDolgnKDOK: TIntegerField
      FieldName = 'KDOK'
    end
    object tblDolgnNAMEOK: TStringField
      FieldName = 'NAMEOK'
      Size = 255
      Transliterate = False
    end
    object tblDolgnCODE: TStringField
      FieldName = 'CODE'
      Size = 10
      Transliterate = False
    end
    object tblDolgnC_ZKPP: TStringField
      FieldName = 'C_ZKPP'
      Size = 255
      Transliterate = False
    end
    object tblDolgnNAMED: TStringField
      FieldName = 'NAMED'
      Size = 255
      Transliterate = False
    end
    object tblDolgnNAMEFULL: TStringField
      FieldName = 'NAMEFULL'
      Size = 255
      Transliterate = False
    end
  end
  object dsrcDolgn: TDataSource
    Left = 440
    Top = 320
  end
end
