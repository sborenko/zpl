unit z_NwVids;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormNwVids = class(TForm)
    qryVidN: TQuery;
    qryTmp: TQuery;
    dsrcVidN: TDataSource;
    dbgrVidN: TDBGrid;
    BitBtn1: TBitBtn;
    sBtnNuGo: TSpeedButton;
    sBtnOtklGo: TSpeedButton;
    sBtnNadbGo: TSpeedButton;
    sBtnUdergGo: TSpeedButton;
    sBtnOvvGo: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnNuGoClick(Sender: TObject);
    procedure sBtnOtklGoClick(Sender: TObject);
    procedure sBtnNadbGoClick(Sender: TObject);
    procedure sBtnUdergGoClick(Sender: TObject);
    procedure sBtnOvvGoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowNwVids;

const SECTION = 'z_NwVids';

var
  FormNwVids: TFormNwVids;

implementation

uses a_Const, a_Dm, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowNwVids;
begin
  FormNwVids := TFormNwVids.Create(Application);
  with FormNwVids do begin
    qryVidN.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 425);
    Width  := ReadInteger(SECTION, 'wW', 325);
    Free;
  end;
  if FileExists(cDirVids + 'NwVidN.vid') then
    dbgrVidN.Columns.LoadFromFile(cDirVids + 'NwVidN.vid');
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVidN.Columns.SaveToFile(cDirVids + 'NwVidN.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.sBtnNuGoClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Update Z_NU set VidN = :cVidN where KdVidN = :nKdVidN');
    Prepare;
  end;
  with qryVidN do begin
    First;
    while not Eof do begin
      qryTmp.ParamByName('nKdVidN').AsInteger :=
                                        FieldByName('KdVidN').AsInteger;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ExecSQL;
      Next;
    end;
    First;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.sBtnOtklGoClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Update Z_OTKL set VidN = :cVidN where KdVidN = :nKdVidN');
    Prepare;
  end;
  with qryVidN do begin
    First;
    while not Eof do begin
      qryTmp.ParamByName('nKdVidN').AsInteger :=
                                        FieldByName('KdVidN').AsInteger;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ExecSQL;
      Next;
    end;
    First;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.sBtnNadbGoClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Update Z_NADB set VidN = :cVidN where KdVidN = :nKdVidN');
    Prepare;
  end;
  with qryVidN do begin
    First;
    while not Eof do begin
      qryTmp.ParamByName('nKdVidN').AsInteger :=
                                        FieldByName('KdVidN').AsInteger;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ExecSQL;
      Next;
    end;
    First;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.sBtnUdergGoClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Update Z_UDERG set VidN = :cVidN where KdVidN = :nKdVidN');
    Prepare;
  end;
  with qryVidN do begin
    First;
    while not Eof do begin
      qryTmp.ParamByName('nKdVidN').AsInteger :=
                                        FieldByName('KdVidN').AsInteger;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ExecSQL;
      Next;
    end;
    First;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.sBtnOvvGoClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Update Z_OVV set VidN = :cVidN where KdVidN = :nKdVidN');
    Prepare;
  end;
  with qryVidN do begin
    First;
    while not Eof do begin
      qryTmp.ParamByName('nKdVidN').AsInteger :=
                                        FieldByName('KdVidN').AsInteger;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ExecSQL;
      Next;
    end;
    First;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.SpeedButton1Click(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Update Z_VOtp set VidN = :cVidN where KdVidN = :nKdVidN');
    Prepare;
  end;
  with qryVidN do begin
    First;
    while not Eof do begin
      qryTmp.ParamByName('nKdVidN').AsInteger :=
                                        FieldByName('KdVidN').AsInteger;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ExecSQL;
      Next;
    end;
    First;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;
//------------------------------------------------------------------------------
procedure TFormNwVids.SpeedButton2Click(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Update Z_VBln set VidN = :cVidN where KdVidN = :nKdVidN');
    Prepare;
  end;
  with qryVidN do begin
    First;
    while not Eof do begin
      qryTmp.ParamByName('nKdVidN').AsInteger :=
                                        FieldByName('KdVidN').AsInteger;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ExecSQL;
      Next;
    end;
    First;
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
end;

end.
