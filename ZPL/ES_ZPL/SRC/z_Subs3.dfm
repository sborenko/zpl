object FormSubs3: TFormSubs3
  Left = 441
  Top = 198
  Width = 584
  Height = 421
  BorderIcons = [biSystemMenu]
  Caption = 'FormSubs3'
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
  object dbgrSubs: TDBGrid
    Left = 0
    Top = 0
    Width = 568
    Height = 357
    Align = alClient
    DataSource = dsrcSubs
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'dtPrc'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmDhd'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmNeOblMP'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmOblMP'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPdn'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPdnOblMP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmAlim'
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 357
    Width = 568
    Height = 25
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      568
      25)
    object Label1: TLabel
      Left = 9
      Top = 6
      Width = 147
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1057#1087#1088#1072#1074#1082#1072' '#1076#1083#1103' '#1089#1091#1073#1089#1080#1076#1080#1081' '#1085#1086#1074#1072#1103
    end
    object bBtnPrtSubs3: TBitBtn
      Left = 427
      Top = 0
      Width = 68
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = bBtnPrtSubs3Click
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
    end
    object bBtnClose: TBitBtn
      Left = 498
      Top = 0
      Width = 68
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 1
      Kind = bkClose
    end
  end
  object cdsSubs: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'dtPrc'
        DataType = ftDate
      end
      item
        Name = 'SmDhd'
        DataType = ftFloat
      end
      item
        Name = 'SmNeOblMP'
        DataType = ftFloat
      end
      item
        Name = 'SmOblMP'
        DataType = ftFloat
      end
      item
        Name = 'SmPdn'
        DataType = ftFloat
      end
      item
        Name = 'SmPdnOblMP'
        DataType = ftFloat
      end
      item
        Name = 'SmAlim'
        DataType = ftFloat
      end
      item
        Name = 'SmDeti'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 120
    object cdsSubsdtPrc: TDateField
      DisplayLabel = #1042' '#1084#1077#1089#1103#1094#1077
      FieldName = 'dtPrc'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsSubsSmDhd: TFloatField
      DisplayLabel = #1057#1084#1044#1093#1076
      FieldName = 'SmDhd'
      DisplayFormat = '#.00'
    end
    object cdsSubsSmNeOblMP: TFloatField
      DisplayLabel = #1057#1084#1053#1077#1054#1073#1083#1052#1055
      FieldName = 'SmNeOblMP'
      DisplayFormat = '#.00'
    end
    object cdsSubsSmOblMP: TFloatField
      DisplayLabel = #1057#1084#1054#1073#1083#1052#1055
      FieldName = 'SmOblMP'
      DisplayFormat = '#.00'
    end
    object cdsSubsSmPdn: TFloatField
      DisplayLabel = #1057#1084#1055#1076#1085
      FieldName = 'SmPdn'
      DisplayFormat = '#.00'
    end
    object cdsSubsSmPdnOblMP: TFloatField
      DisplayLabel = #1057#1084#1055#1076#1085#1054#1073#1083#1052#1055
      FieldName = 'SmPdnOblMP'
      DisplayFormat = '#.00'
    end
    object cdsSubsSmAlim: TFloatField
      DisplayLabel = #1057#1084#1040#1083#1080#1084
      FieldName = 'SmAlim'
      DisplayFormat = '#.00'
    end
    object cdsSubsSmDeti: TFloatField
      DisplayLabel = #1057#1084#1044#1077#1090#1080
      FieldName = 'SmDeti'
      DisplayFormat = '#.00'
    end
  end
  object qryTmp: TQuery
    SQL.Strings = (
      'select dtproc, sum(summa) SMM from ViNuMain where '
      '          dtproc >= '#39'01/01/2014'#39' and dtproc <= '#39'12/01/2014'#39' '
      '                 and Tabn = 1239'
      'group by dtproc')
    Left = 88
    Top = 120
  end
  object dsrcSubs: TDataSource
    DataSet = cdsSubs
    Left = 192
    Top = 136
  end
end
