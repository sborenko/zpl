unit FormEvaluate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, IFaceProgressState;

type
  TProcessRunFunc = procedure(ProgressState: IProgressState) of object;

  TFrmEvaluate = class(TForm, IProgressState)
    ProgressBar: TProgressBar;
    BtnCancel: TBitBtn;
    LblCurrStageNum: TLabel;
    LblStagesTotal: TLabel;
    EdtStage: TEdit;
    BevelStage: TBevel;
    LstBoxLog: TListBox;
    procedure BtnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    ProcessRunFunc: TProcessRunFunc;

    StagesTotal,
    StagesDone: integer;
    Canceled: boolean;

    procedure CountStages;
    procedure Log(Level: integer; Message: string);
  public
    class procedure Run(ProcessFunc: TProcessRunFunc);

    procedure SetStagesTotal(ProcessName: ShortString; Total: integer);

    procedure SetStageStarted(Level: integer; StageName: ShortString;
      MaxValue: integer; StageIsTopLevel: boolean; Comment: string);
    procedure SetStageFinished(Level: integer; StageName: ShortString;
      StageIsTopLevel: boolean; Comment: string);
    procedure SetStageCanceled(Level: integer; StageName: ShortString;
      StageIsTopLevel: boolean; Comment: string);
    function StageIsCanceled: boolean;

    procedure ResetProgress(MaxValue: integer);
    procedure RestoreProgress(CurValue, MaxValue: integer);
    procedure UpdateStageProgress(Comment: string); overload;
    procedure UpdateStageProgress(CurValue: integer; Comment: string); overload;

    procedure WriteMessage(Level: integer; Message: string);
  end;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmEvaluate.Run(ProcessFunc: TProcessRunFunc);
begin
  with TFrmEvaluate.Create(nil) do begin
    ProcessRunFunc := ProcessFunc;
    Canceled := false;
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.FormActivate(Sender: TObject);
begin
  try
    ProcessRunFunc(Self);
  except on e: Exception do
    ShowMessage(e.Message);
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.SetStagesTotal(ProcessName: ShortString; Total: integer);
begin
  Caption := ProcessName;
  StagesTotal := Total;
  LblStagesTotal.Caption := 'Этапов: ' + IntToStr(StagesTotal);
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.SetStageStarted(
  Level: integer;
  StageName: ShortString;
  MaxValue: integer;
  StageIsTopLevel: boolean;
  Comment: string
);
begin
  if StageIsTopLevel then begin
    LblCurrStageNum.Caption := 'Этап ' + IntToStr(StagesDone + 1);
    EdtStage.Text := StageName;
  end;

  with ProgressBar do begin
    Position := 0;
    Max := MaxValue;
  end;

  Log(Level, 'Выполнение этапа "' + StageName + '".');
  Log(Level, Comment);
  Application.ProcessMessages;
end;

//------------------------------------------------------------------------------
function TFrmEvaluate.StageIsCanceled: boolean;
begin
  Result := Canceled;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.ResetProgress(MaxValue: integer);
begin
  with ProgressBar do begin
    Position := 0;
    Max := MaxValue;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.RestoreProgress(CurValue, MaxValue: integer);
begin
  with ProgressBar do begin
    Position := CurValue;
    Max := MaxValue;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.UpdateStageProgress(Comment: string);
begin
  ProgressBar.Position := ProgressBar.Position + 1;
  Log(0, Comment);
  Application.ProcessMessages;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.UpdateStageProgress(CurValue: integer; Comment: string);
begin
  ProgressBar.Position := CurValue;
  Log(0, Comment);
  Application.ProcessMessages;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.SetStageFinished(
  Level: integer;
  StageName: ShortString;
  StageIsTopLevel: boolean;
  Comment: string);
begin
  if StageIsTopLevel then
    CountStages;

  Log(Level, 'Этап "' + StageName + '" завершён.');
  Log(Level, Comment);
  Application.ProcessMessages;
end; {EndStage}

//------------------------------------------------------------------------------
procedure TFrmEvaluate.SetStageCanceled(
  Level: integer; StageName: ShortString;
  StageIsTopLevel: boolean;
  Comment: string);
begin
  if StageIsTopLevel then
    CountStages;

  Log(Level, 'Этап "' + StageName + '" отменён.');
  Log(Level, Comment);
  Application.ProcessMessages;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.WriteMessage(Level: integer; Message: string);
begin
  Log(Level, Message);
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.CountStages;
begin
  Inc(StagesDone);

  if StagesDone = StagesTotal then begin
    with BtnCancel do begin
      Caption := 'Закрыть';
      ModalResult := mrOk;
      Enabled := true;
    end;

    ActiveControl := BtnCancel;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEvaluate.Log(Level: integer; Message: string);
begin
  if Message = '' then
    exit;

  Message := StringOfChar(' ', Level * 4) + Message;

  with LstBoxLog do begin
    Items.Add(Message);
    TopIndex := Items.Count - 14;
    Refresh;
  end;
end; {Log}

//------------------------------------------------------------------------------
procedure TFrmEvaluate.BtnCancelClick(Sender: TObject);
begin
  BtnCancel.Enabled := false;
  Canceled := true;
  Application.ProcessMessages;
end;

end.
