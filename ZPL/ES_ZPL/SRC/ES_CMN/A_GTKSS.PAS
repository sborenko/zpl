unit A_GtKss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Db, Grids, DBGrids, ExtCtrls,
  DBTables, IniFiles, Menus, Buttons;

type
  TFormGetKss = class(TForm)
    qryPdr: TQuery;
    dbgrPdr: TDBGrid;
    dsrcPdr: TDataSource;
    popMnu: TPopupMenu;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    qryTmp: TQuery;
    qryPdrKDWHO: TSmallintField;
    qryPdrNMWHO: TStringField;
    qryPdrPRWHO: TSmallintField;
    qryPdrKDSBU: TSmallintField;
    qryPdrKDVALPDR: TSmallintField;
    qryPdrNOTES: TStringField;
    qryPdrKDRSCH: TSmallintField;
    qryPdrNMSCH: TStringField;
    qryPdrNMBANK: TStringField;
    qryPdrRSCH: TStringField;
    qryPdrMFO: TStringField;
    qryPdrOKPO: TStringField;
    qryPdrNMVALSOKR: TStringField;
    qryPdrSCHBU: TStringField;
    qryPdrSHFR: TStringField;
    Label10: TLabel;
    DBText6: TDBText;
    Label6: TLabel;
    DBText7: TDBText;
    Label8: TLabel;
    DBText8: TDBText;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure dbgrPdrDblClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure dbgrPdrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    b_WasUpdated : boolean;
    n_KdPdr : integer;
    bVuborMode : boolean;
    procedure OpenQryPdr;
  public
    { Public declarations }
  end;

procedure ShowModalKassu(nKdPdr : integer; var bWasUpdated : boolean);
function GetKdKss(var nKdPdr, nKdVal, nKdSbu : integer;
                                               var cNmPdr : string) : boolean;

var
  FormGetKss: TFormGetKss;

const SECTION = 'A_GtKss';

implementation

uses A_Const, A_DM, A_Lib, A_EPdrK;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure ShowModalKassu(nKdPdr : integer; var bWasUpdated : boolean);
begin
  FormGetKss := TFormGetKss.Create(Application);
  with FormGetKss do begin
    bVuborMode := false;
    n_KdPdr := nKdPdr;
    b_WasUpdated := false;
    bBtnOK.Visible := false;
    Caption := 'Справочник касс';
    bBtnCancel.Caption := 'Выход';
    OpenQryPdr;
    if nKdPdr > 0 then
      qryPdr.Locate('KdWho', nKdPdr, []);
    ShowModal;
    bWasUpdated := b_WasUpdated;
    qryPdr.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKdKss(var nKdPdr, nKdVal, nKdSbu : integer;
                                               var cNmPdr : string) : boolean;
begin
  Result := false;
  FormGetKss := TFormGetKss.Create(Application);
  with FormGetKss do begin
    bVuborMode := true;
    n_KdPdr := nKdPdr;
    bBtnOK.Visible := true;
    Caption := 'Выбор кассы';
    bBtnCancel.Caption := 'Отказ';
    OpenQryPdr;
    if nKdPdr > 0 then
      qryPdr.Locate('KdWho', nKdPdr, []);
    if ShowModal = mrOk then begin
      nKdPdr := qryPdr.FieldByName('KdWho').asInteger;
      nKdVal := qryPdr.FieldByName('KdValPdr').asInteger;
      nKdSbu := qryPdr.FieldByName('KdSbu').asInteger;
      cNmPdr := qryPdr.FieldByName('NmWho').asString;
      Result := true;
    end;
    qryPdr.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.OpenQryPdr;
begin
  with qryPdr do begin
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select * from WhoForKssPdr');
    SQL.Add(' order by PrWho, NmWho');
    Open;
    if n_KdPdr <> 0 then
      Locate('KdWho', n_KdPdr, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.FormCreate(Sender: TObject);
begin
  b_WasUpdated := false;
  popMnu.AutoPopup := (nAppUsrKat <= 3);
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 151);
	  Top    := ReadInteger(SECTION, 'wT', 190);
    Height := ReadInteger(SECTION, 'wH', 310);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.popMnuPopup(Sender: TObject);
begin
  popMnuEdt.Enabled := dbgrPdr.DataSource.DataSet.RecordCount <> 0;
  popMnuDel.Enabled := popMnuEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.popMnuEdtClick(Sender: TObject);
var nSvKdWho, nKdSchBU, nKdVal : integer;
    cNmPdr, cNotes, cSchBU, cNmVal, cShfr : string;
