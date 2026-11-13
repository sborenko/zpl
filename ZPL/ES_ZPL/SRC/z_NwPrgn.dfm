object FormNewPeregonu: TFormNewPeregonu
  Left = 342
  Top = 170
  Width = 725
  Height = 725
  BorderIcons = [biSystemMenu]
  Caption = 'FormNewPeregonu'
  Color = clBtnFace
  Constraints.MinHeight = 395
  Constraints.MinWidth = 725
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      717
      31)
    object BitBtn1: TBitBtn
      Left = 639
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 717
    Height = 667
    ActivePage = ts3
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'z_UPI, z_Prm_Uv, z_Pere'
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 656
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 
          #1059#1076#1072#1083#1103#1102#1090#1089#1103' '#1042#1057#1045' '#1079#1072#1087#1080#1089#1080' '#1074' z_Upi, z_PrmUv, z_Pere '#1080' '#1087#1086'-'#1085#1086#1074#1086#1081' '#1079#1072#1085#1086#1089#1103#1090 +
          #1089#1103' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1080#1079' '#1092#1072#1081#1083#1086#1074' '#1089#1090#1072#1088#1086#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' Upi.dbf '#1080' Pere.dbf'
        Color = clCream
        ParentColor = False
        WordWrap = True
      end
      object dbgrUpiPere: TDBGrid
        Left = 0
        Top = 13
        Width = 839
        Height = 592
        Align = alClient
        DataSource = dsrcUpiPere
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
            Width = 39
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
            FieldName = 'BRIG'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DROJD'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KATPREM'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POL'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            Width = 11
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            Width = 10
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DPRIEM'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DUVOLN'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOLGNOST'
            Width = 55
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
            Width = 5
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PRIKP'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PRIKP'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PRIKU'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PRIKU'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PRIKAZA'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PRIKAZA'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RANG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INVALID'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PR_PENS'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOVM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SZATRO'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKLTRFOLD'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKLTRF'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AVANS'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ND'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDNLG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOLMIN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MSNLG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SBERK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KRD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ISPL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEREVOD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SSUDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRFS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRUDERG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRUV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D13ZP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DVUSL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SRDPRM91'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDENT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEKR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LGOTA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBJ_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VED_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SO_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKLTRF_1'
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
            FieldName = 'KAT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOLGNOST_1'
            Width = 72
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 605
        Width = 839
        Height = 31
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object sBtnClearNewBD: TSpeedButton
          Left = 3
          Top = 4
          Width = 126
          Height = 25
          Hint = 
            #1042#1084#1077#1089#1090#1077' '#1089' Z_Upi '#1090#1088#1080#1075#1075#1077#1088' '#1086#1095#1080#1089#1090#1080#1090' '#1074#1089#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1086' '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1090#1072#1073#1083#1080 +
            #1094#1099
          Caption = '1.'#1054#1095#1080#1089#1090#1080#1090#1100' Z_UPI'
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnClearNewBDClick
        end
        object sBtnOpenOldUpiPere: TSpeedButton
          Left = 131
          Top = 4
          Width = 161
          Height = 25
          Caption = '2. '#1054#1090#1082#1088#1099#1090#1100' Upi.dbf - Pere.dbf'
          OnClick = sBtnOpenOldUpiPereClick
        end
        object sBtnFillNewBD: TSpeedButton
          Left = 294
          Top = 4
          Width = 200
          Height = 25
          Caption = '3. '#1047#1072#1087#1086#1083#1085#1080#1090#1100' z_Upi, z_PrmUv, z_Pere'
          OnClick = sBtnFillNewBDClick
        end
        object sBtnUpdUpi: TSpeedButton
          Left = 496
          Top = 4
          Width = 200
          Height = 25
          Caption = '3. '#1047#1072#1087#1086#1083#1085#1080#1090#1100' z_Upi, z_PrmUv, z_Pere'
          OnClick = sBtnUpdUpiClick
        end
      end
      object PanelWait: TPanel
        Left = 664
        Top = 280
        Width = 218
        Height = 41
        Caption = #1046#1076#1080#1090#1077' ! . .   '#1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1079#1072#1076#1072#1085#1080#1077' !'
        Color = clMoneyGreen
        TabOrder = 2
      end
    end
    object ts2: TTabSheet
      Caption = 'Nadb.dbf -> Z_Nadb'
      ImageIndex = 1
      object dbgrOldNadb: TDBGrid
        Left = 0
        Top = 0
        Width = 839
        Height = 605
        Align = alClient
        DataSource = dsrcOldNadb
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel3: TPanel
        Left = 0
        Top = 605
        Width = 839
        Height = 31
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object sBtnNadbDbf: TSpeedButton
          Left = 3
          Top = 4
          Width = 157
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100' Nadb.dbf'
          OnClick = sBtnNadbDbfClick
        end
        object sBtnClearZNadb: TSpeedButton
          Left = 163
          Top = 4
          Width = 157
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' Z_Nadb'
          OnClick = sBtnClearZNadbClick
        end
        object sBtnFillZNadb: TSpeedButton
          Left = 323
          Top = 4
          Width = 157
          Height = 25
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' Z_Nadb'
          OnClick = sBtnFillZNadbClick
        end
      end
    end
    object ts3: TTabSheet
      Caption = 'Nu -> Z_NU'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 605
        Width = 709
        Height = 31
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        object sBtnOpenNU: TSpeedButton
          Left = 133
          Top = 4
          Width = 133
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100' Nu_00_05.db'
          OnClick = sBtnOpenNUClick
        end
        object sBtnClearZNU: TSpeedButton
          Left = 268
          Top = 4
          Width = 100
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' Z_NU'
          OnClick = sBtnClearZNUClick
        end
        object sBtnFillZNU: TSpeedButton
          Left = 371
          Top = 4
          Width = 133
          Height = 25
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' Z_NU '#1079#1072' '#1075#1086#1076
          OnClick = sBtnFillZNUClick
        end
        object sBtnSetYear: TSpeedButton
          Left = 4
          Top = 4
          Width = 79
          Height = 25
          Caption = #1042#1099#1073#1086#1088' '#1075#1086#1076#1072
          OnClick = sBtnSetYearClick
        end
        object LabelYearNU: TLabel
          Left = 87
          Top = 10
          Width = 38
          Height = 13
          Caption = 'YearNU'
        end
      end
      object dbgrOldNU: TDBGrid
        Left = 0
        Top = 0
        Width = 709
        Height = 605
        Align = alClient
        DataSource = dsrcOldNU
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NuDb'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FileNu'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBJ'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VED'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KAT'
            Width = 24
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
            FieldName = 'VIDN'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 24
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
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUM8DR'
            Width = 4
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SZATR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTKUDA'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRPV'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRKR'
            Width = 31
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Sps -> Z_Sps'
      ImageIndex = 3
      object dbgrOldSps: TDBGrid
        Left = 0
        Top = 0
        Width = 709
        Height = 605
        Align = alClient
        DataSource = dsrcOldSps
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel5: TPanel
        Left = 0
        Top = 605
        Width = 709
        Height = 31
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object sBtNOpenOldSps: TSpeedButton
          Left = 133
          Top = 4
          Width = 133
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100' Sp_00_05.db'
          OnClick = sBtNOpenOldSpsClick
        end
        object sBtnClearSps: TSpeedButton
          Left = 268
          Top = 4
          Width = 100
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' Z_Sps'
          OnClick = sBtnClearSpsClick
        end
        object sBtnFillSps: TSpeedButton
          Left = 371
          Top = 4
          Width = 133
          Height = 25
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' Z_Sps '#1079#1072' '#1075#1086#1076
          OnClick = sBtnFillSpsClick
        end
        object sBtnYearSps: TSpeedButton
          Left = 4
          Top = 4
          Width = 79
          Height = 25
          Caption = #1042#1099#1073#1086#1088' '#1075#1086#1076#1072
          OnClick = sBtnYearSpsClick
        end
        object LabelYearSps: TLabel
          Left = 87
          Top = 10
          Width = 38
          Height = 13
          Caption = 'YearNU'
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Otkl -> Z_Otkl'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 605
        Width = 709
        Height = 31
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        object sBtNOpenOldOtkl: TSpeedButton
          Left = 133
          Top = 4
          Width = 133
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100' Otkl_00_05.db'
          OnClick = sBtNOpenOldOtklClick
        end
        object SpeedButton2: TSpeedButton
          Left = 268
          Top = 4
          Width = 100
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' Z_Otkl'
          OnClick = SpeedButton2Click
        end
        object sBtnFillZOtkl: TSpeedButton
          Left = 371
          Top = 4
          Width = 142
          Height = 25
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' Z_Otkl '#1079#1072' '#1075#1086#1076
          OnClick = sBtnFillZOtklClick
        end
        object sBtnYearOtkl: TSpeedButton
          Left = 4
          Top = 4
          Width = 79
          Height = 25
          Caption = #1042#1099#1073#1086#1088' '#1075#1086#1076#1072
          OnClick = sBtnYearOtklClick
        end
        object LabelYearOtkl: TLabel
          Left = 87
          Top = 10
          Width = 41
          Height = 13
          Caption = 'YearOtkl'
        end
      end
      object dbgrOldOtkl: TDBGrid
        Left = 0
        Top = 0
        Width = 709
        Height = 605
        Align = alClient
        DataSource = dsrcOldOtkl
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Z_Uderg'
      ImageIndex = 5
    end
    object TabSheet1: TTabSheet
      Caption = 'Graf_Otp => Z_VOtp'
      ImageIndex = 6
      object dbgrOldGrOtp: TDBGrid
        Left = 0
        Top = 0
        Width = 839
        Height = 605
        Align = alClient
        DataSource = dsrcOldGrOtp
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel7: TPanel
        Left = 0
        Top = 605
        Width = 839
        Height = 31
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object sBtnOpenGrOtp: TSpeedButton
          Left = 37
          Top = 4
          Width = 133
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100' Graf_Otp.dbf'
          OnClick = sBtnOpenGrOtpClick
        end
        object sBtnClearZOtp: TSpeedButton
          Left = 197
          Top = 4
          Width = 210
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' Z_VOtp ('#1090#1086#1083#1100#1082#1086' dbf'#39#1086#1074#1089#1082#1080#1077')'
          OnClick = sBtnClearZOtpClick
        end
        object sBtnFillZVOtp: TSpeedButton
          Left = 429
          Top = 4
          Width = 202
          Height = 25
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' Z_ZOtp '#1080#1079' Graf_Otp.dbf'
          OnClick = sBtnFillZVOtpClick
        end
      end
    end
  end
  object qryUpiPere: TQuery
    DatabaseName = 'D_01'
    SQL.Strings = (
      'select u.*, p.* '
      'from "pere.dbf" p, "upi.dbf" u'
      'where  (u.TabN = p.TabN)'
      'order by u.TabN, p.Dt_Beg')
    Left = 20
    Top = 90
    object qryUpiPereTABN: TBCDField
      FieldName = 'TABN'
      Origin = 'D_01."pere.DBF".TABN'
      Precision = 5
      Size = 0
    end
    object qryUpiPereOBJ: TBCDField
      FieldName = 'OBJ'
      Origin = 'D_01."pere.DBF".DT_BEG'
      Precision = 3
      Size = 0
    end
    object qryUpiPereVED: TBCDField
      FieldName = 'VED'
      Origin = 'D_01."pere.DBF".DT_END'
      Precision = 3
      Size = 0
    end
    object qryUpiPereBRIG: TBCDField
      FieldName = 'BRIG'
      Origin = 'D_01."pere.DBF".OBJ'
      Precision = 2
      Size = 0
    end
    object qryUpiPereKATPREM: TBCDField
      FieldName = 'KATPREM'
      Origin = 'D_01."pere.DBF".VED'
      Precision = 2
      Size = 0
    end
    object qryUpiPereFAM: TStringField
      FieldName = 'FAM'
      Origin = 'D_01."pere.DBF".SO'
    end
    object qryUpiPereIMA: TStringField
      FieldName = 'IMA'
      Origin = 'D_01."pere.DBF".OKLTRF'
      Size = 15
    end
    object qryUpiPereOTCH: TStringField
      FieldName = 'OTCH'
      Origin = 'D_01."pere.DBF".SZATR'
    end
    object qryUpiPereDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Origin = 'D_01."pere.DBF".KAT'
      Size = 40
    end
    object qryUpiPereRAZR: TBCDField
      FieldName = 'RAZR'
      Origin = 'D_01."pere.DBF".DOLGNOST'
      Precision = 2
      Size = 0
    end
    object qryUpiPereRANG: TBCDField
      FieldName = 'RANG'
      Origin = 'D_01."pere.DBF".NR_PRIKAZA'
      Precision = 2
      Size = 0
    end
    object qryUpiPereINVALID: TBCDField
      FieldName = 'INVALID'
      Origin = 'D_01."pere.DBF".DT_PRIKAZA'
      Precision = 1
      Size = 0
    end
    object qryUpiPerePR_PENS: TBCDField
      FieldName = 'PR_PENS'
      Origin = 'D_01."upi.DBF".TABN'
      Precision = 1
      Size = 0
    end
    object qryUpiPerePOL: TStringField
      FieldName = 'POL'
      Origin = 'D_01."upi.DBF".OBJ'
      Size = 1
    end
    object qryUpiPereSOVM: TBCDField
      FieldName = 'SOVM'
      Origin = 'D_01."upi.DBF".VED'
      Precision = 1
      Size = 0
    end
    object qryUpiPereSZATRO: TStringField
      FieldName = 'SZATRO'
      Origin = 'D_01."upi.DBF".BRIG'
      Size = 8
    end
    object qryUpiPereSO: TBCDField
      FieldName = 'SO'
      Origin = 'D_01."upi.DBF".KATPREM'
      Precision = 1
      Size = 0
    end
    object qryUpiPereOKLTRFOLD: TBCDField
      FieldName = 'OKLTRFOLD'
      Origin = 'D_01."upi.DBF".FAM'
      Precision = 12
      Size = 2
    end
    object qryUpiPereOKLTRF: TBCDField
      FieldName = 'OKLTRF'
      Origin = 'D_01."upi.DBF".IMA'
      Precision = 12
      Size = 2
    end
    object qryUpiPereAVANS: TBCDField
      FieldName = 'AVANS'
      Origin = 'D_01."upi.DBF".OTCH'
      Precision = 9
      Size = 2
    end
    object qryUpiPereND: TBCDField
      FieldName = 'ND'
      Origin = 'D_01."upi.DBF".DOLGNOST'
      Precision = 1
      Size = 0
    end
    object qryUpiPerePDNLG: TBCDField
      FieldName = 'PDNLG'
      Origin = 'D_01."upi.DBF".RAZR'
      Precision = 1
      Size = 0
    end
    object qryUpiPereKOLMIN: TBCDField
      FieldName = 'KOLMIN'
      Origin = 'D_01."upi.DBF".RANG'
      Precision = 2
      Size = 0
    end
    object qryUpiPereMSNLG: TBCDField
      FieldName = 'MSNLG'
      Origin = 'D_01."upi.DBF".INVALID'
      Precision = 1
      Size = 0
    end
    object qryUpiPereSTR: TBCDField
      FieldName = 'STR'
      Origin = 'D_01."upi.DBF".PR_PENS'
      Precision = 1
      Size = 0
    end
    object qryUpiPereSBERK: TBCDField
      FieldName = 'SBERK'
      Origin = 'D_01."upi.DBF".POL'
      Precision = 1
      Size = 0
    end
    object qryUpiPereKRD: TBCDField
      FieldName = 'KRD'
      Origin = 'D_01."upi.DBF".SOVM'
      Precision = 1
      Size = 0
    end
    object qryUpiPereALM: TBCDField
      FieldName = 'ALM'
      Origin = 'D_01."upi.DBF".SZATRO'
      Precision = 1
      Size = 0
    end
    object qryUpiPereISPL: TBCDField
      FieldName = 'ISPL'
      Origin = 'D_01."upi.DBF".SO'
      Precision = 1
      Size = 0
    end
    object qryUpiPerePEREVOD: TBCDField
      FieldName = 'PEREVOD'
      Origin = 'D_01."upi.DBF".OKLTRFOLD'
      Precision = 1
      Size = 0
    end
    object qryUpiPereSSUDA: TBCDField
      FieldName = 'SSUDA'
      Origin = 'D_01."upi.DBF".OKLTRF'
      Precision = 1
      Size = 0
    end
    object qryUpiPerePRFS: TBCDField
      FieldName = 'PRFS'
      Origin = 'D_01."upi.DBF".AVANS'
      Precision = 1
      Size = 0
    end
    object qryUpiPerePRUDERG: TBCDField
      FieldName = 'PRUDERG'
      Origin = 'D_01."upi.DBF".ND'
      Precision = 1
      Size = 0
    end
    object qryUpiPereDPRIEM: TDateField
      FieldName = 'DPRIEM'
      Origin = 'D_01."upi.DBF".PDNLG'
    end
    object qryUpiPereDUVOLN: TDateField
      FieldName = 'DUVOLN'
      Origin = 'D_01."upi.DBF".KOLMIN'
    end
    object qryUpiPerePRUV: TBCDField
      FieldName = 'PRUV'
      Origin = 'D_01."upi.DBF".MSNLG'
      Precision = 4
      Size = 2
    end
    object qryUpiPereD13ZP: TDateField
      FieldName = 'D13ZP'
      Origin = 'D_01."upi.DBF".STR'
    end
    object qryUpiPereDVUSL: TDateField
      FieldName = 'DVUSL'
      Origin = 'D_01."upi.DBF".SBERK'
    end
    object qryUpiPereSRDPRM91: TBCDField
      FieldName = 'SRDPRM91'
      Origin = 'D_01."upi.DBF".KRD'
      Precision = 8
      Size = 2
    end
    object qryUpiPereNR_PRIKP: TStringField
      FieldName = 'NR_PRIKP'
      Origin = 'D_01."upi.DBF".ALM'
      Size = 10
    end
    object qryUpiPereDT_PRIKP: TDateField
      FieldName = 'DT_PRIKP'
      Origin = 'D_01."upi.DBF".ISPL'
    end
    object qryUpiPereNR_PRIKU: TStringField
      FieldName = 'NR_PRIKU'
      Origin = 'D_01."upi.DBF".PEREVOD'
      Size = 10
    end
    object qryUpiPereDT_PRIKU: TDateField
      FieldName = 'DT_PRIKU'
      Origin = 'D_01."upi.DBF".SSUDA'
    end
    object qryUpiPereIDENT: TStringField
      FieldName = 'IDENT'
      Origin = 'D_01."upi.DBF".PRFS'
      Size = 10
    end
    object qryUpiPereDROJD: TDateField
      FieldName = 'DROJD'
      Origin = 'D_01."upi.DBF".PRUDERG'
    end
    object qryUpiPereDEKR: TBCDField
      FieldName = 'DEKR'
      Origin = 'D_01."upi.DBF".DPRIEM'
      Precision = 1
      Size = 0
    end
    object qryUpiPereLS: TStringField
      FieldName = 'LS'
      Origin = 'D_01."upi.DBF".DUVOLN'
      Size = 16
    end
    object qryUpiPereLGOTA: TBCDField
      FieldName = 'LGOTA'
      Origin = 'D_01."upi.DBF".PRUV'
      Precision = 3
      Size = 0
    end
    object qryUpiPereTABN_1: TBCDField
      FieldName = 'TABN_1'
      Origin = 'D_01."upi.DBF".D13ZP'
      Precision = 5
      Size = 0
    end
    object qryUpiPereDT_BEG: TDateField
      FieldName = 'DT_BEG'
      Origin = 'D_01."upi.DBF".DVUSL'
    end
    object qryUpiPereDT_END: TDateField
      FieldName = 'DT_END'
      Origin = 'D_01."upi.DBF".SRDPRM91'
    end
    object qryUpiPereOBJ_1: TBCDField
      FieldName = 'OBJ_1'
      Origin = 'D_01."upi.DBF".NR_PRIKP'
      Precision = 3
      Size = 0
    end
    object qryUpiPereVED_1: TBCDField
      FieldName = 'VED_1'
      Origin = 'D_01."upi.DBF".DT_PRIKP'
      Precision = 3
      Size = 0
    end
    object qryUpiPereSO_1: TBCDField
      FieldName = 'SO_1'
      Origin = 'D_01."upi.DBF".NR_PRIKU'
      Precision = 1
      Size = 0
    end
    object qryUpiPereOKLTRF_1: TBCDField
      FieldName = 'OKLTRF_1'
      Origin = 'D_01."upi.DBF".DT_PRIKU'
      Precision = 11
      Size = 2
    end
    object qryUpiPereSZATR: TStringField
      FieldName = 'SZATR'
      Origin = 'D_01."upi.DBF".IDENT'
      Size = 8
    end
    object qryUpiPereKAT: TBCDField
      FieldName = 'KAT'
      Origin = 'D_01."upi.DBF".DROJD'
      Precision = 2
      Size = 0
    end
    object qryUpiPereDOLGNOST_1: TStringField
      FieldName = 'DOLGNOST_1'
      Origin = 'D_01."upi.DBF".DEKR'
    end
    object qryUpiPereNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Origin = 'D_01."upi.DBF".LS'
      Size = 10
    end
    object qryUpiPereDT_PRIKAZA: TDateField
      FieldName = 'DT_PRIKAZA'
      Origin = 'D_01."upi.DBF".LGOTA'
    end
  end
  object dsrcUpiPere: TDataSource
    DataSet = qryUpiPere
    Left = 32
    Top = 104
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    Left = 44
    Top = 210
  end
  object qryPere: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Pere')
    UpdateObject = updPere
    Left = 116
    Top = 138
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
    Left = 128
    Top = 152
  end
  object qryUpi: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Upi')
    UpdateObject = updUpi
    Left = 20
    Top = 138
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
    Left = 32
    Top = 152
  end
  object qryPrmUv: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PrmUv')
    UpdateObject = updPrmUv
    Left = 68
    Top = 138
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
    Left = 80
    Top = 152
  end
  object qryOldNadb: TQuery
    DatabaseName = 'D_01'
    SQL.Strings = (
      'select * from nadb'
      'order by tabn, dt_Beg')
    Left = 196
    Top = 130
    object qryOldNadbTABN: TBCDField
      FieldName = 'TABN'
      Origin = 'D_01."nadb.DBF".TABN'
      Precision = 5
      Size = 0
    end
    object qryOldNadbVIDN: TBCDField
      FieldName = 'VIDN'
      Origin = 'D_01."nadb.DBF".VIDN'
      Precision = 3
      Size = 0
    end
    object qryOldNadbSUMPROC: TBCDField
      FieldName = 'SUMPROC'
      Origin = 'D_01."nadb.DBF".SUMPROC'
      Precision = 12
      Size = 2
    end
    object qryOldNadbSP: TStringField
      FieldName = 'SP'
      Origin = 'D_01."nadb.DBF".SP'
      Size = 1
    end
    object qryOldNadbDT_BEG: TDateField
      FieldName = 'DT_BEG'
      Origin = 'D_01."nadb.DBF".DT_BEG'
    end
    object qryOldNadbDT_END: TDateField
      FieldName = 'DT_END'
      Origin = 'D_01."nadb.DBF".DT_END'
    end
    object qryOldNadbSZATR: TStringField
      FieldName = 'SZATR'
      Origin = 'D_01."nadb.DBF".SZATR'
      Size = 8
    end
    object qryOldNadbOBJ: TBCDField
      FieldName = 'OBJ'
      Origin = 'D_01."nadb.DBF".OBJ'
      Precision = 3
      Size = 0
    end
    object qryOldNadbVED: TBCDField
      FieldName = 'VED'
      Origin = 'D_01."nadb.DBF".VED'
      Precision = 3
      Size = 0
    end
    object qryOldNadbKAT: TBCDField
      FieldName = 'KAT'
      Origin = 'D_01."nadb.DBF".KAT'
      Precision = 2
      Size = 0
    end
    object qryOldNadbDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Origin = 'D_01."nadb.DBF".DOLGNOST'
      Size = 15
    end
    object qryOldNadbNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Origin = 'D_01."nadb.DBF".NR_PRIKAZA'
      Size = 10
    end
    object qryOldNadbDT_PRIKAZA: TDateField
      FieldName = 'DT_PRIKAZA'
      Origin = 'D_01."nadb.DBF".DT_PRIKAZA'
    end
    object qryOldNadbNR_PRIKEND: TStringField
      FieldName = 'NR_PRIKEND'
      Origin = 'D_01."nadb.DBF".NR_PRIKEND'
      Size = 10
    end
    object qryOldNadbDT_PRIKEND: TDateField
      FieldName = 'DT_PRIKEND'
      Origin = 'D_01."nadb.DBF".DT_PRIKEND'
    end
  end
  object dsrcOldNadb: TDataSource
    DataSet = qryOldNadb
    Left = 208
    Top = 144
  end
  object qryNadb: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Nadb')
    UpdateObject = updNadb
    Left = 204
    Top = 186
  end
  object updNadb: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Nadb'
      'set'
      '  KDSPS = :KDSPS,'
      '  SPSRSCH = :SPSRSCH,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  KDVIDN = :KDVIDN,'
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
      '  SPEC_NR = :SPEC_NR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Nadb'
      
        '  (KDSPS, SPSRSCH, TABN, VIDN, OLDKDVIDN, KDVIDN, SUMPROC, SP, P' +
        'RCSOVM, '
      
        '   DT_BEG, DT_END, OLDKDOBJ, KDOBJ, KDKATP, PRCHS, PRSMM, KDSPZ,' +
        ' SPEC_NR)'
      'values'
      
        '  (:KDSPS, :SPSRSCH, :TABN, :VIDN, :OLDKDVIDN, :KDVIDN, :SUMPROC' +
        ', :SP, '
      
        '   :PRCSOVM, :DT_BEG, :DT_END, :OLDKDOBJ, :KDOBJ, :KDKATP, :PRCH' +
        'S, :PRSMM, '
      '   :KDSPZ, :SPEC_NR)')
    DeleteSQL.Strings = (
      'delete from z_Nadb'
      'where'
      '  NR = :OLD_NR')
    Left = 216
    Top = 200
  end
  object qryOZS: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_OZS')
    Left = 44
    Top = 250
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
  object qryOldNU: TQuery
    DatabaseName = 'ZY_PDX9305'
    SQL.Strings = (
      'Select *'
      'from nu_00_05'
      'order by TabN, FileNU, GodN, MesN, VidN')
    Left = 260
    Top = 130
    object qryOldNUNuDb: TStringField
      FieldName = 'NuDb'
      Origin = 'ZY_PDX9305."nu_00_05.DB".NuDb'
      Size = 6
    end
    object qryOldNUFileNu: TStringField
      FieldName = 'FileNu'
      Origin = 'ZY_PDX9305."nu_00_05.DB".FileNu'
      Size = 6
    end
    object qryOldNUTABN: TFloatField
      FieldName = 'TABN'
      Origin = 'ZY_PDX9305."nu_00_05.DB".TABN'
    end
    object qryOldNUOBJ: TSmallintField
      FieldName = 'OBJ'
      Origin = 'ZY_PDX9305."nu_00_05.DB".OBJ'
    end
    object qryOldNUVED: TSmallintField
      FieldName = 'VED'
      Origin = 'ZY_PDX9305."nu_00_05.DB".VED'
    end
    object qryOldNUKAT: TSmallintField
      FieldName = 'KAT'
      Origin = 'ZY_PDX9305."nu_00_05.DB".KAT'
    end
    object qryOldNUDT_BEG: TDateField
      FieldName = 'DT_BEG'
      Origin = 'ZY_PDX9305."nu_00_05.DB".DT_BEG'
    end
    object qryOldNUDT_END: TDateField
      FieldName = 'DT_END'
      Origin = 'ZY_PDX9305."nu_00_05.DB".DT_END'
    end
    object qryOldNUVIDN: TSmallintField
      FieldName = 'VIDN'
      Origin = 'ZY_PDX9305."nu_00_05.DB".VIDN'
    end
    object qryOldNUPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'ZY_PDX9305."nu_00_05.DB".PDN'
    end
    object qryOldNUGODN: TSmallintField
      FieldName = 'GODN'
      Origin = 'ZY_PDX9305."nu_00_05.DB".GODN'
    end
    object qryOldNUMESN: TSmallintField
      FieldName = 'MESN'
      Origin = 'ZY_PDX9305."nu_00_05.DB".MESN'
    end
    object qryOldNUCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'ZY_PDX9305."nu_00_05.DB".CHAS'
    end
    object qryOldNUSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'ZY_PDX9305."nu_00_05.DB".SUMMA'
    end
    object qryOldNUSUM8DR: TFloatField
      FieldName = 'SUM8DR'
      Origin = 'ZY_PDX9305."nu_00_05.DB".SUM8DR'
    end
    object qryOldNUSZATR: TStringField
      FieldName = 'SZATR'
      Origin = 'ZY_PDX9305."nu_00_05.DB".SZATR'
      Size = 8
    end
    object qryOldNUOTKUDA: TStringField
      FieldName = 'OTKUDA'
      Origin = 'ZY_PDX9305."nu_00_05.DB".OTKUDA'
      Size = 13
    end
    object qryOldNUPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'ZY_PDX9305."nu_00_05.DB".PRR'
    end
    object qryOldNUPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'ZY_PDX9305."nu_00_05.DB".PRPV'
    end
    object qryOldNUKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'ZY_PDX9305."nu_00_05.DB".KTO'
    end
    object qryOldNUPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'ZY_PDX9305."nu_00_05.DB".PRKR'
    end
  end
  object dsrcOldNU: TDataSource
    DataSet = qryOldNU
    Left = 272
    Top = 144
  end
  object qryZNu: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_NU')
    UpdateObject = updZNu
    Left = 268
    Top = 186
    object qryZNuNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NU.NR'
    end
    object qryZNuKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NU.KDSPS'
    end
    object qryZNuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_NU.DTPROC'
    end
    object qryZNuZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_NU.ZAMESGOD'
    end
    object qryZNuTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NU.TABN'
    end
    object qryZNuVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NU.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryZNuOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_NU.OLDKDVIDN'
    end
    object qryZNuKDVIDN: TSmallintField
      FieldName = 'KDVIDN'
      Origin = 'DbMain.Z_NU.KDVIDN'
    end
    object qryZNuCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_NU.CHAS'
    end
    object qryZNuSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_NU.SUMMA'
    end
    object qryZNuOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_NU.OLDKDOBJ'
    end
    object qryZNuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NU.KDOBJ'
    end
    object qryZNuKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NU.KDKATP'
    end
    object qryZNuDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NU.DT_BEG'
    end
    object qryZNuDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NU.DT_END'
    end
    object qryZNuKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NU.KDSPZ'
    end
    object qryZNuPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_NU.PDN'
    end
    object qryZNuNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NU.NOTES'
      Size = 13
    end
    object qryZNuPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_NU.PRR'
    end
    object qryZNuPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_NU.PRPV'
    end
    object qryZNuKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_NU.KTO'
    end
    object qryZNuPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_NU.PRKR'
    end
    object qryZNuMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_NU.MYNOTES'
      Size = 25
    end
    object qryZNuSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_NU.SPECPS'
    end
    object qryZNuSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NU.SPEC_NR'
    end
  end
  object updZNu: TUpdateSQL
    ModifySQL.Strings = (
      'update z_NU'
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
      '  KDSPZ = :KDSPZ,'
      '  PDN = :PDN,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  SPEC_NR = :SPEC_NR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_NU'
      
        '  (KDSPS, DTPROC, ZAMESGOD, TABN, VIDN, OLDKDVIDN, KDVIDN, CHAS,' +
        ' '
      'SUMMA, '
      
        '   OLDKDOBJ, KDOBJ, KDKATP, DT_BEG, DT_END, KDSPZ, PDN, NOTES, P' +
        'RR, '
      'PRPV, '
      '   KTO, PRKR, MYNOTES, SPECPS, SPEC_NR)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :TABN, :VIDN, :OLDKDVIDN, :KDVIDN' +
        ', :CHAS, '
      
        '   :SUMMA, :OLDKDOBJ, :KDOBJ, :KDKATP, :DT_BEG, :DT_END, :KDSPZ,' +
        ' :PDN, '
      
        '   :NOTES, :PRR, :PRPV, :KTO, :PRKR, :MYNOTES, :SPECPS, :SPEC_NR' +
        ')')
    DeleteSQL.Strings = (
      'delete from z_NU'
      'where'
      '  NR = :OLD_NR')
    Left = 280
    Top = 200
  end
  object qryOldSps: TQuery
    DatabaseName = 'ZY_PDX9305'
    SQL.Strings = (
      'select * from sp_00_05'
      'where SpsDb = '#39'sps2005'#39' '
      'order by FileSps, obj, Ved, TabN'
      '')
    Left = 324
    Top = 130
  end
  object dsrcOldSps: TDataSource
    DataSet = qryOldSps
    Left = 336
    Top = 144
  end
  object qryZSps: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Sps')
    UpdateObject = updZSps
    Left = 324
    Top = 186
  end
  object updZSps: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Sps'
      'set'
      '  KDSPS = :KDSPS,'
      '  NCH = :NCH,'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  NOTES = :NOTES,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  ARMS = :ARMS'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Sps'
      
        '  (KDSPS, NCH, DTPROC, TABN, KDOBJ, KDKATP, NOTES, OLDKDOBJ, ARM' +
        'S)'
      'values'
      
        '  (:KDSPS, :NCH, :DTPROC, :TABN, :KDOBJ, :KDKATP, :NOTES, :OLDKD' +
        'OBJ, :ARMS)')
    DeleteSQL.Strings = (
      'delete from Z_Sps'
      'where'
      '  NR = :OLD_NR')
    Left = 336
    Top = 200
  end
  object qryOldOtkl: TQuery
    DatabaseName = 'ZY_PDX9305'
    SQL.Strings = (
      'Select * from ot_00_05'
      'order by OtklDB, FileOtkl, TabN, VidN')
    Left = 412
    Top = 130
  end
  object dsrcOldOtkl: TDataSource
    DataSet = qryOldOtkl
    Left = 424
    Top = 144
  end
  object qryZOtkl: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Otkl')
    UpdateObject = updZOtkl
    Left = 412
    Top = 186
  end
  object updZOtkl: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Otkl'
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
      'insert into Z_Otkl'
      
        '  (KDSPS, DTPROC, ZAMESGOD, TABN, VIDN, OLDKDVIDN, KDVIDN, CHAS,' +
        ' SUMMA, '
      
        '   OLDKDOBJ, KDOBJ, KDKATP, DT_BEG, DT_END, PDN, KDSPZ, NOTES, P' +
        'RR, PRPV, '
      '   KTO, PRKR, SPEC_NR, DTVDPV, NRVDPV, MYNOTES, SPECPS)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :TABN, :VIDN, :OLDKDVIDN, :KDVIDN' +
        ', :CHAS, '
      
        '   :SUMMA, :OLDKDOBJ, :KDOBJ, :KDKATP, :DT_BEG, :DT_END, :PDN, :' +
        'KDSPZ, '
      
        '   :NOTES, :PRR, :PRPV, :KTO, :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV,' +
        ' :MYNOTES, '
      '   :SPECPS)')
    DeleteSQL.Strings = (
      'delete from Z_Otkl'
      'where'
      '  NR = :OLD_NR')
    Left = 424
    Top = 200
  end
  object qryOldGrOtp: TQuery
    DatabaseName = 'ZP_Z'
    SQL.Strings = (
      'select * from "Graf_Otp.dbf"'
      'where (not dt_Beg is Null) and (dt_Beg > '#39'01/01/1993'#39')'
      'order by TabN, Dt_Beg')
    Left = 620
    Top = 130
  end
  object qryZVOtp: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_VOtp'
      '')
    UpdateObject = updZVOtp
    Left = 620
    Top = 186
  end
  object updZVOtp: TUpdateSQL
    ModifySQL.Strings = (
      'update z_VOtp'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  ALGRASCH = :ALGRASCH,'
      '  RK = :RK,'
      '  NRPRIK = :NRPRIK,'
      '  DTPRIK = :DTPRIK,'
      '  DTBEG = :DTBEG,'
      '  CNTDAYS = :CNTDAYS,'
      '  DTEND = :DTEND,'
      '  CNTCHAS = :CNTCHAS,'
      '  VIDN = :VIDN,'
      '  PROCOPL = :PROCOPL,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  SMSRDN = :SMSRDN,'
      '  SPEC_NR = :SPEC_NR,'
      '  SMOTP = :SMOTP'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_VOtp'
      
        '  (KDSPS, DTPROC, TABN, ALGRASCH, RK, NRPRIK, DTPRIK, DTBEG, CNT' +
        'DAYS, DTEND, '
      
        '   CNTCHAS, VIDN, PROCOPL, KDOBJ, KDKATP, KDSPZ, NOTES, SMSRDN, ' +
        'SPEC_NR, '
      '   SMOTP)'
      'values'
      
        '  (:KDSPS, :DTPROC, :TABN, :ALGRASCH, :RK, :NRPRIK, :DTPRIK, :DT' +
        'BEG, :CNTDAYS, '
      
        '   :DTEND, :CNTCHAS, :VIDN, :PROCOPL, :KDOBJ, :KDKATP, :KDSPZ, :' +
        'NOTES, '
      '   :SMSRDN, :SPEC_NR, :SMOTP)')
    DeleteSQL.Strings = (
      'delete from z_VOtp'
      'where'
      '  NR = :OLD_NR')
    Left = 632
    Top = 200
  end
  object dsrcOldGrOtp: TDataSource
    DataSet = qryOldGrOtp
    Left = 632
    Top = 144
  end
end
