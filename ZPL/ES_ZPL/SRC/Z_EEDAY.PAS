unit Z_EEDay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, IniFiles, DBCtrls, Db,
  DBClient, DBTables;

type
  TFormEdAdEDays = class(TForm)
    dtPicEDate: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edNotes: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    dbeCntHours: TDBEdit;
    cdsTmpCntHours: TFloatField;
    qryTmp: TQuery;
    ChBoxOtp: TCheckBox;
    ChBoxBln: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtPicEDateExit(Sender: TObject);
    function DateAlreadyExists(n_SvNr : integer;
                                     dDate : TDateTime) : boolean;
    procedure dtPicEDateEnter(Sender: TObject);
    procedure dbeCntHoursEnter(Sender: TObject);
    procedure dbeCntHoursExit(Sender: TObject);
    procedure edNotesEnter(Sender: TObject);
    procedure edNotesExit(Sender: TObject);
    procedure ChBoxEnter(Sender: TObject);
    procedure ChBoxExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EdtEDay(nSvNR : integer; var dEDate : TDateTime;
                                     var nCntHours : double;
                                     var cNotes : ShortString;
                                     var bIsOtp, bIsBln : boolean) : boolean;
function AddEDay(var dEDate : TDateTime; var nCntHours : double;
                                     var cNotes : ShortString;
                                     var bIsOtp, bIsBln : boolean) : boolean;

const SECTION = 'Z_EEDay';

var
  FormEdAdEDays: TFormEdAdEDays;
  n_SvNr : integer;
  dLastDate : TDateTime;
  nLastDate : integer;
  bAddMode : boolean;

implementation

uses A_Const;

{$R *.DFM}

//------------------------------------------------------------------------------
function EdtEDay(nSvNR : integer; var dEDate : TDateTime;
                                  var nCntHours : double;
                                  var cNotes : ShortString;
                                  var bIsOtp, bIsBln : boolean) : boolean;
begin
  Result := false;
  n_SvNr := nSvNr;
  bAddMode := false;
  FormEdAdEDays := TFormEdAdEDays.Create(Application);
  with FormEdAdEDays do begin
    Caption := 'Редактирование записи';
    dtPicEDate.Date := dEDate;
    cdsTmp['CntHours'] := nCntHours;
    edNotes.Text    := cNotes;
    ChBoxOtp.Checked := bIsOtp;
    ChBoxBln.Checked := bIsBln;
    if ShowModal = mrOk then begin
      dEDate    := dtPicEDate.Date;
      if cdsTmp.FieldByName('CntHours').isNull or
          (cdsTmp.FieldByName('CntHours').asString = '') then
        nCntHours := 0
      else
        nCntHours := cdsTmp['CntHours'];
      cNotes := edNotes.Text;
      bIsOtp := ChBoxOtp.Checked;
      bIsBln := ChBoxBln.Checked;
      Result := true;
      cdsTmp.Close;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function AddEDay(var dEDate : TDateTime; var nCntHours : double;
              var cNotes : ShortString; var bIsOtp, bIsBln : boolean) : boolean;
begin
  Result := false;
  n_SvNr := 0;
  bAddMode := true;
  FormEdAdEDays := TFormEdAdEDays.Create(Application);
  with FormEdAdEDays do begin
    Caption := 'Новая запись';
    dtPicEDate.Date := dLastDate;
    cdsTmp['CntHours'] := 8;
    edNotes.Text := '';
    if ShowModal = mrOk then begin
      dEDate    := dtPicEDate.Date;
      if cdsTmp.FieldByName('CntHours').isNull or
          (cdsTmp.FieldByName('CntHours').asString = '') then
        nCntHours := 0
      else
        nCntHours := cdsTmp['CntHours'];
      cNotes := edNotes.Text;
      bIsOtp := ChBoxOtp.Checked;
      bIsBln := ChBoxBln.Checked;
      Result := true;
      cdsTmp.Close;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    nLastDate := ReadInteger(SECTION, 'LD',  0);
    Free;
  end;
  if nLastDate = 0 then
    dLastDate := Date
  else
    dLastDate := nLastDate;
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if bAddMode and (ModalResult = mrOk) then
      WriteInteger(SECTION, 'LD', Round(dtPicEDate.Date));
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.dtPicEDateEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.dtPicEDateExit(Sender: TObject);
begin
  if DateAlreadyExists(n_SvNr, dtPicEDate.Date) then begin
    MessageDlg('Введенная дата ' + DateToStr(dtPicEDate.Date) +
               ' уже есть в другой записи.', mtError, [mbOk], 0);
    dtPicEDate.SetFocus; end
  else
    (Sender as TDateTimePicker).Color := clWindow;;
end;
//------------------------------------------------------------------------------
function TFormEdAdEDays.DateAlreadyExists(n_SvNr : integer;
                                                 dDate : TDateTime) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select count(*) as Cnt from E_Days ' +
            ' where (E_Day = :dDate) and (NR <> :nNr)');
    // Выражение годится и для Edt и для Add
    ParamByName('dDate').asDateTime := dDate;
    ParamByName('nNr').asInteger := n_SvNr;
    Open;
    Result := FieldByName('Cnt').asInteger <> 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.dbeCntHoursEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.dbeCntHoursExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.edNotesEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.edNotesExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.ChBoxEnter(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clYellow;;
end;
//------------------------------------------------------------------------------
procedure TFormEdAdEDays.ChBoxExit(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clBtnFace;;
end;

end.
