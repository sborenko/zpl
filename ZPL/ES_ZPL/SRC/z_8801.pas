unit z_8801;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFrmAddRecalc = class(TForm)
    PanelTop: TPanel;
    BtnGo: TBitBtn;
    BtnCancel: TBitBtn;
    PanelTask: TPanel;
    LblVidN: TLabel;
    EdtVidN: TEdit;
    EdtVidNNm: TEdit;
    GrBxSpan: TGroupBox;
    LblFrom: TLabel;
    LblTo: TLabel;
    EdtDtBeg: TEdit;
    EdtDtEnd: TEdit;
    RadioAll: TRadioButton;
    RadioDept: TRadioButton;
    RadioList: TRadioButton;
    EdtDeptId: TEdit;
    EdtDeptNm: TEdit;
    MemoList: TMemo;
    QryDel: TQuery;
    qrySps: TQuery;
    dsrcSps: TDataSource;
    dbgrSps: TDBGrid;
    QryIns: TQuery;
    QryPeek: TQuery;
    procedure BtnGoClick(Sender: TObject);
    procedure EdtVidNExit(Sender: TObject);
    procedure EdtDeptIdExit(Sender: TObject);
  private
    DtProc: TDateTime;

    procedure CheckVidN;
    procedure CheckDept;

    procedure PrepareDelQry;
    procedure PrepareInsQry;

    procedure ProcSps;
    procedure ProcEmpl(TabN, KdSps: Integer);

    procedure DeleteOldRecalc(TabN: Integer);
    procedure InsertNewRecalc(TabN, KdSps: Integer; Date: TDateTime);

    procedure OpenQrySps;
  public
    class procedure Run(DtPrc: TDateTime);
  end;

implementation

uses
  a_Const, a_Dm, z_DM, z_Main, DateLib, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmAddRecalc.Run(DtPrc: TDateTime);
var
  DateStr: ShortString;
begin
  with TFrmAddRecalc.Create(nil) do begin
    DtProc := DtPrc;

    DateStr := DateToStr(DtProc);

    EdtDtBeg.Text := DateStr;
    EdtDtEnd.Text := DateStr;

    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.BtnGoClick(Sender: TObject);
begin
  PrepareDelQry;
  PrepareInsQry;

  OpenQrySps;
  ProcSps;
  QryUtils.ReleaseQuery(QrySps);

  QryDel.UnPrepare;
  QryIns.UnPrepare;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.ProcSps;
begin
  with QrySps do begin
    First;

    while not Eof do begin
      ProcEmpl(FieldByName('TabN').AsInteger, FieldByName('KdSps').AsInteger);

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.ProcEmpl(TabN, KdSps: Integer);
var
  CurDt, DtEnd: TDateTime;
begin
  CurDt := StrToDate(EdtDtBeg.Text);
  DtEnd := StrToDate(EdtDtEnd.Text);

  DeleteOldRecalc(TabN);

  while CurDt <= DtEnd do begin
    InsertNewRecalc(TabN, KdSps, CurDt);

    CurDt := DateUtils.NextMonth(CurDt);
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.OpenQrySps;
var
  FldsClause, WhereClause: ShortString;
begin
  QryUtils.InitQuery(QrySps);

  with qrySps do begin
    FldsClause := 'TabN';
    WhereClause := 'DtProc = :DtProc';

    if RadioAll.Checked then
      // »спользуем KdSps пользовател€
      FldsClause := FldsClause + ', ' + IntToStr(gl_nAppKdSpsUsr) + ' KdSps'

    else if RadioDept.Checked then begin
      // »спользуем KdSps из списка мес€ца подразделени€
      FldsClause := FldsClause + ', KdSps';

      WhereClause := WhereClause +
        ' and KdObj = :DeptId';

    end else if RadioDept.Checked then begin
      // »спользуем KdSps пользовател€
      FldsClause := FldsClause + ', ' + IntToStr(gl_nAppKdSpsUsr) + ' KdSps';

      WhereClause := WhereClause +
        ' and TabN in (' +
          MemoList.Text +
        ')';
    end;

    SQL.Text :=
      'select distinct ' + FldsClause + ' ' +
      'from z_Sps ' +
      'where ' + WhereClause;

    ParamByName('DtProc').AsDateTime := DtProc;

    if RadioDept.Checked then
      ParamByName('DeptId').AsInteger := StrToInt(EdtDeptId.Text);

    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.PrepareDelQry;
begin
  QryUtils.InitQuery(QryDel);

  with QryDel do begin
    SQL.Text :=
      'delete ' +
      'from z_Otkl ' +
      'where TabN = :TabN ' +
        'and DtProc = :DtProc ' +
        'and VidN = :VidN';
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.PrepareInsQry;
begin
  QryUtils.InitQuery(QryIns);

  with QryIns do begin
    SQL.Text :=
      'insert ' +
      'into z_Otkl (' +
        'TabN, KdSps, DtProc, Dt_Beg, Dt_End, ZaMesGod, VidN' +
      ') ' +
      'values (' +
        ':TabN, :KdSps, :DtProc, :DtBeg, :DtEnd, :ZaMG, :VidN' +
      ')';
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.DeleteOldRecalc(TabN: Integer);
begin
  with QryDel do begin
    ParamByName('TabN').AsInteger := TabN;
    ParamByName('DtProc').AsDateTime := DtProc;
    ParamByName('VidN').AsString := EdtVidN.Text;

    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.InsertNewRecalc(TabN, KdSps: Integer; Date: TDateTime);
var
  DtBeg, DtEnd: TDateTime;
begin
  with QryIns do begin
    ParamByName('TabN').AsInteger := TabN;
    ParamByName('KdSps').AsInteger := KdSps;
    ParamByName('DtProc').AsDateTime := DtProc;
    ParamByName('DtBeg').AsDateTime := Date;
    ParamByName('DtEnd').AsDateTime := Date;
    ParamByName('ZaMG').AsDateTime := Date;
    ParamByName('VidN').AsString := EdtVidN.Text;

    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.EdtVidNExit(Sender: TObject);
begin
  CheckVidN;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.EdtDeptIdExit(Sender: TObject);
begin
  CheckDept;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.CheckVidN;
begin
  QryUtils.PeekVidN(QryPeek, EdtVidN.Text);

  EdtVidNNm.Text := QryPeek.FieldByName('NmVidN').AsString;
  
  QryPeek.Close;
end;

//------------------------------------------------------------------------------
procedure TFrmAddRecalc.CheckDept;
begin
  QryUtils.PeekDept(QryPeek, StrToInt(EdtDeptId.Text));

  EdtDeptNm.Text := QryPeek.FieldByName('NmObj').AsString;

  QryPeek.Close;
end;

end.
