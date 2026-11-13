object FormUpiLS: TFormUpiLS
  Left = 365
  Top = 386
  Width = 750
  Height = 335
  HelpContext = 60
  BorderIcons = [biSystemMenu]
  Caption = 'FormUpiLS'
  Color = clBtnFace
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 335
  Constraints.MinWidth = 555
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
    Width = 742
    Height = 29
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      29)
    object sBtnPrt: TSpeedButton
      Left = 588
      Top = 2
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
      Anchors = [akTop, akRight]
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object LabelCntRec: TLabel
      Left = 96
      Top = 8
      Width = 36
      Height = 13
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1090#1072#1073#1083#1080#1094#1077
      Caption = '123456'
      ParentShowHint = False
      ShowHint = True
    end
    object LabelUpiFilter: TLabel
      Left = 138
      Top = 8
      Width = 64
      Height = 13
      Caption = 'LabelUpiFilter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sBtnLS: TSpeedButton
      Left = 511
      Top = 2
      Width = 75
      Height = 25
      Hint = #1056#1072#1073#1086#1090#1072' '#1089' '#1083#1080#1094#1077#1074#1099#1084#1080' '#1089#1095#1077#1090#1072#1084#1080
      Anchors = [akTop, akRight]
      Caption = #1057#1095#1077#1090#1072
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = popLSClick
    end
    object sBtnSps: TSpeedButton
      Left = 424
      Top = 2
      Width = 75
      Height = 25
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1087#1080#1089#1082#1080' '#1087#1086' '#1073#1072#1085#1082#1072#1084
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 2
      Caption = #1057#1087#1080#1089#1082#1080
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
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0000000000
        0000000000000000FDFD04FDFDFDFDFDFDFDFDFDFDFDFDFD00FD04FDFDFDFD00
        0000000000FDFDFD00FD04FDFDFDFDFDFDFDFDFDFDFDFDFD00FD04FDFDFDFD00
        00000000FDFDFDFD00FD04FDFDFDFDFDFDFDFDFDFDFDFDFD00FD04FDFD04FD00
        000000FDFD04FDFD00FD04FD0404FDFDFDFDFDFDFD0404FD00FD0404040404FD
        000000FD0404040400FD04FD0404FDFDFDFDFDFDFD0404FD00FD04FDFD04FD00
        00000000FD04FDFD00FD04FDFDFDFDFDFDFDFDFDFDFDFDFD00FDFD0000000000
        0000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnSpsClick
    end
    object LabelCntSpsRec: TLabel
      Left = 337
      Top = 8
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'LabelCntSpsRec'
      Visible = False
    end
    object bBtnCancel: TBitBtn
      Left = 665
      Top = 2
      Width = 75
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Kind = bkCancel
      Spacing = 1
    end
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 2
      Width = 88
      Height = 25
      DataSource = dsrcUpi
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 742
    Height = 279
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'ts1'
      object dbgrUpi: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 248
        Align = alClient
        DataSource = dsrcUpi
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = popMnu
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrUpiDblClick
        OnEditButtonClick = dbgrUpiEditButtonClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        OnKeyDown = dbgrUpiKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            ReadOnly = True
            Title.Caption = #1058#1072#1073#1053#1088
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            ReadOnly = True
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            ReadOnly = True
            Title.Caption = #1048#1084#1103
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBEG'
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
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LICSCH'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Caption = #1051#1080#1094'.'#1089#1095#1077#1090
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDBNK'
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
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHBNK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 136
        Top = 0
        Height = 248
        Beveled = True
        Color = clTeal
        ParentColor = False
      end
      object dbgrBanki: TDBGrid
        Left = 0
        Top = 0
        Width = 136
        Height = 248
        Align = alLeft
        Color = clInfoBk
        DataSource = dsrcBanki
        TabOrder = 0
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
            FieldName = 'KDBNK'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHBNK'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMBNK'
            Width = 118
            Visible = True
          end>
      end
      object dbgrSps: TDBGrid
        Left = 139
        Top = 0
        Width = 595
        Height = 248
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcSps
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = popSps
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 176
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDBNK'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LICSCH'
            Width = 111
            Visible = True
          end>
      end
    end
  end
  object qryUpi: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select upi.*, LS.TabN as LSTN, LS.DtBeg, LS.LicSch, ls.KdBnk, LS' +
        '.ShBnk '
      ' from Z_UPI upi '
      ' Left Outer Join Z_Get_BnkLS(upi.TabN, '#39'04/30/2009'#39') LS on (1=1)'
      ' where not ls.KdBnk is Null'
      ' order by upi.Fam, upi.Ima, upi.Otch, upi.TabN')
    Left = 24
    Top = 88
    object qryUpiNR: TIntegerField
      FieldName = 'NR'
    end
    object qryUpiTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryUpiFAM: TStringField
      FieldName = 'FAM'
    end
    object qryUpiIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryUpiOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryUpiDOB: TDateTimeField
      FieldName = 'DOB'
    end
    object qryUpiPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object qryUpiPRUV: TSmallintField
      FieldName = 'PRUV'
    end
    object qryUpiID: TStringField
      DisplayLabel = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1048#1044
      FieldName = 'ID'
      Size = 10
    end
    object qryUpiLSTN: TIntegerField
      FieldName = 'LSTN'
    end
    object qryUpiLICSCH: TStringField
      FieldName = 'LICSCH'
      Size = 25
    end
    object qryUpiKDBNK: TSmallintField
      DisplayLabel = #1050#1076#1041#1085#1082
      FieldName = 'KDBNK'
    end
    object qryUpiSHBNK: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldName = 'SHBNK'
      Size = 10
    end
    object qryUpiDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089
      FieldName = 'DTBEG'
    end
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    Left = 40
    Top = 104
  end
  object qryLS: TQuery
    CachedUpdates = True
    AfterPost = qryLSAfterPost
    AfterDelete = qryLSAfterDelete
    DatabaseName = 'DbMain'
    DataSource = dsrcUpi
    SQL.Strings = (
      'Select * from Z_BankiLS'
      'where TabN = :TabN')
    UpdateObject = updLS
    Left = 104
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptInput
        Size = 4
      end>
    object qryLSNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_BANKILS.NR'
    end
    object qryLSTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_BANKILS.TABN'
    end
    object qryLSDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_BANKILS.DTBEG'
    end
    object qryLSLICSCH: TStringField
      FieldName = 'LICSCH'
      Origin = 'DbMain.Z_BANKILS.LICSCH'
      Size = 25
    end
    object qryLSKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_BANKILS.KDBNK'
    end
    object qryLSNmBnk: TStringField
      FieldKind = fkLookup
      FieldName = 'NmBnk'
      LookupDataSet = DmMain.qryBanki
      LookupKeyFields = 'KDBNK'
      LookupResultField = 'NMBNK'
      KeyFields = 'KDBNK'
      Size = 35
      Lookup = True
    end
    object qryLSNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
  end
  object dsrcLS: TDataSource
    DataSet = qryLS
    Left = 120
    Top = 104
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 88
    Top = 168
    object popLsHead: TMenuItem
      Caption = '==  '#1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090'  =='
      Enabled = False
    end
    object popLS: TMenuItem
      Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1083#1080#1094#1077#1074#1099#1084#1080' '#1089#1095#1077#1090#1072#1084#1080
      OnClick = popLSClick
    end
    object popLsSep1: TMenuItem
      Caption = '-'
    end
    object popLsPoisk: TMenuItem
      Caption = #1055#1086#1080#1089#1082' ...'
      object popLsPoiskFIO: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
        ShortCut = 16454
        OnClick = popLsPoiskFIOClick
      end
      object popLsPoiskTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        ShortCut = 114
        OnClick = popLsPoiskTabNClick
      end
    end
    object popLsOrder: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popLsOrderByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        RadioItem = True
        OnClick = popLsOrderByFIOClick
      end
      object popLsOrderByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        RadioItem = True
        OnClick = popLsOrderByTabNClick
      end
    end
    object opLsFilter: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088
      object popLsFilterAll: TMenuItem
        Caption = '- '#1073#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        Checked = True
        RadioItem = True
        OnClick = popLsFilterAllClick
      end
      object popLsFilterLS: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1089' '#1083#1080#1094#1077#1074#1099#1084#1080' '#1089#1095#1077#1090#1072#1084#1080
        RadioItem = True
        OnClick = popLsFilterLSClick
      end
      object popLsFilterID: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1089' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088#1072#1084#1080
        RadioItem = True
        OnClick = popLsFilterIDClick
      end
    end
  end
  object updLS: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_BankiLS'
      'set'
      '  TABN = :TABN,'
      '  DTBEG = :DTBEG,'
      '  LICSCH = :LICSCH,'
      '  KDBNK = :KDBNK,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_BankiLS'
      '  (TABN, DTBEG, LICSCH, KDBNK, NOTES)'
      'values'
      '  (:TABN, :DTBEG, :LICSCH, :KDBNK, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_BankiLS'
      'where'
      '  NR = :OLD_NR')
    Left = 136
    Top = 120
  end
  object popPrt: TPopupMenu
    AutoPopup = False
    Left = 552
    Top = 104
    object popPrtHead: TMenuItem
      Caption = '==  '#1055#1077#1095#1072#1090#1100'  =='
      Enabled = False
    end
    object popPrtLS: TMenuItem
      Caption = '- '#1083#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072
      Hint = #1057#1087#1080#1089#1086#1082' '#1080#1084#1077#1102#1097#1080#1093' '#1083#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072
      OnClick = popPrtLSClick
    end
    object popPrtAll: TMenuItem
      Caption = '- '#1074#1077#1089#1100' '#1089#1087#1080#1089#1086#1082' ('#1076#1086#1083#1075#1086'!)'
      Hint = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1075#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' ('#1076#1086#1083#1075#1086'!)'
      OnClick = popPrtAllClick
    end
  end
  object cdsBanki: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KDBNK'
        DataType = ftSmallint
      end
      item
        Name = 'SHBNK'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NMBNK'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspTmp'
    StoreDefs = True
    Left = 296
    Top = 120
    object cdsBankiKDBNK: TSmallintField
      DisplayLabel = #1050#1076#1041#1085#1082
      FieldName = 'KDBNK'
    end
    object cdsBankiSHBNK: TStringField
      DisplayLabel = #1064#1092#1088#1041#1085#1082
      FieldName = 'SHBNK'
      Size = 10
    end
    object cdsBankiNMBNK: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldName = 'NMBNK'
      Size = 35
    end
  end
  object dsrcBanki: TDataSource
    DataSet = cdsBanki
    OnDataChange = dsrcBankiDataChange
    Left = 312
    Top = 136
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct p.KdBnk, p.ShBnk, p.NmBnk'
      '  from Z_BankiLS LS'
      
        '       Left Outer Join Z_Get_BnkLS(LS.TabN, '#39'04/15/2009'#39') p on (' +
        '1=1) '
      'where not p.KdBnk is Null'
      'order by p.ShBnk')
    Left = 272
    Top = 88
  end
  object dspTmp: TDataSetProvider
    DataSet = qryTmp
    Left = 304
    Top = 88
  end
  object qrySps: TQuery
    OnCalcFields = qrySpsCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcBanki
    SQL.Strings = (
      'Select Upi.TabN, upi.Fam, upi.Ima, upi.Otch, upi.ID, '
      '       p.DtBeg, p.LicSch,  p.KdBnk, p.ShBnk, p.NmBnk'
      '  from z_Upi upi'
      
        '       Left Outer Join Z_Get_BnkLS(Upi.TabN, '#39'04/15/2009'#39') p on ' +
        '(1=1) '
      'where p.KdBnk = :KdBnk')
    Left = 404
    Top = 88
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDBNK'
        ParamType = ptUnknown
        Size = 2
      end>
    object qrySpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qrySpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qrySpsFAM: TStringField
      FieldName = 'FAM'
    end
    object qrySpsIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qrySpsOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qrySpsID: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092'.'
      FieldName = 'ID'
      Size = 10
    end
    object qrySpsDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089
      FieldName = 'DTBEG'
    end
    object qrySpsKDBNK: TSmallintField
      DisplayLabel = #1041#1085#1082
      FieldName = 'KDBNK'
    end
    object qrySpsSHBNK: TStringField
      FieldName = 'SHBNK'
      Size = 10
    end
    object qrySpsNMBNK: TStringField
      FieldName = 'NMBNK'
      Size = 35
    end
    object qrySpsLICSCH: TStringField
      DisplayLabel = #1051#1080#1094'.'#1057#1095#1077#1090
      FieldName = 'LICSCH'
      Size = 25
    end
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 416
    Top = 104
  end
  object popSps: TPopupMenu
    Left = 212
    Top = 168
    object popSpsOrderHead: TMenuItem
      Caption = '= = '#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1089#1087#1080#1089#1082#1072' = ='
      Enabled = False
    end
    object popSpsOrderByFIO: TMenuItem
      Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
      GroupIndex = 1
      RadioItem = True
      OnClick = popSpsOrderByFIOClick
    end
    object popSpsOrderByTabN: TMenuItem
      Caption = '- '#1087#1086' '#1058#1072#1073'.'#1085#1086#1084#1077#1088#1091
      GroupIndex = 1
      RadioItem = True
      OnClick = popSpsOrderByTabNClick
    end
    object popSpsOrderByLS: TMenuItem
      Caption = '- '#1087#1086' '#1083#1080#1094#1077#1074#1099#1084' '#1089#1095#1077#1090#1072#1084
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = popSpsOrderByLSClick
    end
    object popSpsOrderByID: TMenuItem
      Caption = '- '#1087#1086' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088#1072#1084
      GroupIndex = 1
      RadioItem = True
      OnClick = popSpsOrderByIDClick
    end
  end
end
