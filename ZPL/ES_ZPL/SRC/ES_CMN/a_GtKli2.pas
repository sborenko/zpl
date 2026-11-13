unit a_GtKli2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient,
  DBTables;

type
  TFormGtKli2 = class(TForm)
    cdsTmp: TClientDataSet;
    cdsTmpNmKli: TStringField;
    cdsTmpOKPO: TStringField;
    Label1: TLabel;
    dbeOkpo: TDBEdit;
    dsrcTmp: TDataSource;
    Label2: TLabel;
    dbeNmKli: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cdsKli: TClientDataSet;
    cdsKliNR: TAutoIncField;
    cdsKliKdKli: TSmallintField;
    cdsKliNmWho: TStringField;
    cdsKliOKPO: TStringField;
    procedure dbeOkpoEnter(Sender: TObject);
    procedure dbeOkpoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeOkpoDblClick(Sender: TObject);
    procedure dbeNmKliDblClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
  private
    { Private declarations }
    cSvOkpo, cSvNmKli : ShortString;
    qry_Kli : TQuery;
    procedure AddToCdsKli(nKdKli : SmallInt; cNmWho, cOkpo : ShortString);
  public
    { Public declarations }
  end;

function GtKli2(var nKdKli : SmallInt; qryKli : TQuery) : boolean;

const SECTION = 'a_GtKli2';

var
  FormGtKli2: TFormGtKli2;

implementation

uses A_Const, a_ShFRe2;

{$R *.dfm}

//------------------------------------------------------------------------------
function GtKli2(var nKdKli : SmallInt; qryKli : TQuery) : boolean;
begin
  Result := false;
  FormGtKli2 := TFormGtKli2.Create(Application);
  with FormGtKli2 do begin
    qry_Kli := qryKli;
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Caption := 'Введите задание на поиск';
      Open;
      Append;
      if cSvOkpo > '' then
        cdsTmpOkpo.AsString := cSvOkpo;
      if cSvNmKli > '' then
        cdsTmpNmKli.AsString := cSvNmKli;
    end;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.dbeOkpoEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.dbeOkpoExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left     := ReadInteger(SECTION, 'wL', 100);
    Top      := ReadInteger(SECTION, 'wT', 100);
    cSvOkpo  := ReadString(SECTION, 'cSvOkpo', '');
    cSvNmKli := ReadString(SECTION, 'cSvNmKli', '');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteString(SECTION, 'cSvOkpo', Trim(cdsTmpOkpo.AsString));
    WriteString(SECTION, 'cSvNmKli', Trim(cdsTmpNmKli.AsString));
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.dbeOkpoDblClick(Sender: TObject);
var cOkpo : ShortString;
begin
  dbeNmKli.SetFocus;
  dbeOkpo.SetFocus;
  cOkpo := Trim(cdsTmpOkpo.AsString);
  if qry_Kli.Locate('OKPO', cOKPO, []) then
    ModalResult := mrOk
  else
    ShowMessage('Не найден клиент с ОКПО = "' + cOkpo + '"');
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.dbeNmKliDblClick(Sender: TObject);
var cNmKli : ShortString; nKdKli, nCntFindRec, nSvKdKli : SmallInt;
begin
  dbeOkpo.SetFocus;
  dbeNmKli.SetFocus;
  cNmKli := AnsiUpperCase(Trim(cdsTmpNmKli.AsString));
  with cdsKli do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qry_Kli do begin
    nSvKdKli := FieldByName('KdWho').AsInteger;
    DisableControls;
    First;
    nCntFindRec := 0;
    while not Eof do begin
      if Pos(cNmKli, AnsiUpperCase(FieldByName('NmWho').AsString)) > 0 then begin
        AddToCdsKli(FieldByName('KdWho').AsInteger,
                              FieldByName('NmWho').AsString,
                                   FieldByName('Okpo').AsString);
        Inc(nCntFindRec);
      end;
      Next;
    end;
    Locate('KdWho', nSvKdKli, []);
    EnableControls;
  end;
  if nCntFindRec = 0 then
    ShowMessage('Не найден клиент по входимости "' + cNmKli + '"')
  else if nCntFindRec = 1 then begin
    nKdKli := cdsKliKdKli.AsInteger;
    if qry_Kli.Locate('KdWho', nKdKli, []) then
      ModalResult := mrOk; end
  else if nCntFindRec > 0 then begin
    if ShwFindRec2(nKdKli, cdsKli) {a_ShFRe2} then begin
      if qry_Kli.Locate('KdWho', nKdKli, []) then
        ModalResult := mrOk;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.AddToCdsKli(nKdKli : SmallInt;
                                                  cNmWho, cOkpo : ShortString);
begin
  with cdsKli do begin
    Append;
    cdsKliKdKli.AsInteger := nKdKli;
    cdsKliNmWho.AsString  := cNmWho;
    cdsKliOkpo.AsString   := cOkpo;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtKli2.bBtnOkClick(Sender: TObject);
begin
  if not cdsTmpOkpo.IsNull and (Trim(cdsTmpOkpo.AsString) > '') then
    dbeOkpoDblClick(Self)
  else if not cdsTmpNmKli.IsNull and (Trim(cdsTmpNmKli.AsString) > '') then
    dbeNmKliDblClick(Self);
end;

end.
