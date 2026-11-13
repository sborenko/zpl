object FormStornOtp2: TFormStornOtp2
  Left = 551
  Top = 391
  Width = 800
  Height = 531
  BorderIcons = [biSystemMenu]
  Caption = 'FormStornOtp2'
  Color = clBtnFace
  Constraints.MaxHeight = 550
  Constraints.MaxWidth = 1000
  Constraints.MinHeight = 450
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    792
    497)
  PixelsPerInch = 96
  TextHeight = 13
  object sBtnSaveStorn: TSpeedButton
    Left = 663
    Top = 446
    Width = 121
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1085#1072' '#1076#1080#1089#1082
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1087#1080#1089#1100' '#1074' '#1041#1044
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    Spacing = 2
    OnClick = sBtnSaveStornClick
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 497
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Caption = 'PanelLeft'
    TabOrder = 0
    DesignSize = (
      653
      497)
    object Splitter2: TSplitter
      Left = 0
      Top = 234
      Width = 653
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clTeal
      ParentColor = False
    end
    object dbgrOtkl: TDBGrid
      Left = 0
      Top = 0
      Width = 653
      Height = 234
      Hint = #1047#1072#1087#1080#1089#1080' '#1086#1073' '#1086#1090#1087#1091#1089#1082#1072#1093' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      Align = alTop
      Color = clCream
      DataSource = dsrcOtkl
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = popOtkl
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrOtklDrawColumnCell
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'NR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDSPS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPROC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZAMESGOD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTSTORN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShVidN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OLDKDVIDN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OLDKDOBJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDKATP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PDN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDSPZ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRPV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRKR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SPEC_NR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVDPV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRVDPV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MYNOTES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SPECPS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PBNK'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STORN'
          Visible = True
        end>
    end
    object dbgrStorn: TDBGrid
      Left = 0
      Top = 237
      Width = 653
      Height = 260
      Hint = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1072#1084' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      Align = alClient
      Color = clInfoBk
      DataSource = dsrcStorn
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrStornDrawColumnCell
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'KDSPS'
          ReadOnly = True
          Width = 17
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPROC'
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZAMESGOD'
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTSTORN'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShVidN'
          ReadOnly = True
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAS'
          ReadOnly = True
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          ReadOnly = True
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'KDKATP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SPEC_NR'
          Width = 3
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MYNOTES'
          Width = 4
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SVDTBEG'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SVDTEND'
          Visible = False
        end>
    end
    object LbxStornRec: TListBox
      Left = 24
      Top = 141
      Width = 431
      Height = 74
      Hint = 'LbxStornRec'
      Anchors = [akLeft, akTop, akRight]
      Color = clYellow
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
    end
    object LbxSpecNR: TListBox
      Left = 547
      Top = 141
      Width = 66
      Height = 74
      Hint = 'LbxSpecNR'
      Anchors = [akTop, akRight]
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
    end
    object LbxDtStorn: TListBox
      Left = 470
      Top = 141
      Width = 71
      Height = 74
      Hint = 'LbxDtStorn'
      Anchors = [akTop, akRight]
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
    end
    object dbgrDelStorn: TDBGrid
      Left = 24
      Top = 353
      Width = 602
      Height = 120
      Anchors = [akLeft, akRight, akBottom]
      Color = clYellow
      DataSource = dsrcDelStorn
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Notes'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prichina'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZaMesGod'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StornDtBeg'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StornDtEnd'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Spec_NR'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VidN'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StornSm'
          Width = 45
          Visible = True
        end>
    end
  end
  object PanelMsg: TPanel
    Left = 657
    Top = 52
    Width = 132
    Height = 317
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 132
      Height = 68
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1042' '#1074#1077#1088#1093#1085#1102#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1074#1099#1073#1088#1072#1085#1099' '#1086#1090#1087#1091#1089#1082#1085#1099#1077', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1099#1077' '#1074' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1093' 10' +
        '-'#1090#1080' '#1084#1077#1089#1103#1094#1072#1093'.'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 0
      Top = 230
      Width = 132
      Height = 76
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1044#1083#1103' '#1074#1099#1079#1086#1074#1072' '#1084#1077#1085#1102' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1097#1077#1083#1082#1085#1080#1090#1077' '#1087#1088#1072#1074#1086#1081' '#1082#1083#1072#1074#1080#1096#1077#1081' '#1084#1099#1096#1082#1080' '#1085#1072' '#1085#1091#1078#1085#1086 +
        #1081' '#1079#1072#1087#1080#1089#1080' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 0
      Top = 68
      Width = 132
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1042' '#1085#1080#1078#1085#1102#1102' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1079#1072#1087#1080#1089#1080' '#1086' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1080' '#1101#1090#1080#1093' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' ('#1077#1089#1083#1080' ' +
        #1086#1085#1080' '#1077#1089#1090#1100')'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 0
      Top = 121
      Width = 132
      Height = 109
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1054#1087#1077#1088#1072#1094#1080#1080' '#1087#1086' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1102' '#1084#1086#1078#1085#1086' '#1074#1099#1087#1086#1083#1085#1103#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1072#1076' '#1079#1072#1087#1080#1089#1103#1084#1080' '#1074#1077 +
        #1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1085#1077' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1083#1080#1089#1100' '#1080#1083#1080' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1083#1080#1089#1100' '#1074' '#1090#1077 +
        #1082#1091#1096#1077#1084' '#1084#1077#1089#1103#1094#1077'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object bBtnCancel: TBitBtn
    Left = 663
    Top = 477
    Width = 121
    Height = 25
    Hint = #1042#1099#1093#1086#1076
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
    Spacing = 0
  end
  object qryOtkl: TQuery
    AfterScroll = qryOtklAfterScroll
    OnCalcFields = qryOtklCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select * from Z_Otkl where TabN = 1239 and DtProc >= "05/01/2007' +
        '"'
      
        '                               and (VidN > "2400") and (VidN <= ' +
        #39'2411'#39')'
      'order by ZaMesGod, VidN')
    Left = 24
    Top = 64
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklDTSTORN: TDateTimeField
      DisplayLabel = #1057#1090#1086#1088#1085#1052#1077#1089
      FieldName = 'DTSTORN'
      Origin = 'DbMain.Z_OTKL.DTSTORN'
      DisplayFormat = 'mm/yy'
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
      Size = 4
    end
    object qryOtklShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryOtklOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
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
    object qryOtklOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object qryOtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryOtklNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 25
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
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object qryOtklSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 40
    Top = 96
  end
  object qryStorn: TQuery
    CachedUpdates = True
    OnCalcFields = qryStornCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select Cast(Null as Date) as SvDtBeg, Cast(Null as Date) as SvDt' +
        'End, '
      
        '    o.* from Z_Otkl  o where o.TabN = 1239 and o.DtProc >= "05/0' +
        '1/2007"'
      
        '                               and o.VidN > "2400" and o.VidN <=' +
        ' '#39'2411'#39)
    UpdateObject = updStorn
    Left = 40
    Top = 304
    object qryStornNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryStornKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryStornDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryStornZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryStornDTSTORN: TDateTimeField
      DisplayLabel = #1057#1090#1086#1088#1085#1052#1077#1089
      FieldName = 'DTSTORN'
      DisplayFormat = 'mm/yy'
    end
    object qryStornTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryStornVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryStornShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryStornOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
    end
    object qryStornCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object qryStornSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryStornOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object qryStornKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object qryStornKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object qryStornDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryStornDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryStornPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryStornKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryStornNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 25
    end
    object qryStornPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object qryStornPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object qryStornKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object qryStornPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object qryStornSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryStornDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object qryStornNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object qryStornMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object qryStornSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object qryStornPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object qryStornSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object qryStornSVDTBEG: TDateTimeField
      FieldName = 'SVDTBEG'
    end
    object qryStornSVDTEND: TDateTimeField
      FieldName = 'SVDTEND'
    end
  end
  object dsrcStorn: TDataSource
    DataSet = qryStorn
    Left = 64
    Top = 320
  end
  object updStorn: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Otkl'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  DTSTORN = :DTSTORN,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  PDN = :PDN,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  SPEC_NR = :SPEC_NR,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  PBNK = :PBNK,'
      '  STORN = :STORN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Otkl'
      
        '  (KDSPS, DTPROC, ZAMESGOD, DTSTORN, TABN, VIDN, CHAS, SUMMA, KD' +
        'OBJ, KDKATP, '
      
        '   DT_BEG, DT_END, PDN, KDSPZ, NOTES, PRR, PRPV, KTO, PRKR, SPEC' +
        '_NR, DTVDPV, '
      '   NRVDPV, MYNOTES, SPECPS, PBNK, STORN)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :DTSTORN, :TABN, :VIDN, :CHAS, :S' +
        'UMMA, :KDOBJ, '
      
        '   :KDKATP, :DT_BEG, :DT_END, :PDN, :KDSPZ, :NOTES, :PRR, :PRPV,' +
        ' :KTO, '
      
        '   :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV, :MYNOTES, :SPECPS, :PBNK, ' +
        ':STORN)')
    DeleteSQL.Strings = (
      'delete from z_Otkl'
      'where'
      '  NR = :OLD_NR')
    Left = 80
    Top = 336
  end
  object popOtkl: TPopupMenu
    OnPopup = popOtklPopup
    Left = 208
    Top = 56
    object popOtklStornPart: TMenuItem
      Caption = 'C'#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100' '
      Hint = 
        #1055#1088#1077#1076#1083#1072#1075#1072#1077#1090#1089#1103' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1083#1086#1075', '#1095#1090#1086#1073#1099' '#1074#1074#1077#1089#1090#1080' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1080' '#1086 +
        #1082#1086#1085#1095#1072#1085#1080#1103' '#1089#1090#1086#1088#1085#1080#1088#1091#1077#1084#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      OnClick = popOtklStornPartClick
    end
    object popOtklDelStorn: TMenuItem
      Caption = #1059#1073#1088#1072#1090#1100' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1059#1076#1072#1083#1103#1077#1090#1089#1103' '#1079#1072#1087#1080#1089#1100' '#1086' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1080
      OnClick = popOtklDelStornClick
    end
  end
  object qryTmp: TQuery
    Left = 152
    Top = 88
  end
  object cdsF8: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SvDtBeg'
        DataType = ftDate
      end
      item
        Name = 'StornDtBeg'
        DataType = ftDate
      end
      item
        Name = 'SvDtEnd'
        DataType = ftDate
      end
      item
        Name = 'StornDtEnd'
        DataType = ftDate
      end
      item
        Name = 'StornFull'
        DataType = ftBoolean
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 301
    object cdsF8NR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsF8ZaMesGod: TDateField
      FieldName = 'ZaMesGod'
    end
    object cdsF8SvDtBeg: TDateField
      FieldName = 'SvDtBeg'
    end
    object cdsF8StornDtBeg: TDateField
      FieldName = 'StornDtBeg'
    end
    object cdsF8SvDtEnd: TDateField
      FieldName = 'SvDtEnd'
    end
    object cdsF8StornDtEnd: TDateField
      FieldName = 'StornDtEnd'
    end
    object cdsF8StornFull: TBooleanField
      FieldName = 'StornFull'
    end
    object cdsF8Spec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
    object cdsF8VidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
  end
  object dsrcF8: TDataSource
    DataSet = cdsF8
    Left = 156
    Top = 316
  end
  object qryTmpOtp: TQuery
    Left = 256
    Top = 325
  end
  object cdsDelStorn: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ZaMesGod'
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
        Name = 'Spec_NR'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'StornSm'
        DataType = ftFloat
      end
      item
        Name = 'Prichina'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 373
    object AutoIncField1: TAutoIncField
      DisplayWidth = 4
      FieldName = 'NR'
    end
    object DateField1: TDateField
      DisplayWidth = 7
      FieldName = 'ZaMesGod'
    end
    object DateField3: TDateField
      DisplayWidth = 9
      FieldName = 'StornDtBeg'
    end
    object DateField5: TDateField
      DisplayWidth = 9
      FieldName = 'StornDtEnd'
    end
    object IntegerField1: TIntegerField
      DisplayWidth = 10
      FieldName = 'Spec_NR'
    end
    object StringField1: TStringField
      DisplayWidth = 5
      FieldName = 'VidN'
      Size = 4
    end
    object cdsDelStornStornSm: TFloatField
      DisplayWidth = 10
      FieldName = 'StornSm'
    end
    object cdsDelStornNotes: TStringField
      FieldName = 'Notes'
      Size = 35
    end
    object cdsDelStornPrichina: TStringField
      FieldName = 'Prichina'
    end
  end
  object dsrcDelStorn: TDataSource
    DataSet = cdsDelStorn
    Left = 176
    Top = 384
  end
  object qrySvStorn: TQuery
    Left = 408
    Top = 360
  end
end
