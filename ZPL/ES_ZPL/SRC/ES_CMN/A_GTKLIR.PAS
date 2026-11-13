unit A_GtKliR;

interface

uses
	SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, Grids, DBGrids, ExtCtrls,
  DBTables, DB, StdCtrls, DBCtrls, Buttons, Mask, IniFiles, Menus, ComCtrls;

type
	TFormKdKli = class(TForm)
    dsrcRSch: TDataSource;
    dsrcWho: TDataSource;
    qryWho: TQuery;
    qryRSch: TQuery;
    qryWhoKDWHO: TSmallintField;
    qryWhoNMWHO: TStringField;
    qryWhoNMWHOE: TStringField;
    qryWhoPRWHO: TSmallintField;
    qryRSchKDRSCH: TSmallintField;
    qryRSchKDWHO: TSmallintField;
    qryRSchNMSCH: TStringField;
    qryRSchNMBANK: TStringField;
    qryRSchRSCH: TStringField;
    qryRSchMFO: TStringField;
    qryRSchOKPO: TStringField;
    PanelWho: TPanel;
    Splitter1: TSplitter;
    dbgrRSch: TDBGrid;
    PanelWhoLeft: TPanel;
    dbgrWho: TDBGrid;
    PanelTools: TPanel;
    popMnuWho: TPopupMenu;
    popMnuRSch: TPopupMenu;
    popMnuWhoEdt: TMenuItem;
    popMnuWhoAddKli: TMenuItem;
    popMnuWhoDel: TMenuItem;
    popMnuRSchEdt: TMenuItem;
    popMnuRSchAdd: TMenuItem;
    popMnuRSchDel: TMenuItem;
    popMnuRSchDm1: TMenuItem;
    popMnuRSchPoisk: TMenuItem;
    popMnuWhoDm1: TMenuItem;
    popMnuWhoFind: TMenuItem;
    qryWhoNOTES: TStringField;
    DBMemoNotes: TDBMemo;
    PanelHeadNotes: TPanel;
    qryTmp: TQuery;
    popMnuRSchHead: TMenuItem;
    popMnuWhoHead: TMenuItem;
    qryRSchNR: TIntegerField;
    qryRSchNOTES: TStringField;
    popMnuWhoFind2: TMenuItem;
    qryWhoOKPO: TStringField;
    qryWhoNR: TIntegerField;
    popMnuWhoInsOKPO: TMenuItem;
    popMnuRSchAddVal: TMenuItem;
    qryRSchKDBNK: TSmallintField;
    qryRSchISVAL: TStringField;
    qryRSchSWIFT: TStringField;
    qryWhoKDSBU: TSmallintField;
    qryWhoSHFR: TStringField;
    qryWhoKDVALPDR: TSmallintField;
    qryWhoOLD_KPR: TSmallintField;
    qryWhoOLD_KOBJ: TSmallintField;
    qryWhoORGMNE: TStringField;
    qryWhoADRES: TStringField;
    popMnuWhoPltg: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    rBtnShowBoevue: TRadioButton;
    rBtnShowAll: TRadioButton;
    rBtnShowArch: TRadioButton;
    popMnuWhoToArch: TMenuItem;
    popMnuWhoFromArch: TMenuItem;
    qryWhoPA: TSmallintField;
    qryRSchPA: TSmallintField;
    PanelTop1: TPanel;
    LabelCntRecKli: TLabel;
    LabelMsg: TLabel;
    dtPicLDtOper: TDateTimePicker;
    Label4: TLabel;
    sBtnGo: TSpeedButton;
    qryWhoLDTOPER: TDateTimeField;
    LabelCntRecRSch: TLabel;
    qryRSchLDTOPER: TDateTimeField;
    popMnuWhoOrder: TMenuItem;
    popMnuWhoOrderByOKPO: TMenuItem;
    popMnuWhoOrderByNmKli: TMenuItem;
    popMnuWhoOrderByKdKli: TMenuItem;
    popMnuRSchOrder: TMenuItem;
    popMnuRSchOrderByRSch: TMenuItem;
    popMnuRSchOrderByNmRSch: TMenuItem;
    popMnuRSchOrderByKdRSch: TMenuItem;
    popMnuRSchOrderByKdKliRSch: TMenuItem;
    Panel3: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    popMnuRSchToArch: TMenuItem;
    popMnuRSchFromArch: TMenuItem;
		procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popMnuWhoFindClick(Sender: TObject);
    procedure popMnuWhoAddKliClick(Sender: TObject);
    procedure popMnuRSchAddClick(Sender: TObject);
    procedure popMnuWhoEdtClick(Sender: TObject);
    procedure popMnuRSchPopup(Sender: TObject);
    procedure popMnuWhoDelClick(Sender: TObject);
    procedure popMnuRSchDelClick(Sender: TObject);
    procedure dbgrRSchDblClick(Sender: TObject);
    procedure popMnuWhoPopup(Sender: TObject);
    procedure popMnuRSchEdtClick(Sender: TObject);
    procedure popMnuRSchPoiskClick(Sender: TObject);
    procedure dbgrRSchKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
    procedure dbgrWhoDblClick(Sender: TObject);
    procedure dbgrWhoKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
    procedure dsrcWhoDataChange(Sender: TObject; Field: TField);
    procedure popMnuWhoInsOKPOClick(Sender: TObject);
    procedure popMnuRSchAddValClick(Sender: TObject);
    procedure dbgrRSchDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popMnuWhoPltgClick(Sender: TObject);
    procedure rBtnSortByNameClick(Sender: TObject);
    procedure rBtnSortByOKPOClick(Sender: TObject);
    procedure rBtnShowAllClick(Sender: TObject);
    procedure rBtnShowBoevueClick(Sender: TObject);
    procedure rBtnShowArchClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryWhoAfterScroll(DataSet: TDataSet);
    procedure dbgrWhoDrawColumnCell(Sender: TObject; const Rect: TRect;
                    DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popMnuWhoToArchClick(Sender: TObject);
    procedure popMnuWhoFromArchClick(Sender: TObject);
    procedure dtPicLDtOperCloseUp(Sender: TObject);
    procedure sBtnGoClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure rBtnSortByKdKliClick(Sender: TObject);
    procedure dtPicLDtOperEnter(Sender: TObject);
    procedure dtPicLDtOperExit(Sender: TObject);
    procedure popMnuWhoOrderByOKPOClick(Sender: TObject);
    procedure popMnuWhoOrderByNmKliClick(Sender: TObject);
    procedure popMnuWhoOrderByKdKliClick(Sender: TObject);
    procedure popMnuRSchOrderByRSchClick(Sender: TObject);
    procedure popMnuRSchOrderByNmRSchClick(Sender: TObject);
    procedure popMnuRSchOrderByKdRSchClick(Sender: TObject);
    procedure popMnuRSchOrderByKdKliRSchClick(Sender: TObject);
    procedure dsrcRSchDataChange(Sender: TObject; Field: TField);
    procedure popMnuRSchToArchClick(Sender: TObject);
    procedure popMnuRSchFromArchClick(Sender: TObject);
	private
		{ Private declarations }
    bOneKli : boolean;
    nLastWho, n_LDtOper : integer;
    d_LDtOper : TDateTime;
    bAddKznRS : boolean; // сигналит о том, что предлагаются данные казначейства
    c_NmKli, c_KliRSch, c_KliMFO, c_KliOkpo, c_KliNmBnk : ShortString;
    procedure OpenDataSets;
    procedure OpenQryWho;
    procedure OpenQryRSch;
   procedure SetDbgrWhoColumns;
    procedure SetDbgrRSchColumns;
	public
		{ Public declarations }
	end;

procedure ShowModalKdKli(nKdWho : integer); // Клиенты с KdWho > 5000

function GetKdKliKdRSch(var nKdKli, nKdRSch : integer;
                                  var cNmKli : string) : boolean;

function GetKdKliRS(var nKdKli, nKdRSch : integer;
                                  var cNmKli : string) : boolean;
function GetKliRkvzt(var nKdKli, nKdRSch : integer;
                            var cNmKli, cAdres, cKliNmSch, cKliNmBank,
                                cKliRSch, cKliMfo, cKliOkpo : string) : boolean;
function AddGetKznKliRS(var nKdKli, nKdRSch : SmallInt; var cNmKli, cKliRSch,
                          cKliMFO, cKliOkpo, cKliNmBnk : ShortString) : boolean;

var
	FormKdKli: TFormKdKli;
  n_KdWho : integer;
  bVuborMode : boolean;
  // bIsFormShowKliDocs : boolean;

const SECTION = 'A_GtKliR';

implementation

{$R *.DFM}

uses A_Const, A_DM, A_Lib, b_ShKliD, b_Main,
     A_KliFnd, A_KliNew, A_EKli,
     A_e2RSch, B_GtUslR, A_FindRS;

//------------------------------------------------------------------------------
function AddGetKznKliRS(var nKdKli, nKdRSch : SmallInt; var cNmKli, cKliRSch,
                          cKliMFO, cKliOkpo, cKliNmBnk : ShortString) : boolean;
begin
  // Эта функция фактически не для выбора, а для ввода (корректировки)
  // данных клиента и его реквизитов сведениями из казначейства
  Result     := false;
  FormKdKli  := TFormKdKli.Create(Application);
  with FormKdKli do begin
    bAddKznRS  := true;
    n_KdWho    := nKdKli;
    c_NmKli    := cNmKli;
    c_KliRSch  := cKliRSch;
    c_KliMFO   := cKliMFO;
    c_KliOkpo  := cKliOkpo;
    c_KliNmBnk := cKliNmBnk;
    bVuborMode := true;
    bOneKli    := false;
    bBtnOK.Visible := true;
    //OpenDataSets;
    OpenQryWho;
    if nKdKli <> 0 then
      qryWho.Locate('KdWho', nKdKli, []);
    OpenQryRSch;
    if nKdRSch <> 0 then
      qryRSch.Locate('KdRSch', nKdRSch, []);
    bBtnOK.Enabled := qryRSch.RecordCount <> 0;
    bBtnCancel.Caption := 'Отказ';
    SetDbgrWhoColumns;
    SetDbgrRSchColumns;
    if ShowModal = mrOk then begin
      Result    := true;
      nKdKli    := qryWho.FieldByName('KdWho').AsInteger;
      nKdRSch   := qryRSch.FieldByName('KdRSch').AsInteger;
      cNmKli    := qryRSchNmSch.AsString;
      cKliRSch  := qryRSchRSch.AsString;
      cKliMFO   := qryRSchMfo.AsString;
      cKliOkpo  := qryRSchOkpo.AsString;
      cKliNmBnk := qryRSchNmBank.AsString;
    end;
    qryRSch.Close;
    qryWho.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKliRkvzt(var nKdKli, nKdRSch : integer;
                            var cNmKli, cAdres, cKliNmSch, cKliNmBank,
                                cKliRSch, cKliMfo, cKliOkpo : string) : boolean;
begin
  Result := false;
  n_KdWho    := nKdKli;
  cNmKli     := '';
  cAdres     := '';
  cKliNmSch  := '';
  cKliNmBank := '';
  cKliRSch   := '';
  cKliMfo    := '';
  cKliOkpo   := '';
  bVuborMode := true;
  FormKdKli := TFormKdKli.Create(Application);
  with FormKdKli do begin
    bAddKznRS := false;
    bOneKli   := false;
    bBtnOK.Visible := true;
    //OpenDataSets;
    OpenQryWho;
    OpenQryRSch;
    bBtnOK.Enabled := qryRSch.RecordCount <> 0;
    if nKdKli <> 0 then
      qryWho.Locate('KdWho', nKdKli, [])
    else if nLastWho <> 0 then
      qryWho.Locate('KdWho', nLastWho, []);
    bBtnCancel.Caption := 'Отказ';
    SetDbgrWhoColumns;
    SetDbgrRSchColumns;
    if ShowModal = mrOk then begin
      Result  := true;
      nKdKli     := qryWho.FieldByName('KdWho').AsInteger;
      nKdRSch    := qryRSch.FieldByName('KdRSch').AsInteger;
      cNmKli     := qryWho.FieldByName('NmWho').AsString;
      cAdres     := qryWho.FieldByName('Adres').AsString;
      cKliNmSch  := qryRSch.FieldByName('NmSch').AsString;
      cKliNmBank := qryRSch.FieldByName('NmBank').AsString;
      cKliRSch   := qryRSch.FieldByName('RSch').AsString;
      cKliMfo    := qryRSch.FieldByName('Mfo').AsString;
      cKliOkpo   := qryRSch.FieldByName('Okpo').AsString;
    end;
    qryRSch.Close;
    qryWho.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKdKliRS(var nKdKli, nKdRSch : integer;
                                   var cNmKli : string) : boolean;
begin
  // Показывать только одного клиента nKdKli и его расчетные счета с
  // возможностью выбора одного из его расчетных счетов
  Result := false;
  n_KdWho := nKdKli;
  bVuborMode := true;
  FormKdKli := TFormKdKli.Create(Application);
  with FormKdKli do begin
    bAddKznRS := false;
    bOneKli := true;
    bBtnOK.Visible := true;
    //OpenDataSets;
    OpenQryWho;
    OpenQryRSch;
    bBtnOK.Enabled := qryRSch.RecordCount <> 0;
    if nKdKli <> 0 then
      qryWho.Locate('KdWho', nKdKli, [])
    else if nLastWho <> 0 then
      qryWho.Locate('KdWho', nLastWho, []);
    bBtnCancel.Caption := 'Отказ';
    SetDbgrWhoColumns;
    SetDbgrRSchColumns;
    if ShowModal = mrOk then begin
      result  := true;
      nKdKli  := qryWho.FieldByName('KdWho').AsInteger;
      cNmKli  := qryWho.FieldByName('NmWho').AsString;
      nKdRSch := qryRSch.FieldByName('KdRSch').AsInteger;
    end;
    qryRSch.Close;
    qryWho.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKdKliKdRSch(var nKdKli, nKdRSch : integer;
                                   var cNmKli : string) : boolean;
begin
  // Показывать клиентов и их расчетные счета с возможностью
  // выбора как клиента, так и одного из его расч. счетов
  Result := false;
  n_KdWho := nKdKli;
  bVuborMode := true;
  FormKdKli := TFormKdKli.Create(Application);
  with FormKdKli do begin
    bAddKznRS := false;
    bOneKli   := false;
    bBtnOK.Visible := true;
    //OpenDataSets;
    OpenQryWho;
    OpenQryRSch;
    bBtnOK.Enabled := qryRSch.RecordCount <> 0;
    if nKdKli <> 0 then
      qryWho.Locate('KdWho', nKdKli, [])
    else if nLastWho <> 0 then
      qryWho.Locate('KdWho', nLastWho, []);
    if nKdRSch <> 0 then
      qryRSch.Locate('KdRSch', nKdRSch, []);
    bBtnCancel.Caption := 'Отказ';
    SetDbgrWhoColumns;
    SetDbgrRSchColumns;
    if ShowModal = mrOk then begin
      Result  := true;
      nKdKli  := qryWho.FieldByName('KdWho').AsInteger;
      cNmKli  := qryWho.FieldByName('NmWho').AsString;
      nKdRSch := qryRSch.FieldByName('KdRSch').AsInteger;
    end;
    qryRSch.Close;
    qryWho.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowModalKdKli(nKdWho : integer);
begin     // Вызывается из гл. меню. Показывать только клиентов
  n_KdWho := nKdWho;
  bVuborMode := false;
  FormKdKli := TFormKdKli.Create(Application);
  with FormKdKli do begin
    bAddKznRS := false;
    bOneKli   := false;
    Caption   := 'Клиенты и их расчетные счета';
    LabelMsg.Caption := '';
    LabelMsg.Visible := false;
    bBtnOK.Visible := false;
    bBtnCancel.Caption := 'Выход';
    //OpenDataSets;
    OpenQryWho;
    OpenQryRSch;
    if nKdWho <> 0 then
      qryWho.Locate('KdWho', nKdWho, [])
    else if nLastWho <> 0 then
      qryWho.Locate('KdWho', nLastWho, []);
    SetDbgrWhoColumns;
    SetDbgrRSchColumns;
    ShowModal;
    qryRSch.Close;
    qryWho.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.OpenDataSets;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryWho do begin
    if Active then begin
      nSvNR := FieldByName('NR').AsInteger;
      Close;
    end;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN;
    if bOneKli then begin
      SQL.Add('Select * from Kd_Who where KdWho = :nKdWho');
      ParamByName('nKdWho').AsInteger := n_KdWho; end
    else begin         // KdWho > 5000 - это КЛИЕНТЫ программы "БАНК" (и ещё
      SQL.Add('Select * from Kd_Who where KdWho >= 5000 and ' +
              ' LDtOper >= :d_LDtOper ');               //  у них PrWho = 10)
      if rBtnShowBoevue.Checked then
        SQL.Add(' and (PA is NULL or PA < 1) ')
      else if rBtnShowArch.Checked then
        SQL.Add(' and (PA >= 1) ');
      if popMnuWhoOrderByOKPO.Checked then
        SQL.Add(' order by PrWho, OKPO, NmWho')
      else if popMnuWhoOrderByNmKli.Checked then
        SQL.Add(' order by PrWho, NmWho')
      else
        SQL.Add(' order by KdWho, PrWho, OKPO, NmWho');
      ParamByName('d_LDtOper').AsDateTime := d_LDtOper;
    end;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
    LabelCntRecKli.Caption := 'Клиентов: ' + IntToStr(RecordCount);
    sBtnGo.Enabled := false;
  end;
  with qryRSch do begin
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcWho;
    SQL.Add('Select * from Kd_RSch where KdWho = :KdWho ');
//    SQL.Add('Select * from Kd_RSch where OKPO = :OKPO ');
    if rBtnShowBoevue.Checked then
      SQL.Add(' and (PA is NULL or PA < 1) ')
    else if rBtnShowArch.Checked then
      SQL.Add(' and (PA >= 1) ');
    SQL.Add(' order by NR desc');
    Open;
    LabelCntRecRsch.Caption := 'Счетов: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.OpenQryWho;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryWho do begin
    if Active then begin
      nSvNR := FieldByName('NR').AsInteger;
      Close;
    end;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN;
    if bOneKli then begin
      SQL.Add('Select * from Kd_Who where KdWho = :nKdWho');
      ParamByName('nKdWho').AsInteger := n_KdWho; end
    else begin
      SQL.Add('Select * from Kd_Who where KdWho >= 5000 and ' +
              ' LDtOper >= :d_LDtOper ');
      if rBtnShowBoevue.Checked then
        SQL.Add(' and (PA is NULL or PA < 1) ')
      else if rBtnShowArch.Checked then
        SQL.Add(' and (PA >= 1) ');
      if popMnuWhoOrderByOKPO.Checked then
        SQL.Add(' order by PrWho, OKPO, NmWho')
      else if popMnuWhoOrderByNmKli.Checked then
        SQL.Add(' order by PrWho, NmWho')
      else
        SQL.Add(' order by KdWho, PrWho, OKPO, NmWho');
      ParamByName('d_LDtOper').AsDateTime := d_LDtOper;
    end;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
    LabelCntRecKli.Caption := 'Клиентов: ' + IntToStr(RecordCount);
    sBtnGo.Enabled := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.OpenQryRSch;
var nSvKdRSch : SmallInt;
begin
  nSvKdRSch := 0;
  with qryRSch do begin
    if Active then begin
      nSvKdRSch := qryRSchKdRSch.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcWho;
     SQL.Add('Select * from Kd_RSch where KdWho = :KdWho ');
//    SQL.Add('Select * from Kd_RSch where KdWho = :KdWho ');
    //SQL.Add(' and OKPO = :OKPO');
    if rBtnShowBoevue.Checked then
      SQL.Add(' and (PA is NULL or PA < 1) ')
    else if rBtnShowArch.Checked then
      SQL.Add(' and (PA >= 1) ');
    if popMnuRSchOrderByRSch.Checked then
      SQL.Add(' order by RSch')
    else if popMnuRSchOrderByNmRSch.Checked then
      SQL.Add(' order by NmSch, RSch')
    else if popMnuRSchOrderByKdRSch.Checked then
      SQL.Add(' order by KdRSch, NmSch')
    else {popMnuRSchOrderByKdKliRSch}
      SQL.Add(' order by KdWho, RSch');
    Open;
    if nSvKdRSch <> 0 then
      Locate('KdRSch', nSvKdRSch, []);
    LabelCntRecRsch.Caption := 'Счетов: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.SetDbgrWhoColumns;
//var i : integer; cUpper : string;
begin
(*
  for i := 0 to dbgrWho.Columns.Count-1 do begin
    with dbgrWho.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'KDWHO') then
        Visible := bFlagDbg;
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.SetDbgrRSchColumns;
//var i : integer; cUpper : string;
begin
{
  for i := 0 to dbgrRSch.Columns.Count-1 do begin
    with dbgrRSch.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'KDWHO') or (cUpper = 'KDRSCH') then
        Visible := bFlagDbg;
    end;
  end;
}
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.FormCreate(Sender: TObject);
var nArchCase : word; nWhoSortCase, nRSchSortCase : SmallInt;
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 151);
	  Top    := ReadInteger(SECTION, 'wT', 190);
    Height := ReadInteger(SECTION, 'wH', 420);
    Width  := ReadInteger(SECTION, 'wW', 500);
    PanelWho.Height := ReadInteger(SECTION,'pnlWhH', 280);
    nLastWho := ReadInteger(SECTION, 'nLastWho', 0);
    nWhoSortCase := ReadInteger(SECTION, 'nWhoSortCase', 1); // по ОКПО
    nRSchSortCase := ReadInteger(SECTION, 'nRSchSortCase', 1); // по RSch
    if nWhoSortCase = 1 then
      popMnuWhoOrderByOKPO.Checked := true
    else if nWhoSortCase = 2 then
      popMnuWhoOrderByNmKli.Checked := true
    else
      popMnuWhoOrderByKdKli.Checked := true;
    if nRSchSortCase = 1 then
      popMnuRSchOrderByRSch.Checked := true
    else if nRSchSortCase = 2 then
      popMnuRSchOrderByNmRSch.Checked := true
    else if nRSchSortCase = 3 then
      popMnuRSchOrderByKdRSch.Checked := true
    else
      popMnuRSchOrderByKdKliRSch.Checked := true;
    nArchCase := ReadInteger(SECTION, 'nArchCase', 0);
    n_LDtOper := ReadInteger(SECTION, 'nLDtOper', 0);
    if n_LDtOper = 0 then begin
      d_LDtOper := EnCodeDate(2007,1,1);
      n_LDtOper := Round(d_LDtOper); end
    else
      d_LDtOper := n_LDtOper;
	  Free;
  end;
  dtPicLDtOper.Date := d_LDtOper;
  bIsFormShowKliDocs := false;
  if nArchCase = 1 then
    rBtnShowBoevue.Checked := true
  else if nArchCase = 2 then
    rBtnShowArch.Checked := true
  else
    rBtnShowAll.Checked := true;
  //popMnuWho.AutoPopup  := (nAppUsrKat <= 3);
  //popMnuRSch.AutoPopup := (nAppUsrKat <= 3);
  popMnuWhoInsOKPO.Visible := bFlagDbg;
  if FileExists(cDirVids + 'KliWho_3.vid') then
    dbgrWho.Columns.LoadFromFile(cDirVids + 'KliWho_3.vid');
  if FileExists(cDirVids + 'KliRS_3.vid') then
    dbgrRSch.Columns.LoadFromFile(cDirVids + 'KliRS_3.vid');
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if bIsFormShowKliDocs then
    FormShowKliDocs.Close;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.FormClose(Sender: TObject;	var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pnlWhH', PanelWho.Height);
    WriteInteger(SECTION, 'nLastWho', qryWho.FieldByName('KdWho').AsInteger);
    if popMnuWhoOrderByOKPO.Checked then
      WriteInteger(SECTION, 'nWhoSortCase', 1)
    else if popMnuWhoOrderByNmKli.Checked then
      WriteInteger(SECTION, 'nWhoSortCase', 2)
    else
      WriteInteger(SECTION, 'nWhoSortCase', 3);
    if popMnuRSchOrderByRSch.Checked then
      WriteInteger(SECTION, 'nRSchSortCase', 1)
    else if popMnuRSchOrderByNmRSch.Checked then
      WriteInteger(SECTION, 'nRSchSortCase', 2)
    else if popMnuRSchOrderByKdRSch.Checked then
      WriteInteger(SECTION, 'nRSchSortCase', 3)
    else
      WriteInteger(SECTION, 'nRSchSortCase', 4);
    if rBtnShowBoevue.Checked then
      WriteInteger(SECTION, 'nArchCase', 1)
    else if rBtnShowArch.Checked then
      WriteInteger(SECTION, 'nArchCase', 2)
    else
      WriteInteger(SECTION, 'nArchCase', 0);
    WriteInteger(SECTION, 'nLDtOper', n_LDtOper);
	  Free;
  end;
  dbgrWho.Columns.SaveToFile(cDirVids + 'KliWho_3.vid');
  dbgrRSch.Columns.SaveToFile(cDirVids + 'KliRS_3.vid');
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoFindClick(Sender: TObject);
var cMsg : string; nKdWho : integer; bDoPoisk : boolean;
    bPrjatal : boolean;
begin
  bPrjatal := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
  with TIniFile.Create(cNmIniFile) do begin
    bDoPoisk := false;
    cMsg := ReadString('BMn', 'cWhFndMsg', '');
    if (InputQuery('Поиск', 'Введите подстроку (часть наименования) для поиска:',
                               cMsg)) and (cMsg <> '') then begin
      Application.ProcessMessages;
      bDoPoisk := true;
      WriteString('BMn', 'cWhFndMsg', cMsg);
    end;
    Free;
  end;
  if bDoPoisk then begin
    if FindWhoAll(cMsg, nKdWho, d_LDtOper) then begin   {A_KliFnd}
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      if not dsrcWho.DataSet.Locate('KdWho', nKdWho, []) then
        ShowMessage('При заданной глубине выборки клиента не оказалось в таблице.' +
                    #13#10 +
               'Попробуйте увеличить глубину выборки клиентов из справочника.');
      Screen.Cursor := crDefault;
    end;
  end;
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoAddKliClick(Sender: TObject);
var cNmKli, cAdres, cNotes, cNmRSch, cRSch, cMfo,
    cOkpo, cNmBank, cNotesRS, cSwift : ShortString;
    nNewKdKli, nKdBank : SmallInt;
    bIsVal : boolean;
    bPrjatal : boolean;
begin
  if bAddKznRS then begin
    bPrjatal := false;
    if bIsFormShowKliDocs then begin
      if FormShowKliDocs.WindowState = wsNormal then begin
        FormShowKliDocs.WindowState := wsMinimized;
        bPrjatal := true;
      end;
    end;
    bIsVal := false;
    nKdBank := 0;
    cNmKli := c_NmKli;
    cAdres := '';
    cNotes := '';
    cNmRSch := c_NmKli;
    cRSch := c_KliRSch;
    cMfo := c_KliMFO;
    cOkpo := c_KliOkpo;
    cNmBank := c_KliNmBnk;
    cNotesRS := '';
    cSwift := '';
    if AddKznKliRS(bIsVal, cNmKli, cAdres, cNotes, cNmRSch, cRSch, {A_KliNew}
                    cMfo, cOkpo, cNmBank, cNotesRS, cSwift, nKdBank) then begin
    ///if AddKlient(bIsVal, cNmKli, cAdres, cNotes, cNmRSch, cRSch, {A_KliNew}
    //                cMfo, cOkpo, cNmBank, cNotesRS, cSwift, nKdBank) then begin
      Application.ProcessMessages;
      Form_Dm.DbMain.StartTransaction;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Select max(KdWho) as MaxWho from Kd_Who ' +
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
                ' (KdWho, NmWho, Adres, NmWhoE, PrWho, Notes, Okpo) ' +
                ' values (:nKdWho, :cNmWho, :cAdres, ' +
                ' :cNmWhoE, :nPrWho, :cNotes, :cOkpo)');
        ParamByName('nKdWho').AsInteger := nNewKdKli;
        ParamByName('cNmWho').AsString  := cNmKli;
        ParamByName('cAdres').AsString  := cAdres;
        ParamByName('cNmWhoE').AsString := '';
        ParamByName('cNotes').AsString  := cNotes;
        ParamByName('cOkpo').AsString  := cOkpo;
        ParamByName('nPrWho').AsInteger := 10;
        ExecSQL;
        Close;
        SQL.Clear;
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
    if bIsFormShowKliDocs and bPrjatal then
      FormShowKliDocs.WindowState := wsNormal; end
  else begin
    bPrjatal := false;
    if bIsFormShowKliDocs then begin
      if FormShowKliDocs.WindowState = wsNormal then begin
        FormShowKliDocs.WindowState := wsMinimized;
        bPrjatal := true;
      end;
    end;
    bIsVal := false;
    nKdBank := 0;
    if AddKlient(bIsVal, cNmKli, cAdres, cNotes, cNmRSch, cRSch, {A_KliNew}
                    cMfo, cOkpo, cNmBank, cNotesRS, cSwift, nKdBank) then begin
      Application.ProcessMessages;
      Form_Dm.DbMain.StartTransaction;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Select max(KdWho) as MaxWho from Kd_Who ' +
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
                ' (KdWho, NmWho, Adres, NmWhoE, PrWho, Notes, Okpo) ' +
                ' values (:nKdWho, :cNmWho, :cAdres, ' +
                ' :cNmWhoE, :nPrWho, :cNotes, :cOkpo)');
        ParamByName('nKdWho').AsInteger := nNewKdKli;
        ParamByName('cNmWho').AsString  := cNmKli;
        ParamByName('cAdres').AsString  := cAdres;
        ParamByName('cNmWhoE').AsString := '';
        ParamByName('cNotes').AsString  := cNotes;
        ParamByName('cOkpo').AsString  := cOkpo;
        ParamByName('nPrWho').AsInteger := 10;
        ExecSQL;
        Close;
        SQL.Clear;
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
    if bIsFormShowKliDocs and bPrjatal then
      FormShowKliDocs.WindowState := wsNormal;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoEdtClick(Sender: TObject);
