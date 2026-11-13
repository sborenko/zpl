object FormObjGoTo: TFormObjGoTo
  Left = 362
  Top = 145
  Width = 500
  Height = 508
  BorderIcons = [biSystemMenu]
  Caption = 'FormObjGoTo'
  Color = clBtnFace
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 350
  Constraints.MinWidth = 380
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    492
    481)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelInf: TLabel
    Left = 23
    Top = 0
    Width = 442
    Height = 34
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 
      #1042#1099' '#1084#1086#1078#1077#1090#1077' '#1087#1077#1088#1077#1085#1077#1089#1090#1080' '#1089#1095#1077#1090'  cNmCurItem '#1074#1085#1091#1090#1088#1100' '#1086#1076#1085#1086#1075#1086' '#1080#1079' '#1089#1083#1077#1076#1091#1102#1097#1080#1093' ' +
      #1089#1095#1077#1090#1086#1074
    Transparent = True
    WordWrap = True
  end
  object Label1: TLabel
    Left = 23
    Top = 28
    Width = 442
    Height = 32
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 
      #1042#1099#1073#1077#1088#1080#1090#1077', '#1082#1091#1076#1072' '#1042#1072#1084' '#1085#1072#1076#1086', '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1074#1086#1076'" '#1080#1083#1080' '#1089#1076#1077#1083#1072#1081#1090#1077' '#1076#1074 +
      #1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1082#1086#1081' '#1085#1072' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1089#1090#1088#1086#1082#1077' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object dbgrTV: TDBGrid
    Left = 2
    Top = 58
    Width = 488
    Height = 394
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clCream
    DataSource = dsrcTV
    Options = [dgTitles, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrTVDrawColumnCell
    OnDblClick = dbgrTVDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TreeFld'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHOBJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMOBJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AINDX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PINDX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LVL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INDX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HSCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDUPOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KASSA'
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 336
    Top = 455
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 416
    Top = 455
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object qryTV: TQuery
    OnCalcFields = qryTVCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_KdObj '
      '  order by AIndx, Lvl, PIndx')
    Left = 40
    Top = 192
    object qryTVNR: TIntegerField
      FieldName = 'NR'
    end
    object qryTVKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qryTVSHOBJ: TStringField
      FieldName = 'SHOBJ'
      Size = 15
    end
    object qryTVNMOBJ: TStringField
      FieldName = 'NMOBJ'
      Size = 65
    end
    object qryTVAINDX: TSmallintField
      FieldName = 'AINDX'
    end
    object qryTVPINDX: TSmallintField
      FieldName = 'PINDX'
    end
    object qryTVLVL: TSmallintField
      FieldName = 'LVL'
    end
    object qryTVINDX: TSmallintField
      FieldName = 'INDX'
    end
    object qryTVHSCH: TStringField
      FieldName = 'HSCH'
      FixedChar = True
      Size = 1
    end
    object qryTVKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryTVKDUPOS: TSmallintField
      FieldName = 'KDUPOS'
    end
    object qryTVKASSA: TSmallintField
      FieldName = 'KASSA'
    end
    object qryTVFIOUPOLN: TStringField
      FieldName = 'FIOUPOLN'
      Size = 25
    end
    object qryTVTreeFld: TStringField
      FieldKind = fkCalculated
      FieldName = 'TreeFld'
      Size = 65
      Calculated = True
    end
  end
  object dsrcTV: TDataSource
    DataSet = qryTV
    Left = 56
    Top = 208
  end
end
