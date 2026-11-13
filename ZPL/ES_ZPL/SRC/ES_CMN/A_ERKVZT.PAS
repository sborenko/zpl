unit A_ERkvzt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Db, DBTables, IniFiles, ExtCtrls, Mask,
  DBCtrls;

type
  TFormEARkvzt = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeDtBeg: TDBEdit;
    dbeNmKoop: TDBEdit;
    dbeAdres: TDBEdit;
    dbeNmPred: TDBEdit;
    dbeNmBuh: TDBEdit;
    dbeDolgnPred: TDBEdit;
    dbeDolgnBuh: TDBEdit;
    Bevel1: TBevel;
    tblRkvzt: TTable;
    dsrcRkvzt: TDataSource;
    tblRkvztNR: TAutoIncField;
    tblRkvztKDWHO: TSmallintField;
    tblRkvztDTBEG: TDateField;
    tblRkvztNMKOOP: TStringField;
    tblRkvztADRES: TStringField;
    tblRkvztNMPRED: TStringField;
    tblRkvztNMBUH: TStringField;
    tblRkvztDOLGNPRED: TStringField;
    tblRkvztDOLGNBUH: TStringField;
    qryTmp: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    n_NR, n_KdWho : integer;
    bEditMode, b_FirstRecord : boolean;
    procedure CreOpenTblRkvzt;
    function ValidDtBeg(cDtBeg : string) : boolean;
    procedure SaveAddRkvzt;
    procedure SaveEdtRkvzt;
  public
    { Public declarations }
  end;

function AddRkvzt(var nNwNR, nKdWho : integer;
                 bFirstRecord : boolean; qryRkvzt : TQuery) : boolean;
function EdtRkvzt(qryRkvzt : TQuery) : boolean;


const SECTION = 'A_ERkvzt';

var
  FormEARkvzt: TFormEARkvzt;

implementation

uses A_Const, A_DM, A_Lib;

{$R *.DFM}

//--------------------------------------------------------------------
function AddRkvzt(var nNwNR, nKdWho : integer;
                 bFirstRecord : boolean; qryRkvzt : TQuery) : boolean;
// Добавить в RKVZT запись с изменениями в реквизитах предпр.
// с датой изменений - DtBeg (должна быть уникальной)
var nSvNR : integer;
begin
  Result := false;
  FormEARkvzt :=  TFormEARkvzt.Create(Application);
  with FormEARkvzt do begin
    n_NR := 0;
    n_KdWho := nKdWho;
    b_FirstRecord := bFirstRecord;
    bEditMode := false;
    CreOpenTblRkvzt;
    tblRkvzt.Append;
    if not b_FirstRecord then with qryRkvzt do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      Last;
      tblRkvzt.FieldByName('KdWho').asString :=
                                       FieldByName('KdWho').asString;
      tblRkvzt.FieldByName('DtBeg').asDateTime := Date;
      tblRkvzt.FieldByName('NmKoop').asString :=
                                      FieldByName('NmKoop').asString;
      tblRkvzt.FieldByName('Adres').asString :=
                                       FieldByName('Adres').asString;
      tblRkvzt.FieldByName('NmPred').asString :=
                                      FieldByName('NmPred').asString;
      tblRkvzt.FieldByName('NmBuh').asString :=
                                       FieldByName('NmBuh').asString;
      tblRkvzt.FieldByName('DolgnPred').asString :=
                                   FieldByName('DolgnPred').asString;
      tblRkvzt.FieldByName('DolgnBuh').asString :=
                                    FieldByName('DolgnBuh').asString;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    Caption := 'Новая запись';
    if ShowModal = mrOk then begin
      nNwNR := n_NR;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
function EdtRkvzt(qryRkvzt : TQuery) : boolean;
begin
  Result := false;
  FormEARkvzt :=  TFormEARkvzt.Create(Application);
  with FormEARkvzt do begin
    bEditMode := true;
    n_NR := qryRkvzt.FieldByName('NR').asInteger;
    CreOpenTblRkvzt;
    with tblRkvzt do begin
      Append;
      FieldByName('KdWho').asString :=
                              qryRkvzt.FieldByName('KdWho').asString;
      FieldByName('DtBeg').asString :=
                              qryRkvzt.FieldByName('DtBeg').asString;
      FieldByName('NmKoop').asString :=
                             qryRkvzt.FieldByName('NmKoop').asString;
      FieldByName('Adres').asString :=
                              qryRkvzt.FieldByName('Adres').asString;
      FieldByName('NmPred').asString :=
                             qryRkvzt.FieldByName('NmPred').asString;
      FieldByName('NmBuh').asString :=
                              qryRkvzt.FieldByName('NmBuh').asString;
      FieldByName('DolgnPred').asString :=
                          qryRkvzt.FieldByName('DolgnPred').asString;
      FieldByName('DolgnBuh').asString :=
                           qryRkvzt.FieldByName('DolgnBuh').asString;
    end;
    Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEARkvzt.CreOpenTblRkvzt;
begin
  with tblRkvzt do begin
    if Active then Close;
    DataBaseName := cDirInd;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;
