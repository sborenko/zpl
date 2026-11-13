object FormGetCmpUsr: TFormGetCmpUsr
  Left = 390
  Top = 363
  Width = 348
  Height = 411
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetCmpUsr'
  Color = clBtnFace
  Constraints.MaxHeight = 550
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 285
  Constraints.MinWidth = 330
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    340
    384)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrUsr: TDBGrid
    Left = 0
    Top = 0
    Width = 340
    Height = 356
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clCream
    DataSource = dsrcUsr
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrUsrDrawColumnCell
    OnDblClick = dbgrUsrDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KDUSR'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMUSR'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMCMP'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LVL'
        Width = 31
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 185
    Top = 359
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 265
    Top = 359
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object qryUsr: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select u.NmUsr, u.Notes, u.KdSps, u.Vkl, c.* '
      'from zz_usrCmp c Left Outer join usrs u on u.KdUsr = c.KdUsr'
      'where c.nmCmp = '#39'zpl'#39)
    Left = 56
    Top = 64
    object qryUsrKDUSR: TSmallintField
      DisplayLabel = #1050#1076#1070#1079#1088
      FieldName = 'KDUSR'
    end
    object qryUsrNMUSR: TStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'NMUSR'
      Size = 25
    end
    object qryUsrNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Size = 65
    end
    object qryUsrKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryUsrNR: TIntegerField
      FieldName = 'NR'
    end
    object qryUsrNMCMP: TStringField
      DisplayLabel = #1055#1088#1075#1050#1084#1087
      FieldName = 'NMCMP'
      FixedChar = True
      Size = 10
    end
    object qryUsrLVL: TSmallintField
      DisplayLabel = #1059#1088#1086#1074'.'
      FieldName = 'LVL'
    end
    object qryUsrVKL: TStringField
      FieldName = 'VKL'
      FixedChar = True
      Size = 1
    end
    object qryUsrNOTES_1: TStringField
      FieldName = 'NOTES_1'
      FixedChar = True
    end
  end
  object dsrcUsr: TDataSource
    DataSet = qryUsr
    Left = 72
    Top = 80
  end
end
