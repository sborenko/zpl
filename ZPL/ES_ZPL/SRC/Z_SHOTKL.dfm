object FormShwOtkl: TFormShwOtkl
  Left = 488
  Top = 239
  Width = 500
  Height = 510
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwOtkl'
  Color = clBtnFace
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 350
  Constraints.MinWidth = 350
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 492
    Height = 483
    ActivePage = TabSheet1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Splitter1: TSplitter
        Left = 0
        Top = 320
        Width = 484
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clAqua
        MinSize = 65
        ParentColor = False
      end
      object PanelTop: TPanel
        Left = 0
        Top = 0
        Width = 484
        Height = 320
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PanelTop'
        Constraints.MinHeight = 150
        TabOrder = 0
        DesignSize = (
          484
          320)
        object SpeedButton1: TSpeedButton
          Left = 408
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
        end
        object SpeedButton2: TSpeedButton
          Left = 408
          Top = 265
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
        end
        object DBText1: TDBText
          Left = 410
          Top = 56
          Width = 71
          Height = 17
          Anchors = [akTop, akRight]
          DataField = 'ShVidN'
          DataSource = dsrcTmp
        end
        object sBtnVidN: TSpeedButton
          Left = 442
          Top = 32
          Width = 15
          Height = 21
          Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
          Anchors = [akTop, akRight]
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000E0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7700700000778888870077777777777777007770777777877700770007777888
            7700700000778888870000000008887888007700077778787700770007777888
            770077000777788877007777777777777700}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = sBtnVidNClick
        end
        object sBtnFilterOnOff: TSpeedButton
          Left = 461
          Top = 32
          Width = 21
          Height = 21
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1080#1076#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
          AllowAllUp = True
          Anchors = [akTop, akRight]
          GroupIndex = 7
          Caption = '!!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = sBtnFilterOnOffClick
        end
        object dbgrSps: TDBGrid
          Left = 0
          Top = 0
          Width = 401
          Height = 320
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsrcSps
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FamIO'
              Visible = True
            end>
        end
        object BitBtn1: TBitBtn
          Left = 408
          Top = 293
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          Kind = bkCancel
        end
        object dbeKdVidN: TDBEdit
          Left = 408
          Top = 32
          Width = 34
          Height = 21
          Hint = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103') '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072
          Anchors = [akTop, akRight]
          DataField = 'KdVidN'
          DataSource = dsrcTmp
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Visible = False
          OnEnter = dbeKdVidNEnter
          OnExit = dbeKdVidNExit
        end
        object LbxFilter: TListBox
          Left = 45
          Top = 145
          Width = 62
          Height = 32
          Color = clRed
          ItemHeight = 13
          Items.Strings = (
            '1400-1500'
            '1600-1700')
          TabOrder = 3
          Visible = False
        end
      end
      object dbgrOtkl: TDBGrid
        Left = 0
        Top = 323
        Width = 484
        Height = 129
        Align = alClient
        Constraints.MinHeight = 65
        DataSource = dsrcOtkl
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
            FieldName = 'KDSPS'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 45
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
            FieldName = 'PDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 484
        Height = 29
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Panel1'
        TabOrder = 0
        object SpeedButton3: TSpeedButton
          Left = 2
          Top = 2
          Width = 75
          Height = 25
        end
      end
      object dbgrOtklSps: TDBGrid
        Left = 0
        Top = 29
        Width = 484
        Height = 423
        Align = alClient
        DataSource = dsrcOtklSps
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDVIDN'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPZ'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 50
            Visible = True
          end>
      end
    end
  end
  object qrySps: TQuery
    OnCalcFields = qrySpsCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select sps.TabN, sps.DtProc, upi.Fam, upi.Ima, upi.Otch '
      'from Z_Sps sps, Z_Upi upi'
      'where (sps.DtProc = '#39'12-01-2003'#39') and (upi.TabN = sps.TabN)'
      'order by Fam, Ima, Otch')
    Left = 48
    Top = 104
    object qrySpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 6
      FieldName = 'TABN'
    end
    object qrySpsFAM: TStringField
      DisplayWidth = 14
      FieldName = 'FAM'
    end
    object qrySpsIMA: TStringField
      DisplayWidth = 22
      FieldName = 'IMA'
      Size = 15
    end
    object qrySpsOTCH: TStringField
      DisplayWidth = 14
      FieldName = 'OTCH'
    end
    object qrySpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 42
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 64
    Top = 120
  end
  object qryOtkl: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcSps
    SQL.Strings = (
      'Select * from Z_Otkl'
      'where (TabN = :TabN) and (dtProc = :DtProc)'
      'order by KdVidN')
    Left = 40
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
        Size = 8
      end>
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryOtklKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
    end
    object qryOtklZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryOtklVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 3
    end
    object qryOtklOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
    end
    object qryOtklKDVIDN: TSmallintField
      FieldName = 'KDVIDN'
      Origin = 'DbMain.Z_OTKL.KDVIDN'
    end
    object qryOtklCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object qryOtklSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
    end
    object qryOtklOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object qryOtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
    end
    object qryOtklDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
    end
    object qryOtklPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryOtklNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 13
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 64
    Top = 248
  end
  object tblTmp: TTable
    OnCalcFields = tblTmpCalcFields
    DatabaseName = 'Es_Ind'
    FieldDefs = <
      item
        Name = 'KdVidN'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 't_ShOtkl'
    Left = 320
    Top = 64
    object tblTmpKdVidN: TIntegerField
      FieldName = 'KdVidN'
    end
    object tblTmpShVidN: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
  end
  object dsrcTmp: TDataSource
    DataSet = tblTmp
    Left = 328
    Top = 80
  end
  object qryOtklSps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select upi.Fam, upi.Ima, upi.Otch, vid.ShVidN, otkl.* '
      'from Z_Otkl otkl, z_Upi upi, z_KdVidN vid'
      
        'where (upi.TabN = otkl.TabN) and (otkl.dtProc = '#39'12/01/2003'#39') an' +
        'd'
      '      (vid.KdVidN = otkl.KdVidN)'
      'order by Fam, Ima, otch, kdVidN, ZaMesGod')
    Left = 188
    Top = 195
    object qryOtklSpsFAM: TStringField
      FieldName = 'FAM'
    end
    object qryOtklSpsIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryOtklSpsOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryOtklSpsSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHVIDN'
      Size = 10
    end
    object qryOtklSpsNR: TIntegerField
      FieldName = 'NR'
    end
    object qryOtklSpsDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryOtklSpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryOtklSpsKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryOtklSpsKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
    end
    object qryOtklSpsDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
    end
    object qryOtklSpsDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
    end
    object qryOtklSpsKDVIDN: TSmallintField
      DisplayLabel = #1042#1080#1076
      FieldName = 'KDVIDN'
    end
    object qryOtklSpsPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object qryOtklSpsCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1086#1074
      FieldName = 'CHAS'
    end
    object qryOtklSpsSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklSpsNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 13
    end
    object qryOtklSpsPRR: TSmallintField
      FieldName = 'PRR'
    end
    object qryOtklSpsPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object qryOtklSpsKTO: TSmallintField
      FieldName = 'KTO'
    end
    object qryOtklSpsPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object qryOtklSpsZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
    end
    object qryOtklSpsSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryOtklSpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dsrcOtklSps: TDataSource
    DataSet = qryOtklSps
    Left = 200
    Top = 208
  end
end
