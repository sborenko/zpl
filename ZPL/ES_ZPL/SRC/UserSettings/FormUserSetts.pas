unit FormUserSetts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Buttons, ExtCtrls;

type
  TFrmUsrSetts = class(TForm)
    BtnOk: TBitBtn;
    GroupBoxEmplSrch: TGroupBox;
    ChBoxNewEmplSrchDlg: TCheckBox;
    ChBoxOneStepEmplSrch: TCheckBox;
    ChBoxSepVacatDetails: TCheckBox;
    Bevel: TBevel;
    procedure FormShow(Sender: TObject);
    procedure ChBoxNewEmplSrchDlgClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure RefreshControls;
  public
    class procedure Show;
  end;

var
  FrmUsrSetts: TFrmUsrSetts;

implementation

uses
  DModUsrSetts;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmUsrSetts.Show;
begin
  FrmUsrSetts := TFrmUsrSetts.Create(Application);

  with FrmUsrSetts do begin
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSetts.FormShow(Sender: TObject);
begin
  with DmUsrSetts do begin
    ChBoxNewEmplSrchDlg.Checked := NewEmplSrchDlg;
    ChBoxOneStepEmplSrch.Checked := OneStepEmplSrch;
    ChBoxSepVacatDetails.Checked := SepVacatDetails;
  end;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSetts.ChBoxNewEmplSrchDlgClick(Sender: TObject);
begin
  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSetts.RefreshControls;
begin
  ChBoxOneStepEmplSrch.Enabled := ChBoxNewEmplSrchDlg.Checked;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSetts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
    with DmUsrSetts do begin
      NewEmplSrchDlg := ChBoxNewEmplSrchDlg.Checked;
      OneStepEmplSrch := ChBoxOneStepEmplSrch.Checked;
      SepVacatDetails := ChBoxSepVacatDetails.Checked;
  end;
end;

end.
