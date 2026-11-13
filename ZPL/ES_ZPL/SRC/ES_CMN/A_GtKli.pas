unit A_GtKli;

interface

uses
	SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, Grids, DBGrids, ExtCtrls,
  DBTables, DB, StdCtrls, DBCtrls, Buttons, Mask, IniFiles, Menus, ComCtrls;

type
	TFormGetKli = class(TForm)
    dsrcWho: TDataSource;
    qryWho: TQuery;
    qryWhoKDWHO: TSmallintField;
    qryWhoNMWHO: TStringField;
    qryWhoNMWHOE: TStringField;
    qryWhoPRWHO: TSmallintField;
    PanelWho: TPanel;
    PanelTools: TPanel;
    popMnuWho: TPopupMenu;
    popMnuWhoEdt: TMenuItem;
    popMnuWhoAddKli: TMenuItem;
    popMnuWhoDel: TMenuItem;
    popMnuWhoDm1: TMenuItem;
    qryWhoNOTES: TStringField;
    DBMemoNotes: TDBMemo;
    PanelHeadNotes: TPanel;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    qryTmp: TQuery;
    qryWhoNR: TIntegerField;
    qryWhoKDSBU: TSmallintField;
    qryWhoSHFR: TStringField;
    qryWhoKDVALPDR: TSmallintField;
    qryWhoOLD_KPR: TSmallintField;
    qryWhoOLD_KOBJ: TSmallintField;
    qryWhoORGMNE: TStringField;
    qryWhoOKPO: TStringField;
    qryWhoADRES: TStringField;
    popMnuWhoSort: TMenuItem;
    popMnuWhoSortByNmKli: TMenuItem;
    popMnuWhoSortByKdKli: TMenuItem;
    Panel1: TPanel;
    dbgrWho: TDBGrid;
    LabelCntRec: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    dtPicLDtOper: TDateTimePicker;
    sBtnGo: TSpeedButton;
    qryWhoKDIF: TSmallintField;
    qryWhoLDTOPER: TDateTimeField;
    popMnuWhoSortByOkpo: TMenuItem;
    popMnuWhoFind: TMenuItem;
		procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject;
                                        var Action: TCloseAction);
    procedure popMnuWhoAddKliClick(Sender: TObject);
    procedure popMnuWhoEdtClick(Sender: TObject);
    procedure popMnuWhoDelClick(Sender: TObject);
    procedure popMnuWhoPopup(Sender: TObject);
    procedure dbgrWhoDblClick(Sender: TObject);
    procedure dbgrWhoKeyDown(Sender: TObject; var Key: Word;
                                             Shift: TShiftState);
    procedure OpenQryWho;
    procedure popMnuWhoSortByNmKliClick(Sender: TObject);
    procedure popMnuWhoSortByKdKliClick(Sender: TObject);
    procedure sBtnGoClick(Sender: TObject);
    procedure dtPicLDtOperCloseUp(Sender: TObject);
    procedure popMnuWhoSortByOkpoClick(Sender: TObject);
    procedure popMnuWhoFindClick(Sender: TObject);
	private
		{ Private declarations }
    d_LDtOper : TDateTime;
    nSortCase : SmallInt;
	public
		{ Public declarations }
	end;

function GetKdKli(var nKdKli : integer; var cNmKli : string) : boolean;

const SECTION = 'A_GtKli';

var
	FormGetKli: TFormGetKli;
  n_KdWho : integer;
  bVuborMode : boolean;

implementation

{$R *.DFM}

uses A_Const, A_DM, A_Lib, A_KliFnd, A_KliNew, A_EKli, B_GtUslR, A_FindRS,
     a_GtKli2;

