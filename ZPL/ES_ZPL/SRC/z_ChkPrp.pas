unit z_ChkPrp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls,
  Buttons, Menus;

type
  TFormCheckPrp = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrTmp: TDBGrid;
    qryTmp: TQuery;
    dsrcTmp: TDataSource;
    Splitter1: TSplitter;
    dbgrPrp: TDBGrid;
    tblPrp: TTable;
    tblPrpNR: TAutoIncField;
    tblPrpZaMesGod: TDateField;
    tblPrpSmForPF: TFloatField;
    tblPrpSmToPFCmn: TFloatField;
    tblPrpSmToPFInv: TFloatField;
    tblPrpSmSvPrgPf: TFloatField;
    tblPrpSmForSsTvp: TFloatField;
    tblPrpSmToSsTvp: TFloatField;
    tblPrpSmSvPrgTvp: TFloatField;
    tblPrpSmForSsNv: TFloatField;
    tblPrpSmToSsNv: TFloatField;
    tblPrpSmSvPrgNv: TFloatField;
    tblPrpSmForFz: TFloatField;
    tblPrpSmToFz: TFloatField;
    tblPrpSmSvPrgFz: TFloatField;
    dsrcPrp: TDataSource;
    tblPrpTabN: TIntegerField;
    tblPrpFamIO: TStringField;
    sBtnGo: TSpeedButton;
    tblPrpPSch: TStringField;
    qryPere: TQuery;
    tblPrpIsPPS: TBooleanField;
    tblPrpIsInv: TBooleanField;
    tblPrpIsPens: TBooleanField;
    pop: TPopupMenu;
    popSort: TMenuItem;
    popSortTabNPSchZaMG: TMenuItem;
    popSortTabNZaMGPSch: TMenuItem;
    popFilter: TMenuItem;
    popFilterOnlySvPorogi: TMenuItem;
    tblPrpTt: TTable;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    BooleanField1: TBooleanField;
    BooleanField2: TBooleanField;
    BooleanField3: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnGoClick(Sender: TObject);
    procedure popSortTabNPSchZaMGClick(Sender: TObject);
    procedure popSortTabNZaMGPSchClick(Sender: TObject);
    procedure popFilterOnlySvPorogiClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure CreOpenTblPrp(dDtPrc : TDateTime);
    procedure MyGo(dDtPrc : TDateTime);
    procedure AddInfTotblPrp(nTabN : integer; dZaMG : TDateTime;
                                  cPSch, cFamIO : ShortString;
                                  nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                                  nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                                  nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                                  nSmForFz, nSmToFz, nSmSvPrgFz : double;
                                  bIsPPS, bIsInv, bIsPens : boolean);
    procedure AddInfToTblPrpTt(nTabN : integer; dZaMG : TDateTime;
                                  cPSch, cFamIO : ShortString;
                                  nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                                  nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                                  nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                                  nSmForFz, nSmToFz, nSmSvPrgFz : double;
                                  bIsPPS, bIsInv, bIsPens : boolean);
    procedure GetPereInf(nTabN : integer; dDtBeg : TDateTime;
                                        var bIsPPS, bIsInv, bIsPens : boolean);
    procedure SetPrpSortMode;
  public
    { Public declarations }
  end;

procedure CheckVznPrp(dDtPrc : TDateTime);

const SECTION = 'z_ChkPrp';

var
  FormCheckPrp: TFormCheckPrp;

implementation

uses a_Const, a_DM, z_DM, z_Main, z_TUpi;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure CheckVznPrp(dDtPrc : TDateTime);
begin
  if not bIsFormCheckPrp then begin
    FormCheckPrp := TFormCheckPrp.Create(Application);
    bIsFormCheckPrp := true;
    with FormCheckPrp do begin
      d_DtPrc := dDtPrc;
      CreOpenTblPrp(dDtPrc);
      //ShowModal;
      //Free;
      Show;
    end; end
  else begin
   if FormCheckPrp.WindowState = wsMinimized then
     FormCheckPrp.WindowState := wsNormal;
   FormCheckPrp.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.CreOpenTblPrp(dDtPrc : TDateTime);
