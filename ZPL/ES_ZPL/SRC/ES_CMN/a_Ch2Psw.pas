unit a_Ch2Psw;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, DB, Dialogs, ExtCtrls, IniFiles, DBTables;

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
    qryTmp: TQuery;
    Image2: TImage;
    DbPsw: TDatabase;
    ChBoxSvNmUsr: TCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edNmUsrEnter(Sender: TObject);
    procedure edNmUsrExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    nCntProb : integer;
    c_CallingApplication : ShortString;
    n_KdUsr, n_KdKatUsr, n_KdSpsUsr : integer;
    c_NmUsr : ShortString;
    cDirExe, cNmIni : string;
  public
    { Public declarations }
  end;

function CheckUsrPsw(cApplication : ShortString;
                                  var nAppKdUsr, nAppKdKatUsr : SmallInt;
                                          var cAppUser : ShortString) : boolean;

const SECTION = 'a_Ch2Psw';

var
  FormPswUsr: TFormPswUsr;

implementation

uses
  a_Const, a_Lib, DATABASENAME;

{$R *.dfm}

//------------------------------------------------------------------------------
function CheckUsrPsw(
  cApplication: ShortString;
  var nAppKdUsr, nAppKdKatUsr: SmallInt;
  var cAppUser: ShortString) : boolean;
begin
  Result := false;
  cAppUser := '';
  FormPswUsr := TFormPswUsr.Create(nil);
  with FormPswUsr do begin
    nCntProb := 0;
    n_KdUsr := 0;
    n_KdKatUsr := 0;
    n_KdSpsUsr := 0;
    c_CallingApplication := cApplication;
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
      cAppUser := edNmUsr.Text;
      nAppKdUsr := n_KdUsr;
      nAppKdKatUsr := n_KdKatUsr;
      Result := true;
    end;
    if qryTmp.Active then
      qryTmp.Close;
    if DbPsw.Connected then
      DbPsw.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.FormCreate(Sender: TObject);
var cTmp1, cTmp2, cPsw, cChar : ShortString; k : SmallInt; bMore : boolean;
begin
  DbPsw.AliasName := DATABASE_ALIAS;

  cDirExe := ExtractFileDir(ParamStr(0)) + '\';
  if FileExists(cDirExe + 'qqq.qqq') then begin
    with TIniFile.Create(cDirExe + 'qqq.qqq') do begin
      cMyUserNm := ReadString('qqq', 'qqq1', ''); // в qqq1 м.б. записан UserNm
      cTmp1 := ReadString('qqq', 'qqq2', '');     // в qqq2 м.б. записан psw
      cTmp2 := ReadString('qqq', 'qqq3', '');     //             qqq2=kalosha
      Free;                                       // qqq3=16;1;18;1;8;5;4;1;16
    end;                  // порядковые номера символов в переменной cMyString
  end;
  if cTmp1 > '' then
    cPsw := cTmp1
  else if (cTmp2 > '') then begin
    cPsw := '';
    bMore := true;
    while bMore do begin
      k := Pos(';', cTmp2);
      if k > 0 then begin
        cChar := Copy(cTmp2, 1, k-1);
        cPsw := cPsw + cMyString[StrToInt(cChar)];
        cTmp2 := Copy(cTmp2, k+1, 20); end
      else begin
        if cTmp2 > '' then
          cPsw := cPsw + cMyString[StrToInt(cTmp2)];
        bMore := false;
      end;
    end;
  end;
  if cPsw > '' then
    cMyPsw := cPsw;
  DbPsw.Params.Values['User Name'] := cMyUserNm;
  DbPsw.Params.Values['Password']  := cMyPsw;
  cNmIni := 'MyIni.ini';
  with TIniFile.Create(cDirExe + cNmIni) do begin
    ChBoxSvNmUsr.Checked := ReadBool(SECTION, 'bSvNmUsr', false);
    c_NmUsr := ReadString(SECTION, 'NmUser', '');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cDirExe + cNmIni) do begin
    WriteBool(SECTION, 'bSvNmUsr', ChBoxSvNmUsr.Checked);
    WriteString(SECTION, 'NmUser', edNmUsr.Text);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPswUsr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var cNmUsr, cPswUsr, cSpecUsr, cNmApp, cNmComputer, cMsg : ShorTString;
    bIsUsrPsw, bIsUsrVkl, bIsDopuskToApp, bIsInWrkUsr : boolean;
    mLstUsr : TStringList; nAppUsrLvl : SmallInt;
