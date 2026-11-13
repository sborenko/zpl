unit z_rs6;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TDataModule1 = class(TDataModule)
    CdsVidN: TClientDataSet;
    CdsVidNVidN: TStringField;
    CdsVidNKdObj: TIntegerField;
    CdsVidNKdKatP: TIntegerField;
    CdsVidNKdTheme: TIntegerField;
    CdsVidNKdSps: TIntegerField;
    CdsVidNGrp: TIntegerField;
    CdsVidNSovm: TStringField;
    CdsLocks: TClientDataSet;
    CdsVidNId: TIntegerField;
    CdsVidNDtBeg: TDateTimeField;
    CdsVidNDtEnd: TDateTimeField;
  private
    { Private declarations }
  public
//    procedure AddVidN;
//    procedure Add
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
