object FormChngBnkLS: TFormChngBnkLS
  Left = 352
  Top = 168
  Width = 719
  Height = 600
  ActiveControl = TabSheet3
  BorderIcons = [biSystemMenu]
  Caption = 'FormChngBnkLS'
  Color = clBtnFace
  Constraints.MaxWidth = 900
  Constraints.MinHeight = 450
  Constraints.MinWidth = 590
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 30
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      711
      30)
    object bBtnCancel: TBitBtn
      Left = 633
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
  object PageControl1: TPageControl
    Left = 0
    Top = 30
    Width = 711
    Height = 543
    ActivePage = TabSheet3
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object PanelTs1: TPanel
        Left = 40
        Top = 32
        Width = 433
        Height = 449
        BevelInner = bvLowered
        TabOrder = 0
        DesignSize = (
          433
          449)
        object Label1: TLabel
          Left = 24
          Top = 248
          Width = 50
          Height = 13
          Caption = 'OrderCase'
          FocusControl = dbeOrderCase
        end
        object Label2: TLabel
          Left = 12
          Top = 9
          Width = 240
          Height = 31
          AutoSize = False
          Caption = 
            #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1089#1083#1077#1076#1085#1080#1093' '#1084#1077#1089#1103#1094#1077#1074', '#1080#1079' '#1082#1086#1090#1086#1088#1099#1093' '#1074#1099#1073#1080#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1076#1083 +
            #1103' '#1089#1087#1080#1089#1082#1072
          WordWrap = True
        end
        object Label4: TLabel
          Left = 22
          Top = 275
          Width = 54
          Height = 13
          Caption = 'CntSpsMes'
          FocusControl = dbeCntSpsMes
        end
        object sBtnGo1: TSpeedButton
          Left = 310
          Top = 321
          Width = 75
          Height = 26
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1083#1077#1077
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
            4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
            0000334A23333364A233333F38333333F383333300003366A6333342A2333333
            F383333F3383333300003334A263364AA3333333F338333F3833333300003336
            4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
            8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
            4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
            0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
            F333333383333333000033334AAA2233333333333F3333383333333300003333
            34A223333333333333F333833333333300003333334A443333333333333F3833
            33333333000033333342A63333333333333F33833333333300003333334AA633
            33333333333F3383333333330000333333666333333333333338883333333333
            0000}
          NumGlyphs = 2
          Spacing = 0
        end
        object Label5: TLabel
          Left = 72
          Top = 160
          Width = 45
          Height = 13
          Caption = 'KdBnkTo'
          FocusControl = dbeKdBnkTo
        end
        object Label6: TLabel
          Left = 128
          Top = 160
          Width = 48
          Height = 13
          Caption = 'NmBnkTo'
          FocusControl = DBLNmBnkTo
        end
        object UpDownCntMes: TUpDown
          Left = 288
          Top = 14
          Width = 15
          Height = 21
          Associate = edCntMes
          Min = 1
          Max = 20
          Position = 3
          TabOrder = 1
          OnChangingEx = UpDownCntMesChangingEx
        end
        object dbeOrderCase: TDBEdit
          Left = 80
          Top = 248
          Width = 65
          Height = 21
          TabStop = False
          DataField = 'OrderCase'
          DataSource = dsrcTmp
          TabOrder = 3
        end
        object edCntMes: TEdit
          Left = 255
          Top = 14
          Width = 33
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '3'
          OnEnter = edCntMesEnter
          OnExit = edCntMesExit
        end
        object GroupBox1: TGroupBox
          Left = 12
          Top = 35
          Width = 292
          Height = 56
          Caption = '   '#1042#1099#1073#1080#1088#1072#1090#1100' '#1082#1083#1080#1077#1085#1090#1086#1074':   '
          TabOrder = 2
          object Label3: TLabel
            Left = 7
            Top = 32
            Width = 72
            Height = 13
            Caption = #1050#1072#1082#1086#1075#1086' '#1073#1072#1085#1082#1072':'
            FocusControl = dbeKdBnkFrom
          end
          object rBtnOneBnk: TRadioButton
            Left = 7
            Top = 13
            Width = 113
            Height = 17
            Caption = '- '#1080#1079' '#1086#1076#1085#1086#1075#1086' '#1073#1072#1085#1082#1072
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rBtnOneBnkClick
          end
          object rBtnAllBnk: TRadioButton
            Left = 176
            Top = 13
            Width = 105
            Height = 17
            Caption = '- '#1080#1079' '#1074#1089#1077#1093' '#1073#1072#1085#1082#1086#1074
            TabOrder = 1
            OnClick = rBtnOneBnkClick
          end
          object dbeKdBnkFrom: TDBEdit
            Left = 87
            Top = 29
            Width = 32
            Height = 21
            DataField = 'KdBnkFrom'
            DataSource = dsrcTmp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnEnter = dbeKdBnkFromEnter
            OnExit = dbeKdBnkFromExit
          end
          object DBLNmBnkFrom: TDBLookupComboBox
            Left = 119
            Top = 29
            Width = 165
            Height = 21
            DataField = 'NmBnkFrom'
            DataSource = dsrcTmp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnEnter = DBLNmBnkFromEnter
            OnExit = DBLNmBnkFromExit
          end
        end
        object dbeCntSpsMes: TDBEdit
          Left = 80
          Top = 272
          Width = 65
          Height = 21
          TabStop = False
          DataField = 'CntSpsMes'
          DataSource = dsrcTmp
          TabOrder = 4
        end
        object GroupBox2: TGroupBox
          Left = 12
          Top = 91
          Width = 292
          Height = 57
          Caption = '   '#1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086':   '
          TabOrder = 5
          object RadioButton1: TRadioButton
            Left = 7
            Top = 16
            Width = 129
            Height = 17
            Caption = '- '#1041#1072#1085#1082#1091', '#1058#1072#1073'.'#1085#1086#1084#1077#1088#1091
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RadioButton2: TRadioButton
            Left = 145
            Top = 16
            Width = 137
            Height = 17
            Caption = '- '#1041#1072#1085#1082#1091', '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
            TabOrder = 1
          end
          object RadioButton3: TRadioButton
            Left = 7
            Top = 32
            Width = 129
            Height = 17
            Caption = '- '#1058#1072#1073'.'#1085#1086#1084#1077#1088#1091
            TabOrder = 2
          end
          object RadioButton4: TRadioButton
            Left = 145
            Top = 32
            Width = 137
            Height = 17
            Caption = '- '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
            TabOrder = 3
          end
        end
        object dbeKdBnkTo: TDBEdit
          Left = 72
          Top = 176
          Width = 49
          Height = 21
          DataField = 'KdBnkTo'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object DBLNmBnkTo: TDBLookupComboBox
          Left = 120
          Top = 176
          Width = 274
          Height = 21
          DataField = 'NmBnkTo'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object dbgrSps: TDBGrid
        Left = 0
        Top = 30
        Width = 703
        Height = 482
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcSps
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
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
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 133
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDBNK'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMBNK'
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LICSCH'
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            Width = 1
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            Width = 1
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            Width = 1
            Visible = True
          end>
      end
      object TPanel
        Left = 0
        Top = 0
        Width = 703
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 4
          Top = 2
          Width = 75
          Height = 26
          Caption = #1044#1072#1083#1077#1077
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
            4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
            0000334A23333364A233333F38333333F383333300003366A6333342A2333333
            F383333F3383333300003334A263364AA3333333F338333F3833333300003336
            4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
            8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
            4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
            0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
            F333333383333333000033334AAA2233333333333F3333383333333300003333
            34A223333333333333F333833333333300003333334A443333333333333F3833
            33333333000033333342A63333333333333F33833333333300003333334AA633
            33333333333F3383333333330000333333666333333333333338883333333333
            0000}
          NumGlyphs = 2
          Spacing = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'CntSpsMes'
        DataType = ftSmallint
      end
      item
        Name = 'OrderCase'
        DataType = ftSmallint
      end
      item
        Name = 'KdBnkFrom'
        DataType = ftSmallint
      end
      item
        Name = 'KdBnkTo'
        DataType = ftSmallint
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 28
    Top = 161
    object cdsTmpNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsTmpCntSpsMes: TSmallintField
      FieldName = 'CntSpsMes'
    end
    object cdsTmpOrderCase: TSmallintField
      FieldName = 'OrderCase'
    end
    object cdsTmpKdBnkFrom: TSmallintField
      FieldName = 'KdBnkFrom'
    end
    object cdsTmpNmBnkFrom: TStringField
      FieldKind = fkLookup
      FieldName = 'NmBnkFrom'
      LookupDataSet = DmMain.qryBanki
      LookupKeyFields = 'KDBNK'
      LookupResultField = 'NMBNK'
      KeyFields = 'KdBnkFrom'
      Lookup = True
    end
    object cdsTmpKdBnkTo: TSmallintField
      FieldName = 'KdBnkTo'
    end
    object cdsTmpNmBnkTo: TStringField
      FieldKind = fkLookup
      FieldName = 'NmBnkTo'
      LookupDataSet = DmMain.qryBanki
      LookupKeyFields = 'KDBNK'
      LookupResultField = 'NMBNK'
      KeyFields = 'KdBnkTo'
      Lookup = True
    end
    object cdsTmpDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cdsTmpNotes: TStringField
      FieldName = 'Notes'
      Size = 35
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 40
    Top = 176
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct s.TabN, u.ID, u.Fam, u.Ima, u.Otch, '
      '                       p.DtBeg, p.KdBnk, p.NmBnk, p.LicSch'
      ' from z_SPS s '
      '      Left Outer join z_Upi u on u.TabN = s.TabN'
      '      Left Outer join z_Get_BnkLS(s.TabN, '#39'03/01/2009'#39') p on 1=1'
      'where s.DtProc >= '#39'01/01/2009'#39
      'order by p.KdBnk, s.TabN')
    Left = 132
    Top = 161
  end
  object cdsSps: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp'
    OnCalcFields = cdsSpsCalcFields
    Left = 196
    Top = 161
    object cdsSpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object cdsSpsID: TStringField
      DisplayLabel = #1048#1044
      FieldName = 'ID'
      Size = 10
    end
    object cdsSpsFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object cdsSpsIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object cdsSpsOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
    object cdsSpsDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089
      FieldName = 'DTBEG'
    end
    object cdsSpsKDBNK: TSmallintField
      DisplayLabel = #1050#1076#1041#1085#1082
      FieldName = 'KDBNK'
    end
    object cdsSpsNMBNK: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldName = 'NMBNK'
      Size = 35
    end
    object cdsSpsLICSCH: TStringField
      DisplayLabel = #1051#1080#1094#1057#1095#1077#1090
      FieldName = 'LICSCH'
      Size = 25
    end
    object cdsSpsFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 30
      Calculated = True
    end
  end
  object dspTmp: TDataSetProvider
    DataSet = qryTmp
    Left = 152
    Top = 176
  end
  object dsrcSps: TDataSource
    DataSet = cdsSps
    Left = 208
    Top = 176
  end
end
