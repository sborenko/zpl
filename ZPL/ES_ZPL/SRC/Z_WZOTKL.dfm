object FormWizardOtkl: TFormWizardOtkl
  Left = 290
  Top = 175
  Width = 913
  Height = 727
  BorderIcons = [biSystemMenu]
  Caption = 'FormWizardOtkl'
  Color = clBtnFace
  Constraints.MinHeight = 565
  Constraints.MinWidth = 585
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
    Width = 905
    Height = 700
    ActivePage = tsObjKat
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsObjKat: TTabSheet
      Caption = 'tsObjKat'
      object Panel1: TPanel
        Left = 0
        Top = 641
        Width = 897
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          897
          28)
        object SpeedButton1: TSpeedButton
          Left = 742
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1083#1100#1096#1077
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
          Spacing = 0
          OnClick = SpeedButton1Click
        end
        object LabelCountSelObj: TLabel
          Left = 0
          Top = 15
          Width = 85
          Height = 13
          Caption = 'LabelCountSelObj'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object LabelCountSelKatP: TLabel
          Left = 0
          Top = 3
          Width = 92
          Height = 13
          Caption = 'LabelCountSelKatP'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object BitBtn1: TBitBtn
          Left = 822
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object Panel4: TPanel
        Left = 725
        Top = 0
        Width = 172
        Height = 641
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        OnResize = Panel4Resize
        object Panel8: TPanel
          Left = 1
          Top = 83
          Width = 170
          Height = 402
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 14
            Top = 276
            Width = 146
            Height = 26
            AutoSize = False
            Caption = #1056#1072#1073#1086#1090#1072#1102#1097#1080#1093' '#1087#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1085#1072' '#1076#1072#1090#1091':'
            Transparent = True
            WordWrap = True
          end
          object LabelKatP: TLabel
            Left = 10
            Top = 74
            Width = 153
            Height = 46
            Alignment = taCenter
            AutoSize = False
            Caption = #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1074#1099#1076#1077#1083#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
            WordWrap = True
          end
          object LabelObj2: TLabel
            Left = 10
            Top = 214
            Width = 153
            Height = 46
            Alignment = taCenter
            AutoSize = False
            Caption = #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1074#1099#1076#1077#1083#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
            WordWrap = True
          end
          object grBoxObj: TGroupBox
            Left = 14
            Top = 160
            Width = 151
            Height = 50
            Caption = ' '#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '
            TabOrder = 0
            object rBtnAllObj: TRadioButton
              Left = 10
              Top = 14
              Width = 113
              Height = 17
              Caption = #1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rBtnAllObjClick
            end
            object rBtnSelObj: TRadioButton
              Left = 10
              Top = 28
              Width = 113
              Height = 17
              Caption = #1090#1086#1083#1100#1082#1086' '#1079#1072#1076#1072#1085#1085#1099#1077
              TabOrder = 1
              OnClick = rBtnSelObjClick
            end
          end
          object grBoxKatP: TGroupBox
            Left = 14
            Top = 20
            Width = 151
            Height = 50
            Caption = ' '#1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' '
            TabOrder = 1
            object rBtnAllKatP: TRadioButton
              Left = 10
              Top = 14
              Width = 113
              Height = 17
              Caption = #1074#1089#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rBtnAllKatPClick
            end
            object rBtnSelKatP: TRadioButton
              Left = 10
              Top = 28
              Width = 113
              Height = 17
              Caption = #1090#1086#1083#1100#1082#1086' '#1079#1072#1076#1072#1085#1085#1099#1077
              TabOrder = 1
              OnClick = rBtnSelKatPClick
            end
          end
          object dtPicDtRep: TDateTimePicker
            Left = 80
            Top = 290
            Width = 85
            Height = 21
            Date = 38086.000000000000000000
            Time = 38086.000000000000000000
            TabOrder = 2
          end
          object chBoxFromUpi: TCheckBox
            Left = 27
            Top = 357
            Width = 129
            Height = 28
            Hint = #1042#1099#1073#1088#1072#1090#1100' '#1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1086' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
            Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1088#1103#1084#1086' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            WordWrap = True
            OnClick = chBoxFromUpiClick
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 725
        Height = 641
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 2
        object Splitter2: TSplitter
          Left = 0
          Top = 120
          Width = 725
          Height = 3
          Cursor = crVSplit
          Align = alTop
          Beveled = True
          Color = clTeal
          ParentColor = False
        end
        object LabelObj: TLabel
          Left = 0
          Top = 123
          Width = 725
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        end
        object dbgrKatP: TDBGrid
          Left = 0
          Top = 0
          Width = 725
          Height = 120
          Align = alTop
          DataSource = dsrcKatP
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrKatPDrawColumnCell
          OnDblClick = dbgrKatPDblClick
          OnEnter = dbgrKatPEnter
          OnExit = dbgrKatPExit
        end
        object TV: TTreeView
          Left = 0
          Top = 136
          Width = 725
          Height = 505
          Align = alClient
          Indent = 19
          TabOrder = 1
          OnCustomDrawItem = TVCustomDrawItem
          OnDblClick = TVDblClick
          OnEnter = TVEnter
          OnExit = TVExit
        end
        object lbxObjF8: TListBox
          Left = 40
          Top = 320
          Width = 23
          Height = 25
          Color = clBtnFace
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 2
          Visible = False
        end
        object lbxKatPF8: TListBox
          Left = 72
          Top = 320
          Width = 23
          Height = 25
          Color = clBtnFace
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 3
          Visible = False
        end
      end
    end
    object ts1: TTabSheet
      Caption = 'ts1'
      ImageIndex = 3
      object Splitter3: TSplitter
        Left = 249
        Top = 0
        Height = 641
        Beveled = True
        Color = clTeal
        ParentColor = False
      end
      object dbgrUpi: TDBGrid
        Left = 0
        Top = 0
        Width = 249
        Height = 641
        Align = alLeft
        DataSource = dsrcUpi
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = popUpi
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
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 16
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SO'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKLTRF'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOLGNOST'
            Width = 83
            Visible = True
          end>
      end
      object dbgrOtkl1: TDBGrid
        Left = 252
        Top = 0
        Width = 645
        Height = 641
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel9: TPanel
        Left = 0
        Top = 641
        Width = 897
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          897
          28)
        object SpeedButton6: TSpeedButton
          Left = 742
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1083#1100#1096#1077
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
          Spacing = 0
          OnClick = SpeedButton1Click
        end
        object Label9: TLabel
          Left = 0
          Top = 15
          Width = 85
          Height = 13
          Caption = 'LabelCountSelObj'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label11: TLabel
          Left = 0
          Top = 3
          Width = 92
          Height = 13
          Caption = 'LabelCountSelKatP'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object SpeedButton7: TSpeedButton
          Left = 152
          Top = 6
          Width = 16
          Height = 20
          OnClick = SpeedButton7Click
        end
        object BitBtn4: TBitBtn
          Left = 822
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
      end
    end
    object tsVidSum: TTabSheet
      Caption = 'tsVidSum'
      ImageIndex = 1
      DesignSize = (
        897
        669)
      object Label3: TLabel
        Left = 104
        Top = 115
        Width = 195
        Height = 13
        Caption = #1055#1086' '#1082#1072#1082#1086#1084#1091' '#1074#1080#1076#1091' '#1074#1074#1086#1076#1103#1090#1089#1103' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103':'
      end
      object sBtnVidN: TSpeedButton
        Left = 452
        Top = 112
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
      end
      object sBtnSPZ: TSpeedButton
        Left = 452
        Top = 208
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
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
      end
      object Label4: TLabel
        Left = 52
        Top = 133
        Width = 55
        Height = 13
        Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      end
      object Label5: TLabel
        Left = 152
        Top = 133
        Width = 15
        Height = 13
        Caption = #1087#1086':'
      end
      object Label6: TLabel
        Left = 240
        Top = 133
        Width = 35
        Height = 13
        Caption = #1063#1072#1089#1086#1074':'
      end
      object Label2: TLabel
        Left = 272
        Top = 72
        Width = 196
        Height = 13
        Caption = #1047#1072' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1074#1086#1076#1103#1090#1089#1103' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103':'
      end
      object Label7: TLabel
        Left = 304
        Top = 133
        Width = 37
        Height = 13
        Caption = #1057#1091#1084#1084#1072':'
      end
      object Label8: TLabel
        Left = 304
        Top = 166
        Width = 64
        Height = 13
        Caption = '% '#1086#1090' '#1086#1082#1083#1072#1076#1072':'
      end
      object Label10: TLabel
        Left = 417
        Top = 196
        Width = 27
        Height = 13
        Caption = #1064#1055#1047':'
      end
      object Panel2: TPanel
        Left = 0
        Top = 641
        Width = 897
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 0
        DesignSize = (
          897
          28)
        object SpeedButton2: TSpeedButton
          Left = 662
          Top = 2
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
          Spacing = 0
        end
        object SpeedButton4: TSpeedButton
          Left = 742
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1083#1100#1096#1077
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
          Spacing = 0
        end
        object BitBtn2: TBitBtn
          Left = 822
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object DBEdit1: TDBEdit
        Left = 306
        Top = 112
        Width = 47
        Height = 21
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 352
        Top = 112
        Width = 100
        Height = 21
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 304
        Top = 177
        Width = 65
        Height = 21
        TabOrder = 3
      end
      object DBEdit7: TDBEdit
        Left = 411
        Top = 208
        Width = 41
        Height = 21
        TabOrder = 4
      end
      object DateTimePicker2: TDateTimePicker
        Left = 48
        Top = 144
        Width = 81
        Height = 21
        Date = 38086.000000000000000000
        Time = 38086.000000000000000000
        TabOrder = 5
      end
      object DateTimePicker3: TDateTimePicker
        Left = 139
        Top = 144
        Width = 81
        Height = 21
        Date = 38086.000000000000000000
        Time = 38086.000000000000000000
        TabOrder = 6
      end
      object DBEdit3: TDBEdit
        Left = 232
        Top = 144
        Width = 65
        Height = 21
        TabOrder = 7
      end
      object DBComboBox1: TDBComboBox
        Left = 344
        Top = 87
        Width = 124
        Height = 21
        Style = csDropDownList
        DataField = 'MesRus'
        DropDownCount = 10
        ItemHeight = 13
        TabOrder = 8
      end
      object DBEdit4: TDBEdit
        Left = 304
        Top = 144
        Width = 65
        Height = 21
        TabOrder = 9
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 191
        Width = 225
        Height = 193
        TabOrder = 10
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 4
        Top = 413
        Width = 890
        Height = 224
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsrcOtkl
        TabOrder = 11
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DtProc'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMesGod'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdVidN'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtBeg'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtEnd'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Chasu'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SumProc'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PdN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmPrc'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPZ'
            Width = 54
            Visible = True
          end>
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object Splitter1: TSplitter
        Left = 185
        Top = 0
        Height = 641
      end
      object Panel3: TPanel
        Left = 0
        Top = 641
        Width = 897
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel3'
        TabOrder = 0
        DesignSize = (
          897
          28)
        object SpeedButton5: TSpeedButton
          Left = 742
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1083#1100#1096#1077
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
          Spacing = 0
        end
        object SpeedButton3: TSpeedButton
          Left = 662
          Top = 2
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
          Spacing = 0
        end
        object BitBtn3: TBitBtn
          Left = 822
          Top = 2
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1082#1072#1079
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 641
        Align = alLeft
        Caption = 'Panel5'
        TabOrder = 1
        object DBGrid4: TDBGrid
          Left = 1
          Top = 1
          Width = 183
          Height = 364
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object Panel6: TPanel
        Left = 188
        Top = 0
        Width = 709
        Height = 641
        Align = alClient
        Caption = 'Panel6'
        TabOrder = 2
        object DBGrid3: TDBGrid
          Left = 1
          Top = 1
          Width = 552
          Height = 362
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 4
    end
    object tsResult: TTabSheet
      Caption = 'tsResult'
      ImageIndex = 5
    end
  end
  object cdsOtkl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'KdVidN'
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
        Name = 'Chasu'
        DataType = ftFloat
      end
      item
        Name = 'SumProc'
        DataType = ftFloat
      end
      item
        Name = 'PdN'
        DataType = ftSmallint
      end
      item
        Name = 'SmPrc'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPZ'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 452
    Top = 99
    object cdsOtklDtProc: TDateField
      FieldName = 'DtProc'
    end
    object cdsOtklZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      LookupKeyFields = 'MesRus'
      LookupResultField = 'ZaMesGod'
      KeyFields = 'ZaMesGod'
    end
    object cdsOtklKdVidN: TSmallintField
      FieldName = 'KdVidN'
    end
    object cdsOtklDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cdsOtklDtEnd: TDateField
      FieldName = 'DtEnd'
    end
    object cdsOtklChasu: TFloatField
      FieldName = 'Chasu'
    end
    object cdsOtklSumProc: TFloatField
      FieldName = 'SumProc'
    end
    object cdsOtklPdN: TSmallintField
      FieldName = 'PdN'
    end
    object cdsOtklSmPrc: TStringField
      FieldName = 'SmPrc'
      Size = 1
    end
    object cdsOtklSPZ: TStringField
      FieldName = 'SPZ'
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = cdsOtkl
    Left = 464
    Top = 112
  end
  object cdsMmYy: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'MesRus'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 396
    Top = 99
  end
  object dsrcMmYy: TDataSource
    DataSet = cdsMmYy
    Left = 408
    Top = 112
  end
  object cdsObj: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from Z_KdObj'
    Params = <>
    ProviderName = 'dspTmp'
    Left = 60
    Top = 283
  end
  object dsrcKatP: TDataSource
    DataSet = DmMain.qryKatPers_LU
    Left = 48
    Top = 80
  end
  object dsrcObj: TDataSource
    DataSet = cdsObj
    Left = 72
    Top = 296
  end
  object dspTmp: TDataSetProvider
    DataSet = qryTmp
    Options = [poAllowCommandText]
    Left = 188
    Top = 203
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    Left = 156
    Top = 203
  end
  object cdsUpi: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsUpiBeforeOpen
    Left = 148
    Top = 339
    object cdsUpiUPI_NR: TIntegerField
      FieldName = 'UPI_NR'
    end
    object cdsUpiTABN: TIntegerField
      FieldName = 'TABN'
    end
    object cdsUpiID: TStringField
      FieldName = 'ID'
      Size = 10
    end
    object cdsUpiFAM: TStringField
      FieldName = 'FAM'
    end
    object cdsUpiIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsUpiOTCH: TStringField
      FieldName = 'OTCH'
    end
    object cdsUpiDT_PRIEM: TDateTimeField
      FieldName = 'DT_PRIEM'
    end
    object cdsUpiDT_UVOLN: TDateTimeField
      FieldName = 'DT_UVOLN'
    end
    object cdsUpiPRMUV_DT_PRIKAZA: TDateTimeField
      FieldName = 'PRMUV_DT_PRIKAZA'
    end
    object cdsUpiPRMUV_NR_PRIKAZA: TStringField
      FieldName = 'PRMUV_NR_PRIKAZA'
      Size = 10
    end
    object cdsUpiPRMUV_NOTES: TStringField
      FieldName = 'PRMUV_NOTES'
      Size = 35
    end
    object cdsUpiPERE_NR: TIntegerField
      FieldName = 'PERE_NR'
    end
    object cdsUpiDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object cdsUpiKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object cdsUpiKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object cdsUpiSO: TSmallintField
      FieldName = 'SO'
    end
    object cdsUpiOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLTRF'
      DisplayFormat = '#.00'
    end
    object cdsUpiAVANS: TFloatField
      FieldName = 'AVANS'
    end
    object cdsUpiPRCWRKTIME: TFloatField
      FieldName = 'PRCWRKTIME'
    end
    object cdsUpiSP_AV: TStringField
      FieldName = 'SP_AV'
      Size = 1
    end
    object cdsUpiDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Size = 40
    end
    object cdsUpiKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsUpiPR_PENS: TSmallintField
      FieldName = 'PR_PENS'
    end
    object cdsUpiSOVM: TSmallintField
      FieldName = 'SOVM'
    end
    object cdsUpiPDNLG: TSmallintField
      FieldName = 'PDNLG'
    end
    object cdsUpiPROCLG: TFloatField
      FieldName = 'PROCLG'
    end
    object cdsUpiKOLMIN: TSmallintField
      FieldName = 'KOLMIN'
    end
    object cdsUpiPRFS: TSmallintField
      FieldName = 'PRFS'
    end
    object cdsUpiINV: TSmallintField
      FieldName = 'INV'
    end
    object cdsUpiRANG: TSmallintField
      FieldName = 'RANG'
    end
    object cdsUpiRAZR: TSmallintField
      FieldName = 'RAZR'
    end
    object cdsUpiPERE_NR_PRIKAZA: TStringField
      FieldName = 'PERE_NR_PRIKAZA'
      Size = 10
    end
    object cdsUpiPERE_DT_PRIKAZA: TDateTimeField
      FieldName = 'PERE_DT_PRIKAZA'
    end
    object cdsUpiPERE_NOTES: TStringField
      FieldName = 'PERE_NOTES'
      Size = 35
    end
  end
  object dsrcUpi: TDataSource
    DataSet = cdsUpi
    Left = 160
    Top = 352
  end
  object popUpi: TPopupMenu
    Left = 84
    Top = 491
    object popUpiSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1080
      object popUpiSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080', '#1080#1084#1077#1085#1080', '#1086#1090#1095#1077#1089#1090#1074#1091
        OnClick = popUpiSortByFIOClick
      end
      object popUpiSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = popUpiSortByTabNClick
      end
      object popUpiSortByObjFIO: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1078#1076#1077#1083#1077#1085#1080#1077', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popUpiSortByObjFIOClick
      end
    end
    object popUpiFind: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      object popUpiFindByFam: TMenuItem
        Caption = '- '#1092#1072#1084#1080#1083#1080#1103
        OnClick = popUpiFindByFamClick
      end
      object popUpiFindByTabN: TMenuItem
        Caption = '- '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
    end
  end
end