var bIsRSch, bEdtRSch : boolean;
    nSvKdWho{, nSvNR} : integer;
    cNmKli, cAdres, cNotes, cOkpo : string;
    bPrjatal : boolean;
begin
  // Клиент - редактируется только NmWho и Notes в Kd_Who
  bPrjatal := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
  bIsRSCh  := qryRSch.RecordCount > 0;
  bEdtRSch := false;
  cNmKli   := qryWho.FieldByName('NmWho').AsString;
  cAdres   := qryWho.FieldByName('Adres').AsString;
  cNotes   := qryWho.FieldByName('Notes').AsString;
  cOkpo    := qryWho.FieldByName('OKPO').AsString;
  if EdtKlient(cNmKli, cOkpo, cNotes, cAdres, bIsRSch,
                                              bEdtRSch) {B_KliEdt} then begin
    Application.ProcessMessages;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := qryWho.DataBaseName;
      SQL.Add('Update Kd_Who ' +
              ' set NmWho = :cNmKli, Notes = :cNotes, Adres = :cAdres, ' +
              ' OKPO = :cOkpo where KdWho = ' +
                                        qryWho.FieldByName('KdWho').asString);
      ParamByName('cNmKli').AsString := cNmKli;
      ParamByName('cAdres').AsString := cAdres;
      ParamByName('cNotes').AsString := cNotes;
      ParamByName('cOkpo').AsString  := cOkpo;
      ExecSQL;
      if bEdtRSch then begin
        SQL.Clear;
        Params.Clear;
        DataBaseName := qryRSch.DataBaseName;
        SQL.Add('Update Kd_RSch ' +
                ' set NmSch = :cNmKli ' +
                'where KdWho = ' +
                        qryWho.FieldByName('KdWho').AsString);
        ParamByName('cNmKli').AsString := cNmKli;
        ExecSQL;
      end;
      Close;
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
      nSvNR := FieldByName('NR').AsInteger;
      Close;
      Open;
      Locate('NR', nSvNR, []);
    end;
}
  end;
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchAddClick(Sender: TObject);
var cNmKli, cNmSch, cRSch, cMfo, cOkpo, cNmBank, cNotes, cSwift : ShortString;
    nKdBank : SmallInt;
    bIsVal, bPrjatal : boolean;
