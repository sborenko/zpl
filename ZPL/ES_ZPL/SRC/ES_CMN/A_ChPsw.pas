unit A_ChPsw;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, DB, {EasyTable,} Dialogs, ExtCtrls, IniFiles, DBTables;

type
  TFormPswUsrDlg = class(TForm)
    Label1: TLabel;
    edNmUsr: TEdit;
    Label2: TLabel;
    edPswUsr: TEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelCntProb: TLabel;
    Bevel1: TBevel;
    qryUsrs: TQuery;
    dbAccess: TDatabase;
    Image2: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edNmUsrEnter(Sender: TObject);
    procedure edNmUsrExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    nCntProb : integer;
    n_KdUsr, n_KdKatUsr : integer;
    cExeDir, cNmIni : string;
  public
    { Public declarations }
  end;

function CheckPsw(var nAppKdUsr, nAppKdKatUsr : integer;
                                 var cAppUser : string) : boolean;

const SECTION = 'a_ChPsw';

var
  FormPswUsrDlg: TFormPswUsrDlg;

implementation

uses A_Const;

{$R *.dfm}

//------------------------------------------------------------------------------
function CheckPsw(var nAppKdUsr, nAppKdKatUsr : integer;
                                 var cAppUser : string) : boolean;
begin
  Result := false;
  cAppUser := '';
  FormPswUsrDlg := TFormPswUsrDlg.Create(nil);
  with FormPswUsrDlg do begin
    nCntProb := 0;
    n_KdUsr := 0;
    n_KdKatUsr := 0;
    if edNmUsr.Text <> '' then
      ActiveControl := edPswUsr;
    if ShowModal = mrOk then begin
      cAppUser := edNmUsr.Text;
      nAppKdUsr := n_KdUsr;
      nAppKdKatUsr := n_KdKatUsr;
      Result := true;
    end;
    if qryUsrs.Active then
      qryUsrs.Close;
    if dbAccess.Connected then
      dbAccess.Close;
    Free;
  end;
end;
{пароль "qwarta" - задан в компоненте dbAccess (см. на форме)}
//------------------------------------------------------------------------------
procedure TFormPswUsrDlg.FormCloseQuery(Sender: TObject;
                                                var CanClose: Boolean);
var cNmUsr, cPswUsr, cExeDir : string;  bIsUsrPsw, bIsUsrVkl : boolean;
    mLstUsr : TStringList;
begin
  bIsUsrVkl := true;
  if ModalResult = mrOk then with qryUsrs do begin
    Inc(nCntProb);
    LabelCntProb.Caption := IntToStr(nCntProb);
    bIsUsrPsw := false;
    if not Active then Open;
    cNmUsr := edNmUsr.Text;
    cPswUsr := edPswUsr.Text;
    if Locate('NmUsr', cNmUsr, []) and
                        (FieldByName('PswUsr').AsString = cPswUsr) then begin
      bIsUsrPsw := true;
      n_KdKatUsr := FieldByName('KdKatUsr').AsInteger;
      n_KdUsr := FieldByName('KdUsr').AsInteger;
      bIsUsrVkl := (FieldByName('Vkl').AsString = 'Y');
    end;
    if bIsUsrPsw then begin
      if bIsUsrVkl then begin
        mLstUsr := TStringList.Create;
        mLstUsr.Add(cNmUsr);
        mLstUsr.Add(IntToStr(n_KdKatUsr));
        mLstUsr.Add(IntToStr(n_KdUsr));
        mLstUsr.SaveToFile(cExeDir + 't_txtxtx.lbx');
        mLstUsr.Destroy; end  // Что я нагородил с mLstUsr, зачем???
      else begin
        ShowMessage(cNmUsr + ', обратитесь к администратору. Sorry!');
        ModalResult := mrCancel;
      end; end
    else if not bIsUsrPsw and (nCntProb < 4) then begin
      ModalResult := mrNone;
      CanClose := false;
      edPswUsr.SetFocus; end
    else begin
      ShowMessage('Вы не прошли регистрцию.' + #13#10 +
                  '                  Sorry!');
      ModalResult := mrCancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsrDlg.edNmUsrEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsrDlg.edNmUsrExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsrDlg.FormCreate(Sender: TObject);
begin
  cExeDir := ExtractFileDir(ParamStr(0)) + '\';
  cNmIni := 'MyIni.ini';
  with TIniFile.Create(cExeDir + cNmIni) do begin
    edNmUsr.Text := ReadString(SECTION, 'NmUser', '');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsrDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cExeDir + cNmIni) do begin
    WriteString(SECTION, 'NmUser', edNmUsr.Text);
  end;
end;

end.