end;
//--------------------------------------------------------------------
function TFormEARkvzt.ValidDtBeg(cDtBeg : string) : boolean;
begin
  Result := true;
  if MyEmptyDate(cDtBeg) then begin
    ShowMessage('Дата не должна быть пустой');
    Result := False; end
  else if bEditMode then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from RKVZT where (DtBeg = :dDtBeg) and ' +
                  ' (NR <> :nNR)');
    ParamByName('dDtBeg').asDateTime := StrToDate(cDtBeg);
    ParamByName('nNR').asInteger := n_NR;
    Open;
    if RecordCount <> 0 then begin
      ShowMessage('В таблице уже есть другая запись с датой ' + cDtBeg);
      Result := False;
    end;
    Close;
    SQL.Clear;
    DataBaseName := ''; end
  else with qryTmp do begin  // если добавление записи
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from RKVZT where DtBeg = :dDtBeg');
    ParamByName('dDtBeg').asDateTime:= StrToDate(cDtBeg);
    Open;
    if RecordCount <> 0 then begin
      ShowMessage('В таблице уже есть запись с датой ' + cDtBeg);
      Result := False;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//--------------------------------------------------------------------
procedure TFormEARkvzt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEARkvzt.SaveAddRkvzt;
begin
  n_KdWho := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into RKVZT (DtBeg, KdWho, NmKoop, Adres, ' +
            ' NmPred, NmBuh, DolgnPred, DolgnBuh)');
    SQL.Add(' values (:dDtBeg, :nKdWho, :cNmKoop, :cAdres, ' +
            ' :cNmPred, :cNmBuh, :cDolgnPred, :cDolgnBuh)');
    ParamByName('dDtBeg').asDateTime:=
                            tblRkvzt.FieldByName('DtBeg').asDateTime;
    ParamByName('nKdWho').asSmallInt := n_KdWho;
    ParamByName('cNmKoop').asString :=
                             tblRkvzt.FieldByName('NmKoop').asString;
    ParamByName('cAdres').asString :=
                              tblRkvzt.FieldByName('Adres').asString;
    ParamByName('cNmPred').asString :=
                             tblRkvzt.FieldByName('NmPred').asString;
    ParamByName('cNmBuh').asString :=
                              tblRkvzt.FieldByName('NmBuh').asString;
    ParamByName('cDolgnPred').asString :=
                          tblRkvzt.FieldByName('DolgnPred').asString;
    ParamByName('cDolgnBuh').asString :=
                            tblRkvzt.FieldByName('DolgnBuh').asString;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//--------------------------------------------------------------------
procedure TFormEARkvzt.SaveEdtRkvzt;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Update RKVZT set DtBeg = :dDtBeg, NmKoop = :cNmKoop, ' +
            ' Adres = :cAdres, NmPred = :cNmPred, NmBuh = :cNmBuh, ' +
            ' DolgnPred = :cDolgnPred, DolgnBuh = :cDolgnBuh ' +
            ' where NR = :nNR');
    ParamByName('dDtBeg').asDateTime:=
                            tblRkvzt.FieldByName('DtBeg').asDateTime;
    ParamByName('cNmKoop').asString :=
                             tblRkvzt.FieldByName('NmKoop').asString;
    ParamByName('cAdres').asString :=
                              tblRkvzt.FieldByName('Adres').asString;
    ParamByName('cNmPred').asString :=
                             tblRkvzt.FieldByName('NmPred').asString;
    ParamByName('cNmBuh').asString :=
                              tblRkvzt.FieldByName('NmBuh').asString;
    ParamByName('cDolgnPred').asString :=
                          tblRkvzt.FieldByName('DolgnPred').asString;
    ParamByName('cDolgnBuh').asString :=
                            tblRkvzt.FieldByName('DolgnBuh').asString;
    ParamByName('nNR').asInteger := n_NR;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//--------------------------------------------------------------------
procedure TFormEARkvzt.FormCloseQuery(Sender: TObject;
                                               var CanClose: Boolean);
begin
  if (ModalResult = mrOk) then begin
    if (not bEditMode and
         not ValidDtBeg(tblRkvzt.FieldByName('DtBeg').asString)) or
       (bEditMode and
         not ValidDtBeg(tblRkvzt.FieldByName('DtBeg').asString))
                                                           then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeDtBeg.SetFocus; end
    else if (tblRkvzt.FieldByName('NmKoop').asString = '') or
               (tblRkvzt.FieldByName('DolgnPred').asString = '') or
                 (tblRkvzt.FieldByName('NmPred').asString = '') or
                   (tblRkvzt.FieldByName('DolgnBuh').asString = '') or
                     (tblRkvzt.FieldByName('NmBuh').asString = '')
                                                           then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeNmKoop.SetFocus; end
    else if bEditMode then
      SaveEdtRkvzt
    else
      SaveAddRkvzt;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEARkvzt.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
  with tblRkvzt do begin
    if Active then Close;
    if Exists then DeleteTable;
  end;
end;

end.
