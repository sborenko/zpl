object FormFFIndx: TFormFFIndx
  Left = 393
  Top = 315
  Width = 595
  Height = 455
  ActiveControl = dbgrOtkl
  BorderIcons = [biSystemMenu]
  Caption = 'FormFFIndx'
  Color = clBtnFace
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 455
  Constraints.MinWidth = 595
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
    Width = 587
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      587
      31)
    object sBtnGo: TSpeedButton
      Left = 170
      Top = 3
      Width = 83
      Height = 25
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1094#1077#1076#1091#1088#1091' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' !'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnGoClick
    end
    object LabelCntRec: TLabel
      Left = 89
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnResult: TSpeedButton
      Left = 296
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnResultClick
    end
    object bBtnClose: TBitBtn
      Left = 509
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcOtkl
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrOtkl: TDBGrid
    Left = 0
    Top = 31
    Width = 587
    Height = 397
    Align = alClient
    Color = 12184829
    DataSource = dsrcOtkl
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrOtklEnter
    OnExit = dbgrOtklExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end>
  end
  object qryOtkl: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select distinct o.TabN, u.Fam, u.Ima, u.Otch, o.ZaMesGod, o.Summ' +
        'a'
      'from Z_Otkl o'
      'Left Outer Join Z_Upi u on u.TabN = o.TabN'
      'where o.DtProc = "10/01/2012" and o.VidN = "1620"')
    Left = 80
    Top = 80
    object qryOtklTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryOtklFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object qryOtklIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object qryOtklOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1103#1094
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 88
    Top = 88
  end
  object qryAdd: TQuery
    Left = 152
    Top = 80
  end
  object qryTmp: TQuery
    Left = 200
    Top = 80
  end
  object qryPrmUv: TQuery
    Left = 248
    Top = 80
  end
end
