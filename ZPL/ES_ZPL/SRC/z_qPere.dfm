object FormQryPere: TFormQryPere
  Left = 774
  Top = 324
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'FormQryPere'
  ClientHeight = 413
  ClientWidth = 402
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
  object Label4: TLabel
    Left = 15
    Top = 92
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label7: TLabel
    Left = 133
    Top = 92
    Width = 65
    Height = 13
    Caption = #1080' '#8470' '#1087#1088#1080#1082#1072#1079#1072
  end
  object dbeNwDtBeg: TDBEdit
    Left = 321
    Top = 12
    Width = 81
    Height = 21
    Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' ('#1086#1076#1080#1085#1072#1082#1086#1074#1072#1103' '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081')'
    TabStop = False
    DataField = 'NwDtBeg'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Visible = False
    OnEnter = dbeNwDtBegEnter
    OnExit = dbeNwDtBegExit
  end
  object panelMain: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 413
    Align = alLeft
    Caption = 'panelMain'
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 7
      Width = 176
      Height = 13
      Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' ('#1086#1076#1080#1085#1072#1082#1086#1074#1072#1103' '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081')'
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1085#1086#1074#1086#1075#1086' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      FocusControl = dbeNwDtBeg
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 14
      Top = 146
      Width = 136
      Height = 13
      Caption = #1053#1086#1074#1099#1081' '#1082#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      FocusControl = dbeNwKdObj
    end
    object Label3: TLabel
      Left = 14
      Top = 168
      Width = 167
      Height = 13
      Caption = #1053#1086#1074#1099#1081' '#1082#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FocusControl = dbeNwKdKatP
    end
    object sBtnObj: TSpeedButton
      Left = 256
      Top = 143
      Width = 17
      Height = 20
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnObjClick
    end
    object sBtnKatP: TSpeedButton
      Left = 256
      Top = 165
      Width = 17
      Height = 20
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnKatPClick
    end
    object dbeNwKdObj: TDBEdit
      Left = 206
      Top = 143
      Width = 45
      Height = 21
      Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' ('#1077#1089#1083#1080' '#1077#1089#1090#1100', '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1089#1103' '#1074#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080')'
      DataField = 'NwKdObj'
      DataSource = dsrcTmp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnDblClick = sBtnObjClick
      OnEnter = dbeNwDtBegEnter
      OnExit = dbeNwDtBegExit
      OnKeyDown = dbeNwKdObjKeyDown
    end
    object dbeNwKdKatP: TDBEdit
      Left = 206
      Top = 165
      Width = 45
      Height = 21
      Hint = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' ('#1077#1089#1083#1080' '#1077#1089#1090#1100', '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1089#1103' '#1074#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080')'
      DataField = 'NwKdKatP'
      DataSource = dsrcTmp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnDblClick = sBtnKatPClick
      OnEnter = dbeNwDtBegEnter
      OnExit = dbeNwDtBegExit
      OnKeyDown = dbeNwKdKatPKeyDown
    end
    object bBtnOk: TBitBtn
      Left = 158
      Top = 380
      Width = 66
      Height = 25
      Hint = #1042#1074#1086#1076
      Caption = #1042#1074#1086#1076
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      Kind = bkOK
      Spacing = 1
    end
    object bBtnCancel: TBitBtn
      Left = 230
      Top = 380
      Width = 66
      Height = 25
      Hint = #1054#1090#1082#1072#1079' '#1086#1090' '#1074#1074#1086#1076#1072
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      Kind = bkCancel
      Spacing = 1
    end
    object ChBoxKdObj: TCheckBox
      Left = 280
      Top = 145
      Width = 13
      Height = 17
      Hint = '"'#1043#1072#1083#1086#1095#1082#1072'" '#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1089#1090#1072#1088#1099#1077' '#1082#1086#1076#1099' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      Alignment = taLeftJustify
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 6
      OnEnter = ChBoxEnter
      OnExit = ChBoxExit
    end
    object ChBoxKdKatP: TCheckBox
      Left = 280
      Top = 167
      Width = 13
      Height = 17
      Hint = '"'#1043#1072#1083#1086#1095#1082#1072'" '#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1089#1090#1072#1088#1099#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      Alignment = taLeftJustify
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 8
      OnEnter = ChBoxEnter
      OnExit = ChBoxExit
    end
    object dtPicDtBeg: TDateTimePicker
      Left = 206
      Top = 4
      Width = 83
      Height = 21
      Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' ('#1086#1076#1080#1085#1072#1082#1086#1074#1072#1103' '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081')'
      Date = 39050.000000000000000000
      Time = 39050.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = dtPicDtBegChange
      OnEnter = dtPicDtBegEnter
      OnExit = dtPicDtBegExit
    end
    object grBoxOklTrf: TGroupBox
      Left = 8
      Top = 200
      Width = 289
      Height = 169
      Caption = '  '#1050#1072#1082' '#1087#1086#1089#1090#1091#1087#1080#1090#1100' '#1089' '#1085#1086#1074#1099#1084#1080' '#1086#1082#1083#1072#1076#1072#1084#1080'  '
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      object dbeNwOklTrf: TDBEdit
        Left = 200
        Top = 42
        Width = 67
        Height = 21
        Hint = #1057#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072' ('#1086#1076#1080#1085#1072#1082#1086#1074#1072#1103' '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081')'
        DataField = 'NwOklTrf'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = dbeNwDtBegEnter
        OnExit = dbeNwDtBegExit
      end
      object rBtnEmptyOklTrf: TRadioButton
        Left = 144
        Top = 21
        Width = 121
        Height = 17
        Hint = #1055#1086#1083#1077' "'#1054#1082#1083#1072#1076'" '#1085#1077' '#1079#1072#1087#1086#1083#1085#1103#1090#1100
        Caption = #1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1099#1084
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = rBtnOklTrfClick
      end
      object rBtnFixedOklTrf: TRadioButton
        Left = 8
        Top = 43
        Width = 185
        Height = 17
        Hint = #1054#1076#1080#1085#1072#1082#1086#1074#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072' '#1087#1086' '#1074#1089#1077#1084' '#1079#1072#1087#1080#1089#1103#1084
        Caption = #1079#1072#1076#1072#1090#1100' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1091#1102' '#1089#1091#1084#1084#1091
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = True
        OnClick = rBtnOklTrfClick
      end
      object rBtnProcOklTrf: TRadioButton
        Left = 8
        Top = 65
        Width = 173
        Height = 17
        Hint = 
          #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' ('#1076#1083#1103' '#1091#1084#1077#1085#1100#1096#1077#1085#1080#1103' '#1074#1074#1086#1076#1080#1090#1077' '#1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085 +
          #1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077')'
        Caption = #1079#1072#1076#1072#1090#1100' '#1087#1088#1086#1094#1077#1085#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = rBtnOklTrfClick
      end
      object rBtnOldOklTrf: TRadioButton
        Left = 8
        Top = 21
        Width = 123
        Height = 17
        Hint = #1054#1089#1090#1072#1074#1074#1080#1090#1100' '#1089#1090#1072#1088#1099#1077' '#1089#1091#1084#1084#1099' '#1086#1082#1083#1072#1076#1086#1074
        Caption = #1086#1089#1090#1072#1074#1074#1080#1090#1100' '#1089#1090#1072#1088#1099#1077
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = rBtnOklTrfClick
      end
      object dbeProcOklTrf: TDBEdit
        Left = 200
        Top = 64
        Width = 67
        Height = 21
        Hint = 
          #1055#1088#1086#1094#1077#1085#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1086#1082#1083#1072#1076#1086#1074' ('#1076#1083#1103' '#1091#1084#1077#1085#1100#1096#1077#1085#1080#1103' '#1074#1074#1086#1076#1080#1090#1077' '#1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1086#1077' ' +
          #1079#1085#1072#1095#1077#1085#1080#1077')'
        DataField = 'ProcOklTrf'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnEnter = dbeNwDtBegEnter
        OnExit = dbeNwDtBegExit
      end
      object PanelRound: TPanel
        Left = 5
        Top = 88
        Width = 273
        Height = 73
        BevelOuter = bvNone
        TabOrder = 6
        object LabelHowRound: TLabel
          Left = 78
          Top = 6
          Width = 115
          Height = 13
          Caption = #1050' '#1072' '#1082'   '#1086' '#1082' '#1088' '#1091' '#1075' '#1083' '#1103' '#1090' '#1100' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object rBtnRoundMinus: TRadioButton
          Left = 4
          Top = 50
          Width = 113
          Height = 17
          Hint = #1044#1086' '#1094#1077#1083#1099#1093', '#1086#1090#1073#1088#1072#1089#1099#1074#1072#1103' '#1076#1088#1086#1073#1085#1099#1077
          Caption = #1076#1086' '#1094#1077#1083#1099#1093' '#1074#1085#1080#1079
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = rBtnRoundClick
        end
        object rBtnRoundPlus: TRadioButton
          Left = 140
          Top = 50
          Width = 113
          Height = 17
          Hint = #1044#1086' '#1094#1077#1083#1099#1093', '#1091#1074#1077#1083#1080#1095#1080#1074#1072#1103' '#1074#1074#1077#1088#1093
          Caption = #1076#1086' '#1094#1077#1083#1099#1093' '#1074#1074#1077#1088#1093
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = rBtnRoundClick
        end
        object rBtnIntNorm: TRadioButton
          Left = 4
          Top = 28
          Width = 129
          Height = 17
          Hint = #1044#1086' '#1094#1077#1083#1099#1093' '#1087#1086' '#1087#1088#1072#1074#1080#1083#1072#1084' '#1084#1072#1090#1077#1084#1072#1090#1080#1082#1080
          Caption = #1076#1086' '#1094#1077#1083#1099#1093' '#1085#1086#1088#1084#1072#1083#1100#1085#1086
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = True
          OnClick = rBtnRoundClick
        end
        object rBtnRoundNorm: TRadioButton
          Left = 140
          Top = 28
          Width = 131
          Height = 17
          Hint = #1044#1086' 2-'#1093' '#1079#1085#1072#1082#1086#1074' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081' '#1087#1086' '#1087#1088#1072#1074#1080#1083#1072#1084' '#1084#1072#1090#1077#1084#1072#1090#1080#1082#1080
          Caption = #1076#1086' 2-'#1093' '#1079#1085'. '#1085#1086#1088#1084#1072#1083#1100#1085#1086
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = rBtnRoundClick
        end
      end
    end
    object chBox8802: TCheckBox
      Left = 13
      Top = 378
      Width = 123
      Height = 27
      Hint = 
        #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' ('#1076#1086#1073#1072#1074#1080#1090#1100 +
        ' '#1074#1080#1076' 8802)'
      Caption = #1055#1077#1088#1077#1089#1095#1077#1090' '#1087#1088#1086#1096#1083#1099#1093' '#1084#1077#1089#1103#1094#1077#1074
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 10
      WordWrap = True
    end
    object CheBoxBM: TCheckBox
      Left = 14
      Top = 32
      Width = 143
      Height = 17
      Hint = 
        #1055#1088#1080' '#1087#1088#1086#1089#1090#1072#1074#1083#1077#1085#1085#1086#1081' "'#1075#1072#1083#1086#1095#1082#1077'" '#1074#1089#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1073#1091#1076#1091#1090' '#1089#1095#1080#1090#1072#1090#1100#1089#1103' "'#1073#1072#1079 +
        #1086#1074#1099#1084#1080'"'
      Alignment = taLeftJustify
      Caption = #1047#1072#1087#1080#1089#1100' "'#1073#1072#1079#1086#1074#1072#1103'"'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = CheBoxBMClick
      OnEnter = CheckBoxEnter
      OnExit = CheckBoxExit
    end
    object dbeDtBM: TDBEdit
      Left = 206
      Top = 30
      Width = 83
      Height = 21
      Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' ('#1086#1076#1080#1085#1072#1082#1086#1074#1072#1103' '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081')'
      DataField = 'DtBM'
      DataSource = dsrcTmp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnEnter = dbeNwDtBegEnter
      OnExit = dbeNwDtBegExit
    end
    object CheckTrKn: TCheckBox
      Left = 14
      Top = 54
      Width = 143
      Height = 17
      Alignment = taLeftJustify
      Caption = #1042' '#1101#1083#1077#1082#1090#1088'. '#1090#1088#1091#1076'. '#1082#1085#1080#1078#1082#1091
      TabOrder = 3
      OnEnter = CheckBoxEnter
      OnExit = ChBoxExit
    end
    object grpBoxPrikaz: TGroupBox
      Left = 8
      Top = 80
      Width = 289
      Height = 49
      Caption = ' '#1055#1088#1080#1082#1072#1079' '
      TabOrder = 4
      object Label5: TLabel
        Left = 47
        Top = 24
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
        FocusControl = dbeDtPrikaza
      end
      object Label6: TLabel
        Left = 176
        Top = 24
        Width = 11
        Height = 13
        Caption = #8470
        FocusControl = dbeNrPrikaza
      end
      object dbeDtPrikaza: TDBEdit
        Left = 86
        Top = 20
        Width = 75
        Height = 21
        Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' ('#1087#1088#1086#1089#1090#1072#1074#1080#1090#1089#1103' '#1074#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080')'
        DataField = 'DtPrikaza'
        DataSource = dsrcTmp
        MaxLength = 10
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = dbeNwDtBegEnter
        OnExit = dbeNwDtBegExit
      end
      object dbeNrPrikaza: TDBEdit
        Left = 198
        Top = 20
        Width = 75
        Height = 21
        Hint = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072' ('#1087#1088#1086#1089#1090#1072#1074#1080#1090#1089#1103' '#1074#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080')'
        DataField = 'NrPrikaza'
        DataSource = dsrcTmp
        TabOrder = 1
        OnEnter = dbeNwDtBegEnter
        OnExit = dbeNwDtBegExit
      end
    end
  end
  object cdsTmp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NwDtBeg'
        DataType = ftDate
      end
      item
        Name = 'NwKdObj'
        DataType = ftSmallint
      end
      item
        Name = 'NwKdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'NwOklTrf'
        DataType = ftFloat
      end
      item
        Name = 'DtPrikaza'
        DataType = ftDate
      end
      item
        Name = 'NrPrikaza'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ProcOklTrf'
        DataType = ftFloat
      end
      item
        Name = 'DtBM'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 322
    Top = 43
    Data = {
      AC0000009619E0BD010000001800000008000000000003000000AC00074E7744
      744265670400060000000000074E774B644F626A0200010000000000084E774B
      644B6174500200010000000000084E774F6B6C54726608000400000000000944
      745072696B617A610400060000000000094E725072696B617A61010049000000
      0100055749445448020002000A000A50726F634F6B6C54726608000400000000
      00044474424D04000600000000000000}
    object cdsTmpNwDtBeg: TDateField
      FieldName = 'NwDtBeg'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtPrikaza: TDateField
      FieldName = 'DtPrikaza'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpNrPrikaza: TStringField
      FieldName = 'NrPrikaza'
      Size = 10
    end
    object cdsTmpNwKdObj: TSmallintField
      FieldName = 'NwKdObj'
    end
    object cdsTmpNwKdKatP: TSmallintField
      FieldName = 'NwKdKatP'
    end
    object cdsTmpNwOklTrf: TFloatField
      FieldName = 'NwOklTrf'
    end
    object cdsTmpProcOklTrf: TFloatField
      FieldName = 'ProcOklTrf'
    end
    object cdsTmpDtBM: TDateField
      FieldName = 'DtBM'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 330
    Top = 51
  end
end
