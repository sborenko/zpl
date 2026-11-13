// Óêðàèíñêèå áóêâû
// ³ ²
// ¿ ¯
// º ª

unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables, ExtCtrls;

type
  TForm1 = class(TForm)
    panelData: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    radioUPI: TRadioButton;
    radioDlzhn: TRadioButton;
    btnStart: TBitBtn;
    Database: TDatabase;
    Query: TQuery;
    UpdateSQL: TUpdateSQL;
    DataSource: TDataSource;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure radioUPIClick(Sender: TObject);
    procedure radioDlzhnClick(Sender: TObject);
  private
    procedure ConvertUPI;
    procedure ConvertDlzhn;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// *** //
procedure TForm1.FormCreate(Sender: TObject);
begin
  radioUPI.Checked := true;
  panelData.Visible := false;
end;

// *** //
Function ReplaceChar(InStr:string;OldChar,NewChar:Char; var counter: Integer):String;
Var
  i: Integer;
  CUR_CHAR: CHAR;
  CUR_CODE,
  OLD_CODE,
  NEW_CODE: INTEGER;
begin
  SetLength(Result,Length(InStr));
  for i := 1 to Length(Instr) do begin
    CUR_CHAR := InStr[i];
    CUR_CODE := Ord(CUR_CHAR);
    OLD_CODE := Ord(OLDCHAR);
    NEW_CODE := Ord(NEWCHAR);
    If CUR_CHAR = OldChar then begin
      Result[i] := Newchar;
      Inc(counter);
    end else
      Result[i] := InStr[i];
  end
end;

// *** //
procedure TForm1.btnStartClick(Sender: TObject);
begin
  if radioUPI.Checked then
    ConvertUPI
  else
    ConvertDlzhn;
end;

// *** //
procedure TForm1.ConvertUPI;
var
  counter: Integer;
begin
  counter := 0;

  with Query do begin
    while not Eof do begin
      Edit;
      FieldByName('FAM').AsString := ReplaceChar(FieldByName('FAM').AsString, 'i', '³', counter);
      FieldByName('IMA').AsString := ReplaceChar(FieldByName('IMA').AsString, 'i', '³', counter);
      FieldByName('OTCH').AsString := ReplaceChar(FieldByName('OTCH').AsString, 'i', '³', counter);
      FieldByName('FAM').AsString := ReplaceChar(FieldByName('FAM').AsString, 'I', '²', counter);
      FieldByName('IMA').AsString := ReplaceChar(FieldByName('IMA').AsString, 'I', '²', counter);
      FieldByName('OTCH').AsString := ReplaceChar(FieldByName('OTCH').AsString, 'I', '²', counter);
      FieldByName('FAM').AsString := ReplaceChar(FieldByName('FAM').AsString, '`', '''', counter);
      FieldByName('IMA').AsString := ReplaceChar(FieldByName('IMA').AsString, '`', '''', counter);
      FieldByName('OTCH').AsString := ReplaceChar(FieldByName('OTCH').AsString, '`', '''', counter);
      FieldByName('FAM').AsString := ReplaceChar(FieldByName('FAM').AsString, '.', ' ', counter);
      FieldByName('IMA').AsString := ReplaceChar(FieldByName('IMA').AsString, '.', ' ', counter);
      FieldByName('OTCH').AsString := ReplaceChar(FieldByName('OTCH').AsString, '.', ' ', counter);
      Post;
      Next;
    end;
  end;

  Query.ApplyUpdates;
  Query.CommitUpdates;

  ShowMessage(IntToStr(counter) + ' chars replaced.');
end;

// *** //
procedure TForm1.ConvertDlzhn;
var
  counter: Integer;
begin
  counter := 0;

  with Query do begin
    while not Eof do begin
      Edit;
      FieldByName('CODE').AsString := ReplaceChar(FieldByName('CODE').AsString, ',', '.', counter);
      FieldByName('NAMEOK').AsString := ReplaceChar(FieldByName('NAMEOK').AsString, 'i', '³', counter);
      FieldByName('NAMED').AsString := ReplaceChar(FieldByName('NAMED').AsString, 'i', '³', counter);
      FieldByName('NAMEFULL').AsString := ReplaceChar(FieldByName('NAMEFULL').AsString, 'i', '³', counter);
      FieldByName('NAMEOK').AsString := ReplaceChar(FieldByName('NAMEOK').AsString, 'I', '²', counter);
      FieldByName('NAMED').AsString := ReplaceChar(FieldByName('NAMED').AsString, 'I', '²', counter);
      FieldByName('NAMEFULL').AsString := ReplaceChar(FieldByName('NAMEFULL').AsString, 'I', '²', counter);
      Post;
      Next;
    end;
  end;

  Query.ApplyUpdates;
  Query.CommitUpdates;

  ShowMessage(IntToStr(counter) + ' chars replaced.');
end;

// *** //
procedure TForm1.radioUPIClick(Sender: TObject);
begin
  Query.Active := false;
  Query.SQL.Clear;
  Query.SQL.Add(
    'select fam, ima, otch from z_upi where ' +
      'fam like "%i%" or ima like "%i%" or otch like "%i%"' +
      'or fam like "%I%" or ima like "%I%" or otch like "%I%"' +
      'or fam like "%`%" or ima like "%`%" or otch like "%`%"' +
      'or fam like "." or ima like "." or otch like "."'
      );
  Query.Active := true;

  UpdateSQL.ModifySQL.Text :=
      'update Z_UPI ' +
      'set ' +
      '  FAM = :FAM, ' +
      '  IMA = :IMA, ' +
      '  OTCH = :OTCH, ' +
      'where ' +
      '  FAM = :OLD_FAM' +
      '  AND IMA = :OLD_IMA' +
      '  AND OTCH = :OLD_OTCH';
end;

procedure TForm1.radioDlzhnClick(Sender: TObject);
begin
  Query.Active := false;
  Query.SQL.Clear;
  Query.SQL.Add(
    'select CODE, NAMEOK, NAMED, NAMEFULL from O_DOLGNOST ' +
      'where CODE like "%,%" ' +
      'or NAMEOK like "%i%" or NAMED like "%i%" or NAMEFULL like "%i%" ' +
      'or NAMEOK like "%I%" or NAMED like "%I%" or NAMEFULL like "%I%" ');
  Query.Active := true;

  UpdateSQL.ModifySQL.Text :=
      'update O_DOLGNOST ' +
      'set ' +
        'CODE = :CODE, ' +
        'NAMEOK = :NAMEOK, ' +
        'NAMED = :NAMED, ' +
        'NAMEFULL = :NAMEFULL, ' +
      'where ' +
        'CODE = :CODE ' +
        'NAMEOK = :NAMEOK ' +
        'AND NAMED = :NAMED ' +
        'AND NAMEFULL = :NAMEFULL';
end;

end.
