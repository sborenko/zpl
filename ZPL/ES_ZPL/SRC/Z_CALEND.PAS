unit z_Calend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, IniFiles, Grids, DBGrids,
  DB, DBClient;

type
  TFormMyCalendar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    LabelPn: TLabel;
    LabelVt: TLabel;
    LabelSr: TLabel;
    LabelCht: TLabel;
    LabelPt: TLabel;
    LabelSb: TLabel;
    LabelVs: TLabel;
    Panel2: TPanel;
    sBtnMMinus: TSpeedButton;
    LabelMG: TLabel;
    sBtnMPlus: TSpeedButton;
    Bevel1: TBevel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    cdsDays: TClientDataSet;
    sBtnYMinus: TSpeedButton;
    sBtnYPlus: TSpeedButton;
    Panel3: TPanel;
    sBtnStayOnTop: TSpeedButton;
    LabelBudget: TLabel;
    bBtnClose: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnCloseClick(Sender: TObject);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure sBtnMPlusClick(Sender: TObject);
    procedure sBtnMMinusClick(Sender: TObject);
    procedure LabelMGDblClick(Sender: TObject);
    procedure sBtnYMinusClick(Sender: TObject);
    procedure sBtnYPlusClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    nY, nM, nD : word;
    dCurDate : TDateTime;
    procedure CreCdsDays(dCurDate : TDateTime);
    procedure SetStayOnTop;
    procedure SetLabelMGCaption;
  public
    { Public declarations }
  end;

procedure ShowMyCalendar;

const mSECTION = 'Z_Calend';

var
  FormMyCalendar: TFormMyCalendar;

implementation

uses A_Const, A_Lib, Z_Main, Z_Dm;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowMyCalendar;
begin
  FormMyCalendar := TFormMyCalendar.Create(Application);
  with FormMyCalendar do begin
    bIsFormCalendar := true;
    dCurDate := Date;
    DecodeDate(dCurDate, nY, nM, nD);
    dCurDate := EnCodeDate(nY, nM, 1);
    if not DmMain.cdsEDays.Active then
      DmMain.CreOpenCdsEDays;
    SetLabelMGCaption;
    CreCdsDays(dCurDate);
    Show;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(mSECTION, 'wL', 150);
    Top    := ReadInteger(mSECTION, 'wT', 250);
//    Height := ReadInteger(mSECTION, 'wH', 203);
//    Width  := ReadInteger(mSECTION, 'wW', 203);
    sBtnStayOnTop.Down := ReadBool(mSECTION, 'bStOnTop', true);
    Free;
  end;
  SetStayOnTop;
  bIsFormMyCalendar := true;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(mSECTION, 'wL', Left);
    WriteInteger(mSECTION, 'wT', Top);
//    WriteInteger(mSECTION, 'wH', Height);
//    WriteInteger(mSECTION, 'wW', Width);
    WriteBool(mSECTION, 'bStOnTop', sBtnStayOnTop.Down);
    Free;
  end;
  bIsFormCalendar := false;
  bIsFormMyCalendar := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.SetStayOnTop;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.bBtnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.sBtnStayOnTopClick(Sender: TObject);
begin
  SetStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.sBtnYPlusClick(Sender: TObject);
begin
  nY := nY + 1;
  dCurDate := EncodeDate(nY, nM, 1);
  SetLabelMGCaption;
  CreCdsDays(dCurDate);
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.sBtnMPlusClick(Sender: TObject);
begin
  nM := nM + 1;
  if nM >= 13 then begin
    nM := 1;
    nY := nY + 1;
  end;
  dCurDate := EncodeDate(nY, nM, 1);
  SetLabelMGCaption;
  CreCdsDays(dCurDate);
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.sBtnYMinusClick(Sender: TObject);
begin
  nY := nY - 1;
  dCurDate := EncodeDate(nY, nM, 1);
  SetLabelMGCaption;
  CreCdsDays(dCurDate);
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.sBtnMMinusClick(Sender: TObject);
begin
  nM := nM - 1;
  if nM <= 0 then begin
    nM := 12;
    nY := nY - 1;
  end;
  dCurDate := EncodeDate(nY, nM, 1);
  SetLabelMGCaption;
  CreCdsDays(dCurDate);
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.LabelMGDblClick(Sender: TObject);
var tDate : TDateTime;
begin
  tDate := Date;
  DecodeDate(tDate, nY, nM, nD);
  tDate := EnCodeDate(nY, nM, 1);
  if dCurDate <> tDate then begin
    dCurDate := tDate;
    SetLabelMGCaption;
    CreCdsDays(dCurDate);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.SetLabelMGCaption;
var cRusMes : string;
begin
  cRusMes := MesRus(nM);
  cRusMes := AnsiUpperCase(Copy(cRusMes,1,1)) +
                                 Copy(cRusMes, 2, Length(cRusMes)-1);
  LabelMG.Caption := cRusMes + ' ' + IntToStr(nY) + ' ד.';
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.CreCdsDays(dCurDate : TDateTime);
var i, d, nY, nM, nD, nMyNR : word;
    dDtTmp, dLastDOM : TDateTime;
    nMyDOW : word; myComponent : TComponent;
    nCompCount : integer; myCompName : string;
    nBudget : double;
  RowCnt: Integer;
  FirstDay: Boolean;
