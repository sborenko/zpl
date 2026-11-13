unit a_GtVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Db, Menus, StdCtrls, Buttons, ExtCtrls,
  IniFiles, DBTables, Provider, DBClient, DBLocal;

type
  TFormKdVal = class(TForm)
    dsrcKdVal: TDataSource;
    dsrcMovVal: TDataSource;
    PanelLeft: TPanel;
    dbgrKdVal: TDBGrid;
    dbgrMovVal: TDBGrid;
    Splitter1: TSplitter;
    popMnuVal: TPopupMenu;
    PopMnuValEdt: TMenuItem;
    popMnuValAdd: TMenuItem;
    popMnuValDel: TMenuItem;
    PanelRight: TPanel;
    qryKdVal: TQuery;
    popMnuMov: TPopupMenu;
    popMnuMovEdt: TMenuItem;
    popMnuMovAdd: TMenuItem;
    popMnuMovDel: TMenuItem;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    qryTmp: TQuery;
    PopMnuValHead: TMenuItem;
    popMnuMovHead: TMenuItem;
    qryMovVal: TQuery;
    updMovVal: TUpdateSQL;
    updKdVal: TUpdateSQL;
    qryMovValNR: TSmallintField;
    qryMovValKDVAL: TSmallintField;
    qryMovValDTBEG: TDateTimeField;
    qryMovValKURS: TFloatField;
    qryMovValKURSTOUE: TFloatField;
    qryMovValZANEDBV: TFloatField;
    qryMovValZANEDUE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopMnuValEdtClick(Sender: TObject);
    procedure dbgrKdValDblClick(Sender: TObject);
    procedure dbgrKdValKeyDown(Sender: TObject; var Key: Word;
                                                 Shift: TShiftState);
    procedure popMnuValAddClick(Sender: TObject);
    procedure popMnuValDelClick(Sender: TObject);
    procedure popMnuValPopup(Sender: TObject);
    function ExistsDayKurs(nKdVal : integer; dDtBeg : TDateTime;
                                    var nDayKurs : double) : boolean;
    procedure popMnuMovPopup(Sender: TObject);
    procedure popMnuMovEdtClick(Sender: TObject);
    procedure popMnuMovAddClick(Sender: TObject);
    procedure popMnuMovDelClick(Sender: TObject);
    procedure qryKdValAfterPost(DataSet: TDataSet);
    procedure qryKdValBeforePost(DataSet: TDataSet);
    procedure qryKdValAfterDelete(DataSet: TDataSet);
    procedure qryMovValAfterPost(DataSet: TDataSet);
    procedure qryMovValBeforePost(DataSet: TDataSet);
    procedure dsrcKdValDataChange(Sender: TObject; Field: TField);
    procedure qryMovValAfterDelete(DataSet: TDataSet);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
    function MyNewKdVal : integer;
  public
    { Public declarations }
  end;

procedure ShowKdVal;
function GetKdVal(var nKdVal : integer;
                                var cNmVal : string) : boolean;
function GetNmVal(var cNmVal : string;
                                var nKdVal : integer) : boolean;

const SECTION = 'A_GtVal';

var
  FormKdVal: TFormKdVal;
  bVuborMode : boolean;

implementation

uses a_Const, a_DM, a_EVal, a_EMvVal;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure ShowKdVal;
begin
  bVuborMode := false;
  FormKdVal := TFormKdVal.Create(Application);
  with FormKdVal do begin
    bBtnOK.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    dsrcKdVal.DataSet.Open;
    dsrcMovVal.DataSet.Open;
    dsrcMovVal.DataSet.Last;
    ShowModal;
    dsrcKdVal.DataSet.Close;
    dsrcMovVal.DataSet.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetNmVal(var cNmVal : string; var nKdVal : integer) : boolean;
