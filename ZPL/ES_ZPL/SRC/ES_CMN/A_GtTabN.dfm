object FormGetTabN: TFormGetTabN
  Left = 316
  Top = 150
  Width = 499
  Height = 263
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetTabN'
  Color = clBtnFace
  Constraints.MaxHeight = 585
  Constraints.MaxWidth = 575
  Constraints.MinHeight = 245
  Constraints.MinWidth = 335
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    491
    236)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrUpi: TDBGrid
    Left = 3
    Top = 0
    Width = 485
    Height = 204
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcUpi
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrUpiDblClick
    OnKeyDown = dbgrUpiKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPRIEM'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTUVOLN'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Width = 70
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 329
    Top = 208
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    Kind = bkOK
    Spacing = 1
  end
  object bBtnCancel: TBitBtn
    Left = 413
    Top = 208
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
    Spacing = 1
  end
  object qryUpi: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Upi'
      'order by Fam, Ima, Otch')
    Left = 88
    Top = 80
    object qryUpiNR: TIntegerField
      DisplayWidth = 5
      FieldName = 'NR'
      Origin = 'DbMain.Z_UPI.NR'
    end
    object qryUpiTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 7
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UPI.TABN'
    end
    object qryUpiFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 11
      FieldName = 'FAM'
      Origin = 'DbMain.Z_UPI.FAM'
    end
    object qryUpiIMA: TStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 10
      FieldName = 'IMA'
      Origin = 'DbMain.Z_UPI.IMA'
      Size = 15
    end
    object qryUpiOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'OTCH'
      Origin = 'DbMain.Z_UPI.OTCH'
    end
    object qryUpiPOL: TStringField
      DisplayLabel = #1055#1086#1083
      DisplayWidth = 4
      FieldName = 'POL'
      Origin = 'DbMain.Z_UPI.POL'
      Size = 1
    end
    object qryUpiDTPRIEM: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1077#1084#1072
      DisplayWidth = 12
      FieldName = 'DTPRIEM'
      Origin = 'DbMain.Z_UPI.DTPRIEM'
    end
    object qryUpiDTUVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085
      DisplayWidth = 10
      FieldName = 'DTUVOLN'
      Origin = 'DbMain.Z_UPI.DTUVOLN'
    end
    object qryUpiPRUV: TSmallintField
      DisplayWidth = 6
      FieldName = 'PRUV'
      Origin = 'DbMain.Z_UPI.PRUV'
    end
    object qryUpiID: TStringField
      DisplayLabel = #1048#1053#1053
      DisplayWidth = 8
      FieldName = 'ID'
      Origin = 'DbMain.Z_UPI.ID'
      Size = 10
    end
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    Left = 104
    Top = 96
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 192
    Top = 80
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
  object qryTmp: TQuery
    Left = 160
    Top = 128
  end
end
