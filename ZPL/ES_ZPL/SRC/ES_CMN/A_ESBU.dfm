object FormNewItem: TFormNewItem
  Left = 661
  Top = 235
  Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080#1074' '#1040#1088#1093#1080#1074' ( '#1085#1077' '#1073#1091#1076#1077#1090' '#1074#1080#1076#1077#1085' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074')'
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072
  ClientHeight = 138
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ScreenSnap = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    404
    138)
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TPanel
    Left = 0
    Top = 109
    Width = 404
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      404
      29)
    object BtnOk: TBitBtn
      Left = 234
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkOK
    end
    object BtnCancel: TBitBtn
      Left = 320
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object GrBoxAccnt: TGroupBox
    Left = 8
    Top = 3
    Width = 388
    Height = 102
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1057#1095#1105#1090' '
    TabOrder = 0
    DesignSize = (
      388
      102)
    object LblAccntNum: TLabel
      Left = 8
      Top = 25
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object Label3: TLabel
      Left = 8
      Top = 53
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object DbeAccntNum: TDBEdit
      Left = 92
      Top = 22
      Width = 114
      Height = 21
      DataField = 'SCH_17'
      DataSource = DsrcTmp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = dbeEnter
      OnExit = DbeAccntNumExit
      OnKeyDown = dbeEditKeyDown
    end
    object DbeAccntName: TDBEdit
      Left = 92
      Top = 51
      Width = 288
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NMSCH'
      DataSource = DsrcTmp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeEditKeyDown
    end
    object DbChBoxArch: TDBCheckBox
      Left = 8
      Top = 80
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = #1040#1088#1093#1080#1074#1085#1099#1081
      DataField = 'Arc'
      DataSource = DsrcTmp
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object CdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Sch_17'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmSch'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'Nr_GOrd'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Arc'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 8
    object CdsTmpNR: TAutoIncField
      FieldName = 'NR'
    end
    object CdsTmpSchBU: TStringField
      FieldName = 'SchBU'
      Size = 15
    end
    object CdsTmpSch_17: TStringField
      FieldName = 'Sch_17'
      Size = 15
    end
    object CdsTmpNmSch: TStringField
      DisplayWidth = 65
      FieldName = 'NmSch'
      Size = 128
    end
    object CdsTmpNr_GOrd: TStringField
      FieldName = 'Nr_GOrd'
      Size = 10
    end
    object CdsTmpArc: TStringField
      FieldName = 'Arc'
      Size = 1
    end
  end
  object DsrcTmp: TDataSource
    DataSet = CdsTmp
    Left = 280
    Top = 16
  end
  object QryTmp: TQuery
    Left = 224
    Top = 8
  end
end
