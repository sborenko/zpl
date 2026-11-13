unit a_DelMe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TFormDelMe = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowDelMe;

var
  FormDelMe: TFormDelMe;

implementation

uses Z_DM;

{$R *.DFM}

procedure ShowDelMe;
begin
  FormDelMe := TFormDelMe.Create(Application);
  with FormDelMe do begin
    ShowModal;
    Free;
  end;
end;

end.
