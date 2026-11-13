unit A_KliFnd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db,
  DBTables, IniFiles;

type
  TFormFindKli = class(TForm)
    qryFind: TQuery;
    dsrcFind: TDataSource;
    dbgrFind: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    bBtnOK: TBitBtn;
    qryFindNR: TIntegerField;
    qryFindKDWHO: TSmallintField;
    qryFindKDIF: TSmallintField;
    qryFindNMWHO: TStringField;
    qryFindPRWHO: TSmallintField;
    qryFindKDSBU: TSmallintField;
    qryFindNOTES: TStringField;
    qryFindNMWHOE: TStringField;
    qryFindSHFR: TStringField;
    qryFindKDVALPDR: TSmallintField;
    qryFindOLD_KPR: TSmallintField;
    qryFindOLD_KOBJ: TSmallintField;
    qryFindORGMNE: TStringField;
    qryFindOKPO: TStringField;
    qryFindADRES: TStringField;
    qryFindPA: TSmallintField;
    qryFindNR_GORD: TStringField;
    qryFindNM_GORD: TStringField;
    qryFindLDTOPER: TDateTimeField;
    procedure dbgrFindDblClick(Sender: TObject);
    procedure dbgrFindKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbgrFindDrawColumnCell(Sender: TObject;
                                           const Rect: TRect; DataCol: Integer;
                                       Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    d_DtGlub : TDateTime;
  public
    { Public declarations }
  end;

function FindKli(cFindMsg : string; var nKdKli : integer) : boolean;
function FindWhoAll(cFindMsg : string; var nKdWho : integer;
                                                dDtGlub : TDateTime) : boolean;

const SECTION = 'a_KliFnd';

var
  FormFindKli: TFormFindKli;

implementation

uses A_Const, A_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
function FindWhoAll(cFindMsg : string; var nKdWho : integer;
                                                dDtGlub : TDateTime) : boolean;
var cSvFindMsg : string;
begin
  Result := false;
  FormFindKli := TFormFindKli.Create(Application);
  with FormFindKli do begin
    d_DtGlub := dDtGlub;
    cSvFindMsg := cFindMsg;
    cFindMsg := AnsiUpperCase(cFindMsg);
    qryFind.Close;
    qryFind.SQL.Clear;
    qryFind.Params.Clear;
    qryFind.DataBaseName := CESMAIN;
    qryFind.SQL.Add('Select * from kd_Who where  (kdWho > 0) ' +
                    'and (upper(NmWho) containing :cFindMsg)' +
                    ' order by PrWho, NmWho');
    qryFind.Params.ParamByName('cFindMsg').asString := cFindMsg;
    qryFind.Open;
    if qryFind.RecordCount = 0 then
      MessageDlg('Не найдено записей с подстрокой ' + cSvFindMsg,
                                         mtInformation, [mbOk], 0)
    else begin
      if ShowModal = mrOk then begin
        Result := true;
        nKdWho := qryFind.FieldByName('KdWho').asInteger;
      end;
    end;
    qryFind.Close;
    Free;
  end;
end;
//----------------------------------------------------------------
function FindKli(cFindMsg : string; var nKdKli : integer) : boolean;
var cSvFindMsg : string;
begin
  Result := false;
  FormFindKli := TFormFindKli.Create(Application);
  with FormFindKli do begin
    cSvFindMsg := cFindMsg;
    cFindMsg := AnsiUpperCase(cFindMsg);
    qryFind.Close;
    qryFind.SQL.Clear;
    qryFind.Params.Clear;
    qryFind.DataBaseName := CESMAIN; 
    qryFind.SQL.Add('Select * from kd_Who where (kdWho > 5000) ' +
                    ' and (upper(NmWho) containing :cFindMsg)' +
                    ' order by PrWho, NmWho');
    qryFind.Params.ParamByName('cFindMsg').asString := cFindMsg;
    qryFind.Open;
    if qryFind.RecordCount = 0 then
      MessageDlg('Не найдено записей с подстрокой ' + cSvFindMsg,
                                         mtInformation, [mbOk], 0)
    else begin
      if ShowModal = mrOk then begin
        Result := true;
        nKdKli := qryFind.FieldByName('KdWho').asInteger;
      end;
    end;
    qryFind.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindKli.dbgrFindDblClick(Sender: TObject);
begin
  if dsrcFind.DataSet.
                  FieldByName('LDTOPER').AsDateTime < d_DtGlub then
    ShowMessage('Последняя дата операции этого клиента находится за порогом' +
                ' "глубины" выборки.')
  else
    ModalResult := mrOK;
end;

procedure TFormFindKli.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and (dsrcFind.DataSet.
                  FieldByName('LDTOPER').AsDateTime < d_DtGlub) then begin
    ShowMessage('Последняя дата операции этого клиента находится за порогом' +
                ' "глубины" выборки.');
    ModalResult := mrNone;
    CanClose := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindKli.dbgrFindKeyDown(Sender: TObject;
                                             var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_RETURN) then
    modalResult := mrOK;
end;
//------------------------------------------------------------------------------
procedure TFormFindKli.dbgrFindDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrFind.Canvas do begin
    if not (gdFocused in State) then begin
      if (dsrcFind.DataSet.
                    FieldByName('PA').AsInteger >= 1) then
        Brush.Color := clBtnFace
//      else
//        Font.Color := clWindowText;
    end;
    if (dsrcFind.DataSet.
                  FieldByName('LDTOPER').AsDateTime >= d_DtGlub) then
      Font.Style := [fsBold]
    else
      Font.Style := [];
  end;
  dbgrFind.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormFindKli.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 151);
	  Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 350);
	  Free;
  end;
  if FileExists(cDirVids + 'KliFind1.vid') then
    dbgrFind.Columns.LoadFromFile(cDirVids + 'KliFind1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFindKli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
	  Free;
  end;
  dbgrFind.Columns.SaveToFile(cDirVids + 'KliFind1.vid');
end;

end.
