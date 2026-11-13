object FormMkVed: TFormMkVed
  Left = 291
  Top = 136
  Width = 938
  Height = 595
  BorderIcons = [biSystemMenu]
  Caption = 'FormMkVed'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
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
    Width = 930
    Height = 568
    ActivePage = tsVed
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object tsSps: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082
      object Splitter1: TSplitter
        Left = 193
        Top = 32
        Height = 505
        Beveled = True
      end
      object dbgrSps: TDBGrid
        Left = 0
        Top = 32
        Width = 193
        Height = 505
        Hint = #1057#1087#1080#1089#1086#1082' ('#1074#1099#1076#1077#1083#1077#1085#1099' '#1080#1084#1077#1102#1097#1080#1077' '#1083#1080#1094'.'#1089#1095#1077#1090#1072' '#1074' '#1073#1072#1085#1082#1077')'
        Align = alLeft
        DataSource = dsrcSps
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrSpsDrawColumnCell
        OnDblClick = sBtnGoTo1Click
        Columns = <
          item
            Expanded = False
            FieldName = 'ShObj'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShKatP'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LICSCH'
            Width = 85
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 684
        Height = 32
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object sBtnGoTo1: TSpeedButton
          Left = 3
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnGoTo1Click
        end
      end
      object PanelSpsRight: TPanel
        Left = 196
        Top = 32
        Width = 488
        Height = 505
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanelSpsRight'
        TabOrder = 2
        object LabelTotal: TLabel
          Left = 0
          Top = 492
          Width = 50
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = 'LabelTotal'
        end
        object dbgrNU: TDBGrid
          Left = 0
          Top = 0
          Width = 488
          Height = 492
          Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103'/'#1059#1076#1077#1088#1078#1072#1085#1080#1103' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
          Align = alClient
          DataSource = dsrcNU
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popNU
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrNUDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ZAMESGOD'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShVidN'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmU'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShObj'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShKatP'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Spz'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 67
              Visible = True
            end>
        end
      end
    end
    object tsVed: TTabSheet
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 435
        Width = 922
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
      end
      object dbgrVed: TDBGrid
        Left = 0
        Top = 32
        Width = 922
        Height = 403
        Hint = #1042#1077#1076#1086#1084#1086#1089#1090#1100' ('#1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1080')'
        Align = alClient
        DataSource = dsrcVed
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrVedDrawColumnCell
        OnDblClick = sBtnGoToClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TabN'
            ReadOnly = True
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            ReadOnly = True
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShObj'
            ReadOnly = True
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShKatP'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LicSch'
            ReadOnly = True
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1OtpC'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1OtpB'
            ReadOnly = True
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Rest'
            ReadOnly = True
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Nach'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Udrg'
            ReadOnly = True
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1VudR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Vupl'
            ReadOnly = True
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Daem'
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
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2OtpC'
            ReadOnly = True
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2OtpB'
            ReadOnly = True
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Rest'
            ReadOnly = True
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Nach'
            ReadOnly = True
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Udrg'
            ReadOnly = True
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2VudR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Vupl'
            ReadOnly = True
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Daem'
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
          end>
      end
      object dbgrTots: TDBGrid
        Left = 0
        Top = 438
        Width = 922
        Height = 99
        Hint = #1048#1090#1086#1075#1080' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        Align = alBottom
        DataSource = dsrcTots
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrTotsDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Notes'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1OtpC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1OtpB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Rest'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Nach'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Udrg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1VudR'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Vupl'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1Daem'
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2OtpC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2OtpB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Rest'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Nach'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Udrg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2VudR'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Vupl'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm2Daem'
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
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 922
        Height = 32
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        DesignSize = (
          922
          32)
        object sBtnVvZd: TSpeedButton
          Left = 85
          Top = 3
          Width = 63
          Height = 25
          Hint = #1042#1074#1086#1076' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '
          Caption = #1047#1072#1076#1072#1085#1080#1077
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnVvZdClick
        end
        object sBtnGoTo: TSpeedButton
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Caption = #1055#1077#1088#1077#1081#1090#1080
          OnClick = sBtnGoToClick
          OnMouseMove = sBtnGoToMouseMove
        end
        object SpeedButton6: TSpeedButton
          Left = 148
          Top = 3
          Width = 63
          Height = 25
        end
        object sBtnSave: TSpeedButton
          Left = 211
          Top = 3
          Width = 65
          Height = 25
          Hint = #1047#1072#1087#1080#1089#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Enabled = False
          OnClick = sBtnSaveClick
        end
        object SpeedButton2: TSpeedButton
          Left = 281
          Top = 3
          Width = 24
          Height = 25
          Caption = '?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton2Click
        end
        object Label1: TLabel
          Left = 313
          Top = 2
          Width = 228
          Height = 27
          AutoSize = False
          Caption = 
            #1047#1072#1076#1072#1085#1080#1077' '#1084#1086#1078#1085#1086' '#1087#1086#1074#1090#1086#1088#1103#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1088#1072#1079', '#1087#1086#1082#1072' '#1085#1077' '#1085#1072#1078#1080#1084#1072#1083#1072#1089#1100' '#1082#1085#1086#1087#1082#1072 +
            ' "'#1057#1086#1093#1088#1072#1085#1080#1090#1100'"'
          WordWrap = True
        end
        object Label2: TLabel
          Left = 584
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Label2'
        end
        object bBtnClose: TBitBtn
          Left = 844
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
    end
  end
  object qrySps: TQuery
    AfterScroll = qrySpsAfterScroll
    OnCalcFields = qrySpsCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select distinct u.Fam, u.Ima, u.Otch, s.DtProc, s.KdSps, s.TabN,' +
        ' s.Nch, '
      '           s.KdObj,  s.KdKatP, bls.LicSch  '
      'from Z_SPS s  '
      '        Left Outer Join z_Upi u on u.TabN = s.TabN'
      '        Left Outer Join z_BankiLS bls on bls.TabN = s.TabN'
      'where (s.DtProc = '#39'08/01/2005'#39')  and '
      '                  (s.KdObj in (1001, 1002, 1003, 1004, 1008))'
      'order by s.KdObj, u.Fam, u.Ima, u.Otch')
    Left = 148
    Top = 115
    object qrySpsDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qrySpsKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qrySpsKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qrySpsShObj: TStringField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 15
      Calculated = True
    end
    object qrySpsKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qrySpsShKatP: TStringField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
      FieldKind = fkCalculated
      FieldName = 'ShKatP'
      Size = 10
      Calculated = True
    end
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
    object qrySpsNCH: TStringField
      FieldName = 'NCH'
      FixedChar = True
      Size = 1
    end
    object qrySpsLICSCH: TStringField
      DisplayLabel = #1051#1080#1094'.'#1057#1095'.'#1074' '#1073#1072#1085#1082#1077
      FieldName = 'LICSCH'
      Size = 25
    end
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 160
    Top = 128
  end
  object qryNU: TQuery
    OnCalcFields = qryNUCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcSps
    SQL.Strings = (
      'Select * from Z_Nu'
      'where DtProc = :DtProc and TabN = :TabN and KdSps = :KdSps'
      'order by ZaMesGod, VidN')
    Left = 212
    Top = 115
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftSmallint
        Name = 'KDSPS'
        ParamType = ptUnknown
        Size = 2
      end>
    object qryNUNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NU.NR'
    end
    object qryNUKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NU.KDSPS'
    end
    object qryNUDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_NU.DTPROC'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_NU.ZAMESGOD'
      DisplayFormat = 'mm-yy'
    end
    object qryNUTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NU.TABN'
    end
    object qryNUVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NU.VIDN'
      FixedChar = True
      Size = 3
    end
    object qryNUShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryNUCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_NU.CHAS'
    end
    object qryNUSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_NU.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryNUSmN: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldKind = fkCalculated
      FieldName = 'SmN'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object qryNUSmU: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1086
      FieldKind = fkCalculated
      FieldName = 'SmU'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object qryNUKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NU.KDOBJ'
    end
    object qryNUShObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 15
      Calculated = True
    end
    object qryNUKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NU.KDKATP'
    end
    object qryNUShKatP: TStringField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
      FieldKind = fkCalculated
      FieldName = 'ShKatP'
      Size = 10
      Calculated = True
    end
    object qryNUDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NU.DT_BEG'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryNUDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NU.DT_END'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryNUKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NU.KDSPZ'
    end
    object qryNUSpz: TStringField
      DisplayLabel = #1064#1055#1047
      FieldKind = fkCalculated
      FieldName = 'Spz'
      Size = 10
      Calculated = True
    end
    object qryNUPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.Z_NU.PDN'
    end
    object qryNUNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NU.NOTES'
      Size = 13
    end
    object qryNUPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_NU.PRR'
    end
    object qryNUPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_NU.PRPV'
    end
    object qryNUKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_NU.KTO'
    end
    object qryNUPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_NU.PRKR'
    end
    object qryNUSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NU.SPEC_NR'
    end
    object qryNUMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_NU.MYNOTES'
      Size = 25
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 232
    Top = 128
  end
  object cdsVed: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'nPp'
        DataType = ftSmallint
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
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'ShObj'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KdKatP'
        DataType = ftInteger
      end
      item
        Name = 'ShKatP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LicSch'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Sm1OtpC'
        DataType = ftFloat
      end
      item
        Name = 'Sm1OtpB'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Rest'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Daem'
        DataType = ftFloat
      end
      item
        Name = 'Sm2OtpC'
        DataType = ftFloat
      end
      item
        Name = 'Sm2OtpB'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Rest'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Daem'
        DataType = ftFloat
      end
      item
        Name = 'IsOPZ'
        DataType = ftBoolean
      end
      item
        Name = 'Sm1VudR'
        DataType = ftFloat
      end
      item
        Name = 'Sm2VudR'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 196
    Top = 251
    Data = {
      470200009619E0BD01000000180000001D0000000000030000004702024E5204
      0001000200010007535542545950450200490008004175746F696E6300036E50
      700200010000000000045461624E04000100000000000546616D494F01004900
      000001000557494454480200020023000346616D010049000000010005574944
      544802000200140003496D610100490000000100055749445448020002000F00
      044F7463680100490000000100055749445448020002001400054B644F626A04
      000100000000000553684F626A0100490000000100055749445448020002000F
      00064B644B61745004000100000000000653684B617450010049000000010005
      5749445448020002000A00064C69635363680100490000000100055749445448
      02000200190007536D314F747043080004000000000007536D314F7470420800
      04000000000007536D3152657374080004000000000007536D314E6163680800
      04000000000007536D3155647267080004000000000007536D315675706C0800
      04000000000007536D314461656D080004000000000007536D324F7470430800
      04000000000007536D324F747042080004000000000007536D32526573740800
      04000000000007536D324E616368080004000000000007536D32556472670800
      04000000000007536D325675706C080004000000000007536D324461656D0800
      0400000000000549734F505A020003000000000007536D315675645208000400
      0000000007536D3256756452080004000000000001000C4155544F494E435641
      4C55450400010001000000}
    object cdsVedNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsVednPp: TSmallintField
      FieldName = 'nPp'
    end
    object cdsVedTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsVedFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsVedFam: TStringField
      FieldName = 'Fam'
    end
    object cdsVedIma: TStringField
      FieldName = 'Ima'
      Size = 15
    end
    object cdsVedOtch: TStringField
      FieldName = 'Otch'
    end
    object cdsVedKdObj: TIntegerField
      FieldName = 'KdObj'
    end
    object cdsVedShObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldName = 'ShObj'
      Size = 15
    end
    object cdsVedKdKatP: TIntegerField
      FieldName = 'KdKatP'
    end
    object cdsVedShKatP: TStringField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
      FieldName = 'ShKatP'
      Size = 10
    end
    object cdsVedLicSch: TStringField
      DisplayLabel = #1051#1080#1094'.'#1089#1095#1077#1090' '#1074' '#1073#1072#1085#1082#1077
      FieldName = 'LicSch'
      Size = 25
    end
    object cdsVedSm1OtpC: TFloatField
      DisplayLabel = '1_'#1054#1090#1087#1058
      FieldName = 'Sm1OtpC'
      DisplayFormat = '#.00'
    end
    object cdsVedSm1OtpB: TFloatField
      DisplayLabel = '1_'#1054#1090#1087#1041
      FieldName = 'Sm1OtpB'
      DisplayFormat = '#.00'
    end
    object cdsVedSm1Rest: TFloatField
      DisplayLabel = '1_'#1055#1088#1086#1095
      FieldName = 'Sm1Rest'
      DisplayFormat = '#.00'
    end
    object cdsVedSm1Nach: TFloatField
      DisplayLabel = '1_'#1053#1095#1089#1083
      FieldName = 'Sm1Nach'
      DisplayFormat = '#.00'
    end
    object cdsVedSm1Udrg: TFloatField
      DisplayLabel = '1_'#1059#1076#1088#1078
      FieldName = 'Sm1Udrg'
      DisplayFormat = '#.00'
    end
    object cdsVedSm1VudR: TFloatField
      DisplayLabel = '1_'#1042#1099#1076#1072#1085#1086
      FieldName = 'Sm1VudR'
      DisplayFormat = '#.00'
    end
    object cdsVedSm1Vupl: TFloatField
      DisplayLabel = '1_'#1050#1042#1099#1087#1083#1072#1090#1077
      FieldName = 'Sm1Vupl'
      DisplayFormat = '#.00'
    end
    object cdsVedSm1Daem: TFloatField
      DisplayLabel = '1_'#1042#1042#1077#1076
      FieldName = 'Sm1Daem'
      OnSetText = cdsVedSm1DaemSetText
      DisplayFormat = '#.00'
    end
    object cdsVedSm2OtpC: TFloatField
      DisplayLabel = '2_'#1054#1090#1087#1058
      FieldName = 'Sm2OtpC'
      DisplayFormat = '#.00'
    end
    object cdsVedSm2OtpB: TFloatField
      DisplayLabel = '2_'#1054#1090#1087#1041
      FieldName = 'Sm2OtpB'
      DisplayFormat = '#.00'
    end
    object cdsVedSm2Rest: TFloatField
      DisplayLabel = '2_'#1055#1088#1086#1095
      FieldName = 'Sm2Rest'
      DisplayFormat = '#.00'
    end
    object cdsVedSm2Nach: TFloatField
      DisplayLabel = '2_'#1053#1095#1089#1083
      FieldName = 'Sm2Nach'
      DisplayFormat = '#.00'
    end
    object cdsVedSm2Udrg: TFloatField
      DisplayLabel = '2_'#1059#1076#1088#1078
      FieldName = 'Sm2Udrg'
      DisplayFormat = '#.00'
    end
    object cdsVedSm2VudR: TFloatField
      DisplayLabel = '2_'#1042#1099#1076#1072#1085#1086
      FieldName = 'Sm2VudR'
      DisplayFormat = '#.00'
    end
    object cdsVedSm2Vupl: TFloatField
      DisplayLabel = '2_'#1050#1042#1099#1087#1083#1072#1090#1077
      FieldName = 'Sm2Vupl'
      DisplayFormat = '#.00'
    end
    object cdsVedSm2Daem: TFloatField
      DisplayLabel = '2_'#1042#1042#1077#1076
      FieldName = 'Sm2Daem'
      OnSetText = cdsVedSm2DaemSetText
      DisplayFormat = '#.00'
    end
    object cdsVedIsOPZ: TBooleanField
      FieldName = 'IsOPZ'
    end
  end
  object dsrcVed: TDataSource
    DataSet = cdsVed
    Left = 208
    Top = 264
  end
  object cdsTots: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Sm1OtpC'
        DataType = ftFloat
      end
      item
        Name = 'Sm1OtpB'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Rest'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm1VudR'
        DataType = ftFloat
      end
      item
        Name = 'Sm1Daem'
        DataType = ftFloat
      end
      item
        Name = 'Sm2OtpC'
        DataType = ftFloat
      end
      item
        Name = 'Sm2OtpB'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Rest'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm2VudR'
        DataType = ftFloat
      end
      item
        Name = 'Sm2Daem'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 196
    Top = 307
    Data = {
      6A0100009619E0BD0100000018000000120000000000030000006A01024E5204
      0001000200010007535542545950450200490008004175746F696E6300054E6F
      746573010049000000010005574944544802000200230007536D314F74704308
      0004000000000007536D314F747042080004000000000007536D315265737408
      0004000000000007536D314E616368080004000000000007536D315564726708
      0004000000000007536D315675706C080004000000000007536D315675645208
      0004000000000007536D314461656D080004000000000007536D324F74704308
      0004000000000007536D324F747042080004000000000007536D325265737408
      0004000000000007536D324E616368080004000000000007536D325564726708
      0004000000000007536D325675706C080004000000000007536D325675645208
      0004000000000007536D324461656D080004000000000001000C4155544F494E
      4356414C55450400010001000000}
    object cdsTotsNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsTotsNotes: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
      FieldName = 'Notes'
      Size = 35
    end
    object cdsTotsSm1OtpC: TFloatField
      DisplayLabel = '1_'#1054#1090#1087#1058
      DisplayWidth = 9
      FieldName = 'Sm1OtpC'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm1OtpB: TFloatField
      DisplayLabel = '1_'#1054#1090#1087#1041
      DisplayWidth = 9
      FieldName = 'Sm1OtpB'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm1Rest: TFloatField
      DisplayLabel = '1_'#1055#1088#1086#1095
      DisplayWidth = 8
      FieldName = 'Sm1Rest'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm1Nach: TFloatField
      DisplayLabel = '1_'#1053#1095#1089#1083
      DisplayWidth = 9
      FieldName = 'Sm1Nach'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm1Udrg: TFloatField
      DisplayLabel = '1_'#1059#1076#1088#1078
      DisplayWidth = 9
      FieldName = 'Sm1Udrg'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm1VudR: TFloatField
      DisplayLabel = '1_'#1042#1099#1076#1072#1085#1086
      FieldName = 'Sm1VudR'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm1Vupl: TFloatField
      DisplayLabel = '1_'#1050#1042#1099#1087#1083#1072#1090#1077
      DisplayWidth = 11
      FieldName = 'Sm1Vupl'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm1Daem: TFloatField
      DisplayLabel = '1_'#1042#1042#1077#1076
      DisplayWidth = 9
      FieldName = 'Sm1Daem'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2OtpC: TFloatField
      DisplayLabel = '2_'#1054#1090#1087#1058
      DisplayWidth = 9
      FieldName = 'Sm2OtpC'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2OtpB: TFloatField
      DisplayLabel = '2_'#1054#1090#1087#1041
      DisplayWidth = 10
      FieldName = 'Sm2OtpB'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2Rest: TFloatField
      DisplayLabel = '2_'#1055#1088#1086#1095
      DisplayWidth = 9
      FieldName = 'Sm2Rest'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2Nach: TFloatField
      DisplayLabel = '2_'#1053#1095#1089#1083
      DisplayWidth = 10
      FieldName = 'Sm2Nach'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2Udrg: TFloatField
      DisplayLabel = '2_'#1059#1076#1088#1078
      DisplayWidth = 8
      FieldName = 'Sm2Udrg'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2VudR: TFloatField
      DisplayLabel = '2_'#1042#1099#1076#1072#1085#1086
      FieldName = 'Sm2VudR'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2Vupl: TFloatField
      DisplayLabel = '2_'#1050#1042#1099#1087#1083#1072#1090#1077
      DisplayWidth = 9
      FieldName = 'Sm2Vupl'
      DisplayFormat = '#.00'
    end
    object cdsTotsSm2Daem: TFloatField
      DisplayLabel = '2_'#1042#1042#1077#1076
      DisplayWidth = 10
      FieldName = 'Sm2Daem'
      DisplayFormat = '#.00'
    end
  end
  object dsrcTots: TDataSource
    DataSet = cdsTots
    Left = 208
    Top = 320
  end
  object qrySvOtkl: TQuery
    Left = 380
    Top = 131
  end
  object qrySvNu: TQuery
    Left = 411
    Top = 131
  end
  object popNU: TPopupMenu
    Left = 332
    Top = 219
    object popNuVidSumm: TMenuItem
      Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1091#1084#1084
      object popNuVidSummOne: TMenuItem
        Caption = '- '#1074' '#1086#1076#1085#1086#1081' '#1082#1086#1083#1086#1085#1082#1077
        Checked = True
        OnClick = popNuVidSummOneClick
      end
      object popNuVidSummTwo: TMenuItem
        Caption = '- '#1074' '#1076#1074#1091#1093' '#1082#1086#1083#1086#1085#1082#1072#1093
        OnClick = popNuVidSummTwoClick
      end
    end
  end
  object cdsCheck: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 132
    Top = 251
  end
  object qryTmp: TQuery
    Left = 348
    Top = 131
  end
end