begin
  bPrjatal := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
  cNmKli := qryWho.FieldByName('NmWho').AsString;
  cOkpo  := qryWho.FieldByName('Okpo').AsString;
  bIsVal := false;
  nKdBank := 0;
  cNmSch := '';
  cRSch := '';
  cMfo := '';
  cNmBank := '';
  if bAddKznRS  then begin
    cNmSch := c_NmKli;
    cRSch := c_KliRSch;
    cMfo := c_KliMFO;
    cOkpo := c_KliOkpo;
    cNmBank := c_KliNmBnk;
  end;
  if AddRSch(bIsVal, cNmKli, cNmSch, cRSch, {A_e2RSch}
                   cMfo, cOkpo, cNmBank, cNotes, cSwift, nKdBank) and
                     (cNmSch <> '') and (cRSch <> '') then with qryTmp do begin
    Application.ProcessMessages;
    if Active then Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Kd_RSch ' +
          ' (KdRSch, KdWho, NmSch, NmBank, RSch, Mfo, Okpo, LDtOper, Notes) ' +
          ' values (:nKdRSch, :nKdWho, :cNmSch, :cNmBank, ' +
            ' :cRSch, :cMfo, :cOkpo, :dLDtOper, :cNotes)');
    ParamByName('nKdRSch').AsInteger   := Form_Dm.NewKdRSch;
    ParamByName('nKdWho').AsInteger    :=
                             qryWho.FieldByName('KdWho').AsInteger;
    ParamByName('cNmSch').AsString     := cNmSch;
    ParamByName('cNmBank').AsString    := cNmBank;
    ParamByName('cRSch').AsString      := cRSch;
    ParamByName('cMfo').AsString       := cMfo;
    ParamByName('cOkpo').AsString      := cOkpo;
    ParamByName('dLDtOper').AsDateTime := Date;
    ParamByName('cNotes').AsString     := cNotes;
    ExecSQL;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
    qryRSch.Close;
    qryRSch.Open;
    qryRSch.Locate('RSch', cRSch, []);
    with Form_Dm.cdsRSchLU do begin
      Close;
      Open;
    end;
  end;
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchAddValClick(Sender: TObject);
var cNmKli, cNmSch, cRSch, cMfo, cOkpo, cNmBank, cNotes, cSwift : ShortString;
    nKdBnk : SmallInt; bIsVal, bPrjatal : boolean;