//------------------------------------------------------------------------------
function GetKdKli(var nKdKli : integer; var cNmKli : string) : boolean;
begin         // Показывать только клиентов без расчётных счетов
  Result := false;
  n_KdWho := nKdKli;
  bVuborMode := true;
  FormGetKli := TFormGetKli.Create(Application);
  with FormGetKli do begin
    bBtnOK.Visible := true;
    if d_LDtOper > 0 then
      dtPicLDtOper.Date := d_LDtOper;
    OpenQryWho;
    if nKdKli <> 0 then
      qryWho.Locate('KdWho', nKdKli, []);
    bBtnCancel.Caption := 'Отказ';
    if ShowModal = mrOk then begin
      Result  := true;
      nKdKli  := qryWho.FieldByName('KdWho').AsInteger;
      cNmKli  := qryWho.FieldByName('NmWho').AsString;
    end;
    qryWho.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.OpenQryWho;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryWho do begin
    if Active then
      nSvNR := FieldByName('NR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Who where KdWho >= 5000 and ' +
            ' LDtOper >= :dLDtOper');
    if popMnuWhoSortByNmKli.Checked  then
      SQL.Add(' order by PrWho, NmWho')
    else if popMnuWhoSortByKdKli.Checked  then
      SQL.Add(' order by PrWho, KdWho')
    else
      SQL.Add(' order by OKPO');
    ParamByName('dLDtOper').AsDateTime := dtPicLDtOper.Date;
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    if nSvNR > 0 then
      Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 150);
	  Top    := ReadInteger(SECTION, 'wT', 190);
    Height := ReadInteger(SECTION, 'wH', 280);
    Width  := ReadInteger(SECTION, 'wW', 431);
    d_LDtOper := ReadDate(SECTION, 'dLDtOper', 0);
    nSortCase := ReadInteger(SECTION, 'nSortCase', 1);
    popMnuWhoSortByNmKli.Checked := nSortCase = 1;
    popMnuWhoSortByKdKli.Checked := nSortCase = 2;
    popMnuWhoSortByOkpo.Checked := nSortCase = 3;
	  Free;
  end;
  if FileExists(cDirVids + 'GtKli02.vid') then
    dbgrWho.Columns.LoadFromFile(cDirVids + 'GtKli02.vid');
  Caption := 'Справочник клиентов';
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrWho.Columns.SaveToFile(cDirVids + 'GtKli02.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteDate(SECTION, 'dLDtOper', d_LDtOper);
    if popMnuWhoSortByNmKli.Checked then
      WriteInteger(SECTION, 'nSortCase', 1)
    else if popMnuWhoSortByKdKli.Checked then
      WriteInteger(SECTION, 'nSortCase', 2)
    else
      WriteInteger(SECTION, 'nSortCase', 3);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoFindClick(Sender: TObject);
var nKdKli : SmallInt;
begin
  nKdKli := qryWhoKdWho.AsInteger;
  if GtKli2(nKdKli, qryWho) {a_GtKli2} then begin
    // Nothing Всё сделается в a_GtKli2
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoAddKliClick(Sender: TObject);
var cNmKli, cAdres, cNotes, cNmRSch, cRSch, cMfo,
    cOkpo, cNmBank, cNotesRS, cSwift : ShortString;
    nNewKdKli, nKdBank : SmallInt;
    bIsVal : boolean;
begin
  bIsVal := false;
  nKdBank := 0;
  if AddKlient(bIsVal, cNmKli, cAdres, cNotes, cNmRSch, cRSch, {A_KliNew}
                   cMfo, cOkpo, cNmBank, cNotesRS, cSwift, nKdBank) then begin
    Application.ProcessMessages;
    Form_Dm.DbMain.StartTransaction;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select Max(KdWho) as MaxWho from Kd_Who ' +
              ' where (KdWho > 5000)');
      Open;
      if (RecordCount > 0) and
                (FieldByName('MaxWho').AsInteger > 0) then
        nNewKdKli := FieldByName('MaxWho').AsInteger + 1
      else
        nNewKdKli := 5001;
      Close;
      SQL.Clear;
      SQL.Add('Insert into Kd_Who ' +
              ' (KdWho, NmWho, Adres, NmWhoE, PrWho, Notes) ' +
              ' values (:nKdWho, :cNmWho, :cAdres, ' +
              ' :cNmWhoE, :nPrWho, :cNotes)');
      ParamByName('nKdWho').AsInteger := nNewKdKli;
      ParamByName('cNmWho').AsString  := cNmKli;
      ParamByName('cAdres').AsString  := cAdres;
      ParamByName('cNmWhoE').AsString := '';
      ParamByName('cNotes').AsString  := cNotes;
      ParamByName('nPrWho').AsInteger := 10;
      ExecSQL;
      Close;
      SQL.Clear;
      Params.Clear;
      if (cNmRSch <> '') and (cRSch <> '') then begin
        SQL.Add('Insert into Kd_RSch ' +
                ' (KdRSch, KdWho, NmSch, NmBank, RSch, Mfo, ' +
                ' Okpo, Notes) ' +
                ' values (:nKdRSch, :nKdWho, :cNmSch, :cNmBank, ' +
                ' :cRSch, :cMfo, :cOkpo, :cNotesRS)');
        ParamByName('nKdRSch').AsInteger := Form_Dm.NewKdRSch;
        ParamByName('nKdWho').AsInteger  := nNewKdKli;
        ParamByName('cNmSch').AsString   := cNmRSch;
        ParamByName('cNmBank').AsString  := cNmBank;
        ParamByName('cRSch').AsString    := cRSch;
        ParamByName('cMfo').AsString     := cMfo;
        ParamByName('cOkpo').AsString    := cOkpo;
        ParamByName('cNotesRS').AsString := cNotesRS;
        ExecSQL;
        Close;
        SQL.Clear;
        Params.Clear;
      end;
      DataBaseName := '';
    end;
    Form_Dm.DbMain.Commit;
    with qryWho do begin
      Close;
      Open;
      Locate('KdWho', nNewKdKli, []);
    end;
    with Form_Dm.cdsWhoLU do begin
      Close;
      Open;
    end;
    with Form_Dm.cdsRSchLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoEdtClick(Sender: TObject);