begin
  Result := false;
  bVuborMode := true;
  FormKdVal := TFormKdVal.Create(Application);
  with FormKdVal do begin
    dsrcKdVal.DataSet.Open;
    if cNmVal <> '' then
      dsrcKdVal.DataSet.Locate('NmValSokr', cNmVal, []);
    dsrcMovVal.DataSet.Open;
    dsrcMovVal.DataSet.Last;
    if ShowModal = mrOK then begin
      Result := true;
      cNmVal := dsrcKdVal.DataSet.FieldByName('NmValSokr').asString;
      nKdVal := dsrcKdVal.DataSet.FieldByName('KdVal').asInteger;
    end;
    dsrcKdVal.DataSet.Close;
    dsrcMovVal.DataSet.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKdVal(var nKdVal : integer; var cNmVal : string) : boolean;
begin
  Result := false;
  bVuborMode := true;
  FormKdVal := TFormKdVal.Create(Application);
  with FormKdVal do begin
    dsrcKdVal.DataSet.Open;
    if nKdVal <> 0 then
      dsrcKdVal.DataSet.Locate('KdVal', nKdVal, []);
    dsrcMovVal.DataSet.Open;
    dsrcMovVal.DataSet.Last;
    if ShowModal = mrOK then begin
      Result := true;
      nKdVal := dsrcKdVal.DataSet.FieldByName('KdVal').asInteger;
      cNmVal := dsrcKdVal.DataSet.FieldByName('NmValSokr').asString;
    end;
    dsrcKdVal.DataSet.Close;
    dsrcMovVal.DataSet.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 200);
	  Top    := ReadInteger(SECTION, 'wT', 260);
	  Height := ReadInteger(SECTION, 'wH', 255);
    Width  := ReadInteger(SECTION, 'wW', 338);
    dbgrKdVal.Height := ReadInteger(SECTION, 'dbgrKdVlH', 130);
	  Free;
  end;
  popMnuVal.AutoPopup := (nAppUsrKat <= 3);
  popMnuMov.AutoPopup := (nAppUsrKat <= 3);
  if FileExists(cDirVids + 'dKdVal01.vid') then
    dbgrKdVal.Columns.LoadFromFile(cDirVids + 'dKdVal01.vid');
  if FileExists(cDirVids + 'dMvVal.vid') then
    dbgrMovVal.Columns.LoadFromFile(cDirVids + 'dMvVal.vid');
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  dbgrKdVal.Columns.SaveToFile(cDirVids + 'dKdVal01.vid');
  dbgrMovVal.Columns.SaveToFile(cDirVids + 'dMvVal.vid');
  with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
	  WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'dbgrKdVlH', dbgrKdVal.Height);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.popMnuValPopup(Sender: TObject);
begin
  popMnuValEdt.Enabled :=
                    dbgrKdVal.DataSource.DataSet.RecordCount <> 0;
  popMnuValDel.Enabled := popMnuValEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.popMnuValAddClick(Sender: TObject);
var bUpdated : boolean;
begin
  bUpdated := false;
  with dsrcKdVal.DataSet do begin
    Append;
    if AddEdtKdVal(dsrcKdVal) {a_EVal} then begin
      Post;
      bUpdated := true; end
    else
      Cancel;
  end;
  if bUpdated and Form_Dm.cdsValLU.Active then begin
    Form_Dm.cdsValLU.Close;
    Form_Dm.cdsValLU.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.PopMnuValEdtClick(Sender: TObject);
var bUpdated : boolean;
begin
  bUpdated := false;
  with dsrcKdVal.DataSet do begin
    Edit;
    if AddEdtKdVal(dsrcKdVal) {a_EVal} then begin
      Post;
      bUpdated := true; end
    else
      Cancel;
  end;
  if bUpdated and Form_Dm.cdsValLU.Active then begin
    Form_Dm.cdsValLU.Close;
    Form_Dm.cdsValLU.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.popMnuValDelClick(Sender: TObject);
