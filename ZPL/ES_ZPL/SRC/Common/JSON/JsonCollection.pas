unit JsonCollection;

interface

uses
  JsonItem;

type
  TJsonCollection = class(TJsonItem)
  protected
    function GetItemCount: integer; virtual; abstract;
    function OpenBracket: char; virtual; abstract;
    function CloseBracket: char; virtual; abstract;
    procedure WriteItem(Indx: integer;
      var JsonFile: TextFile; Level: integer; Sep: ShortString); virtual; abstract;
  public
    procedure WriteToFile(FilePathName: ShortString);
    procedure WriteJson(
      var JsonFile: TextFile; Level: integer; Sep: ShortString); override;
  end;

implementation

//------------------------------------------------------------------------------
procedure TJsonCollection.WriteToFile(FilePathName: ShortString);
var
  JsonFile: TextFile;
begin
  AssignFile(JsonFile, FilePathName);
  Rewrite(JsonFile);

  WriteJson(JsonFile, 0, '');

  CloseFile(JsonFile);
end;

//------------------------------------------------------------------------------
procedure TJsonCollection.WriteJson(
  var JsonFile: TextFile;
  Level: integer;
  Sep: ShortString);
var
  I, Count: integer;
  Indent: string;
begin
  Indent := GetIndent(Level);
  WriteLn(JsonFile, Indent + OpenBracket);

  Count := GetItemCount;

  for I := 0 to Count - 1 do begin
    if I < Count - 1 then
      WriteItem(I, JsonFile, Level + 1, ',')
    else
      WriteItem(I, JsonFile, Level + 1, '');
  end;

  WriteLn(JsonFile, Indent + CloseBracket + Sep);
end;

end.
