unit A_GtBnk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Db, Grids, DBGrids, ExtCtrls,
  DBTables, IniFiles, Menus, Buttons;

type
  TFormKdBnkPdr = class(TForm)
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
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryPdrKDBNK: TSmallintField;
    qryPdrNMBNKR: TStringField;
    qryPdrNMBNKE: TStringField;
    qryPdrADRBANK: TStringField;
    qryPdrADRBANKE: TStringField;
    qryPdrKB_RSCH: TStringField;
    qryPdrKB_MFO: TStringField;
    qryPdrKB_OKPO: TStringField;
    popMnuAddNac: TMenuItem;
    popMnuAddVal: TMenuItem;
    qryPdrNR_GORD: TStringField;
    qryPdrNM_GORD: TStringField;
    Label9: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    Label11: TLabel;
    qryPdrKDIF: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OpenQryPdr;
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddNacClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure dbgrPdrDblClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure popMnuAddValClick(Sender: TObject);
    procedure dbgrPdrDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    b_WasUpdated : boolean;
  public
    { Public declarations }
  end;

procedure ShowModalBnkPdr(nKdPdr : integer; var bWasUpdated : boolean);
function GetKdBnkPdr(var nKdPdr, nKdVal, nKdSbu : integer;
                                      var cNmPdr : string) : boolean;

var
  FormKdBnkPdr: TFormKdBnkPdr;
  n_KdPdr : integer;
  bVuborMode : boolean;
  bSvBtnOkVisible, bSvFilterMode : boolean;

const SECTION = 'A_GtBnk';

implementation

uses A_Const, A_DM, A_Lib, A_EPdrB;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure ShowModalBnkPdr(nKdPdr : integer; var bWasUpdated : boolean);
begin
  n_KdPdr := nKdPdr;
  bVuborMode := false;
  FormKdBnkPdr := TFormKdBnkPdr.Create(Application);
  with FormKdBnkPdr do begin
    Caption := 'Подразделения и их расчётные счета';
    bBtnOK.Visible := false;
    bBtnCancel.Caption := 'Выход';
    OpenQryPdr;
    ShowModal;
    bWasUpdated := b_WasUpdated;
    qryPdr.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKdBnkPdr(var nKdPdr, nKdVal, nKdSbu : integer;
                                       var cNmPdr : string) : boolean;