begin
  with tblPrp do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := 'xxx_Prp.db';
    if Exists then DeleteTable;
    IndexName := '';
    IndexDefs.Clear;
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
    AddIndex('OnTnPSchMg', 'TabN;PSch;ZaMesGod', []);
    AddIndex('OnTnMgPSch', 'TabN;ZaMesGod;PSch', []);
    AddIndex('OnPSchMgTn', 'PSch;ZaMesGod;TabN', []);
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from VinuMain where (DtProc = :dDtPrc) and ' +
            ' (VidN < "6000" or VidN > "8600") ' +
            ' order by TabN, ZaMesGod, PSCH, VidN ');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    sBtnGo.Enabled := not FieldByName('TabN').IsNull;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    popSortTabNPSchZaMG.Checked := ReadBool(SECTION, 'bSort1', true);
    popSortTabNZaMGPSch.Checked := not popSortTabNPSchZaMG.Checked;
    Free;
  end;
  if FileExists(cDirVids + 'ChkPrp01.vid') then
    dbgrPrp.Columns.LoadFromFile(cDirVids + 'ChkPrp01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormCheckPrp := false;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPrp.Columns.SaveToFile(cDirVids + 'ChkPrp01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bSort1', popSortTabNPSchZaMG.Checked);
    Free;
  end;
  bIsFormCheckPrp := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.sBtnGoClick(Sender: TObject);
begin
  MyGo(d_DtPrc);;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.GetPereInf(nTabN : integer; dDtBeg : TDateTime;
                               var bIsPPS, bIsInv, bIsPens : boolean);
begin
  with qryPere do begin
    First;
    while not Eof do begin
      if FieldByName('Dt_Beg').AsDateTime <= dDtBeg then begin
        bIsPPS  := FieldByName('KdKatP').AsInteger = 1;
        bIsInv  := FieldByName('Inv').AsInteger > 0;
        bIsPens := FieldByName('Pr_Pens').AsInteger > 0;
        Break;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.MyGo(dDtPrc : TDateTime);
var nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
    nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
    nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
    nSmForFz, nSmToFz, nSmSvPrgFz : double;
    nTabN : integer;
    dZaMG, dDOB : TDateTime;
    cVidN, cPSch : ShortString;
    cFamIO, cFam, cIma, cOtch, cPol, cID : string;
    nY, nM, nD : word;
    bIsPPS, bIsInv, bIsPens : boolean;
begin
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_Pere where TabN = :nTabN and Dt_Beg <= :dZaMG ' +
            'order by Dt_Beg desc, NR desc');
    Prepare;
  end;
  DecodeDate(dDtPrc, nY, nM, nD);
  with qryTmp do begin
    First;
    while not Eof { and (nTabN < 5000) } do begin
      nTabN  := FieldByName('TabN').AsInteger;
      cFamIO := ''; // qryTmp - order by TabN, ZaMesGod, PSCH, SchBU, VidN
      DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch, cPol, cID, dDOB);
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        dZaMG   := FieldByName('ZaMesGod').AsDateTime;
        bIsPPS  := false;
        bIsInv  := false;
        bIsPens := false;
        if qryPere.Active then qryPere.Close;
        qryPere.ParamByName('nTabN').AsInteger := nTabN;
        qryPere.ParamByName('dZaMG').AsDateTime := dZaMG;
        qryPere.Open;
        GetPereInf(nTabN, dZaMG, bIsPPS, bIsInv, bIsPens);
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                 (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          // пока опускаю проверки "параметров" “абЌ
          cPSch := FieldByName('PSch').AsString;
          nSmForPF    := 0;
          nSmToPfCmn  := 0;
          nSmToPfInv  := 0;
          nSmSvPrgPf  := 0;
          nSmForSsTvp := 0;
          nSmToSsTvp  := 0;
          nSmSvPrgTvp := 0;
          nSmForSsNv  := 0;
          nSmToSsNv   := 0;
          nSmSvPrgNv  := 0;
          nSmForFz    := 0;
          nSmToFz     := 0;
          nSmSvPrgFz  := 0;
          while (FieldByName('PSch').AsString = cPSch) and
                  (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                   (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
            cVidN := FieldByName('VidN').AsString;
            if cVidN < '6000' then begin
              if FieldByName('SP_PF').AsString = '1' then
                nSmForPF := nSmForPF + FieldByName('Summa').AsFloat;
              if FieldByName('SP_FSTVP').AsString = '1' then
                nSmForSsTvp := nSmForSsTvp + FieldByName('Summa').AsFloat;
              if FieldByName('SP_FSNV').AsString = '1' then
                nSmForSsNv := nSmForSsNv + FieldByName('Summa').AsFloat;
              if FieldByName('SP_FZ').AsString = '1' then
                nSmForFz := nSmForFz + FieldByName('Summa').AsFloat; end
            else if cVidN = '8611' then
              nSmToPfCmn := nSmToPfCmn + FieldByName('Summa').AsFloat
            else if cVidN = '8612' then
              nSmToPfInv := nSmToPfInv + FieldByName('Summa').AsFloat
            else if cVidN = '8621' then
              nSmToSsTvp := nSmToSsTvp + FieldByName('Summa').AsFloat
            else if cVidN = '8631' then
              nSmToSsNv := nSmToSsNv + FieldByName('Summa').AsFloat
            else if cVidN = '8641' then
              nSmToFz := nSmToFz + FieldByName('Summa').AsFloat
            else if cVidN = '8671' then
              nSmSvPrgPf := nSmSvPrgPf + FieldByName('Summa').AsFloat
            else if cVidN = '8672' then begin
              nSmSvPrgTvp := nSmSvPrgTvp + FieldByName('Summa').AsFloat;
              nSmSvPrgNv := nSmSvPrgNv + FieldByName('Summa').AsFloat; end
            else if cVidN = '8674' then
              nSmSvPrgFz := nSmSvPrgFz + FieldByName('Summa').AsFloat;
            Next;
          end;
          AddInfToTblPrp(nTabN, dZaMG, cPSch, cFamIO,
                              nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                              nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                              nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                              nSmForFz, nSmToFz, nSmSvPrgFz,
                              bIsPPS, bIsInv, bIsPens);
        end;
      end;
    end;
  end;
  with tblPrpTt do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := 'xx_PrpTt.db';
    if Exists then DeleteTable;
    IndexName := '';
    IndexDefs.Clear;
    CreateTable;
    Open;
  end;
  dZaMG := EncodeDate(1917, 11, 7);
  with tblPrp do begin
    //AddIndex('OnPSchMgTn', 'PSch;ZaMesGod;TabN', []);
    IndexName := 'OnPSchMgTn';  // при такой сортировке итоговые записи с
    First;                      // датой 07-11-1917 будут вылазить вперед и не
    //nSvNR := 0;                 // будут попадатьс€ при сборе итогов
    while not Eof do begin
      cPSch := FieldByName('PSch').AsString;
      nSmForPF    := 0;
      nSmToPfCmn  := 0;
      nSmToPfInv  := 0;
      nSmSvPrgPf  := 0;
      nSmForSsTvp := 0;
      nSmToSsTvp  := 0;
      nSmSvPrgTvp := 0;
      nSmForSsNv  := 0;
      nSmToSsNv   := 0;
      nSmSvPrgNv  := 0;
      nSmForFz    := 0;
      nSmToFz     := 0;
      nSmSvPrgFz  := 0;
      while (FieldByName('PSch').AsString = cPSch) and not Eof do begin
        nSmForPF    := nSmForPF    + FieldByName('SmForPF').AsFloat;
        nSmToPfCmn  := nSmToPfCmn  + FieldByName('SmToPfCmn').AsFloat;
        nSmToPfInv  := nSmToPfInv  + FieldByName('SmToPfInv').AsFloat;
        nSmSvPrgPf  := nSmSvPrgPf  + FieldByName('SmSvPrgPf').AsFloat;
        nSmForSsTvp := nSmForSsTvp + FieldByName('SmForSsTvp').AsFloat;
        nSmToSsTvp  := nSmToSsTvp  + FieldByName('SmToSsTvp').AsFloat;
        nSmSvPrgTvp := nSmSvPrgTvp + FieldByName('SmSvPrgTvp').AsFloat;
        nSmForSsNv  := nSmForSsNv  + FieldByName('SmForSsNv').AsFloat;
        nSmToSsNv   := nSmToSsNv   + FieldByName('SmToSsNv').AsFloat;
        nSmSvPrgNv  := nSmSvPrgNv  + FieldByName('SmSvPrgNv').AsFloat;
        nSmForFz    := nSmForFz    + FieldByName('SmForFz').AsFloat;
        nSmToFz     := nSmToFz     + FieldByName('SmToFz').AsFloat;
        nSmSvPrgFz  := nSmSvPrgFz  + FieldByName('SmSvPrgFz').AsFloat;
        Next;
      end;
      bIsPPS := false;
      bIsInv := false;
      bIsPens := false;
      AddInfToTblPrpTt(0, dZaMG, cPSch, '',
                            nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                            nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                            nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                            nSmForFz, nSmToFz, nSmSvPrgFz,
                            bIsPPS, bIsInv, bIsPens);
    end;
  end;
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
    if Prepared then Unprepare;
  end;
  with tblPrpTt do begin
    First;
    while not Eof do begin
      AddInfToTblPrp(0, FieldByName('ZaMesGod').AsDateTime,
                        FieldByName('PSch').AsString, '',
                        FieldByName('SmForPF').AsFloat,
                        FieldByName('SmToPfCmn').AsFloat,
                        FieldByName('SmToPfInv').AsFloat,
                        FieldByName('SmSvPrgPf').AsFloat,
                        FieldByName('SmForSsTvp').AsFloat,
                        FieldByName('SmToSsTvp').AsFloat,
                        FieldByName('SmSvPrgTvp').AsFloat,
                        FieldByName('SmForSsNv').AsFloat,
                        FieldByName('SmToSsNv').AsFloat,
                        FieldByName('SmSvPrgNv').AsFloat,
                        FieldByName('SmForFz').AsFloat,
                        FieldByName('SmToFz').AsFloat,
                        FieldByName('SmSvPrgFz').AsFloat,
                        false, false, false);
      Next;
    end;
  end;
  //tblPrp.IndexName := 'OnTnPSchMg';
  with tblPrp do begin
    Close;
    Open;
    First;
    SetPrpSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.AddInfToTblPrpTt(nTabN : integer; dZaMG : TDateTime;
                                  cPSch, cFamIO : ShortString;
                                  nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                                  nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                                  nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                                  nSmForFz, nSmToFz, nSmSvPrgFz : double;
                                  bIsPPS, bIsInv, bIsPens : boolean);
begin
  with tblPrpTt do begin
    if not Locate('TabN;ZaMesGod;PSch',VarArrayOf([nTabN, dZaMG, cPSch]),
                                                                []) then begin
      Append;
      FieldByName('TabN').AsInteger := nTabN;
      FieldByName('PSch').AsString  := cPSch;
      FieldByName('FamIO').AsString := cFamIO;
      if bIsPPS then
        FieldByName('IsPPS').AsBoolean := true;
      if bIsInv then
        FieldByName('IsInv').AsBoolean := true;
      if bIsPens then
        FieldByName('IsPens').AsBoolean := true;
      FieldByName('ZaMesGod').AsDateTime := dZaMG; end
    else
      Edit;
    FieldByName('SmForPF').AsFloat    :=
                               FieldByName('SmForPF').AsFloat    + nSmForPF;
    FieldByName('SmToPfCmn').AsFloat  :=
                               FieldByName('SmToPfCmn').AsFloat  + nSmToPfCmn;
    FieldByName('SmToPfInv').AsFloat  :=
                               FieldByName('SmToPfInv').AsFloat  + nSmToPfInv;
    FieldByName('SmSvPrgPf').AsFloat  :=
                               FieldByName('SmSvPrgPf').AsFloat  + nSmSvPrgPf;
    FieldByName('SmForSsTvp').AsFloat :=
                               FieldByName('SmForSsTvp').AsFloat + nSmForSsTvp;
    FieldByName('SmToSsTvp').AsFloat  :=
                               FieldByName('SmToSsTvp').AsFloat  + nSmToSsTvp;
    FieldByName('SmSvPrgTvp').AsFloat :=
                               FieldByName('SmSvPrgTvp').AsFloat + nSmSvPrgTvp;
    FieldByName('SmForSsNv').AsFloat  :=
                               FieldByName('SmForSsNv').AsFloat  + nSmForSsNv;
    FieldByName('SmToSsNv').AsFloat   :=
                               FieldByName('SmToSsNv').AsFloat   + nSmToSsNv;
    FieldByName('SmSvPrgNv').AsFloat  :=
                               FieldByName('SmSvPrgNv').AsFloat  + nSmSvPrgNv;
    FieldByName('SmForFz').AsFloat    :=
                               FieldByName('SmForFz').AsFloat    + nSmForFz;
    FieldByName('SmToFz').AsFloat     :=
                               FieldByName('SmToFz').AsFloat     + nSmToFz;
    FieldByName('SmSvPrgFz').AsFloat  :=
                               FieldByName('SmSvPrgFz').AsFloat  + nSmSvPrgFz;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.AddInfTotblPrp(nTabN : integer; dZaMG : TDateTime;
                                  cPSch, cFamIO : ShortString;
                                  nSmForPF, nSmToPfCmn, nSmToPfInv, nSmSvPrgPf,
                                  nSmForSsTvp, nSmToSsTvp, nSmSvPrgTvp,
                                  nSmForSsNv, nSmToSsNv, nSmSvPrgNv,
                                  nSmForFz, nSmToFz, nSmSvPrgFz : double;
                                  bIsPPS, bIsInv, bIsPens : boolean);
begin
  with tblPrp do begin
    if not Locate('TabN;ZaMesGod;PSch', VarArrayOf([nTabN, dZaMG, cPSch]),
                                                                []) then begin
      Append;
      FieldByName('TabN').AsInteger := nTabN;
      FieldByName('PSch').AsString  := cPSch;
      FieldByName('FamIO').AsString := cFamIO;
      if bIsPPS then
        FieldByName('IsPPS').AsBoolean := true;
      if bIsInv then
        FieldByName('IsInv').AsBoolean := true;
      if bIsPens then
        FieldByName('IsPens').AsBoolean := true;
      FieldByName('ZaMesGod').AsDateTime := dZaMG; end
    else
      Edit;
    FieldByName('SmForPF').AsFloat    := FieldByName('SmForPF').AsFloat    + nSmForPF;
    FieldByName('SmToPfCmn').AsFloat  := FieldByName('SmToPfCmn').AsFloat  + nSmToPfCmn;
    FieldByName('SmToPfInv').AsFloat  := FieldByName('SmToPfInv').AsFloat  + nSmToPfInv;
    FieldByName('SmSvPrgPf').AsFloat  := FieldByName('SmSvPrgPf').AsFloat  + nSmSvPrgPf;
    FieldByName('SmForSsTvp').AsFloat := FieldByName('SmForSsTvp').AsFloat + nSmForSsTvp;
    FieldByName('SmToSsTvp').AsFloat  := FieldByName('SmToSsTvp').AsFloat  + nSmToSsTvp;
    FieldByName('SmSvPrgTvp').AsFloat := FieldByName('SmSvPrgTvp').AsFloat + nSmSvPrgTvp;
    FieldByName('SmForSsNv').AsFloat  := FieldByName('SmForSsNv').AsFloat  + nSmForSsNv;
    FieldByName('SmToSsNv').AsFloat   := FieldByName('SmToSsNv').AsFloat   + nSmToSsNv;
    FieldByName('SmSvPrgNv').AsFloat  := FieldByName('SmSvPrgNv').AsFloat  + nSmSvPrgNv;
    FieldByName('SmForFz').AsFloat    := FieldByName('SmForFz').AsFloat    + nSmForFz;
    FieldByName('SmToFz').AsFloat     := FieldByName('SmToFz').AsFloat     + nSmToFz;
    FieldByName('SmSvPrgFz').AsFloat  := FieldByName('SmSvPrgFz').AsFloat  + nSmSvPrgFz;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.SetPrpSortMode;
begin
  if popSortTabNPSchZaMG.Checked then
    tblPrp.IndexName := 'OnTnPSchMg'
  else
    tblPrp.IndexName := 'OnTnMgPSch';
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.popSortTabNPSchZaMGClick(Sender: TObject);
begin
  if not popSortTabNPSchZaMG.Checked then begin
    popSortTabNPSchZaMG.Checked := true;
    popSortTabNZaMGPSch.Checked := false;
    SetPrpSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.popSortTabNZaMGPSchClick(Sender: TObject);
begin
  if not popSortTabNZaMGPSch.Checked then begin
    popSortTabNZaMGPSch.Checked := true;
    popSortTabNPSchZaMG.Checked := false;
    SetPrpSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.popFilterOnlySvPorogiClick(Sender: TObject);
begin
  popFilterOnlySvPorogi.Checked := not popFilterOnlySvPorogi.Checked;
  if popFilterOnlySvPorogi.Checked then begin
    tblPrp.Filter := '((SmSvPrgPf > 0) or (SmSvPrgTvp > 0) or (SmSvPrgFz > 0))';
    tblPrp.Filtered := true; end
  else begin
    tblPrp.Filter := '';
    tblPrp.Filtered := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckPrp.bBtnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