begin
  bPrjatal := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
  cNmKli := qryWho.FieldByName('NmWho').AsString;
  cOkpo  := qryWho.FieldByName('Okpo').AsString;
  nKdBnk := 0;
  bIsVal := true;
  if AddRSch(bIsVal, cNmKli, cNmSch, cRSch, {A_e2RSch}
               cMfo, cOkpo, cNmBank, cNotes, cSwift, nKdBnk) and
                    (cNmSch <> '') and (cRSch <> '') then with qryTmp do begin
    Application.ProcessMessages;
    if Active then Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Kd_RSch ' +
            ' (KdRSch, KdWho, NmSch, NmBank, RSch, Mfo, Okpo, Notes, Swift, ' +
            ' IsVal, KdBnk) values (:nKdRSch, :nKdWho, :cNmSch, :cNmBank, ' +
            ' :cRSch, :cMfo, :cOkpo, :cNotes, :cSwift, :cIsVal, :nKdBnk)');
    ParamByName('nKdRSch').AsInteger := Form_Dm.NewKdRSch;
    ParamByName('nKdWho').AsInteger  := qryWho.FieldByName('KdWho').AsInteger;
    ParamByName('cNmSch').AsString   := cNmSch;
    ParamByName('cNmBank').AsString  := cNmBank;
    ParamByName('cRSch').AsString    := cRSch;
    ParamByName('cMfo').AsString     := cMfo;
    ParamByName('cOkpo').AsString    := cOkpo;
    ParamByName('cNotes').AsString   := cNotes;
    ParamByName('cSwift').AsString   := cSwift;
    ParamByName('cIsVal').AsString   := 'Y';
    ParamByName('nKdBnk').AsInteger  := nKdBnk;
    ExecSQL;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
    qryRSch.Close;
    qryRSch.Open;
    qryRSch.Locate('RSch', cRSch, []);
    with Form_Dm.cdsRSchLU do begin
      Close;
      Open;
    end;
  end;
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoDelClick(Sender: TObject);
var bCanDelete, bWasDeleted : boolean;
    nSvPosWho : integer; mBookMark : TBookMark;
    cErrMsg, cNmCheckTbl : string;
    bPrjatal : boolean;
