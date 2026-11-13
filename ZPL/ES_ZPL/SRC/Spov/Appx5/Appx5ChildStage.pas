unit Appx5ChildStage;

interface

uses
  Appx5Stage, ProgressStage, IFaceProgressState;

type
  TGroupResProc = procedure of object;

  TAppx5ChildStage = class(TProgressStage)
  protected
    EmplId: integer;
    GroupResProc: TGroupResProc;

    function Appx5: TAppx5Stage;

    procedure InitData; virtual; abstract;
    procedure FreeData; virtual;
  public
    procedure Start(ProgressState: IProgressState); override;
    function StageItemsTotal: integer; override;
    function KeepProcess: Boolean; override;
  end;

implementation

uses
  QryLib;

//------------------------------------------------------------------------------
procedure TAppx5ChildStage.Start(ProgressState: IProgressState);
begin
  InitData;

  inherited Start(ProgressState);
  
  FreeData;
end;

//------------------------------------------------------------------------------
procedure TAppx5ChildStage.FreeData;
begin
  QryUtils.ReleaseQuery(Appx5.QryMain);
end;

//------------------------------------------------------------------------------
function TAppx5ChildStage.StageItemsTotal: integer;
begin
  Result := Appx5.QryMain.RecordCount;
end;

//------------------------------------------------------------------------------
function TAppx5ChildStage.KeepProcess: Boolean;
begin
  with Appx5.QryMain do begin
    Result := not Eof;

    // Обработка уже началась и перешли к следующему сотруднику
    if (FieldByName('TabN').AsInteger <> EmplId) or Eof then begin
      if Assigned(GroupResProc) and (EmplId <> 0) then
        GroupResProc;

      EmplId := FieldByName('TabN').AsInteger;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TAppx5ChildStage.Appx5: TAppx5Stage;
begin
  Result := Parent as TAppx5Stage;
end;

end.
