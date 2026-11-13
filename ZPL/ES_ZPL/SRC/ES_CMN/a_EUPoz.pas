unit a_EUPoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, Mask, DBCtrls, DB, DBTables;

type
  TFormEAUPoz = class(TForm)
    Label1: TLabel;
    dbeKPr: TDBEdit;
    Label2: TLabel;
    dbeSpecNaim: TDBEdit;
    Label3: TLabel;
    dbeSchet: TDBEdit;
    Label4: TLabel;
    dbeBSchet: TDBEdit;
    Label5: TLabel;
    dbeZSchet: TDBEdit;
    Label6: TLabel;
    dbeFSchet: TDBEdit;
    Label7: TLabel;
    dbePSmetu: TDBEdit;
    Label8: TLabel;
    dbePLimita: TDBEdit;
    Label9: TLabel;
    dbePPlana: TDBEdit;
    Label10: TLabel;
    dbeNmKFK: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnBSchet: TSpeedButton;
    sBtnFSchet: TSpeedButton;
    sBtnZSchet: TSpeedButton;
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure sBtnBSchetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnZSchetClick(Sender: TObject);
    procedure sBtnFSchetClick(Sender: TObject);
  private
    { Private declarations }
    bEditMode : boolean;
  public
    { Public declarations }
  end;

function EAUPoz : boolean;

const SECTION = 'a_EUPoz';

var
  FormEAUPoz: TFormEAUPoz;

implementation

uses a_Const, a_Dm, a_SBU;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAUPoz : boolean;
begin
  Result := false;
  FormEAUPoz := TFormEAUPoz.Create(Application);
  with FormEAUPoz do begin
    with dbeKPr.DataSource do begin
      if State = dsInsert then begin
        Caption := 'Новая запись';
        bEditMode := false; end
      else begin
        Caption := 'Редактирование записи';
        bEditMode := true;
      end;
    end;

    if ShowModal = mrOk then begin
      Result := true;

    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUPoz.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUPoz.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUPoz.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUPoz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUPoz.sBtnBSchetClick(Sender: TObject);
var nKdSch : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeBSchet.SetFocus;
  with dbeBSchet.DataSource.DataSet as TQuery do begin
    nKdSch := FieldByName('KdB_Sch').AsInteger;
    cSchBU := FieldByName('B_Schet').AsString;
    if GetSBU(nKdSch, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      FieldByName('KdB_Sch').AsInteger  := nKdSch;
      FieldByName('B_Schet').AsString := cSchBU;
      dbeZSchet.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUPoz.sBtnZSchetClick(Sender: TObject);
var nKdSch : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeZSchet.SetFocus;
  with dbeZSchet.DataSource.DataSet as TQuery do begin
    nKdSch := FieldByName('KdZ_Sch').AsInteger;
    cSchBU := FieldByName('Z_Schet').AsString;
    if GetSBU(nKdSch, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      FieldByName('KdZ_Sch').AsInteger  := nKdSch;
      FieldByName('Z_Schet').AsString := cSchBU;
      dbeFSchet.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUPoz.sBtnFSchetClick(Sender: TObject);
var nKdSch : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeFSchet.SetFocus;
  with dbeFSchet.DataSource.DataSet as TQuery do begin
    nKdSch := FieldByName('KdF_Sch').AsInteger;
    cSchBU := FieldByName('F_Schet').AsString;
    if GetSBU(nKdSch, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      FieldByName('KdF_Sch').AsInteger  := nKdSch;
      FieldByName('F_Schet').AsString := cSchBU;
      dbePSmetu.SetFocus;
    end;
  end;
end;

end.
