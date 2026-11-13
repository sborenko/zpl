object FormOtp_3_6: TFormOtp_3_6
  Left = 329
  Top = 148
  Width = 713
  Height = 475
  ActiveControl = dbgrSps
  BorderIcons = [biSystemMenu]
  Caption = 'FormOtp_3_6'
  Color = clBtnFace
  Constraints.MaxWidth = 825
  Constraints.MinHeight = 475
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
    Left = 169
    Top = 31
    Height = 417
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 705
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      705
      31)
    object LabelCntSpsRec: TLabel
      Left = 357
      Top = 10
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'LabelCntSpsRec'
    end
    object dbtNmVidN: TDBText
      Left = 5
      Top = 10
      Width = 64
      Height = 13
      AutoSize = True
      DataField = 'NMVIDN'
      DataSource = dsrcVidN
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sBtnPrt: TSpeedButton
      Left = 544
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
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
      Left = 626
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
  object dbgrVidN: TDBGrid
    Left = 0
    Top = 31
    Width = 169
    Height = 417
    Align = alLeft
    Color = 11270370
    DataSource = dsrcVidN
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'VidN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Width = 22
        Visible = True
      end>
  end
  object dbgrSps: TDBGrid
    Left = 172
    Top = 31
    Width = 533
    Height = 417
    Align = alClient
    Color = 11270370
    DataSource = dsrcSps
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 71
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
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 84
        Visible = True
      end>
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, n.* from z_Nadb n'
      ' Left Outer Join z_Upi u on u.TabN = n.TabN'
      ' where n.VidN = '#39'5012'#39' and n.Dt_Beg <= "04/01/2013" and'
      '       (n.Dt_End is NULL or n.Dt_End >= "04/01/2013")')
    Left = 24
    Top = 80
  end
  object cdsVidN: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 120
    object cdsVidNVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VidN'
      FixedChar = True
      Size = 4
    end
    object cdsVidNSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsVidNNMVIDN: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1080#1076#1072
      FieldName = 'NMVIDN'
      Size = 64
    end
    object cdsVidNCNT: TIntegerField
      DisplayLabel = #1050'-'#1074#1086#1047#1072#1087
      FieldName = 'CNT'
    end
  end
  object dsrcVidN: TDataSource
    DataSet = cdsVidN
    OnDataChange = dsrcVidNDataChange
    Left = 40
    Top = 136
  end
  object cdsSps: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsSpsCalcFields
    Left = 256
    Top = 120
    object cdsSpsFAM: TStringField
      FieldName = 'FAM'
    end
    object cdsSpsIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsSpsOTCH: TStringField
      FieldName = 'OTCH'
    end
    object cdsSpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object cdsSpsNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsSpsKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object cdsSpsSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
    end
    object cdsSpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object cdsSpsVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsSpsOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object cdsSpsSUMPROC: TFloatField
      FieldName = 'SUMPROC'
    end
    object cdsSpsSP: TStringField
      FieldName = 'SP'
      Size = 1
    end
    object cdsSpsPRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
    end
    object cdsSpsDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
    end
    object cdsSpsDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
    end
    object cdsSpsOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object cdsSpsKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
    end
    object cdsSpsKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
    end
    object cdsSpsPRCHS: TStringField
      FieldName = 'PRCHS'
      Size = 1
    end
    object cdsSpsPRSMM: TStringField
      FieldName = 'PRSMM'
      Size = 1
    end
    object cdsSpsKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsSpsSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object cdsSpsNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object cdsSpsNRPRBEG: TStringField
      FieldName = 'NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object cdsSpsDTPRBEG: TDateTimeField
      FieldName = 'DTPRBEG'
    end
    object cdsSpsNRPREND: TStringField
      FieldName = 'NRPREND'
      FixedChar = True
      Size = 10
    end
    object cdsSpsDTPREND: TDateTimeField
      FieldName = 'DTPREND'
    end
    object cdsSpsNRPKT: TIntegerField
      FieldName = 'NRPKT'
    end
    object cdsSpsDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
    end
  end
  object dsrcSps: TDataSource
    DataSet = cdsSps
    Left = 272
    Top = 136
  end
  object dspTmp: TDataSetProvider
    Left = 72
    Top = 80
  end
end
