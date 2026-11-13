object FrmIndxExcl: TFrmIndxExcl
  Left = 133
  Top = 305
  BorderStyle = bsSingle
  Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 127
  ClientWidth = 391
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
  DesignSize = (
    391
    127)
  PixelsPerInch = 96
  TextHeight = 13
  object LblDtBeg: TLabel
    Left = 8
    Top = 36
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object LblDtEnd: TLabel
    Left = 208
    Top = 36
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object LblNotes: TLabel
    Left = 8
    Top = 68
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 97
    Width = 391
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      391
      30)
    object BtnOk: TBitBtn
      Left = 221
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkOK
    end
    object BtnCancel: TBitBtn
      Left = 309
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DbeDtBeg: TDBEdit
    Left = 96
    Top = 32
    Width = 73
    Height = 21
    DataField = 'DtBeg'
    DataSource = DmIndxExcl.DsrclRec
    TabOrder = 0
  end
  object DbeDtEnd: TDBEdit
    Left = 311
    Top = 32
    Width = 73
    Height = 21
    DataField = 'DtEnd'
    DataSource = DmIndxExcl.DsrclRec
    TabOrder = 1
  end
  object DbeNotes: TDBEdit
    Left = 96
    Top = 64
    Width = 288
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'Notes'
    DataSource = DmIndxExcl.DsrclRec
    TabOrder = 2
  end
  object DbeTabN: TDBEdit
    Left = 8
    Top = 8
    Width = 57
    Height = 13
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'TabN'
    DataSource = DmIndxExcl.DsrclRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object EdtFIO: TEdit
    Left = 96
    Top = 8
    Width = 288
    Height = 13
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = 'EdtFIO'
  end
end