var bIsRSch, bEdtRSch : boolean;
    nSvKdWho : integer;
    cNmKli, cOkpo, cNotes, cAdres : string;
begin
  // Клиент - редактируется только NmWho и Notes в Kd_Who
  bIsRSCh  := false;          // qryRSch.RecordCount > 0;
  bEdtRSch := false;
  cNmKli   := qryWho.FieldByName('NmWho').AsString;
  cAdres   := qryWho.FieldByName('Adres').AsString;
  cNotes   := qryWho.FieldByName('Notes').AsString;
  cOkpo    := qryWho.FieldByName('OKPO').AsString;
  if EdtKlient(cNmKli, cOkpo, cNotes, cAdres, bIsRSch,
                                              bEdtRSch) {B_KliEdt} then begin
    Application.ProcessMessages;
    with Form_Dm.qryTmp do begin
      if Active then Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := qryWho.DataBaseName;
      SQL.Add('Update Kd_Who ' +
              ' set NmWho = :cNmKli, Okpo = :cOkpo, Notes = :cNotes, ' +
              ' Adres = :cAdres where KdWho = ' +
                     qryWho.FieldByName('KdWho').AsString);
      ParamByName('cNmKli').AsString := cNmKli;
      ParamByName('cOkpo').AsString  := cOkpo;
      ParamByName('cAdres').AsString := cAdres;
      ParamByName('cNotes').AsString := cNotes;
      ExecSQL;
      SQL.Clear;
      Params.Clear;
      DataBaseName := '';
    end;
    with qryWho do begin
      nSvKdWho := FieldByName('KdWho').AsInteger;
      Close;
      Open;
      Locate('KdWho', nSvKdWho, []);
    end;
    with Form_Dm.cdsWhoLU do begin
      Close;
      Open;
    end;
{
    if bIsFormBank and not
                 (Form_Dm.qryDgv.State in [dsInsert, dsEdit]) then
                                          with Form_Dm.qryDgv do begin
      nSvNR :=  FieldByName('NR').AsInteger;
      Close;
      Open;
      Locate('NR', nSvNR, []);
    end;
}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoDelClick(Sender: TObject);
var bCanDelete, bWasDeleted : boolean;
    nSvPosWho : integer; mBookMark : TBookMark;
    cErrMsg : string;
