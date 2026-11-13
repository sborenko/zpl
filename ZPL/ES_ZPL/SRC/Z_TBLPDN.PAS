unit Z_TblPdN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, ExtCtrls, Db, StdCtrls, Buttons,
  Menus, DBTables, Variants;

type
  TFormTblPdN = class(TForm)
    dsrcPdN: TDataSource;
    popMnu: TPopupMenu;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    bBtnCancel: TBitBtn;
    qryPdN: TQuery;
    qryPdNNR: TIntegerField;
    qryPdNDTPROC: TDateTimeField;
    qryPdNPOROG: TFloatField;
    qryPdNSMM: TFloatField;
    qryPdNPRC: TFloatField;
    qryTmp: TQuery;
    qryMes: TQuery;
    dsrcMes: TDataSource;
    qryMesDTPROC: TDateTimeField;
    qryMesMesGod: TStringField;
    PanelLeft: TPanel;
    dbgrMes: TDBGrid;
    dbgrPdN: TDBGrid;
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

procedure TblPdNShowModal(dDtProc : TDateTime);

const SECTION = 'Z_TblPdN';

var
  FormTblPdN: TFormTblPdN;

implementation

uses A_Const, A_DM, Z_DM, A_Lib, A_GtGdMs, Z_EPdN;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TblPdNShowModal(dDtProc : TDateTime);
var nGod, nMes, nDay : word;
begin
  FormTblPdN := TFormTblPdN.Create(Application);
  with FormTblPdN do begin
    bWasAddUpd := false;
    d_DtProc := dDtProc;
    DecodeDate(dDtProc, nGod, nMes, nDay);
//    CreOpenTblPdn(dDtProc);
    qryMes.Open;
    qryMes.Last;
    qryPdN.Open;
    Caption := 'По-месячные таблицы подоходного налога';
    ShowModal;
    qryPdN.Close;
    qryMes.close;
    if bWasAddUpd then
      DmMain.CreOpenCdsPdN;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 400);
    dbgrMes.Height := ReadInteger(SECTION, 'GrMesH', 165);
    Free;
  end;
  if FileExists(cDirVids + 'tblPdN.vid') then
    dbgrPdN.Columns.LoadFromFile(cDirVids + 'tblPdN.vid');
  if FileExists(cDirVids + 'GrMesPdN.vid') then
    dbgrMes.Columns.LoadFromFile(cDirVids + 'GrMesPdN.vid');
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  dbgrPdN.Columns.SaveToFile(cDirVids + 'tblPdN.vid');
  dbgrMes.Columns.SaveToFile(cDirVids + 'GrMesPdN.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'GrMesH', dbgrMes.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.popMnuPopup(Sender: TObject);
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
    popMnuEdt.Enabled := dsrcPdN.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.popMnuEdtClick(Sender: TObject);
var nPorog, nSmm, nPrc : double; nEdtNR : integer;
begin
  with dsrcPdN.DataSet do begin
    nEdtNR := FieldByName('NR').asInteger;
    nPorog := FieldByName('Porog').asFloat;
    nSmm   := FieldByName('Smm').asFloat;
    nPrc   := FieldByName('Prc').asFloat;
  end;
  if EdtRecPdN(nPorog, nSmm, nPrc) then begin     {Z_EPdN}
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add('Update Z_TblPdN set porog = :nPorog, ' +
              ' smm = :nSmm, prc = :nPrc where NR = :nEdtNR');
      ParamByName('nPorog').asFloat := nPorog;
      ParamByName('nSmm').asFloat := nSmm;
      ParamByName('nPrc').asFloat := nPrc;
      ParamByName('nEdtNR').asInteger := nEdtNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcPdN.DataSet do begin
      Close;
      Open;
      Locate('NR', nEdtNR, []);
    end;
    bWasAddUpd := true;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.popMnuAddClick(Sender: TObject);
var nPorog, nSmm, nPrc : double;
begin
  if AddRecPdN(nPorog, nSmm, nPrc) then begin     {Z_EPdN}
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add('Insert into Z_TblPdN ' +
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
    with dsrcPdN.DataSet do begin
      Close;
      Open;
      Locate('POROG;SMM;PRC', VarArrayOf([nPorog, nSmm, nPrc]), []);
    end;
    bWasAddUpd := true;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.popMnuDelClick(Sender: TObject);
var nDelNR, nSvNR : integer; bEof : boolean;
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                    mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    bEof := false;
    nSvNr := 0;
    with dsrcPdN.DataSet do begin
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
      SQL.Add('Delete from Z_TblPdN ' +
              ' where NR = :nDelNR');
      ParamByName('nDelNR').asInteger := nDelNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcPdN.DataSet do begin
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
procedure TFormTblPdN.qryMesCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  with qryMes do begin
    DecodeDate(FieldByName('DtProc').asDateTime, nY, nM, nD);
    FieldByName('MesGod').asString :=
                     MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.PanelRightResize(Sender: TObject);
begin
  PanelMsg.Left := Round((PanelRight.Width - PanelMsg.Width) / 2);
  PanelMsg.Top := Round((PanelRight.Height - PanelMsg.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormTblPdN.popDelMesClick(Sender: TObject);
var cMsg : string; dSvDtProc : TDateTime; bEof : boolean;
begin
  cMsg := 'Таблица за ' + qryMes.FieldByName('MesGod').asString +
          ' удаляется безвозвратно. Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrOk then begin
    Application.ProcessMessages;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := qryMes.DataBaseName;
      SQL.Add('Delete from Z_TblPdN where DtProc = :dDtProc');
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
procedure TFormTblPdN.popAddMesClick(Sender: TObject);
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
      dSvDtProc := FieldByName('DtProc').asDateTime;
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
      SQL.Add('Select * from Z_TblPdN where DtProc = :dDtProc');
      ParamByName('dDtProc').asDateTime := dIsDtProc;
      Open;
      if qry2Tmp.Active then qry2Tmp.Close;
      qry2Tmp.SQL.Clear;
      qry2Tmp.DataBaseName := DataBaseName;
      qry2Tmp.SQL.Add('Insert into Z_TblPdN ' +
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
procedure TFormTblPdN.sBtnBuSdelanoClick(Sender: TObject);
begin
  PanelAfterAddTbl.Visible := false;
end;

end.
