unit a_EVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, IniFiles, DBCtrls, DB;

type
  TFormEKdVal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbedNmValSokr: TDBEdit;
    dbeNmValIm: TDBEdit;
    dbedNmValRod: TDBEdit;
    dbedNmValDat: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddEdtKdVal(dsrcKdVal : TDataSource) : boolean;

const SECTION = 'A_EVal';

var
  FormEKdVal: TFormEKdVal;

implementation

{$R *.DFM}

uses A_Const, A_GtVal;

//--------------------------------------------------------------------
function AddEdtKdVal(dsrcKdVal : TDataSource) : boolean;
begin
  Result := false;
  FormEKdVal := TFormEKdVal.Create(Application);
  with FormEKdVal do begin
    if dsrcKdVal.State = dsInsert then
      Caption := 'Новая валюта'
    else
      Caption := 'Редактирование записи';
    dbedNmValSokr.DataSource := dsrcKdVal;
    dbedNmValSokr.DataSource := dsrcKdVal;
    dbedNmValSokr.DataSource := dsrcKdVal;
    dbedNmValSokr.DataSource := dsrcKdVal;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEKdVal.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
	  Left := ReadInteger(SECTION, 'wL', 200);
	  Top  := ReadInteger(SECTION, 'wT', 200);
	  Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEKdVal.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
	  Free;
  end;
end;

end.
