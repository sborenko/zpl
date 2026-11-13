object FormZdVedPrc: TFormZdVedPrc
  Left = 458
  Top = 467
  Anchors = [akRight, akBottom]
  BorderStyle = bsDialog
  Caption = 'FormZdVedPrc'
  ClientHeight = 185
  ClientWidth = 265
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
    265
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object bBtnOk: TBitBtn
    Left = 88
    Top = 156
    Width = 92
    Height = 25
    Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1086#1083#1077' '#1042#1042#1077#1076' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '#1074#1074#1077#1076#1077#1085#1085#1099#1084#1080' '#1087#1088#1086#1094#1077#1085#1090#1072#1084#1080
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Kind = bkOK
    Spacing = 0
  end
  object bBtnCancel: TBitBtn
    Left = 187
    Top = 156
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 265
    Height = 148
    ActivePage = ts2
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = tsButtons
    TabOrder = 2
    object ts1: TTabSheet
      Caption = 'ts1'
      object Label1: TLabel
        Left = 9
        Top = 34
        Width = 175
        Height = 28
        AutoSize = False
        Caption = '  1. '#1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1080' '#1087#1088#1086#1096#1083#1099#1093' '#1084#1077#1089#1103#1094#1077#1074':'
        FocusControl = dbePrcOtpC
        WordWrap = True
      end
      object Label2: TLabel
        Left = 8
        Top = 63
        Width = 175
        Height = 29
        AutoSize = False
        Caption = '  2. '#1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1073#1091#1076#1091#1097#1080#1093' '#1084#1077#1089#1103#1094#1077#1074':'
        FocusControl = dbePrcOtpB
        WordWrap = True
      end
      object Label3: TLabel
        Left = 8
        Top = 92
        Width = 175
        Height = 29
        AutoSize = False
        Caption = '  3. '#1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1087#1086' '#1086#1089#1090#1072#1083#1100#1085#1099#1084' '#1074#1080#1076#1072#1084':'
        FocusControl = dbePrcRest
        WordWrap = True
      end
      object Label4: TLabel
        Left = 8
        Top = 0
        Width = 245
        Height = 29
        AutoSize = False
        Caption = 
          #1042#1074#1077#1076#1080#1090#1077' '#1087#1088#1086#1094#1077#1085#1090#1099' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1076#1083#1103' '#1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100 +
          ' '#1074#1099#1087#1083#1072#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object dbePrcOtpC: TDBEdit
        Left = 195
        Top = 37
        Width = 56
        Height = 21
        DataField = 'PrcOtpC'
        DataSource = dsrcTmp
        TabOrder = 0
        OnEnter = dbeditEnter
        OnExit = dbeditExit
      end
      object dbePrcOtpB: TDBEdit
        Left = 195
        Top = 66
        Width = 56
        Height = 21
        DataField = 'PrcOtpB'
        DataSource = dsrcTmp
        TabOrder = 1
        OnEnter = dbeditEnter
        OnExit = dbeditExit
      end
      object dbePrcRest: TDBEdit
        Left = 195
        Top = 95
        Width = 56
        Height = 21
        DataField = 'PrcRest'
        DataSource = dsrcTmp
        TabOrder = 2
        OnEnter = dbeditEnter
        OnExit = dbeditExit
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Label5: TLabel
        Left = 9
        Top = 37
        Width = 180
        Height = 28
        AutoSize = False
        Caption = '  1. '#1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084' "'#1050' '#1074#1099#1087#1083#1072#1090#1077'" '#1076#1083#1103' '#1089#1086#1079#1076#1072#1074#1072#1077#1084#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        FocusControl = dbePrcVupl
        WordWrap = True
      end
      object Label6: TLabel
        Left = 8
        Top = 3
        Width = 245
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1042#1074#1077#1076#1080#1090#1077' '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084' "'#1050' '#1074#1099#1087#1083#1072#1090#1077'", '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1089#1086#1079#1076#1072#1074#1072#1077#1084#1091#1102' '#1074#1077 +
          #1076#1086#1084#1086#1089#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object dbePrcVupl: TDBEdit
        Left = 195
        Top = 40
        Width = 56
        Height = 21
        DataField = 'PrcVupl'
        DataSource = dsrcTmp
        TabOrder = 0
        OnEnter = dbeditEnter
        OnExit = dbeditExit
      end
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PrcOtpC'
        DataType = ftFloat
      end
      item
        Name = 'PrcOtpB'
        DataType = ftFloat
      end
      item
        Name = 'PrcRest'
        DataType = ftFloat
      end
      item
        Name = 'PrcVupl'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 10
    Top = 149
    object cdsTmpPrcOtpC: TFloatField
      FieldName = 'PrcOtpC'
    end
    object cdsTmpPrcOtpB: TFloatField
      FieldName = 'PrcOtpB'
    end
    object cdsTmpPrcRest: TFloatField
      FieldName = 'PrcRest'
    end
    object cdsTmpPrcVupl: TFloatField
      FieldName = 'PrcVupl'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 26
    Top = 149
  end
end
