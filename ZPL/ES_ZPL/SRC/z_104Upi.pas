unit z_104Upi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls, ExtCtrls;

type
  TFormAddUpi104 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    sBtnGo: TSpeedButton;
    qryOldUpi: TQuery;
    dsrcOldUpi: TDataSource;
    dbgrOldUpi: TDBGrid;
    qryTmp: TQuery;
    qryOldTmp: TQuery;
    qryOldUpiNewKdObj: TSmallintField;
    qryOldUpiNewKdSBU: TSmallintField;
    qryOldUpiz_Fam: TStringField;
    qryOldUpiZ_Ima: TStringField;
    qryOldUpiZ_Otch: TStringField;
    qryOldUpiz_TabN: TIntegerField;
    qryOldUpiID: TStringField;
    qryOldUpiFAM: TStringField;
    qryOldUpiIMA: TStringField;
    qryOldUpiOTCH: TStringField;
    qryOldUpiIdent: TStringField;
    qryOldUpiLS: TStringField;
    qryOldUpiTabN_1: TFloatField;
    qryOldUpiDT_BEG: TDateField;
    qryOldUpiDT_END: TDateField;
    qryOldUpiObj: TSmallintField;
    qryOldUpiVED: TSmallintField;
    qryOldUpiSO: TSmallintField;
    qryOldUpiOKLTRF: TFloatField;
    qryOldUpiSZatr: TStringField;
    qryOldUpiKAT: TSmallintField;
    qryOldUpiDOLGNOST: TStringField;
    qryOldUpiNR_PRIKAZA: TStringField;
    qryOldUpiDT_PRIKAZA: TDateField;
    qryOldUpiNewTabN: TIntegerField;
    qryOldUpiNotes: TStringField;
    qryOldUpiTabN: TSmallintField;
    qryOldUpiPol: TStringField;
    qryOldUpiDPriem: TDateField;
    qryOldUpiDUvoln: TDateField;
    procedure sBtnGoClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveNewTabN(nTabN, nNewTabN : integer);
    procedure AddRecInZUpi(nTabN : integer;
                               cID, cFam, cIma, cOtch, cNotes : ShortString);
    procedure AddRecInPrmUv(nKdSps, nTabN : integer;
                                   dDtPrm : TDateTime; cNotes : ShortString);
    procedure AddRecInPere(nTabN : integer; dDtBeg : TDateTime;
                            nKdSps, nKdObj, nOldKdObj, nKdKatP, nKdSbu, nSO : SmallInt;
                              nOklTrf : double; cDolgn, cNotes : ShortString);
  public
    { Public declarations }
  end;

procedure AddUpi104;

var
  FormAddUpi104: TFormAddUpi104;

implementation

uses a_Const, a_DM, Z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddUpi104;
begin
  FormAddUpi104 := TFormAddUpi104.Create(Application);
  with FormAddUpi104 do begin
    if not qryOldUpi.Active then
      qryOldUpi.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddUpi104.sBtnGoClick(Sender: TObject);
var nTabN, nNewTabN : integer;
    nKdSps, nKdObj, nOldKdObj, nKdKaTp, nKdSbu, nSO{, nPdNlg} : SmallInt;
    cID, cFam, cIma, cOtch, cMyNotes, cDolgnost : ShortString;
    dDtPrm, dDtBeg : TDateTime;
    nOklTrf : double;