var bCanDelete, bUpdated : boolean;
begin
  bUpdated := false;
  with qryTmp do begin
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select count(*) Cnt from bnk_mov where KdVal = ' +
              dsrcKdVal.DataSet.FieldByName('KdVal').asString);
    Open;
    bCanDelete := (FieldByName('Cnt').asInteger = 0);
    if bCanDelete then begin
      Close;
      SQL.Clear;
      DataBaseName := CESMAIN; 
      SQL.Add('Select count(*) Cnt from ks_mov where KdVal = ' +
              dsrcKdVal.DataSet.FieldByName('KdVal').asString);
      Open;
      bCanDelete := (FieldByName('Cnt').asInteger = 0);
    end;
    Close;
    SQL.Clear;
  end;
  if bCanDelete and (MessageDlg('Валюта и ее курсы удаляются ' +
                     'безвозвратно. Согласны?:', mtWarning,
                             [mbYes, mbNo], 0) = mrYes) then begin
    qryKdVal.Delete;
    bUpdated := true; end
  else if not bCanDelete then
    MessageDlg('Нельзя удалять эту запись - на нее есть ' +
                 'ссылки в других таблицах.', mtError, [mbOk], 0);
  if bUpdated and Form_Dm.cdsValLU.Active then begin
    Form_Dm.cdsValLU.Close;
    Form_Dm.cdsValLU.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.popMnuMovPopup(Sender: TObject);
begin
  popMnuMovAdd.Enabled := (dsrcKdVal.DataSet.RecordCount <> 0);
  popMnuMovEdt.Enabled := (dsrcMovVal.DataSet.RecordCount <> 0);
  popMnuMovDel.Enabled := popMnuMovEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.popMnuMovEdtClick(Sender: TObject);
var cMsg, cNmValSokr : string;
    dDtBeg, dDtBegOld : TDateTime;
    nDayKurs : double;
    bUpdated : boolean;
begin
  bUpdated := false;
  with dsrcMovVal.DataSet do begin
    dDtBeg     := Round(FieldByName('DtBeg').asDateTime);
    dDtBegOld  := Round(FieldByName('DtBeg').asDateTime);
    cNmValSokr := dsrcKdVal.DataSet.FieldByName('NmValSokr').asString;
    Edit;
    if EdtMovVal(cNmValSokr, dsrcMovVal) then begin
      // сделать проверку, чтобы не вперли два курса в один день
      dDtBeg := Round(dDtBeg);
      if (dDtBeg <> dDtBegOld) and
                    ExistsDayKurs(FieldByName('KdVal').asInteger,
                                        dDtBeg, nDayKurs) then begin
        Cancel;
        cMsg := 'Уже есть запись на ' + DateToStr(dDtBeg) +
                ' с курсом ' + FloatToStr(nDayKurs) + '. ' +
                #13#10 + 'Сначала удалите ее!.';
        MessageDlg(cMsg, mtError, [mbOK], 0);
        Exit;
      end;
      Post;
      bUpdated := true; end
    else
      Cancel;
  end;
  if bUpdated and Form_Dm.cdsMovValLU.Active then begin
    Form_Dm.cdsMovValLU.Close;
    Form_Dm.cdsMovValLU.Open;
//    Form_Dm.cdsMovValLU.Refresh; // Не проходит
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.popMnuMovAddClick(Sender: TObject);
var cMsg, cNmValSokr : string;
    dDtBeg : TDateTime;
    nDayKurs : double;
    bUpdated : boolean;
    cZaNEdBv, cKurs, cZaNEdUe, cKursToUE : string;
