object FormKoefOtp: TFormKoefOtp
  Left = 361
  Top = 209
  Width = 270
  Height = 302
  BorderIcons = [biSystemMenu]
  Caption = 'FormKoefOtp'
  Color = clBtnFace
  Constraints.MaxHeight = 525
  Constraints.MaxWidth = 350
  Constraints.MinHeight = 225
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    262
    275)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrKoefOtp: TDBGrid
    Left = 0
    Top = 0
    Width = 262
    Height = 246
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DmMain.dsrcKoefOtp
    PopupMenu = popMnu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MESGOD'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOEFOTP'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 114
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 186
    Top = 249
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    Kind = bkCancel
    Spacing = 0
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 112
    Top = 112
    object popHead: TMenuItem
      Caption = '== '#1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
end
