unit Z_VvObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Grids, DBGrids, DB, DBTables, IniFiles,
  StdCtrls, Buttons;

type
  TFormVvObj = class(TForm)
    qryTmp: TQuery;
    dbgrObj: TDBGrid;
    Panel1: TPanel;
    tblObj: TTable;
    dsrcObj: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    sBtnF8: TSpeedButton;
    Label2: TLabel;
    LabelCntSelRec: TLabel;
    LbxF8: TListBox;
    sBtnExec: TSpeedButton;
    bBtnCancel: TBitBtn;
    sBtnSelectAll: TSpeedButton;
    sBtnUnSelectAll: TSpeedButton;
    rBtnForm1: TRadioButton;
    rBtnForm2: TRadioButton;
    LabelFormOtcheta: TLabel;
    GroupBox1: TGroupBox;
    rBtnByVidN: TRadioButton;
    rBtnBySBU: TRadioButton;
    rBtnByKatPers: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrObjDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnF8Click(Sender: TObject);
    procedure dbgrObjKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
    procedure dbgrObjDblClick(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure sBtnExecClick(Sender: TObject);
    procedure sBtnSelectAllClick(Sender: TObject);
    procedure sBtnUnSelectAllClick(Sender: TObject);
    procedure rBtnByVidNClick(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure MakeOpenTblObj(dDtProc : TDateTime);
    procedure SetFormaOtcheta;
  public
    { Public declarations }
  end;

procedure VvodObj(dDtProc : TDateTime; cCaption : string);

const SECTION = 'Z_VvObj';

var
  FormVvObj: TFormVvObj;

implementation

uses A_Const, Z_DM, Z_Main, z_SvVidN;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure VvodObj(dDtProc : TDateTime; cCaption : string);
begin
  Screen.Cursor := crHourGlass;
  FormVvObj := TFormVvObj.Create(Application);
  with FormVvObj do begin
    d_DtProc := dDtProc;
    Caption := cCaption;
    MakeOpenTblObj(dDtProc);
    Screen.Cursor := crDefault;
    ShowModal;
    qryTmp.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.FormCreate(Sender: TObject);
var nSvdCase : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 400);
//    nSvdCase := ReadInteger(SECTION, 'nSvdCase', 1);
    rBtnForm1.Checked := ReadBool(SECTION, 'Spz1', true);
    rBtnForm2.Checked := not rBtnForm1.Checked;
    Free;
  end;
  nSvdCase := 1;
  if nSvdCase = 3 then
    rBtnByKatPers.Checked := true
  else if nSvdCase = 2 then
    rBtnBySBU.Checked := true
  else
    rBtnByVidN.Checked := true;
  SetFormaOtcheta;
  if FileExists(cDirVids + 'Vv_Obj.vid') then
    dbgrObj.Columns.LoadFromFile(cDirVids + 'Vv_Obj.vid');
  LabelCntSelRec.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  dbgrObj.Columns.SaveToFile(cDirVids + 'Vv_Obj.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if rBtnByKatPers.Checked then
      WriteInteger(SECTION, 'nSvdCase', 3)
    else if rBtnBySBU.Checked then
      WriteInteger(SECTION, 'nSvdCase', 2)
    else
      WriteInteger(SECTION, 'nSvdCase', 1);
    WriteBool(SECTION, 'Spz1', rBtnForm1.Checked);
    Free;
  end;
  with tblObj do begin
    if Active then Close;
    if Exists then DeleteTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.MakeOpenTblObj(dDtProc : TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from NU_Obj_DtProc_2 (:dDtProc)');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
  with tblObj do begin
    if Active then Close;
    DataBaseName := cDirInd;
    if Exists then DeleteTable;
    BatchMove(qryTmp, batCopy);
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.dbgrObjDrawColumnCell(Sender: TObject;
                 const Rect: TRect; DataCol: Integer; Column: TColumn;
                                               State: TGridDrawState);
begin
  with dbgrObj.Canvas do begin
    if not (gdFocused in State) then begin
      if (dbgrObj.DataSource.DataSet.
                      FieldByName('Metka').asString = 'Y') then
        Font.Color := clRed
      else
        Font.Color := clBlack;
    end;
  end;  
  dbgrObj.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.sBtnF8Click(Sender: TObject);
var i : integer;
begin
  with tblObj do begin
    Edit;
    if FieldByName('Metka').AsString = 'Y' then begin
      FieldByName('Metka').AsString := '';
      i := LbxF8.Items.IndexOf(FieldByName('KdObj').AsString);
      if i > -1 then
        LbxF8.Items.Delete(i); end
    else begin
      FieldByName('Metka').AsString := 'Y';
      LbxF8.Items.Add(FieldByName('KdObj').AsString)
    end;
    Post;
    if not Eof then
      Next
    else
      dbgrObj.Refresh;
  end;
  if LbxF8.Items.Count > 0 then
    LabelCntSelRec.Caption := 'Выделено записей: ' +
                                       IntToStr(LbxF8.Items.Count)
  else
    LabelCntSelRec.Caption := '';
  sBtnSelectAll.Enabled := tblObj.RecordCount > LbxF8.Items.Count;
  sBtnUnSelectAll.Enabled := LbxF8.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.dbgrObjKeyDown(Sender: TObject;
                                   var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnF8Click(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.dbgrObjDblClick(Sender: TObject);
begin
  sBtnF8Click(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.Panel2Resize(Sender: TObject);
begin
  Panel3.Top := Round((Panel2.Height - Panel3.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.sBtnExecClick(Sender: TObject);
var nSvCntObj : integer;
begin
  nSvCntObj := LbxF8.Items.Count;
  if nSvCntObj = 0 then
    LbxF8.Items.Add(tblObj.FieldByName('KdObj').AsString);
  if rBtnByVidN.Checked then
    Make_SvdVidN(LbxF8, d_DtProc)   {z_SvVidN}
  else if rBtnBySBU.Checked then
    //MakeSvdSPZ(LbxF8, d_DtProc, rBtnForm2.Checked)    {z_SvdZpl}
  else if rBtnByKatPers.Checked then
    //MakeSvdByKatP(LbxF8, d_DtProc);  {z_SvdZpl}
  if nSvCntObj = 0 then
    LbxF8.Clear;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.sBtnSelectAllClick(Sender: TObject);
var i, nSvKdObj : integer;
begin
  with tblObj do begin
    nSvKdObj := FieldByName('KdObj').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      FieldByName('Metka').AsString := 'Y';
      i := LbxF8.Items.IndexOf(FieldByName('KdObj').AsString);
      if i < 0 then
        LbxF8.Items.Add(FieldByName('KdObj').AsString);
      Post;
      Next;
    end;
    Locate('KdObj', nSvKdObj, []);
    EnableControls;
  end;
  dbgrObj.Refresh;
  if LbxF8.Items.Count > 0 then
    LabelCntSelRec.Caption := 'Выделено записей: ' + IntToStr(LbxF8.Items.Count)
  else
    LabelCntSelRec.Caption := '';
  sBtnSelectAll.Enabled := tblObj.RecordCount > LbxF8.Items.Count;
  sBtnUnSelectAll.Enabled := LbxF8.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.sBtnUnSelectAllClick(Sender: TObject);
var i, nSvKdObj : integer;
begin
  with tblObj do begin
    nSvKdObj := FieldByName('KdObj').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      FieldByName('Metka').AsString := '';
      i := LbxF8.Items.IndexOf(FieldByName('KdObj').AsString);
      if i > -1 then
        LbxF8.Items.Delete(i);
      Post;
      Next;
    end;
    Locate('KdObj', nSvKdObj, []);
    EnableControls;
  end;
  dbgrObj.Refresh;
  if LbxF8.Items.Count > 0 then
    LabelCntSelRec.Caption := 'Выделено записей: ' +
                                       IntToStr(LbxF8.Items.Count)
  else
    LabelCntSelRec.Caption := '';
  sBtnSelectAll.Enabled := tblObj.RecordCount > LbxF8.Items.Count;
  sBtnUnSelectAll.Enabled := LbxF8.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.rBtnByVidNClick(Sender: TObject);
begin
  SetFormaOtcheta;
end;
//------------------------------------------------------------------------------
procedure TFormVvObj.SetFormaOtcheta;
begin
  if rBtnBySBU.Checked then begin
    LabelFormOtcheta.Visible := true;
    rBtnForm1.Visible := true;
    rBtnForm2.Visible := true; end
  else begin
    LabelFormOtcheta.Visible := false;
    rBtnForm1.Visible := false;
    rBtnForm2.Visible := false;
  end;
end;

end.
