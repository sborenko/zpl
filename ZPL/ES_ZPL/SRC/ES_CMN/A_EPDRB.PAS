unit A_EPdrB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Grids, DBGrids, DB, Menus, DBTables;

type
  TFormEABnkPdr = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edRSch: TEdit;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    edMfo: TEdit;
    edOkpo: TEdit;
    edNmBank: TEdit;
    edNmPdr: TEdit;
    edNmRSch: TEdit;
    edSchBU: TEdit;
    MemoNotes: TMemo;
    Label13: TLabel;
    sBtnVubSchBU: TSpeedButton;
    edNmVal: TEdit;
    sBtnVubVal: TSpeedButton;
    Label14: TLabel;
    Label16: TLabel;
    sBtnBank: TSpeedButton;
    edNrGOrd: TEdit;
    MemoNmGOrd: TMemo;
    Label2: TLabel;
    Label12: TLabel;
    sBtnInclPdr: TSpeedButton;
    dbgrInclRS: TDBGrid;
    qryInclRS: TQuery;
    dsrcInclRS: TDataSource;
    updInclRS: TUpdateSQL;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    qryInclRSNR: TIntegerField;
    qryInclRSKDWHO: TSmallintField;
    qryInclRSSHPPDR: TStringField;
    qryInclRSKDRSCH: TSmallintField;
    qryInclRSNMSCH: TStringField;
    qryInclRSNMBANK: TStringField;
    qryInclRSRSCH: TStringField;
    qryInclRSMFO: TStringField;
    qryInclRSOKPO: TStringField;
    qryInclRSNOTES: TStringField;
    qryInclRSOLD_KPR: TSmallintField;
    qryInclRSOLD_KOBJ: TSmallintField;
    qryInclRSSCHETKAZN: TStringField;
    qryInclRSORGMNE: TStringField;
    qryInclRSKDBNK: TSmallintField;
    qryInclRSISVAL: TStringField;
    qryInclRSSWIFT: TStringField;
    qryInclRSPA: TSmallintField;
    qryTmp: TQuery;
    qryInclRSKDSBU: TSmallintField;
    qryInclRSSCHBU: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnVubSchBUClick(Sender: TObject);
    procedure sBtnVubValClick(Sender: TObject);
    procedure edNmValDblClick(Sender: TObject);
    procedure sBtnBankClick(Sender: TObject);
    procedure edEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
    procedure MemoNotesEnter(Sender: TObject);
    procedure MemoNotesExit(Sender: TObject);
    procedure edNmPdrExit(Sender: TObject);
    procedure edSchBUKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure sBtnInclPdrClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
  private
    { Private declarations }
    n_KdPdr, n_KdSchBU, n_KdVal, n_KdBnk : integer;
    c_NmPdr, c_NmRSch, c_RSch, c_Mfo, c_Okpo, c_SchBU,
                                              c_NmBank, c_NmVal : string;
    bEditMode : boolean;
    function CheckVvod : boolean;
    function GetNewKdRSch : integer;
    procedure OpenQryInclRS;
  public
    { Public declarations }
  end;

function EdtBnkPdr(bIsVal : boolean; nKdPdr : integer;
                                    var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                                        cOkpo, cNmBank, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal, nKdBnk : integer;
                        var cNr_GOrd, cNm_GOrd : ShortString) : boolean;
function AddBnkPdr(bIsVal : boolean; var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                                       cOkpo, cNmBank, cSchBU, cNmVal : string;
                        var nKdSchBU, nKdVal, nKdBnk : integer;
                        var cNr_GOrd, cNm_GOrd : ShortString) : boolean;

var
  FormEABnkPdr: TFormEABnkPdr;

const SECTION = 'A_EPdrB';

implementation

{$R *.DFM}

uses A_Const, a_Dm, A_SBU, A_GtVal, {b_ShBnks,} A_ShwErr, a_EIncRS;

//----------- Для ввода и редактирования "банковских" подразделений ------------
function EdtBnkPdr(bIsVal : boolean; nKdPdr : integer;
                                    var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                                        cOkpo, cNmBank, cSchBU, cNmVal : string;
                             var nKdSchBU, nKdVal, nKdBnk : integer;
                             var cNr_GOrd, cNm_GOrd : ShortString) : boolean;
