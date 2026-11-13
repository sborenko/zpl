unit z_EPrmUv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEAPrmUv = class(TForm)
    Label1: TLabel;
    dbeDtPriem: TDBEdit;
    Label2: TLabel;
    dbeDtUvoln: TDBEdit;
    Label3: TLabel;
    dbeNrPrikaza: TDBEdit;
    Label4: TLabel;
    dbeDtPrikaza: TDBEdit;
    Label5: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryTmp: TQuery;
    dbeKdSps: TDBEdit;
    Label6: TLabel;
    dbeNrPrUvoln: TDBEdit;
    dbeDtPrUvoln: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    dbeKdPidZv: TDBEdit;
    dbePidZviln: TDBEdit;
    sBtnKdPidZv: TSpeedButton;
    procedure DbeEnter(Sender: TObject);
    procedure DbeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeDtPriemExit(Sender: TObject);
    procedure dbeDtUvolnExit(Sender: TObject);
    procedure dbePidZvilnDblClick(Sender: TObject);
    procedure dbePidZvilnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBtnKdPidZvClick(Sender: TObject);
    procedure dbeKdPidZvExit(Sender: TObject);
  private
    { Private declarations }
    n_DsrcState : word;
    n_TabN : integer;
    function MyValidDtPrmUv(dDtPriem, dDtUvoln : TDateTime;
                                   nNR : integer; var cMsg : string) : boolean;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function AddEdtPrmUv(nTabN : integer; cFamIO : string;
                                             dsrcPrUv : TDataSource) : boolean;

const SECTION = 'Z_epRMuV';
const MY_STATE_EDIT = 0;
      MY_STATE_INSERT = 1;

var
  FormEAPrmUv: TFormEAPrmUv;

implementation

uses A_Const, Z_DM, Z_Main, z_PidZv, A_ShwErr, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtPrmUv(nTabN : integer; cFamIO : string;
                                             dsrcPrUv : TDataSource) : boolean;
begin
  Result := false;
  FormEAPrmUv := TFormEAPrmUv.Create(Application);
  with FormEAPrmUv do begin
    n_TabN := nTabN;
    dbeKdSps.DataSource := dsrcPrUv;
    dbeDtPriem.DataSource := dsrcPrUv;
    dbeDtUvoln.DataSource := dsrcPrUv;
    dbeNrPrikaza.DataSource := dsrcPrUv;
    dbeDtPrikaza.DataSource := dsrcPrUv;
    dbeNrPrUvoln.DataSource := dsrcPrUv;
    dbeDtPrUvoln.DataSource := dsrcPrUv;
    dbeNotes.DataSource := dsrcPrUv;
    n_DsrcState := MY_STATE_EDIT; // dsEdit
    if dsrcPrUv.State = dsInsert then begin
      Caption := cFamIO + ' [новая запись]';
      n_DsrcState := MY_STATE_INSERT; {dsInsert} end
    else
      Caption := cFamIO + ' [редактирование записи]';
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.DbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.dbeDtPriemExit(Sender: TObject);
begin
  if MyEmptyDate(dbeDtPrikaza.Field.AsString) then
    dbeDtPrikaza.Field.AsString := dbeDtPriem.Field.AsString;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.dbeDtUvolnExit(Sender: TObject);
begin
  if MyEmptyDate(dbeDtPrUvoln.Field.AsString) then
    dbeDtPrUvoln.Field.AsString := dbeDtUvoln.Field.AsString;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.DbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEAPrmUv.MyValidDtPrmUv(dDtPriem, dDtUvoln : TDateTime;
                                   nNR : integer; var cMsg : string) : boolean;
