unit z_BlnPrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, Grids, DBGrids, DBTables,
  ExtCtrls;

type
  TFormShPredBln = class(TForm)
    qryVBln: TQuery;
    dsrcVBln: TDataSource;
    dbgrVBln: TDBGrid;
    qryVBlnNR: TIntegerField;
    qryVBlnKDSPS: TSmallintField;
    qryVBlnDTPROC: TDateTimeField;
    qryVBlnTABN: TIntegerField;
    qryVBlnALGRASCH: TSmallintField;
    qryVBlnNCHBUDMES: TStringField;
    qryVBlnNRLIST: TStringField;
    qryVBlnDTLIST: TDateTimeField;
    qryVBlnDTBEG: TDateTimeField;
    qryVBlnDTEND: TDateTimeField;
    qryVBlnCNTDAYS: TSmallintField;
    qryVBlnVIDN: TStringField;
    qryVBlnDAY5FIRST: TStringField;
    qryVBlnOLDKDVIDN: TSmallintField;
    qryVBlnCNTCHAS: TFloatField;
    qryVBlnPROCOPL: TFloatField;
    qryVBlnKDOBJ: TSmallintField;
    qryVBlnKDKATP: TSmallintField;
    qryVBlnKDSPZ: TSmallintField;
    qryVBlnNOTES: TStringField;
    qryVBlnSMSRDN: TFloatField;
    qryVBlnSMBLN: TFloatField;
    qryVBlnSPEC_NR: TIntegerField;
    qryVBlnLISTCONT: TStringField;
    qryVBlnPREDSPEC_NR: TIntegerField;
    qryVBlnShVidN: TStringField;
    Splitter1: TSplitter;
    qryRBln: TQuery;
    dsrcRBln: TDataSource;
    qryRBlnNR: TIntegerField;
    qryRBlnTABN: TIntegerField;
    qryRBlnKDSPS: TSmallintField;
    qryRBlnSPEC_NR: TIntegerField;
    qryRBlnZAMESGOD: TDateTimeField;
    qryRBlnSMZARABOTKA: TFloatField;
    qryRBlnKOEFZP: TFloatField;
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbgrRBln: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    qryVBlnBlnCont: TStringField;
    qryRBlnCNTDAYS: TFloatField;
    qryVBlnSERLIST: TStringField;
    qryVBlnSTGCMN: TFloatField;
    qryVBlnSTG12: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrVBlnDblClick(Sender: TObject);
    procedure qryVBlnCalcFields(DataSet: TDataSet);
    procedure dbgrVBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure OpenQueries(nTabN : integer; dNewDtBeg : TDateTime);
  public
    { Public declarations }
  end;

function GetPredList(nTabN: integer; dNewDtBeg: TDateTime;
  var nPredSpecNR: integer): boolean;

const SECTION = 'z_BlnPrd';

var
  FormShPredBln: TFormShPredBln;

implementation

uses A_Const, a_DM, z_DM, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetPredList(
  nTabN: integer; dNewDtBeg: TDateTime;
  var nPredSpecNR: integer): boolean;
begin
  FormShPredBln := TFormShPredBln.Create(Application);
  Result := false;

  with FormShPredBln do begin
    OpenQueries(nTabN, dNewDtBeg);

    if nPredSpecNR <> 0 then
      qryVBln.Locate('Spec_NR', nPredSpecNR, []);

    if qryVBln.RecordCount = 0 then
      ShowMessage('Ќе найдено больничных листков сотрудника,' + #13#10 +
        'на которые можно было бы сослатьс€')
    else begin
      Caption := 'Ѕольничные листки сотрудника';
      bBtnOk.Enabled := true;

      if ShowModal = mrOk then begin
        if (qryVBln.RecordCount > 0) then begin
          nPredSpecNR := qryVBlnSpec_NR.AsInteger;
          Result := true;
        end;
      end;
    end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShPredBln.OpenQueries(nTabN : integer; dNewDtBeg : TDateTime);
begin
  InitQuery(qryRBln);
  with qryRBln do begin
    DataSource := dsrcVBln;
    SQL.Add('select * from Z_RBln where Spec_NR = :Spec_NR order by ZaMesGod');
  end;

  InitQuery(qryVBln);
  with qryVBln do begin
    SQL.Add(
      'select * from Z_VBln ' +
      'where TabN = :TabN and DtBeg < :NewDtBeg ' +
      'order by DtBeg, NR');
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('NewDtBeg').AsDateTime := dNewDtBeg;
    Open;
    Last;
  end;

  qryRBln.Open;
end;

//------------------------------------------------------------------------------
procedure TFormShPredBln.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 385);
    Width  := ReadInteger(SECTION, 'wW', 550);
    Free;
  end;
  if FileExists(cDirVids + 'dbgrPr0101.vid') then
    dbgrVBln.Columns.LoadFromFile(cDirVids + 'dbgrPr0101.vid');
  if FileExists(cDirVids + 'BlnPrd02.vid') then
    dbgrRBln.Columns.LoadFromFile(cDirVids + 'BlnPrd02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShPredBln.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVBln.Columns.SaveToFile(cDirVids + 'dbgrPr0101.vid');
  dbgrRBln.Columns.SaveToFile(cDirVids + 'BlnPrd02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPredBln.dbgrVBlnDblClick(Sender: TObject);
begin
  if qryVBln.RecordCount > 0 then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormShPredBln.qryVBlnCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  if qryVBlnListCont.AsString = '1' then
    qryVBlnBlnCont.AsString := 'ѕ'
  else
    qryVBlnBlnCont.AsString := '';
  qryVBlnShVidN.AsString := DmMain.VidN2ShVidN(qryVBlnVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormShPredBln.dbgrVBlnDrawColumnCell(Sender: TObject;
                                            const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrVBln.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (cFldNm = 'BLNCONT') then begin
        if (qryVBlnListCont.AsString = '1') then
          Brush.Color := clYellow;
      end;
    end;
  end;
  dbgrVBln.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
