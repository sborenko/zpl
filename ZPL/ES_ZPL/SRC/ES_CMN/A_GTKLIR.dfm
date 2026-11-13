object FormKdKli: TFormKdKli
  Left = 339
  Top = 239
  Width = 850
  Height = 455
  HelpContext = 6
  ActiveControl = dbgrWho
  BorderIcons = [biSystemMenu]
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1080' '#1080#1093' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1089#1095#1077#1090#1086#1074
  Color = clBtnFace
  Constraints.MaxWidth = 850
  Constraints.MinHeight = 455
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  Position = poDefault
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 167
    Width = 842
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clAqua
    ParentColor = False
  end
  object PanelWho: TPanel
    Left = 0
    Top = 31
    Width = 842
    Height = 136
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelWho'
    Constraints.MinHeight = 100
    TabOrder = 0
    object PanelWhoLeft: TPanel
      Left = 0
      Top = 0
      Width = 703
      Height = 136
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PanelWhoLeft'
      TabOrder = 0
      object dbgrWho: TDBGrid
        Left = 0
        Top = 0
        Width = 703
        Height = 136
        Hint = 
          #1058#1072#1073#1083#1080#1094#1072' "'#1050#1083#1080#1077#1085#1090#1099'" | '#1058#1072#1073#1083#1080#1094#1072' "'#1050#1083#1080#1077#1085#1090#1099'" ('#1089#1077#1088#1099#1084' '#1092#1086#1085#1086#1084' '#1074#1099#1076#1077#1083#1103#1102#1090#1089#1103' "'#1072 +
          #1088#1093#1080#1074#1085#1099#1077'" '#1082#1083#1080#1077#1085#1090#1099')'
        Align = alClient
        Color = 11861218
        Ctl3D = True
        DataSource = dsrcWho
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Default'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        PopupMenu = popMnuWho
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Default'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrWhoDrawColumnCell
        OnDblClick = dbgrWhoDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        OnKeyDown = dbgrWhoKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'KDWHO'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKPO'
            Title.Caption = #1054#1050#1055#1054
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMWHO'
            Title.Alignment = taCenter
            Title.Caption = #1050#1083#1080#1077#1085#1090
            Width = 303
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LDTOPER'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Title.Caption = #1055#1088#1080#1084#1077#1095'.'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PA'
            Width = 2
            Visible = True
          end>
      end
    end
    object PanelTools: TPanel
      Left = 703
      Top = 0
      Width = 139
      Height = 136
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object DBMemoNotes: TDBMemo
        Left = 0
        Top = 15
        Width = 139
        Height = 121
        Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103' ('#1083#1102#1073#1086#1081' '#1090#1077#1082#1089#1090') '#1082' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1082#1083#1080#1077#1085#1090#1091
        TabStop = False
        Align = alClient
        Color = clCream
        DataField = 'NOTES'
        DataSource = dsrcWho
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
      end
      object PanelHeadNotes: TPanel
        Left = 0
        Top = 0
        Width = 139
        Height = 15
        Align = alTop
        BevelOuter = bvLowered
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
        TabOrder = 1
        Visible = False
      end
    end
  end
  object dbgrRSch: TDBGrid
    Left = 0
    Top = 213
    Width = 842
    Height = 215
    Hint = 
      #1056#1072#1089#1095#1105#1090#1085#1099#1077' '#1089#1095#1077#1090#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1082#1083#1080#1077#1085#1090#1072' | '#1056#1072#1089#1095#1105#1090#1085#1099#1077' '#1089#1095#1077#1090#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1082#1083#1080#1077 +
      #1085#1090#1072' ('#1089#1077#1088#1099#1084' '#1092#1086#1085#1086#1084' '#1074#1099#1076#1077#1083#1103#1102#1090#1089#1103' "'#1072#1088#1093#1080#1074#1085#1099#1077'" '#1089#1095#1077#1090#1072')'
    Align = alClient
    Color = clCream
    Constraints.MinHeight = 100
    Ctl3D = True
    DataSource = dsrcRSch
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    PopupMenu = popMnuRSch
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Default'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrRSchDrawColumnCell
    OnDblClick = dbgrRSchDblClick
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    OnKeyDown = dbgrRSchKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'KDWHO'
        Title.Caption = #1050#1086#1076#1050#1083#1080
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDRSCH'
        Title.Caption = #1050#1086#1076#1056#1057#1095
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Title.Caption = #1054#1050#1055#1054
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSCH'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074' '#1089#1095#1077#1090#1077
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBANK'
        Title.Caption = #1041#1072#1085#1082
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCH'
        Title.Caption = #1056#1072#1089#1095#1057#1095#1077#1090
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFO'
        Title.Caption = #1052#1060#1054
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LDTOPER'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 2
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA'
        Width = 2
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 170
    Width = 842
    Height = 43
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      842
      43)
    object LabelMsg: TLabel
      Left = 1
      Top = 1
      Width = 840
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 
        #1042' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1085#1072#1081#1076#1080#1090#1077' '#1082#1083#1080#1077#1085#1090#1072', '#1074' '#1085#1080#1078#1085#1077#1081' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1077#1075#1086' '#1088#1072#1089#1095#1077#1090#1085 +
        #1099#1081' '#1089#1095#1077#1090
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object LabelCntRecRSch: TLabel
      Left = 310
      Top = 23
      Width = 71
      Height = 13
      Hint = #1050#1086#1083#1080#1089#1077#1089#1090#1074#1086' '#1089#1095#1077#1090#1086#1074' '#1091' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
      Anchors = [akLeft, akBottom]
      Caption = #1057#1095#1077#1090#1086#1074': 223'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Panel2: TPanel
      Left = 7
      Top = 15
      Width = 290
      Height = 28
      Anchors = [akLeft, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 0
        Width = 156
        Height = 13
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1080' '#1089#1095#1077#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Default'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object rBtnShowBoevue: TRadioButton
        Left = 62
        Top = 12
        Width = 105
        Height = 14
        Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' "'#1073#1086#1077#1074#1099#1093'" '#1082#1083#1080#1077#1085#1090#1086#1074
        Caption = #1073#1077#1079' '#1072#1088#1093#1080#1074#1085#1099#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Default'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = rBtnShowBoevueClick
      end
      object rBtnShowAll: TRadioButton
        Left = 5
        Top = 12
        Width = 44
        Height = 14
        Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077#1093' '#1082#1083#1080#1077#1085#1090#1086#1074
        Caption = #1074#1089#1077
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = True
        OnClick = rBtnShowAllClick
      end
      object rBtnShowArch: TRadioButton
        Left = 178
        Top = 12
        Width = 106
        Height = 14
        Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1082#1083#1080#1077#1085#1090#1086#1074', '#1085#1072#1093#1086#1076#1103#1097#1080#1093#1089#1103' '#1074' '#1072#1088#1093#1080#1074#1077
        Caption = #1090#1086#1083#1100#1082#1086' '#1072#1088#1093#1080#1074#1085#1099#1077
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = rBtnShowArchClick
      end
    end
    object Panel3: TPanel
      Left = 680
      Top = 14
      Width = 161
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        161
        28)
      object bBtnOk: TBitBtn
        Left = 5
        Top = 2
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1042#1099#1073#1086#1088
        ModalResult = 1
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bBtnCancel: TBitBtn
        Left = 84
        Top = 2
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1054#1090#1082#1072#1079
        TabOrder = 1
        Kind = bkCancel
        Spacing = 3
      end
    end
  end
  object PanelTop1: TPanel
    Left = 0
    Top = 0
    Width = 842
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    object LabelCntRecKli: TLabel
      Left = 411
      Top = 8
      Width = 73
      Height = 13
      Caption = 'LabelCntRecKli'
      Transparent = True
    end
    object Label4: TLabel
      Left = 7
      Top = 1
      Width = 212
      Height = 26
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        #1059#1089#1090#1072#1085#1086#1074#1082#1072' "'#1075#1083#1091#1073#1080#1085#1099'" '#1074#1099#1073#1086#1088#1082#1080' '#1082#1083#1080#1077#1085#1090#1086#1074' ('#1087#1086' '#1076#1072#1090#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1080 +
        ')'
      WordWrap = True
    end
    object sBtnGo: TSpeedButton
      Left = 331
      Top = 3
      Width = 73
      Height = 25
      Hint = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' "'#1050#1083#1080#1077#1085#1090#1099'"'
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100'!'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnGoClick
    end
    object dtPicLDtOper: TDateTimePicker
      Left = 225
      Top = 4
      Width = 96
      Height = 21
      Date = 39460.000000000000000000
      Time = 39460.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnCloseUp = dtPicLDtOperCloseUp
      OnEnter = dtPicLDtOperEnter
      OnExit = dtPicLDtOperExit
    end
  end
  object dsrcRSch: TDataSource
    DataSet = qryRSch
    OnDataChange = dsrcRSchDataChange
    Left = 56
    Top = 280
  end
  object dsrcWho: TDataSource
    DataSet = qryWho
    OnDataChange = dsrcWhoDataChange
    Left = 40
    Top = 96
  end
  object qryWho: TQuery
    AfterScroll = qryWhoAfterScroll
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from kd_Who'
      'order by PrWho, NmWho')
    Left = 24
    Top = 80
    object qryWhoNR: TIntegerField
      FieldName = 'NR'
    end
    object qryWhoKDWHO: TSmallintField
      DisplayLabel = #1050#1076#1050#1083#1080
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
    object qryWhoOKPO: TStringField
      FieldName = 'OKPO'
      Size = 25
    end
    object qryWhoNOTES: TStringField
      FieldName = 'NOTES'
      Size = 254
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
    object qryWhoADRES: TStringField
      FieldName = 'ADRES'
      Size = 65
    end
    object qryWhoPA: TSmallintField
      DisplayLabel = #1040#1088#1093
      FieldName = 'PA'
    end
    object qryWhoLDTOPER: TDateTimeField
      DisplayLabel = 'LDtOper'
      FieldName = 'LDTOPER'
      Origin = 'DbMain.KD_WHO.LDTOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object qryRSch: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcWho
    SQL.Strings = (
      'select * from Kd_RSch'
      'where KdWho = :KdWho')
    Left = 40
    Top = 264
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDWHO'
        ParamType = ptUnknown
        Size = 2
      end>
    object qryRSchKDRSCH: TSmallintField
      DisplayWidth = 13
      FieldName = 'KDRSCH'
    end
    object qryRSchKDWHO: TSmallintField
      DisplayWidth = 13
      FieldName = 'KDWHO'
    end
    object qryRSchNMSCH: TStringField
      DisplayWidth = 42
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryRSchNMBANK: TStringField
      DisplayWidth = 82
      FieldName = 'NMBANK'
      Size = 65
    end
    object qryRSchRSCH: TStringField
      DisplayWidth = 19
      FieldName = 'RSCH'
      Size = 15
    end
    object qryRSchMFO: TStringField
      DisplayWidth = 19
      FieldName = 'MFO'
      Size = 15
    end
    object qryRSchOKPO: TStringField
      DisplayWidth = 10
      FieldName = 'OKPO'
      Size = 8
    end
    object qryRSchNR: TIntegerField
      FieldName = 'NR'
    end
    object qryRSchNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'NOTES'
      FixedChar = True
      Size = 35
    end
    object qryRSchKDBNK: TSmallintField
      FieldName = 'KDBNK'
    end
    object qryRSchISVAL: TStringField
      FieldName = 'ISVAL'
      FixedChar = True
      Size = 1
    end
    object qryRSchSWIFT: TStringField
      FieldName = 'SWIFT'
      FixedChar = True
      Size = 25
    end
    object qryRSchPA: TSmallintField
      DisplayLabel = #1040#1088#1093
      FieldName = 'PA'
    end
    object qryRSchLDTOPER: TDateTimeField
      DisplayLabel = 'LDtOper'
      FieldName = 'LDTOPER'
      Origin = 'DbMain.KD_RSCH.LDTOPER'
    end
  end
  object popMnuWho: TPopupMenu
    OnPopup = popMnuWhoPopup
    Left = 177
    Top = 81
    object popMnuWhoHead: TMenuItem
      Caption = '==  '#1050'  '#1083'  '#1080'  '#1077'  '#1085'  '#1090'  '#1099'  =='
      Enabled = False
    end
    object popMnuWhoOrder: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1082#1083#1080#1077#1085#1090#1086#1074' ...'
      object popMnuWhoOrderByOKPO: TMenuItem
        Caption = '- '#1087#1086' '#1054#1050#1055#1054', '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
        Checked = True
        GroupIndex = 2
        RadioItem = True
        OnClick = popMnuWhoOrderByOKPOClick
      end
      object popMnuWhoOrderByNmKli: TMenuItem
        Caption = '- '#1087#1086' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102', '#1054#1050#1055#1054
        GroupIndex = 2
        RadioItem = True
        OnClick = popMnuWhoOrderByNmKliClick
      end
      object popMnuWhoOrderByKdKli: TMenuItem
        Caption = '- '#1087#1086' '#1082#1086#1076#1091' '#1082#1083#1080#1077#1085#1090#1072
        GroupIndex = 2
        RadioItem = True
        OnClick = popMnuWhoOrderByKdKliClick
      end
    end
    object popMnuWhoFind: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1082#1083#1080#1077#1085#1090#1072' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
      OnClick = popMnuWhoFindClick
    end
    object popMnuWhoFind2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1088#1072#1089#1095'.'#1089#1095#1077#1090#1091' '#1080' '#1076#1088#1091#1075#1080#1084' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#1084
      OnClick = popMnuRSchPoiskClick
    end
    object popMnuWhoPltg: TMenuItem
      Caption = #1055#1083#1072#1090#1077#1078#1080' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1082#1083#1080#1077#1085#1090#1091
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1083#1072#1090#1077#1078#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = popMnuWhoPltgClick
    end
    object popMnuWhoToArch: TMenuItem
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1072#1088#1093#1080#1074
      OnClick = popMnuWhoToArchClick
    end
    object popMnuWhoFromArch: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1080#1079' '#1072#1088#1093#1080#1074#1072
      OnClick = popMnuWhoFromArchClick
    end
    object popMnuWhoDm1: TMenuItem
      Caption = '-'
    end
    object popMnuWhoEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = popMnuWhoEdtClick
    end
    object popMnuWhoAddKli: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = popMnuWhoAddKliClick
    end
    object popMnuWhoDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = popMnuWhoDelClick
    end
    object popMnuWhoInsOKPO: TMenuItem
      Caption = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1054#1050#1055#1054
      Hint = 
        #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077#1084' '#1082#1083#1080#1077#1085#1090#1072#1084' '#1054#1050#1055#1054' '#1080#1079' 1-'#1081' '#1079#1072#1087#1080#1089#1080' '#1090#1072#1073#1083#1080#1094#1099' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1089#1095 +
        #1077#1090#1086#1074
      OnClick = popMnuWhoInsOKPOClick
    end
  end
  object popMnuRSch: TPopupMenu
    OnPopup = popMnuRSchPopup
    Left = 120
    Top = 264
    object popMnuRSchHead: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1089#1095#1077#1090#1072'  '#1082#1083#1080#1077#1085#1090#1086#1074
      Enabled = False
    end
    object popMnuRSchOrder: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1088#1072#1089#1095#1105#1090#1085#1099#1093' '#1089#1095#1077#1090#1086#1074' ...'
      object popMnuRSchOrderByRSch: TMenuItem
        Caption = '- '#1087#1086' '#1088#1072#1089#1095#1105#1090#1085#1086#1084#1091' '#1089#1095#1105#1090#1091
        Checked = True
        GroupIndex = 3
        RadioItem = True
        OnClick = popMnuRSchOrderByRSchClick
      end
      object popMnuRSchOrderByNmRSch: TMenuItem
        Caption = '- '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102' '#1074' '#1089#1095#1105#1090#1077
        GroupIndex = 3
        RadioItem = True
        OnClick = popMnuRSchOrderByNmRSchClick
      end
      object popMnuRSchOrderByKdRSch: TMenuItem
        Caption = '- '#1087#1086' '#1082#1086#1076#1091' '#1089#1095#1105#1090#1072
        GroupIndex = 3
        RadioItem = True
        OnClick = popMnuRSchOrderByKdRSchClick
      end
      object popMnuRSchOrderByKdKliRSch: TMenuItem
        Caption = '- '#1087#1086' '#1082#1086#1076#1091' '#1082#1083#1080#1077#1085#1090#1072', '#1088#1072#1089#1095#1105#1090#1085#1086#1084#1091' '#1089#1095#1105#1090#1091
        GroupIndex = 3
        RadioItem = True
        OnClick = popMnuRSchOrderByKdKliRSchClick
      end
    end
    object popMnuRSchPoisk: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1089#1095#1077#1090#1072
      OnClick = popMnuRSchPoiskClick
    end
    object popMnuRSchToArch: TMenuItem
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1072#1088#1093#1080#1074
      OnClick = popMnuRSchToArchClick
    end
    object popMnuRSchFromArch: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1080#1079' '#1072#1088#1093#1080#1074#1072
      OnClick = popMnuRSchFromArchClick
    end
    object popMnuRSchDm1: TMenuItem
      Caption = '-'
    end
    object popMnuRSchEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1095'. '#1089#1095#1077#1090
      OnClick = popMnuRSchEdtClick
    end
    object popMnuRSchAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      OnClick = popMnuRSchAddClick
    end
    object popMnuRSchAddVal: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1083#1102#1090#1085#1099#1081' '#1088#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      OnClick = popMnuRSchAddValClick
    end
    object popMnuRSchDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      OnClick = popMnuRSchDelClick
    end
  end
  object qryTmp: TQuery
    Left = 264
    Top = 80
  end
end