var n_KdSps : integer;
begin
  Result := true;
  n_KdSps := dbeKdSps.Field.AsInteger;
  cMsg := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select * from z_PrmUv where (TabN = :nTabN) and ' +
            ' (KdSps = :nKdSps) order by Dt_Priem');
    ParamByName('nTabN').AsInteger  := n_TabN;
    ParamByName('nKdSps').AsInteger := n_KdSps;
    Open;
    while not Eof do begin
      if (nNR <> 0) and (FieldByName('NR').AsInteger = nNR) then begin
        Next; // не проверяю саму редактируемую запись (пока)
        Continue; end
      else if (nNR <> 0) and
              (dDtPriem <= FieldByName('Dt_Priem').AsDateTime) and
              (dDtUvoln >= FieldByName('Dt_Priem').AsDateTime) {and
              (dDtUvoln <= FieldByName('Dt_Priem').AsDateTime)} then
        cMsg := 'Есть запись с датой приема ' +
                       FieldByName('Dt_Priem').AsString +
                       ', которая конфликтует с введенными изменениями'
      else if (FieldByName('Dt_Priem').AsDateTime <= dDtPriem) and
                            FieldByName('Dt_Uvoln').IsNull then
        cMsg := 'Есть запись с датой приема ' +
                       FieldByName('Dt_Priem').AsString +
                       ' и с незакрытой датой увольнения'
      else if (FieldByName('Dt_Priem').AsDateTime <= dDtPriem) and
                 (FieldByName('Dt_Uvoln').AsDateTime > dDtPriem) then
        cMsg := 'Есть запись с датой приема ' +
                 FieldByName('Dt_Priem').AsString + ' и с более поздней (' +
                 FieldByName('Dt_Uvoln').AsString + ') датой увольнения'
      else if (FieldByName('Dt_Priem').AsDateTime <= dDtPriem) and
                 (FieldByName('Dt_Uvoln').AsDateTime = dDtPriem) then
        cMsg := 'Есть запись с датой приема ' +
                 FieldByName('Dt_Priem').AsString +
                ' и с такой же, как введенная, дата приема датой увольнения (' +
                 FieldByName('Dt_Uvoln').AsString + ')';
      Next;
    end;
    if cMsg <> '' then
      Result := false;
  end;
end;
//------------------------------------------------------------------------------
function TFormEAPrmUv.CheckVvod : boolean;
var mListErr : TStringList; nNR : integer; cMsg : string;
    dDtUvoln : TDateTime;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
(*
  if IsRecDtBeg(dbedDtBeg.DataSource.
             DataSet.FieldByName('Dt_Beg').AsDateTime) then
    mListErr.Add('Уже есть запись с датой ' + dbedDtBeg.DataSource.
             DataSet.FieldByName('Dt_Beg').AsString);
*)

  dDtUvoln := 0;
  nNR := 0;
  if not myEmptyDate(dbeDtUvoln.Text) {a_Lib} then
    dDtUvoln := dbeDtUvoln.Field.AsDateTime;
  if (dbeDtPriem.Text = '') then
    mListErr.Add('Нет даты приема');
  if (dbeDtPriem.Text <> '') and (dbeDtUvoln.Text <> '') and
                                         (dDtUvoln <> 0) and
         (dbeDtPriem.Field.AsDateTime > dbeDtUvoln.Field.AsDateTime) then
    mListErr.Add('Дата приема больше даты увольнения');
//  if (dbeNrPrikaza.Text = '') then
//    mListErr.Add('Нет номера приказа');
//  if (dbeDtPrikaza.Text = '') or myEmptyDate(dbeDtPrikaza.Text) then
//    mListErr.Add('Нет даты приказа');
  if (n_DsrcState = MY_STATE_EDIT) then begin
    nNR := dbeDtPriem.Field.DataSet.FieldByName('NR').AsInteger;
    if not MyValidDtPrmUv(dbeDtPriem.Field.AsDateTime, dDtUvoln,
                                                         nNR, cMsg) then begin
      ShowMessage(cMsg);
      mListErr.Add('Некорректные изменения');
    end;
  end;
  if (n_DsrcState = MY_STATE_INSERT) and not
           MyValidDtPrmUv(dbeDtPriem.Field.AsDateTime, dDtUvoln,
                                                         nNR, cMsg) then begin
    ShowMessage(cMsg);
    mListErr.Add('Плохая дата приема');
  end;
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeDtPriem.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.dbePidZvilnDblClick(Sender: TObject);
begin
  sBtnKdPidZv.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.dbePidZvilnKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdPidZv.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.sBtnKdPidZvClick(Sender: TObject);
var nKdPidZv : integer; cPidZv : ShortString;
begin
  dbePidZviln.SetFocus;
  nKdPidZv := dbeKdPidZv.Field.AsInteger;
  if GetPidZviln(nKdPidZv, cPidZv) {z_PidZv} then begin
    dbeKdPidZv.Field.AsInteger := nKdPidZv;
    dbePidZviln.Field.AsString := cPidZv;
    dbeNotes.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrmUv.dbeKdPidZvExit(Sender: TObject);
var cText, cPidZviln : ShortString; nKdPidZv : SmallInt;
begin
  cText := dbeKdPidZv.Text;
  if cText = '' then
    dbePidZviln.Field.AsString :=  ''
  else if cText > '' then begin
    nKdPidZv := dbeKdPidZv.Field.AsInteger;
    if CheckKdPidZv(nKdPidZv, cPidZviln) {z_PidZv} then begin
      dbePidZviln.Field.AsString := cPidZviln;
      dbeKdPidZv.Color := clWindow;
      dbeNotes.SetFocus; end
    else begin
      ShowMessage('Нет кода "' + cText + '" в таблице "Причины увольнения"');
      dbeKdPidZv.SetFocus;
    end;
  end;
end;

end.