begin
  Application.ProcessMessages;
  with qryWho do begin
    mBookMark := GetBookMark;
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
    GoToBookMark(mBookMark);
    FreeBookMark(mBookMark);
    EnableControls;
  end;
  bWasDeleted := false;
  if qryWho.FieldByName('KdWho').AsInteger > 5000 then begin
    // Попытка удалить запись клиента в Kd_Who.
    // Если в qryRSch есть связанные с этим KdWho записи, то
    // пусть сначала удалит расчётные счета.
    // Иначе проверить нет ли ссылок среди
    // KdPdr, KdKli
    bCanDelete := Form_Dm.GlCanDelete(CESMAIN, 'Kd_Who', 'KdWho',
                   qryWho.FieldByName('KdWho').AsInteger, cErrMsg);
    if not bCanDelete then begin
      MessageDlg('Нельзя удалять эту запись - ' +
                 'на нее есть ссылки' + #13#10 +
                 'в таблице ' + cErrMsg, mtError, [mbOk], 0);
      Exit; end
    else if (MessageDlg(C_PREDDELMSG, mtWarning,
                 [mbYes, mbNo], 0) = mrYes) then with Form_Dm.qryTmp do begin
      Application.ProcessMessages;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := qryWho.DataBaseName;
      SQL.Add('Delete from Kd_Who ' +
              ' where KdWho = ' + qryWho.FieldByName('KdWho').AsString);
      ExecSQL;
      bWasDeleted := true;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := '';
    end;
  end;
  if bWasDeleted then begin
    with qryWho do begin
      Close;
      Open;
      Locate('KdWho', nSvPosWho, []);
    end;
    with Form_Dm.cdsWhoLU do begin
      Close;
      Open;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoPopup(Sender: TObject);
begin
  popMnuWhoEdt.Enabled := (qryWho.RecordCount <> 0);
  popMnuWhoDel.Enabled := (qryWho.RecordCount <> 0);
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.dbgrWhoDblClick(Sender: TObject);
begin
  if bVuborMode then
    ModalResult := mrOk
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.dbgrWhoKeyDown(Sender: TObject;
                               var Key: Word; Shift: TShiftState);
begin
  if bVuborMode and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    ModalResult := mrOk
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoSortByNmKliClick(Sender: TObject);
begin
  if not popMnuWhoSortByNmKli.Checked then begin
    popMnuWhoSortByNmKli.Checked := true;
    popMnuWhoSortByKdKli.Checked := false;
    popMnuWhoSortByOkpo.Checked  := false;
    OpenQryWho;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoSortByKdKliClick(Sender: TObject);
begin
  if not popMnuWhoSortByKdKli.Checked then begin
    popMnuWhoSortByKdKli.Checked := true;
    popMnuWhoSortByNmKli.Checked := false;
    popMnuWhoSortByOkpo.Checked  := false;
    OpenQryWho;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.popMnuWhoSortByOkpoClick(Sender: TObject);
begin
  if not popMnuWhoSortByOkpo.Checked then begin
    popMnuWhoSortByKdKli.Checked := false;
    popMnuWhoSortByNmKli.Checked := false;
    popMnuWhoSortByOkpo.Checked  := true;
    OpenQryWho;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.dtPicLDtOperCloseUp(Sender: TObject);
begin
  d_LDtOper := dtPicLDtOper.Date;
  sBtnGo.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormGetKli.sBtnGoClick(Sender: TObject);
begin
  d_LDtOper := dtPicLDtOper.Date;
  OpenQryWho;
end;

end.
