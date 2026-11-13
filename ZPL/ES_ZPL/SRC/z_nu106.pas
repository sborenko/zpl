unit z_nu106;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  string4 = string[4];
  TFormNu106 = class(TForm)
    qry1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    qryUpi106: TQuery;
    dsrcUpi106: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    dbgrUpi106: TDBGrid;
    Splitter2: TSplitter;
    qryKvd106: TQuery;
    dsrcKvd106: TDataSource;
    DBGrid2: TDBGrid;
    qryZNU: TQuery;
    updZNU: TUpdateSQL;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    nCntRecZNU : integer;
    function OldTabN2NewTabN(nTabN : integer) : integer;
    function OldVidN2NewVidN(nVidN : integer) : string4;
    procedure AddRecInZNu(dDtProc, dZaMesGod : TDateTime;
                nTabN, nKdSps, nKdObj, nKdKatP, nOldKdObj, nOldKdVidN : integer;
                cVidN : string4; cPdN, cPrr, cPrPv, cKto, cPrKr,
                                 cDt_Beg, cDt_End, cNotes, cMyNotes : string;
                nChas, nSumma : double);
  public
    { Public declarations }
  end;

procedure updNu106;

var
  FormNu106: TFormNu106;

implementation

uses a_Const, a_Dm, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure updNu106;
begin
  FormNu106 := TFormNu106.Create(Application);
  with FormNu106 do begin
    qry1.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormNu106.OldTabN2NewTabN(nTabN : integer) : integer;
begin
  Result := 0;
  if qryUpi106.Locate('TabN', nTabN, []) then
    Result := qryUpi106.FieldByName('TabN_New').AsInteger;
end;
//------------------------------------------------------------------------------
function TFormNu106.OldVidN2NewVidN(nVidN : integer) : string4;
begin
  Result := '';
  if qryKvd106.Locate('VidN', nVidN, []) then
    Result := qryKvd106.FieldByName('NewVidN').AsString;
end;
//------------------------------------------------------------------------------
procedure TFormNu106.SpeedButton1Click(Sender: TObject);
var dDtProc, dZaMesGod : TDateTime;
    n_TabN, nTabN, nKdSps, nKdObj, nKdKatP, nOldKdObj, nOldKdVidN : integer;
    cVidN : string4;
    nChas, nSumma : double;
    cPdN, cPrr, cPrPv, cKto, cPrKr, cDt_Beg, cDt_End, cNotes, cMyNotes : string;
    cMesGod : string; nY, nM : word;
