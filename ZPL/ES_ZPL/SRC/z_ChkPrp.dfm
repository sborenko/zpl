object FormCheckPrp: TFormCheckPrp
  Left = 389
  Top = 247
  Width = 500
  Height = 350
  Caption = 'FormCheckPrp'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 500
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
  object Splitter1: TSplitter
    Left = 0
    Top = 127
    Width = 492
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      492
      29)
    object sBtnGo: TSpeedButton
      Left = 3
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Go !'
      Enabled = False
      OnClick = sBtnGoClick
    end
    object bBtnCancel: TBitBtn
      Left = 415
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = bBtnCancelClick
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 29
    Width = 492
    Height = 98
    Align = alTop
    DataSource = dsrcTmp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        FieldName = 'PSCH'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VID_KDSPZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VID_SPZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 40
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
        FieldName = 'KDSPS'
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
  object dbgrPrp: TDBGrid
    Left = 0
    Top = 130
    Width = 492
    Height = 193
    Align = alClient
    DataSource = dsrcPrp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pop
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
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsPPS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsInv'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsPens'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSch'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZaMesGod'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmToPFCmn'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmToPFInv'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmSvPrgPf'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForSsTvp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmToSsTvp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmSvPrgTvp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForSsNv'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmToSsNv'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmSvPrgNv'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForFz'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmToFz'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmSvPrgFz'
        Visible = True
      end>
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select *'
      'from VinuMain'
      
        'where (DtProc = '#39'11/01/2006'#39') and (VidN < '#39'6000'#39'  or  VidN > '#39'86' +
        '00'#39')'
      'order by TabN, ZaMesGod, PSCH, VidN,')
    Left = 136
    Top = 64
  end
  object dsrcTmp: TDataSource
    DataSet = qryTmp
    Left = 152
    Top = 72
  end
  object tblPrp: TTable
    DatabaseName = 'c:\Temp'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SmForPF'
        DataType = ftFloat
      end
      item
        Name = 'SmToPFCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmToPFInv'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgPf'
        DataType = ftFloat
      end
      item
        Name = 'SmForSsTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmToSsTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmForSsNv'
        DataType = ftFloat
      end
      item
        Name = 'SmToSsNv'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgNv'
        DataType = ftFloat
      end
      item
        Name = 'SmForFz'
        DataType = ftFloat
      end
      item
        Name = 'SmToFz'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgFz'
        DataType = ftFloat
      end
      item
        Name = 'IsPPS'
        DataType = ftBoolean
      end
      item
        Name = 'IsInv'
        DataType = ftBoolean
      end
      item
        Name = 'IsPens'
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'tx_Prp'
    Left = 204
    Top = 235
    object tblPrpNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblPrpTabN: TIntegerField
      FieldName = 'TabN'
    end
    object tblPrpFamIO: TStringField
      FieldName = 'FamIO'
      Size = 35
    end
    object tblPrpPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object tblPrpZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yyyy'
    end
    object tblPrpSmForPF: TFloatField
      FieldName = 'SmForPF'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToPFCmn: TFloatField
      FieldName = 'SmToPFCmn'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToPFInv: TFloatField
      FieldName = 'SmToPFInv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgPf: TFloatField
      FieldName = 'SmSvPrgPf'
      DisplayFormat = '#.00'
    end
    object tblPrpSmForSsTvp: TFloatField
      FieldName = 'SmForSsTvp'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToSsTvp: TFloatField
      FieldName = 'SmToSsTvp'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgTvp: TFloatField
      FieldName = 'SmSvPrgTvp'
      DisplayFormat = '#.00'
    end
    object tblPrpSmForSsNv: TFloatField
      FieldName = 'SmForSsNv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToSsNv: TFloatField
      FieldName = 'SmToSsNv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgNv: TFloatField
      FieldName = 'SmSvPrgNv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmForFz: TFloatField
      FieldName = 'SmForFz'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToFz: TFloatField
      FieldName = 'SmToFz'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgFz: TFloatField
      FieldName = 'SmSvPrgFz'
      DisplayFormat = '#.00'
    end
    object tblPrpIsPPS: TBooleanField
      FieldName = 'IsPPS'
    end
    object tblPrpIsInv: TBooleanField
      FieldName = 'IsInv'
    end
    object tblPrpIsPens: TBooleanField
      FieldName = 'IsPens'
    end
  end
  object dsrcPrp: TDataSource
    DataSet = tblPrp
    Left = 216
    Top = 248
  end
  object qryPere: TQuery
    SQL.Strings = (
      
        'Select * from z_Pere where TabN = 23838 and Dt_Beg <= '#39'11/01/200' +
        '6'#39
      'order by Dt_Beg desc, NR desc')
    Left = 280
    Top = 184
  end
  object pop: TPopupMenu
    Left = 24
    Top = 184
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1080
      object popSortTabNPSchZaMG: TMenuItem
        Caption = '- '#1058#1072#1073#1053#1088', '#1057#1095#1077#1090', '#1047#1072#1052#1077#1089#1103#1094' '
        Checked = True
        OnClick = popSortTabNPSchZaMGClick
      end
      object popSortTabNZaMGPSch: TMenuItem
        Caption = '- '#1058#1072#1073#1053#1088', '#1047#1072#1052#1077#1089#1103#1094', '#1057#1095#1077#1090
        OnClick = popSortTabNZaMGPSchClick
      end
    end
    object popFilter: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088
      object popFilterOnlySvPorogi: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1079#1072#1087#1080#1089#1080' '#1089#1086' '#1089#1074#1077#1088#1093#1055#1086#1088#1086#1075#1072#1084#1080
        OnClick = popFilterOnlySvPorogiClick
      end
    end
  end
  object tblPrpTt: TTable
    DatabaseName = 'c:\Temp'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SmForPF'
        DataType = ftFloat
      end
      item
        Name = 'SmToPFCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmToPFInv'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgPf'
        DataType = ftFloat
      end
      item
        Name = 'SmForSsTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmToSsTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmForSsNv'
        DataType = ftFloat
      end
      item
        Name = 'SmToSsNv'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgNv'
        DataType = ftFloat
      end
      item
        Name = 'SmForFz'
        DataType = ftFloat
      end
      item
        Name = 'SmToFz'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgFz'
        DataType = ftFloat
      end
      item
        Name = 'IsPPS'
        DataType = ftBoolean
      end
      item
        Name = 'IsInv'
        DataType = ftBoolean
      end
      item
        Name = 'IsPens'
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'tx_PrpTt'
    Left = 276
    Top = 235
    object AutoIncField1: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'TabN'
    end
    object StringField1: TStringField
      FieldName = 'FamIO'
      Size = 35
    end
    object StringField2: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object DateField1: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yyyy'
    end
    object FloatField1: TFloatField
      FieldName = 'SmForPF'
      DisplayFormat = '#.00'
    end
    object FloatField2: TFloatField
      FieldName = 'SmToPFCmn'
      DisplayFormat = '#.00'
    end
    object FloatField3: TFloatField
      FieldName = 'SmToPFInv'
      DisplayFormat = '#.00'
    end
    object FloatField4: TFloatField
      FieldName = 'SmSvPrgPf'
      DisplayFormat = '#.00'
    end
    object FloatField5: TFloatField
      FieldName = 'SmForSsTvp'
      DisplayFormat = '#.00'
    end
    object FloatField6: TFloatField
      FieldName = 'SmToSsTvp'
      DisplayFormat = '#.00'
    end
    object FloatField7: TFloatField
      FieldName = 'SmSvPrgTvp'
      DisplayFormat = '#.00'
    end
    object FloatField8: TFloatField
      FieldName = 'SmForSsNv'
      DisplayFormat = '#.00'
    end
    object FloatField9: TFloatField
      FieldName = 'SmToSsNv'
      DisplayFormat = '#.00'
    end
    object FloatField10: TFloatField
      FieldName = 'SmSvPrgNv'
      DisplayFormat = '#.00'
    end
    object FloatField11: TFloatField
      FieldName = 'SmForFz'
      DisplayFormat = '#.00'
    end
    object FloatField12: TFloatField
      FieldName = 'SmToFz'
      DisplayFormat = '#.00'
    end
    object FloatField13: TFloatField
      FieldName = 'SmSvPrgFz'
      DisplayFormat = '#.00'
    end
    object BooleanField1: TBooleanField
      FieldName = 'IsPPS'
    end
    object BooleanField2: TBooleanField
      FieldName = 'IsInv'
    end
    object BooleanField3: TBooleanField
      FieldName = 'IsPens'
    end
  end
end