begin
  bUpdated := false;
  with dsrcMovVal.DataSet do begin
    Last;
    dDtBeg     := Date;
    cZaNEdBv   := FieldByName('ZaNEdBv').AsString;
    cKurs      := FieldByName('Kurs').AsString;
    cZaNEdUe   := FieldByName('ZaNEdUe').AsString;
    cKursToUE  := FieldByName('KursToUe').AsString;
    cNmValSokr := dsrcKdVal.DataSet.
                               FieldByName('NmValSokr').asString;
    Append;
    FieldByName('DtBeg').AsDateTime := dDtBeg;
    FieldByName('ZaNEdBv').AsString := cZaNEdBv;
    FieldByName('Kurs').AsString := cKurs;
    FieldByName('ZaNEdUe').AsString := cZaNEdUe;
    FieldByName('KursToUe').AsString := cKursToUE;
    cNmValSokr := dsrcKdVal.DataSet.
                               FieldByName('NmValSokr').asString;
    if AddMovVal(cNmValSokr, dsrcMovVal) then begin
      // сделать проверку, чтобы не вперли два курса в один день
      dDtBeg := FieldByName('DtBeg').AsDateTime;
      if ExistsDayKurs(qryKdVal.FieldByName('KdVal').asInteger,
                                     dDtBeg, nDayKurs) then begin
        Cancel;
        cMsg := 'Уже есть запись на ' + DateToStr(dDtBeg) +

                ' с курсом ' + FloatToStr(nDayKurs) + '. ' +
                #13#10 + 'Сначала удалите ее!.';
        MessageDlg(cMsg, mtError, [mbOK], 0);
        Exit;
      end;
      Post;
      bUpdated := true; end
    else
      Cancel;
  end;
  if bUpdated and Form_Dm.cdsMovValLU.Active then begin
    Form_Dm.cdsMovValLU.Close;
    Form_Dm.cdsMovValLU.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.popMnuMovDelClick(Sender: TObject);
var bUpdated : boolean;
begin
  bUpdated := false;
  if (MessageDlg('Удаление записи может изменить ' +
                 'информацию, связанную с пересчётами курсов ' +
                 'валют. Согласны?:', mtWarning,
                             [mbNo, mbYes], 0) = mrYes) then begin
    qryMovVal.Delete;
    bUpdated := true;
  end;
  if bUpdated and Form_Dm.cdsMovValLU.Active then begin
    Form_Dm.cdsMovValLU.Close;
    Form_Dm.cdsMovValLU.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.dbgrKdValDblClick(Sender: TObject);
begin
  if bVuborMode then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.dbgrKdValKeyDown(Sender: TObject;
                               var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_RETURN) and bVuborMode then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
function TFormKdVal.ExistsDayKurs(nKdVal : integer;
                                  dDtBeg : TDateTime;
                                  var nDayKurs : double) : boolean;
begin
  result := false;
  nDayKurs := 0;
  with qryTmp do begin
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Mov_Val where ' +
            ' (KdVal = :nKdVal) and (dtBeg = :dDtBeg)');
    ParamByName('nKdVal').asInteger := nKdVal;
    ParamByName('dDtBeg').asDateTime := Round(dDtBeg);
    Open;
    if RecordCount > 0 then begin
      result := true;
      nDayKurs := FieldByName('Kurs').asFloat;
    end;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.qryKdValAfterPost(DataSet: TDataSet);
var nSvKdVal : integer;
begin
  with qryKdVal do begin
    nSvKdVal := FieldByName('KdVal').AsInteger;
    Form_Dm.DbMain.ApplyUpdates([qryKdVal]);
    Close;
    Open;
    Locate('KdVal', nSvKdVal, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.qryKdValBeforePost(DataSet: TDataSet);
begin
  if qryKdVal.State = dsInsert then
    qryKdval.FieldByName('KdVal').AsInteger := MyNewKdVal;
end;
//------------------------------------------------------------------------------
function TFormKdVal.MyNewKdVal : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select Max(KdVal) as MaxKd from Kd_Val');
    Open;
    if (RecordCount > 0) and
                (FieldByName('MaxKd').asInteger <> 0) then
      Result := FieldByName('MaxKd').asInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.qryKdValAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryKdVal]);
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.qryMovValAfterPost(DataSet: TDataSet);
var nSvDtBeg : TDateTime;
begin
  with qryMovVal do begin
    nSvDtBeg := FieldByName('DtBeg').AsDateTime;
    Form_Dm.DbMain.ApplyUpdates([qryMovVal]);
    Close;
    Open;
    Locate('DtBeg', nSvDtBeg, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.qryMovValBeforePost(DataSet: TDataSet);
begin
  if qryMovVal.State = dsInsert then
    qryMovVal.FieldByName('KdVal').AsInteger :=
                          qryKdVal.FieldByName('KdVal').AsInteger;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.dsrcKdValDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcKdVal.State = dsBrowse) and qryMovVal.Active then
    qryMovVal.Last;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.qryMovValAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryMovVal]);
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormKdVal.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
