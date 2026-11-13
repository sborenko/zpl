object FormVvObj: TFormVvObj
  Left = 367
  Top = 336
  Width = 473
  Height = 500
  HelpContext = 30
  BorderIcons = [biSystemMenu]
  Caption = 'FormVvObj'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 520
  Constraints.MinHeight = 365
  Constraints.MinWidth = 472
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
  object dbgrObj: TDBGrid
    Left = 0
    Top = 0
    Width = 284
    Height = 431
    Align = alClient
    DataSource = dsrcObj
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrObjDrawColumnCell
    OnDblClick = dbgrObjDblClick
    OnKeyDown = dbgrObjKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Title.Caption = #1050#1086#1076
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMOBJ'
        Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Width = 227
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 457
    Height = 30
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      457
      30)
    object LabelCntSelRec: TLabel
      Left = 6
      Top = 8
      Width = 77
      Height = 13
      Caption = 'LabelCntSelRec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sBtnExec: TSpeedButton
      Left = 284
      Top = 3
      Width = 101
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      OnClick = sBtnExecClick
    end
    object bBtnCancel: TBitBtn
      Left = 388
      Top = 3
      Width = 67
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 284
    Top = 0
    Width = 173
    Height = 431
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = Panel2Resize
    object Panel3: TPanel
      Left = 0
      Top = 13
      Width = 173
      Height = 295
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 7
        Width = 159
        Height = 73
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1080#1083#1080' '#1082#1083#1072#1074#1080#1096#1077#1081'           '#1074#1099#1076#1077#1083#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077 +
          #1085#1080#1103', '#1082#1086#1090#1086#1088#1099#1077' '#1073#1091#1076#1091#1090' '#1074#1082#1083#1102#1095#1077#1085#1099' '#1074' '#1086#1090#1095#1077#1090', '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1099#1087#1086#1083#1085#1080#1090#1100 +
          '" '
        WordWrap = True
      end
      object sBtnF8: TSpeedButton
        Left = 77
        Top = 19
        Width = 23
        Height = 18
        Caption = 'F8'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sBtnF8Click
      end
      object Label2: TLabel
        Left = 8
        Top = 129
        Width = 159
        Height = 57
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1045#1089#1083#1080' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '#1085#1077#1090', '#1086#1090#1095#1077#1090' '#1076#1077#1083#1072#1077#1090#1089#1103' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087 +
          #1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object sBtnSelectAll: TSpeedButton
        Left = 11
        Top = 78
        Width = 155
        Height = 22
        Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sBtnSelectAllClick
      end
      object sBtnUnSelectAll: TSpeedButton
        Left = 11
        Top = 101
        Width = 155
        Height = 22
        Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sBtnUnSelectAllClick
      end
      object LabelFormOtcheta: TLabel
        Left = 14
        Top = 268
        Width = 73
        Height = 13
        Hint = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1086#1090#1095#1077#1090#1085#1086#1081' '#1092#1086#1088#1084#1099' ('#1086#1087#1088#1086#1073#1091#1081#1090#1077' '#1086#1073#1077')'
        Caption = #1060#1086#1088#1084#1072' '#1086#1090#1095#1077#1090#1072
        ParentShowHint = False
        ShowHint = True
      end
      object rBtnForm1: TRadioButton
        Left = 97
        Top = 267
        Width = 30
        Height = 17
        Hint = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1086#1090#1095#1077#1090#1085#1086#1081' '#1092#1086#1088#1084#1099' ('#1086#1087#1088#1086#1073#1091#1081#1090#1077' '#1086#1073#1077')'
        Caption = '1'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object rBtnForm2: TRadioButton
        Left = 132
        Top = 267
        Width = 30
        Height = 17
        Hint = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1086#1090#1095#1077#1090#1085#1086#1081' '#1092#1086#1088#1084#1099' ('#1086#1087#1088#1086#1073#1091#1081#1090#1077' '#1086#1073#1077')'
        Caption = '2'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = True
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 185
        Width = 147
        Height = 76
        Caption = '  '#1042#1080#1076' '#1089#1074#1086#1076#1072'  '
        TabOrder = 2
        Visible = False
        object rBtnByVidN: TRadioButton
          Left = 8
          Top = 16
          Width = 131
          Height = 17
          Caption = '- '#1087#1086' '#1074#1080#1076#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rBtnByVidNClick
        end
        object rBtnBySBU: TRadioButton
          Left = 8
          Top = 34
          Width = 131
          Height = 17
          Caption = '- '#1087#1086' '#1089#1095#1077#1090#1072#1084' '#1073#1091#1093'.'#1091#1095#1077#1090#1072
          Enabled = False
          TabOrder = 1
          OnClick = rBtnByVidNClick
        end
        object rBtnByKatPers: TRadioButton
          Left = 8
          Top = 52
          Width = 131
          Height = 17
          Caption = '- '#1087#1086' '#1082#1072#1090#1077#1075'. '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          TabOrder = 2
          OnClick = rBtnByVidNClick
        end
      end
    end
  end
  object LbxF8: TListBox
    Left = 200
    Top = 64
    Width = 57
    Height = 97
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from NU_Obj_DtProc_2 ('#39'2005/09/01'#39')')
    Left = 16
    Top = 120
  end
  object tblObj: TTable
    DatabaseName = 'Es_Ind'
    TableName = 't_VvObj2.dbf'
    Left = 104
    Top = 152
  end
  object dsrcObj: TDataSource
    DataSet = tblObj
    Left = 120
    Top = 168
  end
end
