object FormZUsrObj: TFormZUsrObj
  Left = 246
  Top = 215
  Width = 715
  Height = 500
  BorderIcons = [biSystemMenu]
  Caption = 'FormZUsrObj'
  Color = clBtnFace
  Constraints.MaxWidth = 955
  Constraints.MinHeight = 500
  Constraints.MinWidth = 715
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
  object Splitter1: TSplitter
    Left = 170
    Top = 31
    Height = 442
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      707
      31)
    object sBtnChPodkl: TSpeedButton
      Left = 4
      Top = 3
      Width = 149
      Height = 25
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100', '#1082#1090#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1074' '#1089#1087#1080#1089#1086#1082
      Caption = #1050#1090#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1074' '#1089#1087#1080#1089#1086#1082
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnChPodklClick
    end
    object LabelChPodkl: TLabel
      Left = 160
      Top = 8
      Width = 235
      Height = 13
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1084#1072#1083#1080#1085#1086#1074#1099#1084' '#1094#1074#1077#1090#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sBtnAddNePodkl: TSpeedButton
      Left = 437
      Top = 3
      Width = 169
      Height = 25
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100', '#1082#1090#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1074' '#1089#1087#1080#1089#1086#1082
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1085#1077#1087#1086#1076#1082#1083#1102#1095#1077#1085#1085#1099#1093
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnAddNePodklClick
    end
    object bBtnClose: TBitBtn
      Left = 629
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkClose
      Spacing = 2
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 31
    Width = 170
    Height = 442
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'PanelLeft'
    Constraints.MinWidth = 170
    TabOrder = 1
    object dbgrUsrObj: TDBGrid
      Left = 0
      Top = 0
      Width = 170
      Height = 442
      Hint = #1057#1087#1080#1089#1086#1082' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102
      Align = alClient
      Color = clBtnFace
      DataSource = dsrcUsrObj
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pop
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrUsrObjDblClick
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'KDUSR'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDSPS'
          Width = 6
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHOBJ'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMOBJ'
          Width = 3
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTBPROC'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEPROC'
          Width = 38
          Visible = True
        end>
    end
  end
  object PanelMid: TPanel
    Left = 173
    Top = 31
    Width = 336
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      336
      442)
    object dbgrSpsAdd: TDBGrid
      Left = 0
      Top = 0
      Width = 336
      Height = 442
      Hint = 
        #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1074' '#1090#1072#1073#1077#1083#1100#1085#1099#1077' '#1089#1087#1080#1089#1082#1080' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1087#1088#1080' '#1080#1093' '#1092 +
        #1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1080' '#1074' '#1085#1072#1095#1072#1083#1077' '#1084#1077#1089#1103#1094#1072
      Align = alClient
      Color = clCream
      DataSource = dsrcSpsAdd
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pop
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrSpsAddDrawColumnCell
      OnDblClick = dbgrSpsAddDblClick
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'KDSPS'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABN'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTBPROC'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEPROC'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FamIO'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POL'
          Width = 15
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Width = 32
          Visible = True
        end>
    end
    object LstBxTabN: TListBox
      Left = 247
      Top = 213
      Width = 65
      Height = 209
      Anchors = [akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
  end
  object PanelRight: TPanel
    Left = 509
    Top = 31
    Width = 198
    Height = 442
    Align = alRight
    BevelOuter = bvNone
    Caption = 'PanelRight'
    TabOrder = 3
    DesignSize = (
      198
      442)
    object PanelMsg: TPanel
      Left = 4
      Top = 5
      Width = 193
      Height = 412
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 0
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 193
        Height = 41
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1042' '#1083#1077#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1076#1086#1089#1090#1091#1087#1085#1099#1077' '#1042#1072#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' ('#1090#1072#1073#1083#1080#1094#1091' '#1074#1077#1076#1077#1090' '#1040#1076#1084#1080#1085 +
          #1080#1089#1090#1088#1072#1090#1086#1088' '#1041#1044').'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label6: TLabel
        Left = 0
        Top = 41
        Width = 193
        Height = 105
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1042' '#1087#1088#1072#1074#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074', '#1082#1086#1090#1086#1088#1099#1077' '#1076#1086#1083#1078#1085#1099' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077 +
          #1089#1082#1080' '#1077#1078#1077#1084#1077#1089#1103#1095#1085#1086' '#1087#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080' '#1089#1087#1080#1089#1082#1072'  '#1074#1082#1083#1102#1095#1072#1090#1100#1089#1103' '#1074' '#1090#1077#1082#1091#1097#1077#1077' '#1076#1086#1089#1090#1091#1087#1085 +
          #1086#1077' '#1042#1072#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1085#1072#1095#1080#1085#1072#1103' '#1089' "'#1057' '#1052#1077#1089#1103#1094#1072'" '#1087#1086' "'#1055#1086' '#1052#1077#1089#1103#1094'" ('#1074#1082#1083#1102#1095#1080 +
          #1090#1077#1083#1100#1085#1086').'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label1: TLabel
        Left = 0
        Top = 237
        Width = 193
        Height = 176
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1063#1090#1086#1073#1099' '#1087#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1090#1072#1073#1077#1083#1100#1085 +
          #1099#1081' '#1089#1087#1080#1089#1086#1082' '#1084#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1074' '#1087#1086#1083#1077' "'#1055#1086' '#1084#1077#1089#1103#1094'" '#1076#1072#1090#1091' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072'.' +
          ' '#1063#1090#1086#1073#1099' '#1074#1085#1086#1074#1100' '#1074#1086#1079#1086#1073#1085#1086#1074#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074 +
          ' '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1089#1087#1080#1089#1086#1082' '#1076#1086#1089#1090#1072#1090#1086#1095#1085#1086' '#1091#1073#1088#1072#1090#1100' '#1076#1072#1090#1091' "'#1055#1086' '#1084#1077#1089#1103#1094'", '#1085#1086' '#1087#1088#1072#1074#1080#1083#1100#1085 +
          #1077#1077' '#1086#1090#1082#1088#1099#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1089' '#1085#1086#1074#1086#1081' '#1076#1072#1090#1086#1081' "'#1057' '#1084#1077#1089#1103#1094#1072'" ('#1090#1086#1075#1076#1072' '#1073#1091#1076#1077#1090' '#1085#1072 +
          #1082#1072#1087#1083#1080#1074#1072#1090#1100#1089#1103' "'#1080#1089#1090#1086#1088#1080#1103'" '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081' '#1080' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072').'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label2: TLabel
        Left = 0
        Top = 146
        Width = 193
        Height = 91
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1063#1090#1086#1073#1099' '#1074#1082#1083#1102#1095#1080#1090#1100' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1082#1091 +
          #1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072', '#1074#1099#1079#1086#1074#1080#1090#1077' '#1087#1088#1072#1074#1086#1081' '#1082#1083#1072#1074#1080#1096#1077#1081' '#1084#1099#1096#1082#1080' '#1082#1086#1085#1090#1077#1082#1089#1090#1085#1086#1077' '#1084#1077#1085#1102' '#1085#1072' ' +
          #1087#1088#1072#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1077' '#1080' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1087#1091#1085#1082#1090' '#1084#1077#1085#1102' "'#1042#1074#1077#1089#1090#1080' '#1074' '#1090#1072#1073#1077#1083#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084 +
          #1077#1089#1103#1094#1072'".'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
    end
  end
  object qryUsrObj: TQuery
    CachedUpdates = True
    AfterScroll = qryUsrObjAfterScroll
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ViZUsrObj where KdUsr = 109 and '
      '             DtBProc <= '#39'11/01/2007'#39' and '
      '             (DtEProc is NULL or DtEProc >= '#39'11/01/2007'#39')'
      'order by KdObj')
    UpdateObject = updUsrObj
    Left = 16
    Top = 135
    object qryUsrObjNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VIZUSROBJ.NR'
    end
    object qryUsrObjKDUSR: TSmallintField
      DisplayLabel = #1050#1076#1070#1079#1088
      FieldName = 'KDUSR'
      Origin = 'DbMain.VIZUSROBJ.KDUSR'
    end
    object qryUsrObjKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.VIZUSROBJ.KDSPS'
    end
    object qryUsrObjKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VIZUSROBJ.KDOBJ'
    end
    object qryUsrObjSHOBJ: TStringField
      DisplayLabel = #1064#1092#1088#1055#1076#1088
      FieldName = 'SHOBJ'
      Origin = 'DbMain.VIZUSROBJ.SHOBJ'
      Size = 15
    end
    object qryUsrObjNMOBJ: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NMOBJ'
      Origin = 'DbMain.VIZUSROBJ.NMOBJ'
      Size = 65
    end
    object qryUsrObjAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.VIZUSROBJ.AINDX'
    end
    object qryUsrObjPINDX: TSmallintField
      FieldName = 'PINDX'
      Origin = 'DbMain.VIZUSROBJ.PINDX'
    end
    object qryUsrObjLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.VIZUSROBJ.LVL'
    end
    object qryUsrObjINDX: TSmallintField
      FieldName = 'INDX'
      Origin = 'DbMain.VIZUSROBJ.INDX'
    end
    object qryUsrObjHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.VIZUSROBJ.HSCH'
      FixedChar = True
      Size = 1
    end
    object qryUsrObjFIOUPOLN: TStringField
      FieldName = 'FIOUPOLN'
      Origin = 'DbMain.VIZUSROBJ.FIOUPOLN'
      Size = 25
    end
    object qryUsrObjKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VIZUSROBJ.KDSPZ'
    end
    object qryUsrObjDTBPROC: TDateTimeField
      DisplayLabel = #1057' '#1052#1077#1089#1103#1094#1072
      FieldName = 'DTBPROC'
      Origin = 'DbMain.VIZUSROBJ.DTBPROC'
      OnSetText = DateFieldSetText
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryUsrObjDTEPROC: TDateTimeField
      DisplayLabel = #1055#1086' '#1052#1077#1089#1103#1094
      FieldName = 'DTEPROC'
      Origin = 'DbMain.VIZUSROBJ.DTEPROC'
      OnSetText = DateFieldSetText
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcUsrObj: TDataSource
    DataSet = qryUsrObj
    Left = 32
    Top = 144
  end
  object qrySpsAdd: TQuery
    CachedUpdates = True
    OnCalcFields = qrySpsAddCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcUsrObj
    SQL.Strings = (
      'Select * from ViZUsrTabsN where KdObj = :KdObj')
    UpdateObject = updSpsAdd
    Left = 192
    Top = 136
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDOBJ'
        ParamType = ptUnknown
        Size = 2
      end>
    object qrySpsAddNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VIZUSRTABSN.NR'
    end
    object qrySpsAddKDUSR: TSmallintField
      FieldName = 'KDUSR'
      Origin = 'DbMain.VIZUSRTABSN.KDUSR'
    end
    object qrySpsAddKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.VIZUSRTABSN.KDSPS'
    end
    object qrySpsAddKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VIZUSRTABSN.KDOBJ'
    end
    object qrySpsAddTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.VIZUSRTABSN.TABN'
    end
    object qrySpsAddDTBPROC: TDateTimeField
      DisplayLabel = #1057' '#1052#1077#1089#1103#1094#1072
      FieldName = 'DTBPROC'
      Origin = 'DbMain.VIZUSRTABSN.DTBPROC'
      OnSetText = DateFieldSetText
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qrySpsAddDTEPROC: TDateTimeField
      DisplayLabel = #1055#1086' '#1052#1077#1089#1103#1094
      FieldName = 'DTEPROC'
      Origin = 'DbMain.VIZUSRTABSN.DTEPROC'
      OnSetText = DateFieldSetText
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qrySpsAddPOL: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'POL'
      Size = 1
    end
    object qrySpsAddID: TStringField
      FieldKind = fkLookup
      FieldName = 'ID'
      LookupDataSet = DmMain.qryUpi
      LookupKeyFields = 'TABN'
      LookupResultField = 'ID'
      KeyFields = 'TABN'
      Size = 10
      Lookup = True
    end
    object qrySpsAddFam: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'Fam'
      Size = 32
    end
    object qrySpsAddIma: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'Ima'
      Size = 15
    end
    object qrySpsAddOtch: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'Otch'
    end
    object qrySpsAddFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 70
      Calculated = True
    end
  end
  object dsrcSpsAdd: TDataSource
    DataSet = qrySpsAdd
    Left = 208
    Top = 144
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 117
    Top = 135
    object popHead: TMenuItem
      Caption = '= =  H e a d  = ='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16453
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16462
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16469
      OnClick = popDelClick
    end
    object popSep1: TMenuItem
      Caption = '-'
    end
    object NLoadFromFile: TMenuItem
      Caption = '&'#1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1082#1086#1084
      Visible = False
      OnClick = NLoadFromFileClick
    end
    object NSep2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object popAddInCurrentTabel: TMenuItem
      Caption = #1042#1074#1077#1089#1090#1080' '#1074' '#1090#1072#1073#1077#1083#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnClick = popAddInCurrentTabelClick
    end
    object popSort: TMenuItem
      Caption = '&'#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        OnClick = popSortByFIOClick
      end
      object popSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        OnClick = popSortByTabNClick
      end
    end
    object NSearch: TMenuItem
      Caption = '&'#1055#1086#1080#1089#1082
      object NSrchTabN: TMenuItem
        Caption = #1055#1086' &'#1058#1072#1073'.'#8470
        ShortCut = 16454
        OnClick = NSrchTabNClick
      end
      object NSrchFam: TMenuItem
        Caption = #1055#1086' &'#1060#1072#1084#1080#1083#1080#1080
        ShortCut = 49222
        OnClick = NSrchFamClick
      end
    end
  end
  object updSpsAdd: TUpdateSQL
    ModifySQL.Strings = (
      'update z_SpsAdd'
      'set'
      '  KDUSR = :KDUSR,'
      '  KDSPS = :KDSPS,'
      '  KDOBJ = :KDOBJ,'
      '  TABN = :TABN,'
      '  DTBPROC = :DTBPROC,'
      '  DTEPROC = :DTEPROC'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_SpsAdd'
      '  (KDUSR, KDSPS, KDOBJ, TABN, DTBPROC, DTEPROC)'
      'values'
      '  (:KDUSR, :KDSPS, :KDOBJ, :TABN, :DTBPROC, :DTEPROC)')
    DeleteSQL.Strings = (
      'delete from z_SpsAdd'
      'where'
      '  NR = :OLD_NR')
    Left = 224
    Top = 152
  end
  object updUsrObj: TUpdateSQL
    ModifySQL.Strings = (
      'update zz_UsrObj'
      'set'
      '  KDUSR = :KDUSR,'
      '  KDSPS = :KDSPS,'
      '  KDOBJ = :KDOBJ,'
      '  DTBPROC = :DTBPROC,'
      '  DTEPROC = :DTEPROC'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into zz_UsrObj'
      '  (KDUSR, KDSPS, KDOBJ, DTBPROC, DTEPROC)'
      'values'
      '  (:KDUSR, :KDSPS, :KDOBJ, :DTBPROC, :DTEPROC)')
    DeleteSQL.Strings = (
      'delete from zz_UsrObj'
      'where'
      '  NR = :OLD_NR')
    Left = 48
    Top = 152
  end
  object qryTmp: TQuery
    Left = 293
    Top = 135
  end
end
