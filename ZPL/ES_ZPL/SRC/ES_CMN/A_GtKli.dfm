object FormGetKli: TFormGetKli
  Left = 319
  Top = 139
  Width = 600
  Height = 559
  HelpContext = 6
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetKli'
  Color = clBtnFace
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 220
  Constraints.MinWidth = 419
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelWho: TPanel
    Left = 0
    Top = 31
    Width = 592
    Height = 501
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelWho'
    TabOrder = 0
    object PanelTools: TPanel
      Left = 445
      Top = 0
      Width = 147
      Height = 501
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        147
        501)
      object DBMemoNotes: TDBMemo
        Left = 0
        Top = 18
        Width = 147
        Height = 455
        TabStop = False
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clCream
        DataField = 'NOTES'
        DataSource = dsrcWho
        TabOrder = 0
      end
      object PanelHeadNotes: TPanel
        Left = 0
        Top = 0
        Width = 147
        Height = 18
        Align = alTop
        BevelOuter = bvLowered
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
        TabOrder = 1
      end
      object bBtnOK: TBitBtn
        Left = 3
        Top = 475
        Width = 71
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1042#1099#1073#1086#1088
        TabOrder = 2
        Kind = bkOK
        Spacing = 0
      end
      object bBtnCancel: TBitBtn
        Left = 75
        Top = 475
        Width = 71
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1042#1099#1093#1086#1076
        TabOrder = 3
        Kind = bkCancel
        Style = bsNew
        Spacing = 0
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 445
      Height = 501
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object LabelCntRec: TLabel
        Left = 0
        Top = 488
        Width = 445
        Height = 13
        Align = alBottom
        Caption = 'LabelCntRec'
      end
      object dbgrWho: TDBGrid
        Left = 0
        Top = 0
        Width = 445
        Height = 488
        Align = alClient
        Color = clCream
        Ctl3D = True
        DataSource = dsrcWho
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        PopupMenu = popMnuWho
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrWhoDblClick
        OnKeyDown = dbgrWhoKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'KDWHO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKPO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMWHO'
            Title.Alignment = taCenter
            Title.Caption = #1050#1083#1080#1077#1085#1090
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LDTOPER'
            Width = 86
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 2
      Top = 1
      Width = 212
      Height = 26
      Hint = 
        #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1076#1083#1103' '#1074#1099#1073#1080#1088#1072#1077#1084#1099#1093' '#1082#1083#1080 +
        #1077#1085#1090#1086#1074
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        #1059#1089#1090#1072#1085#1086#1074#1082#1072' "'#1075#1083#1091#1073#1080#1085#1099'" '#1074#1099#1073#1086#1088#1082#1080' '#1082#1083#1080#1077#1085#1090#1086#1074' ('#1087#1086' '#1076#1072#1090#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1080 +
        ')'
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object sBtnGo: TSpeedButton
      Left = 326
      Top = 3
      Width = 89
      Height = 25
      Hint = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' "'#1050#1083#1080#1077#1085#1090#1099'" '#1087#1086#1089#1083#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' "'#1075#1083#1091#1073#1080#1085#1099'" '#1074#1099#1073#1086#1088#1082#1080
      Caption = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100'!'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnGoClick
    end
    object dtPicLDtOper: TDateTimePicker
      Left = 220
      Top = 4
      Width = 96
      Height = 21
      Hint = 
        #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1076#1083#1103' '#1074#1099#1073#1080#1088#1072#1077#1084#1099#1093' '#1082#1083#1080 +
        #1077#1085#1090#1086#1074
      Date = 39448.000000000000000000
      Time = 39448.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnCloseUp = dtPicLDtOperCloseUp
    end
  end
  object dsrcWho: TDataSource
    DataSet = qryWho
    Left = 56
    Top = 88
  end
  object qryWho: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from kd_Who'
      'order by PrWho, NmWho')
    Left = 40
    Top = 72
    object qryWhoKDWHO: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDWHO'
    end
    object qryWhoNMWHO: TStringField
      FieldName = 'NMWHO'
      Size = 65
    end
    object qryWhoNMWHOE: TStringField
      FieldName = 'NMWHOE'
      Size = 65
    end
    object qryWhoPRWHO: TSmallintField
      FieldName = 'PRWHO'
    end
    object qryWhoNOTES: TStringField
      FieldName = 'NOTES'
      Size = 254
    end
    object qryWhoNR: TIntegerField
      FieldName = 'NR'
    end
    object qryWhoKDSBU: TSmallintField
      FieldName = 'KDSBU'
    end
    object qryWhoSHFR: TStringField
      FieldName = 'SHFR'
      Size = 5
    end
    object qryWhoKDVALPDR: TSmallintField
      FieldName = 'KDVALPDR'
    end
    object qryWhoOLD_KPR: TSmallintField
      FieldName = 'OLD_KPR'
    end
    object qryWhoOLD_KOBJ: TSmallintField
      FieldName = 'OLD_KOBJ'
    end
    object qryWhoORGMNE: TStringField
      FieldName = 'ORGMNE'
      FixedChar = True
      Size = 15
    end
    object qryWhoOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Size = 25
    end
    object qryWhoADRES: TStringField
      FieldName = 'ADRES'
      Size = 65
    end
    object qryWhoKDIF: TSmallintField
      FieldName = 'KDIF'
      Origin = 'DbMain.KD_WHO.KDIF'
    end
    object qryWhoLDTOPER: TDateTimeField
      DisplayLabel = #1055#1086#1089#1083#1044#1090#1054#1087#1077#1088
      FieldName = 'LDTOPER'
      Origin = 'DbMain.KD_WHO.LDTOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object popMnuWho: TPopupMenu
    OnPopup = popMnuWhoPopup
    Left = 169
    Top = 65
    object popMnuWhoFind: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = popMnuWhoFindClick
    end
    object popMnuWhoSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popMnuWhoSortByNmKli: TMenuItem
        Caption = '- '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
        Checked = True
        OnClick = popMnuWhoSortByNmKliClick
      end
      object popMnuWhoSortByKdKli: TMenuItem
        Caption = '- '#1087#1086' '#1082#1086#1076#1091' '#1082#1083#1080#1077#1085#1090#1072
        OnClick = popMnuWhoSortByKdKliClick
      end
      object popMnuWhoSortByOkpo: TMenuItem
        Caption = '- '#1087#1086' '#1054#1050#1055#1054' '#1082#1083#1080#1077#1085#1090#1072
        OnClick = popMnuWhoSortByOkpoClick
      end
    end
    object popMnuWhoDm1: TMenuItem
      Caption = '-'
    end
    object popMnuWhoEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popMnuWhoEdtClick
    end
    object popMnuWhoAddKli: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = popMnuWhoAddKliClick
    end
    object popMnuWhoDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popMnuWhoDelClick
    end
  end
  object qryTmp: TQuery
    Left = 160
    Top = 128
  end
end