begin
  bPrjatal := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
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
  if qryWho.FieldByName('KdWho').AsInteger < 5000 then begin
    // Удаляется подразделение. Т.к. расч.счет только у подраз-
    // деления только один и на него выход возможен только через
    // KdWho, то значит можно вместе с удалением записи в Kd_Who
    // однозначно удалить и запись в Kd_RSch
    // Проверить, не задействован ли удаляемый KdWho
    // среди KdPdr, KdKli

//    GlCanDelete(cNmEsDb, cDelTbl, cKeyFld : string;
//                nValue : integer; var cNmCheckTbl : string) : boolean;

    bCanDelete := Form_Dm.GlCanDelete(CESMAIN, 'Kd_Who', 'KdWho',
                   qryWho.FieldByName('KdWho').AsInteger, cNmCheckTbl);
    if not bCanDelete then begin
      MessageDlg('Нельзя удалять эту запись - ' +
                 'на нее есть ссылки' + #13#10 +
                 'в таблице ' + cNmCheckTbl, mtError, [mbOk], 0);
      Exit; end
    else if (MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes) then
                                                            with qryTmp do begin
      Application.ProcessMessages;
      Close;
      SQL.Clear;
      Params.Clear;
      // Сначала удалить счет - иначе не даст сервер.
      DataBaseName := qryRSch.DataBaseName;
      SQL.Add('Delete from Kd_RSch ' +
              ' where (KdWho = ' +
                      qryWho.FieldByName('KdWho').AsString + ')');
      ExecSQL;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := qryWho.DataBaseName;
      SQL.Add('Delete from Kd_Who ' +
              ' where KdWho = ' +
                           qryWho.FieldByName('KdWho').AsString);
      ExecSQL;
      bWasDeleted := true;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := '';
    end; end
  else begin
    // Попытка удалить запись клиента в Kd_Who.
    // Если в qryRSch есть связанные с этим KdWho записи, то
    // пусть сначала удалит расчетные счета.
    // Иначе проверить нет ли ссылок среди KdPdr, KdKli
    if (qryRSch.RecordCount > 0) then begin
      MessageDlg('Сначала должны быть удалены все расчетные' +
                 #13#10 + 'счета этого клиента.',
                                              mtError, [mbOk], 0);
      Exit;
    end;
    bCanDelete := Form_Dm.GlCanDelete(CESMAIN, 'Kd_Who', 'KdWho',
                   qryWho.FieldByName('KdWho').AsInteger, cErrMsg);
    if not bCanDelete then begin
      MessageDlg('Нельзя удалять эту запись - ' +
                 'на нее есть ссылки' + #13#10 +
                 'в таблице ' + cErrMsg, mtError, [mbOk], 0);
      if bIsFormShowKliDocs and bPrjatal then
        FormShowKliDocs.WindowState := wsNormal;
      Exit; end
    else if (MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes) then
                                                            with qryTmp do begin
      Application.ProcessMessages;
      Close;
      SQL.Clear;
      Params.Clear;
      DataBaseName := qryWho.DataBaseName;
      SQL.Add('Delete from Kd_Who ' +
              ' where KdWho = ' +
                           qryWho.FieldByName('KdWho').AsString);
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
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchDelClick(Sender: TObject);
var bCanDelete, bWasDeleted : boolean; nDelRSch : integer;
    cErrMsg, cNmCheckTbl : string;
    bPrjatal : boolean;
