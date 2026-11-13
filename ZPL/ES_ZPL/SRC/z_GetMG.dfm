object FormGetMG: TFormGetMG
  Left = 377
  Top = 221
  Width = 640
  Height = 414
  ActiveControl = dbgrVids
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetMG'
  Color = clBtnFace
  Constraints.MaxWidth = 670
  Constraints.MinHeight = 375
  Constraints.MinWidth = 640
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      632
      31)
    object Label1: TLabel
      Left = 76
      Top = 2
      Width = 260
      Height = 26
      AutoSize = False
      Caption = 
        #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1074#1080#1076#1099' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1080' '#1076#1086#1087#1083#1072#1090', '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1077'  '#1084#1077#1089#1103#1094' '#1080 +
        ' '#1075#1086#1076', '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1074#1086#1076'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object sBtnF8: TSpeedButton
      Left = 3
      Top = 3
      Width = 70
      Height = 25
      Hint = #1042#1099#1073#1086#1088' '#1074#1080#1076#1086#1074' '#1076#1083#1103' '#1076#1072#1083#1100#1085#1077#1081#1096#1077#1081' '#1088#1072#1073#1086#1090#1099' ('#1090#1086' '#1078#1077' '#1082#1083#1072#1074#1080#1096#1077#1081' <F8>)'
      Caption = #1042#1099#1073#1086#1088' (F8)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnF8Click
    end
    object bBtnCancel: TBitBtn
      Left = 554
      Top = 3
      Width = 75
      Height = 25
      Hint = #1054#1090#1082#1072#1079
      Anchors = [akRight]
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Kind = bkCancel
      Spacing = 0
    end
    object edMes: TEdit
      Left = 335
      Top = 5
      Width = 23
      Height = 21
      Hint = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1084#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = '5'
      OnEnter = edMesEnter
      OnExit = edMesExit
    end
    object UpDownMes: TUpDown
      Left = 358
      Top = 5
      Width = 15
      Height = 21
      Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1084#1077#1089#1103#1094#1072
      Associate = edMes
      Min = 1
      Max = 12
      ParentShowHint = False
      Position = 5
      ShowHint = True
      TabOrder = 4
    end
    object edGod: TEdit
      Left = 378
      Top = 5
      Width = 39
      Height = 21
      Hint = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1081' '#1075#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      Text = '2012'
      OnEnter = edMesEnter
      OnExit = edMesExit
    end
    object UpDownGod: TUpDown
      Left = 417
      Top = 5
      Width = 15
      Height = 21
      Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1075#1086#1076#1072
      Associate = edGod
      Min = 2004
      Max = 2050
      ParentShowHint = False
      Position = 2012
      ShowHint = True
      TabOrder = 5
      Thousands = False
    end
    object bBtnOk: TBitBtn
      Left = 476
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Kind = bkOK
    end
  end
  object dbgrVids: TDBGrid
    Left = 0
    Top = 44
    Width = 632
    Height = 343
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcVids
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrVidsDrawColumnCell
    OnDblClick = dbgrVidsDblClick
    OnEnter = dbgrVidsEnter
    OnExit = dbgrVidsExit
    OnKeyDown = dbgrVidsKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMVIDN'
        Width = 447
        Visible = True
      end>
  end
  object LbxF8: TListBox
    Left = 24
    Top = 144
    Width = 25
    Height = 25
    TabStop = False
    Color = clBtnFace
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 632
    Height = 13
    Align = alTop
    BevelOuter = bvNone
    Color = clMoneyGreen
    TabOrder = 3
    object LabelCntSel: TLabel
      Left = 62
      Top = 0
      Width = 570
      Height = 13
      Align = alClient
      Alignment = taCenter
      Caption = #1042#1099#1076#1077#1083#1077#1085#1086' '#1074#1080#1076#1086#1074':'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabelCntRec: TLabel
      Left = 0
      Top = 0
      Width = 62
      Height = 13
      Align = alLeft
      Caption = 'LabelCntRec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object qryVids: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KdVidN '
      'where (VidN >= '#39'1400'#39' and VidN < '#39'1500'#39') or'
      '           (VidN >= '#39'1600'#39' and VidN < '#39'1700'#39')'
      'order by VidN')
    Left = 80
    Top = 80
    object qryVidsNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KDVIDN.NR'
    end
    object qryVidsVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_KDVIDN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVidsOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_KDVIDN.OLDKDVIDN'
    end
    object qryVidsSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.Z_KDVIDN.SHVIDN'
      Size = 15
    end
    object qryVidsNMVIDN: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1080#1076#1072
      FieldName = 'NMVIDN'
      Origin = 'DbMain.Z_KDVIDN.NMVIDN'
      Size = 64
    end
    object qryVidsAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.Z_KDVIDN.AINDX'
    end
    object qryVidsPINDX: TSmallintField
      FieldName = 'PINDX'
      Origin = 'DbMain.Z_KDVIDN.PINDX'
    end
    object qryVidsLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.Z_KDVIDN.LVL'
    end
    object qryVidsINDX: TSmallintField
      FieldName = 'INDX'
      Origin = 'DbMain.Z_KDVIDN.INDX'
    end
    object qryVidsHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.Z_KDVIDN.HSCH'
      Size = 1
    end
    object qryVidsNDBE: TStringField
      FieldName = 'NDBE'
      Origin = 'DbMain.Z_KDVIDN.NDBE'
      FixedChar = True
      Size = 1
    end
    object qryVidsNOSHOW: TStringField
      FieldName = 'NOSHOW'
      Origin = 'DbMain.Z_KDVIDN.NOSHOW'
      Size = 1
    end
    object qryVidsZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.Z_KDVIDN.ZP13'
      Size = 1
    end
    object qryVidsOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.Z_KDVIDN.OTP'
      Size = 1
    end
    object qryVidsBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.Z_KDVIDN.BLN'
      Size = 1
    end
    object qryVidsOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.Z_KDVIDN.OTPUSKN'
      Size = 1
    end
    object qryVidsBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.Z_KDVIDN.BOLNIC'
      Size = 1
    end
    object qryVidsSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.Z_KDVIDN.SPRM'
      Size = 1
    end
    object qryVidsCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.Z_KDVIDN.CPRM'
      Size = 1
    end
    object qryVidsSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.Z_KDVIDN.SSRK'
      FixedChar = True
      Size = 1
    end
    object qryVidsDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.Z_KDVIDN.DETI'
      Size = 1
    end
    object qryVidsDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.Z_KDVIDN.DETIM'
      Size = 1
    end
    object qryVidsDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.Z_KDVIDN.DETIK'
      Size = 1
    end
    object qryVidsDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.Z_KDVIDN.DETIG'
      Size = 1
    end
    object qryVidsIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.Z_KDVIDN.IND'
      Size = 1
    end
    object qryVidsDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.Z_KDVIDN.DHD'
      Size = 1
    end
    object qryVidsOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.Z_KDVIDN.OKLFND'
      Size = 1
    end
    object qryVidsCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.Z_KDVIDN.CBUDG'
      Size = 1
    end
    object qryVidsSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.Z_KDVIDN.SNDB'
      Size = 1
    end
    object qryVidsSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.Z_KDVIDN.SPDN'
      Size = 1
    end
    object qryVidsSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.Z_KDVIDN.SPRF'
      Size = 1
    end
    object qryVidsSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.Z_KDVIDN.SPENS'
      Size = 1
    end
    object qryVidsSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.Z_KDVIDN.SALIM'
      Size = 1
    end
    object qryVidsCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.Z_KDVIDN.CNDB'
      Size = 1
    end
    object qryVidsSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.Z_KDVIDN.SSOCSTRAH'
      Size = 1
    end
    object qryVidsSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.Z_KDVIDN.SBZR'
      Size = 1
    end
    object qryVidsLITTLEHLP: TStringField
      FieldName = 'LITTLEHLP'
      Origin = 'DbMain.Z_KDVIDN.LITTLEHLP'
      Size = 255
    end
    object qryVidsKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_KDVIDN.KDSPZ'
    end
    object qryVidsOLDSZATR: TStringField
      FieldName = 'OLDSZATR'
      Origin = 'DbMain.Z_KDVIDN.OLDSZATR'
      Size = 6
    end
    object qryVidsSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.Z_KDVIDN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryVidsSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.Z_KDVIDN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryVidsSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.Z_KDVIDN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryVidsSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.Z_KDVIDN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryVidsSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_KDVIDN.SOVM'
      Size = 1
    end
    object qryVidsSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.Z_KDVIDN.SPOV'
      Size = 1
    end
    object qryVidsKEKV: TStringField
      FieldName = 'KEKV'
      Origin = 'DbMain.Z_KDVIDN.KEKV'
      FixedChar = True
      Size = 4
    end
    object qryVidsKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
      Origin = 'DbMain.Z_KDVIDN.KDSCHDT'
    end
    object qryVidsKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
      Origin = 'DbMain.Z_KDVIDN.KDSCHKT'
    end
  end
  object dsrcVids: TDataSource
    DataSet = qryVids
    Left = 88
    Top = 88
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 128
    Top = 144
    object popSelAll: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1074#1080#1076#1099
      OnClick = popSelAllClick
    end
    object popUnSelAll: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1105' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1077
      OnClick = popUnSelAllClick
    end
  end
end
