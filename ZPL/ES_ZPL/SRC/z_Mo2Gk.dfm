object FormZpl2Gk: TFormZpl2Gk
  Left = 318
  Top = 379
  Width = 624
  Height = 317
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormZpl2Gk'
  Color = clBtnFace
  Constraints.MaxWidth = 900
  Constraints.MinHeight = 250
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    616
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      616
      31)
    object sBtnPrt: TSpeedButton
      Left = 462
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = sBtnPrtClick
    end
    object sBtnStayOnTop: TSpeedButton
      Left = 360
      Top = 3
      Width = 25
      Height = 25
      Hint = #1055#1088#1080' '#1085#1072#1078#1072#1090#1086#1081' '#1082#1085#1086#1087#1082#1077' '#1092#1086#1088#1084#1086#1095#1082#1072' '#1074#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Down = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
        77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
        07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnStayOnTopClick
    end
    object sBtnDetails: TSpeedButton
      Left = 386
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1086#1076#1088#1086#1073#1085#1086#1089#1090#1080' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1093' '#1086#1087#1077#1088#1072#1094#1080#1081
      Anchors = [akTop, akRight]
      Caption = #1044#1077#1090#1072#1083#1080
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object LabelCntSelRec: TLabel
      Left = 5
      Top = 1
      Width = 135
      Height = 13
      Caption = #1042#1099#1076#1077#1083#1077#1085#1086' '#1079#1072#1087#1080#1089#1077#1081': 55'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LabelSmSelRec: TLabel
      Left = 5
      Top = 15
      Width = 144
      Height = 13
      Caption = #1053#1072' '#1089#1091#1084#1084#1091' 88 888 888.88'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object bBtnCancel: TBitBtn
      Left = 539
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = bBtnCancelClick
      Kind = bkCancel
      Spacing = 0
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 31
    Width = 616
    Height = 252
    ActivePage = tsNachislenija
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    OnChange = PageControlChange
    object tsNachislenija: TTabSheet
      Caption = #1042#1099#1087#1083#1072#1090#1099' ('#1044#1077#1073#1077#1090')'
      object LabelPrh: TLabel
        Left = 0
        Top = 0
        Width = 608
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelPrh'
        Color = 14544093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbgrPrh: TDBGrid
        Left = 0
        Top = 13
        Width = 608
        Height = 208
        Hint = 
          #1052#1072#1083#1080#1085#1086#1074#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1080#1084#1077#1102#1090' '#1079#1072#1084#1077#1095#1072#1085#1080#1077' '#1087#1086' '#1089#1091#1084#1084#1077'; '#1057#1080#1085#1080#1077' - '#1085#1077' '#1080#1084#1077#1102#1090' '#1079#1072#1084#1077 +
          #1095#1072#1085#1080#1081'; '#1063#1105#1088#1085#1099#1077' - '#1085#1077' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1099' ('#1080#1083#1080' '#1085#1077' '#1085#1072#1096#1083#1086#1089#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103')'
        Align = alClient
        Color = 11009242
        DataSource = dsrcPrh
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPrhDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        OnKeyDown = dbgrPrhKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SchDt'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KEKV'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SchKt'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Summa'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdIF'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmSchDt'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmSchKt'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UPoz'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vnu'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSch'
            Width = 2
            Visible = True
          end>
      end
    end
    object tsUderganija: TTabSheet
      Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103' ('#1050#1088#1077#1076#1080#1090')'
      ImageIndex = 1
      object LabelRsh: TLabel
        Left = 0
        Top = 0
        Width = 54
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelRsh'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbgrRsh: TDBGrid
        Left = 0
        Top = 13
        Width = 608
        Height = 215
        Hint = 
          #1052#1072#1083#1080#1085#1086#1074#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1080#1084#1077#1102#1090' '#1079#1072#1084#1077#1095#1072#1085#1080#1077' '#1087#1086' '#1089#1091#1084#1084#1077'; '#1057#1080#1085#1080#1077' - '#1085#1077' '#1080#1084#1077#1102#1090' '#1079#1072#1084#1077 +
          #1095#1072#1085#1080#1081'; '#1063#1105#1088#1085#1099#1077' - '#1085#1077' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1099' ('#1080#1083#1080' '#1085#1077' '#1085#1072#1096#1083#1086#1089#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103')'
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcRsh
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrRshDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        OnKeyDown = dbgrRshKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SchDt'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KEKV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SchKt'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Summa'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdIF'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmSchDt'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmSchKt'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UPoz'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vnu'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSch'
            Width = 2
            Visible = True
          end>
      end
    end
    object tsCdsPrp: TTabSheet
      Caption = 'tsCdsPrp'
      ImageIndex = 2
      object dbgrPrp: TDBGrid
        Left = 0
        Top = 0
        Width = 608
        Height = 228
        Align = alClient
        Color = 9428986
        DataSource = dsrcPrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        OnKeyDown = dbgrPrpKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'Grp'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSch'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SchBU'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ForVidN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VidNotes'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmFor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmSvPrg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToInBD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcToEsv'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToRasch'
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 312
    Top = 31
    Width = 265
    Height = 27
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select Count(p.NR) CNT, p.KrrSchBU, p.KdKrrSbu, p.KrrPSCH, s.NmS' +
        'ch, p.KrrLvl, p.KEKV, '
      
        '          p.KdStZ, p.KdPdr, p.KdIF, ku.SpecNaim UPoz, p.KdSBU, p' +
        '.Lvl, p.PSCH,'
      ' p.SchBU, p.KVC, p.NmSchBU, Sum(p.Summa) as Summa,'
      ' Sum(p.SmEkv) as SmEkv, Cast(Null as Char(3)) as MyFld '
      ' from Vi_Prov_Bnk p '
      ' Left Outer Join KdUPoz ku on ku.KPr = p.KdIF'
      ' Left Outer Join Kd_Sbu s on s.KdSch = p.KdKrrSbu'
      ' where (p.KdPdr = 46) and '
      ' (not p.DtOper is Null) and (p.DtOper >= '#39'09/01/2013'#39') and'
      ' (p.DtOper <= '#39'09/30/2013'#39') and p.Mnogitel > 0'
      
        ' group by p.KrrSchBU, p.KdKrrSbu, p.KrrPSCH, s.NmSch, p.KrrLvl, ' +
        'p.KEKV, p.KdStZ,'
      ' p.KdPdr, p.KdIF, ku.SpecNaim, p.KdSBU, p.Lvl, p.PSCH, '
      ' p.SchBU, p.KVC, p.NmSchBU')
    Left = 64
    Top = 104
  end
  object cdsPrh: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Vnu'
        DataType = ftSmallint
      end
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchDt'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmSchDt'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'SchKt'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmSchKt'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'KEKV'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KdIF'
        DataType = ftSmallint
      end
      item
        Name = 'UPoz'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'MyFld'
        DataType = ftString
        Size = 3
      end>
    IndexDefs = <
      item
        Name = 'OnVnuSchDtSchKt'
        Fields = 'Vnu;SchDt;SchKt'
      end>
    IndexName = 'OnVnuSchDtSchKt'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsPrhAfterScroll
    Left = 120
    Top = 104
    object cdsPrhVnu: TSmallintField
      FieldName = 'Vnu'
    end
    object cdsPrhPSCH: TStringField
      DisplayLabel = #1055#1057#1095
      FieldName = 'PSch'
      Size = 10
    end
    object cdsPrhSchDt: TStringField
      DisplayLabel = #1057#1095#1105#1090#1044#1090
      FieldName = 'SchDt'
      Size = 10
    end
    object cdsPrhNmSchDt: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072' '#1044#1090
      FieldName = 'NmSchDt'
      Size = 65
    end
    object cdsPrhSchKt: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1050#1090
      FieldName = 'SchKt'
      Size = 10
    end
    object cdsPrhNmSchKt: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072' '#1050#1090
      FieldName = 'NmSchKt'
      Size = 65
    end
    object cdsPrhKEKV: TStringField
      DisplayLabel = #1050#1045#1050#1042
      FieldName = 'KEKV'
      Size = 10
    end
    object cdsPrhKdIF: TSmallintField
      DisplayLabel = #1050#1076#1048#1060
      FieldName = 'KdIF'
    end
    object cdsPrhUPoz: TStringField
      DisplayLabel = #1059#1095'. '#1087#1086#1079'.'
      FieldName = 'UPoz'
      Size = 15
    end
    object cdsPrhSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
      DisplayFormat = '# ### ###.00'
    end
    object cdsPrhMyFld: TStringField
      FieldName = 'MyFld'
      Size = 3
    end
  end
  object dsrcPrh: TDataSource
    DataSet = cdsPrh
    Left = 136
    Top = 120
  end
  object cdsRsh: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Vnu'
        DataType = ftSmallint
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchDt'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmSchDt'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'SchKt'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmSchKt'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'KEKV'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'KdIF'
        DataType = ftSmallint
      end
      item
        Name = 'UPoz'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'MyFld'
        DataType = ftString
        Size = 3
      end>
    IndexDefs = <
      item
        Name = 'OnVnuSchDtSchKt'
        Fields = 'Vnu;SchDt;SchKt'
      end>
    IndexName = 'OnVnuSchDtSchKt'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsRshAfterScroll
    Left = 120
    Top = 160
    object cdsRshVnu: TSmallintField
      FieldName = 'Vnu'
    end
    object cdsRshPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsRshSchDt: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1044#1090
      FieldName = 'SchDt'
      Size = 10
    end
    object cdsRshNmSchDt: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072' '#1044#1090
      FieldName = 'NmSchDt'
      Size = 65
    end
    object cdsRshSchKt: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1050#1090
      FieldName = 'SchKt'
      Size = 10
    end
    object cdsRshNmSchKt: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072' '#1050#1090
      FieldName = 'NmSchKt'
      Size = 65
    end
    object cdsRshKEKV: TStringField
      DisplayLabel = #1050#1045#1050#1042
      FieldName = 'KEKV'
      Size = 4
    end
    object cdsRshKdIF: TSmallintField
      DisplayLabel = #1050#1076#1048#1060
      FieldName = 'KdIF'
    end
    object cdsRshUPoz: TStringField
      DisplayLabel = #1059#1095'. '#1087#1086#1079'.'
      FieldName = 'UPoz'
      Size = 15
    end
    object cdsRshSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
      DisplayFormat = '# ### ###.00'
    end
    object cdsRshMyFld: TStringField
      FieldName = 'MyFld'
      Size = 3
    end
  end
  object dsrcRsh: TDataSource
    DataSet = cdsRsh
    Left = 136
    Top = 176
  end
  object qryObDt: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from get_ObDt ('#39'10/01/2013'#39')'
      'order by NR'
      '')
    Left = 224
    Top = 104
    object qryObDtNR: TIntegerField
      FieldName = 'NR'
    end
    object qryObDtDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryObDtSCHORD: TStringField
      FieldName = 'SCHORD'
      Size = 10
    end
    object qryObDtSCHET_DBT: TStringField
      FieldName = 'SCHET_DBT'
      Size = 10
    end
    object qryObDtKODZ_DBT: TStringField
      FieldName = 'KODZ_DBT'
      Size = 10
    end
    object qryObDtSCHET_KRT: TStringField
      FieldName = 'SCHET_KRT'
      Size = 10
    end
    object qryObDtKODZ_KRT: TStringField
      FieldName = 'KODZ_KRT'
      Size = 10
    end
    object qryObDtKPR: TSmallintField
      FieldName = 'KPR'
    end
    object qryObDtSUM_DBT: TFloatField
      FieldName = 'SUM_DBT'
    end
    object qryObDtOTKUDA: TStringField
      FieldName = 'OTKUDA'
      Size = 55
    end
    object qryObDtDATAISP: TDateTimeField
      FieldName = 'DATAISP'
    end
    object qryObDtNDOK: TStringField
      FieldName = 'NDOK'
      Size = 6
    end
    object qryObDtDTDOK: TDateTimeField
      FieldName = 'DTDOK'
    end
    object qryObDtKOBJ: TSmallintField
      FieldName = 'KOBJ'
    end
    object qryObDtPPODKL: TStringField
      FieldName = 'PPODKL'
      Size = 10
    end
    object qryObDtFILENM: TStringField
      FieldName = 'FILENM'
      Size = 10
    end
    object qryObDtNMOPER: TStringField
      FieldName = 'NMOPER'
      Size = 100
    end
    object qryObDtKDSCHDBT: TSmallintField
      FieldName = 'KDSCHDBT'
    end
    object qryObDtKDSTZDBT: TSmallintField
      FieldName = 'KDSTZDBT'
    end
    object qryObDtKDSCHKRT: TSmallintField
      FieldName = 'KDSCHKRT'
    end
    object qryObDtKDSTZKRT: TSmallintField
      FieldName = 'KDSTZKRT'
    end
    object qryObDtPVOZV: TStringField
      FieldName = 'PVOZV'
      Size = 1
    end
  end
  object cdsPrp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Grp'
        DataType = ftSmallint
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ForVidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'VidNotes'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SmFor'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrg'
        DataType = ftFloat
      end
      item
        Name = 'SmToInBD'
        DataType = ftFloat
      end
      item
        Name = 'PrcToEsv'
        DataType = ftFloat
      end
      item
        Name = 'SmToRasch'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'ByVidNotes'
        Fields = 'PSch;SchBU;VidNotes'
      end>
    IndexName = 'ByVidNotes'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsPrpAfterScroll
    Left = 280
    Top = 104
    object cdsPrpNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsPrpGrp: TSmallintField
      FieldName = 'Grp'
    end
    object cdsPrpPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsPrpSchBU: TStringField
      FieldName = 'SchBU'
      Size = 15
    end
    object cdsPrpForVidN: TStringField
      FieldName = 'ForVidN'
      Size = 4
    end
    object cdsPrpVidNotes: TStringField
      FieldName = 'VidNotes'
      Size = 30
    end
    object cdsPrpSmFor: TFloatField
      FieldName = 'SmFor'
    end
    object cdsPrpSmSvPrg: TFloatField
      FieldName = 'SmSvPrg'
    end
    object cdsPrpSmToInBD: TFloatField
      FieldName = 'SmToInBD'
    end
    object cdsPrpPrcToEsv: TFloatField
      FieldName = 'PrcToEsv'
    end
    object cdsPrpSmToRasch: TFloatField
      FieldName = 'SmToRasch'
    end
  end
  object dsrcPrp: TDataSource
    DataSet = cdsPrp
    Left = 296
    Top = 120
  end
end