begin
  bPrjatal := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
  // Включается (Enabled) только на счетах клиентов
  // Проверить, не найдется ли расч.счет в Bnk_Mov
  // Если найдется, сообщить - пусть сначала удалит все
  // записи по этому счету в Bnk_Mov.
  nDelRSch := qryRSch.FieldByName('KdRSch').AsInteger;
  bWasDeleted := false;
  bCanDelete := Form_Dm.GlCanDelete(CESMAIN, 'KD_RSCH', 'KDRSCH',
                                               nDelRSch, cNmCheckTbl);
  if not bCanDelete then begin
    cErrMsg := 'Нельзя удалять запись - на нее ссылается' + #13#10 +
               'таблица "' + cNmCheckTbl + '"';
    MessageDlg(cErrMsg, mtError, [mbOk], 0);
    if bIsFormShowKliDocs and bPrjatal then
      FormShowKliDocs.WindowState := wsNormal;
    Exit;
  end;
  if (MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes) then
                                                          with qryTmp do begin
    Application.ProcessMessages;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := qryRSch.DataBaseName;
    SQL.Add('Delete from Kd_RSch where (KdWho = ' +
                           qryWho.FieldByName('KdWho').AsString +
            ') and (KdRSch = ' + IntToStr(nDelRSch) + ')');
    ExecSQL;
    bWasDeleted := true;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
  end;
  if bWasDeleted then begin
    with qryRSch do begin
      Close;
      Open;
    end;
    with Form_Dm.cdsRSchLU do begin
      Close;
      Open;
    end;
  end;
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbgrRSchDblClick(Sender: TObject);
begin
  if bVuborMode and bBtnOk.Enabled then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoPopup(Sender: TObject);
