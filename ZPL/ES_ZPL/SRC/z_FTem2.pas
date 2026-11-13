unit z_FTem2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, ExtCtrls, Grids, DBGrids, DBClient, DBTables, StdCtrls,
  Buttons;

type
  TFormFTem2 = class(TForm)
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    qryTmp: TQuery;
    cdsGrp: TClientDataSet;
    cdsPgr: TClientDataSet;
    dsrcGrp: TDataSource;
    dbgrGrp: TDBGrid;
    Splitter1: TSplitter;
    cdsPgrPgr: TSmallintField;
    cdsPgrNmPgr: TStringField;
    cdsPgrKdTemuPgr: TSmallintField;
    dsrcPgr: TDataSource;
    dbgrPgr: TDBGrid;
    cdsGrpGrp: TSmallintField;
    cdsGrpNmGrp: TStringField;
    cdsGrpKdTemuGrp: TSmallintField;
    cdsPgrGrp: TSmallintField;
    cdsPgrNmGrp: TStringField;
    cdsPgrKdTemuGrp: TSmallintField;
    LabelMsg: TLabel;
    procedure dbgrGrpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrPgrDblClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
    procedure dbgrGrpEnter(Sender: TObject);
    procedure dbgrGrpExit(Sender: TObject);
  private
    { Private declarations }
    qry_Fi : TQuery;
    n_KdTemuGrp, n_KdTemuPgr :SmallInt;
    procedure CreOpenCdsGrp;
    procedure CreOpenCdsPgr;
   public
    { Public declarations }
  end;

const SECTION = 'z_FTem2';

function ZFiTem2(qryFI : TQuery; var nKdTemuGrp, nKdTemuPgr :SmallInt) :boolean;


(*
Select t2.Grp, t2.NmSch NmGrp,t2.KdTemu KdTemuGrp,
        t.Grp PGR, t.NmSch NmPGR, t.KdTemu KodTemuPgr
 from Kd_Temu t
  Left outer Join Kd_Temu t2 on t2.Grp = t.Grp-1
where t.NmSch containing 'ХД 1'
order by t.Grp
 *)
var
  FormFTem2: TFormFTem2;

implementation

uses A_Const, Z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function ZFiTem2(qryFI : TQuery; var nKdTemuGrp, nKdTemuPgr :SmallInt) :boolean;
begin
  Result := false;
  FormFTem2 := TFormFTem2.Create(Application);
  with FormFTem2 do begin
    qry_Fi := qryFi;
    n_KdTemuGrp := nKdTemuGrp;
    n_KdTemuPgr := nKdTemuPgr;
    CreOpenCdsGrp;
    CreOpenCdsPgr;
    bBtnOk.Enabled := cdsGrp.RecordCount > 0;
    if ShowModal = mrOk then begin
      nKdTemuGrp := cdsPgrKdTemuGrp.AsInteger;
      nKdTemuPgr := cdsPgrKdTemuPgr.AsInteger;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.bBtnOkClick(Sender: TObject);
begin
; if cdsPgr.RecordCount = 0 then begin
    ModalResult := mrNone;
    dbgrPgr.SetFocus; end
  else begin
    n_KdTemuGrp := cdsPgrKdTemuGrp.AsInteger;
    n_KdTemuPgr := cdsPgrKdTemuPgr.AsInteger;
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.dbgrPgrDblClick(Sender: TObject);
begin
; if cdsPgr.RecordCount > 0 then begin
    n_KdTemuGrp := cdsPgrKdTemuGrp.AsInteger;
    n_KdTemuPgr := cdsPgrKdTemuPgr.AsInteger;
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.CreOpenCdsGrp;
begin
  with cdsGrp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    with qry_Fi do begin
      First;
      while not Eof do begin
        if not cdsGrp.Locate('Grp', FieldByName('Grp').AsInteger, []) then
          cdsGrp.AppendRecord([FieldByName('Grp').AsInteger,
                                 FieldByName('NmGrp').AsString,
                                   FieldByName('KdTemuGrp').AsInteger]);
        Next;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.CreOpenCdsPgr;
var cMsg : ShortString; nCntRec : SmallInt;
begin
  with cdsPgr do begin
    if Active then Close;
    CreateDataSet;
    Open;
    with qry_Fi do begin
      nCntRec := RecordCount;
      First;
      while not Eof do begin
        cdsPgr.AppendRecord([FieldByName('Grp').AsInteger,
                                 FieldByName('NmGrp').AsString,
                                   FieldByName('KdTemuGrp').AsInteger,
                             FieldByName('Pgr').AsInteger,
                                 FieldByName('NmPgr').AsString,
                                   FieldByName('KdTemuPgr').AsInteger]);
        Next;
      end;
    end;
    cMsg := 'Найдено записей ' + IntToStr(nCntRec) + '. Выберите одну из ' +
            'них' + #10 + '(Кнопка "Выбор" или двойной щелчок иышкой)';
    LabelMsg.Caption := cMsg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.dbgrGrpDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var nMod : double; nGrp : SmallInt;
begin
  nGrp := cdsGrpGRP.AsInteger;
  nMod := nGrp mod 10;
  with dbgrGrp.Canvas do begin
    if not (gdFocused in State) then begin
     if nMod = 2 then
        Brush.Color := clSilver;   //clBtnFace;
    end;
  end;
  dbgrGrp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
   Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 500);
    dbgrGrp.Height := ReadInteger(SECTION, 'dbgrGrpH', 175);
    Free;
  end;
  if FileExists(cDirVids + 'TmGrp_01.vid') then
    dbgrGrp.Columns.LoadFromFile(cDirVids + 'TmGrp_01.vid');
  if FileExists(cDirVids + 'TmPgr_01.vid') then
    dbgrPgr.Columns.LoadFromFile(cDirVids + 'TmPgr_01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrGrp.Columns.SaveToFile(cDirVids + 'TmGrp_01.vid');
  dbgrPgr.Columns.SaveToFile(cDirVids + 'TmPgr_01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'dbgrGrpH', dbgrGrp.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.dbgrGrpEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow; ;
end;
//------------------------------------------------------------------------------
procedure TFormFTem2.dbgrGrpExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace; ;
end;

end.
