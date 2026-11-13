object FormSetUp: TFormSetUp
  Left = 288
  Top = 150
  BorderStyle = bsDialog
  Caption = 'FormSetUp'
  ClientHeight = 399
  ClientWidth = 595
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 595
    Height = 372
    ActivePage = tsZpl
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object tsFirma: TTabSheet
      Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      object PanelKoop: TPanel
        Left = 0
        Top = 0
        Width = 587
        Height = 341
        Align = alClient
        BevelOuter = bvNone
        PopupMenu = popMnu
        TabOrder = 0
        object Bevel1: TBevel
          Left = 0
          Top = 0
          Width = 587
          Height = 164
          Align = alClient
        end
        object Label1: TLabel
          Left = 62
          Top = 9
          Width = 112
          Height = 13
          Caption = #1044#1072#1085#1085#1099#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103':'
        end
        object Label2: TLabel
          Left = 62
          Top = 30
          Width = 50
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        end
        object Label3: TLabel
          Left = 62
          Top = 52
          Width = 83
          Height = 13
          Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
        end
        object Label4: TLabel
          Left = 141
          Top = 74
          Width = 61
          Height = 13
          Caption = '- '#1076#1086#1083#1078#1085#1086#1089#1090#1100
        end
        object Label5: TLabel
          Left = 67
          Top = 140
          Width = 80
          Height = 13
          Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        end
        object Label6: TLabel
          Left = 230
          Top = 9
          Width = 83
          Height = 13
          Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
          FocusControl = dbeDtBeg
        end
        object Label7: TLabel
          Left = 62
          Top = 74
          Width = 71
          Height = 13
          Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
          FocusControl = dbeDolgnPred
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 62
          Top = 118
          Width = 51
          Height = 13
          Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
          FocusControl = dbeDolgnBuh
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 67
          Top = 96
          Width = 80
          Height = 13
          Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        end
        object Label10: TLabel
          Left = 141
          Top = 118
          Width = 61
          Height = 13
          Caption = '- '#1076#1086#1083#1078#1085#1086#1089#1090#1100
        end
        object dbeDtBeg: TDBEdit
          Left = 317
          Top = 5
          Width = 86
          Height = 21
          DataField = 'DTBEG'
          DataSource = dsrcRkvzt
          TabOrder = 0
        end
        object dbeNmKoop: TDBEdit
          Left = 152
          Top = 27
          Width = 361
          Height = 21
          DataField = 'NMKOOP'
          DataSource = dsrcRkvzt
          TabOrder = 1
        end
        object dbeAdres: TDBEdit
          Left = 152
          Top = 49
          Width = 361
          Height = 21
          DataField = 'ADRES'
          DataSource = dsrcRkvzt
          TabOrder = 2
        end
        object dbeNmPred: TDBEdit
          Left = 152
          Top = 93
          Width = 361
          Height = 21
          DataField = 'NMPRED'
          DataSource = dsrcRkvzt
          TabOrder = 4
        end
        object dbeNmBuh: TDBEdit
          Left = 152
          Top = 137
          Width = 361
          Height = 21
          DataField = 'NMBUH'
          DataSource = dsrcRkvzt
          TabOrder = 6
        end
        object DBNavigator1: TDBNavigator
          Left = 404
          Top = 5
          Width = 108
          Height = 21
          DataSource = dsrcRkvzt
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Hints.Strings = (
            #1042' '#1085#1072#1095#1072#1083#1086
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1076#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1042' '#1082#1086#1085#1077#1094
            #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
            #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
            #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
            #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            #1054#1090#1082#1072#1079#1072#1090#1100#1089#1103' '#1086#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
            #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077)
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object dbeDolgnPred: TDBEdit
          Left = 216
          Top = 71
          Width = 297
          Height = 21
          DataField = 'DOLGNPRED'
          DataSource = dsrcRkvzt
          TabOrder = 3
        end
        object dbeDolgnBuh: TDBEdit
          Left = 216
          Top = 115
          Width = 297
          Height = 21
          DataField = 'DOLGNBUH'
          DataSource = dsrcRkvzt
          TabOrder = 5
        end
        object dbgrRkvzt: TDBGrid
          Left = 0
          Top = 164
          Width = 587
          Height = 177
          Hint = #1048#1089#1090#1086#1088#1080#1103
          Align = alBottom
          DataSource = dsrcRkvzt
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DTBEG'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMKOOP'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADRES'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOLGNPRED'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMPRED'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOLGNBUH'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMBUH'
              Width = 79
              Visible = True
            end>
        end
      end
    end
    object tsHou: TTabSheet
      Caption = #1046#1080#1083#1100#1077
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 587
        Height = 341
        Align = alClient
      end
      object Bevel4: TBevel
        Left = 18
        Top = 136
        Width = 238
        Height = 51
        Shape = bsFrame
      end
      object Label11: TLabel
        Left = 32
        Top = 24
        Width = 251
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090#1099' '#1089' '#1087#1086#1076#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' "'#1046#1048#1051#1068#1045'"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object chBoxLiftFirst: TCheckBox
        Left = 32
        Top = 141
        Width = 218
        Height = 17
        Caption = #1054#1087#1083#1072#1090#1072' '#1083#1080#1092#1090#1072' '#1078#1080#1083#1100#1094#1072#1084#1080' 1-'#1093' '#1101#1090#1072#1078#1077#1081
        TabOrder = 0
        OnClick = chBoxLiftFirstClick
      end
      object dtPicDtSaldoPrg: TDateTimePicker
        Left = 298
        Top = 20
        Width = 97
        Height = 21
        Date = 36161.000000000000000000
        Time = 36161.000000000000000000
        TabOrder = 1
        OnCloseUp = dtPicDtSaldoPrgCloseUp
      end
      object ChBoxLiftSecond: TCheckBox
        Left = 32
        Top = 165
        Width = 218
        Height = 17
        Caption = #1054#1087#1083#1072#1090#1072' '#1083#1080#1092#1090#1072' '#1078#1080#1083#1100#1094#1072#1084#1080' 2-'#1093' '#1101#1090#1072#1078#1077#1081
        TabOrder = 2
        OnClick = ChBoxLiftSecondClick
      end
    end
    object tsBank: TTabSheet
      Caption = #1041#1072#1085#1082
      ImageIndex = 2
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 587
        Height = 341
        Align = alClient
      end
      object chBoxAllowValutu: TCheckBox
        Left = 32
        Top = 32
        Width = 185
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1072#1083#1102#1090
        TabOrder = 0
        OnClick = chBoxAllowValutuClick
      end
      object chBoxAllowGrp: TCheckBox
        Left = 32
        Top = 61
        Width = 233
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1075#1088#1091#1087#1087' '#1087#1083#1072#1090#1077#1078#1077#1081
        TabOrder = 1
        OnClick = chBoxAllowGrpClick
      end
      object chBoxAllowNds: TCheckBox
        Left = 32
        Top = 91
        Width = 153
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1083#1077' "'#1053#1044#1057'"'
        TabOrder = 2
        OnClick = chBoxAllowNdsClick
      end
      object chBoxAllowKliZa: TCheckBox
        Left = 32
        Top = 120
        Width = 185
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1093#1077#1084#1091' "'#1047#1072' '#1082#1083#1080#1077#1085#1090#1072'"'
        TabOrder = 3
        OnClick = chBoxAllowKliZaClick
      end
      object chBoxAllowParagr: TCheckBox
        Left = 32
        Top = 152
        Width = 241
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1083#1077' "'#1055#1072#1088#1072#1075#1088#1072#1092'" '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
        TabOrder = 4
        OnClick = chBoxAllowParagrClick
      end
      object chBoxAllowMainPdr: TCheckBox
        Left = 32
        Top = 184
        Width = 273
        Height = 17
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '#1085#1072' '#1075#1083#1072#1074#1085#1086#1084' '#1101#1082#1088#1072#1085#1077
        TabOrder = 5
        OnClick = chBoxAllowMainPdrClick
      end
      object chBoxAllowKssAutoNum: TCheckBox
        Left = 32
        Top = 216
        Width = 265
        Height = 17
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1085#1091#1084#1077#1088#1072#1094#1080#1103' '#1082#1072#1089#1089#1086#1074#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        TabOrder = 6
        OnClick = chBoxAllowKssAutoNumClick
      end
      object ChBoxFullRubKopInPoruch: TCheckBox
        Left = 32
        Top = 248
        Width = 465
        Height = 17
        Caption = 
          #1042' '#1087#1083#1072#1090#1077#1078#1082#1072#1093' '#1087#1086' '#1073#1072#1085#1082#1091' '#1075#1088#1080#1074#1085#1099' '#1080' '#1082#1086#1087#1077#1081#1082#1080' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' (.... '#1075#1088#1080#1074#1077#1085#1100',  ' +
          '.... '#1082#1086#1087'i'#1081#1086#1082')'
        TabOrder = 7
        OnClick = ChBoxFullRubKopInPoruchClick
      end
    end
    object tsZpl: TTabSheet
      Caption = #1047#1072#1088#1087#1083#1072#1090#1072
      ImageIndex = 3
    end
    object tsRaznoe: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ImageIndex = 4
      object Label13: TLabel
        Left = 96
        Top = 112
        Width = 217
        Height = 13
        Caption = '('#1087#1086#1082#1072' '#1085#1080' '#1086#1076#1080#1085' '#1087#1077#1088#1077#1082#1083#1102#1095#1072#1090#1077#1083#1100' '#1085#1077' '#1088#1072#1073#1086#1090#1072#1077#1090')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CheckBox1: TCheckBox
        Left = 96
        Top = 48
        Width = 145
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1041#1040#1053#1050
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 96
        Top = 68
        Width = 145
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1050#1040#1057#1057#1059
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 96
        Top = 88
        Width = 145
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1044#1054#1043#1054#1042#1054#1056#1067
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 372
    Width = 595
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      595
      27)
    object Label12: TLabel
      Left = 4
      Top = -1
      Width = 328
      Height = 27
      AutoSize = False
      Caption = 
        #1042#1085#1080#1084#1072#1085#1080#1077'!        '#1047#1085#1072#1095#1077#1085#1080#1103' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074', '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1050#1056#1040#1057#1053#1067#1052', '#1091#1089#1090#1072#1085#1072 +
        #1074#1083#1080#1074#1072#1102#1090#1089#1103' '#1086#1076#1080#1085' '#1088#1072#1079' '#1087#1088#1080' '#1087#1077#1088#1074#1086#1081' '#1085#1072#1089#1090#1088#1086#1081#1082#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'.'
      WordWrap = True
      OnDblClick = Label12DblClick
    end
    object BitBtn1: TBitBtn
      Left = 504
      Top = 0
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
    end
  end
  object qryRkvzt: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Rkvzt'
      'order by DtBeg')
    Left = 260
    Top = 123
    object qryRkvztNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.RKVZT.NR'
    end
    object qryRkvztKDWHO: TSmallintField
      FieldName = 'KDWHO'
      Origin = 'DbMain.RKVZT.KDWHO'
    end
    object qryRkvztDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.RKVZT.DTBEG'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qryRkvztNMKOOP: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      FieldName = 'NMKOOP'
      Origin = 'DbMain.RKVZT.NMKOOP'
      Size = 155
    end
    object qryRkvztADRES: TStringField
      DisplayLabel = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
      FieldName = 'ADRES'
      Origin = 'DbMain.RKVZT.ADRES'
      Size = 255
    end
    object qryRkvztDOLGNPRED: TStringField
      DisplayLabel = #1056#1091#1082#1086#1074'. '#1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNPRED'
      Origin = 'DbMain.RKVZT.NR'
      Size = 65
    end
    object qryRkvztNMPRED: TStringField
      DisplayLabel = #1056#1091#1082#1086#1074'. '#1060#1048#1054
      FieldName = 'NMPRED'
      Origin = 'DbMain.RKVZT.NMPRED'
      Size = 55
    end
    object qryRkvztDOLGNBUH: TStringField
      DisplayLabel = #1041#1091#1093#1075'. '#1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNBUH'
      Origin = 'DbMain.RKVZT.NR'
      Size = 65
    end
    object qryRkvztNMBUH: TStringField
      DisplayLabel = #1041#1091#1093#1075'. '#1060#1048#1054
      FieldName = 'NMBUH'
      Origin = 'DbMain.RKVZT.NMBUH'
      Size = 55
    end
  end
  object dsrcRkvzt: TDataSource
    DataSet = qryRkvzt
    Left = 272
    Top = 136
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 364
    Top = 123
    object popMnuHead: TMenuItem
      Caption = 'Head'
      Enabled = False
    end
    object popMnuAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popMnuAddClick
    end
    object popMnuEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popMnuEdtClick
    end
    object popMnuDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popMnuDelClick
    end
  end
end
