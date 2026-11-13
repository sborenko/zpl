object FormAddTrSoglInNdb: TFormAddTrSoglInNdb
  Left = 72
  Top = 140
  Width = 817
  Height = 488
  ActiveControl = dbgrNdb
  BorderIcons = [biSystemMenu]
  Caption = 'FormAddTrSoglInNdb'
  Color = clBtnFace
  Constraints.MinHeight = 260
  Constraints.MinWidth = 815
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 809
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      809
      31)
    object LabelCntRec: TLabel
      Left = 169
      Top = 2
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
      Transparent = True
    end
    object LabelSortMsg: TLabel
      Left = 265
      Top = 8
      Width = 65
      Height = 13
      Caption = 'LabelSortMsg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sBtnPrt: TSpeedButton
      Left = 562
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
    object sBtnSave: TSpeedButton
      Left = 639
      Top = 3
      Width = 80
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1041#1072#1079#1091' '#1044#1072#1085#1085#1099#1093
      Anchors = [akTop, akRight]
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
      Spacing = 0
      OnClick = sBtnSaveClick
    end
    object sBtnF8: TSpeedButton
      Left = 88
      Top = 3
      Width = 25
      Height = 25
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' / '#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091' '#1089' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      Caption = 'F8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnF8Click
    end
    object sBtnSelAll: TSpeedButton
      Left = 114
      Top = 3
      Width = 25
      Height = 25
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnSelAllClick
    end
    object sBtnUnSelAll: TSpeedButton
      Left = 140
      Top = 3
      Width = 25
      Height = 25
      Hint = #1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1080' '#1089#1086' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081
      Enabled = False
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334994333333333333338338F333333333
        0000333499994333333333333833338F33333333000033499999943333333333
        83333338F3333333000034999A99994333333338F33F33338F33333300003999
        A9A9994333333338F383F3338F33333300003A9A999A999433333338F8333F33
        38F33333000034A99999A99943333338833333F3338F333300004999A9999A99
        9433338F338F333F3338F3330000999A3A9994A99943338F3838F338F3338F33
        0000A9A333A9994A9994338F83338F338F3338F300003A33333A9994A9994338
        333338F338F3338F000033333333A9994A9943333333338F338F338F00003333
        33333A9994A9933333333338F338F83300003333333333A9994A333333333333
        8F338F33000033333333333A999433333333333338F338F30000333333333333
        A994333333333333338F38F300003333333333333A993333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnUnSelAllClick
    end
    object LabelCntSelRec: TLabel
      Left = 169
      Top = 16
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
      Transparent = True
    end
    object bBtnCancel: TBitBtn
      Left = 731
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = bBtnCancelClick
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
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcNdb
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrNdb: TDBGrid
    Left = 0
    Top = 31
    Width = 809
    Height = 430
    Align = alClient
    Color = 11009242
    DataSource = dsrcNdb
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrNdbDrawColumnCell
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    OnKeyDown = dbgrNdbKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShVidN'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtBeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtEnd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtPrBeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NrPrBeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtPrEnd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NrPrEnd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdKatP'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdObj'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdSpZ'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sovm'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notes'
        Visible = True
      end>
  end
  object LbxF8: TListBox
    Left = 48
    Top = 176
    Width = 73
    Height = 145
    BorderStyle = bsNone
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object cdsNdb: TClientDataSet
    Active = True
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
        Name = 'VidN'
        DataType = ftString
        Size = 4
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
        Name = 'DtPrBeg'
        DataType = ftDate
      end
      item
        Name = 'NrPrBeg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtPrEnd'
        DataType = ftDate
      end
      item
        Name = 'NrPrEnd'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 25
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
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Sovm'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'OnKdObjFamIO'
        CaseInsFields = 'FamIO'
        Fields = 'KdObj;FamIO'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'OnFamIO'
        CaseInsFields = 'FamIO'
        Fields = 'FamIO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'OnKdObjFamIO'
    Params = <>
    StoreDefs = True
    Left = 136
    Top = 112
    Data = {
      710100009619E0BD0100000018000000100000000000030000007101024E5204
      0001000200010007535542545950450200490008004175746F696E6300045461
      624E04000100000000000546616D494F01004900000001000557494454480200
      02002D00045669644E0100490000000100055749445448020002000400054474
      4265670400060000000000054474456E64040006000000000007447450724265
      670400060000000000074E725072426567010049000000010005574944544802
      0002000A000744745072456E640400060000000000074E725072456E64010049
      0000000100055749445448020002000A00054E6F746573010049000000010005
      5749445448020002001900064B644B6174500200010000000000054B644F626A
      0200010000000000054B6453705A02000100000000000653685669644E010049
      0000000100055749445448020002000F0004536F766D02000100000000000100
      0C4155544F494E4356414C55450400010001000000}
    object cdsNdbNR: TAutoIncField
      DisplayLabel = #1053#1088
      FieldName = 'NR'
    end
    object cdsNdbTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsNdbFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 45
    end
    object cdsNdbVidN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VidN'
      Size = 4
    end
    object cdsNdbShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1053
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsNdbDtBeg: TDateField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DtBeg'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNdbDtEnd: TDateField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DtEnd'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNdbDtPrBeg: TDateField
      DisplayLabel = #1044#1090#1055#1088#1053#1072#1095
      FieldName = 'DtPrBeg'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNdbNrPrBeg: TStringField
      DisplayLabel = #1053#1088#1055#1088#1053#1072#1095
      FieldName = 'NrPrBeg'
      Size = 10
    end
    object cdsNdbDtPrEnd: TDateField
      DisplayLabel = #1044#1090#1055#1088#1054#1082#1086#1085#1095
      FieldName = 'DtPrEnd'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNdbNrPrEnd: TStringField
      DisplayLabel = #1053#1088#1055#1088#1054#1082#1086#1085#1095
      FieldName = 'NrPrEnd'
      Size = 10
    end
    object cdsNdbKdKatP: TSmallintField
      DisplayLabel = #1050#1076#1050#1072#1090#1055
      FieldName = 'KdKatP'
    end
    object cdsNdbKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsNdbKdSpZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095#1041#1059
      FieldName = 'KdSpZ'
    end
    object cdsNdbNotes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'Notes'
      Size = 25
    end
    object cdsNdbSovm: TSmallintField
      DisplayLabel = #1057#1074#1084
      FieldName = 'Sovm'
    end
  end
  object dsrcNdb: TDataSource
    DataSet = cdsNdb
    Left = 152
    Top = 128
  end
  object qryTmp: TQuery
    Left = 48
    Top = 88
  end
  object pop: TPopupMenu
    Left = 96
    Top = 224
    object popEdtRecs: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1042#1057#1045' '#1079#1072#1087#1080#1089#1080' ...'
      OnClick = popEdtRecsClick
    end
    object popSortHead: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popSortByObjFIO: TMenuItem
        Caption = '- '#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        Checked = True
        OnClick = popSortByObjFIOClick
      end
      object popSortByFIO: TMenuItem
        Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'. '#1054'.'
        OnClick = popSortByFIOClick
      end
    end
  end
  object popSvPrt: TPopupMenu
    Left = 576
    Top = 80
    object popPrtSel: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
      OnClick = popPrtSelClick
    end
    object popPrtUnSel: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1085#1077#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
      OnClick = popPrtUnSelClick
    end
    object popPrtAll: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081
      OnClick = popPrtAllClick
    end
    object popSvSel: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
      OnClick = popSvSelClick
    end
    object popSvUnSel: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1085#1077#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
      OnClick = popSvUnSelClick
    end
    object popSvAll: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081
      OnClick = popSvAllClick
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end
      item
        Name = 'DtPrBeg'
        DataType = ftDate
      end
      item
        Name = 'DtPrEnd'
        DataType = ftDate
      end
      item
        Name = 'NrPrBeg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrPrEnd'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'EDtBeg'
        DataType = ftBoolean
      end
      item
        Name = 'EDtEnd'
        DataType = ftBoolean
      end
      item
        Name = 'EDtPrBeg'
        DataType = ftBoolean
      end
      item
        Name = 'EDtPrEnd'
        DataType = ftBoolean
      end
      item
        Name = 'ENrPrBeg'
        DataType = ftBoolean
      end
      item
        Name = 'ENrPrEnd'
        DataType = ftBoolean
      end
      item
        Name = 'ENotes'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 232
    Top = 224
    object cdsTmpDtBeg: TDateField
      FieldName = 'DtBeg'
      OnSetText = cdsTmpDtBegSetText
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtEnd: TDateField
      FieldName = 'DtEnd'
      OnSetText = cdsTmpDtBegSetText
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtPrBeg: TDateField
      FieldName = 'DtPrBeg'
      OnSetText = cdsTmpDtBegSetText
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtPrEnd: TDateField
      FieldName = 'DtPrEnd'
      OnSetText = cdsTmpDtBegSetText
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpNrPrBeg: TStringField
      FieldName = 'NrPrBeg'
      Size = 10
    end
    object cdsTmpNrPrEnd: TStringField
      FieldName = 'NrPrEnd'
      Size = 10
    end
    object cdsTmpNotes: TStringField
      FieldName = 'Notes'
      Size = 25
    end
    object cdsTmpEDtBeg: TBooleanField
      FieldName = 'EDtBeg'
    end
    object cdsTmpEDtEnd: TBooleanField
      FieldName = 'EDtEnd'
    end
    object cdsTmpEDtPrBeg: TBooleanField
      FieldName = 'EDtPrBeg'
    end
    object cdsTmpEDtPrEnd: TBooleanField
      FieldName = 'EDtPrEnd'
    end
    object cdsTmpENrPrBeg: TBooleanField
      FieldName = 'ENrPrBeg'
    end
    object cdsTmpENrPrEnd: TBooleanField
      FieldName = 'ENrPrEnd'
    end
    object cdsTmpENotes: TBooleanField
      FieldName = 'ENotes'
    end
  end
end
