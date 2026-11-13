object FormShowMoDet: TFormShowMoDet
  Left = 267
  Top = 179
  Width = 750
  Height = 350
  BorderIcons = [biSystemMenu]
  Caption = 'FormShowMoDet'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 750
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
    Width = 742
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      31)
    object sBtnPrt: TSpeedButton
      Left = 581
      Top = 3
      Width = 75
      Height = 25
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
      OnClick = sBtnPrtClick
    end
    object LabelCntRec: TLabel
      Left = 312
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object LabelFamIO: TLabel
      Left = 8
      Top = 9
      Width = 57
      Height = 13
      Caption = 'LabelFamIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 394
      Top = 1
      Width = 176
      Height = 25
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = #1053#1072' 2-'#1084' '#1090#1072#1073#1077' '#1088#1072#1079#1084#1077#1089#1090#1080#1090#1100' '#1074#1099#1073#1086#1088#1082#1091' '#1076#1083#1103' '#1089#1074#1086#1076#1072' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
      WordWrap = True
    end
    object BitBtn1: TBitBtn
      Left = 662
      Top = 3
      Width = 77
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 224
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcNu
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 742
    Height = 292
    ActivePage = ts1
    Align = alClient
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #1044#1083#1103' ShwDet '#1080#1079' '#1084#1077#1084'. '#1054#1088#1076#1077#1088#1072
      object dbgrNu: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 264
        Align = alClient
        Color = 11664597
        DataSource = dsrcNu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrNuDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOVM'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 50
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
            FieldName = 'SCHDT'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHKT'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 4
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VID_KDSPZ'
            Width = 3
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSCHDT'
            Width = 7
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSCHKT'
            Width = 4
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR'
            Width = 6
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 3
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPZ'
            Width = 4
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRPV'
            Width = 3
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO'
            Width = 8
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #1044#1083#1103' ShwDet '#1080#1079' '#1089#1074#1086#1076#1072' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
      ImageIndex = 1
      object dbgrNuKat: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 264
        Align = alClient
        DataSource = dsrcNuKat
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object qryNu: TQuery
    OnCalcFields = qryNuCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, vm.* '
      'from ViNuMain vm Left outer join z_Upi u on u.TabN = vm.TabN '
      'where vm.DtProc = "05/01/2017" and vm.VidN = "2404"')
    Left = 128
    Top = 56
    object qryNuFAM: TStringField
      FieldName = 'FAM'
    end
    object qryNuFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 55
      Calculated = True
    end
    object qryNuIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryNuOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryNuVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNuTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryNuKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryNuPSCH: TStringField
      FieldName = 'PSCH'
      Size = 15
    end
    object qryNuLVL: TSmallintField
      FieldName = 'LVL'
    end
    object qryNuSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 15
    end
    object qryNuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryNuZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
    end
    object qryNuCHAS: TFloatField
      FieldName = 'CHAS'
    end
    object qryNuSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object qryNuNMSCH: TStringField
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryNuVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
    end
    object qryNuVID_SPZ: TStringField
      FieldName = 'VID_SPZ'
      Size = 15
    end
    object qryNuVID_KDSCHDT: TSmallintField
      FieldName = 'VID_KDSCHDT'
    end
    object qryNuVID_SCHDT: TStringField
      FieldName = 'VID_SCHDT'
      Size = 15
    end
    object qryNuVID_KDSCHKT: TSmallintField
      FieldName = 'VID_KDSCHKT'
    end
    object qryNuVID_SCHKT: TStringField
      FieldName = 'VID_SCHKT'
      Size = 15
    end
    object qryNuVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNuNR: TIntegerField
      FieldName = 'NR'
    end
    object qryNuDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object qryNuDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryNuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qryNuKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qryNuKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryNuPDN: TSmallintField
      FieldName = 'PDN'
    end
    object qryNuOZN_PILG: TStringField
      FieldName = 'OZN_PILG'
      FixedChar = True
      Size = 10
    end
    object qryNuNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object qryNuPRR: TSmallintField
      FieldName = 'PRR'
    end
    object qryNuPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object qryNuKTO: TSmallintField
      FieldName = 'KTO'
    end
    object qryNuPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object qryNuMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object qryNuSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object qryNuSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryNuDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object qryNuNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object qryNuKDBNK: TSmallintField
      FieldName = 'KDBNK'
    end
    object qryNuSTORN: TStringField
      FieldName = 'STORN'
      FixedChar = True
      Size = 1
    end
    object qryNuZP13: TStringField
      FieldName = 'ZP13'
      Size = 1
    end
    object qryNuOTP: TStringField
      FieldName = 'OTP'
      Size = 1
    end
    object qryNuBLN: TStringField
      FieldName = 'BLN'
      Size = 1
    end
    object qryNuDKR: TStringField
      FieldName = 'DKR'
      Size = 1
    end
    object qryNuOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Size = 1
    end
    object qryNuBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Size = 1
    end
    object qryNuSPRM: TStringField
      FieldName = 'SPRM'
      Size = 1
    end
    object qryNuSSRK: TStringField
      FieldName = 'SSRK'
      FixedChar = True
      Size = 1
    end
    object qryNuCPRM: TStringField
      FieldName = 'CPRM'
      Size = 1
    end
    object qryNuDETI: TStringField
      FieldName = 'DETI'
      Size = 1
    end
    object qryNuDETIM: TStringField
      FieldName = 'DETIM'
      Size = 1
    end
    object qryNuDETIK: TStringField
      FieldName = 'DETIK'
      Size = 1
    end
    object qryNuDETIG: TStringField
      FieldName = 'DETIG'
      Size = 1
    end
    object qryNuIND: TStringField
      FieldName = 'IND'
      Size = 1
    end
    object qryNuDHD: TStringField
      FieldName = 'DHD'
      Size = 1
    end
    object qryNuOKLFND: TStringField
      FieldName = 'OKLFND'
      Size = 1
    end
    object qryNuCBUDG: TStringField
      FieldName = 'CBUDG'
      Size = 1
    end
    object qryNuSNDB: TStringField
      FieldName = 'SNDB'
      Size = 1
    end
    object qryNuSPDN: TStringField
      FieldName = 'SPDN'
      Size = 1
    end
    object qryNuSWSB: TStringField
      FieldName = 'SWSB'
      Size = 1
    end
    object qryNuSPRF: TStringField
      FieldName = 'SPRF'
      Size = 1
    end
    object qryNuSPENS: TStringField
      FieldName = 'SPENS'
      Size = 1
    end
    object qryNuSALIM: TStringField
      FieldName = 'SALIM'
      Size = 1
    end
    object qryNuCNDB: TStringField
      FieldName = 'CNDB'
      Size = 1
    end
    object qryNuSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Size = 1
    end
    object qryNuSBZR: TStringField
      FieldName = 'SBZR'
      Size = 1
    end
    object qryNuSP_PF: TStringField
      FieldName = 'SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNuSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNuSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNuSP_FZ: TStringField
      FieldName = 'SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNuSOVM: TStringField
      FieldName = 'SOVM'
      Size = 1
    end
    object qryNuSPOV: TStringField
      FieldName = 'SPOV'
      Size = 1
    end
  end
  object dsrcNu: TDataSource
    DataSet = qryNu
    Left = 144
    Top = 72
  end
  object qryNuKat: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, n.* '
      'from ViNuMain n Left Outer Join z_Upi u on u.TabN = n.TabN'
      'where n.DtProc = '#39'01/01/2008'#39' and n.PSCH = '#39'811'#39' and '
      '        n.VidN = '#39'1003'#39' ')
    Left = 224
    Top = 128
  end
  object dsrcNuKat: TDataSource
    DataSet = qryNuKat
    Left = 240
    Top = 144
  end
end
