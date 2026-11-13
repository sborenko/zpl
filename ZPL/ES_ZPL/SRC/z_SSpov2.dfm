object FormSprSpov2: TFormSprSpov2
  Left = 436
  Top = 294
  Width = 692
  Height = 437
  BorderIcons = [biSystemMenu]
  Caption = 'FormSprSpov2'
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 676
    Height = 398
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnResize = PageControlResize
    object ts0: TTabSheet
      Caption = 'ts0'
      ImageIndex = 2
      object PanelButtons: TPanel
        Left = 0
        Top = 340
        Width = 668
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          668
          27)
        object sBtnGo0: TSpeedButton
          Left = 523
          Top = 2
          Width = 68
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
          Spacing = 1
          OnClick = sBtnGo0Click
        end
        object bBtnExit0: TBitBtn
          Left = 595
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkClose
        end
      end
      object PanelMain: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 340
        Align = alClient
        TabOrder = 1
        object Label1: TLabel
          Left = 13
          Top = 222
          Width = 281
          Height = 47
          AutoSize = False
          Caption = 
            #1042#1086#1086#1073#1097#1077'-'#1090#1086' '#1089#1087#1088#1072#1074#1082#1072' '#1076#1086#1083#1078#1085#1072' '#1074#1099#1076#1072#1074#1072#1090#1100#1089#1103' : '#1079#1072' '#1083#1102#1073#1086#1081' '#1082#1074'., '#1079#1072' '#1083#1102#1073#1086#1077' '#1087#1075',' +
            ' '#1079#1072' '#1075#1086#1076'. '#1055#1088#1080' '#1089#1083#1091#1095#1072#1077' '#1087#1077#1088#1077#1076#1077#1083#1072#1090#1100' '#1079#1072#1087#1088#1086#1089' '#1087#1077#1088#1080#1086#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object PanelTs0: TPanel
          Left = 3
          Top = 2
          Width = 299
          Height = 215
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label9: TLabel
            Left = 87
            Top = 81
            Width = 95
            Height = 13
            Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
          end
          object sBtnSpovTabN: TSpeedButton
            Left = 260
            Top = 77
            Width = 21
            Height = 23
            Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
              33333377838387733333307BEBEB7033333337F8383838F3333377BEBEBEB773
              333337838383833F333307EBEBEBE703333378383838383F333307BEBEBEB703
              33337F838383838F333307EBEBEBE703333373F838383873333377BEBEBEB773
              33333783838387F33333307BEBEB703333333738F838F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnSpovTabNClick
          end
          object LabelFio0: TLabel
            Left = 12
            Top = 159
            Width = 267
            Height = 19
            Alignment = taCenter
            AutoSize = False
            Caption = 'LabelFamIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 45
            Top = 109
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = #1060#1072#1084#1080#1083#1080#1103
            WordWrap = True
          end
          object sBtnSpovFindFam: TSpeedButton
            Left = 260
            Top = 105
            Width = 21
            Height = 23
            Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080' ('#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1090#1077')'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
              33333377838387733333307B8B8B7033333337F8383838F3333377B8B8B8B773
              333337838383833F3333078B8B8B8703333378383838383F333307B8B8B8B703
              33337F838383838F3333078B8B8B8703333373F838383873333377B8B8B8B773
              33333783838387F33333307B8B8B703333333738F838F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnSpovFindFamClick
          end
          object Label12: TLabel
            Left = 43
            Top = 126
            Width = 109
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' (TIN)'
            FocusControl = dbeSpovTin
            WordWrap = True
          end
          object sBtnSpovFindTin: TSpeedButton
            Left = 260
            Top = 131
            Width = 21
            Height = 23
            Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1058#1048#1053' ('#1087#1086' '#1090#1086#1095#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102')'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
              33333377838387733333307B8B8B7033333337F8383838F3333377B8B8B8B773
              333337838383833F3333078B8B8B8703333378383838383F333307B8B8B8B703
              33337F838383838F3333078B8B8B8703333373F838383873333377B8B8B8B773
              33333783838387F33333307B8B8B703333333738F838F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnSpovFindTinClick
          end
          object Label13: TLabel
            Left = 66
            Top = 183
            Width = 123
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          end
          object Label10: TLabel
            Left = 21
            Top = 14
            Width = 163
            Height = 13
            Caption = #1055#1086' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100':'
          end
          object Label14: TLabel
            Left = 16
            Top = 31
            Width = 265
            Height = 45
            Alignment = taRightJustify
            AutoSize = False
            Caption = 
              #1055#1088#1080' '#1083#1102#1073#1086#1081' '#1074#1074#1077#1076#1077#1085#1085#1086#1081' '#1076#1072#1090#1077' '#1089#1087#1088#1072#1074#1082#1072' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '#1085#1072#1095#1072#1083#1072' ' +
              #1075#1086#1076#1072' '#1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object dbeSpovTabN: TDBEdit
            Left = 197
            Top = 77
            Width = 62
            Height = 21
            DataField = 'TabN'
            DataSource = dsrcShap
            TabOrder = 0
            OnEnter = dbeEnter
            OnExit = dbeTabNExit
          end
          object dbeSpovFam: TDBEdit
            Left = 99
            Top = 105
            Width = 160
            Height = 21
            Hint = #1060#1072#1084#1080#1083#1080#1102' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1084#1086#1078#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077
            DataField = 'Fam'
            DataSource = dsrcShap
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeSpovTin: TDBEdit
            Left = 164
            Top = 131
            Width = 95
            Height = 21
            DataField = 'TIN'
            DataSource = dsrcShap
            TabOrder = 2
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dtPicDtDoc: TDateTimePicker
            Left = 196
            Top = 180
            Width = 85
            Height = 21
            Hint = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Date = 38771.000000000000000000
            Time = 38771.000000000000000000
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object dtPicSpovDtEnd: TDateTimePicker
            Left = 196
            Top = 11
            Width = 85
            Height = 21
            Date = 38771.000000000000000000
            Time = 38771.000000000000000000
            TabOrder = 4
            OnEnter = dtPicEnter
            OnExit = dtPicExit
          end
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      object PanelButtons2: TPanel
        Left = 0
        Top = 338
        Width = 668
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          668
          29)
        object sBtnBack: TSpeedButton
          Left = 531
          Top = 4
          Width = 65
          Height = 25
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
          Spacing = 1
          OnClick = sBtnBackClick
        end
        object Label29: TLabel
          Left = 1
          Top = 1
          Width = 223
          Height = 28
          AutoSize = False
          Caption = 
            #1055#1088#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1080' '#1094#1080#1092#1088' '#1074' "'#1084#1077#1089#1103#1095#1085#1099#1093'" '#1079#1072#1087#1080#1089#1103#1093' '#1080#1090#1086#1075#1086#1074#1080' '#1087#1088#1072#1074#1103#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090 +
            #1080#1095#1077#1089#1082#1080'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object bBtnPrt: TBitBtn
          Left = 459
          Top = 4
          Width = 65
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 0
          OnClick = bBtnPrtClick
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
          Spacing = 1
        end
        object bBtnExit2: TBitBtn
          Left = 603
          Top = 4
          Width = 65
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          Kind = bkClose
          Spacing = 1
        end
        object grBoxInv: TGroupBox
          Left = 258
          Top = -2
          Width = 167
          Height = 31
          Hint = #1042#1099#1073#1086#1088' '#1083#1080#1089#1090#1072' '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
          Anchors = [akTop, akRight]
          Caption = '  '#1044#1074#1072' '#1083#1080#1089#1090#1072' !  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          object rBtnInv: TRadioButton
            Left = 89
            Top = 11
            Width = 65
            Height = 17
            Hint = #1055#1077#1095#1072#1090#1100' "'#1080#1085#1074#1072#1083#1080#1076#1085#1086#1081'" '#1095#1072#1089#1090#1080
            Alignment = taLeftJustify
            Caption = #1048#1085#1074#1072#1083#1080#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = rBtnInvClick
          end
          object rBtnNeInv: TRadioButton
            Left = 13
            Top = 11
            Width = 59
            Height = 17
            Hint = #1055#1077#1095#1072#1090#1100' "'#1086#1073#1097#1077#1081'" '#1095#1072#1089#1090#1080
            Alignment = taLeftJustify
            Caption = #1054#1073#1097#1072#1103
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = True
            OnClick = rBtnInvClick
          end
        end
      end
      object PanelMain2: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 338
        Align = alClient
        TabOrder = 1
        DesignSize = (
          668
          338)
        object Label2: TLabel
          Left = 24
          Top = 6
          Width = 35
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1048#1076'.'#1082#1086#1076
          FocusControl = dbeTIN
        end
        object Label3: TLabel
          Left = 172
          Top = 6
          Width = 49
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1060#1072#1084#1080#1083#1080#1103
          FocusControl = dbeFam
        end
        object Label4: TLabel
          Left = 358
          Top = 6
          Width = 22
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1048#1084#1103
          FocusControl = dbeIma
        end
        object Label5: TLabel
          Left = 490
          Top = 6
          Width = 47
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          FocusControl = dbeOtch
        end
        object Label7: TLabel
          Left = 424
          Top = 33
          Width = 59
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1050#1086#1076' '#1087#1077#1088'i'#1086#1076#1091
          FocusControl = dbeKdPer
        end
        object Label15: TLabel
          Left = 424
          Top = 57
          Width = 56
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1058#1080#1087' '#1092#1086#1088#1084#1080
          FocusControl = dbeTipFormu
        end
        object Label17: TLabel
          Left = 424
          Top = 81
          Width = 159
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1058#1088#1091#1076#1086#1074#1072' '#1082#1085#1080#1078#1082#1072' '#1091' '#1088#1086#1073#1086#1090#1086#1076#1072#1074#1094#1103
          FocusControl = dbeKdPlace
        end
        object Label19: TLabel
          Left = 424
          Top = 105
          Width = 57
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1058#1080#1087' '#1089#1090#1072#1074#1082#1080
          FocusControl = dbeKdZboru
        end
        object Label21: TLabel
          Left = 424
          Top = 129
          Width = 115
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1074'i'#1076#1085#1086#1089#1080#1085
          FocusControl = dbeDtBegVidn
        end
        object Label22: TLabel
          Left = 424
          Top = 153
          Width = 131
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1090#1072' '#1079#1072#1082'i'#1085#1095#1077#1085#1085#1103' '#1074'i'#1076#1085#1086#1089#1080#1085
          FocusControl = dbeDtEndVidn
        end
        object Label23: TLabel
          Left = 424
          Top = 177
          Width = 89
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1090#1072' '#1079#1072#1087#1086#1074#1085#1077#1085#1085#1103
          FocusControl = dbeDtDoc
        end
        object Label8: TLabel
          Left = 447
          Top = 201
          Width = 124
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1089#1090#1072#1078': '#1084'i'#1089#1103#1094'i'#1074
          FocusControl = dbeZgStagMes
        end
        object Label16: TLabel
          Left = 614
          Top = 201
          Width = 20
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1076#1085'i'#1074
          FocusControl = dbeZgStagDn
        end
        object dbgrSpov: TDBGrid
          Left = 0
          Top = 32
          Width = 413
          Height = 297
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsrcSpov
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrSpovDrawColumnCell
          OnEnter = dbgrSpovEnter
          OnExit = dbgrSpovExit
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RusMes'
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SmNachisl'
              Width = 54
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SmForPF'
              Width = 54
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SmBln'
              Width = 41
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SmToPF'
              Width = 47
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SmToPfPrp'
              Width = 54
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Stag'
              Width = 32
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'CntDayInMes'
              ReadOnly = True
              Width = 33
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'StagPPS'
              Width = 34
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'DtBegStag'
              Width = 60
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'DtEndStag'
              Width = 60
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'DtBegStagPps'
              Width = 60
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'DtEndStagPps'
              Width = 60
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'Pps'
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'Inv'
              Visible = True
            end
            item
              Color = clCream
              Expanded = False
              FieldName = 'Stag1pps'
              Visible = True
            end>
        end
        object dbeTIN: TDBEdit
          Left = 65
          Top = 3
          Width = 97
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'TIN'
          DataSource = dsrcShap
          TabOrder = 1
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeFam: TDBEdit
          Left = 228
          Top = 3
          Width = 122
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'Fam'
          DataSource = dsrcShap
          TabOrder = 2
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeIma: TDBEdit
          Left = 385
          Top = 3
          Width = 97
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'Ima'
          DataSource = dsrcShap
          TabOrder = 3
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeOtch: TDBEdit
          Left = 538
          Top = 3
          Width = 122
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'Otch'
          DataSource = dsrcShap
          TabOrder = 4
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeKdPer: TDBEdit
          Left = 487
          Top = 30
          Width = 25
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'KdPeriod'
          DataSource = dsrcShap
          TabOrder = 5
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeShPer: TDBEdit
          Left = 507
          Top = 30
          Width = 153
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          DataField = 'ShPeriodu'
          DataSource = dsrcShap
          ReadOnly = True
          TabOrder = 6
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeTipFormu: TDBEdit
          Left = 487
          Top = 54
          Width = 25
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'TipFormu'
          DataSource = dsrcShap
          TabOrder = 7
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeShFormu: TDBEdit
          Left = 507
          Top = 54
          Width = 153
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          DataField = 'ShFormu'
          DataSource = dsrcShap
          ReadOnly = True
          TabOrder = 8
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeKdPlace: TDBEdit
          Left = 598
          Top = 78
          Width = 25
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'KdPlace'
          DataSource = dsrcShap
          TabOrder = 9
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeShPlace: TDBEdit
          Left = 619
          Top = 78
          Width = 41
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          DataField = 'ShPlace'
          DataSource = dsrcShap
          ReadOnly = True
          TabOrder = 10
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeKdZboru: TDBEdit
          Left = 487
          Top = 102
          Width = 25
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'KdZboru'
          DataSource = dsrcShap
          TabOrder = 11
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeShZboru: TDBEdit
          Left = 507
          Top = 102
          Width = 153
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          DataField = 'ShZboru'
          DataSource = dsrcShap
          ReadOnly = True
          TabOrder = 12
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeDtBegVidn: TDBEdit
          Left = 575
          Top = 126
          Width = 85
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'DtBegVidn'
          DataSource = dsrcShap
          TabOrder = 13
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeDtEndVidn: TDBEdit
          Left = 575
          Top = 150
          Width = 85
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'dtEndVidn'
          DataSource = dsrcShap
          TabOrder = 14
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeDtDoc: TDBEdit
          Left = 575
          Top = 174
          Width = 85
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'DtDoc'
          DataSource = dsrcShap
          TabOrder = 15
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeZgStagMes: TDBEdit
          Left = 580
          Top = 198
          Width = 26
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'ZgStagMes'
          DataSource = dsrcShap
          TabOrder = 16
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeZgStagDn: TDBEdit
          Left = 635
          Top = 198
          Width = 25
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'ZgStagDn'
          DataSource = dsrcShap
          TabOrder = 17
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object grBoxPPS: TGroupBox
          Left = 422
          Top = 218
          Width = 238
          Height = 105
          Anchors = [akTop, akRight]
          Caption = ' '#1057#1087#1077#1094#1057#1090#1072#1078' '
          TabOrder = 18
          object Label6: TLabel
            Left = 5
            Top = 15
            Width = 65
            Height = 13
            Caption = #1050#1086#1076' '#1087'i'#1076#1089#1090#1072#1074#1080
            FocusControl = dbeKdPidstavu
          end
          object Label18: TLabel
            Left = 142
            Top = 15
            Width = 61
            Height = 13
            Caption = #1052'i'#1089'.'#1079#1072#1074#1077#1088#1096'.'
            FocusControl = dbeMisZaversh
          end
          object Label20: TLabel
            Left = 7
            Top = 36
            Width = 80
            Height = 13
            Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084'i'#1088#1091
            FocusControl = dbeEdIzm
          end
          object Label24: TLabel
            Left = 7
            Top = 59
            Width = 107
            Height = 13
            Caption = #1057#1087#1077#1094'i'#1072#1083#1100#1085'.'#1089#1090#1072#1078':  '#1084'i'#1089'.'
            FocusControl = dbeSpStagMis
          end
          object Label25: TLabel
            Left = 169
            Top = 59
            Width = 20
            Height = 13
            Caption = #1076#1085'i'#1074
            FocusControl = dbeSpStagDn
          end
          object Label26: TLabel
            Left = 7
            Top = 81
            Width = 91
            Height = 13
            Caption = #1053#1086#1088#1084#1072' '#1090#1088#1080#1074#1072#1083#1086#1089#1090'i'
            FocusControl = dbeNormaTriv
          end
          object dbeKdPidstavu: TDBEdit
            Left = 76
            Top = 12
            Width = 62
            Height = 21
            DataField = 'KdPidstavu'
            DataSource = dsrcShap
            TabOrder = 0
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeMisZaversh: TDBEdit
            Left = 204
            Top = 12
            Width = 26
            Height = 21
            DataField = 'MisZaversh'
            DataSource = dsrcShap
            TabOrder = 1
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeEdIzm: TDBEdit
            Left = 96
            Top = 34
            Width = 26
            Height = 21
            DataField = 'EdIzm'
            DataSource = dsrcShap
            TabOrder = 2
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeSpStagMis: TDBEdit
            Left = 129
            Top = 56
            Width = 26
            Height = 21
            DataField = 'SpStagMis'
            DataSource = dsrcShap
            TabOrder = 4
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeSpStagDn: TDBEdit
            Left = 204
            Top = 56
            Width = 26
            Height = 21
            DataField = 'SpStagDn'
            DataSource = dsrcShap
            TabOrder = 5
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeNormaTriv: TDBEdit
            Left = 176
            Top = 78
            Width = 54
            Height = 21
            DataField = 'NormaTrival'
            DataSource = dsrcShap
            TabOrder = 6
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeShEdIzm: TDBEdit
            Left = 122
            Top = 34
            Width = 108
            Height = 21
            DataField = 'ShEdIzm'
            DataSource = dsrcShap
            TabOrder = 3
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
        end
        object dbeRobotProc: TDBEdit
          Left = 197
          Top = 274
          Width = 78
          Height = 21
          DataField = 'RobotProc'
          DataSource = dsrcShap
          TabOrder = 19
          Visible = False
        end
        object dbeRobotSm: TDBEdit
          Left = 197
          Top = 294
          Width = 78
          Height = 21
          DataField = 'RobotSm'
          DataSource = dsrcShap
          TabOrder = 20
          Visible = False
        end
      end
    end
  end
  object cdsShap: TClientDataSet
    Aggregates = <>
    FileName = 'c:\Temp\cdsspov.cds'
    FieldDefs = <
      item
        Name = 'ZaGod'
        DataType = ftSmallint
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'TIN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SpovDtEnd'
        DataType = ftDate
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KdPeriod'
        DataType = ftSmallint
      end
      item
        Name = 'ShPeriodu'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TipFormu'
        DataType = ftSmallint
      end
      item
        Name = 'ShFormu'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'KdPlace'
        DataType = ftSmallint
      end
      item
        Name = 'ShPlace'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KdZboru'
        DataType = ftSmallint
      end
      item
        Name = 'ShZboru'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DtBegVidn'
        DataType = ftDate
      end
      item
        Name = 'dtEndVidn'
        DataType = ftDate
      end
      item
        Name = 'DtDoc'
        DataType = ftDate
      end
      item
        Name = 'RobotProc'
        DataType = ftFloat
      end
      item
        Name = 'RobotSm'
        DataType = ftFloat
      end
      item
        Name = 'ZgStagMes'
        DataType = ftSmallint
      end
      item
        Name = 'ZgStagDn'
        DataType = ftSmallint
      end
      item
        Name = 'KdPidstavu'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MisZaversh'
        DataType = ftSmallint
      end
      item
        Name = 'EdIzm'
        DataType = ftSmallint
      end
      item
        Name = 'SpStagMis'
        DataType = ftSmallint
      end
      item
        Name = 'SpStagDn'
        DataType = ftSmallint
      end
      item
        Name = 'NormaTrival'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ShEdIzm'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 88
    object cdsShapZaGod: TSmallintField
      FieldName = 'ZaGod'
    end
    object cdsShapSpovDtEnd: TDateField
      FieldName = 'SpovDtEnd'
    end
    object cdsShapDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cdsShapDtEnd: TDateField
      FieldName = 'DtEnd'
    end
    object cdsShapTabN: TIntegerField
      FieldName = 'TabN'
      OnSetText = cdsShapTabNSetText
    end
    object cdsShapFam: TStringField
      FieldName = 'Fam'
    end
    object cdsShapFamIO: TStringField
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsShapTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object cdsShapIma: TStringField
      FieldName = 'Ima'
      Size = 15
    end
    object cdsShapOtch: TStringField
      FieldName = 'Otch'
    end
    object cdsShapKdPeriod: TSmallintField
      FieldName = 'KdPeriod'
      OnValidate = cdsShapKdPeriodValidate
    end
    object cdsShapShPeriodu: TStringField
      FieldName = 'ShPeriodu'
    end
    object cdsShapTipFormu: TSmallintField
      FieldName = 'TipFormu'
      OnValidate = cdsShapTipFormuValidate
    end
    object cdsShapShFormu: TStringField
      FieldName = 'ShFormu'
      Size = 25
    end
    object cdsShapKdPlace: TSmallintField
      FieldName = 'KdPlace'
      OnValidate = cdsShapKdPlaceValidate
    end
    object cdsShapShPlace: TStringField
      FieldName = 'ShPlace'
    end
    object cdsShapKdZboru: TSmallintField
      FieldName = 'KdZboru'
      OnValidate = cdsShapKdZboruValidate
    end
    object cdsShapShZboru: TStringField
      FieldName = 'ShZboru'
      Size = 25
    end
    object cdsShapDtBegVidn: TDateField
      FieldName = 'DtBegVidn'
    end
    object cdsShapdtEndVidn: TDateField
      FieldName = 'dtEndVidn'
    end
    object cdsShapDtDoc: TDateField
      FieldName = 'DtDoc'
    end
    object cdsShapRobotProc: TFloatField
      FieldName = 'RobotProc'
    end
    object cdsShapRobotSm: TFloatField
      FieldName = 'RobotSm'
    end
    object cdsShapZgStagMes: TSmallintField
      FieldName = 'ZgStagMes'
    end
    object cdsShapZgStagDn: TSmallintField
      FieldName = 'ZgStagDn'
    end
    object cdsShapKdPidstavu: TStringField
      FieldName = 'KdPidstavu'
      OnValidate = cdsShapKdPidstavuValidate
      Size = 10
    end
    object cdsShapMisZaversh: TSmallintField
      FieldName = 'MisZaversh'
    end
    object cdsShapEdIzm: TSmallintField
      FieldName = 'EdIzm'
      OnValidate = cdsShapEdIzmValidate
    end
    object cdsShapShEdIzm: TStringField
      FieldName = 'ShEdIzm'
    end
    object cdsShapSpStagMis: TSmallintField
      FieldName = 'SpStagMis'
    end
    object cdsShapSpStagDn: TSmallintField
      FieldName = 'SpStagDn'
    end
    object cdsShapNormaTrival: TStringField
      FieldName = 'NormaTrival'
      Size = 10
    end
  end
  object dsrcShap: TDataSource
    DataSet = cdsShap
    Left = 32
    Top = 104
  end
  object dsrcSpov: TDataSource
    DataSet = cdsSpov
    Left = 88
    Top = 104
  end
  object qryTmp: TQuery
    Left = 16
    Top = 144
  end
  object cdsSpov: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SmNachisl'
        DataType = ftFloat
      end
      item
        Name = 'SmForPF'
        DataType = ftFloat
      end
      item
        Name = 'SmBln'
        DataType = ftFloat
      end
      item
        Name = 'SmToPF'
        DataType = ftFloat
      end
      item
        Name = 'SmToPfPrp'
        DataType = ftFloat
      end
      item
        Name = 'DtBegStag'
        DataType = ftDate
      end
      item
        Name = 'DtEndStag'
        DataType = ftDate
      end
      item
        Name = 'Stag'
        DataType = ftSmallint
      end
      item
        Name = 'IsPPS'
        DataType = ftBoolean
      end
      item
        Name = 'DtBegStagPps'
        DataType = ftDate
      end
      item
        Name = 'DtEndStagPps'
        DataType = ftDate
      end
      item
        Name = 'Stag1pps'
        DataType = ftSmallint
      end
      item
        Name = 'StagPPS'
        DataType = ftSmallint
      end
      item
        Name = 'CntDayInMes'
        DataType = ftSmallint
      end
      item
        Name = 'Inv'
        DataType = ftSmallint
      end
      item
        Name = 'IsInv'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'OnNR'
        Fields = 'NR'
      end>
    IndexName = 'OnNR'
    Params = <>
    StoreDefs = True
    AfterPost = cdsSpovAfterPost
    OnCalcFields = cdsSpovCalcFields
    OnNewRecord = cdsSpovNewRecord
    Left = 72
    Top = 88
    object cdsSpovNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsSpovZaMesGod: TDateField
      DisplayLabel = #1047#1072#1052#1077#1089#1103#1094
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yy'
    end
    object cdsSpovRusMes: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094
      FieldKind = fkCalculated
      FieldName = 'RusMes'
      Size = 12
      Calculated = True
    end
    object cdsSpovSmNachisl: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'SmNachisl'
      DisplayFormat = '0.00'
    end
    object cdsSpovSmForPF: TFloatField
      DisplayLabel = #1044#1083#1103#1055#1077#1085#1089#1080#1080
      FieldName = 'SmForPF'
      DisplayFormat = '0.00'
    end
    object cdsSpovSmBln: TFloatField
      DisplayLabel = #1041#1086#1083#1085#1080#1095#1085#1099#1077
      FieldName = 'SmBln'
      DisplayFormat = '0.00'
    end
    object cdsSpovSmToPF: TFloatField
      DisplayLabel = #1042#1079#1085#1086#1089' '#1074' '#1055#1060
      FieldName = 'SmToPF'
      DisplayFormat = '0.00'
    end
    object cdsSpovSmToPfPrp: TFloatField
      DisplayLabel = #1074' '#1055#1060' '#1089' '#1087#1088#1087
      FieldName = 'SmToPfPrp'
      DisplayFormat = '0.00'
    end
    object cdsSpovDtBegStag: TDateField
      FieldName = 'DtBegStag'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsSpovDtEndStag: TDateField
      FieldName = 'DtEndStag'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsSpovStag: TSmallintField
      DisplayLabel = #1057#1090#1072#1078
      FieldName = 'Stag'
    end
    object cdsSpovIsInv: TBooleanField
      FieldName = 'IsInv'
    end
    object cdsSpovInv: TSmallintField
      FieldName = 'Inv'
    end
    object cdsSpovIsPPS: TBooleanField
      FieldName = 'IsPPS'
    end
    object cdsSpovPps: TStringField
      FieldKind = fkCalculated
      FieldName = 'Pps'
      Size = 1
      Calculated = True
    end
    object cdsSpovDtBegStagPps: TDateField
      FieldName = 'DtBegStagPps'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsSpovDtEndStagPps: TDateField
      FieldName = 'DtEndStagPps'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsSpovStag1pps: TSmallintField
      FieldName = 'Stag1pps'
    end
    object cdsSpovStagPPS: TSmallintField
      DisplayLabel = #1057#1090#1072#1078#1055#1055#1057
      FieldName = 'StagPPS'
    end
    object cdsSpovCntDayInMes: TSmallintField
      DisplayLabel = #1044#1085#1077#1081#1042#1052#1077#1089#1103#1094#1077
      FieldName = 'CntDayInMes'
    end
  end
  object qryDop: TQuery
    Left = 140
    Top = 91
  end
  object tblPorogi: TTable
    DatabaseName = 'c:\Temp'
    FieldDefs = <
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SmPoroga'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'Porogi'
    Left = 188
    Top = 99
  end
end
