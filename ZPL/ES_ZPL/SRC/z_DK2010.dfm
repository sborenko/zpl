object FormDk2010: TFormDk2010
  Left = 897
  Top = 487
  Width = 691
  Height = 398
  BorderIcons = [biSystemMenu]
  Caption = 'FormDk2010'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LebelOrder: TLabel
    Left = 0
    Top = 0
    Width = 683
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'LebelOrder'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object dbgrDK: TDBGrid
    Left = 0
    Top = 20
    Width = 683
    Height = 314
    Align = alClient
    Color = clMoneyGreen
    Ctl3D = True
    DataSource = dsrcDK
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = popSort
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrDKDblClick
    OnKeyDown = dbgrDKKeyDown
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
  object Panel1: TPanel
    Left = 0
    Top = 334
    Width = 683
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      683
      37)
    object labelCountRec: TLabel
      Left = 16
      Top = 12
      Width = 70
      Height = 13
      Caption = 'labelCountRec'
    end
    object LabelRecNo: TLabel
      Left = 144
      Top = 12
      Width = 60
      Height = 13
      Caption = 'LabelRecNo'
      Visible = False
    end
    object bBtnOk: TBitBtn
      Left = 515
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 595
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
  end
  object qryDK: TQuery
    AfterScroll = qryDKAfterScroll
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
      Caption = ' '#1055#1086' '#1082#1086#1076#1091' '#1044#1050
      Checked = True
      OnClick = popOrderByCodeClick
    end
    object popOrderByNameOK: TMenuItem
      Caption = ' '#1055#1086' '#1076#1086#1083#1078#1085#1086#1089#1090#1080' '#1054#1050
      OnClick = popOrderByNameOKClick
    end
    object popOrderByCodeOK: TMenuItem
      Caption = ' '#1055#1086' '#1082#1086#1076#1091' '#1054#1050
      OnClick = popOrderByCodeOKClick
    end
  end
end
