object FormUpdVids: TFormUpdVids
  Left = 274
  Top = 142
  Width = 567
  Height = 462
  Caption = 'FormUpdVids'
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
  object Splitter1: TSplitter
    Left = 0
    Top = 199
    Width = 559
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object dbgrVids: TDBGrid
    Left = 0
    Top = 29
    Width = 559
    Height = 170
    Align = alTop
    DataSource = dsrcVids
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDVIDN'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDVIDN'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATVN'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMVIDN'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AINDX'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PINDX'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LVL'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INDX'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HSCH'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOSHOW'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P37'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P200'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZP13'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTPUSKN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOLNIC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPRM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETIG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KUP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DHD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLFND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CBUDG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNDB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPRF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPENS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALIM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNDB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KTS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSOCSTRAH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SBZR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LITTLEHLP'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      559
      29)
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 2
      Width = 84
      Height = 25
      Caption = 'Nadb'
      Enabled = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 89
      Top = 2
      Width = 84
      Height = 25
      Caption = 'Otkl'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 174
      Top = 2
      Width = 84
      Height = 25
      Caption = 'NU'
      OnClick = SpeedButton3Click
    end
    object SpeedButton5: TSpeedButton
      Left = 259
      Top = 2
      Width = 84
      Height = 25
      Caption = 'VBln'
      OnClick = SpeedButton5Click
    end
    object SpeedButton4: TSpeedButton
      Left = 345
      Top = 2
      Width = 84
      Height = 25
      Caption = 'Vids2'
      Enabled = False
      OnClick = SpeedButton4Click
    end
    object bBtnCancel: TBitBtn
      Left = 481
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrRes: TDBGrid
    Left = 0
    Top = 202
    Width = 559
    Height = 233
    Align = alClient
    DataSource = dsrcRes
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qryVids: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KdVidN'
      'order by KdVidN desc')
    Left = 32
    Top = 88
  end
  object dsrcVids: TDataSource
    DataSet = qryVids
    Left = 48
    Top = 104
  end
  object qryRes: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select count (*) from z_Nadb')
    Left = 40
    Top = 264
  end
  object dsrcRes: TDataSource
    DataSet = qryRes
    Left = 56
    Top = 280
  end
  object qryTmp: TQuery
    Left = 176
    Top = 256
  end
end
