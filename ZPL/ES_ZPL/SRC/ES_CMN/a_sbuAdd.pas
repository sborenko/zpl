unit a_sbuAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBClient;

type
  TFormSbuAdd = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    cdsSch: TClientDataSet;
    dsrcSch: TDataSource;
    dbgrSch: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SbuAdd : boolean;

const SECTION = 'a_SbuAdd';

var
  FormSbuAdd: TFormSbuAdd;

implementation

{$R *.dfm}

function SbuAdd : boolean;
begin
// “ут затевал "массовое" изменение названий тем, но почему-то бросил.
// ј теперь забыл, как € хотел это сделать :-(
  Result := false;
  FormSbuAdd := TFormSbuAdd.Create(Application);
  with FormSbuAdd do begin
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;

end.
