object FormSvdProverka: TFormSvdProverka
  Left = 392
  Top = 190
  Width = 524
  Height = 383
  BorderIcons = [biSystemMenu]
  Caption = 'FormSvdProverka'
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
    Width = 516
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      516
      31)
    object BitBtn1: TBitBtn
      Left = 440
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrPrv: TDBGrid
    Left = 0
    Top = 31
    Width = 516
    Height = 325
    Align = alClient
    DataSource = dsrcPrv
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clCream
        Expanded = False
        FieldName = 'NR'
        Width = 26
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'KDOBJ_SPS'
        Title.Caption = 'KdObj_Sps'
        Width = 40
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'TABN'
        Title.Caption = 'TabN'
        Width = 36
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'FamIO'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForPf_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForPf_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForPfP_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForPfP_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPrgPf_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'PrgPf_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPf_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Pf_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPfP_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'PfP_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPfPInv_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'PfPInv_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForSs_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForSs_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForTvpP_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForTvpP_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPrgTvp_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'PrgTvp_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmSs_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Ss_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmTvpP_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'TvpP_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForNvP_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForNvP_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmNvP_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'NvP_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForFz_1'
        Title.Caption = 'ForFz_1'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForFzP_1'
        Title.Caption = 'ForFzP_1'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPrgFz_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'PrgFz_1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmFz_1'
        Title.Caption = 'Fz_1'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmFzP_1'
        Title.Caption = 'FzP_1'
        Width = 37
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmForPf_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForPf_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 46
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmForPfP_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForPfP_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 53
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmPrgPf_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'PrgPf_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 46
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmPf_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Pf_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmPfP_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'PfP_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 39
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmPfPInv_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'PfPInv_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 51
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmForSs_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForSs_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 46
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmForTvpP_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForTvpP_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 58
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmPrgTvp_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'PrgTvp_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmSs_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Ss_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmTvpP_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'TvpP_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 48
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmForNvP_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'ForNvP_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 55
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmNvP_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'NvP_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmForFz_2'
        Title.Caption = 'ForFz_2'
        Width = 47
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmForFzP_2'
        Title.Caption = 'ForFzP_2'
        Width = 65
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmPrgFz_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'PrgFz_2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmFz_2'
        Title.Caption = 'Fz_2'
        Width = 45
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'SmFzP_2'
        Title.Caption = 'FzP_2'
        Width = 55
        Visible = True
      end>
  end
  object dsrcPrv: TDataSource
    DataSet = tblPrv
    Left = 32
    Top = 160
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from viNu_Sps '
      'where DtProc = '#39'03-01-2006'#39' and TabN = 57721'
      'order by VidN')
    Left = 20
    Top = 106
  end
  object tblPrv: TTable
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj_Sps'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'SmForPf_1'
        DataType = ftFloat
      end
      item
        Name = 'SmForPfP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmPrgPf_1'
        DataType = ftFloat
      end
      item
        Name = 'SmPf_1'
        DataType = ftFloat
      end
      item
        Name = 'SmPfP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmPfPInv_1'
        DataType = ftFloat
      end
      item
        Name = 'SmForSs_1'
        DataType = ftFloat
      end
      item
        Name = 'SmForTvpP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmPrgTvp_1'
        DataType = ftFloat
      end
      item
        Name = 'SmSs_1'
        DataType = ftFloat
      end
      item
        Name = 'SmTvpP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmForNvP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmNvP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmForFz_1'
        DataType = ftFloat
      end
      item
        Name = 'SmForFzP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmPrgFz_1'
        DataType = ftFloat
      end
      item
        Name = 'SmFz_1'
        DataType = ftFloat
      end
      item
        Name = 'SmFzP_1'
        DataType = ftFloat
      end
      item
        Name = 'SmForPf_2'
        DataType = ftFloat
      end
      item
        Name = 'SmForPfP_2'
        DataType = ftFloat
      end
      item
        Name = 'SmPrgPf_2'
        DataType = ftFloat
      end
      item
        Name = 'SmPf_2'
        DataType = ftFloat
      end
      item
        Name = 'SmPfP_2'
        DataType = ftFloat
      end
      item
        Name = 'SmPfPInv_2'
        DataType = ftFloat
      end
      item
        Name = 'SmForSs_2'
        DataType = ftFloat
      end
      item
        Name = 'SmForTvpP_2'
        DataType = ftFloat
      end
      item
        Name = 'SmPrgTvp_2'
        DataType = ftFloat
      end
      item
        Name = 'SmSs_2'
        DataType = ftFloat
      end
      item
        Name = 'SmTvpP_2'
        DataType = ftFloat
      end
      item
        Name = 'SmForNvP_2'
        DataType = ftFloat
      end
      item
        Name = 'SmNvP_2'
        DataType = ftFloat
      end
      item
        Name = 'SmForFz_2'
        DataType = ftFloat
      end
      item
        Name = 'SmForFzP_2'
        DataType = ftFloat
      end
      item
        Name = 'SmPrgFz_2'
        DataType = ftFloat
      end
      item
        Name = 'SmFz_2'
        DataType = ftFloat
      end
      item
        Name = 'SmFzP_2'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'x_SvdPrv.db'
    Left = 20
    Top = 146
    object tblPrvNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblPrvKDOBJ_SPS: TSmallintField
      DisplayWidth = 13
      FieldName = 'KDOBJ_SPS'
    end
    object tblPrvTABN: TIntegerField
      DisplayWidth = 12
      FieldName = 'TABN'
    end
    object tblPrvFamIO: TStringField
      DisplayWidth = 26
      FieldName = 'FamIO'
      Size = 45
    end
    object tblPrvSmForPf_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForPf_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForPfP_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForPfP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPrgPf_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPrgPf_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPf_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPf_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPfP_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPfP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPfPInv_1: TFloatField
      FieldName = 'SmPfPInv_1'
    end
    object tblPrvSmForSs_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForSs_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForTvpP_1: TFloatField
      DisplayWidth = 14
      FieldName = 'SmForTvpP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPrgTvp_1: TFloatField
      DisplayWidth = 13
      FieldName = 'SmPrgTvp_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmSs_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmSs_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmTvpP_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmTvpP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForNvP_1: TFloatField
      DisplayWidth = 13
      FieldName = 'SmForNvP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmNvP_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmNvP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForFz_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForFz_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForFzP_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForFzP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPrgFz_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPrgFz_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmFz_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmFz_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmFzP_1: TFloatField
      DisplayWidth = 12
      FieldName = 'SmFzP_1'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForPf_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForPf_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForPfP_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForPfP_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPrgPf_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPrgPf_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPf_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPf_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPfP_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPfP_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPfPInv_2: TFloatField
      FieldName = 'SmPfPInv_2'
    end
    object tblPrvSmForSs_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForSs_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForTvpP_2: TFloatField
      DisplayWidth = 14
      FieldName = 'SmForTvpP_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPrgTvp_2: TFloatField
      DisplayWidth = 13
      FieldName = 'SmPrgTvp_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmSs_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmSs_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmTvpP_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmTvpP_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForNvP_2: TFloatField
      DisplayWidth = 13
      FieldName = 'SmForNvP_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmNvP_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmNvP_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForFz_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForFz_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmForFzP_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmForFzP_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmPrgFz_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmPrgFz_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmFz_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmFz_2'
      DisplayFormat = '#.00'
    end
    object tblPrvSmFzP_2: TFloatField
      DisplayWidth = 12
      FieldName = 'SmFzP_2'
      DisplayFormat = '#.00'
    end
  end
end
