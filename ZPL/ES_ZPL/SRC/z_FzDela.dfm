object FormFzDela: TFormFzDela
  Left = 333
  Top = 279
  Width = 700
  Height = 533
  BorderIcons = [biSystemMenu]
  Caption = 'FormFzDela'
  Color = clBtnFace
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 345
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
  object Splitter1: TSplitter
    Left = 0
    Top = 411
    Width = 692
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object dbgrFz: TDBGrid
    Left = 0
    Top = 31
    Width = 692
    Height = 380
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcFz
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrFzDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'TabN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmFor'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmSvPrg'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmForFZ'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmFzNado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmFzFakt'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmRazn'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      692
      31)
    object LabelCntFzRec: TLabel
      Left = 11
      Top = 9
      Width = 73
      Height = 13
      Caption = 'LabelCntFzRec'
    end
    object sBtnFilter: TSpeedButton
      Left = 256
      Top = 3
      Width = 75
      Height = 25
      AllowAllUp = True
      GroupIndex = 2
      Caption = #1060#1080#1083#1100#1090#1088
      OnClick = sBtnFilterClick
    end
    object BitBtn1: TBitBtn
      Left = 614
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
    object DBNavigator1: TDBNavigator
      Left = 144
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcFz
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrTts: TDBGrid
    Left = 0
    Top = 414
    Width = 692
    Height = 92
    Align = alBottom
    Color = clInfoBk
    DataSource = dsrcTts
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmmFor'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmmSvPrg'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmmForFz'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmmFzNado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmmFakt'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SmmPerebor'
        Width = 70
        Visible = True
      end>
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select v.Tabn, u.Fam, u.Ima, u.Otch, sum(v.Summa)'
      'from ViNuMain v Left Outer Join Z_Upi u on u.TabN = v.TabN '
      
        'where v.DtProc = '#39'10/01/2009'#39' and v.VidN < '#39'6000'#39' and v.Sp_FZ = ' +
        #39'1'#39
      'group by v.Tabn, u.Fam, u.Ima, u.Otch')
    Left = 144
    Top = 88
  end
  object smtFz: TSQLMemTable
    CurrentVersion = '3.30 '
    StoreDefs = True
    ReadOnly = False
    OnCalcFields = smtFzCalcFields
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SmFor'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrg'
        DataType = ftFloat
      end
      item
        Name = 'SmForFZ'
        DataType = ftFloat
      end
      item
        Name = 'SmFzNado'
        DataType = ftFloat
      end
      item
        Name = 'SmFzFakt'
        DataType = ftFloat
      end
      item
        Name = 'SmRazn'
        DataType = ftFloat
      end>
    TableName = 'Table943671926'
    Exclusive = False
    MemoryTableAllocBy = 1000
    Left = 72
    Top = 144
    object smtFzTabN: TIntegerField
      FieldName = 'TabN'
    end
    object smtFzFam: TStringField
      FieldName = 'Fam'
    end
    object smtFzIma: TStringField
      FieldName = 'Ima'
      Size = 15
    end
    object smtFzOtch: TStringField
      FieldName = 'Otch'
    end
    object smtFzSmFor: TFloatField
      FieldName = 'SmFor'
      DisplayFormat = '#.00'
    end
    object smtFzSmSvPrg: TFloatField
      FieldName = 'SmSvPrg'
      DisplayFormat = '#.00'
    end
    object smtFzSmForFZ: TFloatField
      FieldName = 'SmForFZ'
      DisplayFormat = '#.00'
    end
    object smtFzSmFzNado: TFloatField
      FieldName = 'SmFzNado'
      DisplayFormat = '#.00'
    end
    object smtFzSmFzFakt: TFloatField
      FieldName = 'SmFzFakt'
      DisplayFormat = '#.00'
    end
    object smtFzSmRazn: TFloatField
      FieldName = 'SmRazn'
      DisplayFormat = '#.00'
    end
    object smtFzFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
  end
  object dsrcFz: TDataSource
    DataSet = smtFz
    Left = 88
    Top = 160
  end
  object smqTmp: TSQLMemQuery
    CurrentVersion = '3.30 '
    ReadOnly = False
    Left = 184
    Top = 88
  end
  object dsrcTts: TDataSource
    DataSet = smqTts
    Left = 152
    Top = 272
  end
  object smqTts: TSQLMemQuery
    CurrentVersion = '3.30 '
    ReadOnly = True
    SQL.Strings = (
      'Select Sum(SmFor) as SmmFor, Sum(SmSvPrg) as SmmSvPrg,'
      ' Sum(SmForFz) as SmmForFz, Sum(SmFzNado) as SmmFzNado, '
      ' Sum(SmFzFakt) as SmmFakt, '
      ' Sum(SmFzFakt) - Sum(SmFzNado) as SmmPerebor from Table943671926')
    Left = 136
    Top = 256
    object smqTtsSmmFor: TFloatField
      DisplayWidth = 17
      FieldName = 'SmmFor'
      DisplayFormat = '#.00'
    end
    object smqTtsSmmSvPrg: TFloatField
      DisplayWidth = 12
      FieldName = 'SmmSvPrg'
      DisplayFormat = '#.00'
    end
    object smqTtsSmmForFz: TFloatField
      DisplayWidth = 12
      FieldName = 'SmmForFz'
      DisplayFormat = '#.00'
    end
    object smqTtsSmmFzNado: TFloatField
      DisplayWidth = 12
      FieldName = 'SmmFzNado'
      DisplayFormat = '#.00'
    end
    object smqTtsSmmFakt: TFloatField
      DisplayWidth = 12
      FieldName = 'SmmFakt'
      DisplayFormat = '#.00'
    end
    object smqTtsSmmPerebor: TFloatField
      DisplayWidth = 12
      FieldName = 'SmmPerebor'
      DisplayFormat = '#.00'
    end
  end
end