begin
  Result := false;
  FormEABnkPdr := TFormEABnkPdr.Create(Application);
  with FormEABnkPdr do begin
    BorderStyle := bsSizeable;
    Constraints.MaxHeight := 510;
    Constraints.MinHeight := 476;
    bEditMode := true;
    n_KdPdr   := nKdPdr;
    n_KdSchBU := nKdSchBU;
    n_KdVal   := nKdVal;
    n_KdBnk   := nKdBnk;
    c_NmPdr   := cNmPdr;
    c_NmRSch  := cNmRSch;
    c_RSch    := cRSch;
    c_SchBU   := cSchBU;
    c_Mfo     := cMfo;
    c_Okpo    := cOkpo;
    c_NmBank  := cNmBank;
    c_NmVal   := cNmVal;
    Caption := 'Расч.счёт (подразделение)  [редактирование]';
    edNmPdr.Text   := cNmPdr;
    edNmRSch.Text  := cNmRSch;
    edRSch.Text    := cRSch;
    edMfo.Text     := cMfo;
    edOkpo.Text    := cOkpo;
    edNmBank.Text  := cNmBank;
    edSchBU.Text   := cSchBU;
    edNmVal.Text   := cNmVal;
    edNmVal.Color  := clBtnFace;
    sBtnVubVal.Enabled := false;
    MemoNotes.Text  := cNotes;
    MemoNmGOrd.Text := cNm_GOrd;
    edNrGOrd.Text   := cNr_GOrd;
    edNmBank.Left   := 89;
    if bIsVal then begin
      edNmBank.Width := 318;
      edNmBank.ReadOnly := true;  // вводить нельзя - выбирать из спр-ка банков!
      sBtnBank.Visible := true; end
    else begin
      edNmBank.Width := 333;
      edNmBank.ReadOnly := false;
      sBtnBank.Visible := false;
    end;
    OpenQryInclRS;
    if (ShowModal = mrOK) then begin
      Result   := true;
      cNmPdr   := edNmPdr.Text;
      cNotes   := MemoNotes.Text;
      cNmRSch  := edNmRSch.Text;
      cRSch    := edRSch.Text;
      cMfo     := edMfo.Text;
      cOkpo    := edOkpo.Text;
      cNmBank  := edNmBank.Text;
      cSchBU   := edSchBU.Text;
      cNmVal   := edNmVal.Text;
      nKdVal   := n_KdVal;
      nKdBnk   := n_KdBnk;
      nKdSchBU := n_KdSchBU;
      cNr_GOrd := edNrGOrd.Text;
      cNm_GOrd := MemoNmGOrd.Text;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function AddBnkPdr(bIsVal : boolean; var cNmPdr, cNotes, cNmRSch, cRSch, cMfo,
                              cOkpo, cNmBank, cSchBU, cNmVal : string;
                              var nKdSchBU, nKdVal, nKdBnk : integer;
                              var cNr_GOrd, cNm_GOrd : ShortString) : boolean;
begin
  Result := false;
  FormEABnkPdr := TFormEABnkPdr.Create(Application);
  with FormEABnkPdr do begin
    BorderStyle := bsDialog;
    Height := 327;
    Width  := 498;
    bEditMode := false;
    n_KdSchBU := 0;
    n_KdVal   := 0;
    n_KdBnk   := 0;
    edNmBank.Left  := 89;
    sBtnInclPdr.Visible := false; // виден только в EditMode (выключил и EditMode)
    if bIsVal then begin
      Caption := 'Подразделения [Новый валютный счёт]';
      edNmBank.Width := 318;
      sBtnBank.Visible := true; end
    else begin
      Caption := 'Подразделения [Новый счёт]';
      edNmBank.Width := 333;
      sBtnBank.Visible := false;
    end;
    if not bIsVal then begin
      nKdVal  := nAppKdBazVal;
      n_KdVal := nAppKdBazVal;
      edNmVal.Text := Form_Dm.KdVal2ShVal(n_KdVal);
      sBtnVubVal.Enabled := false;
    end;
    if ShowModal = mrOK then begin
      cNmPdr    := edNmPdr.Text;
      cNotes    := MemoNotes.Text;
      cNmRSch   := edNmRSch.Text;
      cRSch     := edRSch.Text;
      cMfo      := edMfo.Text;
      cOkpo     := edOkpo.Text;
      cNmBank   := edNmBank.Text;
      cSchBU    := edSchBU.Text;
      nKdSchBU  := n_KdSchBU;
      cNmVal    := edNmVal.Text;
      nKdVal    := n_KdVal;
      nKdBnk    := n_KdBnk;
      cNr_GOrd := edNrGOrd.Text;
      cNm_GOrd := MemoNmGOrd.Text;
      Result    := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEABnkPdr.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if edNmPdr.Text = '' then
    mListErr.Add('Не заполнено название подразделения');
  if edNmRSch.Text = '' then
    mListErr.Add('Не заполнено название для документов');
  if edRSch.Text = '' then
    mListErr.Add('Не введен расчётный счёт');
  if edMfo.Text = '' then
    mListErr.Add('Не заполнено поле МФО ');
  if edOkpo.Text = '' then
    mListErr.Add('Не заполнено поле ОКПО');
  if edNmBank.Text = '' then
    mListErr.Add('Не заполнено название банка');
  if edSchBU.Text = '' then
    mListErr.Add('Не выбран связанный счёт БухУчёта');
  if edNmVal.Text = '' then
      mListErr.Add('Не выбрана валюта');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    edNmPdr.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.sBtnBankClick(Sender: TObject);
var cNmBnk : string;
begin
 // Решить, где расположить и Банки и процедуру
  cNmBnk := '';
