unit z_EBnkLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DBTables, DB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,
  AxCtrls, OleCtrls, TTF160_TLB, ComCtrls, DBClient, Mask, DBCtrls, Menus;

type
  TFormEABnkLS = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qryLS: TQuery;
    qryTmp: TQuery;
    OpenDialog: TOpenDialog;
    cdsUpd: TClientDataSet;
    cdsUpdNR: TAutoIncField;
    cdsUpdID: TStringField;
    cdsUpdKdBnk: TSmallintField;
    cdsUpdOldLS: TStringField;
    cdsUpdNewLS: TStringField;
    cdsUpdTabN: TIntegerField;
    cdsUpdNmOper: TStringField;
    PageControl0: TPageControl;
    ts0_Pkt: TTabSheet;
    ts0_Add: TTabSheet;
    PageControl: TPageControl;
    ts2_1: TTabSheet;
    sBtnWriteEx: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LabelSample: TLabel;
    ts2_2: TTabSheet;
    sBtnGo1: TSpeedButton;
    sBtnBack1: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    ts2_3: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    sBtnGo2: TSpeedButton;
    sBtnBack2: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    F6B: TF6Book;
    dbgrPkt: TDBGrid;
    Splitter1: TSplitter;
    dbgrPktDet: TDBGrid;
    qryPkt: TQuery;
    dsrcPkt: TDataSource;
    qryPktNRPKT: TIntegerField;
    qryPktKDUSR: TSmallintField;
    qryPktDTBEG: TDateTimeField;
    qryPktNmUsr: TStringField;
    qryPktDet: TQuery;
    dsrcPktDet: TDataSource;
    cdsTmp: TClientDataSet;
    cdsTmpKdBnk: TSmallintField;
    cdsTmpDtBeg: TDateField;
    cdsTmpShBnk: TStringField;
    cdsTmpNmBnk: TStringField;
    Label19: TLabel;
    dbeKdBnk: TDBEdit;
    DataSource1: TDataSource;
    Label20: TLabel;
    dbeShBnk: TDBEdit;
    Label21: TLabel;
    dbeNmBnk: TDBEdit;
    sBtnBank: TSpeedButton;
    Label22: TLabel;
    dbeDtBeg: TDBEdit;
    sBtnAddPkt: TSpeedButton;
    popPkt: TPopupMenu;
    popPktHead: TMenuItem;
    popPktAdd: TMenuItem;
    popPktDel: TMenuItem;
    qryPktKDBNK: TSmallintField;
    qryPktShBnk: TStringField;
    qryPktDetFAM: TStringField;
    qryPktDetIMA: TStringField;
    qryPktDetOTCH: TStringField;
    qryPktDetID: TStringField;
    qryPktDetNR: TIntegerField;
    qryPktDetTABN: TIntegerField;
    qryPktDetDTBEG: TDateTimeField;
    qryPktDetLICSCH: TStringField;
    qryPktDetKDBNK: TSmallintField;
    qryPktDetNOTES: TStringField;
    qryPktDetNRPKT: TIntegerField;
    qryPktDetKDUSR: TSmallintField;
    qryPktDetFamIO: TStringField;
    sBtnBack0: TSpeedButton;
    LabelNewNrPkt: TLabel;
    LabelMsg: TLabel;
    cdsUpdDtBeg: TDateField;
    procedure F6BDblClick(ASender: TObject; nRow, nCol: Integer);
    procedure sBtnWriteExClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnBack1Click(Sender: TObject);
    procedure sBtnGo1Click(Sender: TObject);
    procedure sBtnBack2Click(Sender: TObject);
    procedure sBtnGo2Click(Sender: TObject);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure qryPktDetCalcFields(DataSet: TDataSet);
    procedure popPktPopup(Sender: TObject);
    procedure popPktAddClick(Sender: TObject);
    procedure popPktDelClick(Sender: TObject);
    procedure sBtnBack0Click(Sender: TObject);
    procedure cdsTmpCalcFields(DataSet: TDataSet);
    procedure sBtnBankClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
    cSvLastFileNm, cSvInitOpenDir : ShortString;
    c_FileNm : ShortString;
    nMaxNrPkt : integer;
    procedure OpenQryPkt;
    procedure OpenQryPktDet;
    procedure OpenQryLS(nKdBnk : SmallInt);
    procedure MyUpdateRecord(nTabN : integer; nKdBnk : SmallInt;
                              dDtBeg : TDateTime; cNewLS, cNotes : ShortString);
    procedure MyAddRecord(nTabN : integer; nKdBnk : SmallInt;
                              dDtBeg : TDateTime; cNewLS, cNotes : ShortString);
  public
    { Public declarations }
  end;

