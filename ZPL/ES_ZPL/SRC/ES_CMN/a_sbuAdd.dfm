object FormSbuAdd: TFormSbuAdd
  Left = 346
  Top = 272
  Width = 708
  Height = 586
  BorderIcons = [biSystemMenu]
  Caption = 'FormSbuAdd'
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
    Width = 700
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      700
      31)
    object BitBtn1: TBitBtn
      Left = 622
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
  end
  object dbgrSch: TDBGrid
    Left = 0
    Top = 31
    Width = 700
    Height = 528
    Align = alClient
    DataSource = dsrcSch
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtBeg'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdSch'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SchBU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OldNmSch'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewNmSch'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notes'
        Width = 73
        Visible = True
      end>
  end
  object cdsSch: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'KdSch'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OldNmSch'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'NewNmSch'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 136
    Data = {
      DA0000009619E0BD010000001800000007000000000003000000DA00024E5204
      0001000200010007535542545950450200490008004175746F696E6300054474
      4265670400060000000000054B64536368020001000000000005536368425501
      00490000000100055749445448020002000A00084F6C644E6D53636801004900
      00000100055749445448020002004100084E65774E6D53636801004900000001
      00055749445448020002004100054E6F74657301004900000001000557494454
      4802000200230001000C4155544F494E4356414C55450400010001000000}
  end
  object dsrcSch: TDataSource
    DataSet = cdsSch
    Left = 96
    Top = 152
  end
end
