object FormNichRp_1: TFormNichRp_1
  Left = 260
  Top = 243
  Width = 860
  Height = 485
  BorderIcons = [biSystemMenu]
  Caption = 'FormNichRp_1'
  Color = clBtnFace
  Constraints.MinHeight = 485
  Constraints.MinWidth = 860
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
    Width = 852
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      852
      31)
    object sBtnPrt: TSpeedButton
      Left = 9
      Top = 3
      Width = 75
      Height = 25
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
    object LabelCntRec: TLabel
      Left = 104
      Top = 9
      Width = 74
      Height = 13
      Caption = 'LabelCntRec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bBtnCancel: TBitBtn
      Left = 772
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrRp: TDBGrid
    Left = 0
    Top = 31
    Width = 852
    Height = 427
    Align = alClient
    Color = clBtnFace
    DataSource = dsrcRp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrRpDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSCH'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDTEMU'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMTEMU'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end>
  end
  object qryRp: TQuery
    OnCalcFields = qryRpCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select n.PSCH, n.SchBU, n.KdSpZ, n.NmSch, n.KdTemu, n.NmTemu, '
      ' n.TabN, u.Fam, u.Ima, u.Otch, '
      'n.VidN, n.ShVidN, n.ZaMesGod, n.Summa '
      ' from ViNuMain n '
      '   Left Outer Join z_Upi u on u.TabN = n.TabN'
      ' where DtProc = '#39'07/01/2017'#39' and KdTemu > 0 and '
      ' VidN < "8000" '
      'order by PSCH, SchBU, u.Fam, u.Ima, u.Otch, vidn, zamesgod')
    Left = 40
    Top = 64
    object qryRpPSCH: TStringField
      FieldName = 'PSCH'
      Size = 15
    end
    object qryRpSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 15
    end
    object qryRpKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryRpNMSCH: TStringField
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryRpTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryRpFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qryRpFAM: TStringField
      FieldName = 'FAM'
    end
    object qryRpIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryRpOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryRpVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryRpSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryRpZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryRpSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '# ###.00'
    end
    object qryRpKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
    end
    object qryRpNMTEMU: TStringField
      FieldName = 'NMTEMU'
      Size = 65
    end
  end
  object dsrcRp: TDataSource
    DataSet = qryRp
    Left = 64
    Top = 80
  end
end
