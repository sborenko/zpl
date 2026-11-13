unit z_MsLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, DB, Mask, DBCtrls, DBClient, ComCtrls, Buttons,
  ExtCtrls, Grids, DBGrids, Provider, DBTables;

type
  TFormChngBnkLS = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PanelTs1: TPanel;
    UpDownCntMes: TUpDown;
    cdsTmp: TClientDataSet;
    cdsTmpNR: TAutoIncField;
    cdsTmpCntSpsMes: TSmallintField;
    cdsTmpOrderCase: TSmallintField;
    cdsTmpKdBnkFrom: TSmallintField;
    cdsTmpKdBnkTo: TSmallintField;
    cdsTmpDtBeg: TDateField;
    cdsTmpNotes: TStringField;
    Label1: TLabel;
    dbeOrderCase: TDBEdit;
    dsrcTmp: TDataSource;
    edCntMes: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    rBtnOneBnk: TRadioButton;
    rBtnAllBnk: TRadioButton;
    Label3: TLabel;
    dbeKdBnkFrom: TDBEdit;
    cdsTmpNmBnkFrom: TStringField;
    DBLNmBnkFrom: TDBLookupComboBox;
    Label4: TLabel;
    dbeCntSpsMes: TDBEdit;
    sBtnGo1: TSpeedButton;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    cdsTmpNmBnkTo: TStringField;
    Label5: TLabel;
    dbeKdBnkTo: TDBEdit;
    Label6: TLabel;
    DBLNmBnkTo: TDBLookupComboBox;
    qryTmp: TQuery;
    cdsSps: TClientDataSet;
    dspTmp: TDataSetProvider;
    dsrcSps: TDataSource;
    dbgrSps: TDBGrid;
    cdsSpsTABN: TIntegerField;
    cdsSpsID: TStringField;
    cdsSpsFAM: TStringField;
    cdsSpsIMA: TStringField;
    cdsSpsOTCH: TStringField;
    cdsSpsDTBEG: TDateTimeField;
    cdsSpsKDBNK: TSmallintField;
    cdsSpsNMBNK: TStringField;
    cdsSpsLICSCH: TStringField;
    cdsSpsFamIO: TStringField;
    SpeedButton1: TSpeedButton;
    procedure UpDownCntMesChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure rBtnOneBnkClick(Sender: TObject);
    procedure edCntMesEnter(Sender: TObject);
    procedure edCntMesExit(Sender: TObject);
    procedure dbeKdBnkFromEnter(Sender: TObject);
    procedure dbeKdBnkFromExit(Sender: TObject);
    procedure DBLNmBnkFromEnter(Sender: TObject);
    procedure DBLNmBnkFromExit(Sender: TObject);
    procedure cdsSpsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    //d_DtPrc : TDateTime;
    procedure CreOpenCdsTmp;
    procedure SetVuborBnkState;
  public
    { Public declarations }
  end;

procedure ShwChngBnk(dDtPrc : TDateTime);

var
  FormChngBnkLS: TFormChngBnkLS;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwChngBnk(dDtPrc : TDateTime);
begin
  FormChngBnkLS := TFormChngBnkLS.Create(Application);
  with FormChngBnkLS do begin
    CreOpenCdsTmp;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.CreOpenCdsTmp;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.UpDownCntMesChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  cdsTmpCntSpsMes.AsInteger := NewValue;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.rBtnOneBnkClick(Sender: TObject);
begin
  SetVuborBnkState;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.SetVuborBnkState;
begin
  dbeKdBnkFrom.Enabled := rBtnOneBnk.Checked;
  DBLNmBnkFrom.Enabled := rBtnOneBnk.Checked;
  Label3.Visible := rBtnOneBnk.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.edCntMesEnter(Sender: TObject);
begin
  edCntMes.Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.edCntMesExit(Sender: TObject);
begin
  edCntMes.Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.dbeKdBnkFromEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.dbeKdBnkFromExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.DBLNmBnkFromEnter(Sender: TObject);
begin
  dblNmBnkFrom.Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.DBLNmBnkFromExit(Sender: TObject);
begin
  dblNmBnkFrom.Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormChngBnkLS.cdsSpsCalcFields(DataSet: TDataSet);
begin
  cdsSpsFamIO.AsString := MyFamIO(cdsSpsFam.AsString, cdsSpsIma.AsString,
                                                       cdsSpsOtch.AsString);
end;

end.