begin
  nCompCount := ComponentCount;
  with cdsDays do begin
    if Active then Close;
    CreateDataSet;
    Open;
    d := 0;
    for i := 1 to 42 do begin
      Inc(d);
      if d > 7 then
        d := 1;
      Append;
      FieldByName('MyNR').AsInteger := i;
      FieldByName('MyDay').AsInteger := d;
      FieldByName('NmLabel').AsString := 'Label' + IntToStr(i);
    end;
    Post;
    First;
    DecodeDate(dCurDate, nY, nM, nD);
    dDtTmp := dCurDate;
    dLastDOM := MyLastDOM(dDtTmp);
    nMyDOW := MyDOW(dCurDate);
    nMyNR := 1;
    while not EOF do begin
      if FieldByName('MyDay').AsInteger = nMyDow then begin
        Edit;
        FieldByName('MyDate').AsDateTime := dDtTmp;
        nMyNR := FieldByName('MyNR').AsInteger;
        Post;
        Break;
      end;
      Next;
    end;
    Locate('MyNR', nMyNR, []);
    dDtTmp := dCurDate;
    while not EOF do begin
      if dDtTmp <= dLastDom then begin
        Edit;
        FieldByName('MyDate').AsDateTime := dDtTmp;
        if DmMain.cdsEDays.Locate('E_Day',
                         FieldByName('MyDate').AsDateTime, []) then begin
          FieldByName('InEDay').AsBoolean := TRUE;
          FieldByName('nWrkChs').AsString := DmMain.cdsEDays.
                                         FieldByName('Rab_Chas').AsString;
          FieldByName('MyHint').AsString := DmMain.cdsEDays.
                                  FieldByName('Primechan').AsString +
                                  ' (' + DmMain.cdsEDays.
                             FieldByName('Rab_Chas').AsString + ' ק.)'; end
        else begin
          if (FieldByName('MyDay').AsInteger = 6) or
                    (FieldByName('MyDay').AsInteger = 7) then
            FieldByName('nWrkChs').AsFloat := 0
          else
            FieldByName('nWrkChs').AsFloat := 8;
        end;
        Post;
      end;
      dDtTmp := dDtTmp + 1;
      if dDtTmp > dLastDom then
        Break;
      Next;
    end;
  end;

  cdsDays.First;
  nBudget := 0;

  RowCnt := 1;
  FirstDay := true;

  while not cdsDays.EOF do begin
    for i := 0 to nCompCount-1 do begin
      myComponent := Components[i];

      if myComponent is TLabel then begin
        myCompName := myComponent.Name;
        
        if myCompName = cdsDays.FieldByName('NmLabel').AsString then begin
          if not cdsDays.FieldByName('MyDate').IsNull then begin
            DecodeDate(cdsDays.FieldByName('MyDate').AsDateTime, nY, nM, nD);
            (myComponent as TLabel).Caption := IntToStr(nD);

            if (cdsDays.FieldByName('MyDay').AsInteger = 1) and not FirstDay then
              Inc(RowCnt);

            FirstDay := false;
            
            if cdsDays.FieldByName('InEDay').AsBoolean then begin
              nBudget := nBudget + cdsDays.FieldByName('nWrkChs').AsFloat;
              (myComponent as TLabel).Font.Color := clBlue;
              (myComponent as TLabel).Font.Style := [fsBold];
              (myComponent as TLabel).Hint :=
                              cdsDays.FieldByName('MyHint').AsString;
              (myComponent as TLabel).ShowHint := true; end
            else if (cdsDays.FieldByName('MyDay').AsInteger = 6) or
                    (cdsDays.FieldByName('MyDay').AsInteger = 7) then begin
              nBudget := nBudget + cdsDays.FieldByName('nWrkChs').AsFloat;
              (myComponent as TLabel).Font.Color := clMaroon;
              (myComponent as TLabel).Font.Style := [];
              (myComponent as TLabel).Hint := '';
              (myComponent as TLabel).ShowHint := false; end
            else begin
              nBudget := nBudget + cdsDays.FieldByName('nWrkChs').AsFloat;
              (myComponent as TLabel).Font.Color := clWindowText;
              (myComponent as TLabel).Font.Style := [];
              (myComponent as TLabel).Hint := '';
              (myComponent as TLabel).ShowHint := false;
            end; end
          else
            (myComponent as TLabel).Caption := '';
        end;
      end;
    end;
    cdsDays.Next;
  end;
  if bFlagDbg then
    cdsDays.SaveToFile(cDirTemp + 'Calendar.cds');
  LabelBudget.Caption := 'ֱ‏הזוע: ' + FloatToStr(nBudget) + ' ק.';

  ClientWidth := 6 + 7 * 25 + 6 * 1 + 6;
  Panel1.Height := Panel2.Height + (RowCnt + 1) * 16 + RowCnt * 1 + 3;
  ClientHeight := Panel1.Height + Panel3.Height;
end;
//------------------------------------------------------------------------------
procedure TFormMyCalendar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormCalendar := false;
end;

end.