procedure EABnkLS;

const SECTION = 'z_EBnkLS';

var
  FormEABnkLS: TFormEABnkLS;

implementation

uses A_Const, A_DM, A_Lib, Z_DM, Z_Main, z_EBnkL2, Z_ShwBnk;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure EABnkLS;
begin
  FormEABnkLS := TFormEABnkLS.Create(Application);
  with FormEABnkLS do begin
    Caption := 'Пакеты банковских лицевых счетов';
    OpenQryPkt;
    OpenQryPktDet;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.OpenQryPkt;
begin
  with qryPkt do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct LS.NrPkt, LS.KdUsr, usrs.Notes as NmUsr, ' +
            ' LS.KdBnk, bnk.ShBnk, LS.DtBeg from z_BankiLS LS ' +
            ' Left Outer Join usrs on usrs.KdUsr = LS.KdUsr ' +
            ' Left Outer Join Z_Banki bnk on Bnk.KdBnk = LS.KdBnk ' +
            ' where not NrPkt is NULL ');
    Open;
    Last;
    nMaxNrPkt := qryPktNrPkt.AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.OpenQryPktDet;
begin
  with qryPktDet do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPkt;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, u.ID, LS.* from z_BankiLS LS ' +
            ' Left Outer Join z_Upi u on u.TabN = LS.TabN ' +
            ' where NrPkt = :NrPkt');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.FormCreate(Sender: TObject);