begin
  with qryPdr do begin
    nKdSchBU := FieldByName('KdSbu').AsInteger;
    nKdVal   := FieldByName('KdValPdr').AsInteger;
    cNmPdr   := FieldByName('NmWho').AsString;
    cNotes   := FieldByName('Notes').AsString;
    cSchBU   := FieldByName('SchBU').AsString;
    cNmVal   := FieldByName('NmValSokr').AsString;
    cShfr    := FieldByName('Shfr').AsString;
  end;
  if EdtKssPdr(cNmPdr, cNotes, cSchBU, cNmVal,
                                       nKdSchBU, nKdVal) {A_EPdrK} then begin
    Application.ProcessMessages;
    with qryTmp do begin
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := qryPdr.DataBaseName;
      SQL.Add('Update Kd_Who ' +
                ' set NmWho = :cNmWho, Notes = :cNotes, ' +
                  ' KdValPdr = :nKdVal, KdSbu = :nKdSbu ' +
                    ' where KdWho = :nKdWho');
      ParamByName('cNmWho').asString  := cNmPdr;
      ParamByName('cNotes').asString  := cNotes;
      ParamByName('nKdVal').asInteger := nKdVal;
      ParamByName('nKdSbu').asInteger := nKdSchBu;
      ParamByName('nKdWho').asInteger := qryPdr.FieldByName('KdWho').asInteger;
      ExecSQL;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    b_WasUpdated := true;
    with qryPdr do begin
      nSvKdWho := FieldByName('KdWho').asInteger;
      Close;
      Open;
      Locate('KdWho', nSvKdWho, []);
    end;
    with Form_Dm.cdsWhoLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.popMnuAddClick(Sender: TObject);
var cNmPdr, cPdrNotes, cSchBU, cNmVal : string;
    nKdSchBU, nKdVal, nNewKdPdr : integer;
begin
  if AddKssPdr(cNmPdr, cPdrNotes, cSchBU, cNmVal, {A_EPdrK}
                                          nKdSchBU, nKdVal) then begin
    Application.ProcessMessages;
    Form_Dm.DbMain.StartTransaction;
    with Form_Dm.qryTmp do begin
      if Active then Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := qryPdr.DatabaseName;
      SQL.Add('Select max(KdWho) as MaxPdr from Kd_Who where (KdWho < 3500)');
      Open;
      if (RecordCount > 0) and (FieldByName('MaxPdr').asInteger > 0) then
        nNewKdPdr := FieldByName('MaxPdr').asInteger + 1
      else
        nNewKdPdr := 1;
      Close;
      SQL.Clear;
      SQL.Add('Insert into Kd_Who ' +
               ' (KdWho, NmWho, NmWhoE, PrWho, Notes, KdSbu, ' +
                '  KdValPdr, Shfr) values (:nKdWho, :cNmWho, ' +
                 '  :cNmWhoE, :nPrWho, :cNotes, :nKdSbu, :nKdVal, "kss")');
      ParamByName('nKdWho').asInteger := nNewKdPdr;
      ParamByName('cNmWho').asString  := cNmPdr;
      ParamByName('cNmWhoE').asString := '';
      ParamByName('cNotes').asString  := cPdrNotes;
      ParamByName('nPrWho').asInteger := 1;
      ParamByName('nKdSbu').asInteger := nKdSchBu;
      ParamByName('nKdVal').asInteger := nKdVal;
      ExecSQL;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    Form_Dm.DbMain.Commit;
    b_WasUpdated := true;
    with qryPdr do begin
      Close;
      Open;
      Locate('KdWho', nNewKdPdr, []);
    end;
    with Form_Dm.cdsWhoLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.popMnuDelClick(Sender: TObject);
var bCanDelete, bWasDeleted, bEof : boolean;
    nSvNR, nDelWho : integer; cErrMsg : string;
begin  Application.ProcessMessages;
  bWasDeleted := false;
  nDelWho := qryPdr.FieldByName('KdWho').asInteger;
  bCanDelete := Form_Dm.GlCanDelete(CESMAIN, 'Kd_Who', 'KdWho',
                                                      nDelWho, cErrMsg);
  if not bCanDelete then begin
    MessageDlg('Нельзя удалять эту запись - ' +
               'на нее ссылается' + #13#10 + 'таблица ' + cErrMsg,
                                                          mtError, [mbOk], 0);
    Exit; end
  else if (MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes) then
                                                           with qryTmp do begin
    Application.ProcessMessages;
    Close;
    SQL.Clear;
    DataBaseName := qryPdr.DatabaseName;
    SQL.Add('Delete from Kd_Who where KdWho = :nKdWho');
    ParamByName('nKdWho').asSmallInt := nDelWho;
    ExecSQL;
    bWasDeleted := true;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if bWasDeleted then with qryPdr do begin
    bEof := false;
    nSvNR := 0;
    Next;
    if Eof then
      bEof := true
    else
      nSvNR := FieldByName('NR').asInteger;
    Close;
    Open;
    if bEof then
      Last
    else
      Locate('NR', nSvNR, []);
  end;
  if bWasDeleted then with Form_Dm.cdsWhoLU do begin
    Close;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.dbgrPdrDblClick(Sender: TObject);
begin
  if bVuborMode and
                  (dbgrPdr.DataSource.DataSet.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGetKss.dbgrPdrKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) and
        (dbgrPdr.DataSource.DataSet.RecordCount <> 0) then
    dbgrPdrDblClick(Self);
end;

end.
