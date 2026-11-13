unit Z_VvFm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, DB, DBTables, Grids, DBGrids;

type
  TFormVvFam = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    edFam: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    RBtn1: TRadioButton;
    RBtn3: TRadioButton;
    RBtn2: TRadioButton;
    qryTmp: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edFamEnter(Sender: TObject);
    procedure edFamExit(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
  private
    c_SvFam : string;
    d_DtProc : TDateTime;
    n_TabN, n_KdObj : integer;
    bCaseForUpi : boolean;
    bCaseForOldOtp : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

function VvodFam(dDtProc : TDateTime; var nTabN, nKdObj : integer) : boolean;
function VvodFamForUpi(var nTabN : integer) : boolean;
function VvodFamForOldOtp(var nTabN : integer) : boolean;


const SECTION = 'Z_VvFm';

var
  FormVvFam: TFormVvFam;

implementation

uses A_Const, Z_Main, Z_DM, Z_ShVbFm;

{$R *.dfm}

//------------------------------------------------------------------------------
function VvodFamForOldOtp(var nTabN : integer) : boolean;
begin
  Result := false;
  FormVvFam := TFormVvFam.Create(Application);
  with FormVvFam do begin
    bCaseForUpi := false;
    bCaseForOldOtp := true;
    Caption := 'Ввод фамилии для поиска';
    edFam.Text := c_SvFam;
    n_TabN  := 0;
    n_KdObj := 0;
    if ShowModal = mrOk then begin
      nTabN  := n_TabN;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function VvodFamForUpi(var nTabN : integer) : boolean;
begin
  Result := false;
  FormVvFam := TFormVvFam.Create(Application);
  with FormVvFam do begin
    bCaseForUpi := true;
    bCaseForOldOtp := false;
    Caption := 'Ввод фамилии для поиска';
    edFam.Text := c_SvFam;
    n_TabN  := 0;
    n_KdObj := 0;
    if ShowModal = mrOk then begin
      nTabN  := n_TabN;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function VvodFam(dDtProc : TDateTime; var nTabN, nKdObj : integer) : boolean;
begin
  Result := false;
  FormVvFam := TFormVvFam.Create(Application);
  with FormVvFam do begin
    bCaseForUpi := false;
    Caption := 'Ввод фамилии для поиска';
    edFam.Text := c_SvFam;
    d_DtProc := dDtProc;
    n_TabN  := 0;
    n_KdObj := 0;
    if ShowModal = mrOk then begin
      nTabN  := n_TabN;
      nKdObj := n_KdObj;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFam.FormCreate(Sender: TObject);
var nRBtn : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    nRBtn := ReadInteger(SECTION, 'nRBtn', 1);
    c_SvFam := ReadString(SECTION, 'SvFm', '');
    Free;
  end;
  if nRBtn = 1 then
    RBtn1.Checked := true
  else if nRBtn = 2 then
    RBtn2.Checked := true
  else
    RBtn3.Checked := true;
end;
//------------------------------------------------------------------------------
procedure TFormVvFam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if RBtn1.Checked then
      WriteInteger(SECTION, 'nRBtn', 1)
    else if RBtn2.Checked then
      WriteInteger(SECTION, 'nRBtn', 2)
    else
      WriteInteger(SECTION, 'nRBtn', 3);
    WriteString(SECTION, 'SvFm', Trim(edFam.Text));
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvFam.edFamEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVvFam.edFamExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvFam.bBtnOkClick(Sender: TObject);
begin
  bBtnOk.SetFocus;
  if (edFam.Text = '') then begin
    ShowMessage('Некорректный ввод - фамилия должна быть непустой');
    edFam.SetFocus;
    Exit;
  end;
  if bCaseForUpi then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select TabN, Fam, Ima, Otch from Z_Upi where ');
      if RBtn1.Checked then
        SQL.Add(' (upper(Fam) = :cFam) ')
      else if RBtn2.Checked then
        SQL.Add(' (upper(Fam) starting(:cFam)) ')
      else
        SQL.Add(' (upper(Fam) containing(:cFam)) ');
      SQL.Add(' order by Fam, Ima, Otch');
      ParamByName('cFam').AsString := AnsiUpperCase(Trim(edFam.Text));
      Open;
      if RecordCount = 0 then begin
        ShowMessage('Не найдено фамилии по заданному условию');
//        n_TabN  := FieldByName('TabN').AsInteger;
//        n_KdObj := FieldByName('KdObj').AsInteger;
        ModalResult := mrNone; end
      else if RecordCount = 1 then begin
        n_TabN  := FieldByName('TabN').AsInteger;
        n_KdObj := 0;
        ModalResult := mrOk; end
      else begin
        if Shw_FamsForUpi(qryTmp, n_TabN) {Z_ShVbFm} then begin
          ModalResult := mrOk;
        end;
      end;
    end; end
  else if bCaseForOldOtp then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select distinct vo.TabN, u.Fam, u.Ima, u.Otch ' +
              ' from Z_VOtp vo, Z_Upi u ' +
              ' where (u.TabN = vo.TabN) and ');
      if RBtn1.Checked then
        SQL.Add(' (upper(u.Fam) = :cFam) ')
      else if RBtn2.Checked then
        SQL.Add(' (upper(u.Fam) starting(:cFam)) ')
      else
        SQL.Add(' (upper(u.Fam) containing(:cFam)) ');
      SQL.Add(' order by u.Fam, u.Ima, u.Otch');
      ParamByName('cFam').AsString := AnsiUpperCase(Trim(edFam.Text));
      Open;
      if RecordCount = 0 then begin
        ShowMessage('Не найдено фамилии по заданному условию');
        ModalResult := mrNone; end
      else if RecordCount = 1 then begin
        n_TabN  := FieldByName('TabN').AsInteger;
        n_KdObj := 0;
        ModalResult := mrOk; end
      else begin
        if Shw_FamsForUpi(qryTmp, n_TabN) {Z_ShVbFm} then begin
          ModalResult := mrOk;
        end;
      end;
    end; end
  else begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN; 
      SQL.Add('Select upi.Fam, upi.Ima, upi.Otch, sps.* ' +
              ' from Z_Sps sps, Z_Upi upi ' +
              ' where (sps.dtProc = :dDtProc) and (upi.TabN = sps.TabN) and ');
      if RBtn1.Checked then
        SQL.Add(' (upper(upi.Fam) = :cFam) ')
      else if RBtn2.Checked then
        SQL.Add(' (upper(upi.Fam) starting(:cFam)) ')
      else
        SQL.Add(' (upper(upi.Fam) containing(:cFam)) ');
      SQL.Add(' order by Fam, Ima, Otch');
      ParamByName('dDtProc').AsDateTime := d_DtProc;
      ParamByName('cFam').AsString := AnsiUpperCase(Trim(edFam.Text));
      Open;
      if RecordCount = 0 then begin
        ShowMessage('Не найдено фамилии по заданному условию');
//        n_TabN  := FieldByName('TabN').AsInteger;
//        n_KdObj := FieldByName('KdObj').AsInteger;
        ModalResult := mrNone; end
      else if RecordCount = 1 then begin
        n_TabN  := FieldByName('TabN').AsInteger;
        n_KdObj := FieldByName('KdObj').AsInteger;
        ModalResult := mrOk; end
      else begin
        if Shw_FamsForSps(qryTmp, n_TabN, n_KdObj) {Z_ShVbFm} then begin
          ModalResult := mrOk;
        end;
      end;
    end;
  end;
end;

end.
