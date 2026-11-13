object FormKmdNewShTem: TFormKmdNewShTem
  Left = 241
  Top = 201
  Width = 824
  Height = 510
  ActiveControl = dbgrTem
  BorderIcons = [biSystemMenu]
  Caption = 'FormKmdNewShTem'
  Color = clBtnFace
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 510
  Constraints.MinWidth = 745
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
    Left = 454
    Top = 31
    Height = 452
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      816
      31)
    object Label1: TLabel
      Left = 39
      Top = 8
      Width = 141
      Height = 13
      Caption = #1053#1072#1081#1090#1080' '#1090#1077#1084#1091' '#1087#1086' KdTemu:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sBtnGo: TSpeedButton
      Left = 241
      Top = 5
      Width = 25
      Height = 22
      Caption = 'Go!'
      OnClick = sBtnGoClick
    end
    object sBtnDelaj: TSpeedButton
      Left = 488
      Top = 5
      Width = 23
      Height = 22
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        04000000000068010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
        4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
        0000334A23333364A233333F38333333F383333300003366A6333342A2333333
        F383333F3383333300003334A263364AA3333333F338333F3833333300003336
        4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
        8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
        4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
        0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
        F333333383333333000033334AAA2233333333333F3333383333333300003333
        34A223333333333333F333833333333300003333334A443333333333333F3833
        33333333000033333342A63333333333333F33833333333300003333334AA633
        33333333333F3383333333330000333333666333333333333338883333333333
        0000}
      NumGlyphs = 2
      OnClick = sBtnDelajClick
    end
    object bBtnClose: TBitBtn
      Left = 737
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      OnClick = bBtnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object meKdTemu: TMaskEdit
      Left = 184
      Top = 5
      Width = 51
      Height = 21
      EditMask = '!9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 1
      Text = '    '
    end
  end
  object dbgrTem: TDBGrid
    Left = 0
    Top = 31
    Width = 454
    Height = 452
    Align = alLeft
    Color = 8580811
    Constraints.MinWidth = 454
    DataSource = dsrcTem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrTemEnter
    OnExit = dbgrTemExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRP'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDTEMU'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDPSCH'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSCH'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_17'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_17'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARC'
        Width = 5
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SORT'
        Width = 5
        Visible = True
      end>
  end
  object dbgrNU: TDBGrid
    Left = 457
    Top = 31
    Width = 359
    Height = 452
    Align = alClient
    Color = 11139834
    DataSource = dsrcNU
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrNUDblClick
    OnEnter = dbgrTemEnter
    OnExit = dbgrTemExit
    Columns = <
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDTEMU'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Width = 35
        Visible = True
      end>
  end
  object qryTem: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Kd_Temu')
    Left = 64
    Top = 88
    object qryTemNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.KD_TEMU.NR'
    end
    object qryTemGRP: TSmallintField
      FieldName = 'GRP'
      Origin = 'DbMain.KD_TEMU.GRP'
    end
    object qryTemNMSCH: TStringField
      FieldName = 'NMSCH'
      Origin = 'DbMain.KD_TEMU.NMSCH'
      Size = 65
    end
    object qryTemKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.KD_TEMU.KDTEMU'
    end
    object qryTemKDPSCH: TSmallintField
      FieldName = 'KDPSCH'
      Origin = 'DbMain.KD_TEMU.KDPSCH'
    end
    object qryTemSCHBU: TStringField
      FieldName = 'SCHBU'
      Origin = 'DbMain.KD_TEMU.SCHBU'
      Size = 15
    end
    object qryTemSCH_17: TStringField
      FieldName = 'SCH_17'
      Origin = 'DbMain.KD_TEMU.SCH_17'
      Size = 15
    end
    object qryTemPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.KD_TEMU.PSCH'
      Size = 15
    end
    object qryTemAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.KD_TEMU.AINDX'
    end
    object qryTemLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.KD_TEMU.LVL'
    end
    object qryTemPS_17: TStringField
      FieldName = 'PS_17'
      Origin = 'DbMain.KD_TEMU.PS_17'
      Size = 15
    end
    object qryTemHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.KD_TEMU.HSCH'
      Size = 1
    end
    object qryTemARC: TStringField
      FieldName = 'ARC'
      Origin = 'DbMain.KD_TEMU.ARC'
      Size = 1
    end
    object qryTemSORT: TSmallintField
      FieldName = 'SORT'
      Origin = 'DbMain.KD_TEMU.SORT'
    end
  end
  object dsrcTem: TDataSource
    DataSet = qryTem
    Left = 88
    Top = 104
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select PSCH, SchBU, KdSpZ, KdTemu, Count(*) CNT from ViNuMain'
      'where DtProc = '#39'07/1/2017'#39' and'
      'PSCH in ('#39'8011/02-1'#39','#39'8011/02-2'#39','#39'8111/03'#39')'
      'group by PSCH, SchBU, KdSpZ, KdTemu'
      ''
      '')
    Left = 560
    Top = 96
    object qryNUPSCH: TStringField
      FieldName = 'PSCH'
      Size = 15
    end
    object qryNUSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 15
    end
    object qryNUKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryNUKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
    end
    object qryNUCNT: TIntegerField
      FieldName = 'CNT'
    end
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 584
    Top = 112
  end
  object qryTmp: TQuery
    Left = 304
    Top = 184
  end
end
