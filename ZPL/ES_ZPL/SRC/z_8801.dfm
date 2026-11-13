object FrmAddRecalc: TFrmAddRecalc
  Left = 428
  Top = 275
  Width = 559
  Height = 488
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1077#1088#1077#1089#1095#1105#1090#1085#1086#1075#1086' '#1074#1080#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DbgrSps: TDBGrid
    Left = 0
    Top = 258
    Width = 551
    Height = 203
    Align = alClient
    DataSource = DsrcSps
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 31
    Align = alTop
    TabOrder = 1
    DesignSize = (
      551
      31)
    object BtnGo: TBitBtn
      Left = 392
      Top = 3
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'G o !!!'
      TabOrder = 0
      OnClick = BtnGoClick
      Kind = bkOK
    end
    object BtnCancel: TBitBtn
      Left = 473
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object PanelTask: TPanel
    Left = 0
    Top = 31
    Width = 551
    Height = 227
    Align = alTop
    TabOrder = 2
    DesignSize = (
      551
      227)
    object LblVidN: TLabel
      Left = 8
      Top = 8
      Width = 19
      Height = 13
      Caption = #1042#1080#1076
    end
    object MemoList: TMemo
      Left = 119
      Top = 123
      Width = 425
      Height = 102
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
    object RadioAll: TRadioButton
      Left = 8
      Top = 75
      Width = 107
      Height = 17
      Caption = #1042#1089#1077#1084
      TabOrder = 1
    end
    object RadioDept: TRadioButton
      Left = 8
      Top = 99
      Width = 107
      Height = 17
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1102
      TabOrder = 2
    end
    object RadioList: TRadioButton
      Left = 8
      Top = 123
      Width = 107
      Height = 17
      Caption = #1057#1087#1080#1089#1082#1091
      TabOrder = 3
    end
    object EdtDeptId: TEdit
      Left = 120
      Top = 99
      Width = 121
      Height = 21
      TabOrder = 4
      OnExit = EdtDeptIdExit
    end
    object EdtDeptNm: TEdit
      Left = 256
      Top = 99
      Width = 288
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
    end
    object EdtVidN: TEdit
      Left = 40
      Top = 5
      Width = 97
      Height = 21
      TabOrder = 6
      OnExit = EdtVidNExit
    end
    object EdtVidNNm: TEdit
      Left = 151
      Top = 5
      Width = 393
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Enabled = False
      TabOrder = 7
    end
    object GrBxSpan: TGroupBox
      Left = 8
      Top = 32
      Width = 537
      Height = 38
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1055#1077#1088#1080#1086#1076' '
      TabOrder = 8
      object LblFrom: TLabel
        Left = 88
        Top = 14
        Width = 9
        Height = 13
        Caption = #1089':'
      end
      object LblTo: TLabel
        Left = 216
        Top = 14
        Width = 15
        Height = 13
        Caption = #1087#1086':'
      end
      object EdtDtBeg: TEdit
        Left = 112
        Top = 11
        Width = 89
        Height = 21
        TabOrder = 0
      end
      object EdtDtEnd: TEdit
        Left = 248
        Top = 11
        Width = 89
        Height = 21
        TabOrder = 1
      end
    end
  end
  object QrySps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct TabN from z_Sps '
      'where dtProc = '#39'07/01/2007'#39' ')
    Left = 408
    Top = 208
  end
  object DsrcSps: TDataSource
    DataSet = QrySps
    Left = 424
    Top = 224
  end
  object QryDel: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Insert into z_Otkl (TabN, KdSps, DtProc, ZaMesGod, VidN) values'
      
        '                             (:nTabN, :nKdSps, :dDtProc, :dZaMes' +
        'God, :cVidN)')
    Left = 416
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nTabN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nKdSps'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dDtProc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dZaMesGod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cVidN'
        ParamType = ptUnknown
      end>
  end
  object QryIns: TQuery
    Left = 416
    Top = 304
  end
  object QryPeek: TQuery
    Left = 424
    Top = 344
  end
end