begin
  if not qryUpi106.Active then
    qryUpi106.Open;
  if not qryKvd106.Active then
    qryKvd106.Open;
  if not qryZNU.Active then
    qryZNU.Open;
  with qry1 do begin
  { qry1:
        Select * from nu_2000
        order by TabN
  }
    if not Active then Open;
    First;
    Form_Dm.DbZpl.StartTransaction;
    nCntRecZNU := 0;
    while not Eof do begin
      if FieldByName('GodN').IsNull or FieldByName('MesN').IsNull or
          FieldByName('TabN').IsNull or
           (FieldByName('GodN').AsInteger < 1995) or
            (FieldByName('MesN').AsInteger < 1) or
             (FieldByName('MesN').AsInteger > 12) then begin
        Next;
        Continue;
      end;
      n_TabN := FieldByName('TabN').AsInteger;
      nTabN := OldTabN2NewTabN(n_TabN);
      while (FieldByName('TabN').AsInteger = n_TabN) and not Eof do begin
        if FieldByName('GodN').IsNull or FieldByName('MesN').IsNull or
            FieldByName('TabN').IsNull or
             (FieldByName('GodN').AsInteger < 1995) or
              (FieldByName('MesN').AsInteger < 1) or
               (FieldByName('MesN').AsInteger > 12) then begin
          Next;
          Continue;
        end;
        cMesGod    := FieldByName('nu0100').AsString;
        nY         := 2000 + StrToInt(Copy(cMesGod,5,2));
        nM         := StrToInt(Copy(cMesGod,3,2));
        dDtProc    := EncodeDate(nY, nM, 1);
        dZaMesGod  := EncodeDate(FieldByName('GodN').AsInteger,
                                            FieldByName('MesN').AsInteger, 1);
        cDt_Beg    := FieldByName('Dt_Beg').AsString;
        cDt_End    := FieldByName('Dt_End').AsString;
        nKdSps     := 2;
        nKdObj     := 4000 + FieldByName('Obj').AsInteger;
        nKdKatP    := FieldByName('Kat').AsInteger;
        nOldKdObj  := FieldByName('Obj').AsInteger;
        nOldKdVidN := FieldByName('VidN').AsInteger;
        cPdN       := FieldByName('PdN').AsString;
        cPrr       := FieldByName('PdN').AsString;
        cPrPv      := FieldByName('PrPv').AsString;
        cKto       := FieldByName('Kto').AsString;
        cPrKr      := FieldByName('PrKr').AsString;
        cNotes     := FieldByName('Otkuda').AsString;
        cMyNotes   := FieldByName('SZatr').AsString;
        cVidN      := OldVidN2NewVidN(FieldByName('VidN').AsInteger);
        nChas      := FieldByName('Chas').AsFloat;
        nSumma     := FieldByName('Summa').AsFloat;
        AddRecInZNu(dDtProc, dZaMesGod,
                     nTabN, nKdSps, nKdObj, nKdKatP, nOldKdObj, nOldKdVidN,
                      cVidN, cPdN, cPrr, cPrPv, cKto, cPrKr, cDt_Beg, cDt_End,
                       cNotes, cMyNotes, nChas, nSumma);
        Next;
      end;
    end;
    if qryZNU.UpdatesPending then
      qryZNU.ApplyUpdates;
    if Form_Dm.DbZpl.InTransaction then
      Form_Dm.DbZpl.Commit;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNu106.AddRecInZNu(dDtProc, dZaMesGod : TDateTime;
                nTabN, nKdSps, nKdObj, nKdKatP, nOldKdObj, nOldKdVidN : integer;
                cVidN : string4; cPdN, cPrr, cPrPv, cKto, cPrKr,
                                 cDt_Beg, cDt_End, cNotes, cMyNotes : string;
                nChas, nSumma : double);
begin
  with qryZNU do begin
    Inc(nCntRecZNU);
    Append;
    FieldByName('DTPROC').AsDateTime   := dDtProc;
    FieldByName('ZAMESGOD').AsDateTime := dZAMESGOD;
    FieldByName('TABN').AsInteger      := nTABN;
    FieldByName('VIDN').AsString       := cVIDN;
    FieldByName('CHAS').AsFloat        := nCHAS;
    FieldByName('SUMMA').AsFloat       := nSUMMA;
    FieldByName('DT_BEG').AsString     := cDT_BEG;
    FieldByName('DT_END').AsString     := cDT_END;
    FieldByName('KDSPS').AsInteger     := nKDSPS;
    FieldByName('KDOBJ').AsInteger     := nKDOBJ;
    FieldByName('KDKATP').AsInteger    := nKDKATP;
    FieldByName('PDN').AsString        := cPDN;
    FieldByName('NOTES').AsString      := cNOTES;
    FieldByName('PRR').AsString        := cPRR;
    FieldByName('PRPV').AsString       := cPRPV;
    FieldByName('KTO').AsString        := cKTO;
    FieldByName('PRKR').AsString       := cPRKR;
    FieldByName('MYNOTES').AsString    := cMYNOTES;
    FieldByName('OLDKDOBJ').AsInteger  := nOLDKDOBJ;
    FieldByName('OLDKDVIDN').AsInteger := nOLDKDVIDN;
    Post;
    if nCntRecZNU >= 1000 then begin
      nCntRecZNU := 0;
      ApplyUpdates;
      Form_Dm.DbZpl.Commit;
      Form_Dm.DbZpl.StartTransaction;
    end;
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormNu106.SpeedButton1Click(Sender: TObject);
var nOldVidN : integer; cNewVidN : string4;
begin
  with qry1 do begin
  { qry1:
        Select o.VidN, kvd.NewVidN, count(o.VidN)
        from otk00_05 o Left outer join kvd106 kvd
                  on kvd.VidN = o.VidN
        group by o.VidN, kvd.NewVidN
  qry2:
      update otkl_106
      set VidN_1 = :cNewVidN
      where VidN = :nOldVidN
  }
    if not Active then Open;
    First;
    while not Eof do begin
      if (not FieldByName('VidN').IsNull and
              (FieldByName('VidN').AsInteger <> 0)) and
                 (not FieldByName('NewVidN').IsNull and
                      (FieldByName('NewVidN').AsString > '')) then begin
        nOldVidN := FieldByName('VidN').AsInteger;
        cNewVidN := FieldByName('NewVidN').AsString;
        qry2.ParamByName('nOldVidN').AsInteger := nOldVidN;
        qry2.ParamByName('cNewVidN').AsString  := cNewVidN;
        qry2.ExecSQL;
      end;
      Next;
    end;
  end;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormNu106.SpeedButton1Click(Sender: TObject);
