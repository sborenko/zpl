object FormMegVedZd: TFormMegVedZd
  Left = 568
  Top = 303
  BorderStyle = bsDialog
  Caption = 'FormMegVedZd'
  ClientHeight = 157
  ClientWidth = 285
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
  object Label1: TLabel
    Left = 5
    Top = 5
    Width = 277
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1088#1086#1094#1077#1085#1090#1099' '#1085#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1091#1084#1084#1099' '#1074#1099#1087#1083#1072#1090#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 24
    Width = 200
    Height = 13
    AutoSize = False
    Caption = '- '#1085#1072' '#1086#1089#1085#1086#1074#1085#1099#1077' '#1074#1099#1087#1083#1072#1090#1099': .........................'
  end
  object Label3: TLabel
    Left = 5
    Top = 45
    Width = 200
    Height = 13
    AutoSize = False
    Caption = '- '#1085#1072' '#1087#1088#1077#1084#1080#1080': .............................................'
  end
  object Label7: TLabel
    Left = 5
    Top = 66
    Width = 200
    Height = 13
    AutoSize = False
    Caption = '- '#1085#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072': ..........'
    FocusControl = dbePrcOtpTM
  end
  object Label4: TLabel
    Left = 5
    Top = 87
    Width = 200
    Height = 13
    AutoSize = False
    Caption = '- '#1085#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1077' '#1073#1091#1076#1091#1097#1080#1093' '#1084#1077#1089#1103#1094#1077#1074': ..........'
    FocusControl = dbeOtpBM
  end
  object Label5: TLabel
    Left = 5
    Top = 108
    Width = 200
    Height = 13
    AutoSize = False
    Caption = '- '#1085#1072' '#1082#1086#1084#1087#1077#1085#1089#1072#1094#1080#1080' '#1079#1072' '#1085#1077#1080#1089#1087'. '#1086#1090#1087#1091#1089#1082#1072': .....'
    FocusControl = dbePrcOtpNI
  end
  object dbePrcOsnV: TDBEdit
    Left = 226
    Top = 21
    Width = 55
    Height = 21
    DataField = 'PrcOsnV'
    DataSource = dsrcPrc
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcPrem: TDBEdit
    Left = 226
    Top = 42
    Width = 55
    Height = 21
    DataField = 'PrcPrem'
    DataSource = dsrcPrc
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcOtpTM: TDBEdit
    Left = 226
    Top = 63
    Width = 55
    Height = 21
    DataField = 'PrcOtpTM'
    DataSource = dsrcPrc
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeOtpBM: TDBEdit
    Left = 226
    Top = 84
    Width = 55
    Height = 21
    DataField = 'PrcOtpBM'
    DataSource = dsrcPrc
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcOtpNI: TDBEdit
    Left = 226
    Top = 105
    Width = 55
    Height = 21
    DataField = 'PrcOtpNI'
    DataSource = dsrcPrc
    TabOrder = 4
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 120
    Top = 128
    Width = 75
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    Default = True
    ModalResult = 1
    TabOrder = 5
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
      FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
      990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
      990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
      FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
      00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
      00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
      03FF33337FFF77777333333300000333333F3333777773333333}
    NumGlyphs = 2
  end
  object bBtnCancel: TBitBtn
    Left = 206
    Top = 128
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1053#1072#1079#1072#1076
    ModalResult = 2
    TabOrder = 6
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    NumGlyphs = 2
  end
  object cdsPrc: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PrcOsnV'
        DataType = ftFloat
      end
      item
        Name = 'PrcPrem'
        DataType = ftFloat
      end
      item
        Name = 'PrcOtpTM'
        DataType = ftFloat
      end
      item
        Name = 'PrcOtpBM'
        DataType = ftFloat
      end
      item
        Name = 'PrcOtpNI'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 27
    object cdsPrcPrcOsnV: TFloatField
      FieldName = 'PrcOsnV'
    end
    object cdsPrcPrcPrem: TFloatField
      FieldName = 'PrcPrem'
    end
    object cdsPrcPrcOtpTM: TFloatField
      FieldName = 'PrcOtpTM'
    end
    object cdsPrcPrcOtpBM: TFloatField
      FieldName = 'PrcOtpBM'
    end
    object cdsPrcPrcOtpNI: TFloatField
      FieldName = 'PrcOtpNI'
    end
  end
  object dsrcPrc: TDataSource
    DataSet = cdsPrc
    Left = 164
    Top = 40
  end
end
