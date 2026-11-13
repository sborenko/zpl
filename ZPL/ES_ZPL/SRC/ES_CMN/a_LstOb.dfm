object FormNaborOb: TFormNaborOb
  Left = 408
  Top = 268
  Width = 420
  Height = 440
  ActiveControl = dbgrOb
  BorderIcons = [biSystemMenu]
  Caption = 'FormNaborOb'
  Color = clBtnFace
  Constraints.MaxHeight = 675
  Constraints.MaxWidth = 590
  Constraints.MinHeight = 350
  Constraints.MinWidth = 420
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
    Top = 382
    Width = 412
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      412
      31)
    object Label1: TLabel
      Left = 3
      Top = 2
      Width = 291
      Height = 28
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        #1042#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082' '#1080#1083#1080' '#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1086#1073#1097#1077#1078#1080#1090#1080#1077' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103 +
        ' '#1084#1086#1078#1085#1086' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object bBtnCancel: TBitBtn
      Left = 335
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
  object dbgrOb: TDBGrid
    Left = 0
    Top = 0
    Width = 412
    Height = 382
    Align = alClient
    Color = clSkyBlue
    DataSource = dsrcOb
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
    OnDrawColumnCell = dbgrObDrawColumnCell
    OnDblClick = dbgrObDblClick
    OnEnter = dbgrObEnter
    OnExit = dbgrObExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KDOB'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMOB'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 198
        Visible = True
      end>
  end
  object LbxKdOb: TListBox
    Left = 192
    Top = 72
    Width = 89
    Height = 153
    Color = clBtnFace
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 2
    Visible = False
  end
  object qryOb: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select uo.KdUsr, ob.* from sg_KdOb ob'
      '  Left Outer Join sg_UsrOb uo on uo.KdOb = ob.KdOb'
      'order by KdOb')
    Left = 88
    Top = 104
    object qryObKDUSR: TSmallintField
      DisplayLabel = #1050#1076#1070#1079#1088
      FieldName = 'KDUSR'
    end
    object qryObNR: TIntegerField
      FieldName = 'NR'
    end
    object qryObKDOB: TSmallintField
      DisplayLabel = #1050#1076#1054#1073#1097#1078
      FieldName = 'KDOB'
    end
    object qryObNMOB: TStringField
      DisplayLabel = #1054#1073#1097#1077#1078#1080#1090#1080#1077
      FieldName = 'NMOB'
      FixedChar = True
      Size = 35
    end
    object qryObNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Size = 65
    end
  end
  object dsrcOb: TDataSource
    DataSet = qryOb
    Left = 104
    Top = 112
  end
end