begin
  bVuborMode := true;
  Result := false;
  FormKdBnkPdr := TFormKdBnkPdr.Create(Application);
  with FormKdBnkPdr do begin
    bBtnOK.Visible := true;
    Caption := 'Выбор подразделения';
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
procedure TFormKdBnkPdr.OpenQryPdr;
begin
  with qryPdr do begin
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select * from WhoForBnkPdr ' +
            ' where (ShPPdr is null or ShPPdr = "")');   // есть такой view
    SQL.Add('order by PrWho, Shfr, NmWho');
    Open;
    if n_KdPdr <> 0 then
      Locate('KdWho', n_KdPdr, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.FormCreate(Sender: TObject);
begin
  b_WasUpdated := false;
  popMnu.AutoPopup := (nAppUsrKat <= 3);
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 151);
	  Top    := ReadInteger(SECTION, 'wT', 190);
    Height := ReadInteger(SECTION, 'wH', 310);
	  Free;
  end;
  if FileExists(cDirVids + 'g_BnkPdr.vid') then
    dbgrPdr.Columns.LoadFromFile(cDirVids + 'g_BnkPdr.vid');
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPdr.Columns.SaveToFile(cDirVids + 'g_BnkPdr.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.popMnuPopup(Sender: TObject);
begin
  popMnuEdt.Enabled := dbgrPdr.DataSource.DataSet.RecordCount <> 0;
  popMnuDel.Enabled := popMnuEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.popMnuEdtClick(Sender: TObject);
var nKdPdr, nKdRSch, nKdSchBU, nKdVal, nKdBnk : integer;
    cNmPdr, cNotes, cNmRSch,
    cRSch, cMfo, cOkpo, cNmBank, cSchBU, cNmVal, cShfr : string;
    bIsVal : boolean; cLogMsg : string;
    cNr_GOrd, cNm_GOrd : ShortString;
begin
  with qryPdr do begin
    nKdPdr    := FieldByName('KdWho').asInteger;
    cNmPdr    := FieldByName('NmWho').asString;
    nKdSchBU  := FieldByName('KdSbu').asInteger;
    nKdVal    := FieldByName('KdValPdr').asInteger;
    cNotes    := FieldByName('Notes').asString;
    nKdRSch   := FieldByName('KdRSch').asInteger;
    cNmRSch   := FieldByName('NmSch').asString;
    cRSch     := FieldByName('RSch').asString;
    cMfo      := FieldByName('Mfo').asString;
    cOkpo     := FieldByName('Okpo').asString;
    nKdBnk    := FieldByName('KdBnk').asInteger;
    cNmBank   := FieldByName('NmBank').asString;
    cSchBU    := FieldByName('SchBU').asString;
    cNmVal    := FieldByName('NmValSokr').asString;
    cShfr     := FieldByName('Shfr').asString;
    cNr_GOrd  := FieldByName('Nr_GOrd').AsString;
    cNm_GOrd  := FieldByName('Nm_GOrd').AsString;
  end;
  if nKdVal <> nAppKdBazVal then
    bIsVal := true
  else
    bIsVal := false;
  if EdtBnkPdr(bIsVal, nKdPdr, cNmPdr, cNotes, cNmRSch,  {A_EPdrB}
                         cRSch, cMfo, cOkpo, cNmBank, cSchBU, cNmVal,
                    nKdSchBU, nKdVal, nKdBnk, cNr_GOrd, cNm_GOrd) then begin
    Application.ProcessMessages;
    with qryTmp do begin
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update Kd_Who ' +
              ' set NmWho = :cNmWho, Okpo = :cOkpo, Notes = :cNotes, ' +
              ' KdValPdr = :nKdVal, KdSbu = :nKdSbu, ' +
              ' Nr_GOrd = :cNr_GOrd, Nm_GOrd = :cNm_GOrd ' +
              ' where KdWho = :nKdWho');
      ParamByName('cNmWho').asString   := cNmPdr;
      ParamByName('cOkpo').asString    := cOkpo;
      ParamByName('cNotes').asString   := cNotes;
      ParamByName('nKdVal').asInteger  := nKdVal;
      ParamByName('nKdSbu').asInteger  := nKdSchBu;
      ParamByName('nKdWho').asInteger  := nKdPdr;
      ParamByName('cNr_GOrd').AsString := cNr_GOrd;
      ParamByName('cNm_GOrd').AsString := cNm_GOrd;
      ExecSQL;
      SQL.Clear;
      Params.Clear;
      SQL.Add('Update Kd_RSch ' +
              ' set NmSch = :cNmRSch, ' +
              ' NmBank = :cNmBank, RSch = :cRSch, ' +
              ' Mfo = :cMfo, Okpo = :cOkpo ' +
              ' where (KdWho = :nKdWho) and ' +
              ' (KdRSch = :nKdRSch)');
      ParamByName('cNmRSch').asString := cNmRSch;
      ParamByName('cNmBank').asString := cNmBank;
      ParamByName('cRSch').asString := cRSch;
      ParamByName('cMfo').asString := cMfo;
      ParamByName('cOkpo').asString := cOkpo;
      ParamByName('nKdWho').asInteger := nKdPdr;
      ParamByName('nKdRSch').asInteger := nKdRSch;
      ExecSQL;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := '';
      cLogMsg := 'Edt/Add KdPdr = ' + IntToStr(nKdPdr) + ', ' + cNmPdr + ' ' +
                 cNmRSch + ' ' + cRSch + ' ' + cMfo + ' ' + cOkpo + ' ' +
                 cNmBank;
      Form_Dm.AddLog(Now, 0, 'AddEdtPdr', cAppNmUsr, 'Who_RSch', cLogMsg);
    end;
    b_WasUpdated := true;
    with qryPdr do begin
      Close;
      Open;
      Locate('KdWho', nKdRSch, []);
    end;
    with Form_DM.cdsWhoLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.popMnuAddNacClick(Sender: TObject); // add Банк
var cNmPdr, cPdrNotes, cNmSch, cRSch, cMfo,
    cOkpo, cNmBank, cSchBU, cNmVal : string;
    nKdSchBU, nKdVal, nKdBnk, nNewKdPdr : integer;
    bIsValPdr : boolean;
    cNr_GOrd, cNm_GOrd : ShortString;
