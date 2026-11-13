object FormPsPdn: TFormPsPdn
  Left = 309
  Top = 161
  Width = 785
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormPsPdn'
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 785
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 566
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #1044#1080#1072#1083#1086#1075
      DesignSize = (
        769
        535)
      object sBtnCreTblPdn: TSpeedButton
        Left = 259
        Top = 499
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Go !'
        Visible = False
        OnClick = sBtnCreTblPdnClick
      end
      object PanelDlg: TPanel
        Left = 16
        Top = 80
        Width = 323
        Height = 113
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 75
          Top = 12
          Width = 167
          Height = 13
          Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1086#1090#1095#1077#1090#1085#1086#1075#1086' '#1075#1086#1076#1072
          Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1086#1076#1086#1093#1086#1076#1085#1099#1081' '#1079#1072' '#1075#1086#1076':'
          ParentShowHint = False
          ShowHint = True
        end
        object Label1: TLabel
          Left = 4
          Top = 36
          Width = 198
          Height = 32
          Hint = 
            #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1075#1086#1076#1072' '#1080' '#1084#1077#1089#1103#1094#1072', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1089#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1089 +
            #1095#1077#1090#1072
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1082' '#1088#1072#1089#1095#1077#1090#1091' '#1084#1077#1089#1103#1094#1072':'
          ParentShowHint = False
          ShowHint = True
          WordWrap = True
        end
        object sBtnForward00: TSpeedButton
          Left = 154
          Top = 78
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
        object edGodZa: TEdit
          Left = 256
          Top = 9
          Width = 41
          Height = 21
          Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1077#1088#1077#1089#1095#1080#1090#1099#1074#1072#1077#1084#1086#1075#1086' '#1075#1086#1076#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '2007'
        end
        object UpDownGodZa: TUpDown
          Left = 297
          Top = 9
          Width = 15
          Height = 21
          Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1077#1088#1077#1089#1095#1080#1090#1099#1074#1072#1077#1084#1086#1075#1086' '#1075#1086#1076#1072
          Associate = edGodZa
          Min = 2007
          Max = 2030
          ParentShowHint = False
          Position = 2007
          ShowHint = True
          TabOrder = 1
          Thousands = False
        end
        object edMesR: TEdit
          Left = 208
          Top = 41
          Width = 29
          Height = 21
          Hint = 
            #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1075#1086#1076#1072' '#1080' '#1084#1077#1089#1103#1094#1072', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1089#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1089 +
            #1095#1077#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = '1'
        end
        object UpDownMesR: TUpDown
          Left = 237
          Top = 41
          Width = 15
          Height = 21
          Hint = 
            #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1075#1086#1076#1072' '#1080' '#1084#1077#1089#1103#1094#1072', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1089#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1089 +
            #1095#1077#1090#1072
          Associate = edMesR
          Min = 1
          Max = 12
          ParentShowHint = False
          Position = 1
          ShowHint = True
          TabOrder = 3
          Thousands = False
        end
        object edGodR: TEdit
          Left = 256
          Top = 41
          Width = 41
          Height = 21
          Hint = 
            #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1075#1086#1076#1072' '#1080' '#1084#1077#1089#1103#1094#1072', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1089#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1089 +
            #1095#1077#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '2008'
        end
        object UpDownGodR: TUpDown
          Left = 297
          Top = 41
          Width = 15
          Height = 21
          Hint = 
            #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1075#1086#1076#1072' '#1080' '#1084#1077#1089#1103#1094#1072', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1089#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1089 +
            #1095#1077#1090#1072
          Associate = edGodR
          Min = 2008
          Max = 2030
          ParentShowHint = False
          Position = 2008
          ShowHint = True
          TabOrder = 5
          Thousands = False
        end
        object bBtnCancel00: TBitBtn
          Left = 237
          Top = 78
          Width = 75
          Height = 25
          Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
          Caption = #1047#1072#1082#1088#1099#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = bBtnCancel00Click
          Kind = bkCancel
          Spacing = 0
        end
        object PanelWait: TPanel
          Left = 5
          Top = 7
          Width = 311
          Height = 98
          BevelOuter = bvNone
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          Visible = False
          object Label8: TLabel
            Left = 28
            Top = 14
            Width = 259
            Height = 71
            Alignment = taCenter
            AutoSize = False
            Caption = #1046#1076#1080#1090#1077'... '#1048#1076#1077#1090' '#1074#1099#1073#1086#1088#1082#1072' '#1080' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
        end
      end
      object dbgrNU: TDBGrid
        Left = 422
        Top = 0
        Width = 347
        Height = 535
        Hint = #1044#1083#1103' '#1074#1099#1073#1086#1088#1082#1080' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' "'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103'" '#1079#1072' '#1075#1086#1076
        Align = alRight
        Color = clCream
        DataSource = dsrcNU
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPDN'
            Width = 24
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      object dbgrPdn: TDBGrid
        Left = 0
        Top = 31
        Width = 505
        Height = 504
        Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1089#1095#1077#1090#1072' ('#1090#1086#1083#1100#1082#1086' '#1089' '#1086#1090#1083#1080#1095#1080#1103#1084#1080')'
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcPdn
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPdnDrawColumnCell
        OnDblClick = dbgrPdnDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 30
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
            FieldName = 'FAMIO'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POROGLG'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MINZP'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCLG'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRCLGSOTR'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMFORPDN'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMPF'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMSS'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMFZ'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMPDN'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMNEWPDN'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'METKA'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPZ'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 2
            Visible = True
          end>
      end
      object dbgrDet: TDBGrid
        Left = 505
        Top = 31
        Width = 264
        Height = 504
        Hint = #1057#1091#1084#1084#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081', '#1074#1083#1080#1103#1102#1097#1080#1077' '#1085#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1099#1081
        Align = alRight
        Color = clInfoBk
        DataSource = dsrcDet
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
            FieldName = 'ZAMESGOD'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPDN'
            Width = 15
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 769
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        DesignSize = (
          769
          31)
        object sBtnProverka: TSpeedButton
          Left = 491
          Top = 3
          Width = 26
          Height = 25
          Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' ('#1076#1083#1103' DBG)'
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnProverkaClick
        end
        object Label3: TLabel
          Left = 192
          Top = 2
          Width = 181
          Height = 13
          Caption = #1050#1088#1072#1089#1085#1099#1084' - '#1091#1076#1077#1088#1078#1072#1085#1080#1077' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 190
          Top = 16
          Width = 186
          Height = 13
          Caption = #1053#1086#1088#1084#1072#1083#1100#1085#1099#1084' - '#1074#1086#1079#1074#1088#1072#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
          Transparent = True
        end
        object sBtnStayOnTop: TSpeedButton
          Left = 5
          Top = 3
          Width = 25
          Height = 25
          Hint = #1042#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080
          AllowAllUp = True
          GroupIndex = 2
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
          OnClick = sBtnStayOnTopClick
        end
        object Label5: TLabel
          Left = 376
          Top = 3
          Width = 111
          Height = 27
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1057#1080#1085#1080#1084' - '#1091#1074#1086#1083#1077#1085#1085#1099#1077' '#1074' '#1084#1077#1089#1103#1094#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object sBtnSave: TSpeedButton
          Left = 603
          Top = 3
          Width = 84
          Height = 25
          Hint = #1047#1072#1087#1080#1089#1100' '#1074' '#1087#1072#1082#1077#1090' '#1090#1072#1073#1083#1080#1094#1099' "'#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103'"'
          Anchors = [akTop, akRight]
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD0700000000000000000000000000FDFD0003030000
            000000000707000300FDFD0003030000000000000707000300FDFD0003030000
            000000000707000300FDFD0003030000000000000000000300FDFD0003030303
            030303030303030300FDFD0003030000000000000000030300FDFD0003000707
            070707070707000300FDFD0003000707070707070707000300FDFD0003000707
            070707070707000300FDFD0003000707070707070707000300FDFD0003000707
            070707070707000000FDFD0003000707070707070707000700FDFD0000000000
            000000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnSaveClick
        end
        object LabelCntRec: TLabel
          Left = 136
          Top = 3
          Width = 59
          Height = 26
          Alignment = taCenter
          AutoSize = False
          Caption = #1047#1072#1087#1080#1089#1077#1081': 345678'
          Transparent = True
          WordWrap = True
        end
        object sBtnPrt: TSpeedButton
          Left = 525
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1095#1072#1090#1100
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFD0000000000000000000000FDFDFDFD0007070707
            0707070707000700FDFD000000000000000000000000000700FD000707070707
            07FBFBFB0707000000FD00070707070707F8F8F80707000700FD000000000000
            0000000000000007070000070707070707070707070007000700FD0000000000
            00000000000700070000FDFD00FFFFFFFFFFFFFFFF0007000700FDFDFD00FF00
            00000000FF00000000FDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00FF
            0000000000FF00FDFDFDFDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00
            0000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
          OnClick = sBtnPrtClick
        end
        object bBtnCancel02: TBitBtn
          Left = 690
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          OnClick = bBtnCancel00Click
          Kind = bkCancel
        end
        object DBNavigator1: TDBNavigator
          Left = 34
          Top = 3
          Width = 100
          Height = 25
          DataSource = dsrcPdn
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
          Hints.Strings = (
            #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
            'Insert record'
            #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
            'Edit record'
            'Post edit'
            'Cancel edit'
            'Refresh data')
          TabOrder = 1
        end
      end
    end
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select n.TabN, n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN, '
      
        '                                                           Sum(n' +
        '.Summa) as SMM'
      ' from Z_NU n '
      
        '                      Left Outer Join Z_KdVidN v on v.VidN = n.V' +
        'idN'
      ' where n.ZaMesGod >= '#39'01/01/2007'#39' and'
      '            n.ZaMesGod <= '#39'12/01/2007'#39' and n.VidN < '#39'7500'#39
      'group by n.TabN, n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN'
      'having Sum(n.Summa) > 0.001 or Sum(n.Summa) < -0.001')
    Left = 552
    Top = 424
    object qryNUTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryNUZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryNUVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNUSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNUSPDN: TStringField
      DisplayLabel = #1057#1055#1076#1085
      FieldName = 'SPDN'
      Size = 1
    end
    object qryNUSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 568
    Top = 440
  end
  object dsrcPdn: TDataSource
    DataSet = tblPdn
    Left = 88
    Top = 296
  end
  object qryTmp: TQuery
    Left = 624
    Top = 424
  end
  object qryDet: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcPdn
    SQL.Strings = (
      'Select n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN, Sum(n.Summa) as SMM'
      ' from Z_NU n  Left Outer Join Z_KdVidN v on v.VidN = n.VidN'
      
        ' where n.TabN = :TabN and n.ZaMesGod = :ZaMesGod and n.VidN < '#39'7' +
        '500'#39
      ' group by n.ZaMesGod, n.VidN, v.ShVidN, v.SPdN'
      ' having Sum(n.Summa) > 0.001 or Sum(n.Summa) < -0.001')
    Left = 544
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TabN'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftDate
        Name = 'ZaMesGod'
        ParamType = ptUnknown
        Size = 4
      end>
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object StringField1: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object StringField2: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object StringField3: TStringField
      DisplayLabel = #1057#1055#1076#1085
      FieldName = 'SPDN'
      Size = 1
    end
    object FloatField1: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
  end
  object dsrcDet: TDataSource
    DataSet = qryDet
    Left = 560
    Top = 296
  end
  object qryPrmUv: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from GET_PRMUVSTATE_ONDATE (17, '#39'08/01/2007'#39')')
    Left = 628
    Top = 339
  end
  object tblPdn: TTable
    AfterDelete = tblPdnAfterDelete
    DatabaseName = 'EsDbTmp'
    TableName = 'PDN_2007'
    Left = 68
    Top = 283
    object tblPdnNR: TIntegerField
      FieldName = 'NR'
    end
    object tblPdnTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
    end
    object tblPdnFAMIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FAMIO'
      Size = 35
    end
    object tblPdnDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object tblPdnZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object tblPdnPOROGLG: TFloatField
      DisplayLabel = #1055#1086#1088#1086#1075#1051#1100#1075
      FieldName = 'POROGLG'
      DisplayFormat = '#.00'
    end
    object tblPdnMINZP: TFloatField
      DisplayLabel = #1052#1080#1085#1047#1087#1083
      FieldName = 'MINZP'
      DisplayFormat = '#.00'
    end
    object tblPdnPRCLG: TFloatField
      DisplayLabel = #1055#1088#1094#1051#1100#1075
      FieldName = 'PRCLG'
      DisplayFormat = '#.00'
    end
    object tblPdnPRCLGSOTR: TFloatField
      DisplayLabel = #1055#1088#1094#1051#1100#1075#1057#1086#1090#1088
      FieldName = 'PRCLGSOTR'
      OnGetText = FloatFldGetText
      DisplayFormat = '#.00'
    end
    object tblPdnSMLGSOTR: TFloatField
      DisplayLabel = #1057#1084#1051#1100#1075#1057#1086#1090#1088
      FieldName = 'SMLGSOTR'
      OnGetText = FloatFldGetText
      DisplayFormat = '#.00'
    end
    object tblPdnSMFORPDN: TFloatField
      DisplayLabel = #1057#1084#1044#1083#1103#1055#1076#1053
      FieldName = 'SMFORPDN'
      DisplayFormat = '#.00'
    end
    object tblPdnSMPF: TFloatField
      DisplayLabel = #1057#1084#1055#1060
      FieldName = 'SMPF'
      DisplayFormat = '#.00'
    end
    object tblPdnSMSS: TFloatField
      DisplayLabel = #1057#1084#1057#1057#1090#1088
      FieldName = 'SMSS'
      DisplayFormat = '#.00'
    end
    object tblPdnSMFZ: TFloatField
      DisplayLabel = #1057#1084#1060#1047
      FieldName = 'SMFZ'
      DisplayFormat = '#.00'
    end
    object tblPdnSMALIM: TFloatField
      DisplayLabel = #1057#1084#1040#1083#1080#1084
      FieldName = 'SMALIM'
      DisplayFormat = '#.00'
    end
    object tblPdnSMPDN: TFloatField
      DisplayLabel = #1057#1084#1055#1076#1053
      FieldName = 'SMPDN'
      DisplayFormat = '#.00'
    end
    object tblPdnSMNEWPDN: TFloatField
      DisplayLabel = #1057#1084#1053#1086#1074#1055#1076#1053
      FieldName = 'SMNEWPDN'
      DisplayFormat = '#.00'
    end
    object tblPdnSUMMA: TFloatField
      DisplayLabel = #1044#1086#1073#1088#1072#1090#1100
      FieldName = 'SUMMA'
      OnGetText = FloatFldGetText
      DisplayFormat = '#.00'
    end
    object tblPdnKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object tblPdnKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1064#1055#1047
      FieldName = 'KDSPZ'
    end
    object tblPdnKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055
      FieldName = 'KDKATP'
    end
    object tblPdnPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object tblPdnMETKA: TSmallintField
      DisplayLabel = #1059#1074#1086#1083'.'
      FieldName = 'METKA'
    end
  end
  object qryInSps: TQuery
    Left = 628
    Top = 243
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 148
    Top = 171
    object popDelRec: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1083#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      OnClick = popDelRecClick
    end
    object popDetNU: TMenuItem
      Caption = #1041#1086#1083#1077#1077' '#1087#1086#1076#1088#1086#1073#1085#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
      OnClick = popDetNUClick
    end
  end
end
