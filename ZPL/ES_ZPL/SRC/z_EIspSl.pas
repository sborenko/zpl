unit z_EIspSl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB;

type
  TFormEAISP = class(TForm)
    Label2: TLabel;
    dbeNmSlg: TDBEdit;
    Label3: TLabel;
    dbeAdres: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    dbeKdSlg: TDBEdit;
    procedure dbeKdSlgEnter(Sender: TObject);
    procedure dbeKdSlgExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

const SECTION = 'z_EIspSl';

function EA_IspSlg: Boolean;


var
  FormEAISP: TFormEAISP;

implementation

uses A_Const, a_Dm, Z_DM, Z_Main, z_IspSlg, A_ShwErr;


{$R *.dfm}

//------------------------------------------------------------------------------
function EA_IspSlg: Boolean;
begin
  Result  := false;
  FormEAISP := TFormEAISP.Create(Application);
  with FormEAISP  do begin
    dbeKdSlg.DataSource := FormIspSlg.dsrcIsp;
    dbeNmSlg.DataSource := FormIspSlg.dsrcIsp;
    dbeAdres.DataSource := FormIspSlg.dsrcIsp;
    dbeNotes.DataSource := FormIspSlg.dsrcIsp;
    If ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAISP.dbeKdSlgEnter(Sender: TObject);
begin
     (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAISP.dbeKdSlgExit(Sender: TObject);
begin
     (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAISP.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 150);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAISP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAISP.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeNmSlg.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormEAISP.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (Trim(dbeNmSlg.Text) = '') then
    mListErr.Add('Не введено название службы.');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;

end.
