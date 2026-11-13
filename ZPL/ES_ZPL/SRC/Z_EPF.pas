unit Z_EPF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Db, DBClient, Buttons, IniFiles;

type
  TFormEAPF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    dbePorog: TDBEdit;
    dbeSmm: TDBEdit;
    dbePrc: TDBEdit;
    Label4: TLabel;
    cdsTmpPOROG: TFloatField;
    cdsTmpSMM: TFloatField;
    cdsTmpPRC: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EdtRecPF(var nPorog, nSmm, nPrc : double) : boolean;
function AddRecPF(var nPorog, nSmm, nPrc : double) : boolean;

const SECTION = 'Z_EPF';

var
  FormEAPF: TFormEAPF;

implementation

uses A_Const;

{$R *.DFM}

//--------------------------------------------------------------------
function EdtRecPF(var nPorog, nSmm, nPrc : double) : boolean;
begin
  Result := false;
  FormEAPF := TFormEAPF.Create(Application);
  with FormEAPF do begin
    Caption := 'Редактирование';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      FieldByName('Porog').asFloat := nPorog;
      FieldByName('Smm').asFloat := nSmm;
      FieldByName('Prc').asFloat := nPrc;
      // и остается в dsInsert
    end;
    if ShowModal = mrOk then begin
      nPorog  := cdsTmp.FieldByName('Porog').asFloat;
      nSmm    := cdsTmp.FieldByName('Smm').asFloat;
      nPrc    := cdsTmp.FieldByName('Prc').asFloat;
      Result  := true;
    end;
    cdsTmp.Close;
    Free;
  end;
end;
//--------------------------------------------------------------------
function AddRecPF(var nPorog, nSmm, nPrc : double) : boolean;
begin
  Result := false;
  FormEAPF := TFormEAPF.Create(Application);
  with FormEAPF do begin
    Caption := 'Новая запись';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      // и остается в dsInsert
    end;
    if ShowModal = mrOk then begin
      nPorog  := cdsTmp.FieldByName('Porog').asFloat;
      nSmm    := cdsTmp.FieldByName('Smm').asFloat;
      nPrc    := cdsTmp.FieldByName('Prc').asFloat;
      Result  := true;
    end;
    cdsTmp.Close;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEAPF.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEAPF.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEAPF.FormCloseQuery(Sender: TObject;
                                               var CanClose: Boolean);
begin
  with cdsTmp do begin
    if (ModalResult = mrOk) and (
                  FieldByName('Porog').isNull or
                          (FieldByName('Porog').asString = '') or
                  FieldByName('Smm').isNull or
                          (FieldByName('Smm').asString = '') or
                  FieldByName('Prc').isNull or
                    (FieldByName('Prc').asString = '') ) then begin
      ModalResult := mrNone;
      CanClose := false;
      MessageDlg('Не должно быть пустых значений', mtError, [mbOk], 0);
      dbePorog.SetFocus;
    end;
  end;
end;

end.
