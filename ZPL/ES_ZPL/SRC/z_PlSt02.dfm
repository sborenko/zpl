object FormPlStat02: TFormPlStat02
  Left = 463
  Top = 234
  BorderStyle = bsDialog
  Caption = 'FormPlStat02'
  ClientHeight = 439
  ClientWidth = 347
  Color = clBtnFace
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 347
    Height = 439
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object Panel1: TPanel
        Left = 4
        Top = 10
        Width = 332
        Height = 169
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label16: TLabel
          Left = 70
          Top = 18
          Width = 135
          Height = 13
          Caption = #1042#1074#1077#1076#1080#1090#1077' '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
        end
        object Label17: TLabel
          Left = 135
          Top = 78
          Width = 70
          Height = 13
          Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1075#1086#1076
        end
        object Label18: TLabel
          Left = 164
          Top = 101
          Width = 41
          Height = 13
          Caption = #1080' '#1084#1077#1089#1103#1094
        end
        object sBtnGoForward: TSpeedButton
          Left = 152
          Top = 126
          Width = 75
          Height = 25
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
          OnClick = sBtnGoForwardClick
        end
        object sBtnTabN: TSpeedButton
          Left = 294
          Top = 15
          Width = 17
          Height = 21
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000E0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7700700000778888870077777777777777007770777777877700770007777888
            7700700000778888870000000008887888007700077778787700770007777888
            770077000777788877007777777777777700}
          NumGlyphs = 2
          OnClick = sBtnTabNClick
        end
        object dbtFamIO: TDBText
          Left = 254
          Top = 43
          Width = 55
          Height = 13
          Alignment = taRightJustify
          AutoSize = True
          Color = clMoneyGreen
          DataField = 'FamIO'
          DataSource = dsrc01
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbeTabN: TDBEdit
          Left = 219
          Top = 15
          Width = 75
          Height = 21
          DataField = 'TabN'
          DataSource = dsrc01
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnEnter = DBEditEnter
          OnExit = DBEditExit
        end
        object bBtnCancel: TBitBtn
          Left = 236
          Top = 126
          Width = 75
          Height = 25
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 1
          Kind = bkCancel
        end
        object UpDownGod: TUpDown
          Left = 294
          Top = 73
          Width = 16
          Height = 21
          Associate = edGod
          Min = 2001
          Max = 2050
          Position = 2012
          TabOrder = 2
          Thousands = False
        end
        object UpDownMes: TUpDown
          Left = 294
          Top = 97
          Width = 15
          Height = 21
          Associate = edMes
          Min = 1
          Max = 12
          Position = 10
          TabOrder = 3
        end
        object edGod: TEdit
          Left = 219
          Top = 73
          Width = 75
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '2012'
          OnEnter = edGodEnter
          OnExit = edGodExit
        end
        object edMes: TEdit
          Left = 219
          Top = 97
          Width = 75
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '10'
          OnEnter = edGodEnter
          OnExit = edGodExit
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Label1: TLabel
        Left = 129
        Top = 10
        Width = 92
        Height = 13
        Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
        FocusControl = dbeTabN2
      end
      object Label2: TLabel
        Left = 87
        Top = 53
        Width = 134
        Height = 13
        Caption = #1074#1080#1076#1099' '#1089' 1001 '#1087#1086' 2411 ('#1074#1082#1083'.)'
        FocusControl = dbePMes01
      end
      object Label3: TLabel
        Left = 138
        Top = 75
        Width = 83
        Height = 13
        Caption = #1074#1080#1076#1099' 1003, 1206'
        FocusControl = dbePMes02
      end
      object Label4: TLabel
        Left = 176
        Top = 98
        Width = 45
        Height = 13
        Caption = #1074#1080#1076' 1204'
        FocusControl = dbePMes03
      end
      object Label5: TLabel
        Left = 87
        Top = 121
        Width = 134
        Height = 13
        Caption = #1074#1080#1076#1099' '#1089' 2201 '#1087#1086' 2214 ('#1074#1082#1083'.)'
        FocusControl = dbePMes04
      end
      object Label6: TLabel
        Left = 138
        Top = 144
        Width = 83
        Height = 13
        Caption = #1074#1080#1076#1099' 1201, 1202'
        FocusControl = dbePMes05
      end
      object Label7: TLabel
        Left = 87
        Top = 175
        Width = 134
        Height = 13
        Caption = #1074#1080#1076#1099' '#1089' 1001 '#1087#1086' 2411 ('#1074#1082#1083'.)'
        FocusControl = dbePPer01
      end
      object Label8: TLabel
        Left = 138
        Top = 198
        Width = 83
        Height = 13
        Caption = #1074#1080#1076#1099' 1003, 1206'
        FocusControl = dbePPer02
      end
      object Label9: TLabel
        Left = 176
        Top = 221
        Width = 45
        Height = 13
        Caption = #1074#1080#1076' 1204'
        FocusControl = dbePPer03
      end
      object Label10: TLabel
        Left = 176
        Top = 244
        Width = 45
        Height = 13
        Caption = #1074#1080#1076' 1404'
        FocusControl = dbePPer04
      end
      object Label11: TLabel
        Left = 87
        Top = 267
        Width = 134
        Height = 13
        Caption = #1074#1080#1076#1099' '#1089' 2201 '#1087#1086' 2214 ('#1074#1082#1083'.)'
        FocusControl = dbePPer05
      end
      object Label12: TLabel
        Left = 138
        Top = 290
        Width = 83
        Height = 13
        Caption = #1074#1080#1076#1099' 2206, 2214'
        FocusControl = dbePPer06
      end
      object Label13: TLabel
        Left = 138
        Top = 313
        Width = 83
        Height = 13
        Caption = #1074#1080#1076#1099' 1201, 1202'
        FocusControl = dbePPer07
      end
      object Label14: TLabel
        Left = 78
        Top = 336
        Width = 143
        Height = 13
        Caption = #1074#1080#1076#1099' 2402, 2403, 2406, 2411'
        FocusControl = dbePPer08
      end
      object Label15: TLabel
        Left = 108
        Top = 359
        Width = 113
        Height = 13
        Caption = #1074#1080#1076#1099' 1801, 1803, 1810'
        FocusControl = dbePPer09
      end
      object sBtnGoBack: TSpeedButton
        Left = 136
        Top = 383
        Width = 83
        Height = 25
        Caption = #1053#1077#1079#1072#1076
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
          44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
          00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
          33833F333383F33300003333AA463362A433333333383F333833F33300003333
          6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
          33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
          6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
          000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
          333383333333F3330000333333322AAA4333333333333833333F333300003333
          333322A4333333333333338333F333330000333333344A433333333333333338
          3F333333000033333336A24333333333333333833F333333000033333336AA43
          33333333333333833F3333330000333333336663333333333333333888333333
          0000}
        NumGlyphs = 2
        OnClick = sBtnGoBackClick
      end
      object dbtFamIO2: TDBText
        Left = 269
        Top = 32
        Width = 62
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        Color = clMoneyGreen
        DataField = 'FamIO'
        DataSource = dsrc01
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LabelZaMes: TLabel
        Left = 4
        Top = 53
        Width = 70
        Height = 13
        Caption = 'LabelZaMes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object LabelZaGod: TLabel
        Left = 4
        Top = 175
        Width = 70
        Height = 13
        Caption = 'LabelZaGod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object dbeTabN2: TDBEdit
        Left = 236
        Top = 7
        Width = 95
        Height = 21
        DataField = 'TabN'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePMes01: TDBEdit
        Left = 236
        Top = 50
        Width = 95
        Height = 21
        DataField = 'pMes01'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePMes02: TDBEdit
        Left = 236
        Top = 72
        Width = 95
        Height = 21
        DataField = 'pMes02'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePMes03: TDBEdit
        Left = 236
        Top = 95
        Width = 95
        Height = 21
        DataField = 'pMes03'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePMes04: TDBEdit
        Left = 236
        Top = 118
        Width = 95
        Height = 21
        DataField = 'pMes04'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePMes05: TDBEdit
        Left = 236
        Top = 141
        Width = 95
        Height = 21
        DataField = 'pMes05'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer01: TDBEdit
        Left = 236
        Top = 172
        Width = 95
        Height = 21
        DataField = 'pPer01'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer02: TDBEdit
        Left = 236
        Top = 195
        Width = 95
        Height = 21
        DataField = 'pPer02'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer03: TDBEdit
        Left = 236
        Top = 218
        Width = 95
        Height = 21
        DataField = 'pPer03'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer04: TDBEdit
        Left = 236
        Top = 241
        Width = 95
        Height = 21
        DataField = 'pPer04'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer05: TDBEdit
        Left = 236
        Top = 264
        Width = 95
        Height = 21
        DataField = 'pPer05'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer06: TDBEdit
        Left = 236
        Top = 287
        Width = 95
        Height = 21
        DataField = 'pPer06'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer07: TDBEdit
        Left = 236
        Top = 310
        Width = 95
        Height = 21
        DataField = 'pPer07'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer08: TDBEdit
        Left = 236
        Top = 333
        Width = 95
        Height = 21
        DataField = 'pPer08'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object dbePPer09: TDBEdit
        Left = 236
        Top = 356
        Width = 95
        Height = 21
        DataField = 'pPer09'
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        OnEnter = DBEditEnter
        OnExit = DBEditExit
      end
      object bBtnCancel2: TBitBtn
        Left = 248
        Top = 383
        Width = 83
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 15
        Kind = bkCancel
        Spacing = 0
      end
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'pMes01'
        DataType = ftFloat
      end
      item
        Name = 'pMes02'
        DataType = ftFloat
      end
      item
        Name = 'pMes03'
        DataType = ftFloat
      end
      item
        Name = 'pMes04'
        DataType = ftFloat
      end
      item
        Name = 'pMes05'
        DataType = ftFloat
      end
      item
        Name = 'pPer01'
        DataType = ftFloat
      end
      item
        Name = 'pPer02'
        DataType = ftFloat
      end
      item
        Name = 'pPer03'
        DataType = ftFloat
      end
      item
        Name = 'pPer04'
        DataType = ftFloat
      end
      item
        Name = 'pPer05'
        DataType = ftFloat
      end
      item
        Name = 'pPer06'
        DataType = ftFloat
      end
      item
        Name = 'pPer07'
        DataType = ftFloat
      end
      item
        Name = 'pPer08'
        DataType = ftFloat
      end
      item
        Name = 'pPer09'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 232
    object cdsTmpTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsTmppMes01: TFloatField
      FieldName = 'pMes01'
      DisplayFormat = '0.00'
    end
    object cdsTmppMes02: TFloatField
      FieldName = 'pMes02'
      DisplayFormat = '0.00'
    end
    object cdsTmppMes03: TFloatField
      FieldName = 'pMes03'
      DisplayFormat = '0.00'
    end
    object cdsTmppMes04: TFloatField
      FieldName = 'pMes04'
      DisplayFormat = '0.00'
    end
    object cdsTmppMes05: TFloatField
      FieldName = 'pMes05'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer01: TFloatField
      FieldName = 'pPer01'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer02: TFloatField
      FieldName = 'pPer02'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer03: TFloatField
      FieldName = 'pPer03'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer04: TFloatField
      FieldName = 'pPer04'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer05: TFloatField
      FieldName = 'pPer05'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer06: TFloatField
      FieldName = 'pPer06'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer07: TFloatField
      FieldName = 'pPer07'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer08: TFloatField
      FieldName = 'pPer08'
      DisplayFormat = '0.00'
    end
    object cdsTmppPer09: TFloatField
      FieldName = 'pPer09'
      DisplayFormat = '0.00'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 96
    Top = 248
  end
  object qryTmp: TQuery
    Left = 40
    Top = 295
  end
  object cds01: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'God'
        DataType = ftSmallint
      end
      item
        Name = 'Mes'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 208
    object cds01TabN: TIntegerField
      FieldName = 'TabN'
      OnValidate = cds01TabNValidate
    end
    object cds01FamIO: TStringField
      FieldName = 'FamIO'
      Size = 45
    end
    object cds01God: TSmallintField
      FieldName = 'God'
    end
    object cds01Mes: TSmallintField
      FieldName = 'Mes'
    end
  end
  object dsrc01: TDataSource
    DataSet = cds01
    Left = 32
    Top = 224
  end
end
