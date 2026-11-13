unit z_EIspS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TformEAIspSlg = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const SECTION = 'z_EIspS';

  function EAISPS: Boolean;
var
  formEAIspSlg: TformEAIspSlg;

implementation

uses A_Const, a_Dm, Z_DM, Z_Main, Z_IspSlg;


{$R *.dfm}

function EAISPS: Boolean;
begin
  Result  := false;
  formEAIspSlg := TformEAIspSlg.Create(Application);
  width formEAIspSlg do begin
    If ShowModal = mrOk then begin
     Result := true;
    end;
    Free;
  end;
end;


end.
