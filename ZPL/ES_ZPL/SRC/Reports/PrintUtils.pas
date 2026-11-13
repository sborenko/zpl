unit PrintUtils;

interface

uses
  TTF160_TLB;

type
  TPrintUtils = class
  public
    class procedure SetCustomParams(PageSetup: F1PageSetup);
    class procedure Preview(DirName, FileName: String);
  end;

implementation

uses
  ShellAPI, Windows, Forms, A_Const, A_F6b;

//--------------------------------------------------------------------------------------------------
class procedure TPrintUtils.SetCustomParams(PageSetup: F1PageSetup);
begin
  with PageSetup do begin
    LeftMargin := 0.3;
    RightMargin := 0.3;
    TopMargin := 0.35;
    HeaderMargin := 0.3;
    BottomMargin := 0.35;
    FooterMargin := 0.3;
    CenterHoriz := true;
  end;
end;

//--------------------------------------------------------------------------------------------------
class procedure TPrintUtils.Preview(DirName, FileName: String);
begin
  if bAppDocsToExcel then
    ShellExecute(Application.Handle, nil,
      PAnsiChar(FileName), nil, PAnsiChar(DirName), SW_SHOWNOACTIVATE)
  else
    ShowF6File(DirName + FileName);   {A_F6B}
end;

end.
