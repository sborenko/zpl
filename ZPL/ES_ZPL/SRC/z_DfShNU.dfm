object FormShwDfNU: TFormShwDfNU
  Left = 327
  Top = 148
  Width = 634
  Height = 553
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwDfNU'
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 550
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
  object PageControl: TPageControl
    Left = 0
    Top = 31
    Width = 626
    Height = 495
    ActivePage = tsOldNu
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object tsNewNu: TTabSheet
      Caption = 'tsNewNu'
      object dbgrNewNU: TDBGrid
        Left = 0
        Top = 0
        Width = 618
        Height = 464
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcNewNU
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 67
            Visible = True
          end>
      end
    end
    object tsOldNu: TTabSheet
      Caption = 'tsOldNu'
      ImageIndex = 1
      object dbgrOldNU: TDBGrid
        Left = 0
        Top = 0
        Width = 618
        Height = 464
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcOldNU
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Title.Caption = #1058#1072#1073#1053#1088
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBJ'
            Title.Caption = #1055#1076#1088
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VED'
            Title.Caption = #1042#1077#1076
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Title.Caption = #1044#1090#1053#1072#1095#1072#1083#1072
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Title.Caption = #1044#1090#1054#1082#1086#1085#1095'.'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Title.Caption = #1042#1080#1076
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAIMVRLST'
            Title.Caption = #1064#1092#1088#1042#1080#1076#1072
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Title.Caption = #1055#1053
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GODN'
            Title.Caption = #1043#1086#1076
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MESN'
            Title.Caption = #1052#1077#1089
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Title.Caption = #1057#1091#1084#1084#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SZATR'
            Title.Caption = #1064#1055#1047
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTKUDA'
            Title.Caption = #1055#1088#1080#1084#1077#1095'.'
            Width = 39
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      626
      31)
    object sBtnStayOnTop: TSpeedButton
      Left = 5
      Top = 2
      Width = 25
      Height = 25
      Hint = #1042#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080' ('#1042#1082#1083'/'#1042#1099#1082#1083')'
      AllowAllUp = True
      GroupIndex = 7
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
        77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
        07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 547
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
  end
  object qryNewNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select * from ViNuMain where DtProc = '#39'09/01/2007'#39' and TabN = 12' +
        '39 and'
      '                                   VidN < '#39'6003'#39
      '  order by VidN, ZaMesGod'
      '')
    Left = 56
    Top = 192
    object qryNewNuVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VINUMAIN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNewNuSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VINUMAIN.SHVIDN'
      Size = 15
    end
    object qryNewNuTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.VINUMAIN.TABN'
    end
    object qryNewNuKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINUMAIN.KDSPS'
    end
    object qryNewNuPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VINUMAIN.PSCH'
      Size = 10
    end
    object qryNewNuSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINUMAIN.SCHBU'
      Size = 10
    end
    object qryNewNuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINUMAIN.DTPROC'
    end
    object qryNewNuZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINUMAIN.ZAMESGOD'
    end
    object qryNewNuCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.VINUMAIN.CHAS'
    end
    object qryNewNuSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VINUMAIN.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryNewNuVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
      Origin = 'DbMain.VINUMAIN.VID_KDSPZ'
    end
    object qryNewNuVID_SPZ: TStringField
      FieldName = 'VID_SPZ'
      Origin = 'DbMain.VINUMAIN.VID_SPZ'
      Size = 10
    end
    object qryNewNuVID_KDSCHDT: TSmallintField
      FieldName = 'VID_KDSCHDT'
      Origin = 'DbMain.VINUMAIN.VID_KDSCHDT'
    end
    object qryNewNuVID_SCHDT: TStringField
      FieldName = 'VID_SCHDT'
      Origin = 'DbMain.VINUMAIN.VID_SCHDT'
      Size = 10
    end
    object qryNewNuVID_KDSCHKT: TSmallintField
      FieldName = 'VID_KDSCHKT'
      Origin = 'DbMain.VINUMAIN.VID_KDSCHKT'
    end
    object qryNewNuVID_SCHKT: TStringField
      FieldName = 'VID_SCHKT'
      Origin = 'DbMain.VINUMAIN.VID_SCHKT'
      Size = 10
    end
    object qryNewNuVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      Origin = 'DbMain.VINUMAIN.VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNewNuNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VINUMAIN.NR'
    end
    object qryNewNuDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINUMAIN.DT_BEG'
    end
    object qryNewNuDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.VINUMAIN.DT_END'
    end
    object qryNewNuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINUMAIN.KDOBJ'
    end
    object qryNewNuKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.VINUMAIN.KDKATP'
    end
    object qryNewNuKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VINUMAIN.KDSPZ'
    end
    object qryNewNuPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.VINUMAIN.PDN'
    end
    object qryNewNuNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.VINUMAIN.NOTES'
      Size = 25
    end
    object qryNewNuPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VINUMAIN.PRR'
    end
    object qryNewNuPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VINUMAIN.PRPV'
    end
    object qryNewNuKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VINUMAIN.KTO'
    end
    object qryNewNuPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VINUMAIN.PRKR'
    end
    object qryNewNuMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VINUMAIN.MYNOTES'
      Size = 25
    end
    object qryNewNuSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VINUMAIN.SPECPS'
    end
    object qryNewNuSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VINUMAIN.SPEC_NR'
    end
    object qryNewNuDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VINUMAIN.DTVDPV'
    end
    object qryNewNuNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VINUMAIN.NRVDPV'
    end
    object qryNewNuSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.VINUMAIN.STORN'
      FixedChar = True
      Size = 1
    end
    object qryNewNuZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.VINUMAIN.ZP13'
      Size = 1
    end
    object qryNewNuOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.VINUMAIN.OTP'
      Size = 1
    end
    object qryNewNuBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.VINUMAIN.BLN'
      Size = 1
    end
    object qryNewNuOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.VINUMAIN.OTPUSKN'
      Size = 1
    end
    object qryNewNuBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.VINUMAIN.BOLNIC'
      Size = 1
    end
    object qryNewNuSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.VINUMAIN.SPRM'
      Size = 1
    end
    object qryNewNuCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.VINUMAIN.CPRM'
      Size = 1
    end
    object qryNewNuDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.VINUMAIN.DETI'
      Size = 1
    end
    object qryNewNuDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.VINUMAIN.DETIM'
      Size = 1
    end
    object qryNewNuDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.VINUMAIN.DETIK'
      Size = 1
    end
    object qryNewNuDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.VINUMAIN.DETIG'
      Size = 1
    end
    object qryNewNuIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.VINUMAIN.IND'
      Size = 1
    end
    object qryNewNuDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.VINUMAIN.DHD'
      Size = 1
    end
    object qryNewNuOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.VINUMAIN.OKLFND'
      Size = 1
    end
    object qryNewNuCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VINUMAIN.CBUDG'
      Size = 1
    end
    object qryNewNuSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.VINUMAIN.SNDB'
      Size = 1
    end
    object qryNewNuSPDN: TStringField
      DisplayLabel = #1057#1055#1076#1085
      FieldName = 'SPDN'
      Origin = 'DbMain.VINUMAIN.SPDN'
      Size = 1
    end
    object qryNewNuSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.VINUMAIN.SPRF'
      Size = 1
    end
    object qryNewNuSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.VINUMAIN.SPENS'
      Size = 1
    end
    object qryNewNuSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.VINUMAIN.SALIM'
      Size = 1
    end
    object qryNewNuCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.VINUMAIN.CNDB'
      Size = 1
    end
    object qryNewNuSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.VINUMAIN.SSOCSTRAH'
      Size = 1
    end
    object qryNewNuSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.VINUMAIN.SBZR'
      Size = 1
    end
    object qryNewNuSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.VINUMAIN.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNewNuSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.VINUMAIN.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNewNuSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.VINUMAIN.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNewNuSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.VINUMAIN.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNewNuSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINUMAIN.SOVM'
      Size = 1
    end
    object qryNewNuSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.VINUMAIN.SPOV'
      Size = 1
    end
  end
  object dsrcNewNU: TDataSource
    DataSet = qryNewNu
    Left = 72
    Top = 208
  end
  object qryOldNU: TQuery
    DatabaseName = 'K:\Df&SPOV\DBFS\D_03\'
    SQL.Strings = (
      'Select n.*, v.NaimVRLst '
      'from nu0807 n Left outer join kodvid v on v.VidN = n.VidN'
      ' where TabN = 2 order by TabN, VidN')
    Left = 120
    Top = 192
  end
  object dsrcOldNU: TDataSource
    DataSet = qryOldNU
    Left = 136
    Top = 208
  end
end
