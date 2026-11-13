object FormHiOtp: TFormHiOtp
  Left = 119
  Top = 162
  Width = 827
  Height = 717
  BorderIcons = [biSystemMenu]
  Caption = 'FormHiOtp'
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 685
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
    Left = 201
    Top = 0
    Height = 690
    Beveled = True
  end
  object dbgrVOtp: TDBGrid
    Left = 0
    Top = 0
    Width = 201
    Height = 690
    Align = alLeft
    DataSource = dsrcVOtp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrVOtpDblClick
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUROKLTRF'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALGRASCH'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPRIK'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPRIK'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNTDAYS'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEND'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNTCHAS'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROCOPL'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMSRDN'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMOTP'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTSTORN'
        Title.Caption = #1044#1090#1057#1090#1086#1088#1085
        Width = 50
        Visible = True
      end>
  end
  object PanelRight: TPanel
    Left = 204
    Top = 0
    Width = 615
    Height = 690
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelRight'
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 615
      Height = 690
      ActivePage = tsNew
      Align = alClient
      Style = tsButtons
      TabOrder = 0
      object tsNew: TTabSheet
        Caption = 'tsNew'
        object Splitter2: TSplitter
          Left = 0
          Top = 542
          Width = 607
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Color = clTeal
          ParentColor = False
        end
        object dbgrROtp: TDBGrid
          Left = 0
          Top = 193
          Width = 607
          Height = 349
          Hint = #1057#1091#1084#1084#1099' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
          Align = alClient
          Color = clCream
          DataSource = dsrcROtp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
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
              FieldName = 'ZAMESGOD'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SMOKLADA'
              Title.Caption = #1054#1082#1083#1072#1076
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOEFZP'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SMZARABOTKA'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNTDAYS'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SMDSREDN'
              Width = 55
              Visible = True
            end>
        end
        object dbgrOtkl: TDBGrid
          Left = 0
          Top = 545
          Width = 607
          Height = 114
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' ('#1090#1072#1073#1083#1080#1094#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081')'
          Align = alBottom
          Color = clCream
          DataSource = dsrcOtkl
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrOtklDrawColumnCell
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'VIDN'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAMESGOD'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 49
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
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShObj'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShKatP'
              Width = 3
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Spz'
              Width = 2
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 7
              Visible = True
            end>
        end
        object PanelTop: TPanel
          Left = 0
          Top = 0
          Width = 607
          Height = 193
          Align = alTop
          TabOrder = 2
          object panelVOtpDetails: TPanel
            Left = 1
            Top = 1
            Width = 527
            Height = 191
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              527
              191)
            object Label8: TLabel
              Left = 18
              Top = 17
              Width = 19
              Height = 13
              Caption = #1042#1080#1076
              FocusControl = dbeVidN
            end
            object Label10: TLabel
              Left = 16
              Top = 157
              Width = 63
              Height = 13
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              FocusControl = dbeNotes
            end
            object dbeShVidN: TDBEdit
              Left = 96
              Top = 14
              Width = 331
              Height = 21
              Hint = #1064#1080#1092#1088' '#1074#1080#1076#1072
              Anchors = [akLeft, akTop, akRight]
              Color = clCream
              DataField = 'ShVidN'
              DataSource = dsrcVOtp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object dbeVidN: TDBEdit
              Left = 48
              Top = 14
              Width = 36
              Height = 21
              Hint = #1050#1086#1076' '#1074#1080#1076#1072
              Color = clCream
              DataField = 'VIDN'
              DataSource = dsrcVOtp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 1
            end
            object dbeNotes: TDBEdit
              Left = 96
              Top = 154
              Width = 427
              Height = 21
              Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' '#1085#1072' '#1079#1072#1084#1077#1090#1082#1091
              Anchors = [akLeft, akTop, akRight]
              DataField = 'NOTES'
              DataSource = dsrcVOtp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnExit = dbeNotesExit
              OnKeyDown = dbeNotesKeyDown
            end
            object groupOrder: TGroupBox
              Left = 384
              Top = 48
              Width = 161
              Height = 73
              Caption = ' '#1055#1088#1080#1082#1072#1079' '
              TabOrder = 4
              object Label3: TLabel
                Left = 26
                Top = 43
                Width = 34
                Height = 13
                Caption = #1053#1086#1084#1077#1088
              end
              object Label4: TLabel
                Left = 26
                Top = 19
                Width = 26
                Height = 13
                Caption = #1044#1072#1090#1072
                FocusControl = dbeDtPrik
              end
              object dbeNrPrik: TDBEdit
                Left = 72
                Top = 40
                Width = 70
                Height = 21
                Hint = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
                Color = clCream
                DataField = 'NRPRIK'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 1
              end
              object dbeDtPrik: TDBEdit
                Left = 72
                Top = 16
                Width = 70
                Height = 21
                Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
                Color = clCream
                DataField = 'DTPRIK'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 0
              end
            end
            object groupPeriod: TGroupBox
              Left = 8
              Top = 48
              Width = 161
              Height = 97
              Caption = ' '#1055#1077#1088#1080#1086#1076' '
              TabOrder = 2
              object Label5: TLabel
                Left = 24
                Top = 19
                Width = 37
                Height = 13
                Caption = #1053#1072#1095#1072#1083#1086
                FocusControl = dbeDtBeg
              end
              object Label7: TLabel
                Left = 24
                Top = 43
                Width = 34
                Height = 13
                Caption = #1054#1082#1086#1085#1095'.'
                FocusControl = dbeDtEnd
              end
              object Label6: TLabel
                Left = 24
                Top = 67
                Width = 27
                Height = 13
                Caption = #1044#1085#1077#1081
                FocusControl = dbeCntDays
              end
              object dbeDtBeg: TDBEdit
                Left = 72
                Top = 16
                Width = 70
                Height = 21
                Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1087#1091#1089#1082#1072
                Color = clCream
                DataField = 'DTBEG'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 0
              end
              object dbeDtEnd: TDBEdit
                Left = 72
                Top = 40
                Width = 70
                Height = 21
                Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1090#1087#1091#1089#1082#1072
                Color = clCream
                DataField = 'DTEND'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 1
              end
              object dbeCntDays: TDBEdit
                Left = 72
                Top = 64
                Width = 29
                Height = 21
                Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081
                Color = clCream
                DataField = 'CNTDAYS'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 2
              end
            end
            object bBtnCancel: TBitBtn
              Left = 446
              Top = 12
              Width = 81
              Height = 25
              Anchors = [akRight]
              Caption = #1047#1072#1082#1088#1099#1090#1100
              TabOrder = 6
              Kind = bkCancel
              Spacing = 0
            end
            object groupPayment: TGroupBox
              Left = 176
              Top = 48
              Width = 201
              Height = 97
              Caption = ' '#1054#1087#1083#1072#1090#1072' '
              TabOrder = 3
              object lblPercent: TLabel
                Left = 16
                Top = 19
                Width = 83
                Height = 13
                Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099
                FocusControl = dbeProcOpl
              end
              object lblDayAverage: TLabel
                Left = 16
                Top = 43
                Width = 79
                Height = 13
                Caption = #1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103
                FocusControl = dbeSmSrdn
              end
              object lblSum: TLabel
                Left = 16
                Top = 67
                Width = 90
                Height = 13
                Caption = #1057#1091#1084#1084#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
                FocusControl = dbeSmOtp
              end
              object dbeProcOpl: TDBEdit
                Left = 116
                Top = 16
                Width = 37
                Height = 21
                Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099
                Color = clCream
                DataField = 'PROCOPL'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 0
              end
              object dbeSmSrdn: TDBEdit
                Left = 115
                Top = 40
                Width = 54
                Height = 21
                Hint = #1057#1091#1084#1084#1072' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1075#1086
                Color = clCream
                DataField = 'SMSRDN'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 1
              end
              object dbeSmOtp: TDBEdit
                Left = 115
                Top = 64
                Width = 70
                Height = 21
                Hint = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
                Color = clCream
                DataField = 'SMOTP'
                DataSource = dsrcVOtp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 2
              end
            end
          end
          object panelDebug: TPanel
            Left = 528
            Top = 1
            Width = 78
            Height = 191
            Align = alRight
            TabOrder = 1
            object dbtSpecNR: TDBText
              Left = 8
              Top = 32
              Width = 65
              Height = 17
              DataField = 'SPEC_NR'
              DataSource = dsrcVOtp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblSpecNR: TLabel
              Left = 8
              Top = 16
              Width = 41
              Height = 13
              Caption = 'SpecNR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
      object tsOld: TTabSheet
        Caption = 'tsOld'
        ImageIndex = 1
        object Label11: TLabel
          Left = 0
          Top = 633
          Width = 341
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = #1054#1090#1087#1091#1089#1082#1072' '#1080#1079' '#1089#1090#1072#1088#1086#1081' '#1041#1072#1079#1099' '#1044#1072#1085#1085#1099#1093'. '#1048#1084#1077#1077#1090#1089#1103' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1087#1086#1082#1072#1079#1072#1090#1100
        end
        object Label12: TLabel
          Left = 0
          Top = 646
          Width = 371
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = 
            #1090#1086#1083#1100#1082#1086' '#1074' '#1090#1072#1082#1086#1084' '#1074#1080#1076#1077': '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1085#1099#1084' '#1080#1079' '#1092#1072#1081#1083#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1079#1072' ' +
            #1075#1086#1076'.'
        end
        object dbgrNuOld: TDBGrid
          Left = 0
          Top = 0
          Width = 607
          Height = 633
          Align = alClient
          Color = clBtnFace
          DataSource = dsrcNuOld
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
              FieldName = 'KDSPS'
              Width = 17
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPROC'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAMESGOD'
              Width = 33
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
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDKDVIDN'
              Width = 22
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 59
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
              FieldName = 'PDN'
              Width = 21
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MYNOTES'
              Width = 69
              Visible = True
            end>
        end
      end
    end
  end
  object qryVOtp: TQuery
    CachedUpdates = True
    AfterPost = qryAfterPost
    AfterScroll = qryVOtpAfterScroll
    OnCalcFields = qryVOtpCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_vOtp'
      ' where tabn = 1520'
      'order by DtProc, dtBeg')
    UpdateObject = updVOtp
    Left = 32
    Top = 120
    object qryVOtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'Z_VOTP.NR'
    end
    object qryVOtpKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'Z_VOTP.KDSPS'
    end
    object qryVOtpDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'Z_VOTP.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryVOtpTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'Z_VOTP.TABN'
    end
    object qryVOtpCUROKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083'('#1058#1088#1092')'
      FieldName = 'CUROKLTRF'
      Origin = 'Z_VOTP.CUROKLTRF'
      DisplayFormat = '0.00'
    end
    object qryVOtpALGRASCH: TSmallintField
      DisplayLabel = #1040#1083#1075#1056#1072#1089#1095
      FieldName = 'ALGRASCH'
      Origin = 'Z_VOTP.ALGRASCH'
    end
    object qryVOtpUSEKOEFOKL: TStringField
      FieldName = 'USEKOEFOKL'
      Origin = 'Z_VOTP.USEKOEFOKL'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHMATPOM: TStringField
      FieldName = 'NCHMATPOM'
      Origin = 'Z_VOTP.NCHMATPOM'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'Z_VOTP.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVOtpRK: TStringField
      DisplayLabel = #1088'/'#1082
      FieldName = 'RK'
      Origin = 'Z_VOTP.RK'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNRPRIK: TStringField
      DisplayLabel = #8470#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'NRPRIK'
      Origin = 'Z_VOTP.NRPRIK'
      Size = 15
    end
    object qryVOtpDTPRIK: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DTPRIK'
      Origin = 'Z_VOTP.DTPRIK'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVOtpDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'Z_VOTP.DTBEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVOtpCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'Z_VOTP.CNTDAYS'
    end
    object qryVOtpDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
      Origin = 'Z_VOTP.DTEND'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVOtpCNTCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1086#1074
      FieldName = 'CNTCHAS'
      Origin = 'Z_VOTP.CNTCHAS'
    end
    object qryVOtpVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'Z_VOTP.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVOtpPROCOPL: TFloatField
      DisplayLabel = '% '#1086#1087#1083#1072#1090#1099
      FieldName = 'PROCOPL'
      Origin = 'Z_VOTP.PROCOPL'
    end
    object qryVOtpKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'Z_VOTP.KDOBJ'
    end
    object qryVOtpKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'Z_VOTP.KDKATP'
    end
    object qryVOtpKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'Z_VOTP.KDSPZ'
    end
    object qryVOtpNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'Z_VOTP.NOTES'
      Size = 35
    end
    object qryVOtpSMSRDN: TFloatField
      DisplayLabel = #1057#1088#1044#1085#1077#1074#1085
      FieldName = 'SMSRDN'
      Origin = 'Z_VOTP.SMSRDN'
      DisplayFormat = '0.00'
    end
    object qryVOtpSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'Z_VOTP.SPEC_NR'
    end
    object qryVOtpSMOTP: TFloatField
      DisplayLabel = #1057#1084#1054#1090#1087#1091#1089#1082#1085#1099#1093
      FieldName = 'SMOTP'
      Origin = 'Z_VOTP.SMOTP'
      DisplayFormat = '0.00'
    end
    object qryVOtpShVidN: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryVOtpDTSTORN: TDateTimeField
      FieldName = 'DTSTORN'
      DisplayFormat = 'dd-mm-yy'
      EditMask = '!99/99/00;1;_'
    end
  end
  object dsrcVOtp: TDataSource
    DataSet = qryVOtp
    OnDataChange = dsrcVOtpDataChange
    Left = 56
    Top = 136
  end
  object qryROtp: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcVOtp
    SQL.Strings = (
      'Select * from Z_ROtp'
      'where Spec_NR = :Spec_NR'
      'order by ZaMesGod')
    Left = 424
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryROtpNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
      Origin = 'Z_ROTP.NR'
    end
    object qryROtpSPEC_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPEC_NR'
      Origin = 'Z_ROTP.SPEC_NR'
    end
    object qryROtpZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      DisplayWidth = 13
      FieldName = 'ZAMESGOD'
      Origin = 'Z_ROTP.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryROtpSMZARABOTKA: TFloatField
      DisplayLabel = #1057#1091#1084#1047#1072#1088#1072#1073#1086#1090#1082#1072
      DisplayWidth = 16
      FieldName = 'SMZARABOTKA'
      Origin = 'Z_ROTP.SMZARABOTKA'
      DisplayFormat = '#.00'
    end
    object qryROtpKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090' '#1079'/'#1087#1083
      DisplayWidth = 12
      FieldName = 'KOEFZP'
      Origin = 'Z_ROTP.KOEFZP'
    end
    object qryROtpCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      DisplayWidth = 12
      FieldName = 'CNTDAYS'
      Origin = 'Z_ROTP.CNTDAYS'
    end
    object qryROtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'Z_ROTP.KDSPS'
    end
    object qryROtpSMOKLADA: TFloatField
      DisplayLabel = #1057#1091#1084#1055#1086#1054#1082#1083#1072#1076#1091
      FieldName = 'SMOKLADA'
      Origin = 'Z_ROTP.SMOKLADA'
      DisplayFormat = '#.00'
    end
    object qryROtpSMDSREDN: TFloatField
      DisplayLabel = #1057#1091#1084#1057#1088#1077#1076#1085
      FieldName = 'SMDSREDN'
      Origin = 'Z_ROTP.SMDSREDN'
      DisplayFormat = '#.00'
    end
    object qryROtpSmZpKoef: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090
      FieldKind = fkCalculated
      FieldName = 'SmZpKoef'
      DisplayFormat = '#.00'
      Calculated = True
    end
  end
  object dsrcROtp: TDataSource
    DataSet = qryROtp
    Left = 440
    Top = 344
  end
  object qryOtkl: TQuery
    CachedUpdates = True
    AfterPost = qryAfterPost
    DatabaseName = 'DbMain'
    DataSource = dsrcVOtp
    SQL.Strings = (
      'select * from z_otkl'
      'where TabN = :TabN and Spec_NR = :Spec_NR'
      'order by ZaMesGod')
    UpdateObject = updOtkl
    Left = 545
    Top = 573
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'Z_OTKL.NR'
    end
    object qryOtklDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'Z_OTKL.DTPROC'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'Z_OTKL.TABN'
    end
    object qryOtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'Z_OTKL.KDOBJ'
    end
    object qryOtklShObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 15
      Lookup = True
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'Z_OTKL.KDKATP'
    end
    object qryOtklShKatP: TStringField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 15
      Lookup = True
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'Z_OTKL.DT_BEG'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'Z_OTKL.DT_END'
      DisplayFormat = 'dd-mm-yy'
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'Z_OTKL.PDN'
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'Z_OTKL.CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'Z_OTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'Z_OTKL.NOTES'
      Size = 13
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'Z_OTKL.PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'Z_OTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'Z_OTKL.KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'Z_OTKL.PRKR'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm-yy'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'Z_OTKL.SPEC_NR'
    end
    object qryOtklKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'Z_OTKL.KDSPS'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'Z_OTKL.VIDN'
      FixedChar = True
      Size = 3
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'Z_OTKL.KDSPZ'
    end
    object qryOtklSpz: TStringField
      DisplayLabel = #1064#1055#1047
      FieldKind = fkLookup
      FieldName = 'Spz'
      LookupDataSet = DmMain.qrySBU_LU
      LookupKeyFields = 'KDSCH'
      LookupResultField = 'SCHBU'
      KeyFields = 'KDSPZ'
      Size = 10
      Lookup = True
    end
    object qryOtklStorn: TStringField
      FieldName = 'Storn'
      Size = 1
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 560
    Top = 592
  end
  object qryNuOld: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select KdSps, VidN, ShVidN, OldKdVidN, DtProc, ZaMesGod, Chas, S' +
        'umma, Dt_Beg, dt_End, PdN, MyNotes'
      'from vinu_main where tabn = 3020 and '
      
        '              dtProc >= '#39'01/01/2000'#39' and dtProc <= '#39'12/01/2000'#39' ' +
        'and'
      '                 VidN > '#39'2400'#39' and VidN < '#39'2500'#39' and Summa <> 0')
    Left = 561
    Top = 285
    object qryNuOldKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryNuOldVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuOldSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNuOldOLDKDVIDN: TSmallintField
      DisplayLabel = #1057#1090#1088#1042#1080#1076#1053
      FieldName = 'OLDKDVIDN'
    end
    object qryNuOldDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryNuOldZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryNuOldCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object qryNuOldSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
    end
    object qryNuOldDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
    end
    object qryNuOldDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
    end
    object qryNuOldPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object qryNuOldMYNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'MYNOTES'
      Size = 25
    end
  end
  object dsrcNuOld: TDataSource
    DataSet = qryNuOld
    Left = 576
    Top = 296
  end
  object updVOtp: TUpdateSQL
    ModifySQL.Strings = (
      'update'
      '  z_VOtp'
      'set'
      '  Notes = :NOTES'
      'where'
      '  NR = :OLD_NR')
    Left = 80
    Top = 152
  end
  object updOtkl: TUpdateSQL
    ModifySQL.Strings = (
      'update'
      '  z_Otkl'
      'set'
      '  Notes = :NOTES'
      'where'
      '  NR = :OLD_NR'
      '')
    Left = 576
    Top = 608
  end
end
