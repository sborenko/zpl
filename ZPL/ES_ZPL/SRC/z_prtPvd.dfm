object FormPrtPvd: TFormPrtPvd
  Left = 931
  Top = 176
  Width = 874
  Height = 622
  BorderIcons = [biSystemMenu]
  Caption = 'FormPrtPvd'
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
  object Splitter1: TSplitter
    Left = 0
    Top = 386
    Width = 866
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      866
      31)
    object sBtnPrt: TSpeedButton
      Left = 5
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 788
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrPvd: TDBGrid
    Left = 0
    Top = 31
    Width = 866
    Height = 355
    Align = alTop
    DataSource = dsrcPvd
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 36
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
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDPST'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMDOK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOMU'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 65
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
        FieldName = 'DT_BEG'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
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
        FieldName = 'SPEC_NR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDOBJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDVIDN'
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
        FieldName = 'STORN'
        Visible = True
      end>
  end
  object dbgrPrt: TDBGrid
    Left = 0
    Top = 389
    Width = 866
    Height = 199
    Align = alClient
    DataSource = dsrcPrt
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSch'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdPst'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kuda'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Komu'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPerevoda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPSB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmNDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmBezNDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SpecNR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Is_Pst'
        Title.Caption = 'IsPst'
        Visible = True
      end>
  end
  object qryPvd: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select u.Fam, u.Ima, u.Otch, ud.KdPst, ud.ADRES, ud.NOMDOK, ud.K' +
        'omu, n.* '
      'from ViNuMain n '
      '      Left outer join z_Uderg ud on ud.Spec_NR = n.Spec_NR'
      '      Left outer join z_Upi u on u.TabN = n.TabN'
      'where n.DtProc = '#39'08/01/2007'#39' and n.VidN in ("6611", "6612")'
      'order by n.PSCH, ud.KdPst desc, n.TabN, n.Spec_NR, n.VidN')
    Left = 224
    Top = 120
    object qryPvdFAM: TStringField
      FieldName = 'FAM'
    end
    object qryPvdIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryPvdOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryPvdKDPST: TIntegerField
      FieldName = 'KDPST'
    end
    object qryPvdADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object qryPvdNOMDOK: TStringField
      FieldName = 'NOMDOK'
      Size = 10
    end
    object qryPvdKOMU: TStringField
      FieldName = 'KOMU'
      Size = 95
    end
    object qryPvdVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryPvdSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryPvdTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryPvdKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryPvdPSCH: TStringField
      FieldName = 'PSCH'
      Size = 10
    end
    object qryPvdSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryPvdDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryPvdZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
    end
    object qryPvdCHAS: TFloatField
      FieldName = 'CHAS'
    end
    object qryPvdSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object qryPvdVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
    end
    object qryPvdVID_SPZ: TStringField
      FieldName = 'VID_SPZ'
      Size = 10
    end
    object qryPvdVID_KDSCHDT: TSmallintField
      FieldName = 'VID_KDSCHDT'
    end
    object qryPvdVID_SCHDT: TStringField
      FieldName = 'VID_SCHDT'
      Size = 10
    end
    object qryPvdVID_KDSCHKT: TSmallintField
      FieldName = 'VID_KDSCHKT'
    end
    object qryPvdVID_SCHKT: TStringField
      FieldName = 'VID_SCHKT'
      Size = 10
    end
    object qryPvdVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object qryPvdNR: TIntegerField
      FieldName = 'NR'
    end
    object qryPvdDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object qryPvdDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryPvdKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qryPvdKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qryPvdKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryPvdPDN: TSmallintField
      FieldName = 'PDN'
    end
    object qryPvdNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object qryPvdPRR: TSmallintField
      FieldName = 'PRR'
    end
    object qryPvdPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object qryPvdKTO: TSmallintField
      FieldName = 'KTO'
    end
    object qryPvdPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object qryPvdMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object qryPvdSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object qryPvdSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryPvdDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object qryPvdNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object qryPvdSTORN: TStringField
      FieldName = 'STORN'
      FixedChar = True
      Size = 1
    end
    object qryPvdZP13: TStringField
      FieldName = 'ZP13'
      Size = 1
    end
    object qryPvdOTP: TStringField
      FieldName = 'OTP'
      Size = 1
    end
    object qryPvdBLN: TStringField
      FieldName = 'BLN'
      Size = 1
    end
    object qryPvdOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Size = 1
    end
    object qryPvdBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Size = 1
    end
    object qryPvdSPRM: TStringField
      FieldName = 'SPRM'
      Size = 1
    end
    object qryPvdCPRM: TStringField
      FieldName = 'CPRM'
      Size = 1
    end
    object qryPvdDETI: TStringField
      FieldName = 'DETI'
      Size = 1
    end
    object qryPvdDETIM: TStringField
      FieldName = 'DETIM'
      Size = 1
    end
    object qryPvdDETIK: TStringField
      FieldName = 'DETIK'
      Size = 1
    end
    object qryPvdDETIG: TStringField
      FieldName = 'DETIG'
      Size = 1
    end
    object qryPvdIND: TStringField
      FieldName = 'IND'
      Size = 1
    end
    object qryPvdDHD: TStringField
      FieldName = 'DHD'
      Size = 1
    end
    object qryPvdOKLFND: TStringField
      FieldName = 'OKLFND'
      Size = 1
    end
    object qryPvdCBUDG: TStringField
      FieldName = 'CBUDG'
      Size = 1
    end
    object qryPvdSNDB: TStringField
      FieldName = 'SNDB'
      Size = 1
    end
    object qryPvdSPDN: TStringField
      FieldName = 'SPDN'
      Size = 1
    end
    object qryPvdSPRF: TStringField
      FieldName = 'SPRF'
      Size = 1
    end
    object qryPvdSPENS: TStringField
      FieldName = 'SPENS'
      Size = 1
    end
    object qryPvdSALIM: TStringField
      FieldName = 'SALIM'
      Size = 1
    end
    object qryPvdCNDB: TStringField
      FieldName = 'CNDB'
      Size = 1
    end
    object qryPvdSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Size = 1
    end
    object qryPvdSBZR: TStringField
      FieldName = 'SBZR'
      Size = 1
    end
    object qryPvdSP_PF: TStringField
      FieldName = 'SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryPvdSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryPvdSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryPvdSP_FZ: TStringField
      FieldName = 'SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryPvdSOVM: TStringField
      FieldName = 'SOVM'
      Size = 1
    end
    object qryPvdSPOV: TStringField
      FieldName = 'SPOV'
      Size = 1
    end
    object qryPvdIsPst: TStringField
      FieldName = 'Is_Pst'
      Size = 1
    end
  end
  object dsrcPvd: TDataSource
    DataSet = qryPvd
    Left = 240
    Top = 136
  end
  object cdsPrt: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdPst'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'Kuda'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Komu'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'SmPerevoda'
        DataType = ftFloat
      end
      item
        Name = 'SmPSB'
        DataType = ftFloat
      end
      item
        Name = 'SmNDS'
        DataType = ftFloat
      end
      item
        Name = 'SmBezNDS'
        DataType = ftFloat
      end
      item
        Name = 'SpecNR'
        DataType = ftInteger
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Is_Pst'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 168
    Top = 480
    object cdsPrtNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsPrtKdPst: TSmallintField
      FieldName = 'KdPst'
    end
    object cdsPrtTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsPrtKuda: TStringField
      FieldName = 'Kuda'
      Size = 200
    end
    object cdsPrtKomu: TStringField
      FieldName = 'Komu'
      Size = 150
    end
    object cdsPrtSmPerevoda: TFloatField
      FieldName = 'SmPerevoda'
      DisplayFormat = '#.00'
    end
    object cdsPrtSmPSB: TFloatField
      FieldName = 'SmPSB'
      DisplayFormat = '#.00'
    end
    object cdsPrtSmNDS: TFloatField
      FieldName = 'SmNDS'
      DisplayFormat = '#.00'
    end
    object cdsPrtSmBezNDS: TFloatField
      FieldName = 'SmBezNDS'
      DisplayFormat = '#.00'
    end
    object cdsPrtSpecNR: TIntegerField
      FieldName = 'SpecNR'
    end
    object cdsPrtPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsPrtFamIO: TStringField
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsPrtFam: TStringField
      FieldName = 'Fam'
    end
    object cdsPrtIma: TStringField
      FieldName = 'Ima'
      Size = 15
    end
    object cdsPrtOtch: TStringField
      FieldName = 'Otch'
    end
    object Is_Pst: TStringField
      FieldName = 'Is_Pst'
      Size = 1
    end
  end
  object dsrcPrt: TDataSource
    DataSet = cdsPrt
    Left = 184
    Top = 496
  end
end
