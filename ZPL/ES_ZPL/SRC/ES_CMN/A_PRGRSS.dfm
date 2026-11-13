object FrmListProgress: TFrmListProgress
  Left = 294
  Top = 204
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 60
  ClientWidth = 578
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 59
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      577
      59)
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 577
      Height = 59
      Align = alClient
      Brush.Color = clMoneyGreen
      Pen.Color = clGray
    end
    object LblInfo: TLabel
      Left = 10
      Top = 5
      Width = 557
      Height = 14
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1085#1072' '#1092#1077#1074#1088'. 2004 '#1075'.'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ProgressBar: TProgressBar
      Left = 9
      Top = 22
      Width = 559
      Height = 10
      Anchors = [akLeft, akTop, akRight]
      Smooth = True
      TabOrder = 0
    end
    object StatusBar: TStatusBar
      Left = 9
      Top = 34
      Width = 559
      Height = 19
      Align = alNone
      Anchors = [akLeft, akTop, akRight]
      Color = clMoneyGreen
      Panels = <
        item
          Width = 125
        end
        item
          Width = 330
        end
        item
          Width = 50
        end>
    end
  end
end
