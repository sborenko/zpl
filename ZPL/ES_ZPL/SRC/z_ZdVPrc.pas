unit z_ZdVPrc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBClient,
  ComCtrls;

type
  TFormZdVedPrc = class(TForm)
    cdsTmp: TClientDataSet;
    cdsTmpPrcOtpC: TFloatField;
    cdsTmpPrcOtpB: TFloatField;
    cdsTmpPrcRest: TFloatField;
    dsrcTmp: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbePrcOtpC: TDBEdit;
    dbePrcOtpB: TDBEdit;
    dbePrcRest: TDBEdit;
    Label5: TLabel;
    dbePrcVupl: TDBEdit;
    Label6: TLabel;
    cdsTmpPrcVupl: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeditEnter(Sender: TObject);
    procedure dbeditExit(Sender: TObject);
  private
    { Private declarations }
    n_PrcOtpC, n_PrcOtpB, n_PrcRest, n_PrcVupl : double;
    procedure CreOpenCdsTmp;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function GetPrcByGrp(var nPrcOtpC, nPrcOtpB, nPrcRest : double) : boolean;
function GetPrc(var nPrcVupl : double) : boolean;

const SECTION = 'z_ZdVPrc';

var
  FormZdVedPrc: TFormZdVedPrc;

implementation

uses a_Const, z_Main, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetPrc(var nPrcVupl : double) : boolean;
begin
  Result := false;
  FormZdVedPrc := TFormZdVedPrc.Create(Application);
  with FormZdVedPrc do begin
    Height := 140;
    PageControl1.ActivePage := ts2;
    Caption := 'Ввод задания';
    CreOpenCdsTmp;
    cdsTmp.Append;
    if n_PrcVupl <> 0 then
      cdsTmp.FieldByName('PrcVupl').AsFloat := n_PrcVupl;
    if ShowModal = mrOk then begin
      nPrcVupl := cdsTmp.FieldByName('PrcVupl').AsFloat;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetPrcByGrp(var nPrcOtpC, nPrcOtpB, nPrcRest : double) : boolean;
begin
  Result := false;
  FormZdVedPrc := TFormZdVedPrc.Create(Application);
  with FormZdVedPrc do begin
    Height := 187;
    PageControl1.ActivePage := ts1;
    Caption := 'Ввод задания';
    CreOpenCdsTmp;
    cdsTmp.Append;
    if n_PrcOtpC <> 0 then
      cdsTmp.FieldByName('PrcOtpC').AsFloat := n_PrcOtpC;
    if n_PrcOtpB <> 0 then
      cdsTmp.FieldByName('PrcOtpB').AsFloat := n_PrcOtpB;
    if n_PrcRest <> 0 then
      cdsTmp.FieldByName('PrcRest').AsFloat := n_PrcRest;
    if ShowModal = mrOk then begin
      nPrcOtpC := cdsTmp.FieldByName('PrcOtpC').AsFloat;
      nPrcOtpB := cdsTmp.FieldByName('PrcOtpB').AsFloat;
      nPrcRest := cdsTmp.FieldByName('PrcRest').AsFloat;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZdVedPrc.CreOpenCdsTmp;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZdVedPrc.FormCreate(Sender: TObject);
begin
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    n_PrcOtpC := ReadFloat(SECTION, 'PrcOtpC', 0);
    n_PrcOtpB := ReadFloat(SECTION, 'PrcOtpB', 0);
    n_PrcRest := ReadFloat(SECTION, 'PrcRest', 0);
    n_PrcVupl := ReadFloat(SECTION, 'PrcVupl', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZdVedPrc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if PageControl1.ActivePage = ts1 then begin
      WriteFloat(SECTION, 'PrcOtpC', cdsTmp.FieldByName('PrcOtpC').AsFloat);
      WriteFloat(SECTION, 'PrcOtpB', cdsTmp.FieldByName('PrcOtpB').AsFloat);
      WriteFloat(SECTION, 'PrcRest', cdsTmp.FieldByName('PrcRest').AsFloat); end
    else
      WriteFloat(SECTION, 'PrcVupl', cdsTmp.FieldByName('PrcVupl').AsFloat);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormZdVedPrc.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if PageControl1.ActivePage = ts1 then begin
    if (not cdsTmp.FieldByName('PrcOtpC').IsNull and
             ((cdsTmp.FieldByName('PrcOtpC').AsFloat < 0) or
              (cdsTmp.FieldByName('PrcOtpC').AsFloat > 100))) or
          (not cdsTmp.FieldByName('PrcOtpB').IsNull and
                ((cdsTmp.FieldByName('PrcOtpB').AsFloat < 0) or
                 (cdsTmp.FieldByName('PrcOtpB').AsFloat > 100))) or
            (not cdsTmp.FieldByName('PrcRest').IsNull and
                  ((cdsTmp.FieldByName('PrcRest').AsFloat < 0) or
                   (cdsTmp.FieldByName('PrcRest').AsFloat > 100))) then
      mListErr.Add('Проценты не могут быть отрицательными или больше 100');
    if (cdsTmp.FieldByName('PrcOtpC').AsFloat = 0) and
                (cdsTmp.FieldByName('PrcOtpB').AsFloat = 0) and
                  (cdsTmp.FieldByName('PrcRest').AsFloat = 0) then
      mListErr.Add('Должен же какой-то процент быть неНулевым!'); end
  else begin
    if (not cdsTmp.FieldByName('PrcVupl').IsNull and
             ((cdsTmp.FieldByName('PrcVupl').AsFloat < 0) or
              (cdsTmp.FieldByName('PrcVupl').AsFloat > 100))) then
      mListErr.Add('Проценты не могут быть отрицательными или больше 100');
    if (cdsTmp.FieldByName('PrcVupl').AsFloat = 0) then
      mListErr.Add('Процент выплат должен быть неНулевым!');
  end;
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormZdVedPrc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    if PageControl1.ActivePage = ts1 then
      dbePrcOtpC.SetFocus
    else
      dbePrcVupl.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZdVedPrc.dbeditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormZdVedPrc.dbeditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
