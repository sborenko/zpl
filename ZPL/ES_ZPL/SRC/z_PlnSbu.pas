unit z_PlnSbu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, DB, DBClient,
  Grids, DBGrids, DBTables;

type
  String10 = string[10];

  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdSBU : SmallInt;
    SchBU : String10;
    PSch  : String10;
    NmSBU : string;
  end;

  TFormTreeView = class(TForm)
    TV: TTreeView;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SplitterSbu: TSplitter;
    dbgrSBU: TDBGrid;
    cdsSvSch: TClientDataSet;
    cdsSvSchKdSch: TSmallintField;
    cdsSvSchSchBU: TStringField;
    cdsSvSchPSch: TStringField;
    dsrcSvSch: TDataSource;
    qryTmp: TQuery;
    sBtnCreObj: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sBtnCreObjClick(Sender: TObject);
  private
    { Private declarations }
    cSvInitDir : ShortString;
      procedure TvSaveToTable;
    public
    { Public declarations }
  end;

procedure WrkWithTreeWiev;

const SECTION = 'z_PlnSbu';

var
  FormTreeView: TFormTreeView;

implementation

uses A_Const, A_Dm, a_Lib, Z_Main, Z_DM, z_EObj, z_ObjGoT, z_EObjCh, z_CmnPrt;


{$R *.dfm}

//------------------------------------------------------------------------------
procedure WrkWithTreeWiev;
begin
  FormTreeView := TFormTreeView.Create(Application);
  with FormTreeView do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTreeView.FormCreate(Sender: TObject);
begin
  Caption := 'Возня с TreeWiev';
  with TIniFile.Create(cNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 300);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 450);
    cSvInitDir := ReadString(SECTION, 'cSvInitDir', '');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTreeView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteString(SECTION, 'cSvInitDir', cSvInitDir);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTreeView.SpeedButton1Click(Sender: TObject);
var  cTxt, cNmFileTxt, cNmBadID : ShortString;
begin
  with FormZpMain.OpenDialog do begin
    if cSvInitDir > '' then
      InitialDir := cSvInitDir
    else
      InitialDir := cDirTemp + 'Temp';
    Filter := 'Текстовые файлы|*.txt';
    Title := 'Выберите файл с лицевыми счетами';
    if Execute then begin
      cSvInitDir := InitialDir;
      cNmFileTxt := FileName;
      cNmBadID := ExtractFileName(FileName);
      cNmBadID := Copy(cNmBadID, 1, Length(cNmBadID)-4); // отсечь .txt
      TV.LoadFromFile(cNmFileTxt);
//      ShowMessage('cNmFileTxt = ' + cNmFileTxt + '; cNmBadID  = ' + cNmBadID);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTreeView.SpeedButton2Click(Sender: TObject);
begin
  TvSaveToTable;  // Сохранено ниже на всякий случай !!!!
end;
//------------------------------------------------------------------------------
procedure TFormTreeView.TvSaveToTable;
var cSchBU, cNmSBU, cHsCh : string;
    i, nCntAdd, nKdSBU, nLvl, nIndx, nAIndx, nPIndx : SmallInt;
begin
  with qryTmp do begin
    if Active then Close;
    DataBaseName := cDirTemp; // CESMAIN;
    SQL.Clear;
    SQL.Add('Delete from sbu_2017.DB');
    ExecSQL;
    SQL.Clear;
//    SQL.Add('Set generator Nr_Kd_SBU to 0');
//    ExecSQL;
    SQL.Clear;
    SQL.Add('Insert into sbu_2017.DB ' +
            ' (KdSch, SchBU, NmSch, AIndx, PIndx, Lvl, Indx, HsCh) ');
    SQL.Add(' values (:nKdSBU, :cSchBU, :cNmSBU, ' +
             ' :nAIndx, :nPIndx, :nLvl, :nIndx, :cHsCh)');
    Prepare;
  end;
  nCntAdd := 0;
  for i := 0 to TV.Items.Count-1 do begin
    nKdSBU := PTreeRec(TV.Items[i].Data)^.KdSBU;
    cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
    cNmSBU := PTreeRec(TV.Items[i].Data)^.NmSBU;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdSBU').AsSmallInt := nKdSBU;
    qryTmp.ParamByName('cSchBU').AsString   := cSchBU;
    qryTmp.ParamByName('cNmSBU').AsString   := cNmSBU;
    qryTmp.ParamByName('nAIndx').AsSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').AsSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').AsSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').AsSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').AsString    := cHsCh;
    qryTmp.ExecSQL;
    Inc(nCntAdd);

  end;
//  Form_Dm.DbMain.Commit;
//  qryTmp.UnPrepare;
//  b_WasUpdated := true;
  //if bFlagDbg then
  //  ShowMessage('Добавлено записей: ' + IntToStr(nCntAdd));
  // Переоткрыть наборы
end;
//------------------------------------------------------------------------------
procedure TFormTreeView.sBtnCreObjClick(Sender: TObject);
var cMsg, cSchBU, cNmsch, cHsCh : ShortString;
    MyTreeRec : PTreeRec;
    i, nPosProbel, nLvl, nAIndx, nIndx, nPIndx, nCntAdd : Smallint;
    bHsCh : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    DataBaseName := cDirTemp; // CESMAIN;
    SQL.Clear;
    SQL.Add('Delete from sbu_2017.DB');
    ExecSQL;
    SQL.Clear;
//    SQL.Add('Set generator Nr_Kd_SBU to 0');
//    ExecSQL;
    SQL.Clear;
    SQL.Add('Insert into sbu_2017.DB ' +
            ' (KdSch, SchBU, NmSch, AIndx, PIndx, Lvl, Indx, HsCh) ');
    SQL.Add(' values (:nKdSBU, :cSchBU, :cNmSBU, ' +
             ' :nAIndx, :nPIndx, :nLvl, :nIndx, :cHsCh)');
    Prepare;
  end;
  nCntAdd := 0;
  for i := 0 to TV.Items.Count-1 do begin
    TV.Items[i].Selected := true;
    cMsg := Trim(TV.Selected.Text);
    nPosProbel := Pos(' ', cMsg);
    cSchBU := Copy(cMsg, 1, nPosProbel-1);
    cNmsch := Copy(cMsg, nPosProbel+1,150);
    nLvl   := TV.Selected.Level;
    nAIndx := TV.Selected.AbsoluteIndex;
    nIndx  := TV.Selected.Index;
    nPIndx := TV.Selected.Parent.Index;
    bHsCh  :=TV.Selected.HasChildren;
{
    //cMsg := 'cShchBU = ' + cSchBU + '; cNmSch = ' + cNmSch;
    //ShowMessage(cMsg);
    MyTreeRec.KdSbu := i;
    MyTreeRec.SchBU := cSchBU;
    MyTreeRec.PSch  := nPSch;
    MyTreeRec.NmSBU :=cNmSch;
    TV.Items[i].Data := MyTreeRec;
}
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdSBU').AsSmallInt := i;  // nKdSBU;
    qryTmp.ParamByName('cSchBU').AsString   := cSchBU;
    qryTmp.ParamByName('cNmSBU').AsString   := cNmSch;
    qryTmp.ParamByName('nAIndx').AsSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').AsSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').AsSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').AsSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').AsString    := cHsCh;
    qryTmp.ExecSQL;
    Inc(nCntAdd);
  end;                       // редактированиях и добавлениях
  ShowMessage('Сохранено залисей в таблицу ' + cDirTemp + 'u_2017.db: ' +
               IntToStr(nCntAdd));

end;

end.
