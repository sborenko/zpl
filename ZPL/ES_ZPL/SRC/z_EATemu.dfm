object FormEATemu: TFormEATemu
  Left = 471
  Top = 231
  BorderStyle = bsDialog
  Caption = 'FormEATemu'
  ClientHeight = 233
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 366
    Height = 49
    Align = alTop
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 8
    Top = 198
    Width = 42
    Height = 13
    Caption = #1050#1076#1058#1077#1084#1099
    FocusControl = dbeKdTemu
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 83
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' .'#1090#1077#1084#1099
    FocusControl = dbeNmSch
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 23
    Height = 13
    Caption = 'GRP'
    FocusControl = DBEdit1
  end
  object Label4: TLabel
    Left = 84
    Top = 136
    Width = 46
    Height = 13
    Caption = 'KDTEMU'
    FocusControl = DBEdit2
  end
  object Label5: TLabel
    Left = 8
    Top = 1
    Width = 39
    Height = 13
    Caption = 'NMSCH'
    FocusControl = DBEdit3
  end
  object Label6: TLabel
    Left = 84
    Top = 166
    Width = 33
    Height = 13
    Caption = #1050#1076#1055#1057#1095
    FocusControl = DBEdit4
  end
  object Label7: TLabel
    Left = 240
    Top = 136
    Width = 40
    Height = 13
    Caption = 'SCH_17'
    FocusControl = DBEdit5
  end
  object Label8: TLabel
    Left = 240
    Top = 168
    Width = 31
    Height = 13
    Caption = #1055#1057#1095#1105#1090
    FocusControl = DBEdit6
  end
  object Label9: TLabel
    Left = 8
    Top = 174
    Width = 18
    Height = 13
    Caption = #1043#1088#1087
    FocusControl = DBEdit7
  end
  object dbeKdTemu: TDBEdit
    Left = 64
    Top = 195
    Width = 67
    Height = 24
    TabStop = False
    Color = clBtnFace
    DataField = 'KDTEMU'
    DataSource = FormShowTemu.dsrcTm
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbeNmSch: TDBEdit
    Left = 8
    Top = 59
    Width = 350
    Height = 24
    DataField = 'NMSCH'
    DataSource = FormShowTemu.dsrcTm
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeNmSchEnter
    OnExit = dbeNmSchExit
  end
  object bBtnOk: TBitBtn
    Left = 136
    Top = 91
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 283
    Top = 91
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 44
    Top = 133
    Width = 28
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'GRP'
    DataSource = FormShowTemu.dsrcGrp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 131
    Top = 133
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDTEMU'
    DataSource = FormShowTemu.dsrcGrp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 17
    Width = 350
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'NMSCH'
    DataSource = FormShowTemu.dsrcGrp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 131
    Top = 163
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDPSCH'
    DataSource = FormShowTemu.dsrcTm
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 285
    Top = 133
    Width = 72
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'SCH_17'
    DataSource = FormShowTemu.dsrcGrp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit6: TDBEdit
    Left = 285
    Top = 160
    Width = 72
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PS_17'
    DataSource = FormShowTemu.dsrcTm
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit7: TDBEdit
    Left = 44
    Top = 160
    Width = 28
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'GRP'
    DataSource = FormShowTemu.dsrcTm
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
end
