unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDataMod = class(TDataModule)
    TblSrc: TTable;
    TblDst: TTable;
    Database: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod: TDataMod;

implementation

{$R *.dfm}

end.
