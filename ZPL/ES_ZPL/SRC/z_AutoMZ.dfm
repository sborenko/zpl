object FormAutoDmz: TFormAutoDmz
  Left = 712
  Top = 480
  ActiveControl = DBEdit1
  BorderStyle = bsDialog
  Caption = 'FormAutoDmz'
  ClientHeight = 156
  ClientWidth = 307
  Color = 16776996
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 181
    Top = 48
    Width = 65
    Height = 17
    DataField = 'DTBEGAUTO'
    DataSource = dsrcAmz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 115
    Width = 307
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 16776996
    TabOrder = 0
    DesignSize = (
      307
      41)
    object bBtnOk: TBitBtn
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 8
      Width = 79
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DBEdit1: TDBEdit
    Left = 181
    Top = 80
    Width = 96
    Height = 21
    DataField = 'DTBEGAUTO'
    DataSource = dsrcAmz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 24
    Width = 265
    Height = 21
    TabStop = False
    BevelInner = bvNone
    Color = 16776996
    DataField = 'NOTES'
    DataSource = dsrcAmz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object qryAmz: TQuery
    CachedUpdates = True
    AfterPost = qryAmzAfterPost
    DatabaseName = 'DbMain'
    RequestLive = True
    SQL.Strings = (
      'Select * from z_BgDtAu ')
    UpdateObject = updAmz
    Left = 8
    Top = 48
    object qryAmzMYDATE: TDateTimeField
      FieldName = 'MYDATE'
      Origin = 'DbMain.Z_BGDTAU.MYDATE'
    end
    object qryAmzDTBEGAUTO: TDateTimeField
      FieldName = 'DTBEGAUTO'
      Origin = 'DbMain.Z_BGDTAU.DTBEGAUTO'
      EditMask = '!99/99/9999;1;_'
    end
    object qryAmzNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_BGDTAU.NOTES'
      Size = 35
    end
  end
  object dsrcAmz: TDataSource
    DataSet = qryAmz
    Left = 32
    Top = 48
  end
  object updAmz: TUpdateSQL
    ModifySQL.Strings = (
      'update z_BgDtAu'
      'set'
      '  DTBEGAUTO = :DTBEGAUTO'
      'where'
      '  MYDATE = :OLD_MYDATE')
    InsertSQL.Strings = (
      'insert into z_BgDtAu'
      '  (DTBEGAUTO)'
      'values'
      '  (:DTBEGAUTO)')
    DeleteSQL.Strings = (
      'delete from z_BgDtAu'
      'where'
      '  MYDATE = :OLD_MYDATE')
    Left = 56
    Top = 48
  end
end
