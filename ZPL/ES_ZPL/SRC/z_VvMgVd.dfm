object FormVvSpsDlg: TFormVvSpsDlg
  Left = 170
  Top = 458
  Width = 375
  Height = 571
  BorderIcons = [biSystemMenu]
  Caption = 'FormVvSpsDlg'
  Color = clBtnFace
  Constraints.MaxWidth = 375
  Constraints.MinHeight = 510
  Constraints.MinWidth = 375
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
    Width = 367
    Height = 544
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnResize = PageControl1Resize
    object ts1: TTabSheet
      Caption = 'ts1'
      DesignSize = (
        359
        513)
      object Label1: TLabel
        Left = 9
        Top = 10
        Width = 114
        Height = 13
        Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnObj: TSpeedButton
        Left = 260
        Top = 5
        Width = 78
        Height = 23
        Hint = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnObjClick
      end
      object sBtnObjClear: TSpeedButton
        Left = 339
        Top = 5
        Width = 17
        Height = 23
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sBtnObjClearClick
      end
      object Label2: TLabel
        Left = 6
        Top = 33
        Width = 147
        Height = 13
        Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1084#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sBtnKatP: TSpeedButton
        Left = 260
        Top = 29
        Width = 78
        Height = 23
        Hint = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnKatPClick
      end
      object sBtnKatPClear: TSpeedButton
        Left = 339
        Top = 29
        Width = 17
        Height = 23
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sBtnKatPClearClick
      end
      object Label18: TLabel
        Left = 128
        Top = 9
        Width = 89
        Height = 13
        Caption = '('#1073#1077#1079' '#1074#1099#1073#1086#1088#1072' '#1042#1057#1045')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 160
        Top = 33
        Width = 89
        Height = 13
        Caption = '('#1073#1077#1079' '#1074#1099#1073#1086#1088#1072' '#1042#1057#1045')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object PanelBottom: TPanel
        Left = 0
        Top = 55
        Width = 359
        Height = 420
        Anchors = [akLeft, akTop, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object SplitterObjKatP: TSplitter
          Left = 2
          Top = 311
          Width = 355
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Color = clTeal
          ParentColor = False
        end
        object dbgrKatP: TDBGrid
          Left = 2
          Top = 314
          Width = 355
          Height = 104
          Hint = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          Align = alBottom
          Color = clSkyBlue
          DataSource = dsrcKatP
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'KdKatP'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShKatP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NmKatP'
              Width = 195
              Visible = True
            end>
        end
        object dbgrObj: TDBGrid
          Left = 2
          Top = 2
          Width = 355
          Height = 231
          Hint = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          Color = clMoneyGreen
          DataSource = dsrcObj
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'KdObj'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShObj'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NmObj'
              Width = 162
              Visible = True
            end>
        end
        object LbxFilter: TListBox
          Left = 155
          Top = 48
          Width = 102
          Height = 57
          Color = clLime
          ItemHeight = 13
          Items.Strings = (
            '1000-1100 // '#1054#1089#1085'. '#1074#1080#1076#1099
            '1200-1201 // '#1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1076#1086#1087'.'#1074#1080#1076#1086#1074
            '1202-1207 // '#1044#1086#1087'.'#1074#1080#1076#1099
            '1800-1900 // '#1052#1072#1090#1087#1086#1084#1086#1097#1080
            '1900-2000 // '#1055#1086#1089#1086#1073#1080#1103
            '2200-2300 // '#1055#1088#1077#1084#1080#1080
            '5000-5100 // '#1053#1077#1086#1087#1083#1072#1095#1080#1074#1072#1077#1084#1099#1077' '#1074#1080#1076#1099
            '6000-6899 // '#1059#1076#1077#1088#1078#1072#1085#1080#1103
            '7500-7600 // '#1042#1099#1087#1083#1072#1090#1099)
          TabOrder = 2
          Visible = False
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 481
        Width = 359
        Height = 32
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          359
          32)
        object sBtnNext1: TSpeedButton
          Left = 203
          Top = 4
          Width = 75
          Height = 25
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
          OnClick = sBtnNext1Click
        end
        object bBtnCancel1: TBitBtn
          Left = 281
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 481
        Width = 359
        Height = 32
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          359
          32)
        object sBtnNext2: TSpeedButton
          Left = 203
          Top = 4
          Width = 75
          Height = 25
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
          OnClick = sBtnNext2Click
        end
        object sBtnBack2: TSpeedButton
          Left = 125
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
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
          OnClick = sBtnBack2Click
        end
        object bBtnCancel2: TBitBtn
          Left = 281
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object PanelTs2: TPanel
        Left = 1
        Top = 5
        Width = 359
        Height = 471
        BevelOuter = bvNone
        TabOrder = 1
        object grBoxSumma: TGroupBox
          Left = 4
          Top = 5
          Width = 350
          Height = 154
          Caption = '  '#1050#1072#1082' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1091' "'#1057#1091#1084#1084#1072' '#1082' '#1074#1099#1087#1083#1072#1090#1077'":  '
          TabOrder = 0
          object rBtnEmpty: TRadioButton
            Left = 13
            Top = 17
            Width = 290
            Height = 17
            Hint = #1057#1091#1084#1084#1091' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1073#1091#1076#1077#1090' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' "'#1074#1088#1091#1095#1085#1091#1102'" '#1074' '#1090#1072#1073#1083#1080#1094#1077
            Caption = '- '#1086#1089#1090#1072#1074#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1091' '#1087#1091#1089#1090#1086#1081
            Checked = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TabStop = True
            OnClick = rBtnClick
          end
          object rBtnPrcVida: TRadioButton
            Left = 13
            Top = 85
            Width = 308
            Height = 17
            Hint = #1057#1091#1084#1084#1072' '#1073#1091#1076#1077#1090' '#1074#1099#1073#1080#1088#1072#1090#1100#1089#1103' '#1089' '#1091#1095#1077#1090#1086#1084' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '
            Caption = '- '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = rBtnClick
          end
          object rBtnPrcOkl: TRadioButton
            Left = 13
            Top = 51
            Width = 290
            Height = 17
            Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1074#1074#1086#1076#1080#1090#1089#1103' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
            Caption = '- '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1086#1082#1083#1072#1076#1072
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = rBtnClick
          end
          object rBtnConstSum: TRadioButton
            Left = 13
            Top = 34
            Width = 290
            Height = 17
            Hint = #1054#1076#1080#1085#1072#1082#1086#1074#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1083#1103' '#1074#1089#1077#1075#1086' '#1089#1087#1080#1089#1082#1072' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
            Caption = '- '#1086#1076#1080#1085#1072#1082#1086#1074#1091#1102' '#1089#1091#1084#1084#1091' '#1087#1086' '#1074#1089#1077#1084#1091' '#1089#1087#1080#1089#1082#1091
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = rBtnClick
          end
          object rBtnVvodOtkl: TRadioButton
            Left = 13
            Top = 101
            Width = 326
            Height = 45
            Hint = '['#1053#1077' '#1075#1086#1076#1080#1090#1089#1103' '#1076#1083#1103' '#1073#1102#1076#1078#1077#1090#1085#1099#1093' '#1074#1080#1076#1086#1074']'
            Caption = 
              '- '#1074#1074#1077#1089#1090#1080' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091', '#1087#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1088#1072#1089#1095#1077#1090', '#1087#1086#1083#1091#1095#1077 +
              #1085#1085#1099#1077' '#1089#1091#1084#1084#1099' '#1074#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' ('#1089' '#1091#1095#1077#1090#1086#1084' '#1091#1076#1077#1088#1078#1072#1085#1080#1081')        ['#1053#1077' ' +
              #1075#1086#1076#1080#1090#1089#1103' '#1076#1083#1103' '#1073#1102#1076#1078#1077#1090#1085#1099#1093' '#1074#1080#1076#1086#1074']'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            WordWrap = True
            OnClick = rBtnClick
          end
          object rBtnPrcByNU: TRadioButton
            Left = 13
            Top = 68
            Width = 290
            Height = 17
            Hint = 
              #1048#1079' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1089#1091#1084#1084' '#1073#1091#1076#1077#1090' '#1074#1099#1073#1088#1072#1085' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1089' '#1091#1095#1077#1090#1086#1084' '#1091#1076#1077#1088#1078 +
              #1072#1085#1080#1081
            Caption = '- '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = rBtnClick
          end
        end
        object grBoxVidSredstv: TGroupBox
          Left = 77
          Top = 161
          Width = 277
          Height = 38
          Caption = ' '#1042#1099#1073#1080#1088#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074#1080#1076' '#1089#1088#1077#1076#1089#1090#1074': '
          TabOrder = 1
          object rBtnVsBudget: TRadioButton
            Left = 20
            Top = 16
            Width = 63
            Height = 17
            Hint = #1055#1086' '#1082#1072#1082#1086#1084#1091' '#1074#1080#1076#1091' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1099#1076#1072#1077#1090#1089#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
            Caption = '- '#1073#1102#1076#1078#1077#1090
            Checked = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TabStop = True
          end
          object rBtnVsSpecSr: TRadioButton
            Left = 105
            Top = 16
            Width = 96
            Height = 17
            Hint = #1055#1086' '#1082#1072#1082#1086#1084#1091' '#1074#1080#1076#1091' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1099#1076#1072#1077#1090#1089#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
            Caption = '- '#1089#1087#1077#1094#1089#1088#1077#1076#1089#1090#1074#1072
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object rBtnVsBoth: TRadioButton
            Left = 223
            Top = 16
            Width = 45
            Height = 17
            Caption = #1086#1073#1072
            TabOrder = 2
          end
        end
        object PanelSumVid: TPanel
          Left = 0
          Top = 201
          Width = 358
          Height = 54
          BevelOuter = bvNone
          TabOrder = 2
          object LabelVidN: TLabel
            Left = 4
            Top = 8
            Width = 205
            Height = 13
            Caption = #1042#1099#1073#1080#1088#1072#1090#1100' '#1089#1091#1084#1084#1099', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1099#1077' '#1087#1086' '#1074#1080#1076#1091':'
          end
          object sBtnVidN: TSpeedButton
            Left = 338
            Top = 5
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Enabled = False
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000E0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700700000778888870077777777777777007770777777877700770007777888
              7700700000778888870000000008887888007700077778787700770007777888
              770077000777788877007777777777777700}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnVidNClick
          end
          object LabelSmPrc: TLabel
            Left = 4
            Top = 32
            Width = 270
            Height = 13
            Alignment = taRightJustify
            Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1086#1081' '#1089#1091#1084#1084#1099' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091
          end
          object dbeSmPrc: TDBEdit
            Left = 285
            Top = 29
            Width = 68
            Height = 21
            Color = clBtnFace
            DataField = 'SmPrc'
            DataSource = dsrcTmp
            Enabled = False
            TabOrder = 2
            OnEnter = dbeEnter
            OnExit = dbeSmPrcExit
          end
          object dbeShVidN: TDBEdit
            Left = 258
            Top = 5
            Width = 79
            Height = 21
            Color = clBtnFace
            DataField = 'ShVidN'
            DataSource = dsrcTmp
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            OnEnter = dbeEnter
            OnExit = dbeVidNExit
          end
          object dbeVidN: TDBEdit
            Left = 217
            Top = 5
            Width = 41
            Height = 21
            Color = clBtnFace
            DataField = 'VidN'
            DataSource = dsrcTmp
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnEnter = dbeEnter
            OnExit = dbeVidNExit
          end
        end
        object PanelDopOtkl: TPanel
          Left = 3
          Top = 255
          Width = 351
          Height = 211
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          object Label6: TLabel
            Left = 19
            Top = 58
            Width = 80
            Height = 13
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          end
          object sBtnObjOtkl: TSpeedButton
            Left = 98
            Top = 72
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000E0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700700000778888870077777777777777007770777777877700770007777888
              7700700000778888870000000008887888007700077778787700770007777888
              770077000777788877007777777777777700}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnObjOtklClick
          end
          object Label7: TLabel
            Left = 134
            Top = 58
            Width = 83
            Height = 13
            Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089'.'
          end
          object sBtnKatPOtkl: TSpeedButton
            Left = 213
            Top = 72
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000E0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700700000778888870077777777777777007770777777877700770007777888
              7700700000778888870000000008887888007700077778787700770007777888
              770077000777788877007777777777777700}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnKatPOtklClick
          end
          object Label8: TLabel
            Left = 251
            Top = 58
            Width = 41
            Height = 13
            Caption = #1057#1095#1077#1090' '#1041#1059
          end
          object sBtnSpzOtkl: TSpeedButton
            Left = 310
            Top = 72
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000E0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700700000778888870077777777777777007770777777877700770007777888
              7700700000778888870000000008887888007700077778787700770007777888
              770077000777788877007777777777777700}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnSpzOtklClick
          end
          object Label5: TLabel
            Left = 286
            Top = 94
            Width = 54
            Height = 13
            Caption = #1050'-'#1074#1086' '#1095#1072#1089#1086#1074
            FocusControl = dbeChasOtkl
          end
          object Label9: TLabel
            Left = 201
            Top = 94
            Width = 61
            Height = 13
            Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
            FocusControl = dbeDtEndOtkl
          end
          object Label10: TLabel
            Left = 112
            Top = 94
            Width = 64
            Height = 13
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
            FocusControl = dbeDtBegOtkl
          end
          object Label11: TLabel
            Left = 19
            Top = 94
            Width = 48
            Height = 13
            Caption = #1047#1072' '#1084#1077#1089#1103#1094
          end
          object Label12: TLabel
            Left = 181
            Top = 130
            Width = 63
            Height = 13
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            FocusControl = dbeNotesOtkl
          end
          object Label13: TLabel
            Left = 89
            Top = 130
            Width = 22
            Height = 13
            Caption = #1055#1076#1053
            FocusControl = dbePdNOtkl
          end
          object Label14: TLabel
            Left = 19
            Top = 130
            Width = 34
            Height = 13
            Caption = #1057#1091#1084#1084#1072
            FocusControl = dbeSummaOtkl
          end
          object Label15: TLabel
            Left = 2
            Top = 166
            Width = 347
            Height = 13
            Align = alBottom
            Alignment = taCenter
            Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1102
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 2
            Top = 179
            Width = 347
            Height = 30
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1045#1089#1083#1080' '#1085#1077' '#1074#1074#1077#1076#1077#1085#1099' '#1087#1086#1076#1088#1072#1079#1076'., '#1082#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089'. '#1080' '#1089#1095#1077#1090' '#1041#1059' - '#1086#1085#1080' '#1073#1091#1076#1091#1090' ' +
              #1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1079#1072#1087#1086#1083#1085#1103#1090#1100#1089#1103' '#1079#1085#1072#1095#1077#1085#1080#1103#1084#1080' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object sBtnObjOtklClear: TSpeedButton
            Left = 113
            Top = 72
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Caption = #1061
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnObjOtklClearClick
          end
          object sBtnKatPOtklClear: TSpeedButton
            Left = 228
            Top = 72
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Caption = #1061
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnKatPOtklClearClick
          end
          object sBtnSpzOtklClear: TSpeedButton
            Left = 325
            Top = 72
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Caption = #1061
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnSpzOtklClearClick
          end
          object sBtnVidNOtkl: TSpeedButton
            Left = 325
            Top = 35
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000E0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700700000778888870077777777777777007770777777877700770007777888
              7700700000778888870000000008887888007700077778787700770007777888
              770077000777788877007777777777777700}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnVidNOtklClick
          end
          object Label17: TLabel
            Left = 75
            Top = 31
            Width = 121
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1074#1074#1086#1076#1080#1084#1086#1075#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
            Transparent = True
            WordWrap = True
          end
          object Label4: TLabel
            Left = 37
            Top = 2
            Width = 302
            Height = 31
            Alignment = taRightJustify
            AutoSize = False
            Caption = 
              #1053#1077' '#1074#1074#1086#1076#1080#1090#1077' "'#1073#1102#1076#1078#1077#1090#1085#1099#1093'" '#1074#1080#1076#1086#1074'! ('#1045#1089#1083#1080' '#1074' '#1091#1089#1084#1077#1088#1090#1100' '#1085#1072#1076#1086' - '#1044#1090#1053#1072#1095#1072#1083#1072', '#1044 +
              #1090#1054#1082#1086#1085#1095'., '#1063#1072#1089#1099' '#1076#1086#1083#1078#1085#1099' '#1073#1099#1090#1100' '#1087#1091#1089#1090#1099#1084#1080')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object dbeShObjOtkl: TDBEdit
            Left = 19
            Top = 72
            Width = 79
            Height = 21
            DataField = 'ShObjOtkl'
            DataSource = dsrcTmp
            ReadOnly = True
            TabOrder = 2
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeKatPOtkl: TDBEdit
            Left = 134
            Top = 72
            Width = 79
            Height = 21
            DataField = 'ShKatPOtkl'
            DataSource = dsrcTmp
            ReadOnly = True
            TabOrder = 3
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeSPZOtkl: TDBEdit
            Left = 251
            Top = 72
            Width = 59
            Height = 21
            DataField = 'SchBuOtkl'
            DataSource = dsrcTmp
            ReadOnly = True
            TabOrder = 4
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object DBComboZaMesGodOtkl: TDBComboBox
            Left = 19
            Top = 108
            Width = 71
            Height = 21
            Hint = #1047#1072' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1074#1086#1076#1080#1090#1089#1103' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077
            Style = csDropDownList
            DataField = 'ZaMesGodOtkl'
            DataSource = dsrcTmp
            ItemHeight = 13
            Items.Strings = (
              '01-2003'
              '02-2003'
              '03-2003'
              '04-2003'
              '05-2003'
              '06-2003'
              '07-2003'
              '08-2003'
              '09-2003'
              '10-2003'
              '11-2003'
              '12-2003'
              '01-2004')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnEnter = DBComboZaMesGodOtklEnter
            OnExit = DBComboZaMesGodOtklExit
          end
          object dbeDtBegOtkl: TDBEdit
            Left = 112
            Top = 108
            Width = 80
            Height = 21
            Hint = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
            DataField = 'Dt_BegOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeDtEndOtkl: TDBEdit
            Left = 201
            Top = 108
            Width = 80
            Height = 21
            Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
            DataField = 'Dt_EndOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeChasOtkl: TDBEdit
            Left = 290
            Top = 108
            Width = 50
            Height = 21
            Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074
            DataField = 'ChasOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeSummaOtkl: TDBEdit
            Left = 19
            Top = 144
            Width = 70
            Height = 21
            Hint = #1053#1072#1095#1080#1089#1083#1103#1077#1084#1072#1103' '#1089#1091#1084#1084#1072
            DataField = 'SummaOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbePdNOtkl: TDBEdit
            Left = 89
            Top = 144
            Width = 25
            Height = 21
            Hint = #1055#1088#1080#1079#1072#1082' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072' (1)'
            DataField = 'PdnOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeNotesOtkl: TDBEdit
            Left = 181
            Top = 144
            Width = 159
            Height = 21
            Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            DataField = 'NotesOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeVidNOtkl: TDBEdit
            Left = 198
            Top = 35
            Width = 41
            Height = 21
            Hint = #1050#1086#1076' '#1074#1080#1076#1072
            TabStop = False
            DataField = 'VidNOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnDblClick = sBtnVidNClick
            OnEnter = dbeEnter
            OnExit = dbeVidNOtklExit
          end
          object dbeShVidNOtkl: TDBEdit
            Left = 238
            Top = 35
            Width = 87
            Height = 21
            Hint = #1064#1080#1092#1088' '#1074#1080#1076#1072
            DataField = 'ShVidNOtkl'
            DataSource = dsrcTmp
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 1
            OnDblClick = sBtnVidNClick
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
        end
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 481
        Width = 359
        Height = 32
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          359
          32)
        object sBtnNext3: TSpeedButton
          Left = 203
          Top = 4
          Width = 75
          Height = 25
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
          OnClick = sBtnNext3Click
        end
        object sBtnBack3: TSpeedButton
          Left = 125
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
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
          OnClick = sBtnBack3Click
        end
        object bBtnCancel3: TBitBtn
          Left = 281
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object dbgrOtkl: TDBGrid
        Left = 0
        Top = 0
        Width = 359
        Height = 481
        Align = alClient
        DataSource = dsrcOtkl
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object ts4: TTabSheet
      Caption = 'ts4'
      ImageIndex = 3
      object Label3: TLabel
        Left = 120
        Top = 152
        Width = 37
        Height = 13
        Caption = 'Page_4'
      end
      object Panel4: TPanel
        Left = 0
        Top = 481
        Width = 359
        Height = 32
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          359
          32)
        object sBtnBack4: TSpeedButton
          Left = 125
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
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
          OnClick = sBtnBack4Click
        end
        object bBtnCancel: TBitBtn
          Left = 281
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
        object bBtnOk: TBitBtn
          Left = 203
          Top = 4
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1074#1086#1076
          TabOrder = 1
          Kind = bkOK
        end
      end
    end
  end
  object cdsObj: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'ShObj'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmObj'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'AIndx'
        DataType = ftInteger
      end
      item
        Name = 'PIndx'
        DataType = ftInteger
      end
      item
        Name = 'Lvl'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'cdsObjOnKdObj'
        Fields = 'KdObj'
      end>
    IndexName = 'cdsObjOnKdObj'
    Params = <>
    StoreDefs = True
    Left = 240
    object cdsObjNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsObjKdObj: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KdObj'
    end
    object cdsObjShObj: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'ShObj'
      Size = 15
    end
    object cdsObjNmObj: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      FieldName = 'NmObj'
      Size = 65
    end
    object cdsObjAIndx: TIntegerField
      FieldName = 'AIndx'
    end
    object cdsObjPIndx: TIntegerField
      FieldName = 'PIndx'
    end
    object cdsObjLvl: TIntegerField
      FieldName = 'Lvl'
    end
  end
  object cdsKatP: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'ShKatP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmKatP'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <
      item
        Name = 'cdsKatPOnKdKatP'
        Fields = 'KdKatP'
      end>
    IndexName = 'cdsKatPOnKdKatP'
    Params = <>
    StoreDefs = True
    Left = 296
    object cdsKatPNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsKatPKdKatP: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KdKatP'
    end
    object cdsKatPShKatP: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'ShKatP'
      Size = 10
    end
    object cdsKatPNmKatP: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'NmKatP'
      Size = 35
    end
  end
  object dsrcObj: TDataSource
    DataSet = cdsObj
    Left = 256
    Top = 8
  end
  object dsrcKatP: TDataSource
    DataSet = cdsKatP
    Left = 312
    Top = 8
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SmPrc'
        DataType = ftFloat
      end
      item
        Name = 'VidNOtkl'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidNOtkl'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KdObjOtkl'
        DataType = ftSmallint
      end
      item
        Name = 'ShObjOtkl'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KdKatPOtkl'
        DataType = ftSmallint
      end
      item
        Name = 'ShKatPOtkl'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KdSpzOtkl'
        DataType = ftSmallint
      end
      item
        Name = 'SchBuOtkl'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZaMesGodOtkl'
        DataType = ftDate
      end
      item
        Name = 'Dt_BegOtkl'
        DataType = ftDate
      end
      item
        Name = 'Dt_EndOtkl'
        DataType = ftDate
      end
      item
        Name = 'ChasOtkl'
        DataType = ftFloat
      end
      item
        Name = 'SummaOtkl'
        DataType = ftFloat
      end
      item
        Name = 'PdnOtkl'
        DataType = ftSmallint
      end
      item
        Name = 'NotesOtkl'
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 184
    object cdsTmpVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cdsTmpShVidN: TStringField
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsTmpSmPrc: TFloatField
      FieldName = 'SmPrc'
    end
    object cdsTmpVidNOtkl: TStringField
      FieldName = 'VidNOtkl'
      OnValidate = cdsTmpVidNOtklValidate
      Size = 4
    end
    object cdsTmpKdObjOtkl: TSmallintField
      FieldName = 'KdObjOtkl'
    end
    object cdsTmpShObjOtkl: TStringField
      FieldName = 'ShObjOtkl'
      Size = 15
    end
    object cdsTmpShVidNOtkl: TStringField
      FieldName = 'ShVidNOtkl'
      Size = 15
    end
    object cdsTmpKdKatPOtkl: TSmallintField
      FieldName = 'KdKatPOtkl'
    end
    object cdsTmpShKatPOtkl: TStringField
      FieldName = 'ShKatPOtkl'
      Size = 10
    end
    object cdsTmpKdSpzOtkl: TSmallintField
      FieldName = 'KdSpzOtkl'
    end
    object cdsTmpSchBuOtkl: TStringField
      FieldName = 'SchBuOtkl'
      Size = 10
    end
    object cdsTmpZaMesGodOtkl: TDateField
      FieldName = 'ZaMesGodOtkl'
      OnSetText = cdsTmpZaMesGodOtklSetText
      OnValidate = cdsTmpZaMesGodOtklValidate
      EditMask = '99\-99;1;_'
    end
    object cdsTmpDt_BegOtkl: TDateField
      FieldName = 'Dt_BegOtkl'
      OnSetText = DateFieldSetText
      OnValidate = cdsTmpDt_BegOtklValidate
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDt_EndOtkl: TDateField
      FieldName = 'Dt_EndOtkl'
      OnSetText = DateFieldSetText
      OnValidate = cdsTmpDt_EndOtklValidate
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpChasOtkl: TFloatField
      FieldName = 'ChasOtkl'
    end
    object cdsTmpSummaOtkl: TFloatField
      FieldName = 'SummaOtkl'
    end
    object cdsTmpPdnOtkl: TSmallintField
      FieldName = 'PdnOtkl'
    end
    object cdsTmpNotesOtkl: TStringField
      FieldName = 'NotesOtkl'
      Size = 25
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 200
    Top = 8
  end
  object qryTmp: TQuery
    Left = 52
    Top = 434
  end
  object cdsOtkl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Chas'
        DataType = ftFloat
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'Dt_Beg'
        DataType = ftDate
      end
      item
        Name = 'Dt_End'
        DataType = ftDate
      end
      item
        Name = 'PdN'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'KdPSCH'
        DataType = ftSmallint
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 132
    Top = 435
    object cdsOtklNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsOtklKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsOtklDtProc: TDateField
      FieldName = 'DtProc'
    end
    object cdsOtklZaMesGod: TDateField
      FieldName = 'ZaMesGod'
    end
    object cdsOtklTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsOtklVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cdsOtklChas: TFloatField
      FieldName = 'Chas'
    end
    object cdsOtklSumma: TFloatField
      FieldName = 'Summa'
    end
    object cdsOtklKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsOtklKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsOtklDt_Beg: TDateField
      FieldName = 'Dt_Beg'
    end
    object cdsOtklDt_End: TDateField
      FieldName = 'Dt_End'
    end
    object cdsOtklPdN: TSmallintField
      FieldName = 'PdN'
    end
    object cdsOtklKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsOtklKdPSCH: TSmallintField
      FieldName = 'KdPSCH'
    end
    object cdsOtklNotes: TStringField
      FieldName = 'Notes'
      Size = 25
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = cdsOtkl
    Left = 144
    Top = 448
  end
end
