unit A_ESbu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, Mask, DBCtrls, DB,
  DBTables, DBClient;

type
  TFormNewItem = class(TForm)
    CdsTmp: TClientDataSet;
    DsrcTmp: TDataSource;
    CdsTmpNR: TAutoIncField;
    CdsTmpNmSch: TStringField;
    CdsTmpNr_GOrd: TStringField;
    CdsTmpArc: TStringField;
    CdsTmpSchBU: TStringField;
    CdsTmpSch_17: TStringField;
    QryTmp: TQuery;
    PanelBottom: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    GrBoxAccnt: TGroupBox;
    LblAccntNum: TLabel;
    DbeAccntNum: TDBEdit;
    Label3: TLabel;
    DbeAccntName: TDBEdit;
    DbChBoxArch: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeEnter(Sender: TObject);
    procedure dbeEditKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure DbeAccntNumExit(Sender: TObject);
  private
    n_CurNR    : integer;
    procedure CreOpenCdsTmp;
    function CheckVvod : boolean;
  public
    class function EditAccnt(Msg: ShortString; Nr: Integer;
      var SchDo, Sch17, NmSch, Arc: ShortString): Boolean;
  end;

const SECTION = 'a_ESbu';

var
  FormNewItem: TFormNewItem;

implementation

{$R *.DFM}

uses A_Const, a_Sbu, A_ShwErr;

//------------------------------------------------------------------------------
class function TFormNewItem.EditAccnt(
  Msg: ShortString;
  Nr: Integer;
  var SchDo, Sch17, NmSch, Arc: ShortString): Boolean;
begin
  Result  := false;
  with TFormNewItem.Create(Application) do begin
    n_CurNR := Nr;
    Caption := 'Редактирование счёта';
    CreOpenCdsTmp;

    CdsTmp.Append;
    CdsTmpSchBU.AsString := SchDo;
    CdsTmpSch_17.AsString := Sch17;
    CdsTmpNmSch.AsString := NmSch;
    if Trim(Arc) = '' then
      CdsTmpArc.AsString := '0'
    else
      CdsTmpArc.AsString := Arc;

    if ShowModal = mrOK then begin
      CdsTmp.Post;
      // SB 25.3.2025
      // SchDo  := Trim(CdsTmpSchBU.AsString);
      SchDo  := Trim(CdsTmpSch_17.AsString);

      Sch17 := Trim(CdsTmpSch_17.AsString);
      NmSch  := Trim(CdsTmpNmSch.AsString);
      Arc    := CdsTmpArc.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.CreOpenCdsTmp;
begin
  with CdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wl', 100);
    Top  := ReadInteger(SECTION, 'wt', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOK then with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wl', Left);
    WriteInteger(SECTION, 'wt', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      DbeAccntNum.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.dbeEditKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = []) then begin
    BtnOk.SetFocus;
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
function TFormNewItem.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (DbeAccntNum.Text = '') then
    mListErr.Add('Не введён счёт');

  if (DbeAccntName.Text = '') then
    mListErr.Add('Нет наименования счёта');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormNewItem.DbeAccntNumExit(Sender: TObject);
var cSch17 : shortString;
begin
  cSch17 := AnsiUpperCase(Trim(DbeAccntNum.Field.AsString));
  with QryTmp do begin
    if Active then Close;
    SQL.Clear;
    DatabaseName := CESMain;
    if n_CurNR = 0 then begin
      SQL.Add('Select * from kd_Sbu where Upper(sch_17) = :cSch17');
      ParamByName('cSch17').AsString := cSch17; end
    else begin
      SQL.Add('Select * from kd_Sbu where Upper(sch_17) = :cSch17 and '  +
             ' NR <> :nCurNR');
      ParamByName('cSch17').AsString := cSch17;
      ParamByName('nCurNR').AsInteger := n_CurNR;
    end;
    Open;
    If RecordCount > 0 then  begin
      ShowMessage('Счёт "' + cSch17 + '" уже есть в плане счетов.');
      DbeAccntNum.SetFocus; end
    else
      DbeAccntNum.Color := clWindow;
    Close;
    SQL.Clear;
    DatabaseName := '';
 end;
end;

end.
