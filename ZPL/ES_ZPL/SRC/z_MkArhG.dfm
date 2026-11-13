object FormMkArhG: TFormMkArhG
  Left = 827
  Top = 299
  ActiveControl = dbgrYear
  BorderStyle = bsDialog
  Caption = 'FormMkArhG'
  ClientHeight = 331
  ClientWidth = 311
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 311
    Height = 331
    ActivePage = ts01
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts01: TTabSheet
      Caption = 'ts01'
      DesignSize = (
        303
        300)
      object Label1: TLabel
        Left = 145
        Top = 20
        Width = 148
        Height = 63
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1042#1099#1074#1086#1076#1103#1090#1089#1103' "'#1072#1088#1093#1080#1074#1082#1080'" '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1079#1072' '#1075#1086#1076'. '#1055#1086#1101#1090#1086#1084#1091' '#1087#1088#1086#1094#1077#1076#1091#1088#1072' '#1086 +
          #1095#1077#1085#1100' '#1076#1086#1083#1075#1072#1103' !'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        WordWrap = True
      end
      object Label2: TLabel
        Left = 145
        Top = 88
        Width = 148
        Height = 52
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1075#1086#1076' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1089#1083#1077#1074#1072' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1044#1072#1083#1077#1077 +
          '"'
        WordWrap = True
      end
      object sBtnGo01: TSpeedButton
        Left = 135
        Top = 274
        Width = 75
        Height = 25
        Hint = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Anchors = [akLeft, akBottom]
        Caption = #1044#1072#1083#1077#1077
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
        OnClick = sBtnGo01Click
      end
      object LabelMsg2: TLabel
        Left = 147
        Top = 221
        Width = 144
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'LabelMsg2'
      end
      object LabelMsg1: TLabel
        Left = 150
        Top = 148
        Width = 138
        Height = 66
        Alignment = taCenter
        AutoSize = False
        Caption = 'LabelMsg1'
        WordWrap = True
      end
      object dbgrYear: TDBGrid
        Left = 0
        Top = 0
        Width = 129
        Height = 300
        Align = alLeft
        DataSource = dsrcYears
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbgrYearEnter
        OnExit = dbgrYearExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Title.Caption = #8470
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Year'
            Title.Caption = #1043#1086#1076
            Width = 57
            Visible = True
          end>
      end
      object bBtnCancel01: TBitBtn
        Left = 227
        Top = 274
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1054#1090#1082#1072#1079
        TabOrder = 1
        Kind = bkCancel
      end
      object chBoxLine3: TCheckBox
        Left = 137
        Top = 244
        Width = 166
        Height = 17
        Hint = #1042#1089#1090#1072#1074#1083#1103#1090#1100' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1083#1080#1085#1080#1080' '#1088#1072#1079#1088#1077#1079#1072' '#1089#1090#1088#1072#1085#1080#1094
        Anchors = [akLeft, akBottom]
        Caption = #1051#1080#1085#1080#1080' '#1088#1072#1079#1088#1077#1079#1072' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object ts02: TTabSheet
      Caption = 'ts02'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 303
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          303
          31)
        object sBtnPrt: TSpeedButton
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Caption = #1055#1077#1095#1072#1090#1100
          Visible = False
          OnClick = sBtnPrtClick
        end
        object bBtnCancel: TBitBtn
          Left = 225
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object dbgrUni: TDBGrid
        Left = 0
        Top = 31
        Width = 303
        Height = 269
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object tblUni: TTable
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Sm01'
        DataType = ftFloat
      end
      item
        Name = 'Sm02'
        DataType = ftFloat
      end
      item
        Name = 'Sm03'
        DataType = ftFloat
      end
      item
        Name = 'Sm04'
        DataType = ftFloat
      end
      item
        Name = 'Sm05'
        DataType = ftFloat
      end
      item
        Name = 'Sm06'
        DataType = ftFloat
      end
      item
        Name = 'Sm07'
        DataType = ftFloat
      end
      item
        Name = 'Sm08'
        DataType = ftFloat
      end
      item
        Name = 'Sm09'
        DataType = ftFloat
      end
      item
        Name = 'Sm10'
        DataType = ftFloat
      end
      item
        Name = 'Sm11'
        DataType = ftFloat
      end
      item
        Name = 'Sm12'
        DataType = ftFloat
      end
      item
        Name = 'SmZa01'
        DataType = ftFloat
      end
      item
        Name = 'SmZa02'
        DataType = ftFloat
      end
      item
        Name = 'SmZa03'
        DataType = ftFloat
      end
      item
        Name = 'SmZa04'
        DataType = ftFloat
      end
      item
        Name = 'Smza05'
        DataType = ftFloat
      end
      item
        Name = 'SmZa06'
        DataType = ftFloat
      end
      item
        Name = 'SmZa07'
        DataType = ftFloat
      end
      item
        Name = 'SmZa08'
        DataType = ftFloat
      end
      item
        Name = 'SmZa09'
        DataType = ftFloat
      end
      item
        Name = 'SmZa10'
        DataType = ftFloat
      end
      item
        Name = 'SmZa11'
        DataType = ftFloat
      end
      item
        Name = 'SmZa12'
        DataType = ftFloat
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Dolgnost'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NPp'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'tblUniIndex1'
        Fields = 'NR'
        Options = [ixPrimary]
      end
      item
        Name = 'OnTabNVidN'
        Fields = 'TabN;VidN'
      end
      item
        Name = 'KdObjTabNVidn'
        Fields = 'KdObj;TabN;Vidn'
      end
      item
        Name = 'FioTabNVidN'
        CaseInsFields = 'Fam;Ima;Otch'
        Fields = 'Fam;Ima;Otch;TabN;VidN'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'tbl_Uni'
    TableType = ttParadox
    Left = 32
    Top = 272
  end
  object qryTmp: TQuery
    Left = 24
    Top = 88
  end
  object dsrcUni: TDataSource
    Left = 40
    Top = 288
  end
  object tblYears: TTable
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Year'
        DataType = ftSmallint
      end>
    StoreDefs = True
    TableName = 'tblYear'
    Left = 32
    Top = 200
  end
  object dsrcYears: TDataSource
    DataSet = tblYears
    Left = 40
    Top = 216
  end
  object qryVidN: TQuery
    Left = 64
    Top = 88
  end
  object cdsUni: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Sm01'
        DataType = ftFloat
      end
      item
        Name = 'Sm02'
        DataType = ftFloat
      end
      item
        Name = 'Sm03'
        DataType = ftFloat
      end
      item
        Name = 'Sm04'
        DataType = ftFloat
      end
      item
        Name = 'Sm05'
        DataType = ftFloat
      end
      item
        Name = 'Sm06'
        DataType = ftFloat
      end
      item
        Name = 'Sm07'
        DataType = ftFloat
      end
      item
        Name = 'Sm08'
        DataType = ftFloat
      end
      item
        Name = 'Sm09'
        DataType = ftFloat
      end
      item
        Name = 'Sm10'
        DataType = ftFloat
      end
      item
        Name = 'Sm11'
        DataType = ftFloat
      end
      item
        Name = 'Sm12'
        DataType = ftFloat
      end
      item
        Name = 'SmZa01'
        DataType = ftFloat
      end
      item
        Name = 'SmZa02'
        DataType = ftFloat
      end
      item
        Name = 'SmZa03'
        DataType = ftFloat
      end
      item
        Name = 'SmZa04'
        DataType = ftFloat
      end
      item
        Name = 'SmZa05'
        DataType = ftFloat
      end
      item
        Name = 'SmZa06'
        DataType = ftFloat
      end
      item
        Name = 'SmZa07'
        DataType = ftFloat
      end
      item
        Name = 'SmZa08'
        DataType = ftFloat
      end
      item
        Name = 'SmZa09'
        DataType = ftFloat
      end
      item
        Name = 'SmZa10'
        DataType = ftFloat
      end
      item
        Name = 'SmZa11'
        DataType = ftFloat
      end
      item
        Name = 'SmZa12'
        DataType = ftFloat
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Dolgnost'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NPp'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 84
    Top = 275
  end
end
