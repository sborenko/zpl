unit CdsLib;

interface

uses
  SysUtils, DbClient, a_Const, TextUtils;

type
  CdsUtils = class
  public
    class procedure SaveToFile(
      Cds: TClientDataSet; FileName: ShortString; Mnth: word);
  end;

implementation

//------------------------------------------------------------------------------
class procedure CdsUtils.SaveToFile(
  Cds: TClientDataSet;
  FileName: ShortString;
  Mnth: word);
begin
  if Mnth > 0 then
    FileName := FileName + '_' + TTextUtils.PadLeft(IntToStr(Mnth), '0', 2);

  Cds.SaveToFile(cDirTemp + FileName + '.cds');
end;

end.
