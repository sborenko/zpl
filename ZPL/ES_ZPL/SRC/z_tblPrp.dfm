object FormTblPrp: TFormTblPrp
  Left = 388
  Top = 314
  Width = 485
  Height = 443
  BorderIcons = [biSystemMenu]
  Caption = 'FormTblPrp'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 350
  Constraints.MinWidth = 400
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
    Width = 477
    Height = 32
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      477
      32)
    object LabelActivePage: TLabel
      Left = 8
      Top = 9
      Width = 97
      Height = 13
      Caption = 'LabelActivePage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object bBtnCancel: TBitBtn
      Left = 399
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 1
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 32
    Width = 477
    Height = 384
    ActivePage = tsPF
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    OnChange = PageControlChange
    object tsPF: TTabSheet
      Caption = #1042' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076
      object dbgrPF: TDBGrid
        Left = 0
        Top = 0
        Width = 469
        Height = 353
        Align = alClient
        DataSource = dsrcPF
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCINV'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCREST'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Visible = True
          end>
      end
    end
    object tsSS: TTabSheet
      Caption = #1042' '#1092#1086#1085#1076' '#1089#1086#1094#1080#1072#1083#1100#1085#1086#1075#1086' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1103
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 166
        Width = 469
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = #1085#1072' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1077' '#1087#1086' '#1074#1088#1077#1084#1077#1085#1085#1086#1081' '#1091#1090#1088#1072#1090#1077' '#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 0
        Top = 169
        Width = 198
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = #1085#1072' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1077' '#1086#1090' '#1085#1077#1089#1095#1072#1089#1090#1085#1099#1093' '#1089#1083#1091#1095#1072#1077#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbgrTVP: TDBGrid
        Left = 0
        Top = 13
        Width = 469
        Height = 153
        Align = alTop
        DataSource = dsrcTVP
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCINV'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRCREST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 145
            Visible = True
          end>
      end
      object dbgrNV: TDBGrid
        Left = 0
        Top = 182
        Width = 469
        Height = 171
        Align = alClient
        Color = clCream
        DataSource = dsrcNV
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pop
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCINV'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRCREST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 155
            Visible = True
          end>
      end
    end
    object tsFZ: TTabSheet
      Caption = #1042' '#1092#1086#1085#1076' '#1079#1072#1085#1103#1090#1086#1089#1090#1080
      ImageIndex = 3
      object dbgrFZ: TDBGrid
        Left = 0
        Top = 0
        Width = 469
        Height = 353
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcFZ
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DTBEG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCINV'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRCREST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Visible = True
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1062#1080#1092#1088#1099
      ImageIndex = 3
      object Label3: TLabel
        Left = 128
        Top = 152
        Width = 213
        Height = 36
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1042#1085#1077#1076#1088#1080#1090#1100' '#1089#1102#1076#1072' '#1090#1072#1073#1083#1080#1094#1091' '#1089' '#1094#1080#1092#1088#1072#1084#1080', '#1095#1090#1086#1073#1099' '#1085#1077' '#1083#1072#1079#1080#1090#1100' '#1079#1072' '#1085#1077#1081' '#1085#1072' '#1076#1088#1091#1075#1086 +
          #1081' '#1101#1082#1088#1072#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
  end
  object qryCds: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_TblPfPrp order by DtBeg')
    Left = 24
    Top = 120
  end
  object cdsPF: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from Z_TblPfPrp order by DtBeg'
    Params = <>
    ProviderName = 'dspCds'
    BeforeOpen = cdsPFBeforeOpen
    BeforePost = cdsPFBeforePost
    AfterPost = cdsPFAfterPost
    Left = 80
    Top = 120
    object cdsPFNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsPFDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPFPRCINV: TFloatField
      DisplayLabel = '% '#1076#1083#1103' '#1080#1085#1074'.'
      FieldName = 'PRCINV'
    end
    object cdsPFPRCREST: TFloatField
      DisplayLabel = '% '#1076#1083#1103' '#1074#1089#1077#1093
      FieldName = 'PRCREST'
    end
    object cdsPFNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object cdsTVP: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from Z_TblTvpPrp order by DtBeg'
    Params = <>
    ProviderName = 'dspCds'
    BeforeOpen = cdsTVPBeforeOpen
    BeforePost = cdsTVPBeforePost
    AfterPost = cdsTVPAfterPost
    Left = 144
    Top = 120
    object cdsTVPNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsTVPDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsTVPPRCINV: TFloatField
      DisplayLabel = '% '#1076#1083#1103' '#1080#1085#1074'.'
      FieldName = 'PRCINV'
    end
    object cdsTVPPRCREST: TFloatField
      DisplayLabel = '% '#1086#1090#1095#1080#1089#1083'.'
      FieldName = 'PRCREST'
    end
    object cdsTVPNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object cdsNV: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from Z_TblNvPrp order by DtBeg'
    Params = <>
    ProviderName = 'dspCds'
    BeforeOpen = cdsNVBeforeOpen
    BeforePost = cdsNVBeforePost
    AfterPost = cdsNVAfterPost
    Left = 208
    Top = 120
    object cdsNVNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsNVDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNVPRCINV: TFloatField
      DisplayLabel = '% '#1076#1083#1103' '#1080#1085#1074'.'
      FieldName = 'PRCINV'
    end
    object cdsNVPRCREST: TFloatField
      DisplayLabel = '% '#1086#1090#1095#1080#1089#1083'.'
      FieldName = 'PRCREST'
    end
    object cdsNVNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object cdsFZ: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from Z_TblFzPrp order by DtBeg'
    Params = <>
    ProviderName = 'dspCds'
    BeforeOpen = cdsFZBeforeOpen
    BeforePost = cdsFZBeforePost
    AfterPost = cdsFZAfterPost
    Left = 272
    Top = 120
    object cdsFZNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsFZDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFZPRCINV: TFloatField
      DisplayLabel = '% '#1076#1083#1103' '#1080#1085#1074'.'
      FieldName = 'PRCINV'
    end
    object cdsFZPRCREST: TFloatField
      DisplayLabel = '% '#1086#1090#1095#1080#1089#1083'.'
      FieldName = 'PRCREST'
    end
    object cdsFZNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object dsrcPF: TDataSource
    DataSet = cdsPF
    Left = 88
    Top = 136
  end
  object dsrcTVP: TDataSource
    DataSet = cdsTVP
    Left = 152
    Top = 136
  end
  object dsrcNV: TDataSource
    DataSet = cdsNV
    Left = 216
    Top = 136
  end
  object dsrcFZ: TDataSource
    DataSet = cdsFZ
    Left = 280
    Top = 136
  end
  object dspCds: TDataSetProvider
    DataSet = qryCds
    Options = [poAllowCommandText]
    Left = 32
    Top = 136
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 120
    Top = 176
    object popHead: TMenuItem
      Caption = '== PopHead =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
  object qryTmp: TQuery
    Left = 360
    Top = 120
  end
end