begin
  bIsUsrVkl := true;
  bIsDopuskToApp := false;
  bIsInWrkUsr := false;
  cNmComputer := '';
  nAppUsrLvl := 99;
  if ModalResult = mrOk then begin
    Inc(nCntProb);
    LabelCntProb.Caption := IntToStr(nCntProb);
    bIsUsrPsw := false;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := DbPsw.DatabaseName;
      SQL.Add('Select c.KdUsr, c.NmCmp, p.NmCmp as NameCmp, c.Lvl, ' +
              ' u.KdKatUsr, u.Vkl, u.NmUsr, u.PswUsr, u.KdSps, u.Notes, ' +
              ' u.InclZplSpZ from zz_UsrCmp c ' +
              ' Left outer join usrs u on u.KdUsr = c.KdUsr ' +
              ' Left outer join zz_PCmp p on p.ShCmp = c.NmCmp ' +
              ' where c.NmCmp = :cCallApp order by c.KdUsr ');
      ParamByName('cCallApp').AsString := c_CallingApplication;
      Open;
      cNmUsr := edNmUsr.Text;
      cPswUsr := edPswUsr.Text;
      if Locate('NmUsr', cNmUsr, []) and
                        (FieldByName('PswUsr').AsString = cPswUsr) then begin
        bIsUsrPsw      := true;
        nAppUsrLvl     := FieldByName('Lvl').AsInteger;
        bIsDopuskToApp := (FieldByName('Vkl').AsString = 'Y');
        cNmApp         := FieldByName('NameCmp').AsString;
        n_KdKatUsr     := FieldByName('KdKatUsr').AsInteger;
        n_KdUsr        := FieldByName('KdUsr').AsInteger;
        cSpecUsr       := FieldByName('InclZplSpZ').AsString;
        bIsUsrVkl      := (FieldByName('Vkl').AsString = 'Y');
        if cSpecUsr = '' then
          cSpecUsr := 'Y';
        if MyIsField('KdSps', qryTmp) then
          n_KdSpsUsr := FieldByName('KdSps').AsInteger
        else
          n_KdSpsUsr := 0;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    if bIsInWrkUsr then begin
      cMsg := 'Пользователь ' + cNmUsr + ' уже работает с программой';
      if cNmComputer > '' then
        cMsg := cMsg + ' с компьютера ' + cNmComputer;
      ShowMessage(cMsg);
      ModalResult := mrCancel; end
    else if not bIsUsrPsw then begin
      if (nCntProb < 4) then begin
        ModalResult := mrNone;
        CanClose := false;
        edPswUsr.SetFocus; end
      else begin
        ShowMessage('Вы не прошли регистрцию.');
        ModalResult := mrCancel;
      end; end
    else if not bIsUsrVkl then begin
      ShowMessage(cNmUsr + ', обратитесь к администратору.');
      ModalResult := mrCancel; end
    else begin
      if not bIsDopuskToApp then begin
        ShowMessage(cNmUsr +  ', Вы не допущены к компоненту ' + cNmApp +
                              #13#10 + 'Обратитесь к администратору БД');
        ModalResult := mrCancel;
      end;
    end;
    if bIsUsrPsw and bIsUsrVkl and bIsDopuskToApp then begin
      mLstUsr := TStringList.Create;
      mLstUsr.Add(cNmUsr);
      mLstUsr.Add(IntToStr(n_KdKatUsr));
      mLstUsr.Add(IntToStr(n_KdUsr));
      mLstUsr.Add(IntToStr(n_KdSpsUsr));      // Файл t_ChkUsr.lst пишется для
      mLstUsr.Add(cSpecUsr);                  // главной формы. А там он сразу
      mLstUsr.Add(IntToStr(nAppUsrLvl));      // после прочтения удаляется.
      mLstUsr.SaveToFile(cDirExe + 't_ChkUsr.lst');
      mLstUsr.Destroy;         // Не очень красиво, но делалось на скорую руку
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
//------------------------------------------------------------------------------
end.

