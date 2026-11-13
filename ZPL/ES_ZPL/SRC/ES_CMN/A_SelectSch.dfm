object FormShowManySch: TFormShowManySch
  Left = 401
  Top = 311
  Width = 651
  Height = 531
  ActiveControl = dbgrTmp
  BorderIcons = [biSystemMenu]
  Caption = 'FormShowManySch'
  Color = clBtnFace
  Constraints.MaxWidth = 900
  Constraints.MinHeight = 350
  Constraints.MinWidth = 615
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
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 31
    Width = 635
    Height = 461
    Align = alClient
    Color = clCream
    DataSource = dsrcTmp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrTmpDrawColumnCell
    OnDblClick = dbgrTmpDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'kdSch'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sch_17'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NmSch'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      635
      31)
    object LabelCntRec: TLabel
      Left = 5
      Top = 2
      Width = 132
      Height = 27
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1053#1072#1081#1076#1077#1085#1086' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1079#1072#1087#1080#1089#1077#1081' - '#1074#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1085#1091
      WordWrap = True
    end
    object LabelMsg: TLabel
      Left = 149
      Top = 2
      Width = 292
      Height = 27
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = 
        '"'#1046#1080#1088#1085#1099#1084'" '#1096#1088#1080#1092#1090#1086#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1087#1088#1080#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077' '#1074' '#1089#1087#1080#1089#1082#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094 +
        #1072'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object bBtnOk: TBitBtn
      Left = 480
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 564
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dsrcTmp: TDataSource
    Left = 32
    Top = 72
  end
  object pop: TPopupMenu
    Left = 120
    Top = 280
    object popHead: TMenuItem
      Caption = '==  '#1053#1072#1089#1090#1088#1086#1081#1082#1072'  =='
      Enabled = False
    end
    object popSetFont: TMenuItem
      Caption = '- '#1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1096#1088#1080#1092#1090#1072
      OnClick = popSetFontClick
    end
    object popSetFon: TMenuItem
      Caption = '- '#1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1086#1085#1072' '#1090#1072#1073#1083#1080#1094#1099
      OnClick = popSetFonClick
    end
  end
end
