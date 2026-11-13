object FormShwANadb: TFormShwANadb
  Left = 118
  Top = 279
  Width = 983
  Height = 533
  ActiveControl = dbgrNdb
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwANadb'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    967
    494)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      967
      31)
    object LabelCntRec: TLabel
      Left = 4
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnPrt: TSpeedButton
      Left = 815
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
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
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = sBtnPrtClick
    end
    object LabelOrder: TLabel
      Left = 302
      Top = 9
      Width = 52
      Height = 13
      Caption = 'LabelOrder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 118
      Top = 2
      Width = 58
      Height = 28
      Hint = 
        #1050#1083#1072#1074#1080#1096#1077#1081' <F7> '#1080#1083#1080' '#1082#1085#1086#1087#1082#1086#1081' "F7" '#1074#1099#1073#1088#1072#1085#1085#1091#1102' '#1076#1072#1090#1091' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1084#1086#1078#1085#1086' '#1074#1074 +
        #1077#1089#1090#1080' '#1074' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' ('#1042#1077#1088#1085#1091#1090#1100' '#1085#1072#1079#1072#1076' '#1085#1077#1083#1100#1079#1103' !!!)'
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      WordWrap = True
    end
    object sBtnF7: TSpeedButton
      Left = 271
      Top = 3
      Width = 25
      Height = 25
      Hint = 
        #1050#1083#1072#1074#1080#1096#1077#1081' <F7> '#1080#1083#1080' '#1082#1085#1086#1087#1082#1086#1081' "F7" '#1074#1099#1073#1088#1072#1085#1085#1091#1102' '#1076#1072#1090#1091' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1084#1086#1078#1085#1086' '#1074#1074 +
        #1077#1089#1090#1080' '#1074' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' ('#1042#1077#1088#1085#1091#1090#1100' '#1085#1072#1079#1072#1076' '#1085#1077#1083#1100#1079#1103' !!!)'
      Caption = 'F7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnF7Click
    end
    object bBtnCancel: TBitBtn
      Left = 896
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object DateTimePick: TDateTimePicker
      Left = 180
      Top = 5
      Width = 89
      Height = 21
      Hint = 
        #1050#1083#1072#1074#1080#1096#1077#1081' <F7> '#1080#1083#1080' '#1082#1085#1086#1087#1082#1086#1081' "F7" '#1074#1099#1073#1088#1072#1085#1085#1091#1102' '#1076#1072#1090#1091' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1084#1086#1078#1085#1086' '#1074#1074 +
        #1077#1089#1090#1080' '#1074' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' ('#1042#1077#1088#1085#1091#1090#1100' '#1085#1072#1079#1072#1076' '#1085#1077#1083#1100#1079#1103' !!!)'
      Date = 41064.000000000000000000
      Time = 41064.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object dbgrNdb: TDBGrid
    Left = 0
    Top = 31
    Width = 967
    Height = 463
    Hint = #1058#1072#1073#1083#1080#1094#1072' "'#1053#1072#1076#1073#1072#1074#1082#1080'"'
    Align = alClient
    Color = 11861218
    DataSource = dsrcNdb
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = pop
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = popEdtNdbClick
    OnEnter = DbGridEnter
    OnExit = DbGridExit
    OnKeyDown = dbgrNdbKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRC_WT'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 153
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRP'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMPROC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHOBJ'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMKATP'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPRBEG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPRBEG'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPREND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPREND'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISWRK'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIEM'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_UVOLN'
        Width = 72
        Visible = True
      end>
  end
  object dbgrPrmUv: TDBGrid
    Left = 652
    Top = 54
    Width = 305
    Height = 93
    Hint = #1058#1072#1073#1083#1080#1094#1072' "'#1055#1088#1080#1105#1084#1099'/'#1059#1074#1086#1083#1100#1085#1077#1085#1080#1103'"'
    Anchors = [akTop, akRight]
    Color = clMoneyGreen
    DataSource = dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = DbGridEnter
    OnExit = DbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_PRIEM'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_UVOLN'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 106
        Visible = True
      end>
  end
  object qryNdb: TQuery
    CachedUpdates = True
    AfterScroll = qryNdbAfterScroll
    OnCalcFields = qryNdbCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select  u.Fam, u.Ima, u.Otch, v.ShVidN, n.*, w.*,'
      '        s.SchBU as SPZ, kp.ShKatP as NmKatP, ko.ShObj'
      ' from z_Nadb n'
      '    Left outer join z_Upi u on u.TabN = n.TabN'
      '    Left outer join z_KdVidN v on v.VidN = n.VidN'
      '    Left Outer Join Kd_Sbu s on s.KdSch = n.KdSpZ'
      '    Left Outer Join Z_KatPers kp on kp.KdKatP = n.KdKatP'
      '    Left Outer Join z_KdObj ko on ko.KdObj = n.KdObj'
      '    Left Outer Join Z_ISWRK (n.TabN, "05/01/2013") w on 1=1 '
      'where n.Dt_Beg <= '#39'05/31/2013'#39' and '
      '             (n.Dt_End is Null or n.Dt_End >= '#39'05/01/2013'#39')'
      'order by u.Fam, u.Ima, u.Otch, n.TabN')
    UpdateObject = updNdb
    Left = 80
    Top = 120
    object qryNdbNR: TIntegerField
      FieldName = 'NR'
    end
    object qryNdbFAM: TStringField
      FieldName = 'FAM'
    end
    object qryNdbIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryNdbOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryNdbFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryNdbSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNdbKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryNdbSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
    end
    object qryNdbTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryNdbVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNdbGRP: TSmallintField
      DisplayLabel = #1043#1088#1087
      FieldName = 'GRP'
    end
    object qryNdbOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object qryNdbSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084#1084'('#1055#1088#1086#1094')'
      FieldName = 'SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryNdbSP: TStringField
      DisplayLabel = #1088'%'
      FieldName = 'SP'
      Size = 1
    end
    object qryNdbPRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
    end
    object qryNdbDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNdbDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryNdbOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object qryNdbKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryNdbKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qryNdbPRCHS: TStringField
      FieldName = 'PRCHS'
      Size = 1
    end
    object qryNdbPRSMM: TStringField
      FieldName = 'PRSMM'
      Size = 1
    end
    object qryNdbKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryNdbSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryNdbNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object qryNdbNRPRBEG: TStringField
      DisplayLabel = #8470' '#1087#1088'.'#1085#1072#1095'.'
      FieldName = 'NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPRBEG: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1053#1072#1095
      FieldName = 'DTPRBEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbNRPREND: TStringField
      DisplayLabel = #1053#1088#1055#1088#1054#1082#1086#1085#1095
      FieldName = 'NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPREND: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1054#1082#1086#1085#1095'.'
      FieldName = 'DTPREND'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbNRPKT: TIntegerField
      FieldName = 'NRPKT'
    end
    object qryNdbDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
    end
    object qryNdbSPZ: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SPZ'
      Size = 10
    end
    object qryNdbSHOBJ: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldName = 'SHOBJ'
      Size = 15
    end
    object qryNdbNMKATP: TStringField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldName = 'NMKATP'
      Size = 10
    end
    object qryNdbISWRK: TSmallintField
      DisplayLabel = 'IsWrk'
      FieldName = 'ISWRK'
    end
    object qryNdbDT_PRIEM: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1105#1084#1072
      FieldName = 'DT_PRIEM'
    end
    object qryNdbDT_UVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085'.'
      FieldName = 'DT_UVOLN'
    end
    object qryNdbPRC_WT: TFloatField
      DisplayLabel = '% '#1056#1072#1073#1042#1088
      FieldName = 'PRC_WT'
    end
    object qryNdbSPOV_MERGE: TStringField
      FieldName = 'SPOV_MERGE'
      Size = 1
    end
  end
  object dsrcNdb: TDataSource
    DataSet = qryNdb
    Left = 96
    Top = 136
  end
  object pop: TPopupMenu
    Left = 16
    Top = 88
    object popOrder: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popOrderByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        OnClick = popOrderByTabNClick
      end
      object popOrderByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        OnClick = popOrderByFIOClick
      end
      object popOrderByObjFIO: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1082#1072#1090'.'#1087#1077#1088#1089'., '#1060'.'#1048'.'#1054
        OnClick = popOrderByObjFIOClick
      end
      object popOrderByKatPFIO: TMenuItem
        Caption = '- '#1082#1072#1090'.'#1087#1077#1088#1089'., '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060'.'#1048'.'#1054
        OnClick = popOrderByKatPFIOClick
      end
      object popOrderByDtUvoln: TMenuItem
        Caption = '- '#1087#1086' '#1076#1072#1090#1077' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
        OnClick = popOrderByDtUvolnClick
      end
    end
    object popEdtNdb: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' ('#1090#1086' '#1078#1077' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080')'
      Visible = False
      OnClick = popEdtNdbClick
    end
    object popReOpen: TMenuItem
      Caption = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100
      Visible = False
    end
    object popPrmUv: TMenuItem
      Caption = #1055#1088#1080#1077#1084#1099'/'#1059#1074#1086#1083#1100#1085#1077#1085#1080#1103
      Checked = True
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' "'#1055#1088#1080#1077#1084#1099'/'#1059#1074#1086#1083#1100#1085#1077#1085#1080#1103'"'
      OnClick = popPrmUvClick
    end
    object popPrt: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
    end
  end
  object updNdb: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Nadb'
      'set'
      '  KDSPS = :KDSPS,'
      '  SPSRSCH = :SPSRSCH,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  PRCSOVM = :PRCSOVM,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCHS = :PRCHS,'
      '  PRSMM = :PRSMM,'
      '  KDSPZ = :KDSPZ,'
      '  SPEC_NR = :SPEC_NR,'
      '  NOTES = :NOTES,'
      '  NRPRBEG = :NRPRBEG,'
      '  DTPRBEG = :DTPRBEG,'
      '  NRPREND = :NRPREND,'
      '  DTPREND = :DTPREND,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  PRC_WT = :PRC_WT,'
      '  SPOV_MERGE = :SPOV_MERGE'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Nadb'
      '  (KDSPS, SPSRSCH, TABN, VIDN, OLDKDVIDN, SUMPROC, SP, PRCSOVM, '
      'DT_BEG, '
      
        '   DT_END, OLDKDOBJ, KDOBJ, KDKATP, PRCHS, PRSMM, KDSPZ, SPEC_NR' +
        ', '
      'NOTES, '
      '   NRPRBEG, DTPRBEG, NRPREND, DTPREND, NRPKT, DTVPKT, PRC_WT, '
      'SPOV_MERGE)'
      'values'
      
        '  (:KDSPS, :SPSRSCH, :TABN, :VIDN, :OLDKDVIDN, :SUMPROC, :SP, :P' +
        'RCSOVM, '
      
        '   :DT_BEG, :DT_END, :OLDKDOBJ, :KDOBJ, :KDKATP, :PRCHS, :PRSMM,' +
      ':KDSPZ, '
      
        '   :SPEC_NR, :NOTES, :NRPRBEG, :DTPRBEG, :NRPREND, :DTPREND, :NR' +
        'PKT, '
      ':DTVPKT, '
      '   :PRC_WT, :SPOV_MERGE)')
    DeleteSQL.Strings = (
      'delete from z_Nadb'
      'where'
      '  NR = :OLD_NR')
    Left = 112
    Top = 152
  end
  object qryPrmUv: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcNdb
    SQL.Strings = (
      'Select TabN, Dt_Priem, Dt_Uvoln, Notes from z_PrmUv'
      'where TabN = 5852'
      'order by DT_Priem, Dt_Uvoln')
    Left = 608
    Top = 88
    object qryPrmUvTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryPrmUvDT_PRIEM: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1077#1084#1072
      FieldName = 'DT_PRIEM'
    end
    object qryPrmUvDT_UVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085'.'
      FieldName = 'DT_UVOLN'
    end
    object qryPrmUvNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object dsrcPrmUv: TDataSource
    DataSet = qryPrmUv
    Left = 624
    Top = 104
  end
end
