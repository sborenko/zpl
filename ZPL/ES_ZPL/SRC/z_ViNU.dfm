object FormViNU: TFormViNU
  Left = 589
  Top = 371
  Width = 821
  Height = 430
  BorderIcons = [biSystemMenu]
  Caption = 'FormViNU'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      813
      31)
    object LabelSort: TLabel
      Left = 24
      Top = 8
      Width = 55
      Height = 13
      Caption = 'LabelSort'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bBtnCancel: TBitBtn
      Left = 733
      Top = 3
      Width = 77
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrNU: TDBGrid
    Left = 0
    Top = 31
    Width = 813
    Height = 372
    Align = alClient
    Color = 13234669
    DataSource = dsrcNU
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrNUDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRP'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDTEMU'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMTEMU'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MYNOTES'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZP13'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DKR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTPUSKN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOLNIC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSRK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPRM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DHD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLFND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CBUDG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNDB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SWSB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPENS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALIM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNDB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSOCSTRAH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SBZR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_PF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FSTVP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FSNV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPOV'
        Visible = True
      end>
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ViNuMain'
      'where TabN = 1239 and '
      'ZaMesGod = '#39'04/01/2019'#39' and VidN < '#39'8000'#39)
    Left = 200
    Top = 152
    object qryNUVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.VINUMAIN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNUSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VINUMAIN.SHVIDN'
      Size = 15
    end
    object qryNUGRP: TSmallintField
      FieldName = 'GRP'
      Origin = 'DbMain.VINUMAIN.GRP'
    end
    object qryNUSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SchBU'
      Origin = 'DbMain.VINUMAIN.SCHBU'
      Size = 15
    end
    object qryNUKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.VINUMAIN.KDTEMU'
    end
    object qryNUNMTEMU: TStringField
      FieldName = 'NMTEMU'
      Origin = 'DbMain.VINUMAIN.NMTEMU'
      Size = 65
    end
    object qryNUDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINUMAIN.DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072' '#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINUMAIN.ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNUCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.VINUMAIN.CHAS'
    end
    object qryNUSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VINUMAIN.SUMMA'
      DisplayFormat = '0.00'
    end
    object qryNUDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINUMAIN.DT_BEG'
    end
    object qryNUDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.VINUMAIN.DT_END'
    end
    object qryNUKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINUMAIN.KDOBJ'
    end
    object qryNUKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.VINUMAIN.KDKATP'
    end
    object qryNUKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VINUMAIN.KDSPZ'
    end
    object qryNUNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.VINUMAIN.NOTES'
      Size = 25
    end
    object qryNUMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VINUMAIN.MYNOTES'
      Size = 25
    end
    object qryNUSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VINUMAIN.SPEC_NR'
    end
    object qryNUZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.VINUMAIN.ZP13'
      Size = 1
    end
    object qryNUOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.VINUMAIN.OTP'
      Size = 1
    end
    object qryNUBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.VINUMAIN.BLN'
      Size = 1
    end
    object qryNUDKR: TStringField
      FieldName = 'DKR'
      Origin = 'DbMain.VINUMAIN.DKR'
      Size = 1
    end
    object qryNUOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.VINUMAIN.OTPUSKN'
      Size = 1
    end
    object qryNUBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.VINUMAIN.BOLNIC'
      Size = 1
    end
    object qryNUSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.VINUMAIN.SPRM'
      Size = 1
    end
    object qryNUSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.VINUMAIN.SSRK'
      FixedChar = True
      Size = 1
    end
    object qryNUCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.VINUMAIN.CPRM'
      Size = 1
    end
    object qryNUDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.VINUMAIN.DETI'
      Size = 1
    end
    object qryNUDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.VINUMAIN.DETIM'
      Size = 1
    end
    object qryNUDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.VINUMAIN.DETIK'
      Size = 1
    end
    object qryNUDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.VINUMAIN.DETIG'
      Size = 1
    end
    object qryNUIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.VINUMAIN.IND'
      Size = 1
    end
    object qryNUDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.VINUMAIN.DHD'
      Size = 1
    end
    object qryNUOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.VINUMAIN.OKLFND'
      Size = 1
    end
    object qryNUCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VINUMAIN.CBUDG'
      Size = 1
    end
    object qryNUSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.VINUMAIN.SNDB'
      Size = 1
    end
    object qryNUSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.VINUMAIN.SPDN'
      Size = 1
    end
    object qryNUSWSB: TStringField
      FieldName = 'SWSB'
      Origin = 'DbMain.VINUMAIN.SWSB'
      Size = 1
    end
    object qryNUSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.VINUMAIN.SPRF'
      Size = 1
    end
    object qryNUSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.VINUMAIN.SPENS'
      Size = 1
    end
    object qryNUSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.VINUMAIN.SALIM'
      Size = 1
    end
    object qryNUCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.VINUMAIN.CNDB'
      Size = 1
    end
    object qryNUSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.VINUMAIN.SSOCSTRAH'
      Size = 1
    end
    object qryNUSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.VINUMAIN.SBZR'
      Size = 1
    end
    object qryNUSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.VINUMAIN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.VINUMAIN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.VINUMAIN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.VINUMAIN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNUSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINUMAIN.SOVM'
      Size = 1
    end
    object qryNUSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.VINUMAIN.SPOV'
      Size = 1
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 216
    Top = 168
  end
end
