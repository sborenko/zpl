unit z_InSps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, Mask, DBCtrls, DB, DBClient,
  DBTables;

type
  TFormInSps = class(TForm)
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    cdsTmpKdSps: TSmallintField;
    dbeKdSps: TDBEdit;
    Label3: TLabel;
    dbeShSps: TDBEdit;
    bBtnApply: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnKdSps: TSpeedButton;
    LabelFamIO: TLabel;
    LabelKdObj: TLabel;
    cdsTmpShSps: TStringField;
    qryTmp: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnApplyClick(Sender: TObject);
    procedure sBtnKdSpsClick(Sender: TObject);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure cdsTmpCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    n_TabN, n_KdObj : integer;
    c_FamIO : ShortString;
  public
    { Public declarations }
  end;

function InclInKdSps(nTabN, nKdObj : integer; dDtPrc : TDateTime;
                                              cFamIO : ShortString) : boolean;

const SECTION = 'z_InSps';

var
  FormInSps: TFormInSps;

implementation

uses a_Const, a_DM, z_Dm, z_Main, a_ShKSps;

{$R *.dfm}

//------------------------------------------------------------------------------
function InclInKdSps(nTabN, nKdObj : integer; dDtPrc : TDateTime;
                                              cFamIO : ShortString) : boolean;
begin
  Result := false;
  FormInSps := TFormInSps.Create(Application);
  with FormInSps do begin
    d_DtPrc := dDtPrc;
    n_TabN  := nTabN;
    n_KdObj := nKdObj;
    c_FamIO := cFamIO;
    Caption := 'Выбор списка';
    LabelFamIO.Caption := 'Сотрудник ' + cFamIO;
    LabelKdObj.Caption := 'включается в подразделение ' + IntToStr(nKdObj);
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
    end;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInSps.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInSps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInSps.bBtnApplyClick(Sender: TObject);
var nNewKdSps : SmallInt; bExists : boolean; cMsg : ShortString;
begin
  if cdsTmpShSps.IsNull or (cdsTmpShSps.AsString = '') then begin
    ShowMessage('Выберите правильный список');
    Exit;
  end;  
  if not cdsTmpShSps.IsNull then begin
    nNewKdSps := cdsTmpKdSps.AsInteger;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select first 1 * from z_SPS where DtProc = :d_DtPrc and ' +
              ' TabN = :n_TabN and KdObj = :n_KdObj and KdSps = :nNewKdSps');
      ParamByName('d_DtPrc').AsDateTime  := d_DtPrc;
      ParamByName('n_KdObj').AsInteger   := n_KdObj;
      ParamByName('n_TabN').AsInteger    := n_TabN;
      ParamByName('nNewKdSps').AsInteger := nNewKdSps;
      Open;
      bExists := RecordCount > 0;
      Close;
      SQL.Clear;
      DataBaseName := '';
      if bExists then begin
        cMsg := 'Сотрудник ' + c_FamIO + ' уже есть в подразд. ' +
                IntToStr(n_KdObj) + ' в Списке ' + IntToStr(nNewKdSps);
        ShowMessage(cMsg); end
      else begin
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Insert into z_SPS (KdSps, DtProc, TabN, KdObj, Notes) ' +
              ' values (:nNewKdSps, :d_DtPrc, :n_TabN, :n_KdObj, :cNmUsr)');
        ParamByName('nNewKdSps').AsInteger := nNewKdSps;
        ParamByName('d_DtPrc').AsDateTime  := d_DtPrc;
        ParamByName('n_KdObj').AsInteger   := n_KdObj;
        ParamByName('n_TabN').AsInteger    := n_TabN;
        ParamByName('cNmUsr').AsString     := gc_AppNmUsr;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
        cMsg := 'Сотрудник ' + c_FamIO + ' включен в подразд. ' +
                IntToStr(n_KdObj) + ' в Список ' + IntToStr(nNewKdSps);
        ShowMessage(cMsg);
        ModalResult := mrOk;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInSps.sBtnKdSpsClick(Sender: TObject);
var n_KdSps : integer; var cShSps, cNmSps : string;
begin
  n_KdSps := cdsTmpKdSps.AsInteger;
  if GetKdSps(n_KdSps, cShSps, cNmSps) {a_ShKSps} then begin
    cdsTmpKdSps.AsInteger := n_KdSps;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInSps.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormInSps.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormInSps.cdsTmpCalcFields(DataSet: TDataSet);
begin
  cdsTmpShSps.AsString := Form_Dm.KdSps2ShSps(cdsTmpKdSps.AsInteger);
end;

end.