begin
  cMyNotes := 'из 316_НИЧ';
  nKdSps := 6; // для 316
  with qryOldUpi do begin
    if not Active then
      Open;
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if not FieldByName('Z_TabN').IsNull then begin
        Next;       // Пишу только не имеющих соответствия,
        Continue;   // а этот уже есть в новой БД - пропускаю.
      end;
      nNewTabN := DmMain.NewUpiTabN;
      cID      := FieldByName('Ident').AsString;
      cFam     := FieldByName('Fam').AsString;
      cIma     := FieldByName('Ima').AsString;
      cOtch    := FieldByName('Otch').AsString;
      dDtPrm   := FieldByName('Dt_Beg').AsDateTime;
      // Добавить запись в Z_UPI
      // и в z_PrmUv по самой первой записи в qryOldUpi
      AddRecInZUpi(nNewTabN, cID, cFam, cIma, cOtch, cMyNotes);
      AddRecInPrmUv(0, nNewTabN, dDtPrm, cMyNotes);
      SaveNewTabN(nTabN, nNewTabN); // записать nNewTabN в u106_2.db
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        // Добавить записи в Z_Pere
        dDtBeg    := FieldByName('Dt_Beg').AsDateTime;
        nOldKdObj := FieldByName('Obj').AsInteger;
        nKdObj    := FieldByName('NewKdObj').AsInteger;
        nKdKatP   :=  FieldByName('Kat').AsInteger;
        nKdSbu    := FieldByName('NewKdSbu').AsInteger;
        nSO       := FieldByName('SO').AsInteger;
        nOklTrf   := FieldByName('OklTrf').AsFloat;
        cDolgnost := FieldByName('Dolgnost').AsString;
        AddRecInPere(nNewTabN, dDtBeg, nKdSps, nKdObj, nOldKdObj, nKdKatP,
                                    nKdSbu, nSO, nOklTrf, cDolgnost, cMyNotes);
        Next;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddUpi104.SaveNewTabN(nTabN, nNewTabN : integer);
begin
  with qryOldTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := qryOldUpi.DataBaseName;
    SQL.Add('Update "n_UP_Z.db" set NewTabN = :nNewTabN where TabN = :nTabN');
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('nNewTabN').AsInteger := nNewTabN;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddUpi104.AddRecInPere(nTabN : integer; dDtBeg : TDateTime;
                    nKdSps, nKdObj, nOldKdObj, nKdKatP, nKdSbu, nSO : SmallInt;
                    nOklTrf : double; cDolgn, cNotes : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_PERE (KdSps, TabN, Dt_Beg, KdObj, OldKdObj, ' +
            ' KdKatP, KdSpZ, SO, OklTrf, Dolgnost, Notes) values ' +
            ' (:nKdSps, :nTabN, :dDtBeg, :nKdObj, :nOldKdObj, :nKdKatP, ' +
            ' :nKdSbu, :nSO, :nOklTrf, :cDolgn, :cNotes)');
    ParamByName('nKdSps').AsInteger    := nKdSps;
    ParamByName('nTabN').AsInteger     := nTabN;
    ParamByName('dDtBeg').AsDateTime   := dDtBeg;
    ParamByName('nKdObj').AsInteger    := nKdObj;
    ParamByName('nOldKdObj').AsInteger := nOldKdObj;
    ParamByName('nKdKatP').AsInteger   := nKdKatP;
    ParamByName('nKdSbu').AsInteger    := nKdSbu;
    ParamByName('nSO').AsInteger       := nSO;
    ParamByName('nOklTrf').AsFloat     := nOklTrf;
    ParamByName('cDolgn').AsString     := cDolgn;
    ParamByName('cNotes').AsString     := cNotes;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddUpi104.AddRecInZUpi(nTabN : integer;
                               cID, cFam, cIma, cOtch, cNotes : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_UPI (TabN, ID, Fam, Ima, Otch, MyNotes) values ' +
            ' (:nTabN, :cID, :cFam, :cIma, :cOtch, :cNotes)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('cID').AsString    := cID;
    ParamByName('cFam').AsString   := cFam;
    ParamByName('cIma').AsString   := cIma;
    ParamByName('cOtch').AsString  := cOtch;
    ParamByName('cNotes').AsString := cNotes;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddUpi104.AddRecInPrmUv(nKdSps, nTabN : integer;
                                   dDtPrm : TDateTime; cNotes : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_PrmUv (KdSps, TabN, Dt_Priem, Notes) values ' +
            ' (:nKdSps, :nTabN, :dDtPrm, :cNotes)');
    ParamByName('nKdSps').AsInteger  := nKdSps;
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtPrm').AsDateTime := dDtPrm;
    ParamByName('cNotes').AsString   := cNotes;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

end.
