unit z_FrmAccMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables;

type
  TFrmAccountMap = class(TForm)
    LblBaseAccNum: TLabel;
    LblBaseAccName: TLabel;
    BevelHead: TBevel;
    LblAccounts: TLabel;
    LblForAllowances: TLabel;
    EdtFirstAccount: TEdit;
    LblFirstAccount: TLabel;
    LblForPayments: TLabel;
    EdtSecondAccount: TEdit;
    LblSecondAccount: TLabel;
    BevelFoot: TBevel;
    BtnDelete: TBitBtn;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    LblMOName: TLabel;
    EdtMOName: TEdit;
    BtnFirstAccount: TBitBtn;
    BtnSecondAccount: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFirstAccountClick(Sender: TObject);
    procedure BtnSecondAccountClick(Sender: TObject);

    procedure EdtFirstAccountExit(Sender: TObject);
    procedure EdtSecondAccountExit(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure EdtMONameEnter(Sender: TObject);
    procedure EdtMONameExit(Sender: TObject);
    procedure EdtFirstAccountEnter(Sender: TObject);
    procedure EdtSecondAccountEnter(Sender: TObject);
  private
    function SelectFromSBURef(var nKdSBU: integer; var cSchBU, cNmSBU: string): boolean;
  public
    class procedure Run(Accnt: ShortString);
  end;

implementation

uses
  z_DMAccMap, A_SBU;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmAccountMap.Run(Accnt: ShortString);
var
  AccNm: ShortString;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function MappingExists: boolean;
  begin
    Result := (DmAccMap.GetMapAcc(AccrualAcc) <> 0) or (DmAccMap.GetMapAcc(PaymentAcc) <> 0);
  end;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
begin
  with TFrmAccountMap.Create(nil) do begin
    LblBaseAccNum.Caption := Accnt;

    DMAccMap := TDMAccMap.Create(nil);
    DMAccMap.Init;

    if DMAccMap.CheckAccnt(BaseAcc, Accnt, AccNm) then begin
      LblBaseAccName.Caption := AccNm;

      if MappingExists then begin
        EdtMOName.Text := DMAccMap.GetMemOrdName;

        BtnDelete.Enabled := true;

        if DMAccMap.GetAccInfo(DMAccMap.GetMapAcc(AccrualAcc), Accnt, AccNm) then begin
          EdtFirstAccount.Text := Accnt;
          LblFirstAccount.Caption := AccNm;
        end;

        if DMAccMap.GetAccInfo(DMAccMap.GetMapAcc(PaymentAcc), Accnt, AccNm) then
        begin
          EdtSecondAccount.Text := Accnt;
          LblSecondAccount.Caption := AccNm;
        end;
      end;
    end;

    ShowModal;

    DMAccMap.Free;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.EdtMONameEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.EdtMONameExit(Sender: TObject);
begin
  DMAccMap.SetMemOrdName(EdtMOName.Text);
  (Sender as TEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.EdtFirstAccountEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.EdtFirstAccountExit(Sender: TObject);
var
  AccNm: ShortString;
begin
  if DMAccMap.CheckAccnt(AccrualAcc, EdtFirstAccount.Text, AccNm) then
    LblFirstAccount.Caption := AccNm
  else begin
    LblFirstAccount.Caption := '';
    DMAccMap.SetMapAcc(AccrualAcc, 0);
  end;

  (Sender as TEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.EdtSecondAccountEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.EdtSecondAccountExit(Sender: TObject);
var
  AccNm: ShortString;
begin
  if DMAccMap.CheckAccnt(PaymentAcc, EdtSecondAccount.Text, AccNm) then
    LblSecondAccount.Caption := AccNm
  else begin
    LblSecondAccount.Caption := '';
    DMAccMap.SetMapAcc(PaymentAcc, 0);
  end;

  (Sender as TEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.BtnFirstAccountClick(Sender: TObject);
var
  nKdSch: integer;
  cSchBU, cNmSBU: string;
begin
  nKdSch := DMAccMap.GetMapAcc(AccrualAcc);
  if SelectFromSBURef(nKdSch, cSchBU, cNmSBU) then begin
    DMAccMap.SetMapAcc(AccrualAcc, nKdSch);
    EdtFirstAccount.Text := cSchBU;
    LblFirstAccount.Caption := cNmSBU;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.BtnSecondAccountClick(Sender: TObject);
var
  nKdSch: integer;
  cSchBU, cNmSBU: string;
begin
  nKdSch := DMAccMap.GetMapAcc(PaymentAcc);
  if SelectFromSBURef(nKdSch, cSchBU, cNmSBU) then begin
    DMAccMap.SetMapAcc(PaymentAcc, nKdSch);
    EdtSecondAccount.Text := cSchBU;
    LblSecondAccount.Caption := cNmSBU;
  end;
end;

//------------------------------------------------------------------------------
function TFrmAccountMap.SelectFromSBURef(var nKdSBU: integer; var cSchBU, cNmSBU: string): boolean;
var
  cPSch: string;
  bHasChild: boolean;
begin
  Result := GetSBU(nKdSBU, cSchBU, cPSch, cNmSBU, bHasChild); {A_SBU}
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.BtnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Сопоставление счетов для счёта '
      + LblBaseAccNum.Caption + ' '
      + LblBaseAccName.Caption + ' будет удалено.'
      , mtConfirmation, mbOKCancel, 0) = 1 then begin
    DMAccMap.DeleteMapping;
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAccountMap.BtnOkClick(Sender: TObject);
var
  cMessage: string;
  bFirstProvided,
  bSecondProvided: boolean;

  function AddMessage(cMessage, cPart: string): string;
  begin
    if cMessage <> '' then
      cMessage := cMessage + Chr(13) + Chr(10);

    Result := cMessage + cPart;
  end;
begin
  cMessage := '';

  if DMAccMap.GetMapAcc(AccrualAcc) = 0 then begin
    cMessage := AddMessage(cMessage, 'Не указан счёт для начислений/удержаний.');
    bFirstProvided := false;
  end else
    bFirstProvided := true;

  if DMAccMap.GetMapAcc(PaymentAcc) = 0 then begin
    cMessage := AddMessage(cMessage, 'Не указан счёт для обязательных платежей.');
    bSecondProvided := false;
  end else
    bSecondProvided := true;

  if bFirstProvided and bSecondProvided then begin
    DMAccMap.ApplyMapping;
    Close;
  end else if not bFirstProvided and not bSecondProvided then
    ShowMessage(cMessage)
  else if MessageDlg(cMessage, mtConfirmation, mbOKCancel, 0) = 1 then begin
    DMAccMap.ApplyMapping;
    Close;
  end;
end;

end.