begin
  popMnuWhoEdt.Enabled := (qryWho.RecordCount <> 0);
  popMnuWhoDel.Enabled := (qryWho.RecordCount <> 0);
  popMnuWhoToArch.Enabled := popMnuWhoEdt.Enabled and
                             (qryWhoPA.IsNull or (qryWhoPA.AsInteger < 1));
  popMnuWhoFromArch.Enabled := popMnuWhoEdt.Enabled and
                                                 (qryWhoPA.AsInteger >= 1);
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchPopup(Sender: TObject);
begin
  popMnuRSchEdt.Enabled  := (qryRSch.RecordCount <> 0);
  popMnuRSchDel.Enabled  := (qryRSch.RecordCount <> 0);
  popMnuRSchToArch.Enabled := popMnuRSchEdt.Enabled and
                              (qryRSchPA.IsNull or (qryRSchPA.AsInteger < 1));
  popMnuRSchFromArch.Enabled := popMnuRSchEdt.Enabled and
                                                  (qryRSchPA.AsInteger >= 1);
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.rBtnSortByKdKliClick(Sender: TObject);
begin
  OpenDataSets;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.rBtnSortByNameClick(Sender: TObject);
begin
  OpenDataSets;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.rBtnSortByOKPOClick(Sender: TObject);
begin
  OpenDataSets;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.rBtnShowAllClick(Sender: TObject);
begin
  OpenDataSets;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.rBtnShowBoevueClick(Sender: TObject);
begin
  OpenDataSets;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.rBtnShowArchClick(Sender: TObject);
begin
  OpenDataSets;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchEdtClick(Sender: TObject);
var cNmKli, cNmSch, cRSch, cMfo, cOkpo, cNmBnk, cNotes, cSwift : ShortString;
    nKdRSch, nKdBnk : SmallInt;  bIsVal : boolean;
    bPrjatal : boolean;
begin
  bPrjatal := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
  cNmKli := qryWho.FieldByName('NmWho').AsString;
  with qryRSch do begin
    bIsVal  := FieldByName('IsVal').AsString = 'Y';
    nKdRSch := FieldByName('KdRSch').AsInteger;
    nKdBnk  := FieldByName('KdBnk').AsInteger;
    cNmSch  := FieldByName('NmSch').AsString;
    cRSch   := FieldByName('RSch').AsString;
    cMfo    := FieldByName('Mfo').AsString;
    cOkpo   := FieldByName('Okpo').AsString;
    cNmBnk  := FieldByName('NmBank').AsString;
    cNotes  := FieldByName('Notes').AsString;
    cSwift  := FieldByName('Swift').AsString;
  end;
  if EdtRSch(bIsVal, cNmKli, cNmSch, cRSch, {B_RSchNw}
                 cMfo, cOkpo, cNmBnk, cNotes, cSwift, nKdBnk) and
                    (cNmSch <> '') and (cRSch <> '') then with qryTmp do begin
    Application.ProcessMessages;
    SQL.Clear;
    Params.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Kd_RSch ' +
            ' set NmSch = :cNmSch, NmBank = :cNmBnk, ' +
            ' RSch = :cRSch, Mfo = :cMfo, Okpo = :cOkpo, ' +
            ' Notes = :cNotes, Swift = :cSwift, IsVal = :cIsVal, ' +
            ' KdBnk = :nKdBnk where KdRSch = :nKdRSch');
    ParamByName('cNmSch').AsString   := cNmSch;
    ParamByName('cNmBnk').AsString   := cNmBnk;
    ParamByName('cRSch').AsString    := cRSch;
    ParamByName('cMfo').AsString     := cMfo;
    ParamByName('cOkpo').AsString    := cOkpo;
    ParamByName('cNotes').AsString   := cNotes;
    ParamByName('cSwift').AsString   := cSwift;
    ParamByName('nKdRSch').AsInteger := nKdRSch;
    ParamByName('nKdBnk').AsInteger  := nKdBnk;
    if bIsVal then
      ParamByName('cIsVal').AsString := 'Y'
    else
      ParamByName('cIsVal').AsString := '';
    // Клиент - cSchBU, nKdSchBU, nKdValPdr не нужны
    ExecSQL;
    qryRSch.Close;
    qryRSch.Open;
    qryRSch.Locate('KdRSch', nKdRSch, []);
    with Form_Dm.cdsRSchLU do begin
      Close;
      Open;
    end;
  end;
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchPoiskClick(Sender: TObject);
var nKdWho, nKdRSch : SmallInt;
    cNmSch, cRSch, cMfo, cOkpo, cNmBank : ShortString;
    bPrjatal, bFoundKli, bFoundRSch : boolean;
begin
  bPrjatal := false;
  bFoundKli := false;
  bFoundRSch := false;
  if bIsFormShowKliDocs then begin
    if FormShowKliDocs.WindowState = wsNormal then begin
      FormShowKliDocs.WindowState := wsMinimized;
      bPrjatal := true;
    end;
  end;
  if bAddKznRS  then begin
    cNmSch := c_NmKli;
    cRSch := c_KliRSch;
    cMfo := c_KliMFO;
    cOkpo := c_KliOkpo;
    cNmBank := c_KliNmBnk;
  end;
  if VvodUslovijRSch(cNmSch, cRSch, cMfo, cOkpo, cNmBank) {B_GtUslR} then begin
    nKdWho  := 0;
    nKdRSch := 0;
    if PoiskRSch(nKdWho, nKdRSch, cNmSch, cRSch, {A_FindRS}
                            cMfo, cOkpo, cNmBank, d_LDtOper) then begin
//      bFoundKli := qryWho.Locate('OKPO', cOkpo, []);
      bFoundKli := qryWho.Locate('KdWho', nKdWho, []);
      if bFoundKli then
        bFoundRSch := qryRSch.Locate('KdRSch', nKdRSch, []);
      if not bFoundKli or not bFoundRSch then
        ShowMessage('Не удался поиск по заданным реквизитам.' + #13#10 +
                    'Попробуйте увеличить "глубину" выборки клиентов');  
    end;
  end;
  if bIsFormShowKliDocs and bPrjatal then
    FormShowKliDocs.WindowState := wsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbgrRSchKeyDown(Sender: TObject;
                                            var Key: Word; Shift: TShiftState);
