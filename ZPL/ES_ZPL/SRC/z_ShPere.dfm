object FormShwPere: TFormShwPere
  Left = 589
  Top = 288
  Width = 1157
  Height = 459
  BorderIcons = []
  Caption = 'FormShwPere'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1149
    Height = 432
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object Splitter1: TSplitter
        Left = 216
        Top = 31
        Height = 370
      end
      object dbgrPktPere: TDBGrid
        Left = 0
        Top = 31
        Width = 216
        Height = 370
        Align = alLeft
        DataSource = dsrcPktPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = popPktPere
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPktPereDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NRPKT'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVPKT'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDUSR'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmUsr'
            Width = 53
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1141
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          1141
          31)
        object sBtnAddPktPere: TSpeedButton
          Left = 3
          Top = 3
          Width = 75
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
          Caption = #1053#1086#1074#1099#1081
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
          OnClick = popPktPereAddClick
        end
        object sBtnDelPktPere: TSpeedButton
          Left = 79
          Top = 3
          Width = 75
          Height = 25
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = popPktPereDelClick
        end
        object sBtnEdtPktPere: TSpeedButton
          Left = 155
          Top = 3
          Width = 75
          Height = 25
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' '#1087#1072#1082#1077#1090#1072' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
          AllowAllUp = True
          GroupIndex = 7
          Caption = #1055#1088#1072#1074#1080#1090#1100
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
          Spacing = 2
          OnClick = sBtnEdtPktPereClick
        end
        object LabelShwPereCntRec: TLabel
          Left = 238
          Top = 9
          Width = 105
          Height = 13
          Caption = 'LabelShwPereCntRec'
        end
        object LabelShwPereSort: TLabel
          Left = 320
          Top = 9
          Width = 88
          Height = 13
          Caption = 'LabelShwPereSort'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object bBtnClose: TBitBtn
          Left = 1063
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          Kind = bkCancel
          Spacing = 0
        end
        object DBNavigator1: TDBNavigator
          Left = 978
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcShwPere
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
      end
      object dbgrShwPere: TDBGrid
        Left = 219
        Top = 31
        Width = 922
        Height = 370
        Align = alClient
        Color = 13687540
        DataSource = dsrcShwPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pop
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrShwPereDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            ReadOnly = True
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBM'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            ReadOnly = True
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            ReadOnly = True
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCWRKTIME'
            ReadOnly = True
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SO'
            ReadOnly = True
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NPD'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKLTRF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDNLG'
            ReadOnly = True
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOVM'
            ReadOnly = True
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INV'
            ReadOnly = True
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PR_PENS'
            ReadOnly = True
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRFS'
            ReadOnly = True
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROCLG'
            ReadOnly = True
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOLGNOST'
            ReadOnly = True
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PRIKAZA'
            ReadOnly = True
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PRIKAZA'
            ReadOnly = True
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            ReadOnly = True
            Width = 9
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDKDOK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEWKDOK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDTEMU'
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1141
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          1141
          31)
        object sBtnCreSps: TSpeedButton
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
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
          OnClick = sBtnCreSpsClick
        end
        object sBtnZadanie: TSpeedButton
          Left = 82
          Top = 3
          Width = 75
          Height = 25
          Hint = 
            #1042#1074#1077#1089#1090#1080' '#1079#1072#1076#1072#1085#1080#1077' '#1076#1083#1103' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1072#1082#1077#1090#1072' '#1085#1086#1074#1099#1093' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' '#1087#1086' '#1089#1086#1079#1076 +
            #1072#1085#1085#1086#1084#1091' '#1089#1087#1080#1089#1082#1091
          Caption = #1047#1072#1076#1072#1085#1080#1077
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
          OnClick = sBtnZadanieClick
        end
        object sBtnSavePere: TSpeedButton
          Left = 159
          Top = 3
          Width = 81
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1086#1074#1099#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1074' '#1041#1044
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
            007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
            7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
            99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnSavePereClick
        end
        object LabelCntRec: TLabel
          Left = 243
          Top = 9
          Width = 62
          Height = 13
          Caption = 'LabelCntRec'
        end
        object LabelSort: TLabel
          Left = 464
          Top = 9
          Width = 45
          Height = 13
          Caption = 'LabelSort'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object sBtnGoBack: TSpeedButton
          Left = 1063
          Top = 3
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
          OnClick = sBtnGoBackClick
        end
        object LabelBM: TLabel
          Left = 344
          Top = 0
          Width = 85
          Height = 28
          Alignment = taCenter
          AutoSize = False
          Caption = #1041#1072#1079#1086#1074#1099#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object DBNavigator2: TDBNavigator
          Left = 978
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcSps
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Anchors = [akTop, akRight]
          TabOrder = 0
        end
      end
      object dbgrSps: TDBGrid
        Left = 0
        Top = 31
        Width = 1141
        Height = 370
        Align = alClient
        Color = 11523823
        DataSource = dsrcSps
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = pop
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrSpsDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'TabN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtBM'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dt_Beg'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            FieldName = 'KdObj'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShObj'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShKatP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 48
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'Prfs'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 29
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'Pr_Pens'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 25
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'Inv'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 24
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'NPD'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OklTrf'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 47
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'NwDtBeg'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'NwKdObj'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'NwOklTrf'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 55
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'NrPrikaza'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'DtPrikaza'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 51
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
            FieldName = 'OldKdOk'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NewKdOk'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IS_PERE'
            Visible = True
          end>
      end
      object LbxObj: TListBox
        Left = 26
        Top = 352
        Width = 34
        Height = 39
        Color = clBtnFace
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        Visible = False
      end
      object LbxKatP: TListBox
        Left = 66
        Top = 352
        Width = 34
        Height = 39
        Color = clBtnFace
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
    end
  end
  object cdsSps: TClientDataSet
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
        Name = 'BM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Dt_Beg'
        DataType = ftDate
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
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
      end
      item
        Name = 'NwDtBeg'
        DataType = ftDate
      end
      item
        Name = 'NwKdObj'
        DataType = ftSmallint
      end
      item
        Name = 'NwKdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'NwOklTrf'
        DataType = ftFloat
      end
      item
        Name = 'NrPrikaza'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtPrikaza'
        DataType = ftDate
      end
      item
        Name = 'Saved'
        DataType = ftBoolean
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'PrcWrkTime'
        DataType = ftFloat
      end
      item
        Name = 'SO'
        DataType = ftSmallint
      end
      item
        Name = 'Avans'
        DataType = ftFloat
      end
      item
        Name = 'Sp_Av'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KdDolgn'
        DataType = ftSmallint
      end
      item
        Name = 'Dolgnost'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'Pr_Pens'
        DataType = ftSmallint
      end
      item
        Name = 'NPD'
        DataType = ftSmallint
      end
      item
        Name = 'Sovm'
        DataType = ftSmallint
      end
      item
        Name = 'PdNlg'
        DataType = ftSmallint
      end
      item
        Name = 'ProcLg'
        DataType = ftFloat
      end
      item
        Name = 'KolMin'
        DataType = ftSmallint
      end
      item
        Name = 'Prfs'
        DataType = ftSmallint
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Inv'
        DataType = ftSmallint
      end
      item
        Name = 'Rang'
        DataType = ftSmallint
      end
      item
        Name = 'Razr'
        DataType = ftSmallint
      end
      item
        Name = 'Dt_End'
        DataType = ftDate
      end
      item
        Name = 'OldKdObj'
        DataType = ftSmallint
      end
      item
        Name = 'PrDekr'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CmbOkl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DtVPkt'
        DataType = ftDate
      end
      item
        Name = 'NrPkt'
        DataType = ftInteger
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'OldKdOk'
        DataType = ftSmallint
      end
      item
        Name = 'NewKdOk'
        DataType = ftSmallint
      end
      item
        Name = 'DtBM'
        DataType = ftDate
      end
      item
        Name = 'IS_PERE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 208
    object cdsSpsNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsSpsTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsSpsBM: TStringField
      DisplayLabel = #1041#1052
      FieldName = 'BM'
      Size = 1
    end
    object cdsSpsDtBM: TDateField
      DisplayLabel = #1044#1072#1090#1072#1041#1052
      FieldName = 'DtBM'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsSpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 40
    end
    object cdsSpsDt_Beg: TDateField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'Dt_Beg'
    end
    object cdsSpsOklTrf: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OklTrf'
      DisplayFormat = '#.00'
    end
    object cdsSpsKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsSpsShObj: TStringField
      DisplayLabel = #1064#1092#1088#1055#1076#1088
      FieldName = 'ShObj'
      Size = 15
    end
    object cdsSpsNmObj: TStringField
      FieldName = 'NmObj'
      Size = 65
    end
    object cdsSpsKdKatP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088
      FieldName = 'KdKatP'
    end
    object cdsSpsShKatP: TStringField
      DisplayLabel = #1064#1092#1088#1050#1090#1075#1088
      FieldName = 'ShKatP'
      Size = 10
    end
    object cdsSpsNmKatP: TStringField
      FieldName = 'NmKatP'
      Size = 35
    end
    object cdsSpsNwDtBeg: TDateField
      DisplayLabel = #1044#1090'_'#1053#1072#1095#1072#1083#1072
      FieldName = 'NwDtBeg'
    end
    object cdsSpsNwKdObj: TSmallintField
      DisplayLabel = #1050#1076'_'#1055#1076#1088
      FieldName = 'NwKdObj'
    end
    object cdsSpsNwKdKatP: TSmallintField
      DisplayLabel = #1050#1076'_'#1050#1090#1075#1088
      FieldName = 'NwKdKatP'
    end
    object cdsSpsNwOklTrf: TFloatField
      DisplayLabel = #1053#1086#1074'_'#1054#1082#1083#1072#1076
      FieldName = 'NwOklTrf'
      DisplayFormat = '#.00'
    end
    object cdsSpsNrPrikaza: TStringField
      DisplayLabel = #1053#1088#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'NrPrikaza'
      Size = 10
    end
    object cdsSpsDtPrikaza: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DtPrikaza'
    end
    object cdsSpsSaved: TBooleanField
      FieldName = 'Saved'
    end
    object cdsSpsKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsSpsPrcWrkTime: TFloatField
      FieldName = 'PrcWrkTime'
    end
    object cdsSpsSO: TSmallintField
      FieldName = 'SO'
    end
    object cdsSpsAvans: TFloatField
      FieldName = 'Avans'
    end
    object cdsSpsSp_Av: TStringField
      FieldName = 'Sp_Av'
      Size = 1
    end
    object cdsSpsKdDolgn: TSmallintField
      FieldName = 'KdDolgn'
    end
    object cdsSpsDolgnost: TStringField
      FieldName = 'Dolgnost'
      Size = 40
    end
    object cdsSpsKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsSpsPr_Pens: TSmallintField
      DisplayLabel = #1055#1077#1085#1089
      FieldName = 'Pr_Pens'
    end
    object cdsSpsNPD: TSmallintField
      DisplayLabel = #1053#1087#1056#1044
      FieldName = 'NPD'
    end
    object cdsSpsSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object cdsSpsPdNlg: TSmallintField
      FieldName = 'PdNlg'
    end
    object cdsSpsProcLg: TFloatField
      FieldName = 'ProcLg'
    end
    object cdsSpsKolMin: TSmallintField
      FieldName = 'KolMin'
    end
    object cdsSpsPrfs: TSmallintField
      DisplayLabel = #1055#1088#1092#1089#1079
      FieldName = 'Prfs'
    end
    object cdsSpsNotes: TStringField
      FieldName = 'Notes'
      Size = 35
    end
    object cdsSpsInv: TSmallintField
      DisplayLabel = #1048#1085#1074
      FieldName = 'Inv'
    end
    object cdsSpsRang: TSmallintField
      FieldName = 'Rang'
    end
    object cdsSpsRazr: TSmallintField
      FieldName = 'Razr'
    end
    object cdsSpsDt_End: TDateField
      FieldName = 'Dt_End'
    end
    object cdsSpsOldKdObj: TSmallintField
      FieldName = 'OldKdObj'
    end
    object cdsSpsPrDekr: TStringField
      FieldName = 'PrDekr'
      Size = 1
    end
    object cdsSpsCmbOkl: TStringField
      FieldName = 'CmbOkl'
      Size = 1
    end
    object cdsSpsNrPkt: TIntegerField
      FieldName = 'NrPkt'
    end
    object cdsSpsDtVPkt: TDateField
      FieldName = 'DtVPkt'
    end
    object cdsSpsKdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object cdsSpsOldKdOk: TSmallintField
      FieldName = 'OldKdOk'
    end
    object cdsSpsNewKdOk: TSmallintField
      FieldName = 'NewKdOk'
    end
    object cdsSpsIS_PERE: TStringField
      DisplayLabel = #1058#1088#1091#1076'.'#1082#1085'.'
      FieldName = 'IS_PERE'
      Size = 1
    end
  end
  object qryTmp: TQuery
    Left = 448
    Top = 192
  end
  object dsrcSps: TDataSource
    DataSet = cdsSps
    Left = 312
    Top = 232
  end
  object qryPere: TQuery
    Left = 168
    Top = 216
  end
  object dsrcTmp: TDataSource
    DataSet = qryTmp
    Left = 464
    Top = 208
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 248
    Top = 104
    object popSpsSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popSpsSortTabN: TMenuItem
        Caption = '- '#1087#1086' '#1058#1072#1073#1053#1088
        Checked = True
        OnClick = popSpsSortTabNClick
      end
      object popSpsSortFamIO: TMenuItem
        Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popSpsSortFamIOClick
      end
      object popSpsSortKdObjTabN: TMenuItem
        Caption = '- '#1050#1086#1076#1055#1076#1088'; '#1058#1072#1073#1053#1088
        OnClick = popSpsSortKdObjTabNClick
      end
      object popSpsSortKdObjFamIO: TMenuItem
        Caption = '- '#1050#1086#1076#1055#1076#1088'; '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popSpsSortKdObjFamIOClick
      end
    end
    object popSpsDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = popSpsDelClick
    end
    object popShwSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popShwSortTabN: TMenuItem
        Caption = '- '#1087#1086' '#1058#1072#1073'. '#1085#1086#1084#1077#1088#1091
        OnClick = popShwSortTabNClick
      end
      object popShwSortFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        OnClick = popShwSortFIOClick
      end
      object popShwSortObjTabN: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1079#1076'.; '#1058#1072#1073'. '#1085#1086#1084#1077#1088
        OnClick = popShwSortObjTabNClick
      end
      object popShwSortObjFIO: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1079#1076'.; '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popShwSortObjFIOClick
      end
    end
    object popShwDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popShwDelClick
    end
    object pop_ShwEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = False
    end
  end
  object qryPktPere: TQuery
    CachedUpdates = True
    BeforeScroll = qryPktPereBeforeScroll
    AfterScroll = qryPktPereAfterScroll
    OnCalcFields = qryPktPereCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ZZ_PerePkt'
      '')
    UpdateObject = updPktPere
    Left = 36
    Top = 211
    object qryPktPereNR: TIntegerField
      DisplayWidth = 6
      FieldName = 'NR'
      Origin = 'ZZ_PEREPKT.NR'
    end
    object qryPktPereNRPKT: TIntegerField
      DisplayLabel = #8470#1087#1082#1090
      DisplayWidth = 12
      FieldName = 'NRPKT'
      Origin = 'ZZ_PEREPKT.NRPKT'
    end
    object qryPktPereDTVPKT: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      DisplayWidth = 22
      FieldName = 'DTVPKT'
      Origin = 'ZZ_PEREPKT.DTVPKT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPktPereKDUSR: TSmallintField
      DisplayLabel = #1050#1076#1055#1086#1083#1100#1079'.'
      DisplayWidth = 12
      FieldName = 'KDUSR'
      Origin = 'ZZ_PEREPKT.KDUSR'
    end
    object qryPktPereMYNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      DisplayWidth = 78
      FieldName = 'MYNOTES'
      Origin = 'ZZ_PEREPKT.MYNOTES'
      Size = 65
    end
    object qryPktPereNmUsr: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldKind = fkCalculated
      FieldName = 'NmUsr'
      Size = 25
      Calculated = True
    end
  end
  object dsrcPktPere: TDataSource
    DataSet = qryPktPere
    Left = 48
    Top = 224
  end
  object updPktPere: TUpdateSQL
    ModifySQL.Strings = (
      'update ZZ_PerePkt'
      'set'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  KDUSR = :KDUSR,'
      '  MYNOTES = :MYNOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into ZZ_PerePkt'
      '  (NRPKT, DTVPKT, KDUSR, MYNOTES)'
      'values'
      '  (:NRPKT, :DTVPKT, :KDUSR, :MYNOTES)')
    DeleteSQL.Strings = (
      'delete from ZZ_PerePkt'
      'where'
      '  NR = :OLD_NR')
    Left = 64
    Top = 240
  end
  object popPktPere: TPopupMenu
    OnPopup = popPktPerePopup
    Left = 104
    Top = 112
    object popPktPereHead: TMenuItem
      Caption = '== '#1055#1072#1082#1077#1090#1099' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' =='
      Enabled = False
    end
    object popPktPereAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090
      OnClick = popPktPereAddClick
    end
    object popPktPereDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
      OnClick = popPktPereDelClick
    end
  end
  object qrySvPere: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select first 1 * from Z_Pere')
    UpdateObject = updSvPere
    Left = 200
    Top = 216
  end
  object updSvPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Pere'
      'set'
      '  BM = :BM,'
      '  DTBM = :DTBM,'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCWRKTIME = :PRCWRKTIME,'
      '  SO = :SO,'
      '  OKLTRF = :OKLTRF,'
      '  AVANS = :AVANS,'
      '  SP_AV = :SP_AV,'
      '  KDDOLGN = :KDDOLGN,'
      '  DOLGNOST = :DOLGNOST,'
      '  KDSPZ = :KDSPZ,'
      '  PR_PENS = :PR_PENS,'
      '  SOVM = :SOVM,'
      '  PDNLG = :PDNLG,'
      '  PROCLG = :PROCLG,'
      '  KOLMIN = :KOLMIN,'
      '  PRFS = :PRFS,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NOTES = :NOTES,'
      '  INV = :INV,'
      '  RANG = :RANG,'
      '  RAZR = :RAZR,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  PRDEKR = :PRDEKR,'
      '  CMBOKL = :CMBOKL,'
      '  SPEC_NR = :SPEC_NR,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  OLDKDOK = :OLDKDOK,'
      '  NEWKDOK = :NEWKDOK'
      '  IS_PERE = :IS_PERE,'
      '  NPD = :NPD'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Pere'
      '  (BM, DTBM, KDSPS, TABN, DT_BEG, KDTEMU, KDOBJ, KDKATP, '
      'PRCWRKTIME, SO, '
      
        '   OKLTRF, AVANS, SP_AV, KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM' +
        ', '
      'PDNLG, '
      
        '   PROCLG, KOLMIN, PRFS, NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RAN' +
        'G, '
      'RAZR, '
      '   DT_END, OLDKDOBJ, PRDEKR, CMBOKL, SPEC_NR, NRPKT, DTVPKT, '
      'OLDKDOK, NEWKDOK, IS_PERE, NPD)'
      'values'
      
        '  (:BM, :DTBM, :KDSPS, :TABN, :DT_BEG, :KDTEMU, :KDOBJ, :KDKATP,' +
        ' '
      ':PRCWRKTIME, '
      
        '   :SO, :OKLTRF, :AVANS, :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :P' +
        'R_PENS, '
      
        '   :SOVM, :PDNLG, :PROCLG, :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIK' +
        'AZA, '
      ':NOTES, '
      
        '   :INV, :RANG, :RAZR, :DT_END, :OLDKDOBJ, :PRDEKR, :CMBOKL, :SP' +
        'EC_NR, '
      '   :NRPKT, :DTVPKT, :OLDKDOK, :NEWKDOK, :IS_PERE, :NPD)')
    DeleteSQL.Strings = (
      'delete from Z_Pere'
      'where'
      '  NR = :OLD_NR')
    Left = 224
    Top = 232
  end
  object qryShwPere: TQuery
    CachedUpdates = True
    AfterPost = qryShwPereAfterPost
    OnCalcFields = qryShwPereCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcPktPere
    SQL.Strings = (
      'Select * from Z_Pere '
      '')
    UpdateObject = updShwPere
    Left = 100
    Top = 211
    object qryShwPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'Z_PERE.NR'
    end
    object qryShwPereBM: TStringField
      DisplayLabel = #1041#1052
      FieldName = 'BM'
      Origin = 'Z_PERE.BM'
      FixedChar = True
      Size = 1
    end
    object qryShwPereDTBM: TDateTimeField
      DisplayLabel = #1044#1090#1041#1052
      FieldName = 'DTBM'
      Origin = 'Z_PERE.DTBM'
    end
    object qryShwPereFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryShwPereKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'Z_PERE.KDSPS'
    end
    object qryShwPereTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'Z_PERE.TABN'
    end
    object qryShwPereDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'Z_PERE.DT_BEG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryShwPereKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'Z_PERE.KDOBJ'
    end
    object qryShwPereKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088
      FieldName = 'KDKATP'
      Origin = 'Z_PERE.KDKATP'
    end
    object qryShwPerePRCWRKTIME: TFloatField
      DisplayLabel = '%'#1088#1072#1073#1042#1088
      FieldName = 'PRCWRKTIME'
      Origin = 'Z_PERE.PRCWRKTIME'
    end
    object qryShwPereSO: TSmallintField
      DisplayLabel = #1057#1054
      FieldName = 'SO'
      Origin = 'Z_PERE.SO'
    end
    object qryShwPereNPD: TSmallintField
      DisplayLabel = #1053#1087#1056#1044
      FieldName = 'NPD'
      Origin = 'Z_PERE.NPD'
    end
    object qryShwPereOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLTRF'
      Origin = 'Z_PERE.OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryShwPereAVANS: TFloatField
      FieldName = 'AVANS'
      Origin = 'Z_PERE.AVANS'
    end
    object qryShwPereSP_AV: TStringField
      FieldName = 'SP_AV'
      Origin = 'Z_PERE.SP_AV'
      Size = 1
    end
    object qryShwPereKDDOLGN: TSmallintField
      FieldName = 'KDDOLGN'
      Origin = 'Z_PERE.KDDOLGN'
    end
    object qryShwPereDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNOST'
      Origin = 'Z_PERE.DOLGNOST'
      Size = 40
    end
    object qryShwPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'Z_PERE.KDSPZ'
    end
    object qryShwPerePR_PENS: TSmallintField
      DisplayLabel = #1055#1077#1085#1089
      FieldName = 'PR_PENS'
      Origin = 'Z_PERE.PR_PENS'
    end
    object qryShwPereSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084
      FieldName = 'SOVM'
      Origin = 'Z_PERE.SOVM'
    end
    object qryShwPerePDNLG: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDNLG'
      Origin = 'Z_PERE.PDNLG'
    end
    object qryShwPerePROCLG: TFloatField
      DisplayLabel = '%'#1083#1100#1075#1086#1090#1099
      FieldName = 'PROCLG'
      Origin = 'Z_PERE.PROCLG'
    end
    object qryShwPereKOLMIN: TSmallintField
      FieldName = 'KOLMIN'
      Origin = 'Z_PERE.KOLMIN'
    end
    object qryShwPerePRFS: TSmallintField
      DisplayLabel = #1055#1088#1092#1089
      FieldName = 'PRFS'
      Origin = 'Z_PERE.PRFS'
    end
    object qryShwPereNR_PRIKAZA: TStringField
      DisplayLabel = #8470' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'NR_PRIKAZA'
      Origin = 'Z_PERE.NR_PRIKAZA'
      Size = 10
    end
    object qryShwPereDT_PRIKAZA: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DT_PRIKAZA'
      Origin = 'Z_PERE.DT_PRIKAZA'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryShwPereNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'Z_PERE.NOTES'
      Size = 35
    end
    object qryShwPereINV: TSmallintField
      DisplayLabel = #1048#1085#1074
      FieldName = 'INV'
      Origin = 'Z_PERE.INV'
    end
    object qryShwPereRANG: TSmallintField
      FieldName = 'RANG'
      Origin = 'Z_PERE.RANG'
    end
    object qryShwPereRAZR: TSmallintField
      FieldName = 'RAZR'
      Origin = 'Z_PERE.RAZR'
    end
    object qryShwPereDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'Z_PERE.DT_END'
    end
    object qryShwPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'Z_PERE.OLDKDOBJ'
    end
    object qryShwPerePRDEKR: TStringField
      FieldName = 'PRDEKR'
      Origin = 'Z_PERE.PRDEKR'
      FixedChar = True
      Size = 1
    end
    object qryShwPereCMBOKL: TStringField
      FieldName = 'CMBOKL'
      Origin = 'Z_PERE.CMBOKL'
      FixedChar = True
      Size = 1
    end
    object qryShwPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'Z_PERE.SPEC_NR'
    end
    object qryShwPereNRPKT: TIntegerField
      FieldName = 'NRPKT'
      Origin = 'Z_PERE.NRPKT'
    end
    object qryShwPereDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
      Origin = 'Z_PERE.DTVPKT'
    end
    object qryShwPereKDTEMU: TSmallintField
      DisplayLabel = 'KdTemu'
      FieldName = 'KDTEMU'
      Origin = 'Z_PERE.KDTEMU'
    end
    object qryShwPereCODE: TStringField
      FieldName = 'CODE'
      Origin = 'Z_PERE.CODE'
      FixedChar = True
      Size = 10
    end
    object qryShwPereZ_KPP: TStringField
      FieldName = 'Z_KPP'
      Origin = 'Z_PERE.Z_KPP'
      FixedChar = True
      Size = 10
    end
    object qryShwPereNOINDX: TStringField
      FieldName = 'NOINDX'
      Origin = 'Z_PERE.NOINDX'
      FixedChar = True
      Size = 1
    end
    object qryShwPereOLDKDOK: TSmallintField
      DisplayLabel = 'OldKdOk'
      FieldName = 'OLDKDOK'
      Origin = 'Z_PERE.OLDKDOK'
    end
    object qryShwPereNEWKDOK: TSmallintField
      DisplayLabel = 'NewKdOk'
      FieldName = 'NEWKDOK'
      Origin = 'Z_PERE.NEWKDOK'
    end
    object qryShwPereIS_PERE: TStringField
      DisplayLabel = #1058#1088'.'#1050#1085'.'
      FieldName = 'IS_PERE'
      Size = 1
    end
  end
  object dsrcShwPere: TDataSource
    DataSet = qryShwPere
    Left = 112
    Top = 224
  end
  object updShwPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Pere'
      'set'
      '  BM = :BM,'
      '  DTBM = :DTBM,'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCWRKTIME = :PRCWRKTIME,'
      '  SO = :SO,'
      '  OKLTRF = :OKLTRF,'
      '  AVANS = :AVANS,'
      '  SP_AV = :SP_AV,'
      '  KDDOLGN = :KDDOLGN,'
      '  DOLGNOST = :DOLGNOST,'
      '  KDSPZ = :KDSPZ,'
      '  PR_PENS = :PR_PENS,'
      '  SOVM = :SOVM,'
      '  PDNLG = :PDNLG,'
      '  PROCLG = :PROCLG,'
      '  KOLMIN = :KOLMIN,'
      '  PRFS = :PRFS,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NOTES = :NOTES,'
      '  INV = :INV,'
      '  RANG = :RANG,'
      '  RAZR = :RAZR,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  PRDEKR = :PRDEKR,'
      '  CMBOKL = :CMBOKL,'
      '  SPEC_NR = :SPEC_NR,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  OLDKDOK = :OLDKDOK,'
      '  NEWKDOK = :NEWKDOK,'
      '  IS_PERE = :IS_PERE,'
      '  NPD = :NPD'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Pere'
      '  (BM, DTBM, KDSPS, TABN, DT_BEG, KDTEMU, KDOBJ, KDKATP, '
      'PRCWRKTIME, SO, '
      
        '   OKLTRF, AVANS, SP_AV, KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM' +
        ', '
      'PDNLG, '
      
        '   PROCLG, KOLMIN, PRFS, NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RAN' +
        'G, '
      'RAZR, '
      '   DT_END, OLDKDOBJ, PRDEKR, CMBOKL, SPEC_NR, NRPKT, DTVPKT, '
      'OLDKDOK, NEWKDOK, IS_PERE, NPD)'
      'values'
      
        '  (:BM, :DTBM, :KDSPS, :TABN, :DT_BEG, :KDTEMU, :KDOBJ, :KDKATP,' +
        ' '
      ':PRCWRKTIME, '
      
        '   :SO, :OKLTRF, :AVANS, :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :P' +
        'R_PENS, '
      
        '   :SOVM, :PDNLG, :PROCLG, :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIK' +
        'AZA, '
      ':NOTES, '
      
        '   :INV, :RANG, :RAZR, :DT_END, :OLDKDOBJ, :PRDEKR, :CMBOKL, :SP' +
        'EC_NR, '
      '   :NRPKT, :DTVPKT, :OLDKDOK, :NEWKDOK, :IS_PERE, :NPD)')
    DeleteSQL.Strings = (
      'delete from Z_Pere'
      'where'
      '  NR = :OLD_NR')
    Left = 128
    Top = 240
  end
  object qryIs8802: TQuery
    Left = 452
    Top = 275
  end
  object qryAdd8802: TQuery
    Left = 484
    Top = 275
  end
end
