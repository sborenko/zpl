object FormPrtAlm: TFormPrtAlm
  Left = 5
  Top = 4
  Width = 762
  Height = 598
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'FormPrtAlm'
  Color = clBtnFace
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
  object Splitter1: TSplitter
    Left = 0
    Top = 277
    Width = 754
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      754
      31)
    object Label1: TLabel
      Left = 88
      Top = 10
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object sBtnPrt2: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = sBtnPrt2Click
    end
    object Label2: TLabel
      Left = 392
      Top = 10
      Width = 247
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1074' '#1088#1077#1078#1080#1084#1077' '#1086#1090#1083#1072#1076#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object bBtnExit: TBitBtn
      Left = 676
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkClose
    end
  end
  object dbgrNU: TDBGrid
    Left = 0
    Top = 31
    Width = 754
    Height = 246
    Align = alTop
    DataSource = dsrcNU
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object LbxVedType: TListBox
    Left = 152
    Top = 48
    Width = 65
    Height = 57
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object dbgrAlm: TDBGrid
    Left = 0
    Top = 280
    Width = 754
    Height = 284
    Align = alClient
    DataSource = dsrcAlm
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSch'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdPst'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kuda'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Komu'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPerevoda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmPSB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmNDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmBezNDS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SpecNR'
        Visible = True
      end>
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_NU'
      'where DtProc = '#39'09/01/2005'#39' and VidN in ("6601", "6602")')
    Left = 96
    Top = 112
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 112
    Top = 128
  end
  object qryTmp: TQuery
    Left = 96
    Top = 56
  end
  object cdsAlm: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdPst'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'Kuda'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Komu'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'SmPerevoda'
        DataType = ftFloat
      end
      item
        Name = 'SmPSB'
        DataType = ftFloat
      end
      item
        Name = 'SmNDS'
        DataType = ftFloat
      end
      item
        Name = 'SmBezNDS'
        DataType = ftFloat
      end
      item
        Name = 'SpecNR'
        DataType = ftInteger
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Is_Pst'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 112
    Top = 368
    object cdsAlmNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsAlmKdPst: TSmallintField
      FieldName = 'KdPst'
    end
    object cdsAlmTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsAlmKuda: TStringField
      FieldName = 'Kuda'
      Size = 200
    end
    object cdsAlmKomu: TStringField
      FieldName = 'Komu'
      Size = 150
    end
    object cdsAlmSmPerevoda: TFloatField
      FieldName = 'SmPerevoda'
      DisplayFormat = '#.00'
    end
    object cdsAlmSmPSB: TFloatField
      FieldName = 'SmPSB'
      DisplayFormat = '#.00'
    end
    object cdsAlmSmNDS: TFloatField
      FieldName = 'SmNDS'
      DisplayFormat = '#.00'
    end
    object cdsAlmSmBezNDS: TFloatField
      FieldName = 'SmBezNDS'
      DisplayFormat = '#.00'
    end
    object cdsAlmSpecNR: TIntegerField
      FieldName = 'SpecNR'
    end
    object cdsAlmPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsAlmIsPst: TStringField
      FieldName = 'Is_Pst'
      Size = 1
    end
  end
  object dsrcAlm: TDataSource
    DataSet = cdsAlm
    Left = 128
    Top = 384
  end
end
