object FormDfMain: TFormDfMain
  Left = 457
  Top = 183
  Width = 505
  Height = 390
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1060#1086#1088#1084#1072' 1'#1044#1060
  Color = clBtnFace
  Constraints.MaxWidth = 505
  Constraints.MinHeight = 370
  Constraints.MinWidth = 505
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 497
    Height = 337
    Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1101#1090#1072#1087#1091
    ActivePage = ts2
    Align = alClient
    ParentShowHint = False
    ShowHint = True
    Style = tsButtons
    TabOrder = 0
    object ts00: TTabSheet
      Caption = 'ts00'
      ImageIndex = 4
      object Panel00: TPanel
        Left = 0
        Top = 0
        Width = 489
        Height = 312
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object sBtnForward00: TSpeedButton
          Left = 319
          Top = 277
          Width = 75
          Height = 25
          Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1101#1090#1072#1087#1091
          Caption = #1044#1072#1083#1077#1077
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000CE0E0000D80E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333444433333
            64444333344443333364444300003334A23333334AAA333334A23333334AAA33
            00003334A23333364A23333334A23333364A2333000033366A6333342A233333
            366A6333342A2333000033334A263364AA333333334A263364AA333300003333
            64A2644AA63333333364A2644AA6333300003333364222AA2333333333364222
            AA233333000033364622AAA633333333364622AAA633333300003334A634AA66
            4444333334A634AA6644443300003334A6342A642AA6333334A6342A642AA633
            00003334A244AA42A633333334A244AA42A63333000033334AA2AA2A33333333
            334AA2AA2A3333330000333334AAA223333333333334AAA22333333300003333
            334A22333333333333334A2233333333000033333334A44333333333333334A4
            433333330000333333342A63333333333333342A63333333000033333334AA63
            33333333333334AA633333330000333333366633333333333333366633333333
            0000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnForward00Click
        end
        object Label2: TLabel
          Left = 156
          Top = 23
          Width = 114
          Height = 13
          Caption = #1054#1090#1095#1077#1090' 1'#1044#1060' '#1076#1077#1083#1072#1077#1084' '#1079#1072
        end
        object Label1: TLabel
          Left = 319
          Top = 23
          Width = 41
          Height = 13
          Caption = #1082#1074#1072#1088#1090#1072#1083
        end
        object Label3: TLabel
          Left = 430
          Top = 23
          Width = 23
          Height = 13
          Caption = #1075#1086#1076#1072
        end
        object MemoZpl: TMemo
          Left = 10
          Top = 89
          Width = 469
          Height = 115
          Alignment = taCenter
          BorderStyle = bsNone
          Color = clBtnFace
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1055#1077#1088#1077#1076' '#1085#1072#1095#1072#1083#1086#1084' '#1088#1072#1073#1086#1090#1099' '#1085#1091#1078#1085#1086' '#1074#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1077#1077':'
            ''
            '- '#1059#1073#1077#1076#1080#1090#1100#1089#1103', '#1095#1090#1086' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'" '#1079#1072#1087#1086#1083#1085#1077#1085#1099' '#1074#1089#1077' '
            '  '#1085#1072#1083#1086#1075#1086#1074#1099#1077' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088#1099'.'
            ''
            '- '#1044#1086#1083#1078#1077#1085' '#1073#1099#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1089#1077#1090#1077#1074#1086#1081' '#1076#1080#1089#1082' K - \\SrvBuh\Opi_Clp$'
            ''
            #1045#1089#1083#1080' '#1101#1090#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1086', '#1084#1086#1078#1085#1086' '#1085#1072#1078#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1044#1072#1083#1077#1077'".')
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object bBtnCancel00: TBitBtn
          Left = 403
          Top = 277
          Width = 75
          Height = 25
          Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          Caption = #1047#1072#1082#1088#1099#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bBtnCancel1Click
          Kind = bkCancel
          Spacing = 0
        end
        object edKvart: TEdit
          Left = 275
          Top = 20
          Width = 24
          Height = 21
          Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1086#1090#1095#1077#1090#1085#1086#1075#1086' '#1082#1074#1072#1088#1090#1072#1083#1072
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
          Text = '1'
        end
        object UpDownKvart: TUpDown
          Left = 299
          Top = 20
          Width = 15
          Height = 21
          Associate = edKvart
          Min = 1
          Max = 4
          Position = 1
          TabOrder = 3
        end
        object edGod: TEdit
          Left = 366
          Top = 20
          Width = 41
          Height = 21
          Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1086#1090#1095#1077#1090#1085#1086#1075#1086' '#1075#1086#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 4
          Text = '2004'
        end
        object UpDownGod: TUpDown
          Left = 407
          Top = 20
          Width = 15
          Height = 21
          Associate = edGod
          Min = 2004
          Max = 2025
          Position = 2004
          TabOrder = 5
          Thousands = False
        end
      end
    end
    object ts1: TTabSheet
      Caption = 'ts1'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 489
        Height = 312
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 25
          Top = 58
          Width = 173
          Height = 13
          Caption = #1050#1086#1076' '#1045#1044#1056#1055#1054#1059' '#1042#1072#1096#1077#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        end
        object Label5: TLabel
          Left = 25
          Top = 82
          Width = 64
          Height = 13
          Caption = #1045#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        end
        object Label6: TLabel
          Left = 25
          Top = 105
          Width = 432
          Height = 13
          Caption = 
            #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088'                             '#1080' '#1090#1077#1083#1077#1092#1086#1085'   ' +
            '                        '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
        end
        object Label7: TLabel
          Left = 25
          Top = 129
          Width = 432
          Height = 13
          Caption = 
            #1060#1072#1084#1080#1083#1080#1103' '#1048'. '#1054'.                                                   ' +
            '                                            '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
        end
        object Label8: TLabel
          Left = 25
          Top = 153
          Width = 435
          Height = 13
          Caption = 
            #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088'                             '#1080' '#1090#1077#1083#1077#1092#1086#1085'   ' +
            '                        '#1075#1083'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
        end
        object Label9: TLabel
          Left = 25
          Top = 176
          Width = 435
          Height = 13
          Caption = 
            #1060#1072#1084#1080#1083#1080#1103' '#1048'. '#1054'.                                                   ' +
            '                                            '#1075#1083'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
        end
        object Label10: TLabel
          Left = 25
          Top = 200
          Width = 237
          Height = 13
          Caption = #1050#1086#1076' '#1045#1044#1056#1055#1054#1059' '#1076#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1075#1086' '#1086#1088#1075#1072#1085#1091
        end
        object Label11: TLabel
          Left = 25
          Top = 224
          Width = 69
          Height = 13
          Caption = #1045#1075#1086' '#1085#1072#1079#1074#1072#1085#1080#1077
        end
        object sBtnForward1: TSpeedButton
          Left = 325
          Top = 272
          Width = 68
          Height = 25
          Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1101#1090#1072#1087#1091
          Caption = #1044#1072#1083#1077#1077
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000CE0E0000D80E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333444433333
            64444333344443333364444300003334A23333334AAA333334A23333334AAA33
            00003334A23333364A23333334A23333364A2333000033366A6333342A233333
            366A6333342A2333000033334A263364AA333333334A263364AA333300003333
            64A2644AA63333333364A2644AA6333300003333364222AA2333333333364222
            AA233333000033364622AAA633333333364622AAA633333300003334A634AA66
            4444333334A634AA6644443300003334A6342A642AA6333334A6342A642AA633
            00003334A244AA42A633333334A244AA42A63333000033334AA2AA2A33333333
            334AA2AA2A3333330000333334AAA223333333333334AAA22333333300003333
            334A22333333333333334A2233333333000033333334A44333333333333334A4
            433333330000333333342A63333333333333342A63333333000033333334AA63
            33333333333334AA633333330000333333366633333333333333366633333333
            0000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnForward1Click
        end
        object sBtnBack1: TSpeedButton
          Left = 184
          Top = 272
          Width = 68
          Height = 25
          Hint = #1042#1086#1079#1074#1088#1072#1090' '#1082' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1084#1091' '#1101#1090#1072#1087#1091
          Caption = #1053#1072#1079#1072#1076
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
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnBack1Click
        end
        object dbeOrgEdrpou: TDBEdit
          Left = 402
          Top = 54
          Width = 69
          Height = 21
          DataField = 'ORGEDRPOU'
          DataSource = dsrcRkvzt
          TabOrder = 0
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeOrgName: TDBEdit
          Left = 103
          Top = 77
          Width = 368
          Height = 21
          DataField = 'ORGNAME'
          DataSource = dsrcRkvzt
          TabOrder = 1
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeDir_ID: TDBEdit
          Left = 170
          Top = 102
          Width = 81
          Height = 21
          DataField = 'DIR_ID'
          DataSource = dsrcRkvzt
          TabOrder = 2
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeDir_Phone: TDBEdit
          Left = 310
          Top = 102
          Width = 72
          Height = 21
          DataField = 'DIR_PHONE'
          DataSource = dsrcRkvzt
          TabOrder = 3
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeDir_FIO: TDBEdit
          Left = 199
          Top = 125
          Width = 183
          Height = 21
          DataField = 'DIR_FIO'
          DataSource = dsrcRkvzt
          TabOrder = 4
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeBuh_ID: TDBEdit
          Left = 170
          Top = 151
          Width = 81
          Height = 21
          DataField = 'BUH_ID'
          DataSource = dsrcRkvzt
          TabOrder = 5
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeBuh_Phone: TDBEdit
          Left = 310
          Top = 151
          Width = 72
          Height = 21
          DataField = 'BUH_PHONE'
          DataSource = dsrcRkvzt
          TabOrder = 6
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeBuh_FIO: TDBEdit
          Left = 199
          Top = 173
          Width = 183
          Height = 21
          DataField = 'BUH_FIO'
          DataSource = dsrcRkvzt
          TabOrder = 7
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeDpiEdrpou: TDBEdit
          Left = 379
          Top = 199
          Width = 92
          Height = 21
          DataField = 'DPIEDRPOU'
          DataSource = dsrcRkvzt
          TabOrder = 8
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object dbeDpiName: TDBEdit
          Left = 103
          Top = 223
          Width = 368
          Height = 21
          DataField = 'DPINAME'
          DataSource = dsrcRkvzt
          TabOrder = 9
          OnEnter = dbEdiEnter
          OnExit = dbEditExit
        end
        object bBtnCancel1: TBitBtn
          Left = 396
          Top = 272
          Width = 75
          Height = 25
          Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          Caption = #1054#1090#1082#1072#1079
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnClick = bBtnCancel1Click
          Kind = bkCancel
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      DesignSize = (
        489
        306)
      object sBtnBack2: TSpeedButton
        Left = 242
        Top = 288
        Width = 75
        Height = 25
        Hint = #1042#1086#1079#1074#1088#1072#1090' '#1082' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1084#1091' '#1101#1090#1072#1087#1091
        Anchors = [akRight, akBottom]
        Caption = #1053#1072#1079#1072#1076
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
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sBtnBack2Click
      end
      object sBrnForward2: TSpeedButton
        Left = 322
        Top = 288
        Width = 75
        Height = 25
        Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1101#1090#1072#1087#1091
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          04000000000068010000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333444433333
          64444333344443333364444300003334A23333334AAA333334A23333334AAA33
          00003334A23333364A23333334A23333364A2333000033366A6333342A233333
          366A6333342A2333000033334A263364AA333333334A263364AA333300003333
          64A2644AA63333333364A2644AA6333300003333364222AA2333333333364222
          AA233333000033364622AAA633333333364622AAA633333300003334A634AA66
          4444333334A634AA6644443300003334A6342A642AA6333334A6342A642AA633
          00003334A244AA42A633333334A244AA42A63333000033334AA2AA2A33333333
          334AA2AA2A3333330000333334AAA223333333333334AAA22333333300003333
          334A22333333333333334A2233333333000033333334A44333333333333334A4
          433333330000333333342A63333333333333342A63333333000033333334AA63
          33333333333334AA633333330000333333366633333333333333366633333333
          0000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sBrnForward2Click
      end
      object LabelMsg: TLabel
        Left = 3
        Top = 296
        Width = 46
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'LabelMsg'
      end
      object bBtnCancel2: TBitBtn
        Left = 414
        Top = 288
        Width = 75
        Height = 25
        Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        Anchors = [akRight, akBottom]
        Caption = #1042#1099#1093#1086#1076
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bBtnCancel1Click
        Kind = bkCancel
      end
      object MemoDbg: TMemo
        Left = 0
        Top = 0
        Width = 489
        Height = 284
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'MemoDbg')
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Memo1: TMemo
        Left = 216
        Top = 128
        Width = 233
        Height = 129
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          #1042' tblProm '#1087#1088#1086#1073#1091#1102' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086' '
          #1086#1073#1098#1077#1076#1080#1085#1103#1090#1100' '#1084#1077#1089#1103#1095#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1080#1079' '#1085#1086#1074#1086#1081' '
          #1041#1044' '#1080' '#1089#1090#1072#1088#1099#1093' '#1053#1059'.'
          #1045#1089#1083#1080' '#1077#1089#1090#1100' '#1084#1077#1089#1103#1095#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1080#1079' '#1085#1086#1074#1086#1081' '#1041#1044' - '
          #1074#1089#1077' '#1044#1090#1055#1088#1084', '#1044#1090#1059#1074', '#1054#1079#1085'_'#1044#1086#1093', '#1054#1079#1085'_'#1055#1080#1083#1075', '
          #1057#1086#1074#1084' '#1073#1077#1088#1091' '#1080#1079' '#1085#1086#1074#1086#1081', '#1089#1090#1072#1088#1099#1077' '#1080#1075#1085#1086#1088#1080#1088#1091#1102'.'
          ''
          #1055#1086#1090#1086#1084' '#1080#1079' tblProm '#1073#1091#1076#1091' '#1087#1077#1088#1077#1085#1086#1089#1080#1090#1100' '#1074' tblTmp. ')
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object dbgrLgotu: TDBGrid
        Left = 48
        Top = 96
        Width = 124
        Height = 89
        Color = clMoneyGreen
        DataSource = dsrcLgotu
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 337
    Width = 497
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object tblTmp: TTable
    Left = 16
    Top = 208
  end
  object qryTmp: TQuery
    Left = 88
    Top = 72
  end
  object cdsLgotu: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'OZN_PILG'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 256
    object cdsLgotuOZN_PILG: TSmallintField
      DisplayWidth = 4
      FieldName = 'OZN_PILG'
    end
  end
  object qryRkvzt: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_DfRkvzt')
    UpdateObject = updRkvzt
    Left = 24
    Top = 72
  end
  object dsrcRkvzt: TDataSource
    DataSet = qryRkvzt
    Left = 32
    Top = 80
  end
  object updRkvzt: TUpdateSQL
    ModifySQL.Strings = (
      'update z_DfRkvzt'
      'set'
      '  DTBEG = :DTBEG,'
      '  ORGEDRPOU = :ORGEDRPOU,'
      '  ORGNAME = :ORGNAME,'
      '  DIR_ID = :DIR_ID,'
      '  DIR_PHONE = :DIR_PHONE,'
      '  DIR_FIO = :DIR_FIO,'
      '  BUH_ID = :BUH_ID,'
      '  BUH_PHONE = :BUH_PHONE,'
      '  BUH_FIO = :BUH_FIO,'
      '  DPIEDRPOU = :DPIEDRPOU,'
      '  DPINAME = :DPINAME'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_DfRkvzt'
      
        '  (DTBEG, ORGEDRPOU, ORGNAME, DIR_ID, DIR_PHONE, DIR_FIO, BUH_ID' +
        ', '
      'BUH_PHONE, '
      '   BUH_FIO, DPIEDRPOU, DPINAME)'
      'values'
      '  (:DTBEG, :ORGEDRPOU, :ORGNAME, :DIR_ID, :DIR_PHONE, :DIR_FIO, '
      ':BUH_ID, '
      '   :BUH_PHONE, :BUH_FIO, :DPIEDRPOU, :DPINAME)')
    DeleteSQL.Strings = (
      'delete from z_DfRkvzt'
      'where'
      '  NR = :OLD_NR')
    Left = 40
    Top = 88
  end
  object qryZNu: TQuery
    Left = 152
    Top = 72
  end
  object qryZPrmUv: TQuery
    Left = 208
    Top = 72
  end
  object qryIsRecOsnBD: TQuery
    Left = 272
    Top = 72
  end
  object qryDop: TQuery
    Left = 328
    Top = 72
  end
  object tblProm: TTable
    DatabaseName = '__KBDE'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'NP'
        DataType = ftInteger
      end
      item
        Name = 'BadID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'fNU'
        DataType = ftSmallint
      end
      item
        Name = 'TIN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Sovm'
        DataType = ftSmallint
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'S_NAR'
        DataType = ftFloat
      end
      item
        Name = 'S_DOX'
        DataType = ftFloat
      end
      item
        Name = 'S_TAXN'
        DataType = ftFloat
      end
      item
        Name = 'S_TAXP'
        DataType = ftFloat
      end
      item
        Name = 'OZN_DOX'
        DataType = ftSmallint
      end
      item
        Name = 'D_PRIYN'
        DataType = ftDate
      end
      item
        Name = 'D_ZVILN'
        DataType = ftDate
      end
      item
        Name = 'OZN_PILG'
        DataType = ftSmallint
      end
      item
        Name = 'OZNAKA'
        DataType = ftSmallint
      end
      item
        Name = 'DopRec'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'tblProm.db'
    Left = 180
    Top = 171
    object tblPromNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblPromNP: TIntegerField
      FieldName = 'NP'
    end
    object tblPromBadID: TStringField
      FieldName = 'BadID'
      Size = 10
    end
    object tblPromfNU: TSmallintField
      FieldName = 'fNU'
    end
    object tblPromTabN: TIntegerField
      FieldName = 'TabN'
    end
    object tblPromTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object tblPromSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object tblPromFam: TStringField
      FieldName = 'Fam'
    end
    object tblPromIma: TStringField
      FieldName = 'Ima'
    end
    object tblPromOtch: TStringField
      FieldName = 'Otch'
    end
    object tblPromS_NAR: TFloatField
      FieldName = 'S_NAR'
    end
    object tblPromS_DOX: TFloatField
      FieldName = 'S_DOX'
    end
    object tblPromS_TAXN: TFloatField
      FieldName = 'S_TAXN'
    end
    object tblPromS_TAXP: TFloatField
      FieldName = 'S_TAXP'
    end
    object tblPromOZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object tblPromD_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object tblPromD_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object tblPromOZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object tblPromOZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object tblPromDopRec: TStringField
      FieldName = 'DopRec'
      Size = 1
    end
  end
  object qryZPere: TQuery
    Left = 384
    Top = 72
  end
  object dsrcLgotu: TDataSource
    DataSet = cdsLgotu
    Left = 152
    Top = 296
  end
  object qryLgotu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Get_Lgota (3774, '#39'08/01/2010'#39', '#39'08/31/2010'#39')')
    Left = 96
    Top = 256
  end
  object qryKmd: TQuery
    Left = 20
    Top = 259
  end
end