begin
  bIsValPdr := false;
  if AddBnkPdr(bIsValPdr, cNmPdr, cPdrNotes, cNmSch, cRSch, {A_EPdrB}
                      cMfo, cOkpo, cNmBank, cSchBU, cNmVal,
                      nKdSchBU, nKdVal, nKdBnk, cNr_GOrd, cNm_GOrd) then begin
    Application.ProcessMessages;
    Form_Dm.DbMain.StartTransaction;
    with Form_Dm.qryTmp do begin
      if Active then Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select max(KdWho) as MaxPdr from Kd_Who ' +
              ' where (KdWho < 3500)');
      Open;
      if (RecordCount > 0) and
                (FieldByName('MaxPdr').asInteger > 0) then
        nNewKdPdr := FieldByName('MaxPdr').asInteger + 1
      else
        nNewKdPdr := 1;
      Close;
      SQL.Clear;
      SQL.Add('Insert into Kd_Who ' +
           ' (KdWho, NmWho, NmWhoE, Okpo, PrWho, Notes, KdSbu, ' +
           ' KdValPdr, Nr_GOrd, Nm_GOrd, Shfr) values (:nKdWho, :cNmWho, ' +
           ' :cNmWhoE, :cOkpo, :nPrWho, :cNotes, :nKdSbu, :nKdVal, ' +
           ' :cNr_GOrd, :cNm_GOrd, "bnk")');
      ParamByName('nKdWho').asInteger := nNewKdPdr;
      ParamByName('cNmWho').asString  := cNmPdr;
      ParamByName('cNmWhoE').asString := '';
      ParamByName('cOkpo').asString   := cOkpo;
      ParamByName('cNotes').asString  := cPdrNotes;
      ParamByName('nPrWho').asInteger := 1;
      ParamByName('nKdSbu').asInteger := nKdSchBu;
      ParamByName('nKdVal').asInteger := nKdVal;
      ParamByName('cNr_GOrd').AsString := cNr_GOrd;
      ParamByName('cNm_GOrd').AsString := cNm_GOrd;
      ExecSQL;
      Close;
      SQL.Clear;
      Params.Clear;
      SQL.Add('Insert into Kd_RSch ' +
              ' (KdRSch, KdWho, NmSch, NmBank, RSch, Mfo, Okpo) ' +
              ' values (:nKdRSch, :nKdWho, :cNmSch, :cNmBank, ' +
              ' :cRSch, :cMfo, :cOkpo)');
      ParamByName('nKdRSch').asInteger   := 0;
      // КодРасчСчёта переприсвоит триггер.
      ParamByName('nKdWho').asInteger    := nNewKdPdr;
      ParamByName('cNmSch').asString     := cNmSch;
      ParamByName('cNmBank').asString    := cNmBank;
      ParamByName('cRSch').asString      := cRSch;
      ParamByName('cMfo').asString       := cMfo;
      ParamByName('cOkpo').asString      := cOkpo;
      ExecSQL;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := '';
    end;
    Form_Dm.DbMain.Commit;
    b_WasUpdated := true;
    with qryPdr do begin
      Close;
      Open;
      Locate('KdWho', nNewKdPdr, []);
    end;
    with Form_DM.cdsWhoLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.popMnuAddValClick(Sender: TObject);
var cNmPdr, cPdrNotes, cNmSch, cRSch, cMfo,
    cOkpo, cNmBank, cSchBU, cNmVal : string;
    nKdSchBU, nKdVal, nKdBnk, nNewKdPdr : integer;
    bIsValPdr : boolean;
    cNr_GOrd, cNm_GOrd : ShortString;
