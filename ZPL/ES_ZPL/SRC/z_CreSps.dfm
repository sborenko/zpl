object FrmCreMnthList: TFrmCreMnthList
  Left = 355
  Top = 144
  Width = 718
  Height = 505
  Caption = 'FrmCreMnthList'
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
  object dbgrSps: TDBGrid
    Left = 0
    Top = 0
    Width = 710
    Height = 450
    Align = alClient
    DataSource = dsrcSps
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
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
        FieldName = 'KDSPS'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIEM'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_UVOLN'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 45
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 450
    Width = 710
    Height = 28
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      710
      28)
    object sBtnCreSps: TSpeedButton
      Left = 493
      Top = 3
      Width = 128
      Height = 25
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnCreSpsClick
    end
    object bBtnCancel: TBitBtn
      Left = 627
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qrySps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select cast(null as SmallInt) as KdObj, Cast(null as SmallInt) a' +
        's KdKatP,'
      
        '              p.NR as pu_nr, p.TABN, p.KdSps, u.Fam, u.Ima, u.Ot' +
        'ch, u.Pol, u.ID,'
      '                      u.DOB, p.Dt_Priem, p.dt_Uvoln'
      '         from Z_PrmUv p'
      '              Left Outer Join z_Upi u on (u.TabN = p.TabN)'
      '         where (dt_Priem <= '#39'2005/10/31'#39') and'
      
        '                ((Dt_Uvoln is Null) or (Dt_Uvoln >= '#39'2005/10/01'#39 +
        '))'
      '           order by TabN, KdSps, Dt_Priem')
    Left = 72
    Top = 48
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 88
    Top = 56
  end
  object qryIns: TQuery
    DatabaseName = 'DbMain'
    Left = 320
    Top = 64
  end
  object qryOldNU: TQuery
    Left = 176
    Top = 136
  end
  object qryPere: TQuery
    Left = 320
    Top = 112
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    Left = 256
    Top = 64
  end
  object qrySpsAdd: TQuery
    Left = 480
    Top = 64
  end
  object qryCheck: TQuery
    Left = 512
    Top = 64
  end
end
