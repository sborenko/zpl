object FormMo5: TFormMo5
  Left = 319
  Top = 110
  Width = 870
  Height = 825
  Caption = 'FormMo5'
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
    Top = 385
    Width = 862
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      862
      31)
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Open ViNU'
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 268
      Top = 9
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object SpeedButton2: TSpeedButton
      Left = 96
      Top = 4
      Width = 75
      Height = 25
      Caption = 'CreCdsTmp'
      OnClick = SpeedButton2Click
    end
    object BitBtn1: TBitBtn
      Left = 784
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrNU: TDBGrid
    Left = 0
    Top = 31
    Width = 862
    Height = 354
    Align = alTop
    DataSource = dsrcNU
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ_SPS'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOLNIC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPENS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSOCSTRAH'
        Width = 34
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
        FieldName = 'KEKV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRR'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDVIDN'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VID_KDSPZ'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRPV'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KTO'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRKR'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MYNOTES'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPECPS'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDOBJ'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZP13'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTP'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLN'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTPUSKN'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRM'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPRM'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETI'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIM'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIK'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIG'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DHD'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLFND'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CBUDG'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNDB'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPDN'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRF'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALIM'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNDB'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPOV'
        Width = 10
        Visible = True
      end>
  end
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 388
    Width = 862
    Height = 410
    Align = alClient
    DataSource = dsrcTmp
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
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidN'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShVidN'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSch'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SchBU'
        Width = 83
        Visible = True
      end>
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ViNu_Sps '
      '  where (DtProc = '#39'01/01/2006'#39') '
      '              and TabN in (12394, 15934) '
      '  order by TabN, PSch, VidN desc')
    Left = 64
    Top = 120
    object qryNUKDOBJ_SPS: TSmallintField
      FieldName = 'KDOBJ_SPS'
      Origin = 'DbMain.VINU_SPS.KDOBJ_SPS'
    end
    object qryNUTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.VINU_SPS.TABN'
    end
    object qryNUVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.VINU_SPS.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNUSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VINU_SPS.SHVIDN'
      Size = 15
    end
    object qryNUDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.VINU_SPS.DTPROC'
    end
    object qryNUZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VINU_SPS.ZAMESGOD'
    end
    object qryNUCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.VINU_SPS.CHAS'
    end
    object qryNUSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.VINU_SPS.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryNUPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VINU_SPS.PSCH'
      Size = 10
    end
    object qryNUSCHBU: TStringField
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINU_SPS.SCHBU'
      Size = 10
    end
    object qryNUOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.VINU_SPS.OLDKDVIDN'
    end
    object qryNUVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
      Origin = 'DbMain.VINU_SPS.VID_KDSPZ'
    end
    object qryNUKEKV: TStringField
      FieldName = 'KEKV'
      Origin = 'DbMain.VINU_SPS.KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNUNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VINU_SPS.NR'
    end
    object qryNUDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VINU_SPS.DT_BEG'
    end
    object qryNUDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.VINU_SPS.DT_END'
    end
    object qryNUKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.VINU_SPS.KDSPS'
    end
    object qryNUKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VINU_SPS.KDOBJ'
    end
    object qryNUKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.VINU_SPS.KDKATP'
    end
    object qryNUKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VINU_SPS.KDSPZ'
    end
    object qryNUPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.VINU_SPS.PDN'
    end
    object qryNUNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.VINU_SPS.NOTES'
      Size = 25
    end
    object qryNUPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VINU_SPS.PRR'
    end
    object qryNUPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VINU_SPS.PRPV'
    end
    object qryNUKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VINU_SPS.KTO'
    end
    object qryNUPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VINU_SPS.PRKR'
    end
    object qryNUMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VINU_SPS.MYNOTES'
      Size = 25
    end
    object qryNUSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VINU_SPS.SPECPS'
    end
    object qryNUSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VINU_SPS.SPEC_NR'
    end
    object qryNUOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.VINU_SPS.OLDKDOBJ'
    end
    object qryNUZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.VINU_SPS.ZP13'
      Size = 1
    end
    object qryNUOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.VINU_SPS.OTP'
      Size = 1
    end
    object qryNUBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.VINU_SPS.BLN'
      Size = 1
    end
    object qryNUOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.VINU_SPS.OTPUSKN'
      Size = 1
    end
    object qryNUBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.VINU_SPS.BOLNIC'
      Size = 1
    end
    object qryNUSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.VINU_SPS.SPRM'
      Size = 1
    end
    object qryNUCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.VINU_SPS.CPRM'
      Size = 1
    end
    object qryNUDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.VINU_SPS.DETI'
      Size = 1
    end
    object qryNUDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.VINU_SPS.DETIM'
      Size = 1
    end
    object qryNUDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.VINU_SPS.DETIK'
      Size = 1
    end
    object qryNUDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.VINU_SPS.DETIG'
      Size = 1
    end
    object qryNUIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.VINU_SPS.IND'
      Size = 1
    end
    object qryNUDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.VINU_SPS.DHD'
      Size = 1
    end
    object qryNUOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.VINU_SPS.OKLFND'
      Size = 1
    end
    object qryNUCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VINU_SPS.CBUDG'
      Size = 1
    end
    object qryNUSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.VINU_SPS.SNDB'
      Size = 1
    end
    object qryNUSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.VINU_SPS.SPDN'
      Size = 1
    end
    object qryNUSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.VINU_SPS.SPRF'
      Size = 1
    end
    object qryNUSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.VINU_SPS.SPENS'
      Size = 1
    end
    object qryNUSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.VINU_SPS.SALIM'
      Size = 1
    end
    object qryNUCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.VINU_SPS.CNDB'
      Size = 1
    end
    object qryNUSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.VINU_SPS.SSOCSTRAH'
      Size = 1
    end
    object qryNUSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.VINU_SPS.SBZR'
      Size = 1
    end
    object qryNUSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.VINU_SPS.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.VINU_SPS.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.VINU_SPS.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNUSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.VINU_SPS.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNUSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINU_SPS.SOVM'
      Size = 1
    end
    object qryNUSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.VINU_SPS.SPOV'
      Size = 1
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 80
    Top = 136
  end
  object cds_Tmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'OnPSchVidN'
        Fields = 'PSch;VidN'
      end>
    IndexName = 'OnPSchVidN'
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 448
    object cds_TmpNR: TAutoIncField
      FieldName = 'NR'
    end
    object cds_TmpVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cds_TmpShVidN: TStringField
      FieldName = 'ShVidN'
      Size = 15
    end
    object cds_TmpSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '#.00'
    end
    object cds_TmpPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cds_TmpSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
  end
  object dsrcTmp: TDataSource
    DataSet = tblTmp
    Left = 152
    Top = 472
  end
  object tblTmp: TTable
    DatabaseName = 'C:\TEMP'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'tblTmpIndex1'
        Fields = 'NR'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'OnPSchVidN'
        Fields = 'PSch;VidN'
      end>
    IndexName = 'OnPSchVidN'
    StoreDefs = True
    TableName = 'xxx_123.db'
    TableType = ttParadox
    Left = 128
    Top = 456
    object tblTmpNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblTmpVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object tblTmpShVidN: TStringField
      FieldName = 'ShVidN'
      Size = 15
    end
    object tblTmpSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '#.00'
    end
    object tblTmpPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object tblTmpSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
  end
end
