object FormFssTvp: TFormFssTvp
  Left = 123
  Top = 237
  Width = 775
  Height = 375
  BorderIcons = [biSystemMenu]
  Caption = 'FormFssTvp'
  Color = clBtnFace
  Constraints.MaxWidth = 900
  Constraints.MinHeight = 330
  Constraints.MinWidth = 775
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      767
      31)
    object LabelCntRec: TLabel
      Left = 81
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnPrt: TSpeedButton
      Left = 608
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' '#1080' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object sBtnTts: TSpeedButton
      Left = 3
      Top = 3
      Width = 75
      Height = 25
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' / '#1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1080#1090#1086#1075#1086#1074
      Caption = #1048#1090#1086#1075#1080
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnTtsClick
    end
    object Label7: TLabel
      Left = 144
      Top = 2
      Width = 385
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1048#1089#1087#1088#1072#1074#1100#1090#1077', '#1075#1076#1077' '#1085#1091#1078#1085#1086', '#1087#1088#1080#1095#1080#1085#1099' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080' '#1080' '#1086#1090#1087#1077#1095#1072#1090#1072#1081#1090#1077' '#1085 +
        #1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' ('#1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1074' '#1041#1044' '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1102#1090#1089#1103').'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object bBtnCancel: TBitBtn
      Left = 689
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 31
    Width = 767
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgrBln: TDBGrid
      Left = 0
      Top = 0
      Width = 767
      Height = 317
      Hint = 
        #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1083#1080#1089#1090#1099' '#1074' '#1086#1090#1095#1077#1090#1085#1086#1084' '#1084#1077#1089#1103#1094#1077'. '#1046#1077#1083#1090#1099#1084' '#1086#1090#1084#1077#1095#1077#1085#1099' '#1083#1080#1089#1090#1082#1080'-'#1087#1088#1086#1076#1086 +
        #1083#1078#1077#1085#1080#1103', '#1077#1089#1083#1080' '#1090#1072#1082#1080#1077' '#1077#1089#1090#1100'.'
      Align = alClient
      Color = 11861218
      DataSource = DsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrBlnDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'TABN'
          ReadOnly = True
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SOVM'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDSPS'
          ReadOnly = True
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FamIO'
          ReadOnly = True
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRLIST'
          ReadOnly = True
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRPREDLIST'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTBEG'
          ReadOnly = True
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNTDAYS'
          ReadOnly = True
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHVIDN'
          ReadOnly = True
          Width = 85
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRICHINA'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          ReadOnly = True
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          ReadOnly = True
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRBLN'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end>
    end
    object PanelTts: TPanel
      Left = 242
      Top = 28
      Width = 305
      Height = 161
      Hint = #1055#1072#1085#1077#1083#1100' '#1080#1090#1086#1075#1086#1074
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clMoneyGreen
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 40
        Width = 112
        Height = 13
        Caption = #1055#1077#1088#1074#1099#1077' 5 '#1076#1085#1077#1081' (2603):'
      end
      object Label2: TLabel
        Left = 12
        Top = 63
        Width = 140
        Height = 13
        Caption = #1054#1073#1097#1080#1077' '#1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103' (2604):'
      end
      object Label3: TLabel
        Left = 12
        Top = 85
        Width = 94
        Height = 13
        Hint = 
          #1055#1086#1076#1089#1095#1080#1090#1099#1074#1072#1102#1090#1089#1103' '#1095#1080#1089#1090#1086' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1077' '#1076#1085#1080' ('#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1090#1072#1073#1083#1080#1094#1099' "'#1085#1077#1089#1090#1072#1085#1076 +
          #1072#1088#1090#1085#1099#1093'" '#1076#1085#1077#1081')'
        Caption = #1044#1077#1082#1088#1077#1090#1085#1099#1077' (2602):'
        ParentShowHint = False
        ShowHint = True
      end
      object Label4: TLabel
        Left = 12
        Top = 106
        Width = 148
        Height = 13
        Caption = #1055#1086' '#1091#1093#1086#1076#1091' '#1079#1072' '#1088#1077#1073#1077#1085#1082#1086#1084' (2601):'
      end
      object Label5: TLabel
        Left = 187
        Top = 16
        Width = 27
        Height = 13
        Caption = #1044#1085#1077#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 258
        Top = 16
        Width = 34
        Height = 13
        Caption = #1057#1091#1084#1084#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object LabelDay2603: TLabel
        Left = 172
        Top = 40
        Width = 42
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelDay2603'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelDay2604: TLabel
        Left = 172
        Top = 63
        Width = 42
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelDay2604'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelDay2602: TLabel
        Left = 172
        Top = 85
        Width = 42
        Height = 13
        Hint = 
          #1055#1086#1076#1089#1095#1080#1090#1099#1074#1072#1102#1090#1089#1103' '#1095#1080#1089#1090#1086' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1077' '#1076#1085#1080' ('#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1090#1072#1073#1083#1080#1094#1099' "'#1085#1077#1089#1090#1072#1085#1076 +
          #1072#1088#1090#1085#1099#1093'" '#1076#1085#1077#1081')'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelDay2602'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object LabelDay2601: TLabel
        Left = 166
        Top = 106
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelDay2601'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelSm2603: TLabel
        Left = 221
        Top = 40
        Width = 76
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelSm2603'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelSm2604: TLabel
        Left = 221
        Top = 63
        Width = 76
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelSm2604'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelSm2602: TLabel
        Left = 221
        Top = 85
        Width = 76
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelSm2602'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelSm2601: TLabel
        Left = 221
        Top = 106
        Width = 76
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelSm2601'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sBtnClose: TSpeedButton
        Left = 224
        Top = 129
        Width = 75
        Height = 25
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1080#1090#1086#1075#1086#1074
        Caption = #1047#1072#1082#1088#1099#1090#1100
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
        OnClick = sBtnTtsClick
      end
      object ChBoxShwOpen: TCheckBox
        Left = 12
        Top = 135
        Width = 193
        Height = 17
        Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1080#1090#1086#1075#1086#1074' '#1089#1088#1072#1079#1091' '#1087#1088#1080' '#1086#1090#1082#1088#1099#1090#1080#1080' '#1092#1086#1088#1084#1099
        Alignment = taLeftJustify
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1088#1080' '#1086#1090#1082#1088#1099#1090#1080#1080' '#1092#1086#1088#1084#1099
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
  end
  object QryVBln: TQuery
    CachedUpdates = True
    OnCalcFields = QryVBlnCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select n.Spec_NR, n.KdSps, b.NrList, b.ListCont,'
      '       b.PredSpec_NR, b2.NrList as NrPredList,'
      '       b.CntDays, b.DtBeg, b.DtEnd, n.TabN, '
      
        '           u.Fam, u.Ima, u.Otch, u.ID, n.VidN, v.ShVidN, n.ZaMes' +
        'God, '
      '           n.Dt_Beg, n.Dt_End, n.Chas, n.Summa, b.PrBln,'
      '           Cast(null as SmallInt) as Prichina from Z_Otkl n'
      '     Left Outer Join z_VBln b on b.Spec_NR = n.Spec_NR'
      '     Left Outer Join z_Upi u on u.TabN = n.Tabn'
      '     Left Outer Join z_KdVidN v on v.VidN = n.VidN'
      '     Left Outer Join z_VBln b2 on b2.Spec_NR = b.PredSpec_NR'
      
        ' where n.DtProc = '#39'05/01/2011'#39' and n.VidN >= '#39'2600'#39' and n.VidN <' +
        ' '#39'2700'#39
      'order by n.TabN, b.DtBeg, b.NrList, n.VidN')
    UpdateObject = UpdVBln
    Left = 88
    Top = 112
    object QryVBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object QryVBlnKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object QryVBlnNRLIST: TStringField
      DisplayLabel = #1041'/'#1083#1080#1089#1090' '#8470
      FieldName = 'NRLIST'
      Size = 15
    end
    object QryVBlnDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
    end
    object QryVBlnCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
    end
    object QryVBlnDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
    end
    object QryVBlnTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object QryVBlnSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084
      FieldName = 'SOVM'
    end
    object QryVBlnFAM: TStringField
      FieldName = 'FAM'
    end
    object QryVBlnIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object QryVBlnOTCH: TStringField
      FieldName = 'OTCH'
    end
    object QryVBlnFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object QryVBlnID: TStringField
      FieldName = 'ID'
      Size = 10
    end
    object QryVBlnVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object QryVBlnSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object QryVBlnSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object QryVBlnPRBLN: TSmallintField
      FieldName = 'PRBLN'
    end
    object QryVBlnPRICHINA: TSmallintField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldName = 'PRICHINA'
    end
    object QryVBlnLISTCONT: TStringField
      FieldName = 'LISTCONT'
      FixedChar = True
      Size = 1
    end
    object QryVBlnPREDSPEC_NR: TIntegerField
      FieldName = 'PREDSPEC_NR'
    end
    object QryVBlnNRPREDLIST: TStringField
      DisplayLabel = #1055#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077' '#1083#1080#1089#1090#1082#1072' '#8470
      FieldName = 'NRPREDLIST'
      Size = 15
    end
    object QryVBlnSTGCMN: TFloatField
      FieldName = 'STGCMN'
    end
    object QryVBlnSTG12: TFloatField
      FieldName = 'STG12'
    end
    object QryVBlnDtz: TDateTimeField
      FieldName = 'Dtz'
    end
    object QryVBlnNrZ: TIntegerField
      FieldName = 'NrZ'
    end
    object QryVBlnSerList: TStringField
      FieldName = 'SerList'
    end
    object QryVBlnProcOpl: TFloatField
      FieldName = 'ProcOpl'
    end
    object QryVBlnDigital: TStringField
      FieldName = 'Digital'
      Size = 1
    end
    object QryVBlnAct_Dt: TDateTimeField
      FieldName = 'Act_Dt'
    end
    object QryVBlnAct_Num: TStringField
      FieldName = 'Act_Num'
    end
  end
  object DsrcVBln: TDataSource
    DataSet = QryVBln
    Left = 104
    Top = 128
  end
  object popPrt: TPopupMenu
    Left = 88
    Top = 64
    object popPrtHead: TMenuItem
      Caption = '= = '#1055' '#1077' '#1095' '#1072' '#1090' '#1100' = ='
      Enabled = False
    end
    object popPrtZajavka: TMenuItem
      Caption = '- '#1079#1072#1103#1074#1082#1080'-'#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
      OnClick = popPrtZajavkaClick
    end
    object PopPrtAppx1: TMenuItem
      Caption = '- '#1076#1086#1076#1072#1090#1086#1082' 1.1.'
      OnClick = PopPrtAppx1Click
    end
    object popPrtPovidom: TMenuItem
      Caption = '- '#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103' '#1087#1088#1086' '#1074#1080#1087#1083#1072#1090#1091' '#1082#1086#1096#1090#1110#1074
      OnClick = popPrtPovidomClick
    end
  end
  object UpdVBln: TUpdateSQL
    Left = 120
    Top = 144
  end
  object qryTmp: TQuery
    Left = 16
    Top = 112
  end
  object qryXML: TQuery
    Left = 16
    Top = 167
  end
  object qryPgr: TQuery
    SQL.Strings = (
      'Select n.*, u.Fam, u.Ima, u.Otch, u.ID from Z_Exp_Fss n'
      '     Left Outer Join z_Upi u on u.TabN = n.Tabn'
      '     where n.DtProc = '#39'12/01/2018'#39
      '     order by n.TabN')
    Left = 16
    Top = 223
  end
  object qryOtkl: TQuery
    Left = 328
    Top = 247
  end
end
