unit a_Ch3Psw;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, DB, Dialogs, ExtCtrls, IniFiles, DBTables, DBClient,
     MConnect, SConnect;

type
  TFormPswUsr = class(TForm)
    Label1: TLabel;
    edNmUsr: TEdit;
    Label2: TLabel;
    edPswUsr: TEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelCntProb: TLabel;
    Bevel1: TBevel;
    Image2: TImage;
    ChBoxSvNmUsr: TCheckBox;
    SocketBuh: TSocketConnection;
    cdsUsr: TClientDataSet;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edNmUsrEnter(Sender: TObject);
    procedure edNmUsrExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    nCntProb : integer;
    c_NmCmp, c_NmUsr, cNmUsr, c_PswUsr : ShortString;
    cExeDir, cNmIni : string;
  public
    { Public declarations }
  end;

function Check3Psw(cNmCmp : ShortString; var nKdUsr, nUsrKat : SmallInt;
                                    var cAppNmUsr : ShortString) : boolean;

const SECTION = 'a_Ch3Psw';

var
  FormPswUsr: TFormPswUsr;

implementation

//uses A_Const;

{$R *.dfm}

//------------------------------------------------------------------------------
function Check3Psw(cNmCmp : ShortString; var nKdUsr, nUsrKat : SmallInt;
                                    var cAppNmUsr : ShortString) : boolean;
begin
  Result := false;
  FormPswUsr := TFormPswUsr.Create(nil);
  with FormPswUsr do begin
    c_NmCmp := cNmCmp;
    nCntProb := 0;
    if not ChBoxSvNmUsr.Checked then begin
      edNmUsr.Text := '';
      ActiveControl := edNmUsr; end
    else begin
      edNmUsr.Text := c_NmUsr;
      if edNmUsr.Text <> '' then
        ActiveControl := edPswUsr
      else
        ActiveControl := edNmUsr;
    end;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.FormCreate(Sender: TObject);
begin
  cExeDir := ExtractFileDir(ParamStr(0)) + '\';
  cNmIni := 'MyIni.ini';
  with TIniFile.Create(cExeDir + cNmIni) do begin
    ChBoxSvNmUsr.Checked := ReadBool(SECTION, 'bSvNmUsr', false);
    cNmUsr := ReadString(SECTION, 'cNmUsr', 'Вася');
    c_NmUsr := ReadString(SECTION, 'c_NmUsr', '');
    c_PswUsr := ReadString(SECTION, 'c_PswUsr', '');
  end;
  with cdsUsr do begin
    if Active then Close;
    CommandText := 'Select * from A_Gt2Usr(:cNmCmp, :cNmUsr)';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cExeDir + cNmIni) do begin
    WriteBool(SECTION, 'bSvNmUsr', ChBoxSvNmUsr.Checked);
    WriteString(SECTION, 'c_NmUsr', edNmUsr.Text);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var bIsUsrPsw, bIsVkl : boolean;
begin
  if ModalResult = mrOk then begin
//  Select * from A_Gt2Usr ('ndb', 'borenko')
    Inc(nCntProb);
    LabelCntProb.Caption := IntToStr(nCntProb);
    with cdsUsr do begin
      Params.ParamByName('cNmCmp').AsString := c_NmCmp;
      Params.ParamByName('cNmUsr').AsString := edNmUsr.Text;
      Open;
      if (RecordCount > 0) then begin
        bIsUsrPsw := FieldByName('PswUsr').AsString = edNmUsr.Text;
        bIsVkl := FieldByName('VKL').AsBoolean;
        if bIsUsrPsw then begin
          if not bIsVkl then begin
            ShowMessage(edNmUsr.Text + ', Вам отключен доступ к системе.' +
                           #13#10 + 'Обратитесь к администратору системы');
            ModalResult := mrCancel;
          end;
        end; end
      else begin
        if (nCntProb < 4) then begin
          ModalResult := mrNone;
          CanClose := false;
          edPswUsr.SetFocus; end
        else begin
          ShowMessage('Вы не прошли регистрцию.');
          ModalResult := mrCancel;
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.edNmUsrEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.edNmUsrExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.

