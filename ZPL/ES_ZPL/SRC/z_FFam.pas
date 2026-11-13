unit z_FFam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  DBCtrls;

type
  TFormFindFam = class(TForm)
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbgrSps: TDBGrid;
    qrySps: TQuery;
    dsrcSps: TDataSource;
    qrySpsTABN: TIntegerField;
    qrySpsKDOBJ: TSmallintField;
    qrySpsFAM: TStringField;
    qrySpsIMA: TStringField;
    qrySpsOTCH: TStringField;
    qrySpsID: TStringField;
    LabelCntRec: TLabel;
    DBNavigator1: TDBNavigator;
    LabelFCase: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrSpsEnter(Sender: TObject);
    procedure dbgrSpsExit(Sender: TObject);
    procedure dbgrSpsDblClick(Sender: TObject);
  private
    { Private declarations }
    nY, nM, nD : word;
    dDtPrcBeg : TDateTime;
    procedure OpenQrySps(cFFam : ShortString; nFindCase : SmallInt;
                                      dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

function GetTabNByFam(cFFam : ShortString; nFindCase : SmallInt;
                      var nTabN : integer; var nKdObj : SmallInt;
                      var cFam, cIma, cOtch : ShortString) : boolean;

const SECTION = 'z_FFam';

var
  FormFindFam: TFormFindFam;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetTabNByFam(cFFam : ShortString; nFindCase : SmallInt;
                      var nTabN : integer; var nKdObj: SmallInt;
                      var cFam, cIma, cOtch : ShortString) : boolean;
begin
  Result := false;
  FormFindFam := TFormFindFam.Create(Application);
  with FormFindFam do begin
    DecodeDate(Date, nY, nM, nD);
    dDtPrcBeg := EncodeDate(nY-1, nM, 1);
    Caption := 'Поиск фамилии по "' + cFFam + '"';
    OpenQrySps(cFFam, nFindCase, dDtPrcBeg);
    bBtnOk.Enabled := qrySps.RecordCount > 0;
    if ShowModal = mrOk then begin
      nTabN := qrySpsTabN.AsInteger;
      nKdObj := qrySpsKdObj.AsInteger;
      cFam := qrySpsFam.AsString;
      cIma := qrySpsIma.AsString;
      cOtch := qrySpsOtch.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindFam.OpenQrySps(cFFam: ShortString; nFindCase: SmallInt;
                                                             dDtPrc: TDateTime);
begin
  cFFam := AnsiUpperCase(cFFam);
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct s.TabN, s.KdObj, u.Fam, u.Ima, u.Otch, u.ID ' +
            ' from Z_Sps s Left Outer Join Z_UPI u on u.TabN = s.TabN ' +
            ' where s.DtProc >= :dDtPrc and ');
    if nFindCase = 1 then
      SQL.Add('Upper(u.Fam) Containing (:cFFam)')
    else
      SQL.Add('Upper(u.Fam) Starting with :cFFam');
    SQL.Add('order by u.Fam, u.Ima, u.Otch, s.KdObj');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('cFFam').AsString := cFFam;
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    if nFindCase = 1 then
      LabelFCase.Caption := 'По входимости "' + cFFam +
                                                '" в любом месте фамилии'
    else
      LabelFCase.Caption := 'По точному совпадению с "' + cFFam +
                                                      '" в начале фамилии';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindFam.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 580);
    Free;
  end;
  if FileExists(cDirVids + 'zFFam.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'zFFam.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFindFam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids  + 'zFFam.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindFam.dbgrSpsEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormFindFam.dbgrSpsExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormFindFam.dbgrSpsDblClick(Sender: TObject);
begin
  if qrySps.RecordCount > 0 then
    ModalResult := mrOk;
end;

end.
