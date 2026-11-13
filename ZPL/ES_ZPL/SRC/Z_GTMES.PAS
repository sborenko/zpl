unit Z_GtMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons, IniFiles;

type
  TFormVubMes = class(TForm)
    qryNU: TQuery;
    dsrcNU: TDataSource;
    dbgrNU: TDBGrid;
    qryNUDTPROC: TDateTimeField;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryNURusMes: TStringField;
    procedure qryNUCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure OpenQryNU(d_RDate : TDateTime);
  public
    { Public declarations }
  end;

function GetMes(d_RDate : TDateTime; mListMes : TStringList) : boolean;

const SECTION = 'Z_GtMes';

var
  FormVubMes: TFormVubMes;

implementation

uses A_Const, Z_Main, Z_DM, A_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetMes(d_RDate : TDateTime; mListMes : TStringList) : boolean;
var i : integer;
begin
  Result := false;
  FormVubMes := TFormVubMes.Create(Application);
  with FormVubMes do begin
    Caption := 'Выбор месяцев';
    OpenQryNU(d_RDate);
    if qryNU.RecordCount = 0 then
      ShowMessage('Нет месяцев для пересчета')
    else if ShowModal = mrOk then begin
      mListMes.Clear;
      if dbgrNU.SelectedRows.Count > 0 then begin
        with dbgrNU.DataSource.DataSet do begin
          for i := 0 to dbgrNU.SelectedRows.Count - 1 do begin
            GotoBookmark(Pointer(dbgrNU.SelectedRows.Items[i]));
            mListMes.Add(dbgrNU.DataSource.DataSet.
                                           FieldByName('DtProc').AsString);
          end;
        end; end
      else begin
        mListMes.Add(dbgrNU.DataSource.DataSet.FieldByName('DtProc').AsString);
      end;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVubMes.OpenQryNU(d_RDate : TDateTime);
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select distinct DtProc from Z_NU where (DtProc < :d_RDate)');
    ParamByName('d_RDate').AsDateTime := d_RDate;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVubMes.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVubMes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVubMes.qryNUCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryNuDtProc.AsDateTime, nY, nM, nD);
  qryNuRusMes.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
end;

end.