var nOldTabN, nNewTabN : integer;
begin
  with qry1 do begin
  { qry1:
        select *  from upi_106
        order by TabN
  qry2:
      update otkl_106
      set TabN_1 = :nNewTabN
      where TabN = :nOldTabN
  }
    if not Active then Open;
    First;
    while not Eof do begin
      if (not FieldByName('TabN').isNull and
              (FieldByName('TabN').AsInteger <> 0)) and
                 (not FieldByName('TabN_New').isNull and
                      (FieldByName('TabN_New').AsInteger <> 0)) then begin
        nOldTabN := FieldByName('TabN').AsInteger;
        nNewTabN := FieldByName('TabN_New').AsInteger;
        qry2.ParamByName('nOldTabN').AsInteger := nOldTabN;
        qry2.ParamByName('nNewTabN').AsInteger := nNewTabN;
        qry2.ExecSQL;
      end;
      Next;
    end;
  end;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormNu106.SpeedButton1Click(Sender: TObject);
//var cMesGod : string; nY, nM, nD : word; dZaMesGod : TDateTime;
begin
  with qry1 do begin
  { qry1:
        select GodN, MesN, count( * ) from otkl_106
        group by GodN, MesN

  qry2:
      update otkl_106
      set ZaMesGod = :dZaMesGod
      where GodN = :nGodN and MesN = :nMesN
  }
    if not Active then Open;
    First;
    while not Eof do begin
      if (FieldByName('GodN').AsInteger = 0) or
                    (FieldByName('MesN').AsInteger = 0) or
                       (FieldByName('MesN').AsInteger > 12) then begin
        Next;
        Continue;
      end;
      qry2.ParamByName('nGodN').AsInteger := FieldByName('GodN').AsInteger;
      qry2.ParamByName('nMesN').AsInteger := FieldByName('MesN').AsInteger;
      qry2.ParamByName('dZaMesGod').AsDateTime :=
                                    EncodeDate(FieldByName('GodN').AsInteger,
                                            FieldByName('MesN').AsInteger, 1);
      qry2.ExecSQL;
      Next;
    end;
  end;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormNu106.SpeedButton1Click(Sender: TObject);
var cMesGod : string; nY, nM, nD : word; dDtProc : TDateTime;
begin
  with qry1 do begin
  { qry1:
        select otkl1200, count( * ) from otkl_106
        group by otkl1200

  qry2:
      update otkl_106
      set DtProc = :dDtProc
      where otkl1200 = :cOtkl1200
  }
    if not Active then Open;
    First;
    while not Eof do begin
      cMesGod := Copy(FieldByName('Otkl1200').AsString, 5, 4);
      nY := 2000 + StrToInt(Copy(cMesGod, 3, 2));
      nM := StrToInt(Copy(cMesGod, 1, 2));
      dDtProc := EncodeDate(nY, nM, 1);
      qry2.ParamByName('dDtProc').AsDateTime := dDtProc;
      qry2.ParamByName('cOtkl1200').AsString :=
                                             FieldByName('Otkl1200').AsString;
      qry2.ExecSQL;
      Next;
    end;
  end;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormNu106.SpeedButton1Click(Sender: TObject);
//var nOldTabN, nNewTabN : integer;
begin
  with qry1 do begin
    if not Active then Open;
    First;
    while not Eof do begin
      if (not FieldByName('TabN').isNull and
              (FieldByName('TabN').AsInteger <> 0)) and
                 (not FieldByName('TabN_New').isNull and
                      (FieldByName('TabN_New').AsInteger <> 0)) then begin
        nOldTabN := FieldByName('TabN').AsInteger;
        nNewTabN := FieldByName('TabN_New').AsInteger;
        qry2.ParamByName('nOldTabN').AsInteger := nOldTabN;
        qry2.ParamByName('nNewTabN').AsInteger := nNewTabN;
        qry2.ExecSQL;
      end;
      Next;
    end;
  end;
end;
*)

end.
