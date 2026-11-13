object FormTVids: TFormTVids
  Left = 379
  Top = 300
  Width = 625
  Height = 565
  ActiveControl = TV
  BorderIcons = [biSystemMenu]
  Caption = #1042#1080#1076#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
  Color = clBtnFace
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 565
  Constraints.MinWidth = 625
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
  object PanelRight: TPanel
    Left = 241
    Top = 0
    Width = 376
    Height = 508
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = PanelRightResize
    DesignSize = (
      376
      508)
    object LabelLittleHelp: TLabel
      Left = 62
      Top = 437
      Width = 248
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102' '#1087#1088#1080' '#1074#1074#1086#1076#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      Visible = False
    end
    object PanelDetails: TPanel
      Left = 10
      Top = 1
      Width = 373
      Height = 400
      Hint = #1057#1074#1086#1081#1089#1090#1074#1072' '#1074#1080#1076#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103')'
      BevelInner = bvRaised
      BevelOuter = bvLowered
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object Bevel2: TBevel
        Left = 0
        Top = 55
        Width = 371
        Height = 2
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 154
        Top = 9
        Width = 27
        Height = 13
        Caption = #1057#1095#1041#1059
        FocusControl = dbeSPZ
      end
      object Label3: TLabel
        Left = 6
        Top = 9
        Width = 19
        Height = 13
        Caption = #1042#1080#1076
      end
      object Label5: TLabel
        Left = 177
        Top = 109
        Width = 177
        Height = 13
        Hint = #1063#1072#1089#1099' '#1087#1086' '#1074#1080#1076#1091' '#1074#1093#1086#1076#1103#1090' '#1074' '#1089#1091#1084#1084#1091' "'#1073#1102#1076#1078#1077#1090#1085#1099#1093'" '#1095#1072#1089#1086#1074' (CBUDG)'
        AutoSize = False
        Caption = '-  "'#1073#1102#1076#1078#1077#1090#1085#1099#1093'" '#1095#1072#1089#1086#1074'  .........................'
      end
      object Label8: TLabel
        Left = 6
        Top = 138
        Width = 167
        Height = 13
        Caption = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074' '#1089#1091#1084#1084#1099' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072': '
      end
      object Label9: TLabel
        Left = 177
        Top = 151
        Width = 177
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085 +
          #1080#1095#1085#1099#1093' (BLN)'
        AutoSize = False
        Caption = 
          '- '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' ...................................................' +
          '....'
      end
      object Label10: TLabel
        Left = 177
        Top = 177
        Width = 177
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1088#1077#1076#1085 +
          #1077#1044#1085#1077#1074#1085#1086#1075#1086' '#1076#1083#1103' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1082' (SSRK)'
        AutoSize = False
        Caption = '- '#1057#1088#1044#1085#1077#1074#1085#1086#1075#1086' '#1076#1083#1103' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1082'.........'
      end
      object Label11: TLabel
        Left = 9
        Top = 305
        Width = 82
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1076#1073#1072 +
          #1074#1086#1082' (SNDB)'
        AutoSize = False
        Caption = 
          '- '#1085#1072#1076#1073#1072#1074#1086#1082' .....................................................' +
          '......'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object Label12: TLabel
        Left = 177
        Top = 204
        Width = 177
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076#1086#1093 +
          #1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072' (SPDN)'
        AutoSize = False
        Caption = '- '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072' .........................................'
      end
      object Label13: TLabel
        Left = 177
        Top = 293
        Width = 177
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1095#1080#1089 +
          #1083#1077#1085#1080#1081' '#1074' '#1045#1057#1042' '#1089' '#1089#1086#1090#1088'. '#1080' '#1089' '#1087#1088#1077#1076#1087#1088'. (SP_PF)'
        AutoSize = False
        Caption = '- '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1081' '#1074' '#1045#1057#1042' .........................'
      end
      object Label15: TLabel
        Left = 177
        Top = 242
        Width = 183
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1072#1083#1080#1084#1077 +
          #1085#1086#1074' (SALIM)'
        AutoSize = False
        Caption = 
          '- '#1072#1083#1080#1084#1077#1085#1090#1086#1074' ....................................................' +
          '....'
      end
      object Label16: TLabel
        Left = 177
        Top = 255
        Width = 183
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083'. '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1076#1086#1087#1083#1072#1090' '#1076#1086 +
          ' '#1084#1080#1085#1080#1084'. '#1079#1072#1088#1087#1083#1072#1090#1099' ('#1087#1086#1083#1077' OKLFND)'
        AutoSize = False
        Caption = 
          '- '#1089#1091#1084#1084#1099' '#1076#1086#1087#1083#1072#1090' '#1076#1086' '#1084#1080#1085'.'#1079'/'#1087#1083' .....................................' +
          '........'
      end
      object Label17: TLabel
        Left = 177
        Top = 268
        Width = 183
        Height = 13
        Hint = #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1087#1088#1072#1074#1082#1091' '#1086' '#1076#1086#1093#1086#1076#1072#1093' (DHD)'
        AutoSize = False
        Caption = 
          '- '#1076#1083#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1086' '#1076#1086#1093#1086#1076#1072#1093' ........................................' +
          '..................'
      end
      object Label18: TLabel
        Left = 6
        Top = 323
        Width = 117
        Height = 13
        Caption = #1071#1074#1083#1103#1077#1090#1089#1103' '#1083#1080' '#1086#1076#1085#1080#1084' '#1080#1079':'
      end
      object Label19: TLabel
        Left = 131
        Top = 383
        Width = 221
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1087#1086#1089#1086#1073#1080#1081' '#1085#1072' '#1076#1077#1090#1077#1081' (DETIM)'
        AutoSize = False
        Caption = 
          '- "'#1076#1077#1090#1089#1082#1080#1093'" '#1084#1077#1089#1103#1095#1085#1099#1093' '#1074#1080#1076#1086#1074' .....................................' +
          '.......'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label20: TLabel
        Left = 131
        Top = 394
        Width = 221
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1087#1086#1089#1086#1073#1080#1081' '#1085#1072' '#1076#1077#1090#1077#1081' (DETIK)'
        AutoSize = False
        Caption = 
          '- "'#1076#1077#1090#1089#1082#1080#1093'" '#1082#1074#1072#1088#1090#1072#1083#1100#1085#1099#1093' '#1074#1080#1076#1086#1074' ..................................' +
          '.....'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label21: TLabel
        Left = 131
        Top = 407
        Width = 221
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1087#1086#1089#1086#1073#1080#1081' '#1085#1072' '#1076#1077#1090#1077#1081' (DETIG)'
        AutoSize = False
        Caption = 
          '- "'#1076#1077#1090#1089#1082#1080#1093'" '#1075#1086#1076#1086#1074#1099#1093' '#1074#1080#1076#1086#1074' ......................................' +
          '.........'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label14: TLabel
        Left = 177
        Top = 229
        Width = 178
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1088#1086#1092#1089 +
          #1086#1102#1079#1085#1099#1093' '#1074#1079#1085#1086#1089#1086#1074' (SPRF)'
        AutoSize = False
        Caption = '- '#1087#1088#1086#1092#1089#1086#1102#1079#1085#1099#1093' '#1074#1079#1085#1086#1089#1086#1074' ..................................'
      end
      object Label24: TLabel
        Left = 177
        Top = 336
        Width = 221
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1074#1080#1076#1086#1074' (OTPUSKN)'
        AutoSize = False
        Caption = 
          '- "'#1086#1090#1087#1091#1089#1082#1085#1099#1093'" '#1074#1080#1076#1086#1074' ............................................' +
          '...........'
      end
      object sBtnSPZ: TSpeedButton
        Left = 241
        Top = 6
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1095#1041#1059')'
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
        OnClick = sBtnSPZClick
      end
      object Label4: TLabel
        Left = 177
        Top = 163
        Width = 177
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1076#1077#1082#1088#1077 +
          #1090#1085#1099#1093' (DKR)'
        AutoSize = False
        Caption = '- '#1076#1077#1082#1088#1077#1090#1085#1099#1093' ...............................................'
      end
      object Label25: TLabel
        Left = 177
        Top = 217
        Width = 175
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1074#1086#1077#1085#1085 +
          #1086#1075#1086' '#1089#1073#1086#1088#1072' (SWSB)'
        AutoSize = False
        Caption = '- '#1074#1086#1077#1085#1085#1086#1075#1086' '#1089#1073#1086#1088#1072' ............................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 9
        Top = 290
        Width = 74
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1095#1080#1089 +
          #1083#1077#1085#1080#1081' '#1074' '#1060#1047' '#1089' '#1089#1086#1090#1088'. '#1080' '#1089' '#1087#1088#1077#1076#1087#1088'. (SP_FZ)'
        AutoSize = False
        Caption = #1074' '#1060#1047' ........................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label28: TLabel
        Left = 6
        Top = 109
        Width = 152
        Height = 13
        Caption = #1042#1093#1086#1076#1103#1090' '#1083#1080' '#1095#1072#1089#1099' '#1074#1080#1076#1072'  '#1074' '#1089#1091#1084#1084#1091
      end
      object Label29: TLabel
        Left = 177
        Top = 138
        Width = 177
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089 +
          #1082#1085#1099#1093' (OTP)'
        AutoSize = False
        Caption = 
          '- '#1086#1090#1087#1091#1089#1082#1085#1099#1093' ....................................................' +
          '.....'
        ParentShowHint = False
        ShowHint = True
      end
      object Label30: TLabel
        Left = 177
        Top = 323
        Width = 221
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1074#1080#1076#1086#1074' (BOLNIC)'
        AutoSize = False
        Caption = 
          '- "'#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093'" '#1074#1080#1076#1086#1074' ...........................................' +
          '............'
      end
      object Label31: TLabel
        Left = 177
        Top = 281
        Width = 183
        Height = 13
        Hint = #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1087#1088#1072#1074#1082#1091' '#1076#1083#1103' '#1057#1055#1054#1042' (SPOV)'
        AutoSize = False
        Caption = 
          '- '#1076#1083#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1074' '#1057#1055#1054#1042' ...........................................' +
          '...............'
      end
      object Label32: TLabel
        Left = 177
        Top = 349
        Width = 221
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1093' '#1074#1080#1076#1086#1074' (SOVM)'
        AutoSize = False
        Caption = 
          '- "'#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1093'" '#1074#1080#1076#1086#1074' .....................................' +
          '..................'
      end
      object Label33: TLabel
        Left = 277
        Top = 9
        Width = 28
        Height = 13
        Caption = #1050#1045#1050#1042
        FocusControl = dbeKekv
      end
      object DBText1: TDBText
        Left = 5
        Top = 32
        Width = 26
        Height = 17
        Hint = #1042#1080#1076#1053' '#1074' '#1089#1090#1072#1088#1086#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' "'#1047#1072#1088#1087#1083#1072#1090#1072'"'
        DataField = 'OLDKDVIDN'
        DataSource = dsrcVidN
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelDtBDtE: TLabel
        Left = 3
        Top = 229
        Width = 158
        Height = 45
        AutoSize = False
        Caption = 
          #1055#1086#1083#1077' NDBE '#1077#1089#1083#1080' '#1079#1085#1072#1095#1077#1085#1080#1077' 0, '#1090#1086' '#1087#1088#1080' '#1074#1074#1086#1076#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1085#1077' '#1087#1086#1076#1073#1088#1072#1089#1099#1074#1072 +
          #1102#1090#1089#1103' '#1076#1072#1090#1099' '#1080' '#1095#1072#1089#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      object sBtnClearSpZ: TSpeedButton
        Left = 257
        Top = 6
        Width = 15
        Height = 21
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1089#1095#1077#1090#1072' '#1041#1059
        Caption = 'X'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnClearSpZClick
      end
      object sBtnKekv: TSpeedButton
        Left = 354
        Top = 6
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1050#1045#1050#1042
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
        OnClick = sBtnKekvClick
      end
      object Label6: TLabel
        Left = 10
        Top = 58
        Width = 349
        Height = 13
        Caption = #1047#1072#1087#1086#1083#1085#1103#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1085#1077#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1093' ('#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1072#1084' '#1074' '#1052#1054') '#1074#1080#1076#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 34
        Top = 77
        Width = 43
        Height = 13
        Caption = #1044#1090#1057#1095#1077#1090#1072
        FocusControl = dbeSchDt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnSchDt: TSpeedButton
        Left = 140
        Top = 74
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1095#1041#1059')'
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
        OnClick = sBtnSchDtClick
      end
      object sBtnClearSchDt: TSpeedButton
        Left = 156
        Top = 74
        Width = 15
        Height = 21
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' "'#1044#1090#1057#1095#1077#1090#1072'"'
        Caption = 'X'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnClearSchDtClick
      end
      object Label22: TLabel
        Left = 202
        Top = 77
        Width = 41
        Height = 13
        Caption = #1050#1090#1057#1095#1077#1090#1072
        FocusControl = dbeSchKt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnSchKt: TSpeedButton
        Left = 308
        Top = 74
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1095#1041#1059')'
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
        OnClick = sBtnSchKtClick
      end
      object sBtnClearSchKt: TSpeedButton
        Left = 324
        Top = 74
        Width = 15
        Height = 21
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' "'#1050#1090#1057#1095#1077#1090#1072'"'
        Caption = 'X'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnClearSchKtClick
      end
      object Bevel1: TBevel
        Left = 0
        Top = 100
        Width = 371
        Height = 2
      end
      object Label23: TLabel
        Left = 177
        Top = 190
        Width = 177
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1072#1093' '#1080#1085#1076#1077 +
          #1082#1089#1072#1094#1080#1080' (IND)'
        AutoSize = False
        Caption = '- '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1076#1086#1093#1086#1076#1086#1074' .........................................'
      end
      object dbeSPZ: TDBEdit
        Left = 184
        Top = 6
        Width = 56
        Height = 21
        Hint = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1089#1095#1077#1090' '#1073#1091#1093'.'#1091#1095#1077#1090#1072' ('#1057#1095#1041#1059')'
        DataField = 'SpZ'
        DataSource = dsrcVidN
        TabOrder = 2
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeNmVidNShort: TDBEdit
        Left = 69
        Top = 6
        Width = 77
        Height = 21
        HelpType = htKeyword
        HelpKeyword = #1064#1080#1092#1088' ('#1082#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077') '#1074#1080#1076#1072
        DataField = 'SHVIDN'
        DataSource = dsrcVidN
        ReadOnly = True
        TabOrder = 1
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object chBoxCBudg: TDBCheckBox
        Left = 350
        Top = 109
        Width = 18
        Height = 13
        Hint = #1063#1072#1089#1099' '#1087#1086' '#1074#1080#1076#1091' '#1074#1093#1086#1076#1103#1090' '#1074' '#1089#1091#1084#1084#1091' "'#1073#1102#1076#1078#1077#1090#1085#1099#1093'" '#1095#1072#1089#1086#1074' (CBUDG)'
        Alignment = taLeftJustify
        DataField = 'CBUDG'
        DataSource = dsrcVidN
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxOtp: TDBCheckBox
        Left = 350
        Top = 138
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089 +
          #1082#1085#1099#1093' (OTP)'
        Alignment = taLeftJustify
        DataField = 'OTP'
        DataSource = dsrcVidN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxBln: TDBCheckBox
        Left = 350
        Top = 151
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085 +
          #1080#1095#1085#1099#1093' (BLN)'
        Alignment = taLeftJustify
        DataField = 'BLN'
        DataSource = dsrcVidN
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSSrK: TDBCheckBox
        Left = 350
        Top = 177
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1088#1077#1076#1085 +
          #1077#1044#1085#1077#1074#1085#1086#1075#1086' '#1076#1083#1103' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1082' (SSRK)'
        Alignment = taLeftJustify
        DataField = 'SSRK'
        DataSource = dsrcVidN
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSNdb: TDBCheckBox
        Left = 102
        Top = 304
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1076#1073#1072 +
          #1074#1086#1082' (SNDB)'
        Alignment = taLeftJustify
        DataField = 'SNDB'
        DataSource = dsrcVidN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSPdn: TDBCheckBox
        Left = 350
        Top = 201
        Width = 18
        Height = 18
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076#1086#1093 +
          #1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072' (SPDN)'
        Alignment = taLeftJustify
        DataField = 'SPDN'
        DataSource = dsrcVidN
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSPRF: TDBCheckBox
        Left = 350
        Top = 228
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1088#1086#1092#1089 +
          #1086#1102#1079#1085#1099#1093' '#1074#1079#1085#1086#1089#1086#1074' (SPRF)'
        Alignment = taLeftJustify
        DataField = 'SPRF'
        DataSource = dsrcVidN
        TabOrder = 15
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSALIM: TDBCheckBox
        Left = 350
        Top = 241
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1072#1083#1080#1084#1077 +
          #1085#1086#1074' (SALIM)'
        Alignment = taLeftJustify
        DataField = 'SALIM'
        DataSource = dsrcVidN
        TabOrder = 16
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxDplDoMinZp: TDBCheckBox
        Left = 350
        Top = 254
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083'. '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1076#1086#1087#1083#1072#1090' '#1076#1086 +
          ' '#1084#1080#1085#1080#1084'. '#1079#1072#1088#1087#1083#1072#1090#1099' ('#1087#1086#1083#1077' OKLFND)'
        Alignment = taLeftJustify
        DataField = 'OKLFND'
        DataSource = dsrcVidN
        TabOrder = 17
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxDHD: TDBCheckBox
        Left = 350
        Top = 267
        Width = 18
        Height = 13
        Hint = #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1087#1088#1072#1074#1082#1091' '#1086' '#1076#1086#1093#1086#1076#1072#1093' (DHD)'
        Alignment = taLeftJustify
        DataField = 'DHD'
        DataSource = dsrcVidN
        TabOrder = 18
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxBOLNIC: TDBCheckBox
        Left = 350
        Top = 322
        Width = 18
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1074#1080#1076#1086#1074' (BOLNIC)'
        Alignment = taLeftJustify
        DataField = 'BOLNIC'
        DataSource = dsrcVidN
        TabOrder = 21
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxDETIM: TDBCheckBox
        Left = 350
        Top = 382
        Width = 18
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1087#1086#1089#1086#1073#1080#1081' '#1085#1072' '#1076#1077#1090#1077#1081' (DETIM)'
        Alignment = taLeftJustify
        DataField = 'DETIM'
        DataSource = dsrcVidN
        TabOrder = 27
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxDETIK: TDBCheckBox
        Left = 350
        Top = 395
        Width = 18
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1087#1086#1089#1086#1073#1080#1081' '#1085#1072' '#1076#1077#1090#1077#1081' (DETIK)'
        Alignment = taLeftJustify
        DataField = 'DETIK'
        DataSource = dsrcVidN
        TabOrder = 28
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxDETIG: TDBCheckBox
        Left = 350
        Top = 406
        Width = 18
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1087#1086#1089#1086#1073#1080#1081' '#1085#1072' '#1076#1077#1090#1077#1081' (DETIG)'
        Alignment = taLeftJustify
        DataField = 'DETIG'
        DataSource = dsrcVidN
        TabOrder = 29
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxNOSHOW: TDBCheckBox
        Left = 77
        Top = 368
        Width = 291
        Height = 13
        Hint = '(NOSHOW)'
        Alignment = taLeftJustify
        Caption = #1053#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' ('#1085#1077' '#1087#1088#1080#1084#1077#1085#1103#1090#1100', '#1085#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100')......'
        DataField = 'NOSHOW'
        DataSource = dsrcVidN
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxOTPUSKN: TDBCheckBox
        Left = 350
        Top = 335
        Width = 18
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1074#1080#1076#1086#1074' (OTPUSKN)'
        Alignment = taLeftJustify
        DataField = 'OTPUSKN'
        DataSource = dsrcVidN
        TabOrder = 22
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeNmVidN: TDBEdit
        Left = 32
        Top = 29
        Width = 337
        Height = 21
        Hint = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1074#1080#1076#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103')'
        DataField = 'NMVIDN'
        DataSource = dsrcVidN
        ReadOnly = True
        TabOrder = 4
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object chBoxSp_PF: TDBCheckBox
        Left = 350
        Top = 292
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1095#1080#1089 +
          #1083#1077#1085#1080#1081' '#1074' '#1055#1060' '#1089' '#1089#1086#1090#1088'. '#1080' '#1089' '#1087#1088#1077#1076#1087#1088'. (SP_PF)'
        Alignment = taLeftJustify
        DataField = 'SP_PF'
        DataSource = dsrcVidN
        TabOrder = 20
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxDkr: TDBCheckBox
        Left = 350
        Top = 163
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1076#1077#1082#1088#1077 +
          #1090#1085#1099#1093' (DKR)'
        Alignment = taLeftJustify
        DataField = 'DKR'
        DataSource = dsrcVidN
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSWsb: TDBCheckBox
        Left = 350
        Top = 216
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1074#1086#1077#1085#1085 +
          #1086#1075#1086' '#1089#1073#1086#1088#1072' (SWSB)'
        Alignment = taLeftJustify
        DataField = 'SWSB'
        DataSource = dsrcVidN
        TabOrder = 14
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSp_FZ: TDBCheckBox
        Left = 102
        Top = 290
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1095#1080#1089 +
          #1083#1077#1085#1080#1081' '#1074' '#1060#1047' '#1089' '#1089#1086#1090#1088'. '#1080' '#1089' '#1087#1088#1077#1076#1087#1088'. (SP_FZ)'
        Alignment = taLeftJustify
        DataField = 'SP_FZ'
        DataSource = dsrcVidN
        TabOrder = 26
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeVidN: TDBEdit
        Left = 32
        Top = 6
        Width = 38
        Height = 21
        Hint = #1050#1086#1076' '#1074#1080#1076#1072
        TabStop = False
        DataField = 'VIDN'
        DataSource = dsrcVidN
        ReadOnly = True
        TabOrder = 0
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object chBoxSPOV: TDBCheckBox
        Left = 350
        Top = 280
        Width = 18
        Height = 13
        Hint = #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1087#1088#1072#1074#1082#1091' '#1076#1083#1103' '#1057#1055#1054#1042' (SPOV)'
        Alignment = taLeftJustify
        DataField = 'SPOV'
        DataSource = dsrcVidN
        TabOrder = 19
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object chBoxSOVM: TDBCheckBox
        Left = 350
        Top = 348
        Width = 18
        Height = 13
        Hint = #1042#1093#1086#1076#1080#1090' '#1083#1080' '#1074#1080#1076' '#1074' '#1075#1088#1091#1087#1087#1091' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1093' '#1074#1080#1076#1086#1074' (SOVM)'
        Alignment = taLeftJustify
        DataField = 'SOVM'
        DataSource = dsrcVidN
        TabOrder = 23
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeKekv: TDBEdit
        Left = 308
        Top = 6
        Width = 46
        Height = 21
        Hint = #1050#1086#1076' '#1079#1072#1090#1088#1072#1090
        DataField = 'KEKV'
        DataSource = dsrcVidN
        TabOrder = 3
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeDtBDtE: TDBEdit
        Left = 51
        Top = 268
        Width = 28
        Height = 21
        Hint = 
          #1055#1088#1080#1079#1085#1072#1082' '#1090#1086#1075#1086', '#1095#1090#1086' '#1087#1088#1080' '#1074#1074#1086#1076#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1087#1086' '#1074#1080#1076#1091' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1085#1091#1078#1085#1086 +
          ' '#1074#1074#1086#1076#1080#1090#1100' '#1044#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1080' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        TabStop = False
        DataField = 'NDBE'
        DataSource = dsrcVidN
        TabOrder = 30
        Visible = False
      end
      object dbeSchDt: TDBEdit
        Left = 83
        Top = 74
        Width = 56
        Height = 21
        Hint = #1044#1077#1073#1077#1090' '#1089#1095#1077#1090#1072' '#1074' '#1052#1054
        DataField = 'SchDt'
        DataSource = dsrcVidN
        TabOrder = 5
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeSchKt: TDBEdit
        Left = 251
        Top = 74
        Width = 56
        Height = 21
        Hint = #1050#1088#1077#1076#1080#1090' '#1089#1095#1077#1090#1072' '#1074' '#1052#1054
        DataField = 'SchKt'
        DataSource = dsrcVidN
        TabOrder = 6
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbChBoxIndx: TDBCheckBox
        Left = 350
        Top = 190
        Width = 18
        Height = 13
        Hint = 
          #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1074#1080#1076#1091', '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1091#1084#1084#1091' '#1087#1088#1080' '#1088#1072#1089#1095#1077#1090#1072#1093' '#1080#1085#1076#1077 +
          #1082#1089#1072#1094#1080#1080' (IND)'
        Alignment = taLeftJustify
        DataField = 'IND'
        DataSource = dsrcVidN
        TabOrder = 12
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
    end
    object dbmLittleHelp: TDBMemo
      Left = 58
      Top = 450
      Width = 315
      Height = 54
      Anchors = [akLeft, akBottom]
      DataField = 'LITTLEHLP'
      DataSource = dsrcVidN
      TabOrder = 1
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 508
    Width = 617
    Height = 30
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      617
      30)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object bBtnOk: TBitBtn
      Left = 460
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 539
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 508
    Align = alClient
    TabOrder = 2
    object TV: TTreeView
      Left = 1
      Top = 1
      Width = 239
      Height = 393
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      HideSelection = False
      HotTrack = True
      Indent = 19
      ParentFont = False
      PopupMenu = popTv
      ReadOnly = True
      RightClickSelect = True
      RowSelect = True
      TabOrder = 0
      OnChange = TVChange
      OnCustomDrawItem = TVCustomDrawItem
      OnDblClick = TVDblClick
    end
    object dbgrVidN: TDBGrid
      Left = 1
      Top = 394
      Width = 239
      Height = 113
      TabStop = False
      Align = alBottom
      Color = clBtnFace
      Ctl3D = True
      DataSource = dsrcVidN
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'OLDKDVIDN'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHVIDN'
          Title.Caption = #1064#1080#1092#1088
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMVIDN'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AINDX'
          Title.Caption = #1040#1048#1085#1076
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PINDX'
          Title.Caption = #1055#1048#1085#1076
          Width = 14
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LVL'
          Title.Caption = #1051#1074#1083
          Width = 13
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INDX'
          Title.Caption = #1048#1085#1076
          Width = 15
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HSCH'
          Title.Caption = #1044#1077#1090#1080
          Width = 14
          Visible = True
        end>
    end
  end
  object popTv: TPopupMenu
    OnPopup = popTvPopup
    Left = 152
    Top = 112
    object popTvVubor: TMenuItem
      Caption = #1042#1099#1073#1086#1088
      OnClick = TVDblClick
    end
    object popTvDetails: TMenuItem
      Caption = #1042#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074#1080#1076#1072
      Hint = #1042#1082#1083' / '#1054#1090#1082#1083' '#1101#1082#1088#1072#1085' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1077#1081
      RadioItem = True
      OnClick = popTvDetailsClick
    end
    object popTvFullExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTvFullExpandClick
    end
    object popTvFullCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTvFullCollapseClick
    end
    object popTvExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = popTvExitClick
    end
    object popTvKtoPapa: TMenuItem
      Caption = #1050#1090#1086' '#1087#1072#1087#1072'?'
      OnClick = popTvKtoPapaClick
    end
    object popTvKtoDeti: TMenuItem
      Caption = #1050#1090#1086' '#1076#1077#1090#1080'?'
      OnClick = popTvKtoDetiClick
    end
    object popTvSep1: TMenuItem
      Caption = '-'
    end
    object popTvEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popTvEdtClick
    end
    object popTvAddInRoot: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1088#1077#1085#1100
      Hint = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1076#1086#1073#1072#1074#1083#1103#1077#1090#1089#1103' '#1074' '#1082#1086#1088#1077#1085#1100' '#1087#1086#1083#1077#1076#1085#1080#1084
      Visible = False
      OnClick = popTvAddInRootClick
    end
    object popTvAddFirstInCurrent: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1074#1099#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
      Visible = False
      OnClick = popTvAddFirstInCurrentClick
    end
    object popTvAddLastInCurrent: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
      OnClick = popTvAddLastInCurrentClick
    end
    object popTvInsertBeforeCurrent: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1091#1079#1083#1072
      OnClick = popTvInsertBeforeCurrentClick
    end
    object popTvAddInNode: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1085#1091#1090#1088#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1091#1079#1083#1072
      Visible = False
      OnClick = popTvAddInNodeClick
    end
    object popTvMoveInTo: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074#1085#1091#1090#1088#1100' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
      Hint = #1059#1079#1077#1083'-'#1087#1088#1080#1077#1084#1085#1080#1082' '#1076#1086#1083#1078#1077#1085' '#1091#1078#1077' '#1089#1091#1097#1077#1089#1090#1074#1086#1074#1072#1090#1100
      OnClick = popTvMoveInToClick
    end
    object popTvMoveToBefore: TMenuItem
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072' ('#1085#1072' '#1090#1086#1084' '#1078#1077' '#1091#1088#1086#1074#1085#1077')'
      OnClick = popTvMoveToBeforeClick
    end
    object popTvDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popTvDelClick
    end
    object popTvSep2: TMenuItem
      Caption = '-'
    end
    object popTvSaveToFile: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083' ...'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1074' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083' ...'
      Visible = False
      OnClick = popTvSaveToFileClick
    end
  end
  object SaveDialog: TSaveDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 104
    Top = 48
  end
  object OpenDialog: TOpenDialog
    Left = 144
    Top = 48
  end
  object qryTmp: TQuery
    Left = 32
    Top = 200
  end
  object qryVidN: TQuery
    CachedUpdates = True
    AfterPost = qryVidNAfterPost
    AfterDelete = qryVidNAfterPost
    OnCalcFields = qryVidNCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from Z_KdVidN'
      'order by AIndx')
    UpdateObject = updVidN
    Left = 25
    Top = 112
    object qryVidNNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KDVID.NR'
    end
    object qryVidNVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_KDVIDN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVidNSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Origin = 'DbMain.Z_KDVID.SHVIDN'
      Size = 15
    end
    object qryVidNNMVIDN: TStringField
      FieldName = 'NMVIDN'
      Origin = 'DbMain.Z_KDVID.NMVIDN'
      Size = 64
    end
    object qryVidNAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.Z_KDVID.AINDX'
    end
    object qryVidNOLDKDVIDN: TSmallintField
      DisplayLabel = #1042#1080#1076#1057#1090
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_KDVID.OLDKDVIDN'
    end
    object qryVidNPINDX: TSmallintField
      FieldName = 'PINDX'
      Origin = 'DbMain.Z_KDVID.PINDX'
    end
    object qryVidNLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.Z_KDVID.LVL'
    end
    object qryVidNINDX: TSmallintField
      FieldName = 'INDX'
      Origin = 'DbMain.Z_KDVID.INDX'
    end
    object qryVidNHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.Z_KDVID.HSCH'
      FixedChar = True
      Size = 1
    end
    object qryVidNNOSHOW: TStringField
      FieldName = 'NOSHOW'
      Origin = 'DbMain.Z_KDVID.NOSHOW'
      Size = 1
    end
    object qryVidNZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.Z_KDVIDN.ZP13'
      Size = 1
    end
    object qryVidNOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.Z_KDVIDN.OTP'
      Size = 1
    end
    object qryVidNBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.Z_KDVIDN.BLN'
      Size = 1
    end
    object qryVidNDKR: TStringField
      FieldName = 'DKR'
      Origin = 'DbMain.Z_KDVIDN.DKR'
      Size = 1
    end
    object qryVidNOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.Z_KDVIDN.OTPUSKN'
      Size = 1
    end
    object qryVidNBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.Z_KDVIDN.BOLNIC'
      Size = 1
    end
    object qryVidNSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.Z_KDVIDN.SPRM'
      Size = 1
    end
    object qryVidNCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.Z_KDVIDN.CPRM'
      Size = 1
    end
    object qryVidNDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.Z_KDVIDN.DETI'
      Size = 1
    end
    object qryVidNDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.Z_KDVIDN.DETIM'
      Size = 1
    end
    object qryVidNDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.Z_KDVIDN.DETIK'
      Size = 1
    end
    object qryVidNDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.Z_KDVIDN.DETIG'
      Size = 1
    end
    object qryVidNIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.Z_KDVIDN.IND'
      Size = 1
    end
    object qryVidNDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.Z_KDVIDN.DHD'
      Size = 1
    end
    object qryVidNOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.Z_KDVIDN.OKLFND'
      Size = 1
    end
    object qryVidNCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.Z_KDVIDN.CBUDG'
      Size = 1
    end
    object qryVidNSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_KDVIDN.SOVM'
      Size = 1
    end
    object qryVidNSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.Z_KDVIDN.SPOV'
      Size = 1
    end
    object qryVidNSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.Z_KDVIDN.SNDB'
      Size = 1
    end
    object qryVidNSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.Z_KDVIDN.SPDN'
      Size = 1
    end
    object qryVidNSWSB: TStringField
      FieldName = 'SWSB'
      Origin = 'DbMain.Z_KDVIDN.SWSB'
      Size = 1
    end
    object qryVidNSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.Z_KDVIDN.SPRF'
      Size = 1
    end
    object qryVidNSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.Z_KDVIDN.SSRK'
      FixedChar = True
      Size = 1
    end
    object qryVidNSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.Z_KDVIDN.SPENS'
      Size = 1
    end
    object qryVidNSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.Z_KDVIDN.SALIM'
      Size = 1
    end
    object qryVidNCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.Z_KDVIDN.CNDB'
      Size = 1
    end
    object qryVidNSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.Z_KDVIDN.SSOCSTRAH'
      Size = 1
    end
    object qryVidNSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.Z_KDVIDN.SBZR'
      Size = 1
    end
    object qryVidNLITTLEHLP: TStringField
      FieldName = 'LITTLEHLP'
      Origin = 'DbMain.Z_KDVIDN.LITTLEHLP'
      Size = 255
    end
    object qryVidNKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_KDVIDN.KDSPZ'
    end
    object qryVidNOLDSZATR: TStringField
      FieldName = 'OLDSZATR'
      Origin = 'DbMain.Z_KDVIDN.OLDSZATR'
      Size = 6
    end
    object qryVidNSpZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'SpZ'
      KeyFields = 'KDSPZ'
      Size = 12
      Calculated = True
    end
    object qryVidNSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.Z_KDVIDN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryVidNSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.Z_KDVIDN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryVidNSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.Z_KDVIDN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryVidNSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.Z_KDVIDN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryVidNKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
      Origin = 'DbMain.Z_KDVIDN.KDSCHDT'
    end
    object qryVidNSchDt: TStringField
      FieldKind = fkCalculated
      FieldName = 'SchDt'
      Size = 10
      Calculated = True
    end
    object qryVidNKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
      Origin = 'DbMain.Z_KDVIDN.KDSCHKT'
    end
    object qryVidNSchKt: TStringField
      FieldKind = fkCalculated
      FieldName = 'SchKt'
      Size = 10
      Calculated = True
    end
    object qryVidNKEKV: TStringField
      FieldName = 'KEKV'
      Origin = 'DbMain.Z_KDVIDN.KEKV'
      FixedChar = True
      Size = 4
    end
    object qryVidNNDBE: TStringField
      FieldName = 'NDBE'
      Origin = 'DbMain.Z_KDVIDN.NDBE'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcVidN: TDataSource
    DataSet = qryVidN
    Left = 33
    Top = 120
  end
  object updVidN: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_KdVidN'
      'set'
      '  VIDN = :VIDN,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  SHVIDN = :SHVIDN,'
      '  NMVIDN = :NMVIDN,'
      '  AINDX = :AINDX,'
      '  PINDX = :PINDX,'
      '  LVL = :LVL,'
      '  INDX = :INDX,'
      '  HSCH = :HSCH,'
      '  NDBE = :NDBE,'
      '  NOSHOW = :NOSHOW,'
      '  ZP13 = :ZP13,'
      '  OTP = :OTP,'
      '  BLN = :BLN,'
      '  DKR = :DKR,'
      '  OTPUSKN = :OTPUSKN,'
      '  BOLNIC = :BOLNIC,'
      '  SPRM = :SPRM,'
      '  CPRM = :CPRM,'
      '  SSRK = :SSRK,'
      '  DETI = :DETI,'
      '  DETIM = :DETIM,'
      '  DETIK = :DETIK,'
      '  DETIG = :DETIG,'
      '  IND = :IND,'
      '  DHD = :DHD,'
      '  OKLFND = :OKLFND,'
      '  CBUDG = :CBUDG,'
      '  SNDB = :SNDB,'
      '  SPDN = :SPDN,'
      '  SWSB = :SWSB,'
      '  SPRF = :SPRF,'
      '  SPENS = :SPENS,'
      '  SALIM = :SALIM,'
      '  CNDB = :CNDB,'
      '  SSOCSTRAH = :SSOCSTRAH,'
      '  SBZR = :SBZR,'
      '  LITTLEHLP = :LITTLEHLP,'
      '  KDSPZ = :KDSPZ,'
      '  OLDSZATR = :OLDSZATR,'
      '  SP_PF = :SP_PF,'
      '  SP_FSTVP = :SP_FSTVP,'
      '  SP_FSNV = :SP_FSNV,'
      '  SP_FZ = :SP_FZ,'
      '  SOVM = :SOVM,'
      '  SPOV = :SPOV,'
      '  KEKV = :KEKV,'
      '  KDSCHDT = :KDSCHDT,'
      '  KDSCHKT = :KDSCHKT'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_KdVidN'
      
        '  (VIDN, OLDKDVIDN, SHVIDN, NMVIDN, AINDX, PINDX, LVL, INDX, HSC' +
        'H, NDBE, '
      
        '   NOSHOW, ZP13, OTP, BLN, DKR, OTPUSKN, BOLNIC, SPRM, CPRM, SSR' +
        'K, '
      'DETI, '
      
        '   DETIM, DETIK, DETIG, IND, DHD, OKLFND, CBUDG, SNDB, SPDN, SWS' +
        'B, '
      'SPRF, '
      
        '   SPENS, SALIM, CNDB, SSOCSTRAH, SBZR, LITTLEHLP, KDSPZ, OLDSZA' +
        'TR, '
      'SP_PF, '
      '   SP_FSTVP, SP_FSNV, SP_FZ, SOVM, SPOV, KEKV, KDSCHDT, KDSCHKT)'
      'values'
      
        '  (:VIDN, :OLDKDVIDN, :SHVIDN, :NMVIDN, :AINDX, :PINDX, :LVL, :I' +
        'NDX, :HSCH, '
      
        '   :NDBE, :NOSHOW, :ZP13, :OTP, :BLN, :DKR, :OTPUSKN, :BOLNIC, :' +
        'SPRM, '
      ':CPRM, '
      
        '   :SSRK, :DETI, :DETIM, :DETIK, :DETIG, :IND, :DHD, :OKLFND, :C' +
        'BUDG, :SNDB, '
      
        '   :SPDN, :SWSB, :SPRF, :SPENS, :SALIM, :CNDB, :SSOCSTRAH, :SBZR' +
        ', '
      ':LITTLEHLP, '
      
        '   :KDSPZ, :OLDSZATR, :SP_PF, :SP_FSTVP, :SP_FSNV, :SP_FZ, :SOVM' +
        ', :SPOV, '
      '   :KEKV, :KDSCHDT, :KDSCHKT)')
    DeleteSQL.Strings = (
      'delete from Z_KdVidN'
      'where'
      '  NR = :OLD_NR')
    Left = 41
    Top = 128
  end
  object cdsFilter: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'VidFrom'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'VidTo'
        DataType = ftString
        Size = 4
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 280
  end
end
