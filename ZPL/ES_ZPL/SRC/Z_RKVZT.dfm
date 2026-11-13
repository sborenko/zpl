object FormZpRkvzt: TFormZpRkvzt
  Left = 461
  Top = 246
  BorderStyle = bsDialog
  Caption = 'FormZpRkvzt'
  ClientHeight = 305
  ClientWidth = 360
  Color = clBtnFace
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
  object BitBtn1: TBitBtn
    Left = 281
    Top = 278
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    Kind = bkOK
    Spacing = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 360
    Height = 278
    ActivePage = TabSheet1
    Align = alTop
    Style = tsButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Bevel1: TBevel
        Left = 81
        Top = 46
        Width = 191
        Height = 43
        Shape = bsFrame
      end
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 352
        Height = 247
        Align = alClient
      end
      object Label1: TLabel
        Left = 80
        Top = 149
        Width = 147
        Height = 30
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1074' '#1089#1083#1077#1076#1091'- '#1102#1097#1080#1081' '#1088#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
        WordWrap = True
      end
      object Label3: TLabel
        Left = 95
        Top = 60
        Width = 35
        Height = 13
        Caption = #1084#1077#1089#1103#1094':'
      end
      object Label4: TLabel
        Left = 189
        Top = 60
        Width = 20
        Height = 13
        Caption = #1075#1086#1076':'
      end
      object Label2: TLabel
        Left = 96
        Top = 40
        Width = 158
        Height = 13
        Caption = ' '#1053#1072#1095#1072#1083#1086' '#1088#1072#1073#1086#1090#1099' '#1089' '#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' '
      end
      object GrBoxStru: TGroupBox
        Left = 81
        Top = 92
        Width = 191
        Height = 51
        Caption = ' '#1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '
        TabOrder = 0
        object RBtnOnlyObj: TRadioButton
          Left = 8
          Top = 16
          Width = 177
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RBtnObjVed: TRadioButton
          Left = 8
          Top = 31
          Width = 177
          Height = 17
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080' '#1042#1077#1076#1086#1084#1086#1089#1090#1080
          TabOrder = 1
        end
      end
      object edDayPerehoda: TEdit
        Left = 224
        Top = 152
        Width = 30
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = '11'
      end
      object UpDownDayPerehoda: TUpDown
        Left = 254
        Top = 152
        Width = 15
        Height = 21
        Associate = edDayPerehoda
        Min = 1
        Max = 28
        Position = 11
        TabOrder = 2
      end
      object edMesBegRabotu: TEdit
        Left = 136
        Top = 57
        Width = 27
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = '11'
      end
      object upMesBegRabotu: TUpDown
        Left = 163
        Top = 57
        Width = 15
        Height = 21
        Associate = edMesBegRabotu
        Min = 1
        Max = 12
        Position = 11
        TabOrder = 4
      end
      object edGodBegRabotu: TEdit
        Left = 213
        Top = 57
        Width = 36
        Height = 21
        ReadOnly = True
        TabOrder = 5
        Text = '2002'
      end
      object upGodBegRabotu: TUpDown
        Left = 249
        Top = 57
        Width = 16
        Height = 21
        Associate = edGodBegRabotu
        Min = 2000
        Max = 3000
        Position = 2002
        TabOrder = 6
        Thousands = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 352
        Height = 247
        Align = alClient
      end
      object Label5: TLabel
        Left = 9
        Top = 6
        Width = 173
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1088#1084#1099' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object Label6: TLabel
        Left = 9
        Top = 39
        Width = 265
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object Label7: TLabel
        Left = 9
        Top = 72
        Width = 231
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object Label8: TLabel
        Left = 9
        Top = 105
        Width = 291
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080' '#1075#1083'. ('#1089#1090'.) '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object Label9: TLabel
        Left = 9
        Top = 138
        Width = 257
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1075#1083'. ('#1089#1090'.) '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object Label10: TLabel
        Left = 9
        Top = 171
        Width = 251
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object Label11: TLabel
        Left = 9
        Top = 204
        Width = 217
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object edFirma: TEdit
        Left = 39
        Top = 19
        Width = 305
        Height = 21
        MaxLength = 35
        TabOrder = 0
        Text = 'edFirma'
        OnEnter = edEnter
        OnExit = edExit
      end
      object edDirDolgn: TEdit
        Left = 39
        Top = 52
        Width = 305
        Height = 21
        MaxLength = 35
        TabOrder = 1
        Text = 'edDirDolgn'
        OnEnter = edEnter
        OnExit = edExit
      end
      object edDirFIO: TEdit
        Left = 39
        Top = 85
        Width = 305
        Height = 21
        MaxLength = 35
        TabOrder = 2
        Text = 'edDirFIO'
        OnEnter = edEnter
        OnExit = edExit
      end
      object edGlBuhDolgn: TEdit
        Left = 39
        Top = 118
        Width = 305
        Height = 21
        MaxLength = 35
        TabOrder = 3
        Text = 'edGlBuhDolgn'
        OnEnter = edEnter
        OnExit = edExit
      end
      object edGlBuhFIO: TEdit
        Left = 39
        Top = 151
        Width = 305
        Height = 21
        MaxLength = 35
        TabOrder = 4
        Text = 'edGlBuhFIO'
        OnEnter = edEnter
        OnExit = edExit
      end
      object edBuhDolgn: TEdit
        Left = 39
        Top = 184
        Width = 305
        Height = 21
        MaxLength = 35
        TabOrder = 5
        Text = 'edBuhDolgn'
        OnEnter = edEnter
        OnExit = edExit
      end
      object edBuhFIO: TEdit
        Left = 39
        Top = 217
        Width = 305
        Height = 21
        MaxLength = 35
        TabOrder = 6
        Text = 'edBuhFIO'
        OnEnter = edEnter
        OnExit = edExit
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object Label12: TLabel
        Left = 62
        Top = 34
        Width = 196
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082' '#1085#1072' '#1083#1080#1089#1090#1077' '#1087#1088#1080' '#1087#1077#1095#1072#1090#1080
      end
      object upLstMaxRow: TUpDown
        Left = 297
        Top = 32
        Width = 15
        Height = 21
        Associate = edLstMaxRow
        Min = 45
        Max = 65
        Position = 60
        TabOrder = 0
      end
      object edLstMaxRow: TEdit
        Left = 274
        Top = 32
        Width = 23
        Height = 21
        TabOrder = 1
        Text = '60'
      end
    end
  end
end
