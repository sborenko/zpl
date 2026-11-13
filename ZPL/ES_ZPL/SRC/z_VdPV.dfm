object FormVdPV: TFormVdPV
  Left = 0
  Top = 80
  Width = 764
  Height = 560
  HelpContext = 2145
  BorderIcons = []
  Caption = 'FormVdPV'
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 650
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 756
    Height = 533
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnResize = PageControlResize
    object ts1: TTabSheet
      Caption = 'ts1'
      object Splitter1: TSplitter
        Left = 213
        Top = 31
        Width = 4
        Height = 471
        Beveled = True
      end
      object dbgrVdPV: TDBGrid
        Left = 0
        Top = 31
        Width = 213
        Height = 471
        Hint = 
          #1055#1072#1082#1077#1090#1099' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1084#1077#1078#1074#1099#1087#1083#1072#1090'|'#1055#1072#1082#1077#1090#1099' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1080' '#1074#1077#1076#1086 +
          #1084#1086#1089#1090#1080' '#1084#1077#1078#1074#1099#1087#1083#1072#1090' ('#1084#1072#1083#1080#1085#1086#1074#1099#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1080' '#1085#1077#1076#1086#1089#1090#1091#1087#1085#1099#1077' '#1076 +
          #1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103')'
        Align = alLeft
        Color = clInfoBk
        DataSource = dsrcVdPv
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = popVdPv
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrVdPVDrawColumnCell
        OnEnter = dbGridlEnter
        OnExit = dbGridlExit
        Columns = <
          item
            Expanded = False
            FieldName = 'MyPole'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PlusNrVdPV'
            Title.Caption = #1055#1082#1090#1053#1088
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmUsr'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VDVUPLNR'
            Title.Caption = #1042#1077#1076#1042#1099#1087#1083#1053#1088
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVDPV'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 4
            Visible = True
          end>
      end
      object PanelTop1: TPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          748
          31)
        object sBtnNewVed: TSpeedButton
          Left = 3
          Top = 3
          Width = 99
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' ('#1087#1091#1089#1090#1086#1081') '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
          Caption = #1053#1086#1074#1099#1081' '#1087#1091#1089#1090#1086#1081
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = popVdPvAddPaketClick
        end
        object sBtnNewWithHelp: TSpeedButton
          Left = 103
          Top = 3
          Width = 139
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090' '#1083#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1089' '#1074#1099#1079#1086#1074#1086#1084' '#1087#1086#1084#1086#1096#1085#1080#1082#1072
          Caption = #1053#1086#1074#1099#1081' '#1089' '#1087#1086#1084#1086#1096#1085#1080#1082#1086#1084
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = popVdPvAddPaketWithWizClick
        end
        object sBtnEditing: TSpeedButton
          Left = 401
          Top = 3
          Width = 141
          Height = 25
          Hint = 
            #1042#1082#1083#1102#1095#1080#1090#1100' '#1088#1077#1078#1080#1084' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1077#1081' '#1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085 +
            #1085#1086' '#1074' '#1090#1072#1073#1083#1080#1094#1077
          AllowAllUp = True
          GroupIndex = 7
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1077
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnEditingClick
        end
        object sBtnGoSchet: TSpeedButton
          Left = 243
          Top = 3
          Width = 147
          Height = 25
          Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1088#1072#1089#1095#1077#1090' '#1087#1086' '#1079#1072#1087#1080#1089#1103#1084' '#1087#1072#1082#1077#1090#1072' '#1080' '#1074#1099#1076#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1089#1089#1099
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1077#1078#1074#1099#1087#1083#1072#1090
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = popGoSchetClick
        end
        object bBtnCancel: TBitBtn
          Left = 671
          Top = 3
          Width = 75
          Height = 25
          Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object LbxFilter: TListBox
        Left = 37
        Top = 217
        Width = 76
        Height = 64
        Color = clAqua
        ItemHeight = 13
        Items.Strings = (
          '1400-1500'
          '1600-1700')
        TabOrder = 2
        Visible = False
      end
      object PanelTs1Right: TPanel
        Left = 217
        Top = 31
        Width = 531
        Height = 471
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanelTs1Right'
        TabOrder = 3
        object dbgrOtkl: TDBGrid
          Left = 0
          Top = 17
          Width = 531
          Height = 454
          Hint = #1047#1072#1087#1080#1089#1080' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
          Align = alClient
          Color = clInfoBk
          DataSource = dsrcOtkl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          OnDrawColumnCell = dbgrOtklDrawColumnCell
          OnDblClick = dbgrOtklEditButtonClick
          OnEditButtonClick = dbgrOtklEditButtonClick
          OnEnter = dbGridlEnter
          OnExit = dbGridlExit
          OnKeyDown = dbgrOtklKeyDown
          Columns = <
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'TABN'
              Width = 44
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'FamIO'
              Width = 41
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'VIDN'
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ShVidN'
              ReadOnly = True
              Width = 52
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ZAMESGOD'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRVDPV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Width = 17
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDTEMU'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMTEMU'
              Width = 88
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'SCHBU'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDOBJ'
              Title.Caption = #1050#1076#1055#1076#1088
              Width = 27
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ShObj'
              Width = 41
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ShKatP'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 52
              Visible = True
            end>
        end
        object PanelSortInf: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 17
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'PanelSortInf'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object PanelWait: TPanel
          Left = 24
          Top = 184
          Width = 185
          Height = 41
          Caption = #1046#1076#1080#1090#1077'... '#1048#1076#1077#1090' '#1088#1072#1089#1095#1077#1090' !'
          Color = clGradientActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object Edit1: TEdit
          Left = 32
          Top = 312
          Width = 425
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Text = 
            #1054#1090#1089#1102#1076#1072' '#1084#1086#1078#1085#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1085#1086#1074#1086#1075#1086' '#1087#1072#1082#1077#1090#1072' '#1086#1090#1082#1083'., '#1087#1086#1082#1072' '#1085#1077' '#1087 +
            #1086#1076#1082#1083#1102#1095#1077#1085#1099
          Visible = False
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object LabelTblOtklSortInf: TLabel
        Left = 0
        Top = 31
        Width = 91
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelTblOtklSortInf'
      end
      object dbgr_Otkl: TDBGrid
        Left = 0
        Top = 44
        Width = 748
        Height = 458
        Align = alClient
        Color = clInfoBk
        DataSource = dsrc_Otkl
        PopupMenu = popTbl_Otkl
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgr_OtklDrawColumnCell
        OnEditButtonClick = dbgr_OtklEditButtonClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAMIO'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MyZaMesGod'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 30
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'SPZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdTemu'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmTemu'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShObj'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShKatP'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 51
            Visible = True
          end>
      end
      object PanelTop2: TPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          748
          31)
        object sBtnGoBack: TSpeedButton
          Left = 671
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1089#1090#1088#1072#1085#1080#1094#1091' '#1074#1074#1086#1076#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
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
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnGoBackClick
        end
        object sBtnVbSotr: TSpeedButton
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1074#1077#1089#1090#1080' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1089#1087#1080#1089#1082#1091' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          Caption = #1057#1087#1080#1089#1086#1082
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnVbSotrClick
        end
        object sBtnAddToOtkl: TSpeedButton
          Left = 81
          Top = 3
          Width = 100
          Height = 25
          Hint = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1087#1072#1082#1077#1090' '#1082' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnAddToOtklClick
        end
      end
      object LbxObj: TListBox
        Left = 16
        Top = 256
        Width = 81
        Height = 97
        ItemHeight = 13
        TabOrder = 2
        Visible = False
      end
      object LbxTabN: TListBox
        Left = 104
        Top = 256
        Width = 81
        Height = 97
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
      object Edit2: TEdit
        Left = 56
        Top = 376
        Width = 593
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Text = 
          #1042#1074#1086#1076' '#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' '#1074#1088#1077#1084#1077#1085#1085#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' tbl_Otkl '#1076#1083#1103' '#1087#1072#1082 +
          #1077#1090#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' ('#1087#1088#1080' '#1074#1074#1086#1076#1077' '#1089' '#1087#1086#1084#1086#1096#1085#1080#1082#1086#1084')'
        Visible = False
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object dbgrVed: TDBGrid
        Left = 0
        Top = 31
        Width = 748
        Height = 471
        Align = alClient
        DataSource = dsrcVed
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrVedDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            ReadOnly = True
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            ReadOnly = True
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            ReadOnly = True
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNachTT'
            ReadOnly = True
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmUdrgTt'
            ReadOnly = True
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmVuplTt'
            ReadOnly = True
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNachVida'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmUdrgVida'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmVuplVida'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOper'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOstNaRuki'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPZ'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 46
            Visible = True
          end>
      end
      object PanelTop3: TPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 31
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          748
          31)
        object sBtnBack3: TSpeedButton
          Left = 523
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1089#1090#1088#1072#1085#1080#1094#1091
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
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnBack3Click
        end
        object sBtnPrt3: TSpeedButton
          Left = 445
          Top = 3
          Width = 75
          Height = 25
          Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1089#1089#1099
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1095#1072#1090#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
            8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
            8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
            8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          Visible = False
          OnClick = sBtnPrt3Click
        end
        object sBtnApply3: TSpeedButton
          Left = 4
          Top = 3
          Width = 97
          Height = 25
          Hint = 
            #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1082' '#1090#1072#1073#1083#1080#1094#1072#1084' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081'/'#1091#1076#1077#1088#1078#1072#1085#1080#1081', '#1086#1092#1086#1088#1084#1080#1090 +
            #1100' '#1082#1072#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1077#1078#1074#1099#1087#1083#1072#1090
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnApply3Click
        end
        object Label1: TLabel
          Left = 107
          Top = 2
          Width = 283
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1076#1082#1083#1102#1095#1072#1090#1100#1089#1103' '#1073#1091#1076#1091#1090' '#1089#1091#1084#1084#1099' '#1080#1079' '#1082#1086#1083#1086#1085#1082#1080' "'#1042' '#1074#1077#1076#1086#1084#1086#1089#1090#1100'".'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label2: TLabel
          Left = 107
          Top = 15
          Width = 357
          Height = 13
          Caption = 
            #1048#1093' '#1084#1086#1078#1085#1086' '#1087#1088#1072#1074#1080#1090#1100'. '#1055#1088#1080' '#1101#1090#1086#1084' '#1089#1083#1077#1076#1080#1090#1077' '#1079#1072' '#1082#1086#1083#1086#1085#1082#1086#1081' "'#1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1088#1091#1082#1080'"' +
            '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
      object Edit3: TEdit
        Left = 88
        Top = 328
        Width = 513
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = 
          #1042#1074#1086#1076' '#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' '#1074#1088#1077#1084#1077#1085#1085#1086#1081' '#1085#1072#1073#1086#1088#1072' cdsVed ('#1074#1077#1076#1086#1084#1086#1089#1090#1080 +
          ' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1087#1072#1082#1077#1090#1072' '#1086#1090#1082#1083'.)'
        Visible = False
      end
    end
    object ts4: TTabSheet
      Caption = 'ts4'
      ImageIndex = 3
      OnResize = ts4Resize
      DesignSize = (
        748
        502)
      object Bevel1: TBevel
        Left = 590
        Top = 0
        Width = 158
        Height = 31
        Anchors = [akTop, akRight]
      end
      object sBtnPrt4: TSpeedButton
        Left = 595
        Top = 4
        Width = 73
        Height = 25
        Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1089#1089#1099
        Anchors = [akTop, akRight]
        Caption = #1055#1077#1095#1072#1090#1100
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = sBtnPrt4Click
      end
      object sBtnBack4: TSpeedButton
        Left = 671
        Top = 4
        Width = 73
        Height = 25
        Hint = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1089#1090#1088#1072#1085#1080#1094#1091
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
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = sBtnBack4Click
      end
      object dbgrMegVed: TDBGrid
        Left = 0
        Top = 0
        Width = 584
        Height = 502
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clCream
        DataSource = dsrcMegVed
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrMegVedDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 77
            Visible = True
          end>
      end
      object PanelMegVedInf: TPanel
        Left = 595
        Top = 39
        Width = 151
        Height = 147
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 14
          Top = 14
          Width = 106
          Height = 13
          Caption = #1042#1089#1077#1075#1086' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object LabelSmTt: TLabel
          Left = 96
          Top = 30
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'LabelSmTt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 3
          Top = 53
          Width = 63
          Height = 13
          Caption = #1050#1077#1082#1074' 1111/1'
        end
        object Label7: TLabel
          Left = 3
          Top = 71
          Width = 63
          Height = 13
          Caption = #1050#1077#1082#1074' 1120/1'
        end
        object Label8: TLabel
          Left = 3
          Top = 89
          Width = 63
          Height = 13
          Caption = #1050#1077#1082#1074' 1111/6'
        end
        object Label9: TLabel
          Left = 3
          Top = 107
          Width = 63
          Height = 13
          Caption = #1050#1077#1082#1074' 1120/6'
        end
        object LabelSmBudg: TLabel
          Left = 81
          Top = 53
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'LabelSmBudg'
        end
        object LabelSmBlnBudg: TLabel
          Left = 66
          Top = 71
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'LabelSmBlnBudg'
        end
        object LabelSmSpec: TLabel
          Left = 81
          Top = 89
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'LabelSmSpec'
        end
        object LabelSmBlnSpec: TLabel
          Left = 66
          Top = 107
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'LabelSmBlnSpec'
        end
      end
      object Edit4: TEdit
        Left = 112
        Top = 336
        Width = 425
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = #1043#1086#1090#1086#1074#1072#1103' '#1084#1077#1078#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1087#1072#1082#1077#1090#1072' '#1087#1077#1088#1077#1076' '#1087#1077#1095#1072#1090#1100#1102
        Visible = False
      end
    end
    object ts5_MegVed: TTabSheet
      Caption = 'ts5_MegVed'
      ImageIndex = 4
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          748
          31)
        object sBtnBack5: TSpeedButton
          Left = 522
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1089#1090#1088#1072#1085#1080#1094#1091' '#1074#1074#1086#1076#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
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
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnBack5Click
        end
        object sBtnPrt5Mv: TSpeedButton
          Left = 441
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1099#1074#1086#1076' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
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
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnPrt5MvClick
        end
        object Label4: TLabel
          Left = 7
          Top = 9
          Width = 350
          Height = 13
          Caption = #1056#1072#1079#1088#1077#1096#1072#1077#1090#1089#1103' '#1074#1074#1086#1076#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074#1080#1076' 7509 ('#1056#1072#1089#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sBtnMsg5: TSpeedButton
          Left = 412
          Top = 3
          Width = 23
          Height = 25
          Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1091
          AllowAllUp = True
          Anchors = [akTop, akRight]
          GroupIndex = 9
          Down = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
            33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
            FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
            FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
            FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
            FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
            FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
            3333333773FFFF77333333333FBFBF3333333333377777333333}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnMsg5Click
        end
      end
      object dbgrOtklMV: TDBGrid
        Left = 0
        Top = 31
        Width = 559
        Height = 471
        Align = alClient
        DataSource = dsrcOtkl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrOtklMVDrawColumnCell
        OnEditButtonClick = dbgrOtklMVEditButtonClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MYSMM801'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clPurple
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MYSMM811'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            ReadOnly = True
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'SCHBU'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 32
            Visible = True
          end>
      end
      object Panel5_Right: TPanel
        Left = 559
        Top = 31
        Width = 189
        Height = 471
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel5_Right'
        TabOrder = 2
        object PanelMsgMegVed: TPanel
          Left = 3
          Top = 2
          Width = 191
          Height = 467
          BevelOuter = bvNone
          TabOrder = 0
          object Label6: TLabel
            Left = 5
            Top = 34
            Width = 178
            Height = 60
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1069#1090#1072' '#1092#1086#1088#1084#1072' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1072' '#1058#1054#1051#1068#1050#1054' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1085#1077#1073#1086#1083#1100#1096#1080#1093' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081' '#1052#1077 +
              #1078#1042#1099#1087#1083#1072#1090' '#1095#1077#1088#1077#1079' '#1082#1072#1089#1089#1091' ('#1074#1080#1076' 7509).'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object Label10: TLabel
            Left = 5
            Top = 87
            Width = 178
            Height = 103
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074#1080#1076#1072' '#1085#1077' '#1087#1088#1077#1076#1091#1089#1084#1086#1090#1088#1077#1085#1072'. '#1042#1074#1086#1076#1080#1084#1099#1077' '#1089#1091#1084#1084#1099' '#1074#1089#1077#1075 +
              #1076#1072' '#1087#1086#1085#1080#1084#1072#1102#1090#1089#1103' '#1082#1072#1082' '#1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1099#1077' ('#1076#1072#1078#1077' '#1077#1089#1083#1080' '#1086#1085#1080' '#1074#1074#1077#1076#1077#1085#1099' '#1087#1086#1083#1086#1078#1080#1090#1077#1083 +
              #1100#1085#1099#1084#1080') '#1080' '#1085#1077#1084#1077#1076#1083#1077#1085#1085#1086' '#1079#1072#1087#1080#1089#1099#1074#1072#1102#1090#1089#1103' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object Label11: TLabel
            Left = 13
            Top = 4
            Width = 161
            Height = 32
            Alignment = taCenter
            AutoSize = False
            Caption = #1042#1074#1086#1076' '#1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1086' '#1074' '#1090#1072#1073#1083#1080#1094#1091' !'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object Label12: TLabel
            Left = 5
            Top = 179
            Width = 178
            Height = 88
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1055#1088#1080' '#1074#1074#1086#1076#1077' '#1090#1072#1073#1077#1083#1100#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072' '#1074' '#1082#1086#1083#1086#1085#1082#1072#1093' "'#1057#1084'801..." '#1080' "'#1057#1084'811..." '#1074 +
              #1099#1089#1074#1077#1095#1080#1074#1072#1102#1090#1089#1103' '#1076#1083#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1089#1091#1084#1084#1099', '#1087#1088#1080#1093#1086#1076#1103#1097#1080#1077#1089#1103' '#1082' '#1074#1099#1087#1083#1072#1090#1077', '#1087#1086' '#1089#1095 +
              #1077#1090#1072#1084' 801 '#1080' 811, '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object Label13: TLabel
            Left = 5
            Top = 302
            Width = 178
            Height = 56
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1054#1089#1090#1072#1077#1090#1089#1103' '#1074#1074#1077#1089#1090#1080' '#1074' '#1082#1086#1083#1086#1085#1082#1091' "'#1057#1091#1084#1084#1072'" '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1074#1099#1087#1083#1072#1090#1099' '#1080' '#1074#1099#1073#1088#1072#1090#1100' '#1089#1091 +
              #1073#1089#1095#1077#1090', '#1080#1079' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1074#1099#1087#1083#1072#1095#1080#1074#1072#1077#1090#1089#1103' '#1101#1090#1072' '#1089#1091#1084#1084#1072'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object Label14: TLabel
            Left = 5
            Top = 356
            Width = 178
            Height = 97
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1045#1089#1083#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1074#1099#1079#1099#1074#1072#1077#1090#1089#1103' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103', '#1090#1086' '#1082#1086#1083#1086#1085#1082#1080' "'#1057#1084'801"' +
              ' '#1080' '#1057#1084'811" '#1074' '#1089#1090#1072#1088#1099#1093' '#1079#1072#1087#1080#1089#1103#1093' '#1086#1089#1090#1072#1102#1090#1089#1103' '#1087#1091#1089#1090#1099#1084#1080', '#1090'.'#1082'. '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1077' '#1080#1085#1092 +
              #1086#1088#1084#1072#1094#1080#1080' '#1076#1083#1103' '#1085#1080#1093' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1087#1088#1080' '#1042#1042#1054#1044#1045' '#1090#1072#1073#1077#1083#1100#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object Label15: TLabel
            Left = 5
            Top = 259
            Width = 178
            Height = 44
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1055#1088#1077#1076#1087#1086#1083#1072#1075#1072#1077#1090#1089#1103', '#1095#1090#1086' '#1074#1074#1086#1076#1080#1084#1099#1077' '#1090#1072#1073'. '#1085#1086#1084#1077#1088#1072' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086' '#1088#1072#1089#1089#1095#1080#1090#1072 +
              #1085#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
        end
      end
      object Edit5: TEdit
        Left = 48
        Top = 344
        Width = 529
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Text = 
          #1044#1083#1103' '#1074#1074#1086#1076#1072' '#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1074' qryOtkl '#1085#1077#1073#1086#1083#1100#1096#1080#1093' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081' '#1052#1077#1078#1042#1099#1087 +
          #1083#1072#1090' ('#1074#1080#1076#1072' 7509 - '#1056#1072#1089#1093'.'#1086#1088#1076#1077#1088#1072')'
        Visible = False
      end
    end
  end
  object qryVdPv: TQuery
    CachedUpdates = True
    AfterScroll = qryVdPvAfterScroll
    OnCalcFields = qryVdPvCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_VdPv')
    UpdateObject = updVdPv
    Left = 40
    Top = 160
    object qryVdPvNR: TIntegerField
      DisplayWidth = 5
      FieldName = 'NR'
      Origin = 'DbMain.Z_VDPV.NR'
    end
    object qryVdPvMyPole: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkCalculated
      FieldName = 'MyPole'
      Size = 10
      Calculated = True
    end
    object qryVdPvDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      DisplayWidth = 22
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VDPV.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryVdPvNRVDPV: TIntegerField
      DisplayLabel = #8470#1074#1076#1055#1042
      DisplayWidth = 12
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_VDPV.NRVDPV'
    end
    object qryVdPvDTVDPV: TDateTimeField
      DisplayLabel = #1042#1077#1076#1044#1090
      DisplayWidth = 22
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_VDPV.DTVDPV'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVdPvKDUSR: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDUSR'
      Origin = 'DbMain.Z_VDPV.KDUSR'
    end
    object qryVdPvMYNOTES: TStringField
      DisplayWidth = 78
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_VDPV.MYNOTES'
      Size = 65
    end
    object qryVdPvNmUsr: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'NmUsr'
      Calculated = True
    end
    object qryVdPvPlusNrVdPV: TIntegerField
      DisplayLabel = #1042#1077#1076#1053#1088
      FieldKind = fkCalculated
      FieldName = 'PlusNrVdPV'
      Calculated = True
    end
    object qryVdPvVDVUPLNR: TIntegerField
      FieldName = 'VDVUPLNR'
      Origin = 'DbMain.Z_VDPV.VDVUPLNR'
    end
  end
  object dsrcVdPv: TDataSource
    DataSet = qryVdPv
    OnDataChange = dsrcVdPvDataChange
    Left = 56
    Top = 176
  end
  object qryOtkl: TQuery
    CachedUpdates = True
    BeforePost = qryOtklBeforePost
    AfterPost = qryOtklAfterPost
    AfterDelete = qryOtklAfterDelete
    OnCalcFields = qryOtklCalcFields
    OnNewRecord = qryOtklNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, '
      ' Cast(0 as Numeric(18,2)) as MySmm801, '
      ' Cast(0 as Numeric(18,2)) as MySmm811, o.*  '
      'from ViOtklMain o '
      ' Left outer join z_upi u on u.TabN = o.Tabn'
      ' where (DtProc = '#39'06/01/2009'#39') and NrVdPv = -765'
      ' order by o.TabN, o.VidN, o.NR ')
    UpdateObject = updOtkl
    Left = 136
    Top = 184
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
    end
    object qryOtklFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Calculated = True
    end
    object qryOtklDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072'_'#1052#1043
      FieldName = 'ZAMESGOD'
      OnSetText = tbl_OtklZAMESGODSetText
      OnValidate = qryOtklZAMESGODValidate
      DisplayFormat = 'mm/yyyy'
    end
    object qryOtklDTSTORN: TDateTimeField
      FieldName = 'DTSTORN'
    end
    object qryOtklMyZaMesGod: TStringField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'MyZaMesGod'
      Size = 7
    end
    object qryOtklTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      OnSetText = qryOtklTABNSetText
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      OnSetText = qryOtklVIDNSetText
      OnValidate = qryOtklVIDNValidate
      FixedChar = True
      Size = 4
    end
    object qryOtklShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldName = 'ShVidN'
      Size = 15
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      OnSetText = DateFieldSetText
      OnValidate = qryOtklDT_BEGValidate
      EditMask = '!99/99/9999;1;_'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      OnSetText = DateFieldSetText
      OnValidate = qryOtklDT_ENDValidate
      EditMask = '!99/99/9999;1;_'
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object qryOtklMYSMM801: TBCDField
      DisplayLabel = #1057#1084'801 '#1074' '#1041#1044
      FieldName = 'MYSMM801'
      DisplayFormat = '#.##'
      Precision = 15
      Size = 2
    end
    object qryOtklMYSMM811: TBCDField
      DisplayLabel = #1057#1084'811 '#1074' '#1041#1044
      FieldName = 'MYSMM811'
      DisplayFormat = '#.##'
      Precision = 15
      Size = 2
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      OnSetText = qryOtklSUMMASetText
      DisplayFormat = '#.00'
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object qryOtklKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
    end
    object qryOtklNMTEMU: TStringField
      FieldName = 'NMTEMU'
      Size = 65
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryOtklSchBU: TStringField
      DisplayLabel = #1057#1095'.'#1041#1059
      FieldName = 'SCHBU'
      OnSetText = qryOtklSchBUSetText
      Size = 10
    end
    object qryOtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      OnValidate = qryOtklKDOBJValidate
    end
    object qryOtklShObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldName = 'ShObj'
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      OnValidate = qryOtklKDKATPValidate
    end
    object qryOtklShKatP: TStringField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'ShKatP'
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 254
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object qryOtklKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object qryOtklFAM: TStringField
      FieldName = 'FAM'
    end
    object qryOtklIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryOtklOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryOtklNDbe: TStringField
      FieldKind = fkLookup
      FieldName = 'NDbe'
      LookupDataSet = DmMain.qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'NDBE'
      KeyFields = 'VIDN'
      Size = 1
      Lookup = True
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 152
    Top = 200
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 168
    Top = 112
    object popHead: TMenuItem
      Caption = '== '#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103' =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16453
      Visible = False
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = False
      object popAddCmn: TMenuItem
        Caption = '- '#1086#1073#1097#1080#1077' '#1074#1080#1076#1099
        ShortCut = 16462
        OnClick = popAddCmnClick
      end
      object popAddOtp: TMenuItem
        Caption = '- '#1086#1090#1087#1091#1089#1082#1085#1099#1077
        ShortCut = 16463
        OnClick = popAddOtpClick
      end
      object popAddBln: TMenuItem
        Caption = '- '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077
        ShortCut = 16450
        OnClick = popAddBlnClick
      end
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16469
      Visible = False
      OnClick = popDelClick
    end
    object popSep1: TMenuItem
      Caption = '-'
    end
    object popTotals: TMenuItem
      Caption = #1048#1090#1086#1075#1080' '#1087#1086' '#1090#1072#1073#1083#1080#1094#1077
      object popTotalsByVidN: TMenuItem
        Caption = '-  '#1087#1086' '#1074#1080#1076#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        OnClick = popTotalsByVidNClick
      end
      object popTotalsBySpZ: TMenuItem
        Caption = '- '#1087#1086' '#1089#1095#1077#1090#1072#1084' '#1041#1091#1093#1059#1095#1077#1090#1072
        OnClick = popTotalsBySpZClick
      end
      object popTotalsByObj: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
        OnClick = popTotalsByObjClick
      end
      object popTotalsByKatP: TMenuItem
        Caption = '- '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        OnClick = popTotalsByKatPClick
      end
    end
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080', '#1080#1084#1077#1085#1080', '#1086#1090#1095#1077#1089#1090#1074#1091
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' - '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.; '#1058#1072#1073#1053#1088'; '#1042#1080#1076#1053
        OnClick = popSortByFIOClick
      end
      object popSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' - '#1058#1072#1073#1053#1088'; '#1042#1080#1076#1053
        OnClick = popSortByTabNClick
      end
      object popSortByVidN: TMenuItem
        Caption = '- '#1087#1086' '#1074#1080#1076#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' - '#1042#1080#1076#1053'; '#1058#1072#1073#1053#1088
        OnClick = popSortByVidNClick
      end
      object popSortByNR: TMenuItem
        Caption = '- '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1074#1074#1086#1076#1072
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1085#1086' - '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1074#1074#1086#1076#1072' '#1074' '#1090#1072#1073#1083#1080#1094#1091
        OnClick = popSortByNRClick
      end
      object popSortBySumma: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1083#1102' "'#1057#1091#1084#1084#1072'"'
        OnClick = popSortBySummaClick
      end
    end
    object popGoSchet: TMenuItem
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      Hint = 
        #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082', '#1074#1099#1076#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1089#1089#1099' '#1085#1072' '#1088#1072#1089#1089#1095#1080#1090#1072#1085#1085#1099#1077' '#1089#1091 +
        #1084#1084#1099
      OnClick = popGoSchetClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popCopyFlds: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1082#1086#1087#1080#1088#1091#1077#1084#1099#1093' '#1087#1086#1083#1077#1081
      Hint = 
        #1047#1085#1072#1095#1077#1085#1080#1103' '#1082#1072#1082#1080#1093' '#1087#1086#1083#1077#1081' '#1073#1091#1076#1091#1090' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1074' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100 +
        ' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081
      Visible = False
      OnClick = popCopyFldsClick
    end
    object popFont: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1096#1088#1080#1092#1090#1072' '#1090#1072#1073#1083#1080#1094
      OnClick = popFontClick
    end
    object popFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      OnClick = popFonClick
    end
  end
  object qryTmp: TQuery
    Left = 240
    Top = 160
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
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
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'OtklNR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 376
    Top = 288
  end
  object cdsZaMG: TClientDataSet
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
        Name = 'MesGod'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'RusMG'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 160
    object cdsZaMGNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsZaMGZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm-yy'
    end
    object cdsZaMGMesGod: TStringField
      FieldName = 'MesGod'
      Size = 7
    end
    object cdsZaMGRusMG: TStringField
      FieldName = 'RusMG'
    end
  end
  object tbl_Otkl: TTable
    BeforePost = tbl_OtklBeforePost
    AfterPost = tbl_OtklAfterPost
    OnCalcFields = tbl_OtklCalcFields
    OnNewRecord = tbl_OtklNewRecord
    DatabaseName = 'Es_Ind'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'TABN'
        DataType = ftInteger
      end
      item
        Name = 'FAMIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'DTPROC'
        DataType = ftDateTime
      end
      item
        Name = 'ZAMESGOD'
        DataType = ftDateTime
      end
      item
        Name = 'VIDN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DT_BEG'
        DataType = ftDateTime
      end
      item
        Name = 'DT_END'
        DataType = ftDateTime
      end
      item
        Name = 'CHAS'
        DataType = ftFloat
      end
      item
        Name = 'SUMMA'
        DataType = ftFloat
      end
      item
        Name = 'PDN'
        DataType = ftSmallint
      end
      item
        Name = 'KDSPZ'
        DataType = ftSmallint
      end
      item
        Name = 'KDOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'KDKATP'
        DataType = ftSmallint
      end
      item
        Name = 'NOTES'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'AddedToOtkl'
        DataType = ftBoolean
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'NmTemu'
        DataType = ftString
        Size = 65
      end>
    StoreDefs = True
    TableName = 'x__Otkl.db'
    Left = 240
    Top = 296
    object tbl_OtklNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tbl_OtklTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      OnSetText = tbl_OtklTABNSetText
    end
    object tbl_OtklFAMIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FAMIO'
      Size = 35
    end
    object tbl_OtklDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
    end
    object tbl_OtklZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      OnSetText = tbl_OtklZAMESGODSetText
      OnValidate = tbl_OtklZAMESGODValidate
    end
    object tbl_OtklMyZaMesGod: TStringField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldKind = fkCalculated
      FieldName = 'MyZaMesGod'
      Size = 7
      Calculated = True
    end
    object tbl_OtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      OnSetText = tbl_OtklVIDNSetText
      Size = 4
    end
    object tbl_OtklShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object tbl_OtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      OnSetText = DateFieldSetText
      OnValidate = tbl_OtklDT_BEGValidate
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tbl_OtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      OnSetText = DateFieldSetText
      OnValidate = tbl_OtklDT_ENDValidate
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tbl_OtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object tbl_OtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object tbl_OtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object tbl_OtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object tbl_OtklSPZ: TStringField
      DisplayLabel = #1057#1095'.'#1041#1059
      FieldKind = fkCalculated
      FieldName = 'SPZ'
      Size = 10
      Calculated = True
    end
    object tbl_OtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object tbl_OtklShObj: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Calculated = True
    end
    object tbl_OtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object tbl_OtklShKatP: TStringField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldKind = fkCalculated
      FieldName = 'ShKatP'
      Calculated = True
    end
    object tbl_OtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      DisplayWidth = 35
      FieldName = 'NOTES'
      Size = 254
    end
    object tbl_OtklAddedToOtkl: TBooleanField
      FieldName = 'AddedToOtkl'
    end
    object tbl_OtklKdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object tbl_OtklNmTemu: TStringField
      DisplayLabel = #1058#1077#1084#1072
      FieldName = 'NmTemu'
      Size = 65
    end
  end
  object updOtkl: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Otkl'
      'set'
      '  NR = :NR,'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  DTSTORN = :DTSTORN,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  PDN = :PDN,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  SPEC_NR = :SPEC_NR,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  PBNK = :PBNK,'
      '  KDTEMU = :KDTEMU'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Otkl'
      
        '  (NR, KDSPS, DTPROC, ZAMESGOD, DTSTORN, TABN, VIDN, CHAS, SUMMA' +
        ', '
      'KDOBJ, '
      
        '   KDKATP, DT_BEG, DT_END, PDN, KDSPZ, NOTES, PRR, PRPV, KTO, PR' +
        'KR, '
      'SPEC_NR, '
      '   DTVDPV, NRVDPV, MYNOTES, SPECPS, PBNK, KDTEMU)'
      'values'
      
        '  (:NR, :KDSPS, :DTPROC, :ZAMESGOD, :DTSTORN, :TABN, :VIDN, :CHA' +
        'S, '
      ':SUMMA, '
      
        '   :KDOBJ, :KDKATP, :DT_BEG, :DT_END, :PDN, :KDSPZ, :NOTES, :PRR' +
        ', :PRPV, '
      
        '   :KTO, :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV, :MYNOTES, :SPECPS, :' +
        'PBNK, '
      '   :KDTEMU)')
    DeleteSQL.Strings = (
      'delete from Z_Otkl'
      'where'
      '  NR = :OLD_NR')
    Left = 168
    Top = 216
  end
  object dsrc_Otkl: TDataSource
    DataSet = tbl_Otkl
    Left = 256
    Top = 312
  end
  object popVdPv: TPopupMenu
    OnPopup = popVdPvPopup
    Left = 80
    Top = 112
    object popVdPvHead: TMenuItem
      Caption = '==    '#1055#1072#1082#1077#1090#1099'  '#1080'  '#1042#1077#1076#1086#1084#1086#1089#1090#1080'    =='
      Enabled = False
    end
    object popVdPvAddPaket: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1087#1091#1089#1090#1086#1081' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' ('#1087#1091#1089#1090#1086#1081') '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      OnClick = popVdPvAddPaketClick
    end
    object popVdPvAddPaketWithWiz: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1089' '#1087#1086#1084#1086#1096#1085#1080#1082#1086#1084
      Hint = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1087#1072#1082#1077#1090#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1089' '#1074#1099#1079#1086#1074#1086#1084' '#1087#1086#1084#1086#1096#1085#1080#1082#1072
      OnClick = popVdPvAddPaketWithWizClick
    end
    object popVdPvDelPaket: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      OnClick = popVdPvDelPaketClick
    end
    object popVdPvShwMegVed: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1077#1078#1074#1099#1087#1083#1072#1090
      Hint = 
        #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1077#1078#1074#1099#1087#1083#1072#1090', '#1089#1086#1079#1076#1072#1085#1085#1091#1102' '#1087#1086' '#1079#1072#1087#1080#1089#1103#1084' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1072#1082#1077 +
        #1090#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      OnClick = popVdPvShwMegVedClick
    end
    object popVdPvSep1: TMenuItem
      Caption = '-'
    end
    object popVdPvAddMegVed: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' "'#1087#1088#1103#1084#1091#1102'" '#1052#1077#1078'D'#1077#1076#1086#1084#1086#1089#1090#1100
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1077#1078#1074#1099#1087#1083#1072#1090' ('#1090#1086#1083#1100#1082#1086' '#1085#1072' '#1082#1072#1089#1089#1091')'
      OnClick = popVdPvAddMegVedClick
    end
    object popVdPvEdtMegVed: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' "'#1087#1088#1103#1084#1091#1102'" '#1052#1077#1078#1042#1077#1076#1086#1084#1086#1089#1090#1100
      OnClick = popVdPvEdtMegVedClick
    end
    object popVdPvDelMegVed: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' "'#1087#1088#1103#1084#1091#1102'" '#1052#1077#1078#1042#1077#1076#1086#1084#1086#1089#1090#1100
      OnClick = popVdPvDelMegVedClick
    end
    object popVdPvSep2: TMenuItem
      Caption = '-'
    end
    object popVdPvFont: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1096#1088#1080#1092#1090#1072' '#1090#1072#1073#1083#1080#1094
      OnClick = popFontClick
    end
    object popVdPvFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      OnClick = popFonClick
    end
  end
  object updVdPv: TUpdateSQL
    ModifySQL.Strings = (
      'update z_VdPv'
      'set'
      '  DTPROC = :DTPROC,'
      '  NRVDPV = :NRVDPV,'
      '  DTVDPV = :DTVDPV,'
      '  KDUSR = :KDUSR,'
      '  MYNOTES = :MYNOTES,'
      '  VDVUPLNR = :VDVUPLNR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_VdPv'
      '  (DTPROC, NRVDPV, DTVDPV, KDUSR, MYNOTES, VDVUPLNR)'
      'values'
      '  (:DTPROC, :NRVDPV, :DTVDPV, :KDUSR, :MYNOTES, :VDVUPLNR)')
    DeleteSQL.Strings = (
      'delete from z_VdPv'
      'where'
      '  NR = :OLD_NR')
    Left = 72
    Top = 192
  end
  object cdsVed: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
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
        Name = 'SmNachTT'
        DataType = ftFloat
      end
      item
        Name = 'SmUdrgTt'
        DataType = ftFloat
      end
      item
        Name = 'SmNachVida'
        DataType = ftFloat
      end
      item
        Name = 'SmUdrgVida'
        DataType = ftFloat
      end
      item
        Name = 'SmVuplVida'
        DataType = ftFloat
      end
      item
        Name = 'SmOper'
        DataType = ftFloat
      end
      item
        Name = 'SmOstNaRuki'
        DataType = ftFloat
      end
      item
        Name = 'PDN'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'SPZ'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'NrVdPV'
        DataType = ftInteger
      end
      item
        Name = 'dtVdPV'
        DataType = ftDate
      end
      item
        Name = 'SmVuplTt'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = cdsVedBeforePost
    Left = 365
    Top = 162
    object cdsVedNR: TAutoIncField
      DisplayLabel = #8470#1087'/'#1087
      FieldName = 'NR'
    end
    object cdsVedTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsVedFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 45
    end
    object cdsVedSmNachTT: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1042#1089#1077#1075#1086
      FieldName = 'SmNachTT'
      DisplayFormat = '#.00'
    end
    object cdsVedSmUdrgTt: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1042#1089#1077#1075#1086
      FieldName = 'SmUdrgTt'
      DisplayFormat = '#.00'
    end
    object cdsVedSmVuplTt: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1042#1089#1077#1075#1086
      FieldName = 'SmVuplTt'
      DisplayFormat = '#.00'
    end
    object cdsVedSmNachVida: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1042#1080#1076#1072
      FieldName = 'SmNachVida'
      DisplayFormat = '#.00'
    end
    object cdsVedSmUdrgVida: TFloatField
      DisplayLabel = #1059#1076#1088#1078#1042#1080#1076#1072
      FieldName = 'SmUdrgVida'
      DisplayFormat = '#.00'
    end
    object cdsVedSmVuplVida: TFloatField
      DisplayLabel = #1050' '#1074#1099#1087#1083#1072#1090#1077
      FieldName = 'SmVuplVida'
      DisplayFormat = '#.00'
    end
    object cdsVedSmOper: TFloatField
      DisplayLabel = #1042' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      FieldName = 'SmOper'
      DisplayFormat = '#.00'
    end
    object cdsVedSmOstNaRuki: TFloatField
      DisplayLabel = #1054#1089#1090'.'#1053#1072#1056#1091#1082#1080
      FieldName = 'SmOstNaRuki'
      DisplayFormat = '#.00'
    end
    object cdsVedPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object cdsVedKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsVedSPZ: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SPZ'
      Size = 10
    end
    object cdsVedKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsVedKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsVedNrVdPV: TIntegerField
      FieldName = 'NrVdPV'
    end
    object cdsVeddtVdPV: TDateField
      FieldName = 'dtVdPV'
    end
  end
  object dsrcVed: TDataSource
    DataSet = cdsVed
    Left = 384
    Top = 176
  end
  object popPrt: TPopupMenu
    Left = 576
    Top = 96
    object N3: TMenuItem
      Caption = '= =  '#1050' '#1072' '#1082'   '#1087' '#1077' '#1095' '#1072' '#1090' '#1072' '#1090' '#1100'  = ='
      Enabled = False
    end
    object popOneVed: TMenuItem
      Caption = '- '#1086#1076#1085#1086#1081' '#1086#1073#1097#1077#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
      Hint = 
        #1054#1090#1076#1077#1083#1100#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1074#1080#1076#1072' '#1089#1088#1077#1076#1089#1090#1074' ('#1089#1080#1085#1090#1077#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1095#1077 +
        #1090#1072')'
      OnClick = popOneVedClick
    end
    object popByObj: TMenuItem
      Caption = '- '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
      Hint = #1054#1090#1076#1077#1083#1100#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      object popByObjVed: TMenuItem
        Caption = '- '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        OnClick = popByObjVedClick
      end
      object popByObjRee: TMenuItem
        Caption = '- '#1088#1077#1077#1089#1090#1088' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
        OnClick = popByObjReeClick
      end
      object popByObjZvit: TMenuItem
        Caption = '- '#1082#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
        OnClick = popByObjZvitClick
      end
    end
  end
  object qryTmp2: TQuery
    Left = 245
    Top = 194
  end
  object cdsMegVed: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsMegVedCalcFields
    Left = 429
    Top = 162
    object cdsMegVedDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      DisplayWidth = 6
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object cdsMegVedZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      DisplayWidth = 6
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object cdsMegVedTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 8
      FieldName = 'TABN'
    end
    object cdsMegVedFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object cdsMegVedVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsMegVedSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 12
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsMegVedSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SUMMA'
      DisplayFormat = '#.##'
    end
    object cdsMegVedPDN: TSmallintField
      DisplayLabel = #1055#1053
      DisplayWidth = 4
      FieldName = 'PDN'
    end
    object cdsMegVedSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      DisplayWidth = 8
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsMegVedPSCH: TStringField
      DisplayLabel = #1057#1080#1085#1090#1057#1095
      DisplayWidth = 5
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsMegVedKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      DisplayWidth = 5
      FieldName = 'KDOBJ'
    end
    object cdsMegVedKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088
      DisplayWidth = 5
      FieldName = 'KDKATP'
    end
    object cdsMegVedKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      DisplayWidth = 12
      FieldName = 'KDSPS'
    end
    object cdsMegVedFAM: TStringField
      DisplayWidth = 24
      FieldName = 'FAM'
    end
    object cdsMegVedIMA: TStringField
      DisplayWidth = 18
      FieldName = 'IMA'
      Size = 15
    end
    object cdsMegVedOTCH: TStringField
      DisplayWidth = 24
      FieldName = 'OTCH'
    end
    object cdsMegVedNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
    end
    object cdsMegVedOLDKDVIDN: TSmallintField
      DisplayWidth = 13
      FieldName = 'OLDKDVIDN'
    end
    object cdsMegVedCHAS: TFloatField
      DisplayWidth = 12
      FieldName = 'CHAS'
    end
    object cdsMegVedDT_BEG: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DT_BEG'
    end
    object cdsMegVedDT_END: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DT_END'
    end
    object cdsMegVedKDSPZ: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDSPZ'
    end
    object cdsMegVedNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      DisplayWidth = 30
      FieldName = 'NOTES'
      Size = 25
    end
    object cdsMegVedPRR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRR'
    end
    object cdsMegVedPRPV: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRPV'
    end
    object cdsMegVedKTO: TSmallintField
      DisplayWidth = 12
      FieldName = 'KTO'
    end
    object cdsMegVedPRKR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRKR'
    end
    object cdsMegVedSPEC_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPEC_NR'
    end
    object cdsMegVedDTVDPV: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DTVDPV'
    end
    object cdsMegVedNRVDPV: TIntegerField
      DisplayWidth = 12
      FieldName = 'NRVDPV'
    end
    object cdsMegVedMYNOTES: TStringField
      DisplayWidth = 30
      FieldName = 'MYNOTES'
      Size = 25
    end
    object cdsMegVedSPECPS: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPECPS'
    end
    object cdsMegVedPBNK: TSmallintField
      DisplayWidth = 12
      FieldName = 'PBNK'
    end
  end
  object dsrcMegVed: TDataSource
    DataSet = cdsMegVed
    Left = 448
    Top = 176
  end
  object dspTmp: TDataSetProvider
    Left = 420
    Top = 115
  end
  object cdsPrt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 500
    Top = 163
  end
  object qryVed: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_VedNR where VedNr = 120')
    UpdateObject = updVed
    Left = 500
    Top = 107
    object qryVedNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VEDNR.NR'
    end
    object qryVedDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VEDNR.DTPROC'
    end
    object qryVedKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VEDNR.KDSPS'
    end
    object qryVedTYPEVED: TStringField
      FieldName = 'TYPEVED'
      Origin = 'DbMain.Z_VEDNR.TYPEVED'
      FixedChar = True
      Size = 12
    end
    object qryVedVEDNR: TIntegerField
      FieldName = 'VEDNR'
      Origin = 'DbMain.Z_VEDNR.VEDNR'
    end
    object qryVedVEDDATE: TDateTimeField
      FieldName = 'VEDDATE'
      Origin = 'DbMain.Z_VEDNR.VEDDATE'
    end
    object qryVedNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VEDNR.NOTES'
      Size = 35
    end
    object qryVedPRPODKL: TSmallintField
      FieldName = 'PRPODKL'
      Origin = 'DbMain.Z_VEDNR.PRPODKL'
    end
    object qryVedBNKNRPRDF: TSmallintField
      FieldName = 'BNKNRPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKNRPRDF'
    end
    object qryVedBNKDTPRDF: TDateTimeField
      FieldName = 'BNKDTPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKDTPRDF'
    end
    object qryVedBNKNMPRDF: TStringField
      FieldName = 'BNKNMPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKNMPRDF'
      Size = 65
    end
    object qryVedKSSVEDNR: TSmallintField
      FieldName = 'KSSVEDNR'
      Origin = 'DbMain.Z_VEDNR.KSSVEDNR'
    end
    object qryVedKSSVEDDT: TDateTimeField
      FieldName = 'KSSVEDDT'
      Origin = 'DbMain.Z_VEDNR.KSSVEDDT'
    end
    object qryVedKSSVEDNM: TStringField
      FieldName = 'KSSVEDNM'
      Origin = 'DbMain.Z_VEDNR.KSSVEDNM'
      Size = 65
    end
  end
  object updVed: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_VedNR'
      'set'
      '  DTPROC = :DTPROC,'
      '  KDSPS = :KDSPS,'
      '  TYPEVED = :TYPEVED,'
      '  VEDNR = :VEDNR,'
      '  VEDDATE = :VEDDATE,'
      '  NOTES = :NOTES,'
      '  PRPODKL = :PRPODKL,'
      '  BNKNRPRDF = :BNKNRPRDF,'
      '  BNKDTPRDF = :BNKDTPRDF,'
      '  BNKNMPRDF = :BNKNMPRDF,'
      '  KSSVEDNR = :KSSVEDNR,'
      '  KSSVEDDT = :KSSVEDDT,'
      '  KSSVEDNM = :KSSVEDNM'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_VedNR'
      
        '  (DTPROC, KDSPS, TYPEVED, VEDNR, VEDDATE, NOTES, PRPODKL, BNKNR' +
        'PRDF, BNKDTPRDF, '
      '   BNKNMPRDF, KSSVEDNR, KSSVEDDT, KSSVEDNM)'
      'values'
      
        '  (:DTPROC, :KDSPS, :TYPEVED, :VEDNR, :VEDDATE, :NOTES, :PRPODKL' +
        ', :BNKNRPRDF, '
      '   :BNKDTPRDF, :BNKNMPRDF, :KSSVEDNR, :KSSVEDDT, :KSSVEDNM)')
    DeleteSQL.Strings = (
      'delete from Z_VedNR'
      'where'
      '  NR = :OLD_NR')
    Left = 512
    Top = 120
  end
  object cdsTotals: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 493
    Top = 274
  end
  object popTbl_Otkl: TPopupMenu
    Left = 128
    Top = 112
    object popTbl_OtklSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popTbl_OtklSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080', '#1080#1084#1077#1085#1080', '#1086#1090#1095#1077#1089#1090#1074#1091
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' - '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.; '#1058#1072#1073#1053#1088'; '#1042#1080#1076#1053
        OnClick = popTbl_OtklSortByFIOClick
      end
      object popTbl_OtklSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' - '#1058#1072#1073#1053#1088'; '#1042#1080#1076#1053
        OnClick = popTbl_OtklSortByTabNClick
      end
      object popTbl_OtklSortByVidN: TMenuItem
        Caption = '- '#1087#1086' '#1074#1080#1076#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' - '#1042#1080#1076#1053'; '#1058#1072#1073#1053#1088
        OnClick = popTbl_OtklSortByVidNClick
      end
      object popTbl_OtklSortByNR: TMenuItem
        Caption = '- '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1074#1074#1086#1076#1072
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1085#1086' - '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1074#1074#1086#1076#1072' '#1074' '#1090#1072#1073#1083#1080#1094#1091
        OnClick = popTbl_OtklSortByNRClick
      end
    end
  end
end
