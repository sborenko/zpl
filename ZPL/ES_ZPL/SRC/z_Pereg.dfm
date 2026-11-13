object FormPeregonu: TFormPeregonu
  Left = 276
  Top = 151
  Width = 973
  Height = 781
  BorderIcons = [biSystemMenu]
  Caption = 'FormPeregonu'
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
  object PageControl: TPageControl
    Left = 0
    Top = 31
    Width = 965
    Height = 723
    ActivePage = tsOVV
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object tsUpi: TTabSheet
      Caption = 'tsUpi'
      object dbgrOldPU: TDBGrid
        Left = 0
        Top = 31
        Width = 957
        Height = 661
        Align = alClient
        Color = clCream
        DataSource = dsrcOldPU
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 957
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 1
          Width = 201
          Height = 26
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1054#1090#1082#1088#1099#1090#1100' Pere/Upi '#1080' '#1087#1077#1088#1077#1075#1085#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' ('#1076#1086#1087#1086#1083#1085#1077#1085#1080#1103') '#1089' 01-01-2005'
          WordWrap = True
        end
        object sBtnOpenUpi: TSpeedButton
          Left = 216
          Top = 3
          Width = 75
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100
          OnClick = sBtnOpenUpiClick
        end
        object sBtnUpiGo: TSpeedButton
          Left = 294
          Top = 3
          Width = 75
          Height = 25
          Caption = #1055#1077#1088#1077#1075#1085#1072#1090#1100
          OnClick = sBtnUpiGoClick
        end
        object LabelCntRecPU: TLabel
          Left = 384
          Top = 8
          Width = 77
          Height = 13
          Caption = 'LabelCntRecPU'
        end
      end
      object LbxNewTabN: TListBox
        Left = 56
        Top = 280
        Width = 241
        Height = 337
        ItemHeight = 13
        TabOrder = 2
      end
    end
    object tsPere: TTabSheet
      Caption = 'tsPere'
      ImageIndex = 1
    end
    object tsSps: TTabSheet
      Caption = 'tsSps'
      ImageIndex = 5
    end
    object tsOtkl: TTabSheet
      Caption = 'tsOtkl'
      ImageIndex = 2
      object dbgrOldOtkl: TDBGrid
        Left = 0
        Top = 0
        Width = 957
        Height = 692
        Align = alClient
        DataSource = dsrcOldOtkl
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
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 33
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
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SZATR'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GODN'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MESN'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRPV'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRKR'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTKUDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VED'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KAT'
            Visible = True
          end>
      end
    end
    object tsBln: TTabSheet
      Caption = 'tsBln'
      ImageIndex = 3
    end
    object tsOtp: TTabSheet
      Caption = 'tsOtp'
      ImageIndex = 4
    end
    object tsOVK: TTabSheet
      Caption = 'tsOVK'
      ImageIndex = 6
      object Splitter1: TSplitter
        Left = 0
        Top = 329
        Width = 957
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object dbgrObj: TDBGrid
        Left = 0
        Top = 0
        Width = 957
        Height = 329
        Align = alTop
        DataSource = dsrcObj
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbgrOVK: TDBGrid
        Left = 0
        Top = 332
        Width = 957
        Height = 360
        Align = alClient
        DataSource = dsrcOVK
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object tsOVV: TTabSheet
      Caption = 'tsOVV'
      ImageIndex = 7
      object Splitter2: TSplitter
        Left = 0
        Top = 329
        Width = 957
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object dbgrVids: TDBGrid
        Left = 0
        Top = 0
        Width = 957
        Height = 329
        Align = alTop
        DataSource = dsrcVids
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbgrOVV: TDBGrid
        Left = 0
        Top = 332
        Width = 957
        Height = 360
        Align = alClient
        DataSource = dsrcOVV
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      965
      31)
    object sBtnGo: TSpeedButton
      Left = 240
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Go!'
      OnClick = sBtnGoClick
    end
    object bBtnClose: TBitBtn
      Left = 887
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object PanelMY: TPanel
      Left = 3
      Top = 3
      Width = 223
      Height = 23
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 1
      object sBtnYMinus: TSpeedButton
        Left = 2
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1075#1086#1076
        Caption = #1043'-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnYMinusClick
      end
      object sBtnMMinus: TSpeedButton
        Left = 24
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1084#1077#1089#1103#1094
        Caption = #1052'-'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnMMinusClick
      end
      object sBtnMPlus: TSpeedButton
        Left = 176
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1084#1077#1089#1103#1094
        Caption = #1052'+'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnMPlusClick
      end
      object sBtnYPlus: TSpeedButton
        Left = 198
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1075#1086#1076
        Caption = #1043'+'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnYPlusClick
      end
      object stTextMY: TStaticText
        Left = 48
        Top = 2
        Width = 126
        Height = 17
        Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' - '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Caption = #1057#1077#1085#1090#1103#1073#1088#1100' 2008'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object qryOldPU: TQuery
    DatabaseName = 'D_01'
    SQL.Strings = (
      'Select u.*, p.* from "pere.dbf" p, "upi.dbf" u '
      ' where (p.Dt_beg > "09/01/2005") and (u.TabN = p.TabN) '
      ' order by u.TabN, p.Dt_Beg')
    Left = 80
    Top = 120
  end
  object dsrcOldPU: TDataSource
    DataSet = qryOldPU
    Left = 96
    Top = 136
  end
  object qryOldOtkl: TQuery
    DatabaseName = 'D_01'
    SQL.Strings = (
      'Select * from "otkl1005.dbf"'
      'order by TabN')
    Left = 712
    Top = 128
  end
  object dsrcOldOtkl: TDataSource
    DataSet = qryOldOtkl
    Left = 728
    Top = 144
  end
  object qryObj: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_KdObj')
    Left = 600
    Top = 128
  end
  object qryOVK: TQuery
    CachedUpdates = True
    AfterPost = qryOVKAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_OVK')
    UpdateObject = updOVK
    Left = 652
    Top = 403
  end
  object dsrcObj: TDataSource
    DataSet = qryObj
    Left = 608
    Top = 144
  end
  object dsrcOVK: TDataSource
    DataSet = qryOVK
    Left = 664
    Top = 416
  end
  object updOVK: TUpdateSQL
    ModifySQL.Strings = (
      'update z_OVK'
      'set'
      '  OLDOBJ = :OLDOBJ,'
      '  OLDVED = :OLDVED,'
      '  SHOBJ = :SHOBJ,'
      '  NMOBJ = :NMOBJ,'
      '  KDOBJ = :KDOBJ'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_OVK'
      '  (OLDOBJ, OLDVED, SHOBJ, NMOBJ, KDOBJ)'
      'values'
      '  (:OLDOBJ, :OLDVED, :SHOBJ, :NMOBJ, :KDOBJ)')
    DeleteSQL.Strings = (
      'delete from z_OVK'
      'where'
      '  NR = :OLD_NR')
    Left = 680
    Top = 432
  end
  object qryVids: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_KdVidN'
      '')
    Left = 656
    Top = 128
  end
  object dsrcVids: TDataSource
    DataSet = qryVids
    Left = 664
    Top = 144
  end
  object qryOVV: TQuery
    CachedUpdates = True
    AfterPost = qryOVVAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_OVV'
      '')
    UpdateObject = updOVV
    Left = 732
    Top = 403
  end
  object dsrcOVV: TDataSource
    DataSet = qryOVV
    Left = 744
    Top = 416
  end
  object updOVV: TUpdateSQL
    ModifySQL.Strings = (
      'update z_OVV'
      'set'
      '  KDVIDN = :KDVIDN,'
      '  SHVIDN = :SHVIDN,'
      '  NMVIDN = :NMVIDN,'
      '  OLDKDVIDN = :OLDKDVIDN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_OVV'
      '  (KDVIDN, SHVIDN, NMVIDN, OLDKDVIDN)'
      'values'
      '  (:KDVIDN, :SHVIDN, :NMVIDN, :OLDKDVIDN)')
    DeleteSQL.Strings = (
      'delete from z_OVV'
      'where'
      '  NR = :OLD_NR')
    Left = 760
    Top = 432
  end
  object qryZOtkl: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Otkl'
      'where NR = -1'
      '')
    UpdateObject = updZOtkl
    Left = 820
    Top = 403
  end
  object updZOtkl: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Otkl'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  KDVIDN = :KDVIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  PDN = :PDN,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  SPEC_NR = :SPEC_NR,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Otkl'
      
        '  (KDSPS, DTPROC, ZAMESGOD, TABN, VIDN, OLDKDVIDN, KDVIDN, CHAS,' +
        ' '
      'SUMMA, '
      
        '   OLDKDOBJ, KDOBJ, KDKATP, DT_BEG, DT_END, PDN, KDSPZ, NOTES, P' +
        'RR, '
      'PRPV, '
      '   KTO, PRKR, SPEC_NR, DTVDPV, NRVDPV, MYNOTES, SPECPS)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :TABN, :VIDN, :OLDKDVIDN, :KDVIDN' +
        ', :CHAS, '
      
        '   :SUMMA, :OLDKDOBJ, :KDOBJ, :KDKATP, :DT_BEG, :DT_END, :PDN, :' +
        'KDSPZ, '
      
        '   :NOTES, :PRR, :PRPV, :KTO, :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV,' +
        ' '
      ':MYNOTES, '
      '   :SPECPS)')
    DeleteSQL.Strings = (
      'delete from z_Otkl'
      'where'
      '  NR = :OLD_NR')
    Left = 832
    Top = 416
  end
  object qryTmp: TQuery
    Left = 572
    Top = 338
  end
  object qryOZS: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_OZS')
    Left = 620
    Top = 338
    object qryOZSNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OZS.NR'
    end
    object qryOZSSZATR: TStringField
      FieldName = 'SZATR'
      Origin = 'DbMain.Z_OZS.SZATR'
      Size = 8
    end
    object qryOZSKDSBU: TIntegerField
      FieldName = 'KDSBU'
      Origin = 'DbMain.Z_OZS.KDSBU'
    end
    object qryOZSSCHBU: TStringField
      FieldName = 'SCHBU'
      Origin = 'DbMain.Z_OZS.SCHBU'
      Size = 10
    end
    object qryOZSNOTE: TStringField
      FieldName = 'NOTE'
      Origin = 'DbMain.Z_OZS.NOTE'
      Size = 75
    end
  end
  object qryUpi: TQuery
    CachedUpdates = True
    AfterPost = qryUpiAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Upi')
    UpdateObject = updUpi
    Left = 80
    Top = 176
  end
  object updUpi: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Upi'
      'set'
      '  TABN = :TABN,'
      '  DOB = :DOB,'
      '  POL = :POL,'
      '  ID = :ID,'
      '  FAM = :FAM,'
      '  IMA = :IMA,'
      '  OTCH = :OTCH'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Upi'
      '  (TABN, DOB, POL, ID, FAM, IMA, OTCH)'
      'values'
      '  (:TABN, :DOB, :POL, :ID, :FAM, :IMA, :OTCH)')
    DeleteSQL.Strings = (
      'delete from Z_Upi'
      'where'
      '  NR = :OLD_NR')
    Left = 88
    Top = 192
  end
  object qryPrmUv: TQuery
    CachedUpdates = True
    AfterPost = qryPrmUvAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PrmUv')
    UpdateObject = updPrmUv
    Left = 128
    Top = 176
  end
  object updPrmUv: TUpdateSQL
    ModifySQL.Strings = (
      'update z_PrmUv'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_PRIEM = :DT_PRIEM,'
      '  DT_UVOLN = :DT_UVOLN,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NR_PRUVOLN = :NR_PRUVOLN,'
      '  DT_PRUVOLN = :DT_PRUVOLN,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_PrmUv'
      
        '  (KDSPS, TABN, DT_PRIEM, DT_UVOLN, NR_PRIKAZA, DT_PRIKAZA, NR_P' +
        'RUVOLN, '
      '   DT_PRUVOLN, NOTES)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_PRIEM, :DT_UVOLN, :NR_PRIKAZA, :DT_PRIKAZA' +
        ', :NR_PRUVOLN, '
      '   :DT_PRUVOLN, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_PrmUv'
      'where'
      '  NR = :OLD_NR')
    Left = 136
    Top = 192
  end
  object qryPere: TQuery
    CachedUpdates = True
    AfterPost = qryPereAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Pere')
    UpdateObject = updPere
    Left = 176
    Top = 176
    object qryPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object qryPereKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_PERE.KDSPS'
    end
    object qryPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PERE.TABN'
    end
    object qryPereDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_PERE.DT_BEG'
    end
    object qryPereKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PERE.KDOBJ'
    end
    object qryPereKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_PERE.KDKATP'
    end
    object qryPerePRCWRKTIME: TFloatField
      FieldName = 'PRCWRKTIME'
      Origin = 'DbMain.Z_PERE.PRCWRKTIME'
    end
    object qryPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'DbMain.Z_PERE.SO'
    end
    object qryPereOKLTRF: TFloatField
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_PERE.OKLTRF'
    end
    object qryPereAVANS: TFloatField
      FieldName = 'AVANS'
      Origin = 'DbMain.Z_PERE.AVANS'
    end
    object qryPereSP_AV: TStringField
      FieldName = 'SP_AV'
      Origin = 'DbMain.Z_PERE.SP_AV'
      Size = 1
    end
    object qryPereKDDOLGN: TSmallintField
      FieldName = 'KDDOLGN'
      Origin = 'DbMain.Z_PERE.KDDOLGN'
    end
    object qryPereDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Origin = 'DbMain.Z_PERE.DOLGNOST'
      Size = 40
    end
    object qryPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_PERE.KDSPZ'
    end
    object qryPerePR_PENS: TSmallintField
      FieldName = 'PR_PENS'
      Origin = 'DbMain.Z_PERE.PR_PENS'
    end
    object qryPereSOVM: TSmallintField
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_PERE.SOVM'
    end
    object qryPerePDNLG: TSmallintField
      FieldName = 'PDNLG'
      Origin = 'DbMain.Z_PERE.PDNLG'
    end
    object qryPerePROCLG: TFloatField
      FieldName = 'PROCLG'
      Origin = 'DbMain.Z_PERE.PROCLG'
    end
    object qryPereKOLMIN: TSmallintField
      FieldName = 'KOLMIN'
      Origin = 'DbMain.Z_PERE.KOLMIN'
    end
    object qryPerePRFS: TSmallintField
      FieldName = 'PRFS'
      Origin = 'DbMain.Z_PERE.PRFS'
    end
    object qryPereNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PERE.NR_PRIKAZA'
      Size = 10
    end
    object qryPereDT_PRIKAZA: TDateTimeField
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PERE.DT_PRIKAZA'
    end
    object qryPereNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PERE.NOTES'
      Size = 35
    end
    object qryPereINV: TSmallintField
      FieldName = 'INV'
      Origin = 'DbMain.Z_PERE.INV'
    end
    object qryPereRANG: TSmallintField
      FieldName = 'RANG'
      Origin = 'DbMain.Z_PERE.RANG'
    end
    object qryPereRAZR: TSmallintField
      FieldName = 'RAZR'
      Origin = 'DbMain.Z_PERE.RAZR'
    end
    object qryPereDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_PERE.DT_END'
    end
    object qryPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_PERE.OLDKDOBJ'
    end
    object qryPerePRDEKR: TStringField
      FieldName = 'PRDEKR'
      Origin = 'DbMain.Z_PERE.PRDEKR'
      FixedChar = True
      Size = 1
    end
    object qryPereCMBOKL: TStringField
      FieldName = 'CMBOKL'
      Origin = 'DbMain.Z_PERE.CMBOKL'
      FixedChar = True
      Size = 1
    end
    object qryPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_PERE.SPEC_NR'
    end
  end
  object updPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Pere'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCWRKTIME = :PRCWRKTIME,'
      '  SO = :SO,'
      '  OKLTRF = :OKLTRF,'
      '  AVANS = :AVANS,'
      '  SP_AV = :SP_AV,'
      '  KDDOLGN = :KDDOLGN,'
      '  DOLGNOST = :DOLGNOST,'
      '  KDSPZ = :KDSPZ,'
      '  PR_PENS = :PR_PENS,'
      '  SOVM = :SOVM,'
      '  PDNLG = :PDNLG,'
      '  PROCLG = :PROCLG,'
      '  KOLMIN = :KOLMIN,'
      '  PRFS = :PRFS,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NOTES = :NOTES,'
      '  INV = :INV,'
      '  RANG = :RANG,'
      '  RAZR = :RAZR,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  PRDEKR = :PRDEKR,'
      '  CMBOKL = :CMBOKL,'
      '  SPEC_NR = :SPEC_NR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Pere'
      
        '  (KDSPS, TABN, DT_BEG, KDOBJ, KDKATP, PRCWRKTIME, SO, OKLTRF, A' +
        'VANS, SP_AV, '
      
        '   KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM, PDNLG, PROCLG, KOLMI' +
        'N, PRFS, '
      
        '   NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RANG, RAZR, DT_END, OLDKD' +
        'OBJ, PRDEKR, '
      '   CMBOKL, SPEC_NR)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_BEG, :KDOBJ, :KDKATP, :PRCWRKTIME, :SO, :O' +
        'KLTRF, '
      
        '   :AVANS, :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :PR_PENS, :SOVM,' +
        ' :PDNLG, '
      
        '   :PROCLG, :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIKAZA, :NOTES, :I' +
        'NV, :RANG, '
      '   :RAZR, :DT_END, :OLDKDOBJ, :PRDEKR, :CMBOKL, :SPEC_NR)')
    DeleteSQL.Strings = (
      'delete from Z_Pere'
      'where'
      '  NR = :OLD_NR')
    Left = 184
    Top = 192
  end
end
