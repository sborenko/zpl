unit ZpDbGrid;

interface

uses
  SysUtils, Classes, Controls, Grids, DBGrids, Messages;

type
  TZpDbGrid = class(TDBGrid)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure WndProc(var Msg: TMessage); override;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SB Custom', [TZpDbGrid]);
end;

procedure TZpDbGrid.WndProc(var Msg: TMessage);
begin
  if (Msg.Msg <> WM_MOUSEWHEEL)
      // Не знаю, что за сообщение 45123. Прилетает на Win-10 при скролировании
      // колесом мыши в любом control'е, кроме селектированного ZpDbGrid.
      // Приводило к той-же проблеме, которую на XP исправили проверкой
      // на WM_MOUSEWHEEL: рассогласования селектирования элемента DbGrid.
      and (Msg.Msg <> 45123) then
    inherited;
end;

end.