(*
  if GetBank(n_KdBnk, cNmBnk) {b_ShBnks} then begin
    edNmBank.Text := cNmBnk;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.sBtnVubSchBUClick(Sender: TObject);
var cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  if GetSBU(n_KdSchBU, cSchBU, cPSch, cNmSBU, bHsCh) then  {A_SBU}
    edSchBU.Text := cSchBU;        // изменится и var n_KdSchBU
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.sBtnVubValClick(Sender: TObject);
var cNmVal : string;
begin
  if GetKdVal(n_KdVal, cNmVal) then        {A_GtVal}
    edNmVal.Text := cNmVal;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.edNmValDblClick(Sender: TObject);
begin
  if not bEditMode then
    sBtnVubVal.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.edEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.edExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.edNmPdrExit(Sender: TObject);
begin
  if (edNmRSch.Text = '') and (edNmPdr.Text <> '') then
    edNmRSch.Text := edNmPdr.Text;
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.MemoNotesEnter(Sender: TObject);
begin
  (Sender as TMemo).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.MemoNotesExit(Sender: TObject);
begin
  (Sender as TMemo).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.edSchBUKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVubSchBUClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.sBtnInclPdrClick(Sender: TObject);
begin  // Выбрать "ПодСчета" для текущего счёта-подразделения
  if not qryInclRS.Active then with qryInclRS do begin
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select s.SchBU, r.* from kd_RSCH r ' +
            ' Left Outer Join Kd_Sbu s on s.KdSch = r.KdSbu ' +
            ' where r.KdWho = :nKdWho ' +
            ' order by ShPPdr');          // Не изменять "order by ShPPdr" !!!
                     // Важно при определении значения ShPPdr для новой записи
    ParamByName('nKdWho').AsInteger := n_KdPdr; // значения для новой записи
    Open; end
  else begin
    qryInclRS.Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.OpenQryInclRS;
begin
  with qryInclRS do begin
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select s.SchBU, r.* from kd_RSCH r ' +
            ' Left Outer Join Kd_Sbu s on s.KdSch = r.KdSbu ' +
//            ' where r.KdWho = :nKdWho and not r.ShPPdr is null ' +
            ' where r.KdWho = :nKdWho ' +
            ' order by ShPPdr');          // Не изменять "order by ShPPdr" !!!
                     // Важно при определении значения ShPPdr для новой записи
    ParamByName('nKdWho').AsInteger := n_KdPdr;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.popPopup(Sender: TObject);
begin
  popEdt.Enabled := qryInclRS.Active and (qryInclRS.RecordCount > 0);
  popDel.Enabled := popEdt.Enabled;
  popAdd.Enabled := qryInclRS.Active;
end;
//------------------------------------------------------------------------------
function TFormEABnkPdr.GetNewKdRSch: integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdRSch) as MaxKd from Kd_RSch');
    Open;
    if (RecordCount > 0) and
                (FieldByName('MaxKd').AsInteger > 0) then
        Result := FieldByName('MaxKd').AsInteger + 1
      else
        Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.popAddClick(Sender: TObject);
var nSvNR : integer; cShPPdr : ShortString; {Char;} i : SmallInt;
begin
  with qryInclRS do begin
    if not Active then
      Open;               /////
    nSvNR := qryInclRSNR.AsInteger;
    if RecordCount = 0 then
      cShPPdr := 'А'   // кирилица
    else begin
      DisableControls;
      Last;
      cShPPdr := qryInclRSShPPdr.AsString; //[1];
      if cShPPdr = '' then
        cShPPdr := 'А'
      else begin
        i := Ord(cShPPdr[1]);     // найти следующую буковку
        cShPPdr := Chr(i+1);   // вот она !!!
      end;
      EnableControls;
    end;
    Append;
    qryInclRSKdWho.AsInteger := n_KdPdr;
    qryInclRSShPPdr.AsString := cShPPdr;
    qryInclRSNmSch.AsString  := c_NmRSch;
    qryInclRSOkpo.AsString   := c_Okpo;
    qryInclRSMfo.AsString    := c_Mfo;
    qryInclRSNmBank.AsString := c_NmBank;
    if EAInclRSch {a_EIncRS} then begin
      qryInclRSKdRSch.AsInteger := GetNewKdRSch;
      Post;
      if qryInclRS.UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryInclRS]); end
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.popEdtClick(Sender: TObject);
begin
  with qryInclRS do begin
    Edit;
    if EAInclRSch {a_EIncRS} then begin
      Post;
      if qryInclRS.UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryInclRS]); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkPdr.popDelClick(Sender: TObject);
var bCanDelete : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count( * ) as CNT from Bnk_Mov where KdPdr = :nKdPdr and ' +
            ' ShPPdr = :cShPPdr');
    ParamByName('nKdPdr').AsInteger := n_KdPdr;
    ParamByName('cShPPdr').AsString := qryInclRsShPPdr.AsString;
    Open;
    bCanDelete := FieldByName('CNT').AsInteger = 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if not bCanDelete then
    ShowMessage('Этот счёт удалять нельзя. Он уже используется ' +
                                    'в таблице "Платежные документы"')
  else begin
    if MessageDlg('Текущий "ПодСчёт" удаляется безвозвратно. Согласны?:',
                   mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      qryInclRS.Delete;
      Form_Dm.DbMain.ApplyUpdates([qryInclRS]);
    end;
  end;
end;

end.