begin
  if bVuborMode and (qryRSch.RecordCount <> 0) and bBtnOk.Enabled and
                             (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbgrWhoDblClick(Sender: TObject);
begin
  if bVuborMode and (qryRSch.RecordCount <> 0) and bBtnOk.Enabled then begin
(*
    if Length(qryWhoNmWhO.Value) > 38 then
    if MessageDlg('Длина наименования ', mtWarning,
                                           [mbYes, mbNo], 0) = mrYes then begin
*)
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbgrWhoKeyDown(Sender: TObject;
                                            var Key: Word; Shift: TShiftState);
begin
  if bVuborMode and (qryRSch.RecordCount <> 0) and bBtnOk.Enabled and
                          (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    ModalResult := mrOk
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dsrcWhoDataChange(Sender: TObject; Field: TField);
begin
  if (not bBtnOk.Visible) or (not qryRSch.Active) then Exit;
  bBtnOk.Enabled := (qryRSch.RecordCount <> 0) and
                       (qryWhoPA.IsNull or (qryWhoPA.AsInteger < 1)) and
                          (qryRSchPA.IsNull or (qryRSChPA.AsInteger < 1));
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dsrcRSchDataChange(Sender: TObject; Field: TField);
begin
  if (not bBtnOk.Visible) or (not qryRSch.Active) then Exit;
  bBtnOk.Enabled := (qryRSch.RecordCount <> 0) and
                       (qryWhoPA.IsNull or (qryWhoPA.AsInteger < 1)) and
                          (qryRSchPA.IsNull or (qryRSChPA.AsInteger < 1));
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoInsOKPOClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Kd_Who set OKPO = :cOkpo where KdWho = :nKdWho');
  end;
  with qryWho do begin
    First;
    while not Eof do begin
      if (qryRSch.RecordCount > 0) and
                                (qryRSchOKPO.AsString <> '') then begin
        qryTmp.ParamByName('cOKPO').AsString := qryRSchOKPO.AsString;
        qryTmp.ParamByName('nKdWho').AsInteger := qryWhoKdWho.AsInteger;
        qryTmp.ExecSQL;
      end;
      Next;
    end;
  end;
  with qryTmp do begin
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoPltgClick(Sender: TObject);
var nKdKli : integer; cNmKli : string;
begin
  nKdKli := qryWhoKdWho.AsInteger;
  cNmKli := qryWhoNmWho.AsString;
  Show_KliD(nKdKli, cNmKli);  {b_ShKliD}
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.qryWhoAfterScroll(DataSet: TDataSet);
begin
  if bIsFormShowKliDocs then
    FormShowKliDocs.OpenCdsKliD(qryWhoKdWho.AsInteger);
  if qryRSch.Active and (qryRSch.State = dsBrowse) then
    LabelCntRecRsch.Caption := 'Счетов: ' + IntToStr(qryRSch.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbgrWhoDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrWho.Canvas do begin
    if not (gdFocused in State) then begin
      if qryWhoPA.IsNull or (qryWhoPA.AsInteger < 1) then

      else   {отправленные в архив - показать строку на сером фоне}
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrWho.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbgrRSchDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrRSch.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryRSch.FieldByName('IsVal').AsString = 'Y') then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
      if qryRSchPA.IsNull or (qryRSchPA.AsInteger < 1) then
        // ничего не делать
      else    {отправленные в архив - показать строку на сером фоне}
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrRSch.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoToArchClick(Sender: TObject);
var nSvKdWho : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryWho.DataBaseName;
    SQL.Add('Update kd_Who set PA = 5 where KdWho = :nKdWho');
    ParamByName('nKdWho').AsInteger := qryWhoKdWho.AsInteger;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  nSvKdWho := qryWhoKdWho.AsInteger;
  with qryWho do begin
    DisableControls;
    Close;
    Open;
    Locate('KdWho', nSvKdWho, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoFromArchClick(Sender: TObject);
var nSvKdWho : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryWho.DataBaseName;
    SQL.Add('Update kd_Who set PA = null where KdWho = :nKdWho');
    ParamByName('nKdWho').AsInteger := qryWhoKdWho.AsInteger;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  nSvKdWho := qryWhoKdWho.AsInteger;
  with qryWho do begin
    DisableControls;
    Close;
    Open;
    Locate('KdWho', nSvKdWho, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchToArchClick(Sender: TObject);
var nSvKdRSch : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryWho.DataBaseName;
    SQL.Add('Update kd_RSch set PA = 5 where KdRSch = :nKdRSch');
    ParamByName('nKdRSch').AsInteger := qryRSchKdRSch.AsInteger;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  nSvKdRSch := qryRSchKdRSch.AsInteger;
  with qryRSch do begin
    DisableControls;
    Close;
    Open;
    Locate('KdRSch', nSvKdRSch, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchFromArchClick(Sender: TObject);
var nSvKdRSch : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryWho.DataBaseName;
    SQL.Add('Update kd_RSch set PA = null where KdRSch = :nKdRSch');
    ParamByName('nKdRSch').AsInteger := qryRSchKdRSch.AsInteger;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  nSvKdRSch := qryRSchKdRSch.AsInteger;
  with qryRSch do begin
    DisableControls;
    Close;
    Open;
    Locate('KdRSch', nSvKdRSch, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dtPicLDtOperCloseUp(Sender: TObject);
begin
  d_LDtOper := dtPicLDtOper.Date;
  sBtnGo.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.sBtnGoClick(Sender: TObject);
begin
  d_LDtOper := dtPicLDtOper.Date;
  n_LDtOper := Round(d_LDtOper);
  OpenDataSets;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dtPicLDtOperEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.dtPicLDtOperExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoOrderByOKPOClick(Sender: TObject);
begin
  if not popMnuWhoOrderByOKPO.Checked then begin
    popMnuWhoOrderByOKPO.Checked := true;
    OpenQryWho;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoOrderByNmKliClick(Sender: TObject);
begin
  if not popMnuWhoOrderByNmKli.Checked then begin
    popMnuWhoOrderByNmKli.Checked := true;
    OpenQryWho;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuWhoOrderByKdKliClick(Sender: TObject);
begin
  if not popMnuWhoOrderByKdKli.Checked then begin
    popMnuWhoOrderByKdKli.Checked := true;
    OpenQryWho;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchOrderByRSchClick(Sender: TObject);
begin
  if not popMnuRSchOrderByRSch.Checked then begin
    popMnuRSchOrderByRSch.Checked := true;
    OpenQryRSch;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchOrderByNmRSchClick(Sender: TObject);
begin
  if not popMnuRSchOrderByNmRSch.Checked then begin
    popMnuRSchOrderByNmRSch.Checked := true;
    OpenQryRSch;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchOrderByKdRSchClick(Sender: TObject);
begin
  if not popMnuRSchOrderByKdRSch.Checked then begin
    popMnuRSchOrderByKdRSch.Checked := true;
    OpenQryRSch;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdKli.popMnuRSchOrderByKdKliRSchClick(Sender: TObject);
begin
  if not popMnuRSchOrderByKdKliRSch.Checked then begin
    popMnuRSchOrderByKdKliRSch.Checked := true;
    OpenQryRSch;
  end;
end;

end.
