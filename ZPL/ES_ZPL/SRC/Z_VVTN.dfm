object FormVvTabN: TFormVvTabN
  Left = 413
  Top = 356
  BorderStyle = bsDialog
  Caption = 'FormVvTabN'
  ClientHeight = 84
  ClientWidth = 190
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 117
    Height = 24
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
    FocusControl = dbeTabN
    WordWrap = True
  end
  object LabelFamIO: TLabel
    Left = 10
    Top = 36
    Width = 57
    Height = 13
    Caption = 'LabelFamIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dbeTabN: TDBEdit
    Left = 136
    Top = 12
    Width = 49
    Height = 21
    DataField = 'TabN'
    DataSource = dsrcTmp
    TabOrder = 0
    OnEnter = dbeTabNEnter
    OnExit = dbeTabNExit
  end
  object bBtnOk: TBitBtn
    Left = 30
    Top = 55
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 110
    Top = 55
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object tblTmp: TTable
    DatabaseName = 'Es_Ind'
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 't_VvTn'
    Left = 24
    object tblTmpTabN: TIntegerField
      FieldName = 'TabN'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = tblTmp
    Left = 40
    Top = 16
  end
end
