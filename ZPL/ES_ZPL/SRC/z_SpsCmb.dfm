object FormSpsCmbOkl: TFormSpsCmbOkl
  Left = 370
  Top = 317
  Width = 835
  Height = 618
  BorderIcons = [biSystemMenu]
  Caption = 'FormSpsCmbOkl'
  Color = clBtnFace
  Constraints.MaxWidth = 935
  Constraints.MinHeight = 435
  Constraints.MinWidth = 650
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
    Left = 294
    Top = 31
    Height = 560
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object dbgrSps: TDBGrid
    Left = 0
    Top = 31
    Width = 294
    Height = 560
    Hint = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1089' "'#1089#1086#1089#1090#1072#1074#1085#1099#1084#1080'" '#1086#1082#1083#1072#1076#1072#1084#1080
    Align = alLeft
    Color = clInfoBk
    DataSource = dsrcSps
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrSpsEnter
    OnExit = dbgrSpsExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OklTrf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdObj'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt_Beg'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      827
      31)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFD0000000000000000000000FDFDFDFD0007070707
        0707070707000700FDFD000000000000000000000000000700FD000707070707
        07FBFBFB0707000000FD00070707070707F8F8F80707000700FD000000000000
        0000000000000007070000070707070707070707070007000700FD0000000000
        00000000000700070000FDFD00FFFFFFFFFFFFFFFF0007000700FDFDFD00FF00
        00000000FF00000000FDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00FF
        0000000000FF00FDFDFDFDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00
        0000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 749
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object PanelRight: TPanel
    Left = 297
    Top = 31
    Width = 530
    Height = 560
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 0
      Top = 235
      Width = 530
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Color = clTeal
      ParentColor = False
    end
    object dbgrPere: TDBGrid
      Left = 0
      Top = 0
      Width = 530
      Height = 235
      Hint = #1057#1086#1089#1090#1072#1074#1085#1099#1077' '#1095#1072#1089#1090#1080' '#1086#1082#1083#1072#1076#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Align = alClient
      Color = clInfoBk
      DataSource = dsrcPere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = dbgrSpsEnter
      OnExit = dbgrSpsExit
      Columns = <
        item
          Expanded = False
          FieldName = 'SCHBU'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRCOKL'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OKLTRF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDoBJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Width = 179
          Visible = True
        end>
    end
    object dbgrNadb: TDBGrid
      Left = 0
      Top = 238
      Width = 530
      Height = 322
      Hint = #1053#1072#1076#1073#1072#1074#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Align = alBottom
      Color = clInfoBk
      DataSource = dsrcNadb
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = dbgrSpsEnter
      OnExit = dbgrSpsExit
      Columns = <
        item
          Expanded = False
          FieldName = 'KDSPS'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
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
          FieldName = 'SUMPROC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SP'
          Width = 18
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          Width = 61
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
          FieldName = 'KdObj'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Width = 36
          Visible = True
        end>
    end
  end
  object qryTmp: TQuery
    Left = 88
    Top = 88
  end
  object cdsSps: TClientDataSet
    Aggregates = <>
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
        Name = 'Dt_Beg'
        DataType = ftDate
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 104
    object cdsSpsNR: TAutoIncField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'NR'
    end
    object cdsSpsTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsSpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsSpsKdObj: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KdObj'
    end
    object cdsSpsOklTrf: TFloatField
      DisplayLabel = #1057#1084#1054#1082#1083
      FieldName = 'OklTrf'
      DisplayFormat = '#.00'
    end
    object cdsSpsSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
    object cdsSpsDt_Beg: TDateField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'Dt_Beg'
    end
  end
  object dsrcSps: TDataSource
    DataSet = cdsSps
    Left = 32
    Top = 120
  end
  object qryPrmUv: TQuery
    Left = 152
    Top = 88
  end
  object qryPere: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select c.PrcOkl, c.OklTrf, c.KdSpZ, s.SchBU, c>KdObj, c.Notes'
      ' from z_CmbOkl c Left outer join Kd_Sbu s on s.KdSch = c.KdSpZ '
      'where c.TabN = 46674 order by s.SchBU')
    Left = 493
    Top = 71
    object qryPerePRCOKL: TFloatField
      DisplayLabel = '%'#1054#1082#1083
      FieldName = 'PRCOKL'
    end
    object qryPereOKLTRF: TFloatField
      DisplayLabel = #1057#1084#1054#1082#1083
      FieldName = 'OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryPereKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095
      FieldName = 'KDSPZ'
    end
    object qryPereSCHBU: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryPereKDoBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDoBJ'
    end
    object qryPereNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object qryNadb: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcSps
    SQL.Strings = (
      
        'Select n.KdSps, n.VidN, v.ShVidN, n.SumProc, n.SP, n.Dt_Beg, n.D' +
        't_End, '
      '       n.KdSpZ, s.SchBU, n.KdObj, n.Notes, n.NrPkt, n.DtVPkt'
      ' from z_Nadb n Left Outer Join z_KdVidN v on v.VidN = n.VidN'
      
        '                         Left Outer Join Kd_Sbu s on s.KdSch = n' +
        '.KdSpZ'
      '       where n.TabN = 46674  and n.dt_Beg <= '#39'12/31/2009'#39' and'
      '                (n.Dt_End is NULL or n.Dt_End > '#39'12/31/2009'#39')'
      'order by n.VidN, s.SchBU, n.Dt_Beg ')
    Left = 341
    Top = 295
    object qryNadbKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryNadbVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNadbSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088' '#1074#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNadbSUMPROC: TFloatField
      DisplayLabel = #1057#1084#1084'/'#1055#1088#1094
      FieldName = 'SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryNadbSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      Size = 1
    end
    object qryNadbDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
    end
    object qryNadbDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
    end
    object qryNadbKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095
      FieldName = 'KDSPZ'
    end
    object qryNadbSCHBU: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryNadbNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object qryNadbNRPKT: TIntegerField
      DisplayLabel = #8470#1087#1082#1090
      FieldName = 'NRPKT'
    end
    object qryNadbDTVPKT: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTVPKT'
    end
    object qryNadbKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
  end
  object dsrcPere: TDataSource
    DataSet = qryPere
    Left = 512
    Top = 80
  end
  object dsrcNadb: TDataSource
    DataSet = qryNadb
    Left = 352
    Top = 312
  end
  object qryCmbOkl: TQuery
    Left = 200
    Top = 88
  end
end
