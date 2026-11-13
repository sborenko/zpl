object FormPens: TFormPens
  Left = 339
  Top = 136
  Width = 650
  Height = 500
  BorderIcons = [biSystemMenu]
  Caption = 'FormPens'
  Color = clBtnFace
  Constraints.MaxWidth = 765
  Constraints.MinHeight = 500
  Constraints.MinWidth = 650
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
    Width = 642
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      642
      31)
    object LabelCntRec: TLabel
      Left = 16
      Top = 9
      Width = 90
      Height = 16
      Caption = 'LabelCntRec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sBtnPrt: TSpeedButton
      Left = 486
      Top = 3
      Width = 75
      Height = 25
      Hint = #1042#1099#1074#1086#1076' '#1089#1087#1080#1089#1082#1072' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPrtClick
    end
    object bBtnCancel: TBitBtn
      Left = 563
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
      Left = 404
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcP
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object dbgrP: TDBGrid
    Left = 0
    Top = 31
    Width = 642
    Height = 442
    Hint = 
      #1055#1077#1085#1089#1080#1086#1085#1077#1088#1099' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' ('#1074#1099#1076#1077#1083#1077#1085#1099' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1099' - '#1085#1077' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083 +
      #1080').'
    Align = alClient
    Color = clCream
    DataSource = dsrcP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrPDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOLGNOST'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLTRF'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_PENS'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Width = 55
        Visible = True
      end>
  end
  object qryP: TQuery
    OnCalcFields = qryPCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select s.Tabn, u.Fam, u.Ima, u.Otch, p.DT_BEG, p.Dolgnost, '
      
        '           p.OklTrf, p.PR_PENS, p.Sovm, count(s.NR) as CNT, sum(' +
        'n.Summa) as SMM'
      ' from z_sps s'
      '       Left Outer Join ViNuMain n on n.TabN = s.TabN and '
      
        '                   n.DtProc = s.DtProc and n.VidN < '#39'2700'#39' and n' +
        '.Sp_FZ = "1"'
      '       Left outer join Get_Pere(s.TabN, '#39'04/30/2009'#39') p on 1 = 1'
      '       Left Outer join z_Upi u on u.TabN = s.TabN'
      'where s.dtProc = '#39'03/01/2009'#39'  '
      
        'group by s.TabN, u.Fam, u.Ima, u.Otch, p.Dt_Beg, p.Dolgnost, p.O' +
        'klTrf, '
      '              p.Pr_Pens, p.Sovm'
      'having (Pr_Pens > 0)'
      '')
    Left = 96
    Top = 112
    object qryPTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryPFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryPFAM: TStringField
      FieldName = 'FAM'
    end
    object qryPIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryPOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryPDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNOST'
      Size = 40
    end
    object qryPOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryPSMM: TFloatField
      DisplayLabel = #1057#1084#1044#1086#1093#1086#1076#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
    object qryPPR_PENS: TSmallintField
      DisplayLabel = #1055#1077#1085#1089#1080#1086#1085#1077#1088
      FieldName = 'PR_PENS'
    end
    object qryPSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100
      FieldName = 'SOVM'
    end
    object qryPCNT: TIntegerField
      FieldName = 'CNT'
    end
  end
  object dsrcP: TDataSource
    DataSet = qryP
    Left = 112
    Top = 128
  end
end
