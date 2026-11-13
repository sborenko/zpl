unit z_VbDMY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ComCtrls, StdCtrls, Mask, DBCtrls, DB, DBClient, Buttons;

type
  TFormGetDMY = class(TForm)
    PageControl: TPageControl;
    tsY: TTabSheet;
    tsMY: TTabSheet;
    tsDMY: TTabSheet;
    tsY2: TTabSheet;
    tsMY2: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tsDMY2: TTabSheet;
    cdsTmp: TClientDataSet;
    cdsTmpYear1: TSmallintField;
    cdsTmpYear2: TSmallintField;
    cdsTmpDate1: TDateField;
    cdsTmpDate2: TDateField;
    DBEdit1: TDBEdit;
    UpDown1: TUpDown;
    DBEdit2: TDBEdit;
    UpDown2: TUpDown;
    DBEdit4: TDBEdit;
    LabelTs1: TLabel;
    DataSource1: TDataSource;
    UpDownTsY: TUpDown;
    MaskEdit1: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDownTsYChanging(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
    n_Year1 : integer;
  public
    { Public declarations }
  end;

function GetYear(cCaption, cMsg : string; var nYear : integer) : boolean;

const SECTION = 'z_VbDMY';

var
  FormGetDMY: TFormGetDMY;

implementation

uses a_Const, a_Lib, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetYear(cCaption, cMsg : string; var nYear : integer) : boolean;
begin
  Result := false;
  FormGetDMY := TFormGetDMY.Create(Application);
  with FormGetDMY do begin
    Caption := cCaption;
    PageControl.ActivePage := tsY;
    LabelTs1.Caption := cMsg;
    UpDownTsY.Max := nCtrlGod;
    UpDownTsY.Min := 2000;
    if nYear <> 0 then
      UpDownTsY.Position := nYear
    else if n_Year1 <> 0 then
      UpDownTsY.Position := n_Year1;
    cdsTmp.FieldByName('Year1').AsInteger := UpDownTsY.Position;
    if ShowModal = mrOk then begin
      nYear := UpDownTsY.Position;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetDMY.UpDownTsYChanging(Sender: TObject;
                                                     var AllowChange: Boolean);
begin
  cdsTmp.FieldByName('Year1').AsInteger := UpDownTsY.Position;
end;
//------------------------------------------------------------------------------
procedure TFormGetDMY.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    n_Year1 := ReadInteger(SECTION, 'nY1', 0);
    Free;
  end;
  tsY.TabVisible := false;
  tsMY.TabVisible := false;
  tsDMY.TabVisible := false;
  tsY2.TabVisible := false;
  tsMY2.TabVisible := false;
  tsDMY2.TabVisible := false;
  with cdsTmp do begin
    CreateDataSet;
    Open;
    Edit;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetDMY.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nY1', cdsTmp.FieldByName('Year1').AsInteger);
    Free;
  end;
end;

end.
