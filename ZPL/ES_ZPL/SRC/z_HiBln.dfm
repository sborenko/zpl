object FormHiBln: TFormHiBln
  Left = 238
  Top = 245
  Width = 789
  Height = 637
  ActiveControl = dbgrVBln
  BorderIcons = [biSystemMenu]
  Caption = 'FormHiBln'
  Color = clBtnFace
  Constraints.MaxHeight = 750
  Constraints.MaxWidth = 1000
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
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
    Left = 286
    Top = 30
    Height = 580
    Beveled = True
    Color = clGreen
    MinSize = 100
    ParentColor = False
  end
  object PanelControl: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      781
      30)
    object sBtnPrtReeBln: TSpeedButton
      Left = 636
      Top = 2
      Width = 70
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1077#1077#1089#1090#1088#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      Visible = False
    end
    object bBtnClose: TBitBtn
      Left = 708
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
  object dbgrVBln: TDBGrid
    Left = 0
    Top = 30
    Width = 286
    Height = 580
    Hint = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1083#1080#1089#1090#1082#1080
    Align = alLeft
    Color = clCream
    DataSource = dsrcVBln
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrVBlnDrawColumnCell
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRLIST'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShVidN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNTDAYS'
        Width = 23
        Visible = True
      end>
  end
  object PanelBln: TPanel
    Left = 289
    Top = 30
    Width = 492
    Height = 580
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinWidth = 355
    TabOrder = 2
    object PanelBlnDetails: TPanel
      Left = 0
      Top = 0
      Width = 492
      Height = 177
      Align = alTop
      BevelOuter = bvNone
      Constraints.MinWidth = 350
      TabOrder = 0
      OnResize = PanelBlnDetailsResize
      object GroupBox1: TGroupBox
        Left = 8
        Top = 0
        Width = 417
        Height = 169
        TabOrder = 0
        object LblNrList: TLabel
          Left = 8
          Top = 19
          Width = 43
          Height = 13
          Caption = #8470' '#1083#1080#1089#1090#1072
          FocusControl = dbeNrList
        end
        object LblDtBeg: TLabel
          Left = 8
          Top = 67
          Width = 64
          Height = 13
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
          FocusControl = dbeDtBeg
        end
        object LblDays: TLabel
          Left = 274
          Top = 67
          Width = 27
          Height = 13
          Caption = #1044#1085#1077#1081
          FocusControl = dbeCntDays
        end
        object LblDtEnd: TLabel
          Left = 152
          Top = 67
          Width = 34
          Height = 13
          Caption = #1054#1082#1086#1085#1095'.'
          FocusControl = dbeDtEnd
        end
        object LblVidN: TLabel
          Left = 200
          Top = 19
          Width = 19
          Height = 13
          Caption = #1042#1080#1076
          FocusControl = dbeVidN
        end
        object LblPercent: TLabel
          Left = 152
          Top = 91
          Width = 50
          Height = 13
          Caption = '% '#1054#1087#1083#1072#1090#1099
          FocusControl = dbeProcOpl
        end
        object LblNotes: TLabel
          Left = 8
          Top = 139
          Width = 63
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          FocusControl = dbeNotes
        end
        object LblAverage: TLabel
          Left = 8
          Top = 91
          Width = 55
          Height = 13
          Caption = #1057#1088#1077#1076#1085#1077' '#1076#1085'.'
        end
        object LblSumTotal: TLabel
          Left = 259
          Top = 91
          Width = 70
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1086#1073#1097#1072#1103
        end
        object dbtOldKdVidN: TDBText
          Left = 276
          Top = 19
          Width = 28
          Height = 17
          Hint = #1057#1090#1072#1088#1099#1081' '#1074#1080#1076
          DataField = 'OLDKDVIDN'
          DataSource = dsrcVBln
          ParentShowHint = False
          ShowHint = True
        end
        object LabelPredDt: TLabel
          Left = 208
          Top = 43
          Width = 11
          Height = 13
          Caption = #1086#1090
          FocusControl = dbePredDt
        end
        object LabelPredNr: TLabel
          Left = 8
          Top = 43
          Width = 92
          Height = 13
          Caption = #1055#1088#1086#1076#1086#1083#1078'.'#1083#1080#1089#1090#1072' '#8470
          FocusControl = dbePredNr
        end
        object LblStageCommon: TLabel
          Left = 8
          Top = 112
          Width = 62
          Height = 13
          Caption = #1057#1090#1072#1078' '#1086#1073#1097#1080#1081
        end
        object Lbl12Mnth: TLabel
          Left = 152
          Top = 112
          Width = 54
          Height = 13
          Caption = #1047#1072' 12 '#1084#1077#1089'.'
        end
        object DBChBoxFirst5: TDBCheckBox
          Left = 8
          Top = 42
          Width = 206
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          Caption = #1055#1077#1088#1074#1099#1077' 5 '#1076#1085#1077#1081' '#1079#1072' '#1089#1095#1077#1090' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
          Color = clBtnFace
          DataField = 'DAY5FIRST'
          DataSource = dsrcVBln
          ParentColor = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbeNrList: TDBEdit
          Left = 64
          Top = 16
          Width = 81
          Height = 21
          Color = clCream
          DataField = 'NRLIST'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbeDtBeg: TDBEdit
          Left = 83
          Top = 64
          Width = 62
          Height = 21
          Color = clCream
          DataField = 'DTBEG'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object dbeCntDays: TDBEdit
          Left = 306
          Top = 64
          Width = 37
          Height = 21
          Hint = #1050'-'#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1090#1076#1085#1077#1081
          Color = clCream
          DataField = 'CNTDAYS'
          DataSource = dsrcVBln
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
        object dbeDtEnd: TDBEdit
          Left = 197
          Top = 64
          Width = 62
          Height = 21
          Color = clCream
          DataField = 'DTEND'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object dbeVidN: TDBEdit
          Left = 230
          Top = 16
          Width = 39
          Height = 21
          Color = clCream
          DataField = 'VIDN'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object dbeProcOpl: TDBEdit
          Left = 211
          Top = 88
          Width = 36
          Height = 21
          Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099
          Color = clCream
          DataField = 'PROCOPL'
          DataSource = dsrcVBln
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
        object dbeNotes: TDBEdit
          Left = 83
          Top = 136
          Width = 318
          Height = 21
          Color = clCream
          DataField = 'NOTES'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
        end
        object dbeShVidN: TDBEdit
          Left = 312
          Top = 16
          Width = 97
          Height = 21
          Color = clCream
          DataField = 'ShVidN'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object dbeSmSrdn: TDBEdit
          Left = 83
          Top = 88
          Width = 52
          Height = 21
          Hint = #1055#1088#1080#1085#1103#1090#1072#1103' '#1082' '#1088#1072#1089#1095#1077#1090' '#1089#1091#1084#1084#1072' '#1089#1088#1077#1076#1085#1077#1075#1086
          Color = clCream
          DataField = 'SMSRDN'
          DataSource = dsrcVBln
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
        object dbeSmBln: TDBEdit
          Left = 340
          Top = 88
          Width = 67
          Height = 21
          Hint = #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1084#1091
          Color = clCream
          DataField = 'SMBLN'
          DataSource = dsrcVBln
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
        object dbePredNr: TDBEdit
          Left = 112
          Top = 40
          Width = 81
          Height = 21
          TabStop = False
          Color = clCream
          DataField = 'PredNR'
          DataSource = dsrcVBln
          TabOrder = 3
        end
        object dbePredDt: TDBEdit
          Left = 230
          Top = 40
          Width = 86
          Height = 21
          TabStop = False
          Color = clCream
          DataField = 'PredDt'
          DataSource = dsrcVBln
          TabOrder = 4
        end
        object DBEStgCmn: TDBEdit
          Left = 83
          Top = 112
          Width = 57
          Height = 21
          Color = clCream
          DataField = 'STGCMN'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
        end
        object DBEStg12: TDBEdit
          Left = 211
          Top = 112
          Width = 57
          Height = 21
          Color = clCream
          DataField = 'STG12'
          DataSource = dsrcVBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 177
      Width = 492
      Height = 403
      ActivePage = tsNew
      Align = alClient
      Style = tsButtons
      TabOrder = 1
      object tsNew: TTabSheet
        Caption = 'tsNew'
        object Splitter1: TSplitter
          Left = 0
          Top = 248
          Width = 484
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Color = clGreen
          ParentColor = False
        end
        object dbgrRBln: TDBGrid
          Left = 0
          Top = 0
          Width = 484
          Height = 248
          Hint = #1057#1091#1084#1084#1099' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
          Align = alClient
          Color = clCream
          DataSource = dsrcRBln
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
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
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SMZARABOTKA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOEFZP'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNTDAYS'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmZpKoef'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sm_Svm'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SumSupplCoeff'
              Title.Caption = #1057#1086#1074#1084'.'#1079#1072#1095#1105#1090
              Visible = True
            end>
        end
        object dbgrOtkl: TDBGrid
          Left = 0
          Top = 251
          Width = 484
          Height = 121
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' ('#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081')'
          Align = alBottom
          Color = clCream
          DataSource = dsrcOtkl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
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
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHVIDN'
              Width = 69
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
              FieldName = 'ShObj'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShKatP'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCHBU'
              Width = 23
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Width = 14
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 40
              Visible = True
            end>
        end
      end
      object tsOld: TTabSheet
        Caption = 'tsOld'
        ImageIndex = 1
        object LblDescription2: TLabel
          Left = 0
          Top = 359
          Width = 484
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = 
            #1090#1086#1083#1100#1082#1086' '#1074' '#1090#1072#1082#1086#1084' '#1074#1080#1076#1077': '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1084' '#1080#1079' '#1092#1072#1081#1083#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1079#1072 +
            ' '#1075#1086#1076'.'
        end
        object LblDescription1: TLabel
          Left = 0
          Top = 346
          Width = 484
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1080#1079' '#1089#1090#1072#1088#1086#1081' '#1041#1072#1079#1099' '#1044#1072#1085#1085#1099#1093'. '#1048#1084#1077#1077#1090#1089#1103' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1087#1086#1082#1072#1079#1072#1090#1100
        end
        object dbgrNuOld: TDBGrid
          Left = 0
          Top = 0
          Width = 484
          Height = 346
          Align = alClient
          Color = clBtnFace
          DataSource = dsrcNuOld
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'KDSPS'
              Width = 21
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
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDKDVIDN'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPROC'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAMESGOD'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Width = 12
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MYNOTES'
              Width = 66
              Visible = True
            end>
        end
      end
    end
  end
  object qryVBln: TQuery
    OnCalcFields = qryVBlnCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_VBln'
      'where tabn = 1520'
      '')
    Left = 152
    Top = 88
    object qryVBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object qryVBlnKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VBLN.KDSPS'
    end
    object qryVBlnDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VBLN.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryVBlnTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VBLN.TABN'
    end
    object qryVBlnALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VBLN.ALGRASCH'
    end
    object qryVBlnNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VBLN.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVBlnNRLIST: TStringField
      DisplayLabel = #8470#1083#1080#1089#1090#1082#1072
      FieldName = 'NRLIST'
      Origin = 'DbMain.Z_VBLN.NRLIST'
      Size = 15
    end
    object qryVBlnDTLIST: TDateTimeField
      FieldName = 'DTLIST'
      Origin = 'DbMain.Z_VBLN.DTLIST'
    end
    object qryVBlnDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VBLN.DTBEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVBlnDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VBLN.DTEND'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVBlnCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VBLN.CNTDAYS'
    end
    object qryVBlnVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VBLN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVBlnShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryVBlnOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_VBLN.OLDKDVIDN'
    end
    object qryVBlnCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VBLN.CNTCHAS'
    end
    object qryVBlnPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VBLN.PROCOPL'
    end
    object qryVBlnKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VBLN.KDOBJ'
    end
    object qryVBlnKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VBLN.KDKATP'
    end
    object qryVBlnKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VBLN.KDSPZ'
    end
    object qryVBlnNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VBLN.NOTES'
      Size = 35
    end
    object qryVBlnSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VBLN.SMSRDN'
    end
    object qryVBlnSMBLN: TFloatField
      FieldName = 'SMBLN'
      Origin = 'DbMain.Z_VBLN.SMBLN'
    end
    object qryVBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VBLN.SPEC_NR'
    end
    object qryVBlnDAY5FIRST: TStringField
      FieldName = 'DAY5FIRST'
      Origin = 'DbMain.Z_VBLN.DAY5FIRST'
      FixedChar = True
      Size = 1
    end
    object qryVBlnLISTCONT: TStringField
      FieldName = 'LISTCONT'
      Origin = 'DbMain.Z_VBLN.LISTCONT'
      FixedChar = True
      Size = 1
    end
    object qryVBlnPREDSPEC_NR: TIntegerField
      FieldName = 'PREDSPEC_NR'
      Origin = 'DbMain.Z_VBLN.PREDSPEC_NR'
    end
    object qryVBlnPredNR: TStringField
      FieldKind = fkCalculated
      FieldName = 'PredNR'
      Size = 15
      Calculated = True
    end
    object qryVBlnPredDt: TDateField
      FieldKind = fkCalculated
      FieldName = 'PredDt'
      DisplayFormat = 'dd/mm/yy'
      Calculated = True
    end
    object qryVBlnSTGCMN: TFloatField
      FieldName = 'STGCMN'
    end
    object qryVBlnSTG12: TFloatField
      FieldName = 'STG12'
    end
  end
  object dsrcVBln: TDataSource
    DataSet = qryVBln
    OnDataChange = dsrcVBlnDataChange
    Left = 168
    Top = 104
  end
  object qryTmp: TQuery
    Left = 80
    Top = 221
  end
  object qryRBln: TQuery
    OnCalcFields = qryRBlnCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcVBln
    SQL.Strings = (
      'Select * from Z_RBln'
      'where Spec_NR = :Spec_NR'
      'order by ZaMesGod')
    Left = 536
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryRBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_RBLN.NR'
    end
    object qryRBlnTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_RBLN.TABN'
    end
    object qryRBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_RBLN.SPEC_NR'
    end
    object qryRBlnZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_RBLN.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryRBlnSMZARABOTKA: TFloatField
      DisplayLabel = #1057#1084#1084#1047#1072#1088#1072#1073#1086#1090#1082#1072
      FieldName = 'SMZARABOTKA'
      Origin = 'DbMain.Z_RBLN.SMZARABOTKA'
      DisplayFormat = '#.00'
    end
    object qryRBlnKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090
      FieldName = 'KOEFZP'
      Origin = 'DbMain.Z_RBLN.KOEFZP'
    end
    object qryRBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_RBLN.KDSPS'
    end
    object qryRBlnSmZpKoef: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090
      FieldKind = fkCalculated
      FieldName = 'SmZpKoef'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object qryRBlnCNTDAYS: TFloatField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_RBLN.CNTDAYS'
    end
    object qryRBlnSm_Svm: TFloatField
      DisplayLabel = #1057#1086#1074#1084#1077#1089#1090
      FieldName = 'Sm_Svm'
    end
    object qryRBlnSumSupplCoeff: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SumSupplCoeff'
      Calculated = True
    end
  end
  object dsrcRBln: TDataSource
    DataSet = qryRBln
    Left = 552
    Top = 416
  end
  object qryOtkl: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcVBln
    SQL.Strings = (
      'select * from ViOtkl'
      'where DtProc = :DtProc and TabN = :TabN and '
      '                        (Spec_NR = :Spec_NR or Notes = :NrList)'
      'order by ZaMesGod, VidN')
    Left = 337
    Top = 429
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'NRLIST'
        ParamType = ptUnknown
        Size = 16
      end>
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryOtklDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 3
    end
    object qryOtklSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VIOTKL.SHVIDN'
      Size = 15
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
      DisplayFormat = 'mm-yy'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryOtklKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryOtklSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      Origin = 'DbMain.VIOTKL.SCHBU'
      Size = 10
    end
    object qryOtklPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VIOTKL.PSCH'
      Size = 10
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 352
    Top = 448
  end
  object qryNuOld: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select KdSps, VidN, ShVidN, OldKdVidN, DtProc, ZaMesGod, Chas, S' +
        'umma, Dt_Beg, dt_End, PdN, MyNotes'
      'from vinu_main where tabn = 51673 and '
      '                 VidN > '#39'2600'#39' and VidN < '#39'2700'#39' and Summa <> 0')
    Left = 617
    Top = 405
    object qryNuOldKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryNuOldVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuOldSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNuOldOLDKDVIDN: TSmallintField
      DisplayLabel = #1057#1090#1088#1042#1080#1076#1053
      FieldName = 'OLDKDVIDN'
    end
    object qryNuOldDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryNuOldZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryNuOldCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object qryNuOldSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
    end
    object qryNuOldDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNuOldDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNuOldPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object qryNuOldMYNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'MYNOTES'
      Size = 25
    end
  end
  object dsrcNuOld: TDataSource
    DataSet = qryNuOld
    Left = 632
    Top = 416
  end
end
