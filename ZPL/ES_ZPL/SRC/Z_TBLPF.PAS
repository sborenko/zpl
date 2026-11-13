unit Z_TblPF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, ExtCtrls, Db, StdCtrls, Buttons,
  Menus, DBTables, Variants;

type
  TFormTblPF = class(TForm)
    dsrcPF: TDataSource;
    popMnu: TPopupMenu;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    bBtnCancel: TBitBtn;
    qryPF: TQuery;
    qryPFNR: TIntegerField;
    qryPFDTPROC: TDateTimeField;
    qryPFPOROG: TFloatField;
    qryPFSMM: TFloatField;
    qryPFPRC: TFloatField;
    qryTmp: TQuery;
    qryMes: TQuery;
    dsrcMes: TDataSource;
    qryMesDTPROC: TDateTimeField;
    qryMesMesGod: TStringField;
    PanelLeft: TPanel;
    dbgrMes: TDBGrid;
    dbgrPF: TDBGrid;
    Splitter1: TSplitter;
    PanelRight: TPanel;
    PanelMsg: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    popMnuHead: TMenuItem;
    popAddMes: TMenuItem;
    popDelMes: TMenuItem;
    qry2Tmp: TQuery;
    PanelAfterAddTbl: TPanel;
    Memo1: TMemo;
    sBtnBuSdelano: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popMnuPopup(Sender: TObject);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure qryMesCalcFields(DataSet: TDataSet);
    procedure PanelRightResize(Sender: TObject);
    procedure popDelMesClick(Sender: TObject);
    procedure popAddMesClick(Sender: TObject);
    procedure sBtnBuSdelanoClick(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    bWasAddUpd : boolean;
  public
    { Public declarations }
  end;

procedure TblPFShowModal(dDtProc : TDateTime);

const SECTION = 'Z_TblPF';

var
  FormTblPF: TFormTblPF;

implementation

uses A_Const, A_DM, Z_DM, A_Lib, A_GtGdMs, Z_EPF;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TblPFShowModal(dDtProc : TDateTime);
var nGod, nMes, nDay : word;
begin
  FormTblPF := TFormTblPF.Create(Application);
  with FormTblPF do begin
    bWasAddUpd := false;
    d_DtProc := dDtProc;
    DecodeDate(dDtProc, nGod, nMes, nDay);
    qryMes.Open;
    qryPF.Open;
    Caption := 'По-месячные таблицы удержаний в пенсионный фонд (ПФ)';
    ShowModal;
    qryPF.Close;
    qryMes.close;
    if bWasAddUpd then
      DmMain.CreOpenCdsPF;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 400);
    dbgrMes.Height := ReadInteger(SECTION, 'GrMesH', 165);
    Free;
  end;
  if FileExists(cDirVids + 'tblPF.vid') then
    dbgrPF.Columns.LoadFromFile(cDirVids + 'tblPF.vid');
  if FileExists(cDirVids + 'GrMesPF.vid') then
    dbgrMes.Columns.LoadFromFile(cDirVids + 'GrMesPF.vid');
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  dbgrPF.Columns.SaveToFile(cDirVids + 'tblPF.vid');
  dbgrMes.Columns.SaveToFile(cDirVids + 'GrMesPF.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'GrMesH', dbgrMes.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.popMnuPopup(Sender: TObject);
begin
  if popMnu.PopupComponent = dbgrMes then begin
    popMnuHead.Caption := '== Месяцы ==';
    popAddMes.Visible := true;
    popDelMes.Visible := true;
    popMnuEdt.Visible := false;
    popMnuAdd.Visible := false;
    popMnuDel.Visible := false;
    popDelMes.Enabled := qryMes.RecordCount <> 0; end
  else begin
    popMnuHead.Caption := '== ' +
                        qryMes.FieldByName('MesGod').asString + ' ==';
    popAddMes.Visible := false;
    popDelMes.Visible := false;
    popMnuEdt.Visible := true;
    popMnuAdd.Visible := true;
    popMnuDel.Visible := true;
    popMnuEdt.Enabled := dsrcPF.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.popMnuEdtClick(Sender: TObject);
var nPorog, nSmm, nPrc : double; nEdtNR : integer;
begin
  with dsrcPF.DataSet do begin
    nEdtNR := FieldByName('NR').asInteger;
    nPorog := FieldByName('Porog').asFloat;
    nSmm   := FieldByName('Smm').asFloat;
    nPrc   := FieldByName('Prc').asFloat;
  end;
  if EdtRecPF(nPorog, nSmm, nPrc) then begin     {Z_EPF}
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add('Update Z_TblPF set porog = :nPorog, ' +
              ' smm = :nSmm, prc = :nPrc where NR = :nEdtNR');
      ParamByName('nPorog').asFloat := nPorog;
      ParamByName('nSmm').asFloat := nSmm;
      ParamByName('nPrc').asFloat := nPrc;
      ParamByName('nEdtNR').asInteger := nEdtNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcPF.DataSet do begin
      Close;
      Open;
      Locate('NR', nEdtNR, []);
    end;
    bWasAddUpd := true;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.popMnuAddClick(Sender: TObject);
var nPorog, nSmm, nPrc : double;
begin
  if AddRecPF(nPorog, nSmm, nPrc) then begin     {Z_EPF}
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add('Insert into Z_TblPF ' +
              ' (DtProc, Porog, Smm, Prc) ' +
              ' values (:dDtProc, :nPorog, :nSmm, :nPrc)');
      ParamByName('dDtProc').asDateTime := d_DtProc;
      ParamByName('nPorog').asFloat := nPorog;
      ParamByName('nSmm').asFloat := nSmm;
      ParamByName('nPrc').asFloat := nPrc;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcPF.DataSet do begin
      Close;
      Open;
      Locate('POROG;SMM;PRC', VarArrayOf([nPorog, nSmm, nPrc]), []);
    end;
    bWasAddUpd := true;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.popMnuDelClick(Sender: TObject);
var nDelNR, nSvNR : integer; bEof : boolean;
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                    mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    bEof := false;
    nSvNr := 0;
    with dsrcPF.DataSet do begin
      DisableControls;
      nDelNR := FieldByName('NR').asInteger;
      Next;
      if Eof then
        bEof := true
      else
        nSvNR := FieldByName('NR').asInteger;
    end;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add('Delete from Z_TblPF ' +
              ' where NR = :nDelNR');
      ParamByName('nDelNR').asInteger := nDelNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcPF.DataSet do begin
      Close;
      Open;
      if bEof then
        Last
      else
        Locate('NR', nSvNR, []);
      EnableControls;
    end;
    bWasAddUpd := true;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.qryMesCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  with qryMes do begin
    DecodeDate(FieldByName('DtProc').asDateTime, nY, nM, nD);
    FieldByName('MesGod').asString :=
                     MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.PanelRightResize(Sender: TObject);
begin
  PanelMsg.Left := Round((PanelRight.Width - PanelMsg.Width) / 2);
  PanelMsg.Top := Round((PanelRight.Height - PanelMsg.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.popDelMesClick(Sender: TObject);
var cMsg : string; dSvDtProc : TDateTime; bEof : boolean;
begin
  cMsg := 'Таблица за ' + qryMes.FieldByName('MesGod').asString +
          ' удаляется безвозвратно. Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    Application.ProcessMessages;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := qryMes.DataBaseName;
      SQL.Add('Delete from Z_TblPF where DtProc = :dDtProc');
      ParamByName('dDtProc').asDateTime :=
                          qryMes.FieldByName('DtProc').asDateTime;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    bEof := false;
    dSvDtProc := 0;
    with qryMes do begin
      Next;
      if Eof then
        bEof := true
      else
        dSvDtProc := FieldByName('DtProc').asDateTime;
      Close;
      Open;
      if bEof then
        Last
      else
        Locate('DtProc', dSvDtProc, []);
    end;
    bWasAddUpd := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.popAddMesClick(Sender: TObject);
var nGod, nMes, nD : word;  dNeedDtProc, dIsDtProc : TDateTime;
    dSvDtProc : TDateTime;
begin
  dIsDtProc := 0;
  DecodeDate(qryMes.FieldByName('DtProc').asDateTime, nGod, nMes, nD);
  if VvodGodMes(nGod, nMes) and
      (MessageDlg('Добавить заготовку таблицы за ' +
                   MesRus(nMes) + IntToStr(nGod) + ' г.?:',
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    Application.ProcessMessages;
    // Определить из записей какого месяца делать копирование
    dNeedDtProc := EncodeDate(nGod, nMes, 1);
    with qryMes do begin
      dSvDtProc := FieldByName('DtProc').AsDateTime;
      DisableControls;
      First;
      while not Eof do begin
        dIsDtProc := FieldByName('DtProc').asDateTime;
        Next;
        if FieldByName('DtProc').asDateTime >= dNeedDtProc then
          Break;
      end;
      Locate('DtProc', dSvDtProc, []);
      EnableControls;
    end;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := qryMes.DataBaseName;
      SQL.Add('Select * from Z_TblPF where DtProc = :dDtProc');
      ParamByName('dDtProc').asDateTime := dIsDtProc;
      Open;
      if qry2Tmp.Active then qry2Tmp.Close;
      qry2Tmp.SQL.Clear;
      qry2Tmp.DataBaseName := DataBaseName;
      qry2Tmp.SQL.Add('Insert into Z_TblPF ' +
                      ' (DtProc, Porog, Smm, Prc) '  +
                      ' values(:dDtProc, :nPorog, :nSmm, :nPrc)');
      qry2Tmp.Prepare;
      First;
      while not Eof do begin
        qry2Tmp.ParamByName('dDtProc').asDateTime := dNeedDtProc;
        qry2Tmp.ParamByName('nPorog').asFloat :=
                                        FieldByName('Porog').asFloat;
        qry2Tmp.ParamByName('nSmm').asFloat :=
                                          FieldByName('Smm').asFloat;
        qry2Tmp.ParamByName('nPrc').asFloat :=
                                        FieldByName('Prc').asFloat;
        qry2Tmp.ExecSQL;
        Next;
      end;
      PanelAfterAddTbl.Visible := true;
      qry2Tmp.Close;
      qry2Tmp.SQL.Clear;
      qry2Tmp.DataBaseName := '';
      qry2Tmp.UnPrepare;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    with qryMes do begin
      Close;
      Open;
      Locate('DtProc', dNeedDtProc, []);
    end;
    bWasAddUpd := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPF.sBtnBuSdelanoClick(Sender: TObject);
begin
  PanelAfterAddTbl.Visible := false;
end;

end.