begin
  bIsValPdr := true;
  if AddBnkPdr(bIsValPdr, cNmPdr, cPdrNotes, cNmSch, cRSch, {A_EPdrB}
                      cMfo, cOkpo, cNmBank, cSchBU, cNmVal,
                      nKdSchBU, nKdVal, nKdBnk, cNr_GOrd, cNm_GOrd) then begin
    Application.ProcessMessages;
    Form_Dm.DbMain.StartTransaction;
    with Form_Dm.qryTmp do begin
      if Active then Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select max(KdWho) as MaxPdr from Kd_Who ' +
              ' where (KdWho < 3500)');
      Open;
      if (RecordCount > 0) and
                (FieldByName('MaxPdr').asInteger > 0) then
        nNewKdPdr := FieldByName('MaxPdr').asInteger + 1
      else
        nNewKdPdr := 1;
      Close;
      SQL.Clear;
      SQL.Add('Insert into Kd_Who ' +
           ' (KdWho, NmWho, NmWhoE, Okpo, PrWho, Notes, KdSbu, ' +
           ' KdValPdr, Nr_GOrd, Nm_GOrd, Shfr) values (:nKdWho, :cNmWho, ' +
           ' :cNmWhoE, :cOkpo, :nPrWho, :cNotes, :nKdSbu, :nKdVal, ' +
           ' :cNr_GOrd, :cNm_GOrd, "bnk")');
      ParamByName('nKdWho').asInteger := nNewKdPdr;
      ParamByName('cNmWho').asString  := cNmPdr;
      ParamByName('cNmWhoE').asString := '';
      ParamByName('cOkpo').AsString   := cOkpo;
      ParamByName('cNotes').asString  := cPdrNotes;
      ParamByName('nPrWho').asInteger := 1;
      ParamByName('nKdSbu').asInteger := nKdSchBu;
      ParamByName('nKdVal').asInteger := nKdVal;
      ParamByName('cNr_GOrd').AsString := cNr_GOrd;
      ParamByName('cNm_GOrd').AsString := cNm_GOrd;
      ExecSQL;
      Close;
      SQL.Clear;
      Params.Clear;
      SQL.Add('Insert into Kd_RSch ' +
              ' (KdRSch, KdWho, NmSch, NmBank, RSch, Mfo, Okpo) ' +
              ' values (:nKdRSch, :nKdWho, :cNmSch, :cNmBank, ' +
              ' :cRSch, :cMfo, :cOkpo)');
      ParamByName('nKdRSch').asInteger   := 0;
      // КодРасчСчёта переприсвоит триггер.
      ParamByName('nKdWho').asInteger    := nNewKdPdr;
      ParamByName('cNmSch').asString     := cNmSch;
      ParamByName('cNmBank').asString    := cNmBank;
      ParamByName('cRSch').asString      := cRSch;
      ParamByName('cMfo').asString       := cMfo;
      ParamByName('cOkpo').asString      := cOkpo;
      ExecSQL;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := '';
    end;
    Form_Dm.DbMain.Commit;
    b_WasUpdated := true;
    with qryPdr do begin
      Close;
      Open;
      Locate('KdWho', nNewKdPdr, []);
    end;
    with Form_DM.cdsWhoLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.popMnuDelClick(Sender: TObject);
var bCanDelete, bWasDeleted : boolean;
    nSvPosWho, nDelWho, nSvKdWho : integer;
    cErrMsg : string;
begin
  Application.ProcessMessages;
  with qryPdr do begin
    nDelWho := FieldByName('KdWho').AsInteger;
    nSvKdWho := FieldByName('KdWho').AsInteger;
    DisableControls;
    Next;
    if not eof then
      nSvPosWho := FieldByName('KdWho').AsInteger
    else begin
      MoveBy(-2);
      if not bof then
        nSvPosWho := FieldByName('KdWho').AsInteger
      else
        nSvPosWho := 0;
    end;
    Locate('KdWho', nSvKdWho, []);
    EnableControls;
  end;
  bWasDeleted := false;
  // Удаляется подразделение. Т.к. расч.счёт у подраз-
  // деления только один и на него выход возможен только через
  // KdWho, то значит можно вместе с удалением записи в Kd_Who
  // однозначно удалить и запись в Kd_RSch
  // Проверить, не задействован ли удаляемый KdWho среди KdPdr, KdKli
  bCanDelete := Form_Dm.GlCanDelete(CESMAIN, 'Kd_Who', 'KdWho', nDelWho, cErrMsg);
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
    Params.Clear;
    // Сначала удалить счёт - иначе не даст сервер.
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Kd_RSch ' +
            ' where (KdWho = ' +
                         qryPdr.FieldByName('KdWho').asString + ')');
    ExecSQL;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Kd_Who where KdWho = ' +
                               qryPdr.FieldByName('KdWho').asString);
    ExecSQL;
    bWasDeleted := true;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
  end;
  if bWasDeleted then with qryPdr do begin
    Close;
    Open;
    Locate('KdWho', nSvPosWho, []);
  end;
  if bWasDeleted then with Form_DM.cdsWhoLU do begin
    Close;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.dbgrPdrDblClick(Sender: TObject);
begin
  if bVuborMode and
                  (dbgrPdr.DataSource.DataSet.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormKdBnkPdr.dbgrPdrDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                        State: TGridDrawState);
begin
  with dbgrPdr.Canvas do begin
    if not (gdFocused in State) then begin
      if qryPdrKdBnk.IsNull or (qryPdrKdBnk.AsInteger = 0) then
        Font.Color := clWindowText
      else begin
        Font.Color := clNavy;
        Font.Style := [fsBold];
      end;
    end;
  end;
  dbgrPdr.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
