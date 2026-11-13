object FormGetDMY: TFormGetDMY
  Left = 386
  Top = 326
  BorderStyle = bsDialog
  Caption = 'FormGetDMY'
  ClientHeight = 110
  ClientWidth = 284
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
    284
    110)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 284
    Height = 81
    ActivePage = tsDMY2
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = tsButtons
    TabOrder = 0
    object tsY: TTabSheet
      Caption = 'tsY'
      object LabelTs1: TLabel
        Left = 9
        Top = 11
        Width = 184
        Height = 41
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LabelTs1'
        WordWrap = True
      end
      object UpDownTsY: TUpDown
        Left = 259
        Top = 24
        Width = 15
        Height = 24
        Associate = MaskEdit1
        TabOrder = 0
        Thousands = False
      end
      object MaskEdit1: TMaskEdit
        Left = 216
        Top = 24
        Width = 43
        Height = 24
        EditMask = '!9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '   0'
      end
    end
    object tsMY: TTabSheet
      Caption = 'tsMY'
      ImageIndex = 1
    end
    object tsDMY: TTabSheet
      Caption = 'tsDMY'
      ImageIndex = 2
    end
    object tsY2: TTabSheet
      Caption = 'tsY2'
      ImageIndex = 3
      object DBEdit1: TDBEdit
        Left = 194
        Top = -2
        Width = 61
        Height = 21
        DataField = 'Year1'
        TabOrder = 0
      end
      object UpDown1: TUpDown
        Left = 251
        Top = -2
        Width = 16
        Height = 21
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 194
        Top = 23
        Width = 61
        Height = 21
        DataField = 'Year2'
        TabOrder = 2
      end
      object UpDown2: TUpDown
        Left = 251
        Top = 23
        Width = 16
        Height = 21
        TabOrder = 3
      end
    end
    object tsMY2: TTabSheet
      Caption = 'tsMY2'
      ImageIndex = 4
    end
    object tsDMY2: TTabSheet
      Caption = 'tsDMY2'
      ImageIndex = 5
      object DBEdit4: TDBEdit
        Left = 152
        Top = 48
        Width = 85
        Height = 21
        DataField = 'Date2'
        TabOrder = 0
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 130
    Top = 85
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 209
    Top = 85
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Year1'
        DataType = ftSmallint
      end
      item
        Name = 'Year2'
        DataType = ftSmallint
      end
      item
        Name = 'Date1'
        DataType = ftDate
      end
      item
        Name = 'Date2'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 12
    Top = 35
    object cdsTmpYear1: TSmallintField
      FieldName = 'Year1'
    end
    object cdsTmpYear2: TSmallintField
      FieldName = 'Year2'
    end
    object cdsTmpDate1: TDateField
      FieldName = 'Date1'
    end
    object cdsTmpDate2: TDateField
      FieldName = 'Date2'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsTmp
    Left = 32
    Top = 48
  end
end
