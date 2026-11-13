object FormSvdNich_1: TFormSvdNich_1
  Left = 303
  Top = 274
  Width = 719
  Height = 460
  BorderIcons = [biSystemMenu]
  Caption = 'FormSvdNich_1'
  Color = clBtnFace
  Constraints.MinHeight = 460
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      711
      31)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
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
    object bBtnCancel: TBitBtn
      Left = 634
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 711
    Height = 402
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086
      object dbgrSvd: TDBGrid
        Left = 0
        Top = 0
        Width = 703
        Height = 371
        Align = alClient
        Color = clCream
        DataSource = dsrcSvd
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
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 152
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
            FieldName = 'VIDN'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMSCH'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #1048#1090#1086#1075#1086#1074#1072#1103
      ImageIndex = 1
      object dbgrTts: TDBGrid
        Left = 0
        Top = 0
        Width = 703
        Height = 371
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcTts
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
            FieldName = 'NR'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SchBU'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmSch'
            Width = 199
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VidN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Smm'
            Width = 69
            Visible = True
          end>
      end
    end
  end
  object qrySvd: TQuery
    OnCalcFields = cdsSvdCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select s.TabN, u.Fam, u.Ima, u.Otch, s.KdObj, s.VidN, s.ShVidN,'
      
        '       s.ZaMesGod, s.KdSpZ, s.SchBU, k.NmSch, Sum(s.Summa) as SM' +
        'M'
      'from ViNuMain s'
      '     Left outer Join z_Upi u on u.TabN = s.TabN'
      '     Left outer Join Kd_Sbu k on k.SchBU = s.SchBU'
      
        'where s.DtProc = '#39'12/01/2007'#39' and s.KdSps = 6 and s.VidN < '#39'8000' +
        #39
      
        'group by s.TabN, u.Fam, u.Ima, u.Otch, s.KdObj, s.VidN, s.ShVidN' +
        ','
      '         s.ZaMesGod, s.KdSpZ, s.SchBU, k.NmSch')
    Left = 32
    Top = 136
  end
  object cdsSvd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSvd'
    OnCalcFields = cdsSvdCalcFields
    Left = 56
    Top = 168
    object cdsSvdTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object cdsSvdFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      ReadOnly = True
      Size = 35
      Calculated = True
    end
    object cdsSvdFAM: TStringField
      FieldName = 'FAM'
    end
    object cdsSvdIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsSvdOTCH: TStringField
      FieldName = 'OTCH'
    end
    object cdsSvdKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object cdsSvdVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsSvdSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsSvdZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
    end
    object cdsSvdKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsSvdSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095#1077#1090
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsSvdNMSCH: TStringField
      FieldName = 'NMSCH'
      Size = 65
    end
    object cdsSvdSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
  end
  object dspSvd: TDataSetProvider
    DataSet = qrySvd
    Left = 64
    Top = 136
  end
  object dsrcSvd: TDataSource
    DataSet = cdsSvd
    Left = 72
    Top = 184
  end
  object cdsTts: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmSch'
        DataType = ftString
        Size = 65
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
        Name = 'Smm'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 140
    Top = 170
    object cdsTtsNR: TAutoIncField
      DisplayLabel = #1053#1088
      FieldName = 'NR'
    end
    object cdsTtsKdSpZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095
      FieldName = 'KdSpZ'
    end
    object cdsTtsNmSch: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1057#1091#1073#1057#1095#1077#1090#1072
      FieldName = 'NmSch'
      Size = 65
    end
    object cdsTtsSchBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095#1077#1090
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsTtsVidN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VidN'
      Size = 4
    end
    object cdsTtsShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsTtsSmm: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Smm'
      DisplayFormat = '#.00'
    end
  end
  object dsrcTts: TDataSource
    DataSet = cdsTts
    Left = 152
    Top = 184
  end
end
