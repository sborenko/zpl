unit Z_Rkvzt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, ComCtrls, Mask, ExtCtrls;

type
  TFormZpRkvzt = class(TForm)
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    GrBoxStru: TGroupBox;
    RBtnOnlyObj: TRadioButton;
    RBtnObjVed: TRadioButton;
    edDayPerehoda: TEdit;
    UpDownDayPerehoda: TUpDown;
    edMesBegRabotu: TEdit;
    upMesBegRabotu: TUpDown;
    edGodBegRabotu: TEdit;
    upGodBegRabotu: TUpDown;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edFirma: TEdit;
    edDirDolgn: TEdit;
    edDirFIO: TEdit;
    edGlBuhDolgn: TEdit;
    edGlBuhFIO: TEdit;
    edBuhDolgn: TEdit;
    edBuhFIO: TEdit;
    TabSheet3: TTabSheet;
    upLstMaxRow: TUpDown;
    edLstMaxRow: TEdit;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowZpRkvzt;

const SECTION = 'Z_Rkvzt';

var
  FormZpRkvzt: TFormZpRkvzt;

implementation

uses A_Const, A_DM, Z_DM, Z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowZpRkvzt;
begin
  FormZpRkvzt := TFormZpRkvzt.Create(Application);
  with FormZpRkvzt do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpRkvzt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
  edFirma.Text := cFirma;
  edDirDolgn.Text := cDirDolgn;
  edDirFIO.Text := cDirFIO;
  edGlBuhDolgn.Text := cGlBuhDolgn;
  edGlBuhFIO.Text := cGlBuhFIO;
  edBuhDolgn.Text := cBuhDolgn;
  edBuhFIO.Text := cBuhFIO;
  upMesBegRabotu.Position := nMesBegRabotu;
  upGodBegRabotu.Position := nGodBegRabotu;
  upLstMaxRow.Position := nAppLstMaxRow;
  if bAppZpObjVed then
    RBtnObjVed.Checked := true
  else
    RBtnOnlyObj.Checked := true;
  UpDownDayPerehoda.Position := nDayPerehoda;
end;
//------------------------------------------------------------------------------
procedure TFormZpRkvzt.FormCloseQuery(Sender: TObject;
                                      var CanClose: Boolean);
begin
  nMesBegRabotu := upMesBegRabotu.Position;
  nGodBegRabotu := upGodBegRabotu.Position;
  bAppZpObjVed := RBtnObjVed.Checked;
  nDayPerehoda := UpDownDayPerehoda.Position;
  cFirma := edFirma.Text;
  cDirDolgn := edDirDolgn.Text;
  cDirFIO := edDirFIO.Text;
  cGlBuhDolgn := edGlBuhDolgn.Text;
  cGlBuhFIO := edGlBuhFIO.Text;
  cBuhDolgn := edBuhDolgn.Text;
  cBuhFIO := edBuhFIO.Text;
  nAppLstMaxRow := upLstMaxRow.Position;  
end;
//------------------------------------------------------------------------------
procedure TFormZpRkvzt.FormClose(Sender: TObject;
                                   var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpRkvzt.edEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormZpRkvzt.edExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.
