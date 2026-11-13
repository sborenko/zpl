object FormShowOtp: TFormShowOtp
  Left = 317
  Top = 162
  Width = 665
  Height = 562
  ActiveControl = dbgrVOtp
  BorderIcons = [biSystemMenu]
  Caption = 'FormShowOtp'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 665
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
  object Splitter2: TSplitter
    Left = 257
    Top = 29
    Height = 506
    Beveled = True
    Color = clTeal
    MinSize = 255
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      657
      29)
    object sBtnCurMes: TSpeedButton
      Left = 102
      Top = 2
      Width = 115
      Height = 25
      GroupIndex = 1
      Down = True
      Caption = #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1080#1081
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      Spacing = 1
      OnClick = sBtnCurMesClick
    end
    object sBtnAllMes: TSpeedButton
      Left = 4
      Top = 2
      Width = 95
      Height = 25
      GroupIndex = 1
      Caption = #1042#1089#1077' '#1084#1077#1089#1103#1094#1099
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
        FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
        FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
        FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
        00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
        55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
        5555777577775755555550FBFB0555555555575FFF7555555555570000755555
        5555557777555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = sBtnAllMesClick
    end
    object LabelFilter: TLabel
      Left = 248
      Top = 8
      Width = 48
      Height = 13
      Caption = 'LabelFilter'
    end
    object bBtnClose: TBitBtn
      Left = 584
      Top = 2
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 29
    Width = 257
    Height = 506
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MaxWidth = 370
    Constraints.MinWidth = 255
    TabOrder = 1
    object dbgrVOtp: TDBGrid
      Left = 0
      Top = 0
      Width = 257
      Height = 506
      Hint = #1043#1088#1072#1092#1080#1082' '#1086#1090#1087#1091#1089#1082#1086#1074
      Align = alClient
      Color = clCream
      DataSource = dsrcVOtp
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = popVOtp
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrVOtpDrawColumnCell
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'DTPROC'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FamIO'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABN'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShVidN'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTBEG'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNTDAYS'
          Width = 29
          Visible = True
        end>
    end
  end
  object PanelRight: TPanel
    Left = 260
    Top = 29
    Width = 397
    Height = 506
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelRight'
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 0
      Top = 329
      Width = 397
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clTeal
      ParentColor = False
    end
    object dbgrROtp: TDBGrid
      Left = 0
      Top = 163
      Width = 397
      Height = 166
      Hint = #1057#1091#1084#1084#1099' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
      Align = alTop
      Color = clCream
      DataSource = dsrcROtp
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'ZAMESGOD'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SMOKLADA'
          Title.Caption = #1054#1082#1083#1072#1076
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOEFZP'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SMZARABOTKA'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNTDAYS'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SmZpKoef'
          Visible = True
        end>
    end
    object dbgrOtkl: TDBGrid
      Left = 0
      Top = 332
      Width = 397
      Height = 174
      Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' ('#1090#1072#1073#1083#1080#1094#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081')'
      Align = alClient
      Color = clCream
      DataSource = dsrcOtkl
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'VIDN'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPROC'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZAMESGOD'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAS'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PDN'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShObj'
          Width = 2
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShKatP'
          Width = 3
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Spz'
          Width = 2
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Width = 7
          Visible = True
        end>
    end
    object PanelRTop: TPanel
      Left = 0
      Top = 0
      Width = 397
      Height = 163
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PanelRTop'
      TabOrder = 2
      OnResize = PanelLeftResize
      object PanelKart: TPanel
        Left = 25
        Top = 3
        Width = 296
        Height = 156
        BevelInner = bvLowered
        TabOrder = 0
        object Label3: TLabel
          Left = 26
          Top = 70
          Width = 55
          Height = 13
          Caption = #1055#1088#1080#1082#1072#1079' '#8470' '
          FocusControl = dbeNrPrik
        end
        object Label4: TLabel
          Left = 206
          Top = 70
          Width = 11
          Height = 13
          Caption = #1086#1090
          FocusControl = dbeDtPrik
        end
        object Label5: TLabel
          Left = 8
          Top = 91
          Width = 37
          Height = 13
          Caption = #1053#1072#1095#1072#1083#1086
          FocusControl = dbeDtBeg
        end
        object Label6: TLabel
          Left = 121
          Top = 91
          Width = 27
          Height = 13
          Caption = #1044#1085#1077#1081
          FocusControl = dbeCntDays
        end
        object Label7: TLabel
          Left = 183
          Top = 91
          Width = 34
          Height = 13
          Caption = #1054#1082#1086#1085#1095'.'
          FocusControl = dbeDtEnd
        end
        object Label8: TLabel
          Left = 26
          Top = 49
          Width = 19
          Height = 13
          Caption = #1042#1080#1076
          FocusControl = dbeVidN
        end
        object Label9: TLabel
          Left = 203
          Top = 49
          Width = 50
          Height = 13
          Caption = #1055#1088#1086#1094'.'#1086#1087#1083'.'
          FocusControl = dbeProcOpl
        end
        object Label10: TLabel
          Left = 8
          Top = 133
          Width = 63
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          FocusControl = dbeNotes
        end
        object LabelAlgRasch: TLabel
          Left = 8
          Top = 19
          Width = 283
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'LabelAlgRasch'
          Transparent = True
        end
        object LabelRK: TLabel
          Left = 8
          Top = 31
          Width = 283
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'LabelRK'
          Transparent = True
        end
        object DBText1: TDBText
          Left = 8
          Top = 5
          Width = 283
          Height = 17
          Alignment = taCenter
          DataField = 'FamIO'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 8
          Top = 112
          Width = 49
          Height = 13
          Caption = #1057#1088#1044#1085#1077#1074#1085'.'
          FocusControl = dbeSmSrdn
        end
        object Label2: TLabel
          Left = 127
          Top = 112
          Width = 90
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
          FocusControl = dbeSmOtp
        end
        object dbtSpecNR: TDBText
          Left = 224
          Top = 5
          Width = 65
          Height = 17
          Hint = 'Spec_NR'
          Alignment = taRightJustify
          DataField = 'SPEC_NR'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Visible = False
        end
        object dbeDtPrik: TDBEdit
          Left = 221
          Top = 67
          Width = 70
          Height = 21
          Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
          Color = clCream
          DataField = 'DTPRIK'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object dbeNrPrik: TDBEdit
          Left = 84
          Top = 67
          Width = 65
          Height = 21
          Hint = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
          Color = clCream
          DataField = 'NRPRIK'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object dbeProcOpl: TDBEdit
          Left = 254
          Top = 46
          Width = 37
          Height = 21
          Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099
          Color = clCream
          DataField = 'PROCOPL'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object dbeShVidN: TDBEdit
          Left = 85
          Top = 46
          Width = 114
          Height = 21
          Hint = #1064#1080#1092#1088' '#1074#1080#1076#1072
          Color = clCream
          DataField = 'ShVidN'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
        end
        object dbeVidN: TDBEdit
          Left = 48
          Top = 46
          Width = 36
          Height = 21
          Hint = #1050#1086#1076' '#1074#1080#1076#1072
          Color = clCream
          DataField = 'VIDN'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object dbeAlgRasch: TDBEdit
          Left = 237
          Top = 19
          Width = 19
          Height = 21
          Color = clCream
          DataField = 'ALGRASCH'
          DataSource = dsrcVOtp
          TabOrder = 0
          Visible = False
        end
        object dbeRK: TDBEdit
          Left = 261
          Top = 19
          Width = 17
          Height = 21
          Color = clCream
          DataField = 'RK'
          DataSource = dsrcVOtp
          TabOrder = 1
          Visible = False
        end
        object dbeDtBeg: TDBEdit
          Left = 48
          Top = 88
          Width = 70
          Height = 21
          Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1087#1091#1089#1082#1072
          Color = clCream
          DataField = 'DTBEG'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object dbeCntDays: TDBEdit
          Left = 151
          Top = 88
          Width = 29
          Height = 21
          Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081
          Color = clCream
          DataField = 'CNTDAYS'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object dbeDtEnd: TDBEdit
          Left = 221
          Top = 88
          Width = 70
          Height = 21
          Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1090#1087#1091#1089#1082#1072
          Color = clCream
          DataField = 'DTEND'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object dbeNotes: TDBEdit
          Left = 80
          Top = 130
          Width = 211
          Height = 21
          Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' '#1085#1072' '#1079#1072#1084#1077#1090#1082#1091
          Color = clCream
          DataField = 'NOTES'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object dbeSmSrdn: TDBEdit
          Left = 64
          Top = 109
          Width = 54
          Height = 21
          Hint = #1057#1091#1084#1084#1072' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1075#1086
          DataField = 'SMSRDN'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object dbeSmOtp: TDBEdit
          Left = 221
          Top = 109
          Width = 70
          Height = 21
          Hint = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
          DataField = 'SMOTP'
          DataSource = dsrcVOtp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
        end
      end
    end
  end
  object qryVOtp: TQuery
    OnCalcFields = qryVOtpCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_VOtp'
      'where not Spec_NR is Null')
    Left = 72
    Top = 144
    object qryVOtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VOTP.NR'
    end
    object qryVOtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VOTP.KDSPS'
    end
    object qryVOtpVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VOTP.VIDN'
      FixedChar = True
      Size = 3
    end
    object qryVOtpShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryVOtpDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VOTP.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryVOtpTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VOTP.TABN'
    end
    object qryVOtpALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VOTP.ALGRASCH'
    end
    object qryVOtpRK: TStringField
      FieldName = 'RK'
      Origin = 'DbMain.Z_VOTP.RK'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNRPRIK: TStringField
      FieldName = 'NRPRIK'
      Origin = 'DbMain.Z_VOTP.NRPRIK'
      Size = 15
    end
    object qryVOtpDTPRIK: TDateTimeField
      FieldName = 'DTPRIK'
      Origin = 'DbMain.Z_VOTP.DTPRIK'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVOtpDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VOTP.DTBEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVOtpCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VOTP.CNTDAYS'
    end
    object qryVOtpDTEND: TDateTimeField
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VOTP.DTEND'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVOtpCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VOTP.CNTCHAS'
    end
    object qryVOtpPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VOTP.PROCOPL'
    end
    object qryVOtpKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VOTP.KDOBJ'
    end
    object qryVOtpKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VOTP.KDKATP'
    end
    object qryVOtpNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VOTP.NOTES'
      Size = 35
    end
    object qryVOtpSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VOTP.SMSRDN'
    end
    object qryVOtpSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VOTP.SPEC_NR'
    end
    object qryVOtpSMOTP: TFloatField
      FieldName = 'SMOTP'
      Origin = 'DbMain.Z_VOTP.SMOTP'
    end
    object qryVOtpFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryVOtpKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VOTP.KDSPZ'
    end
  end
  object dsrcVOtp: TDataSource
    DataSet = qryVOtp
    OnDataChange = dsrcVOtpDataChange
    Left = 88
    Top = 152
  end
  object qryROtp: TQuery
    OnCalcFields = qryROtpCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcVOtp
    SQL.Strings = (
      'Select * from Z_ROtp'
      'where Spec_NR = :Spec_NR'
      'order by ZaMesGod')
    Left = 280
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryROtpNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
      Origin = 'DbMain.Z_ROTP.NR'
    end
    object qryROtpSPEC_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_ROTP.SPEC_NR'
    end
    object qryROtpZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      DisplayWidth = 13
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_ROTP.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryROtpSMZARABOTKA: TFloatField
      DisplayLabel = #1057#1091#1084#1047#1072#1088#1072#1073#1086#1090#1082#1072
      DisplayWidth = 16
      FieldName = 'SMZARABOTKA'
      Origin = 'DbMain.Z_ROTP.SMZARABOTKA'
      DisplayFormat = '#.00'
    end
    object qryROtpKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090' '#1079'/'#1087#1083
      DisplayWidth = 12
      FieldName = 'KOEFZP'
      Origin = 'DbMain.Z_ROTP.KOEFZP'
    end
    object qryROtpCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      DisplayWidth = 12
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_ROTP.CNTDAYS'
    end
    object qryROtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_ROTP.KDSPS'
    end
    object qryROtpSMOKLADA: TFloatField
      DisplayLabel = #1057#1091#1084#1055#1086#1054#1082#1083#1072#1076#1091
      FieldName = 'SMOKLADA'
      Origin = 'DbMain.Z_ROTP.SMOKLADA'
      DisplayFormat = '#.00'
    end
    object qryROtpSMDSREDN: TFloatField
      DisplayLabel = #1057#1091#1084#1057#1088#1077#1076#1085
      FieldName = 'SMDSREDN'
      Origin = 'DbMain.Z_ROTP.SMDSREDN'
      DisplayFormat = '#.00'
    end
    object qryROtpSmZpKoef: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090
      FieldKind = fkCalculated
      FieldName = 'SmZpKoef'
      DisplayFormat = '#.00'
      Calculated = True
    end
  end
  object dsrcROtp: TDataSource
    DataSet = qryROtp
    Left = 296
    Top = 288
  end
  object qryOtkl: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcVOtp
    SQL.Strings = (
      'select * from z_otkl'
      'where TabN = :TabN and Spec_NR = :Spec_NR'
      'order by ZaMesGod')
    Left = 281
    Top = 413
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TabN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryOtklDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryOtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object qryOtklShObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 15
      Lookup = True
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object qryOtklShKatP: TStringField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 15
      Lookup = True
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 13
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryOtklKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 3
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryOtklSpz: TStringField
      DisplayLabel = #1064#1055#1047
      FieldKind = fkLookup
      FieldName = 'Spz'
      LookupDataSet = DmMain.qrySBU_LU
      LookupKeyFields = 'KDSCH'
      LookupResultField = 'SCHBU'
      KeyFields = 'KDSPZ'
      Size = 10
      Lookup = True
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 296
    Top = 432
  end
  object popVOtp: TPopupMenu
    OnPopup = popVOtpPopup
    Left = 16
    Top = 144
    object popVOtpHead: TMenuItem
      Caption = '== '#1054#1090#1087#1091#1089#1082#1072' =='
      Enabled = False
    end
    object popVOtpEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16453
      OnClick = popVOtpEdtClick
    end
    object popVOtpAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16462
      OnClick = popVOtpAddClick
    end
    object popVOtpDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16469
      OnClick = popVOtpDelClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popSortTabNMes: TMenuItem
        Caption = '- '#1090#1072#1073'. '#1085#1086#1084#1077#1088', '#1084#1077#1089#1103#1094
        Checked = True
        OnClick = popSortTabNMesClick
      end
      object popSortMesTabN: TMenuItem
        Caption = '- '#1084#1077#1089#1103#1094', '#1090#1072#1073'. '#1085#1086#1084#1077#1088
        OnClick = popSortMesTabNClick
      end
    end
    object popFilter: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088' ...'
      object popFilterByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = popFilterByTabNClick
      end
      object popFilterOff: TMenuItem
        Caption = '- '#1073#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        Checked = True
        OnClick = popFilterOffClick
      end
    end
  end
  object qryTmp: TQuery
    Left = 144
    Top = 221
  end
end
