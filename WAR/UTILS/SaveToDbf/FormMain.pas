unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB;

type
  TForm1 = class(TForm)
    QrySrc: TQuery;
    TblDest: TTable;
    Database: TDatabase;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  DatabaseName, DsLib, PathLib, QryLib;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with Database do begin
    AliasName := DATABASE_ALIAS;
    Connected := true;
  end;

  QryUtils.InitQuery(QrySrc);

  with QrySrc, SQL do begin
    Add(
      'select ' +
        's.tabn, u.fam, u.ima, u.otch, ' +
        'n.zamesgod, n.vidn, n.dt_beg, n.dt_end, n.summa ' +
      'from z_sps s ' +
        'left join z_nu n on n.tabn = s.tabn and n.dtproc = s.dtproc ' +
        'left join z_upi u on u.tabn = s.tabn ' +
      'where s.dtproc = :DtProc');

    ParamByName('DtProc').AsDateTime := EncodeDate(2023, 9, 1);
    Open;
  end;

  with TblDest do begin
    with PathUtils do
    DatabaseName := GetWorkDir(GetExePath);
    TableName := 'SuspendPmnts.dbf';

    DsUtils.CopyStruct(QrySrc, TblDest, nil);
    CreateTable;

    Open;
  end;

  DsUtils.CopyRowset(QrySrc, TblDest);

  QrySrc.Close;
  TblDest.Close;
end;

end.
