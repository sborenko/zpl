object FormVedZp: TFormVedZp
  Left = 254
  Top = 354
  Width = 611
  Height = 395
  Caption = 'FormVedZp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    603
    368)
  PixelsPerInch = 96
  TextHeight = 13
  object sBtnPrt: TSpeedButton
    Left = 410
    Top = 340
    Width = 96
    Height = 27
    Anchors = [akRight, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100
    OnClick = sBtnPrtClick
  end
  object dbgrVed: TDBGrid
    Left = 0
    Top = 0
    Width = 603
    Height = 338
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcVed
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object bBtnCancel: TBitBtn
    Left = 512
    Top = 340
    Width = 90
    Height = 27
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkCancel
  end
  object qryVed: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select sps.KdObj, nu.KdSpZ, obj.NmObj, upi.Fam, upi.Ima, upi.Otc' +
        'h, '
      
        '           sps.TabN, cast(Sum(nu.Summa) as numeric(18,2)) as Sum' +
        'ma'
      ' from z_Sps sps, Z_KdObj obj, z_Nu nu, z_Upi upi'
      ' where (sps.KdObj = 1004) and (sps.DtProc = '#39'05/01/2005'#39') and '
      
        '            (nu.DtProc = sps.DtProc) and (upi.TabN = sps.TabN) a' +
        'nd '
      '            (nu.TabN = sps.TabN) and (obj.KdObj = sps.KdObj)'
      
        ' group by sps.KdObj, nu.KdSpZ, obj.NmObj, upi.Fam, upi.Ima, upi.' +
        'Otch, '
      '                sps.TabN'
      ' order by sps.KdObj, upi.Fam, upi.Ima, upi.Otch, nu.KdSpZ')
    Left = 72
    Top = 56
    object qryVedKDOBJ: TSmallintField
      DisplayWidth = 7
      FieldName = 'KDOBJ'
    end
    object qryVedKDSPZ: TSmallintField
      DisplayWidth = 7
      FieldName = 'KDSPZ'
    end
    object qryVedNMOBJ: TStringField
      DisplayWidth = 17
      FieldName = 'NMOBJ'
      Size = 65
    end
    object qryVedTABN: TIntegerField
      DisplayWidth = 8
      FieldName = 'TABN'
    end
    object qryVedFAM: TStringField
      DisplayWidth = 18
      FieldName = 'FAM'
    end
    object qryVedIMA: TStringField
      DisplayWidth = 16
      FieldName = 'IMA'
      Size = 15
    end
    object qryVedOTCH: TStringField
      DisplayWidth = 16
      FieldName = 'OTCH'
    end
    object qryVedSUMMA: TBCDField
      DisplayWidth = 15
      FieldName = 'SUMMA'
      Precision = 15
      Size = 2
    end
  end
  object dsrcVed: TDataSource
    DataSet = qryVed
    Left = 88
    Top = 72
  end
end
