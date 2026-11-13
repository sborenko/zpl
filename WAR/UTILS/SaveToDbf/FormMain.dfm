object Form1: TForm1
  Left = 1
  Top = 132
  Width = 1305
  Height = 750
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QrySrc: TQuery
    Left = 312
    Top = 96
  end
  object TblDest: TTable
    TableType = ttDBase
    Left = 416
    Top = 96
  end
  object Database: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    Left = 312
    Top = 48
  end
end
