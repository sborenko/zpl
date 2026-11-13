object FormChOtklNU: TFormChOtklNU
  Left = 408
  Top = 211
  Width = 682
  Height = 639
  BorderIcons = [biSystemMenu]
  Caption = 'FormChOtklNU'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      674
      31)
    object BitBtn1: TBitBtn
      Left = 596
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrONu: TDBGrid
    Left = 0
    Top = 31
    Width = 674
    Height = 234
    Align = alTop
    DataSource = dsrcONu
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDOBJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SVNCH'
        Visible = True
      end>
  end
  object qryONu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, s.*'
      'from z_sps s'
      '     Left outer join z_UPI u on u.TabN = s.TabN'
      ' where s.DtProc = '#39'09/01/2008'#39' and'
      
        '                 Exists (Select Tabn from z_Otkl where z_Otkl.Ta' +
        'bN = s.TabN and'
      
        '                                 z_Otkl.DtProc = s.DtProc) and n' +
        'ot'
      
        '                 Exists (Select Tabn from z_NU where z_NU.TabN =' +
        ' s.TabN and'
      '                                 z_NU.DtProc = s.DtProc)')
    Left = 72
    Top = 104
    object qryONuFAM: TStringField
      FieldName = 'FAM'
    end
    object qryONuIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryONuOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryONuFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryONuNR: TIntegerField
      FieldName = 'NR'
    end
    object qryONuKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryONuNCH: TStringField
      FieldName = 'NCH'
      FixedChar = True
      Size = 1
    end
    object qryONuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryONuTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryONuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qryONuKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qryONuNOTES: TStringField
      FieldName = 'NOTES'
      Size = 35
    end
    object qryONuOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object qryONuSVNCH: TStringField
      FieldName = 'SVNCH'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcONu: TDataSource
    DataSet = qryONu
    Left = 88
    Top = 120
  end
end
