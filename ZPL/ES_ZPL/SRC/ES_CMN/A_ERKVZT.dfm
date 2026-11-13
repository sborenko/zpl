object FormEARkvzt: TFormEARkvzt
  Left = 336
  Top = 200
  ActiveControl = dbeDtBeg
  BorderStyle = bsDialog
  Caption = 'FormEARkvzt'
  ClientHeight = 201
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    474
    201)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 474
    Height = 171
    Align = alTop
  end
  object Label2: TLabel
    Left = 14
    Top = 11
    Width = 132
    Height = 13
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 14
    Top = 35
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 14
    Top = 57
    Width = 83
    Height = 13
    Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 93
    Top = 79
    Width = 61
    Height = 13
    Caption = '- '#1076#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object Label6: TLabel
    Left = 19
    Top = 145
    Width = 80
    Height = 13
    Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
  end
  object Label7: TLabel
    Left = 287
    Top = 14
    Width = 83
    Height = 13
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
    FocusControl = dbeDtBeg
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 14
    Top = 79
    Width = 71
    Height = 13
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    FocusControl = dbeDolgnPred
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 14
    Top = 123
    Width = 51
    Height = 13
    Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
    FocusControl = dbeDolgnBuh
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 19
    Top = 101
    Width = 80
    Height = 13
    Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
  end
  object Label11: TLabel
    Left = 93
    Top = 123
    Width = 61
    Height = 13
    Caption = '- '#1076#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object bBtnOk: TBitBtn
    Left = 319
    Top = 175
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 7
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 399
    Top = 175
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 8
    Kind = bkCancel
  end
  object dbeDtBeg: TDBEdit
    Left = 379
    Top = 10
    Width = 86
    Height = 21
    DataField = 'DTBEG'
    DataSource = dsrcRkvzt
    TabOrder = 0
  end
  object dbeNmKoop: TDBEdit
    Left = 104
    Top = 32
    Width = 361
    Height = 21
    DataField = 'NMKOOP'
    DataSource = dsrcRkvzt
    TabOrder = 1
  end
  object dbeAdres: TDBEdit
    Left = 104
    Top = 54
    Width = 361
    Height = 21
    DataField = 'ADRES'
    DataSource = dsrcRkvzt
    TabOrder = 2
  end
  object dbeNmPred: TDBEdit
    Left = 104
    Top = 98
    Width = 361
    Height = 21
    DataField = 'NMPRED'
    DataSource = dsrcRkvzt
    TabOrder = 4
  end
  object dbeNmBuh: TDBEdit
    Left = 104
    Top = 142
    Width = 361
    Height = 21
    DataField = 'NMBUH'
    DataSource = dsrcRkvzt
    TabOrder = 6
  end
  object dbeDolgnPred: TDBEdit
    Left = 168
    Top = 76
    Width = 297
    Height = 21
    DataField = 'DOLGNPRED'
    DataSource = dsrcRkvzt
    TabOrder = 3
  end
  object dbeDolgnBuh: TDBEdit
    Left = 168
    Top = 120
    Width = 297
    Height = 21
    DataField = 'DOLGNBUH'
    DataSource = dsrcRkvzt
    TabOrder = 5
  end
  object tblRkvzt: TTable
    DatabaseName = 'ES_IND'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KDWHO'
        DataType = ftSmallint
      end
      item
        Name = 'DTBEG'
        DataType = ftDate
      end
      item
        Name = 'NMKOOP'
        DataType = ftString
        Size = 155
      end
      item
        Name = 'ADRES'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NMPRED'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'NMBUH'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'DOLGNPRED'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'DOLGNBUH'
        DataType = ftString
        Size = 65
      end>
    StoreDefs = True
    TableName = 't_Rkvz.db'
    Left = 288
    Top = 72
    object tblRkvztNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblRkvztKDWHO: TSmallintField
      FieldName = 'KDWHO'
    end
    object tblRkvztDTBEG: TDateField
      FieldName = 'DTBEG'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblRkvztNMKOOP: TStringField
      FieldName = 'NMKOOP'
      Size = 155
    end
    object tblRkvztADRES: TStringField
      FieldName = 'ADRES'
      Size = 255
    end
    object tblRkvztNMPRED: TStringField
      FieldName = 'NMPRED'
      Size = 55
    end
    object tblRkvztNMBUH: TStringField
      FieldName = 'NMBUH'
      Size = 55
    end
    object tblRkvztDOLGNPRED: TStringField
      FieldName = 'DOLGNPRED'
      Size = 65
    end
    object tblRkvztDOLGNBUH: TStringField
      FieldName = 'DOLGNBUH'
      Size = 65
    end
  end
  object dsrcRkvzt: TDataSource
    DataSet = tblRkvzt
    Left = 304
    Top = 88
  end
  object qryTmp: TQuery
    Left = 360
    Top = 72
  end
end
