object FrmEvaluate: TFrmEvaluate
  Left = 189
  Top = 328
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1075#1088#1077#1089#1089
  ClientHeight = 323
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    557
    323)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelStage: TBevel
    Left = 8
    Top = 8
    Width = 540
    Height = 41
    Anchors = [akLeft, akTop, akRight]
  end
  object LblCurrStageNum: TLabel
    Left = 24
    Top = 20
    Width = 44
    Height = 20
    Caption = #1069#1090#1072#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblStagesTotal: TLabel
    Left = 435
    Top = 20
    Width = 64
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1069#1090#1072#1087#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtStage: TEdit
    Left = 96
    Top = 20
    Width = 300
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    Text = 'EdtStage'
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 56
    Width = 540
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object BtnCancel: TBitBtn
    Left = 472
    Top = 292
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BtnCancelClick
  end
  object LstBoxLog: TListBox
    Left = 8
    Top = 88
    Width = 540
    Height = 197
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
end
