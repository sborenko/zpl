object FormGetKss: TFormGetKss
  Left = 350
  Top = 268
  Width = 400
  Height = 265
  ActiveControl = dbgrPdr
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetKss'
  Color = clBtnFace
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 245
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    392
    238)
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 3
    Top = 147
    Width = 63
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
  end
  object DBText6: TDBText
    Left = 74
    Top = 147
    Width = 316
    Height = 43
    Anchors = [akLeft, akBottom]
    Color = clWhite
    DataField = 'NOTES'
    DataSource = dsrcPdr
    ParentColor = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 72
    Top = 195
    Width = 73
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1057#1095#1077#1090' '#1041#1091#1093#1059#1095#1077#1090#1072
  end
  object DBText7: TDBText
    Left = 154
    Top = 194
    Width = 62
    Height = 15
    Hint = 
      #1057#1095#1077#1090' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1086#1090#1085#1086#1089#1103#1090#1089#1103' '#1087#1083#1072#1090#1077#1078#1080' '#1076#1072#1085#1085#1086#1075#1086' ' +
      #1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    Color = clWhite
    DataField = 'SCHBU'
    DataSource = dsrcPdr
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label8: TLabel
    Left = 283
    Top = 195
    Width = 38
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1042#1072#1083#1102#1090#1072
  end
  object DBText8: TDBText
    Left = 327
    Top = 194
    Width = 63
    Height = 15
    Hint = #1042#1072#1083#1102#1090#1072', '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1088#1072#1073#1086#1090#1072#1077#1090' '#1076#1072#1085#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    Color = clWhite
    DataField = 'NMVALSOKR'
    DataSource = dsrcPdr
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbgrPdr: TDBGrid
    Left = 1
    Top = 0
    Width = 390
    Height = 144
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = True
    DataSource = dsrcPdr
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    PopupMenu = popMnu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrPdrDblClick
    OnKeyDown = dbgrPdrKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NMWHO'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        Width = 292
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 205
    Top = 212
    Width = 71
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 321
    Top = 212
    Width = 71
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object qryPdr: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from WhoForKssPdr'
      '    order by PrWho, Shfr, NmWho')
    Left = 32
    Top = 64
    object qryPdrKDWHO: TSmallintField
      FieldName = 'KDWHO'
    end
    object qryPdrNMWHO: TStringField
      FieldName = 'NMWHO'
      Size = 65
    end
    object qryPdrPRWHO: TSmallintField
      FieldName = 'PRWHO'
    end
    object qryPdrKDSBU: TSmallintField
      FieldName = 'KDSBU'
    end
    object qryPdrKDVALPDR: TSmallintField
      FieldName = 'KDVALPDR'
    end
    object qryPdrNOTES: TStringField
      FieldName = 'NOTES'
      Size = 254
    end
    object qryPdrKDRSCH: TSmallintField
      FieldName = 'KDRSCH'
    end
    object qryPdrNMSCH: TStringField
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryPdrNMBANK: TStringField
      FieldName = 'NMBANK'
      Size = 65
    end
    object qryPdrRSCH: TStringField
      FieldName = 'RSCH'
      Size = 15
    end
    object qryPdrMFO: TStringField
      FieldName = 'MFO'
      Size = 15
    end
    object qryPdrOKPO: TStringField
      FieldName = 'OKPO'
      Size = 8
    end
    object qryPdrNMVALSOKR: TStringField
      FieldName = 'NMVALSOKR'
      Size = 6
    end
    object qryPdrSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryPdrSHFR: TStringField
      DisplayLabel = #1041'/'#1050
      FieldName = 'SHFR'
      Size = 5
    end
  end
  object dsrcPdr: TDataSource
    DataSet = qryPdr
    Left = 48
    Top = 72
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 192
    Top = 64
    object popMnuEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnClick = popMnuEdtClick
    end
    object popMnuAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      OnClick = popMnuAddClick
    end
    object popMnuDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = popMnuDelClick
    end
  end
  object qryTmp: TQuery
    Left = 256
    Top = 64
  end
end