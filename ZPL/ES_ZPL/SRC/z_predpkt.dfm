object FormShPredPkt: TFormShPredPkt
  Left = 375
  Top = 160
  Width = 729
  Height = 492
  BorderIcons = [biSystemMenu]
  Caption = 'FormShPredPkt'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 650
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 721
    Height = 465
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object Splitter1: TSplitter
        Left = 250
        Top = 31
        Height = 403
        Beveled = True
        Color = clActiveCaption
        ParentColor = False
      end
      object dbgrPkt: TDBGrid
        Left = 0
        Top = 31
        Width = 250
        Height = 403
        Align = alLeft
        Color = 16777170
        Constraints.MaxWidth = 450
        Constraints.MinWidth = 250
        DataSource = dsrcPkt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = popPkt
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbgrNdb: TDBGrid
        Left = 253
        Top = 31
        Width = 460
        Height = 403
        Align = alClient
        Color = 13687540
        DataSource = dsrcNdb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPSRSCH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDKDVIDN'
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
            FieldName = 'PRCSOVM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDTEMU'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDKDOBJ'
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
            FieldName = 'PRCHS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRSMM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPEC_NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRPKT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVPKT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRC_WT'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 713
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        DesignSize = (
          713
          31)
        object sbtnNewPkt: TSpeedButton
          Left = 8
          Top = 3
          Width = 75
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090
          Caption = #1053#1086#1074#1099#1081
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnNewPktClick
        end
        object BitBtnClose: TBitBtn
          Left = 633
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          Kind = bkCancel
          Spacing = 0
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 713
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          713
          31)
        object sBtnGetSotr: TSpeedButton
          Left = 14
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1074#1077#1089#1090#1080' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1089#1087#1080#1089#1082#1091' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          Caption = #1057#1087#1080#1089#1086#1082
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnGetSotrClick
        end
        object sBtnSaveToBD: TSpeedButton
          Left = 97
          Top = 3
          Width = 88
          Height = 25
          Hint = #1042#1074#1077#1089#1090#1080' '#1087#1072#1082#1077#1090' '#1085#1072#1076#1073#1074#1086#1082' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1089#1087#1080#1089#1082#1091' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnSaveToBDClick
        end
        object BitBtn1: TBitBtn
          Left = 633
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          Kind = bkCancel
          Spacing = 0
        end
      end
      object dbgr_Ndb: TDBGrid
        Left = 0
        Top = 31
        Width = 713
        Height = 403
        Align = alClient
        Color = 13687540
        DataSource = dsrc_Ndb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = popNdb
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            ReadOnly = True
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            ReadOnly = True
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VidN'
            ReadOnly = True
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SumProc'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 62
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'DtPrBeg'
            Width = 60
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'NrPrBeg'
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'DT_END'
            Width = 53
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'DtPrEnd'
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'NrPrEnd'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NrPkt'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtVPkt'
            ReadOnly = True
            Visible = True
          end>
      end
      object LbxObj: TListBox
        Left = 24
        Top = 194
        Width = 81
        Height = 97
        ItemHeight = 13
        TabOrder = 2
        Visible = False
      end
      object LbxTabN: TListBox
        Left = 112
        Top = 194
        Width = 81
        Height = 97
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
  end
  object qryPkt: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PredPkt')
    UpdateObject = updPkt
    Left = 20
    Top = 82
    object qryPktNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PREDPKT.NR'
    end
    object qryPktKDUSR: TSmallintField
      FieldName = 'KDUSR'
      Origin = 'DbMain.Z_PREDPKT.KDUSR'
    end
    object qryPktNRPKT: TIntegerField
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_PREDPKT.NRPKT'
    end
    object qryPktTIPPKT: TStringField
      FieldName = 'TIPPKT'
      Origin = 'DbMain.Z_PREDPKT.TIPPKT'
      FixedChar = True
      Size = 5
    end
    object qryPktWYEAR: TSmallintField
      FieldName = 'WYEAR'
      Origin = 'DbMain.Z_PREDPKT.WYEAR'
    end
    object qryPktDTPKT: TDateTimeField
      FieldName = 'DTPKT'
      Origin = 'DbMain.Z_PREDPKT.DTPKT'
    end
    object qryPktDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_PREDPKT.DTPROC'
    end
    object qryPktZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_PREDPKT.ZAMESGOD'
    end
    object qryPktZAMGFKT: TDateTimeField
      FieldName = 'ZAMGFKT'
      Origin = 'DbMain.Z_PREDPKT.ZAMGFKT'
    end
    object qryPktNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PREDPKT.NOTES'
      Size = 25
    end
  end
  object dsrcPkt: TDataSource
    DataSet = qryPkt
    Left = 32
    Top = 96
  end
  object qryNdb: TQuery
    OnCalcFields = qryNdbCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcPkt
    SQL.Strings = (
      'select p.*, u.Fam, u.Ima, u.Otch from z_nadb p '
      'Left outer join z_upi u on u.tabn = p.Tabn'
      'where p.nrpkt = :NrPkt  and p.vidn in ('#39'1005'#39', '#39'1006'#39','#39'1008'#39')')
    Left = 548
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NRPKT'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryNdbNR: TIntegerField
      FieldName = 'NR'
    end
    object qryNdbKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryNdbSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
    end
    object qryNdbTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryNdbVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNdbOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object qryNdbSUMPROC: TFloatField
      FieldName = 'SUMPROC'
    end
    object qryNdbSP: TStringField
      FieldName = 'SP'
      Size = 1
    end
    object qryNdbPRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
    end
    object qryNdbDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object qryNdbDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryNdbKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
    end
    object qryNdbOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object qryNdbKDOBJ: TSmallintField
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
      FieldName = 'NOTES'
      Size = 25
    end
    object qryNdbNRPRBEG: TStringField
      FieldName = 'NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPRBEG: TDateTimeField
      FieldName = 'DTPRBEG'
    end
    object qryNdbNRPREND: TStringField
      FieldName = 'NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPREND: TDateTimeField
      FieldName = 'DTPREND'
    end
    object qryNdbNRPKT: TIntegerField
      FieldName = 'NRPKT'
    end
    object qryNdbDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
    end
    object qryNdbPRC_WT: TFloatField
      FieldName = 'PRC_WT'
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
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dsrcNdb: TDataSource
    DataSet = qryNdb
    Left = 564
    Top = 98
  end
  object popPkt: TPopupMenu
    OnPopup = popPktPopup
    Left = 84
    Top = 178
    object N1: TMenuItem
      Caption = '==  '#1055#1072#1082#1077#1090#1099' "'#1057#1087#1077#1094#1085#1072#1076#1073#1072#1074#1086#1082'" =='
      Enabled = False
    end
    object popNewPkt: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090
      OnClick = sbtnNewPktClick
    end
    object popDelPkt: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1072#1082#1077#1090
      OnClick = popDelPktClick
    end
  end
  object dsrc_Ndb: TDataSource
    DataSet = cds_Ndb
    Left = 344
    Top = 240
  end
  object qryTmp: TQuery
    Left = 284
    Top = 99
  end
  object updPkt: TUpdateSQL
    ModifySQL.Strings = (
      'update z_PredPkt'
      'set'
      '  NR = :NR,'
      '  KDUSR = :KDUSR,'
      '  NRPKT = :NRPKT,'
      '  TIPPKT = :TIPPKT,'
      '  WYEAR = :WYEAR,'
      '  DTPKT = :DTPKT,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  ZAMGFKT = :ZAMGFKT,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_PredPkt'
      '  (NR, KDUSR, NRPKT, TIPPKT, WYEAR, DTPKT, DTPROC, ZAMESGOD, '
      'ZAMGFKT, NOTES)'
      'values'
      
        '  (:NR, :KDUSR, :NRPKT, :TIPPKT, :WYEAR, :DTPKT, :DTPROC, :ZAMES' +
        'GOD, '
      ':ZAMGFKT, '
      '   :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_PredPkt'
      'where'
      '  NR = :OLD_NR')
    Left = 52
    Top = 115
  end
  object cds_Ndb: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'SpsRsch'
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
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SumProc'
        DataType = ftFloat
      end
      item
        Name = 'SP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PRCSOVM'
        DataType = ftFloat
      end
      item
        Name = 'DT_BEG'
        DataType = ftDateTime
      end
      item
        Name = 'DT_END'
        DataType = ftDateTime
      end
      item
        Name = 'KDTEMU'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KDKATP'
        DataType = ftSmallint
      end
      item
        Name = 'PRCHS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PRSMM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'SPEC_NR'
        DataType = ftInteger
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrPrBeg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtPrBeg'
        DataType = ftDateTime
      end
      item
        Name = 'NrPrEnd'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtPrEnd'
        DataType = ftDateTime
      end
      item
        Name = 'NrPkt'
        DataType = ftInteger
      end
      item
        Name = 'DtVPkt'
        DataType = ftDateTime
      end
      item
        Name = 'PRC_WT'
        DataType = ftFloat
      end
      item
        Name = 'AddedToNdb'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'OnNR'
        Fields = 'NR'
      end
      item
        Name = 'OnTabN'
        Fields = 'TabN'
      end
      item
        Name = 'OnFamIO'
        Fields = 'FamIO'
      end>
    IndexFieldNames = 'NR'
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 227
    object cds_NdbNR: TAutoIncField
      FieldName = 'NR'
    end
    object cds_NdbKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cds_NdbSpsRsch: TSmallintField
      FieldName = 'SpsRsch'
    end
    object cds_NdbTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cds_NdbFamIO: TStringField
      FieldName = 'FamIO'
      Size = 45
    end
    object cds_NdbVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cds_NdbSumProc: TFloatField
      FieldName = 'SumProc'
    end
    object cds_NdbSP: TStringField
      FieldName = 'SP'
      Size = 1
    end
    object cds_NdbPRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
    end
    object cds_NdbDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object cds_NdbDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object cds_NdbKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
    end
    object cds_NdbKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cds_NdbKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object cds_NdbPRCHS: TStringField
      FieldName = 'PRCHS'
      Size = 1
    end
    object cds_NdbPRSMM: TStringField
      FieldName = 'PRSMM'
      Size = 1
    end
    object cds_NdbKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cds_NdbSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object cds_NdbNotes: TStringField
      FieldName = 'Notes'
      Size = 25
    end
    object cds_NdbNrPrBeg: TStringField
      FieldName = 'NrPrBeg'
      Size = 10
    end
    object cds_NdbDtPrBeg: TDateTimeField
      FieldName = 'DtPrBeg'
    end
    object cds_NdbNrPrEnd: TStringField
      FieldName = 'NrPrEnd'
      Size = 10
    end
    object cds_NdbDtPrEnd: TDateTimeField
      FieldName = 'DtPrEnd'
    end
    object cds_NdbNrPkt: TIntegerField
      FieldName = 'NrPkt'
    end
    object cds_NdbDtVPkt: TDateTimeField
      FieldName = 'DtVPkt'
    end
    object cds_NdbPRC_WT: TFloatField
      FieldName = 'PRC_WT'
    end
    object cds_NdbAddedToNdb: TBooleanField
      FieldName = 'AddedToNdb'
    end
  end
  object popNdb: TPopupMenu
    OnPopup = popNdbPopup
    Left = 468
    Top = 211
    object popHead: TMenuItem
      Caption = '== '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072' =='
      Enabled = False
      RadioItem = True
    end
    object popByNr: TMenuItem
      Caption = '- '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1074#1074#1086#1076#1072
      Checked = True
      RadioItem = True
      OnClick = popByNrClick
    end
    object popByTabN: TMenuItem
      Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
      RadioItem = True
      OnClick = popByTabNClick
    end
    object popByFIO: TMenuItem
      Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
      RadioItem = True
      OnClick = popByFIOClick
    end
  end
end
