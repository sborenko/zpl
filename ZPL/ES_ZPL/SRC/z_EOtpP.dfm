object FormStornPart: TFormStornPart
  Left = 555
  Top = 329
  BorderStyle = bsDialog
  Caption = 'FormStornPart'
  ClientHeight = 209
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    322
    209)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 243
    Height = 13
    Caption = #1057#1090#1086#1088#1085#1080#1088#1091#1077#1090#1089#1103' '#1086#1090#1087#1091#1089#1082' ('#1080#1083#1080' '#1077#1075#1086' '#1095#1072#1089#1090#1100') '#1079#1072' '
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 34
    Width = 75
    Height = 13
    Caption = #1044#1072#1090#1099':   '#1085#1072#1095#1072#1083#1072
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 202
    Top = 34
    Width = 32
    Height = 13
    Caption = #1086#1082#1086#1085#1095'.'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 59
    Width = 99
    Height = 13
    Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100' '#1089':'
    FocusControl = DBEdit4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 215
    Top = 59
    Width = 19
    Height = 13
    Caption = #1087#1086':'
    FocusControl = DBEdit5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 100
    Width = 199
    Height = 13
    Caption = #1055#1088#1080' '#1101#1090#1086#1084' '#1089#1090#1086#1088#1085#1080#1088#1091#1077#1090#1089#1103' '#1089#1091#1084#1084#1072' '#1086#1090#1087#1091#1089#1082#1072
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 8
    Top = 121
    Width = 218
    Height = 13
    Caption = #1048' '#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1074#1086#1079#1074#1088#1072#1097#1077#1085#1072' '#1089#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 8
    Top = 144
    Width = 310
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 160
    Width = 310
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 123
    Top = 77
    Width = 193
    Height = 13
    Caption = '( '#1086' '#1073' '#1077'   '#1076' '#1072' '#1090' '#1099'   '#1074' '#1082' '#1083' '#1102' '#1095' '#1080' '#1090' '#1077' '#1083' '#1100' '#1085' '#1086' )'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object bBtnOk: TBitBtn
    Left = 157
    Top = 182
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 7
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 245
    Top = 182
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 8
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 256
    Top = 8
    Width = 61
    Height = 19
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'ZaMG'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 31
    Width = 80
    Height = 19
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'SvDtBeg'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 237
    Top = 31
    Width = 80
    Height = 19
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'SvDtEnd'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 112
    Top = 55
    Width = 80
    Height = 21
    DataField = 'StornDtBeg'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 3
    OnEnter = DBEdit4Enter
    OnExit = DBEdit4Exit
  end
  object DBEdit5: TDBEdit
    Left = 237
    Top = 56
    Width = 80
    Height = 21
    DataField = 'StornDtEnd'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 4
    OnEnter = DBEdit4Enter
    OnExit = DBEdit4Exit
  end
  object DBEdit6: TDBEdit
    Left = 237
    Top = 97
    Width = 80
    Height = 19
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'SmStorn'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 237
    Top = 118
    Width = 80
    Height = 19
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'SmOkl'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object cdsTmp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ZaMG'
        DataType = ftDate
      end
      item
        Name = 'SvDtBeg'
        DataType = ftDate
      end
      item
        Name = 'SvDtEnd'
        DataType = ftDate
      end
      item
        Name = 'StornDtBeg'
        DataType = ftDate
      end
      item
        Name = 'StornDtEnd'
        DataType = ftDate
      end
      item
        Name = 'SmStorn'
        DataType = ftFloat
      end
      item
        Name = 'SmOkl'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 80
    Data = {
      C10000009619E0BD010000001800000008000000000003000000C100024E5204
      0001000200010007535542545950450200490008004175746F696E6300045A61
      4D47040006000000000007537644744265670400060000000000075376447445
      6E6404000600000000000A53746F726E447442656704000600000000000A5374
      6F726E4474456E64040006000000000007536D53746F726E0800040000000000
      05536D4F6B6C080004000000000001000C4155544F494E4356414C5545040001
      0001000000}
    object cdsTmpNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsTmpZaMG: TDateField
      FieldName = 'ZaMG'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsTmpSvDtBeg: TDateField
      FieldName = 'SvDtBeg'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpSvDtEnd: TDateField
      FieldName = 'SvDtEnd'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpStornDtBeg: TDateField
      FieldName = 'StornDtBeg'
      OnValidate = cdsTmpStornDtBegValidate
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpStornDtEnd: TDateField
      FieldName = 'StornDtEnd'
      OnValidate = cdsTmpStornDtEndValidate
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpSmStorn: TFloatField
      FieldName = 'SmStorn'
      DisplayFormat = '#.00'
    end
    object cdsTmpSmOkl: TFloatField
      FieldName = 'SmOkl'
      DisplayFormat = '#.00'
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsTmp
    Left = 32
    Top = 80
  end
end