begin
  LabelMsg.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 635);
    dbgrPkt.Width  := ReadInteger(SECTION, 'grPktW', 260);
    cSvInitOpenDir := ReadString(SECTION, 'cSvDir', '');
    cSvLastFileNm  := ReadString(SECTION, 'cSvFNm', '');
    if cSvInitOpenDir > '' then
      OpenDialog.InitialDir := cSvInitOpenDir;
    Free;
  end;
  ts0_Pkt.TabVisible := false;
  ts0_Add.TabVisible := false;
  PageControl0.ActivePage := ts0_Pkt;
  ts2_1.TabVisible := false;
  ts2_2.TabVisible := false;
  ts2_3.TabVisible := false;
  PageControl.Height := 100;
  PageControl.ActivePage := ts2_1;
  if FileExists(cDirVids + 'PktLS_1.vid') then
    dbgrPkt.Columns.LoadFromFile(cDirVids + 'PktLS_1.vid');
  if FileExists(cDirVids + 'PktLS_2.vid') then
    dbgrPktDet.Columns.LoadFromFile(cDirVids + 'PktLS_2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPkt.Columns.SaveToFile(cDirVids + 'PktLS_1.vid');
  dbgrPktDet.Columns.SaveToFile(cDirVids + 'PktLS_2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grPktW', dbgrPkt.Width);
    WriteString(SECTION, 'cSvDir', cSvInitOpenDir);
    WriteString(SECTION, 'cSvFNm', cSvLastFileNm);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.OpenQryLS(nKdBnk : SmallInt);
begin
  with qryLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.ID, u.Fam, u.Ima, u.Otch, bs.* ' +
            ' from z_BankiLS bs ' +
            ' Left outer join z_Upi u on u.TabN = bs.TabN ' +
            ' where bs.KdBnk = :nKdBnk ' +
            ' order by u.ID, u.Fam, u.Ima, u.Otch');
    ParamByName('nKdBnk').AsInteger := nKdBnk;        
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.F6BDblClick(ASender: TObject; nRow, nCol: Integer);
var n_Row : integer; cFamIO, cLS, cID, cOldLS, cMsg : ShortString;
begin
  n_Row := nRow;
  with F6B do begin
    cFamIO := Trim(TextRC[n_Row, 2]);
    cLS := Trim(TextRC[n_Row, 1]);
    cID := Trim(TextRC[n_Row, 3]);
  end;
  if qryLS.Locate('ID', cID, []) then begin
    cOldLS := qryLS.FieldByName('LicSch').AsString;
    cMsg := cFamIO + '.' + #13#10 + 'Заменить лицевой счет:' +  #13#10 +
            '"' + cOldLS + '" на' + #13#10 +
            '"' + cLS + '"?:';
    if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

    end; end
  else begin
    if MessageDlg('Ввести лицевой счет сотруднику ' + cFamIO + '?:',
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.sBtnWriteExClick(Sender: TObject);
begin
  OpenDialog.InitialDir := cSvInitOpenDir;
  OpenDialog.FileName := cSvLastFileNm;
  if OpenDialog.Execute then begin
    cSvLastFileNm := OpenDialog.FileName;
    c_FileNm := ExtractFileName(cSvLastFileNm);
    cSvInitOpenDir := ExtractFileDir(OpenDialog.FileName) + '\';
    F6B.ReadEx(cSvLastFileNm);
    F6B.BackColor := clCream;
    LabelSample.Visible := false;
    PageControl.ActivePage := ts2_2;
    ActiveControl := dbeKdBnk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.sBtnBack1Click(Sender: TObject);
begin
  sBtnGo1.Enabled := true;
  sBtnGo2.Enabled := true;
  PageControl.ActivePage := ts2_1;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.sBtnGo1Click(Sender: TObject);
var iRow : integer; i, nKdBnk, nMyConst : SmallInt;
    cFamIO, cLS, cID, cOldLS, cNotes : ShortString;
    bMore, bNeedUpd : boolean;
    dDtBeg : TDateTime;
begin
  if dbeKdBnk.Field.IsNull or (dbeKdBnk.Field.AsString = '') or
        MyEmptyDate(dbeDtBeg.Field.AsString) then begin
    ShowMessage('Должны быть заполнены поля "Кодбанка" и "Начиная с:"');
    dbeKdBnk.SetFocus;
    Exit;
  end;
  nKdBnk := dbeKdBnk.Field.AsInteger;
  dDtBeg := dbeDtBeg.Field.AsDateTime;
  LabelMsg.Visible := true;
  //if not qryLS.Active then
  OpenQryLS(nKdBnk);
  with cdsUpd do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  cNotes := 'xxx';
  iRow := 0;
  i := 0;
  bMore := true;
  while bMore do begin
    with F6B do begin
      nMyConst := RowHeight[1];
      Inc(iRow);
      SetSelection(iRow, 1, iRow, 1);
      cFamIO := Trim(TextRC[iRow, 2]);
      cLS := Trim(TextRC[iRow, 1]);
      cID := Trim(TextRC[iRow, 3]);
      if cFamIO = '' then begin
        bMore := false; end
      else begin
        Inc(i);
        LabelMsg.Caption := '  ' + IntToStr(i) + '. ' + cFamIO + '. ИД ' +
                                                       cID + '. ЛС ' + cLS;
        LabelMsg.Refresh;
        if qryLS.Locate('DtBeg;ID', VarArrayOf([dDtBeg, cID]), []) then begin
          bNeedUpd := false;
          cOldLS := qryLS.FieldByName('LicSch').AsString;
          if cOldLS <> cLS then begin
            bNeedUpd := true;
            cdsUpd.Append;
            cdsUpdTabN.AsInteger   := qryLS.FieldByName('TabN').AsInteger;
            cdsUpdID.AsString      := qryLS.FieldByName('ID').AsString;
            cdsUpdNmOper.AsString  := 'Update';
            cdsUpdKdBnk.AsInteger  := nKdBnk;
            cdsUpdDtBeg.AsDateTime := dDtBeg;
            cdsUpdOldLS.AsString   := qryLS.FieldByName('LicSch').AsString;
            cdsUpdNewLS.AsString   := cLS;
            cdsUpd.Post;
          end;
          if bNeedUpd then
            TextRC[iRow, 4] := 'Нужно править.'
          else
            TextRC[iRow, 4] := 'OK.'; end
        else begin
          if qryTmp.Active then
            qryTmp.Close;
          qryTmp.SQL.Clear;
          qryTmp.DataBaseName := CESMAIN;
          qryTmp.SQL.Add('Select * from Z_UPI where ID = :cID');
          qryTmp.ParamByName('cID').AsString := cID;
          qryTmp.Open;
          if qryTmp.RecordCount > 0 then begin
            TextRC[iRow, 4] := 'Добавить в BankiLS';
            while not qryTmp.Eof do begin
              cdsUpd.Append;
              cdsUpdTabN.AsInteger   := qryTmp.FieldByName('TabN').AsInteger;
              cdsUpdID.AsString      := qryTmp.FieldByName('ID').AsString;
              cdsUpdNmOper.AsString  := 'Append';
              cdsUpdKdBnk.AsInteger  := nKdBnk;
              cdsUpdDtBeg.AsDateTime := dDtBeg;
              cdsUpdOldLS.AsString   := '';
              cdsUpdNewLS.AsString   := cLS;
              cdsUpd.Post;
              qryTmp.Next;
            end; end
          else
            TextRC[iRow, 4] := 'Не найден в УПИ ID "' + cID + '"';
        end;
      end;
      ColWidth[4] := Round(nMyConst * 35);
    end;
  end;
  qryLS.Close; // чтобы, в случае повторного прохода, переоткрылся с результатами
  if bFlagDbg then
    cdsUpd.SaveToFile(cDirTemp + 'BankiLS.cds');
  sBtnGo1.Enabled := false;
  PageControl.ActivePage := ts2_3;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.sBtnBack2Click(Sender: TObject);
begin
  LabelMsg.Caption := '';
  PageControl.ActivePage := ts2_2;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.sBtnGo2Click(Sender: TObject);
var cNotes : ShortString; i : SmallInt;
begin
  LabelMsg.Caption := '';
  LabelMsg.Refresh;
  nMaxNrPkt := nMaxNrPkt + 1;
  cNotes := c_FileNm + ' ' + DateToStr(Date);
  if Length(cNotes) > 25 then
    cNotes := Copy(cNotes, 1, 25);
  i := 0;
  with cdsUpd do begin
    First;
    while not Eof do begin
      Inc(i);
      LabelMsg.Caption := '  ' + IntToStr(i) + '. ' + cdsUpdTabN.AsString + '. ' +
                        cdsUpdKdBnk.AsString + '. ' + cdsUpdNewLS.AsString;
      LabelMsg.Refresh;
      if (cdsUpdNmOper.AsString = 'Update') then
        MyUpdateRecord(cdsUpdTabN.AsInteger, cdsUpdKdBnk.AsInteger,
                          cdsUpdDtBeg.AsDateTime, cdsUpdNewLS.AsString, cNotes)
      else if cdsUpdNmOper.AsString = 'Append' then
        MyAddRecord(cdsUpdTabN.AsInteger, cdsUpdKdBnk.AsInteger,
                          cdsUpdDtBeg.AsDateTime, cdsUpdNewLS.AsString, cNotes);
      Next;
    end;
    LabelMsg.Caption := '  Выполнено операций: ' + IntToStr(i);
    sBtnGo2.Enabled := false;
  end;
  qryPkt.Close;
  qryPkt.Open;
  qryPkt.Last;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.MyUpdateRecord(nTabN : integer; nKdBnk : SmallInt;
                              dDtBeg : TDateTime; cNewLS, cNotes : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update z_BankiLS set LicSch = :cNewLS, Notes = :cNotes, ' +
            ' NrPkt = :nNrPkt, KdUsr = :nKdUsr ' +
            ' where TabN = :nTabN and KdBnk = :nKdBnk and DtBeg = :dDtBeg');
    ParamByName('cNewLS').AsString   := cNewLS;
    ParamByName('nKdBnk').AsInteger  := nKdBnk;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('cNotes').AsString   := cNotes;
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('nNrPkt').AsInteger  := nMaxNrPkt;
    ParamByName('nKdUsr').AsInteger  := nAppKdUsr;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.MyAddRecord(nTabN : integer; nKdBnk : SmallInt;
                             dDtBeg : TDateTime; cNewLS, cNotes : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_BankiLS (TabN, LicSch, KdBnk, DtBeg, Notes, ' +
            ' NrPkt, KdUsr) values (:nTabN, :cNewLS, :nKdBnk, :dDtBeg, ' +
            ' :cNotes, :nNrPkt, :nKdUsr)');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('cNewLS').AsString   := cNewLS;
    ParamByName('nKdBnk').AsInteger  := nKdBnk;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('cNotes').AsString   := cNotes;
    ParamByName('nNrPkt').AsInteger  := nMaxNrPkt;
    ParamByName('nKdUsr').AsInteger  := nAppKdUsr;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.qryPktDetCalcFields(DataSet: TDataSet);
begin
  qryPktDetFamIO.AsString := MyFamIO(qryPktDetFam.AsString,
                                 qryPktDetIma.AsString, qryPktDetOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.popPktPopup(Sender: TObject);
begin
  popPktDel.Enabled := qryPkt.Active and (qryPkt.RecordCount > 0);
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.popPktAddClick(Sender: TObject);
begin
  sBtnAddPkt.Enabled := false;
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    FieldByName('DtBeg').AsDateTime := Date;
  end;
  LabelNewNrPkt.Caption := 'Вводится пакет № ' + IntToStr(nMaxNrPkt + 1);
  LabelNewNrPkt.Visible := true;
  PageControl0.ActivePage := ts0_Add;
//  dbeKdBnk.SetFocus;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.popPktDelClick(Sender: TObject);
var cMsg : ShortString; nNrPkt : integer;
begin
  nNrPkt := qryPktNrPkt.AsInteger;
  cMsg := 'Безвозвратно удаляются все лицевые счета, ' +
          'введенные пакетом ' + IntToStr(nNrPkt) + '. Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then
                                                     with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from z_BankiLS where NrPkt = :nNrPkt');
    ParamByName('nNrPkt').AsInteger := nNrPkt;
    ExecSQL;
    qryPkt.Close;
    qryPkt.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.sBtnBack0Click(Sender: TObject);
begin
  cdsTmp.Close;
  PageControl0.ActivePage := ts0_Pkt;
  sBtnAddPkt.Enabled := true;
    LabelNewNrPkt.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.cdsTmpCalcFields(DataSet: TDataSet);
var cShBnk, cNmBnk : ShortString;
begin
  if not cdsTmpKdBnk.IsNull and (cdsTmpKdBnk.AsString > '') then begin
    cNmBnk := DmMain.KdBnk2NmBnk(cdsTmpKdBnk.AsInteger, cShBnk);
    cdsTmpNmBnk.AsString := cNmBnk;
    cdsTmpShBnk.AsString := cShBnk; end
  else begin
    cdsTmpNmBnk.AsString := '';
    cdsTmpShBnk.AsString := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.sBtnBankClick(Sender: TObject);
var nKdBnk : SmallInt; cDummy : ShortString;
begin
  dbeKdBnk.SetFocus;
  if dbeKdBnk.Field.IsNull then
    nKdBnk := 0
  else
    nKdBnk := dbeKdBnk.Field.AsInteger;
  if GetZplBank(nKdBnk, cDummy, cDummy) {Z_ShwBnk} then begin
    dbeKdBnk.Field.AsInteger := nKdBnk;
    dbeDtBeg.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBK;
end;
//------------------------------------------------------------------------------
procedure TFormEABnkLS.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
