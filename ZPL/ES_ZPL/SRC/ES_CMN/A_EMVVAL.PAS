unit A_EMvVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, Db, DBTables,
  DBCtrls, IniFiles, ExtCtrls;

type
  TFormEdtAddMovVal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelShifrVal: TLabel;
    dtPicDtBeg: TDateTimePicker;
    DBEdKurs: TDBEdit;
    dsrc_MovVal: TDataSource;
    DBEdKursToUE: TDBEdit;
    DBEdZaNEdBv: TDBEdit;
    Label4: TLabel;
    LabelNmVal1: TLabel;
    LabelNmBv: TLabel;
    DBEdZaNEdUE: TDBEdit;
    Label5: TLabel;
    LabelNmUE: TLabel;
    LabelNmVal2: TLabel;
    Bevel1: TBevel;
    procedure CreOpenTblDm;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtPicDtBegEnter(Sender: TObject);
    procedure dtPicDtBegExit(Sender: TObject);
    procedure DBEdZaNEdBvEnter(Sender: TObject);
    procedure DBEdZaNEdBvExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EdtMovVal(cNmValSokr : string; dsrcMovVal : TDataSource) : boolean;
function AddMovVal(cNmValSokr : string; dsrcMovVal : TDataSource) : boolean;

const SECTION = 'A_EMvVal';

var
  FormEdtAddMovVal: TFormEdtAddMovVal;

implementation

{$R *.DFM}

uses A_Const, A_DM, A_GtVal;

//--------------------------------------------------------------------
function EdtMovVal(cNmValSokr : string; dsrcMovVal : TDataSource) : boolean;
begin
  Result := false;
  FormEdtAddMovVal := TFormEdtAddMovVal.Create(Application);
  with FormEdtAddMovVal do begin
    DBEdZaNEdBv.DataSource := dsrcMovVal;
    DBEdKurs.DataSource := dsrcMovVal;
    DBEdZaNEdUE.DataSource := dsrcMovVal;
    DBEdKursToUE.DataSource := dsrcMovVal;
//    dsrc_MovVal := dsrcMovVal;
    Caption := 'Редактирование записи о курсе';
    LabelShifrVal.Caption := cNmValSokr + ':';
    dtPicDtBeg.Date := dsrcMovVal.DataSet.FieldByName('DtBeg').AsDateTime;
    LabelNmVal1.Caption := cNmValSokr;
    LabelNmBv.Caption := Form_Dm.KdVal2ShVal(nAppKdBazVal);
    Label3.Caption := 'Курс ' + cNmValSokr + ' к Условной Единице:';
    LabelNmVal2.Caption := cNmValSokr;
    if ShowModal = mrOK then begin
      dsrcMovVal.DataSet.FieldByName('DtBeg').AsDateTime := dtPicDtBeg.Date;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
function AddMovVal(cNmValSokr : string; dsrcMovVal : TDataSource) : boolean;
begin
  Result := false;
  FormEdtAddMovVal := TFormEdtAddMovVal.Create(Application);
  with FormEdtAddMovVal do begin
    Caption := 'Новая запись о курсе';
    DBEdZaNEdBv.DataSource := dsrcMovVal;
    DBEdKurs.DataSource := dsrcMovVal;
    DBEdZaNEdUE.DataSource := dsrcMovVal;
    DBEdKursToUE.DataSource := dsrcMovVal;
//    dsrc_MovVal := dsrcMovVal;
    LabelShifrVal.Caption := cNmValSokr + ':';
    dtPicDtBeg.Date := dsrcMovVal.DataSet.FieldByName('DtBeg').AsDateTime;
    LabelNmVal1.Caption := cNmValSokr;
    LabelNmBv.Caption := Form_Dm.KdVal2ShVal(nAppKdBazVal);
    Label3.Caption := 'Курс ' + cNmValSokr + ' к Условной Единице:';
    LabelNmVal2.Caption := cNmValSokr;
    if ShowModal = mrOK then begin
      dsrcMovVal.DataSet.FieldByName('DtBeg').AsDateTime := dtPicDtBeg.Date;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEdtAddMovVal.CreOpenTblDm;
begin
(*
  with tblDm do begin
    if Active then Close;
    if Exists then DeleteTable;
    CreateTable;
    Open;
    Append;
  end;
*)
end;
//--------------------------------------------------------------------
procedure TFormEdtAddMovVal.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
	  Left := ReadInteger(SECTION, 'wL', 200);
	  Top  := ReadInteger(SECTION, 'wT', 200);
	  Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEdtAddMovVal.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
	  Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEdtAddMovVal.dtPicDtBegEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//--------------------------------------------------------------------
procedure TFormEdtAddMovVal.dtPicDtBegExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//--------------------------------------------------------------------
procedure TFormEdtAddMovVal.DBEdZaNEdBvEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//--------------------------------------------------------------------
procedure TFormEdtAddMovVal.DBEdZaNEdBvExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
