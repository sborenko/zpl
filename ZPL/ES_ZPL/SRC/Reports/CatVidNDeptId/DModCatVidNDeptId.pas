unit DModCatVidNDeptId;

interface

uses
  Classes, DB, DBClient, DBTables, SysUtils;

const
  GRP_CNT = 5;

type
  TVidRng = record
    Since,
    Till: ShortString;
  end;

  TVidGrp = array of TVidRng;

  TDept = record
    Id: Integer;
    Nm: ShortString;
  end;

  TDeptArr = array of TDept;

  TDeptGrp = record
    Id: Integer;
    Nm: ShortString;
    DeptArr: TDeptArr;
  end;

  TDmCatVidNDeptId = class(TDataModule)
    CdsReport: TClientDataSet;
    CdsMisVidN: TClientDataSet;
    QryNU: TQuery;
    DsrcMisVidN: TDataSource;
    DsrcReport: TDataSource;
    CdsGrpTtl: TClientDataSet;
    CdsRptTtl: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    RptYear: Integer;

    procedure InitRptVidN;
//    procedure InitIgnVidN;
    procedure InitDept;

    procedure LoadNU;

    procedure CreateRptCds;
    procedure CreateTtlCds(TtlCds: TClientDataSet);

    procedure CreateMisCds;

    procedure CreateReport;
    procedure ProcessDeptGrp(DeptGrp: TDeptGrp);
    procedure ProcessDept(Dept: TDept);

    procedure OpenTotal(Id: Integer; Caption: ShortString; TtlCds: TClientDataSet);
    procedure ApplyTotal(TtlCds: TClientDataSet);

    function GetGrpId(VidN: ShortString): Integer;
    // function FindIgnored(VidN: ShortString): Boolean;

    procedure AddMissing(VidN, VidNSh: ShortString);
    procedure AddSum(GrpId: Integer; Sum: Double);

//    function GetStmtProcessed: String;
//    function GetStmtIgnored: String;

  public
    constructor Create(RptYear: Integer); reintroduce;

    function GetRptYear: Integer;
    function GetReportCds: TClientDataSet;

    class function GetSumFldNm(GrpId: Integer): ShortString;
  end;

implementation

uses
  DsLib, MathLib, QryLib, TextLib;

var
  // Виды начисления для обработки
  GrpArr: array of TVidGrp;
  // Игнорируемые виды
//  IgnArr: array of TVidRng;

  DeptGrpArr: array of TDeptGrp;

{$R *.dfm}

//------------------------------------------------------------------------------
constructor TDmCatVidNDeptId.Create(RptYear: Integer);
begin
  inherited Create(nil);

  Self.RptYear := RptYear;
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.DataModuleCreate(Sender: TObject);
begin
  InitRptVidN;
//  InitIgnVidN;
  InitDept;

  CreateRptCds;

  CreateTtlCds(CdsGrpTtl);
  CreateTtlCds(CdsRptTtl);
  
  CreateMisCds;

  LoadNU;
  CreateReport;
  QryNu.Close;
end;

//------------------------------------------------------------------------------
function TDmCatVidNDeptId.GetRptYear: Integer;
begin
  Result := RptYear;
end;

//------------------------------------------------------------------------------
function TDmCatVidNDeptId.GetReportCds: TClientDataSet;
begin
  Result := CdsReport;
end;

//------------------------------------------------------------------------------
class function TDmCatVidNDeptId.GetSumFldNm(GrpId: Integer): ShortString;
begin
  Result := 'Grp' + IntToStr(GrpId) + 'Sm';
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.CreateMisCds;
begin
  CdsMisVidN.CreateDataSet;
  CdsMisVidN.Open;
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.CreateRptCds;
var
  SumFldNm: ShortString;
  GrpId: Integer;
begin
  with CdsReport, FieldDefs do begin
    Add('DeptId', ftInteger);
    Add('DeptNm', ftString, 64);

    // По каждой группе
    for GrpId := 1 to Length(GrpArr) do begin
      SumFldNm := GetSumFldNm(GrpId);
      Add(SumFldNm, ftFloat);
    end;

    CreateDataSet;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.CreateTtlCds(TtlCds: TClientDataSet);
begin
  DsUtils.CopyStruct(CdsReport, TtlCds);
  
  with TtlCds do begin
    CreateDataSet;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.CreateReport;
var
  I: Integer;
begin
  OpenTotal(0, 'Національний університет "Одеська політехніка"', CdsRptTtl);

  for I := 0 to Length(DeptGrpArr) - 1 do
    ProcessDeptGrp(DeptGrpArr[I]);

  ApplyTotal(CdsRptTtl);
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.ProcessDeptGrp(DeptGrp: TDeptGrp);
var
  I: Integer;
begin
  OpenTotal(DeptGrp.Id, DeptGrp.Nm, CdsGrpTtl);

  for I := 0 to Length(DeptGrp.DeptArr) - 1 do
    ProcessDept(DeptGrp.DeptArr[I]);

  ApplyTotal(CdsGrpTtl);
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.ProcessDept(Dept: TDept);
var
  VidN, VidNSh: ShortString;
  GrpId: Integer;
  Sum: Double;
begin
  with CdsReport do begin
    Append;

    FieldByName('DeptId').AsInteger := Dept.Id;
    FieldByName('DeptNm').AsString  := Dept.Nm;
  end;

  with QryNU do begin
    First;

    while not Eof do begin
      if FieldByName('KdObj').AsInteger = Dept.Id then begin
        VidN := FieldByName('VidN').AsString;

        GrpId := GetGrpId(VidN);

        if GrpId > 0 then begin
          Sum := FieldByName('Summa').AsFloat;

          AddSum(GrpId, Sum);
        end else begin
          VidNSh := FieldByName('ShVidN').AsString;

//          if not FindIgnored(VidN) then
            AddMissing(VidN, VidNSh);
        end;
      end;

      Next;
    end;
  end;

  CdsReport.Post;
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.OpenTotal(
  Id: Integer;
  Caption: ShortString;
  TtlCds: TClientDataSet
);
begin
  with CdsReport do begin
    Append;
    FieldByName('DeptId').AsInteger := Id;
    FieldByName('DeptNm').AsString := Caption;
    Post;
  end;

  with TtlCds do begin
    Append;
    FieldByName('DeptId').AsInteger := Id;
    FieldByName('DeptNm').AsString := Caption;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.ApplyTotal(TtlCds: TClientDataSet);
begin
  TtlCds.Post;

  with CdsReport do begin
    Append;
    DsUtils.CopyRecord(TtlCds, CdsReport);
    
    FieldByName('DeptNm').AsString := 'Всього:';
    Post;
  end;

  TtlCds.EmptyDataSet;
end;

//------------------------------------------------------------------------------
// Загружаем данные
//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.LoadNU;
begin
  QryUtils.InitQuery(QryNU);

  with QryNU do begin
    SQL.Text :=
    'select n.KdObj, n.VidN, v.ShVidN, Sum(n.Summa) Summa ' +
    'from z_NU n ' +
      'left join z_KdVidN v on v.VidN = n.VidN ' +
    'where n.DtProc between :DtBeg and :DtEnd ' +
      // '8011/б'
      'and n.KdSPZ = 1209 ' +
      // ППС
      'and n.KdKatP = 1 ' +
      'and n.VidN < "5000" ' +
    'group by n.KdObj, n.VidN, v.ShVidN';

    ParamByName('DtBeg').AsDateTime := EncodeDate(RptYear, 1, 1);
    ParamByName('DtEnd').AsDateTime := EncodeDate(RptYear, 12, 31);
    Open;
  end;
end;

//------------------------------------------------------------------------------
function TDmCatVidNDeptId.GetGrpId(VidN: ShortString): Integer;
var
  Grp: TVidGrp;
  Rng: TVidRng;
  I, J: Integer;
begin
  SetLength(Grp, 0);
  
  Result := 0;

  for I := 0 to Length(GrpArr) - 1 do begin
    Grp := GrpArr[I];

    for J := 0 to Length(Grp) - 1 do begin
      Rng := Grp[J];

      if (VidN >= Rng.Since) and (VidN <= Rng.Till) then begin
        Result := I + 1;
        exit;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
{
function TDmCatVidNDeptId.FindIgnored(VidN: ShortString): Boolean;
var
  Rng: TVidRng;
  I: Integer;
begin
  Result := false;

  for I := 0 to Length(IgnArr) - 1 do begin
    Rng := IgnArr[I];

    if (VidN >= Rng.Since) and (VidN <= Rng.Till) then begin
      Result := true;
      break;
    end;
  end;
end;
}

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.AddMissing(VidN, VidNSh: ShortString);
begin
  with CdsMisVidN do begin
    Append;
    FieldByName('VidN').AsString := VidN;
    FieldByName('VidNSh').AsString := VidNSh;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.AddSum(GrpId: Integer; Sum: Double);
var
  SumFldNm: ShortString;
begin
  SumFldNm := GetSumFldNm(GrpId);

  with CdsReport do
    FieldByName(SumFldNm).AsFloat :=
      MathUtils.Round(FieldByName(SumFldNm).AsFloat + Sum, 2);

  with CdsGrpTtl do
    FieldByName(SumFldNm).AsFloat :=
      MathUtils.Round(FieldByName(SumFldNm).AsFloat + Sum, 2);

  with CdsRptTtl do
    FieldByName(SumFldNm).AsFloat :=
      MathUtils.Round(FieldByName(SumFldNm).AsFloat + Sum, 2);
end;

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.InitRptVidN;
begin
  SetLength(GrpArr, GRP_CNT);

  SetLength(GrpArr[0], 1);
  with GrpArr[0, 0] do begin Since := '1003'; Till := '1004'; end;

  SetLength(GrpArr[1], 7);
  with GrpArr[1, 0] do begin Since := '1401'; Till := '1401'; end;
  with GrpArr[1, 1] do begin Since := '1407'; Till := '1409'; end;
  with GrpArr[1, 2] do begin Since := '1412'; Till := '1412'; end;
  with GrpArr[1, 3] do begin Since := '1414'; Till := '1414'; end;
  with GrpArr[1, 4] do begin Since := '1416'; Till := '1417'; end;
  with GrpArr[1, 5] do begin Since := '1426'; Till := '1426'; end;
  with GrpArr[1, 6] do begin Since := '1442'; Till := '1442'; end;

  SetLength(GrpArr[2], 2);
  with GrpArr[2, 0] do begin Since := '1606'; Till := '1607'; end;
  with GrpArr[2, 1] do begin Since := '1611'; Till := '1611'; end;

  SetLength(GrpArr[3], 2);
  with GrpArr[3,  0] do begin Since := '1810'; Till := '1810'; end;
  with GrpArr[3,  1] do begin Since := '2201'; Till := '2299'; end;

  SetLength(GrpArr[4], 4);
  with GrpArr[4,  0] do begin Since := '1206'; Till := '1206'; end;
  with GrpArr[4,  1] do begin Since := '1620'; Till := '1620'; end;
  with GrpArr[4,  2] do begin Since := '2404'; Till := '2406'; end;
  with GrpArr[4,  3] do begin Since := '2603'; Till := '2603'; end;
end;

//------------------------------------------------------------------------------
{
procedure TDmCatVidNDeptId.InitIgnVidN;
begin
  SetLength(IgnArr, 3);

  with IgnArr[0] do begin Since := '1608'; Till := '1609'; end;
  with IgnArr[1] do begin Since := '1614'; Till := '1614'; end;
  with IgnArr[2] do begin Since := '2411'; Till := '2411'; end;
end;
}

//------------------------------------------------------------------------------
procedure TDmCatVidNDeptId.InitDept;
begin
  SetLength(DeptGrpArr, 5);

  with DeptGrpArr[0] do begin
    Id := 1;
    Nm := 'Інженерно-технологічний';

    SetLength(DeptArr, 29);

    with DeptArr[0] do begin
      Id := 1309; Nm := 'Кафедра електромеханічної інженерії';
    end;
    with DeptArr[1] do begin
      Id := 1318;
      Nm := 'Кафедра електропостачання та енергетичного менеджменту';
    end;
    with DeptArr[2] do begin
      Id := 1624;
      Nm := 'Кафедра теплових електростанцій та енергозберігаючих технологій';
    end;
    with DeptArr[3] do begin
      Id := 1303; Nm := 'Кафедра атомних електростанцій';
    end;
    with DeptArr[4] do begin
      Id := 1628;
      Nm := 'Кафедра теоретичної та експериментальної ядерної фізики';
    end;
    with DeptArr[5] do begin
      Id := 1407; Nm := 'Кафедра комп’ютерних систем';
    end;
    with DeptArr[6] do begin
      Id := 1633; Nm := 'Кафедра штучного інтелекту та аналізу даних';
    end;
    with DeptArr[7] do begin
      Id := 1207;
      Nm := 'Кафедра програмних і комп’ютерно-інтегрованих технологій';
    end;
    with DeptArr[8] do begin
      Id := 1405; Nm := 'Кафедра комп’ютерних інтелектуальних систем та мереж';
    end;
    with DeptArr[9] do begin
      Id := 1406;
      Nm := 'Кафедра комп’ютеризованих систем та програмних технологій';
    end;
    with DeptArr[10] do begin
      Id := 1409; Nm := 'Кафедра інженерії програмного забезпечення';
    end;
    with DeptArr[11] do begin
      Id := 1154; Nm := 'Кафедра інформаційних систем';
    end;
    with DeptArr[12] do begin
      Id := 1620;
      Nm := 'Кафедра прикладної математики та інформаційних технологій';
    end;
    with DeptArr[13] do begin
      Id := 1632; Nm := 'Кафедра інформаційних технологій';
    end;
    with DeptArr[14] do begin
      Id := 1108; Nm := 'Кафедра цифрових технологій в інжинірингу';
    end;
    with DeptArr[15] do begin
      Id := 1101; Nm := 'Кафедра автомобільного транспорту та логістики';
    end;
    with DeptArr[16] do begin
      Id := 1111; Nm := 'Кафедра матеріалознавства та інженерії матеріалів';
    end;
    with DeptArr[17] do begin
      Id := 1106; Nm := 'Кафедра інтегрованих технологій управління';
    end;
    with DeptArr[18] do begin
      Id := 1107; Nm := 'Кафедра динаміки машин та механічної інженерії';
    end;
    with DeptArr[19] do begin
      Id := 1114;
      Nm := 'Кафедра інформаційних технологій проектування та дизайну';
    end;
    with DeptArr[20] do begin
      Id := 1401; Nm := 'Кафедра радіоелектронних і телекомунікаційних систем';
    end;
    with DeptArr[21] do begin
      Id := 1402; Nm := 'Кафедра радіотехнічних пристроїв';
    end;
    with DeptArr[22] do begin
      Id := 1423; Nm := 'Кафедра кібербезпеки та програмного забезпечення';
    end;
    with DeptArr[23] do begin
      Id := 1104;
      Nm := 'Кафедра підйомно-транспортного та робототехнічного обладнання';
    end;
    with DeptArr[24] do begin
      Id := 1202; Nm := 'Кафедра хімічних технологій';
    end;
    with DeptArr[25] do begin
      Id := 1203; Nm := 'Кафедра фармації';
    end;
    with DeptArr[26] do begin
      Id := 1319; Nm := 'Кафедра біомедичної інженерії';
    end;
    with DeptArr[27] do begin
      Id := 1301;
      Nm := 'Кафедра теоретичної, загальної та нетрадиційної енергетики';
    end;
    with DeptArr[28] do begin
      Id := 1130; Nm := 'Кафедра будівництва, архітектури та дізайну';
    end;
  end;

  // . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

  with DeptGrpArr[1] do begin
    Id := 2;
    Nm := 'Суспільний';

    SetLength(DeptArr, 15);

    with DeptArr[0] do begin
      Id := 1502; Nm := 'Кафедра економіки';
    end;
    with DeptArr[1] do begin
      Id := 1501;
      Nm := 'Кафедра економічної кібернетики та інформаційних технологій';
    end;
    with DeptArr[2] do begin
      Id := 1121; Nm := 'Кафедра маркетингу';
    end;
    with DeptArr[3] do begin
      Id := 1504; Nm := 'Кафедра менеджменту';
    end;
    with DeptArr[4] do begin
      Id := 1120; Nm := 'Кафедра міжнародного менеджменту та інновацій';
    end;
    with DeptArr[5] do begin
      Id := 1505; Nm := 'Кафедра обліку, аналізу та аудиту';
    end;
    with DeptArr[6] do begin
      Id := 1507; Nm := 'Кафедра підприємництва і торгівлі';
    end;
    with DeptArr[7] do begin
      Id := 1506; Nm := 'Кафедра публічного управління та адміністрування';
    end;
    with DeptArr[8] do begin
      Id := 1559; Nm := 'Кафедра публічної служби та права';
    end;
    with DeptArr[9] do begin
      Id := 1552; Nm := 'Кафедра менеджменту, фінансів і бізнес-технологій';
    end;
    with DeptArr[10] do begin
      Id := 1550; Nm := 'Кафедра публічного управління та регіоналістики';
    end;
    with DeptArr[11] do begin
      Id := 1553; Nm := 'Кафедра соціально-гуманітарних наук';
    end;
    with DeptArr[12] do begin
      Id := 1209; Nm := 'Кафедра фізичного виховання та спорту';
    end;
    with DeptArr[13] do begin
      Id := 1117; Nm := 'Кафедра міжнародних відносин та права';
    end;
    with DeptArr[14] do begin
      Id := 1827; Nm := 'Кафедра психології та соціальної роботи';
    end;
  end;

  // . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

  with DeptGrpArr[2] do begin
    Id := 3;
    Nm := 'Гуманітарно-містецький';

    SetLength(DeptArr, 9);

    with DeptArr[0] do begin
      Id := 1408; Nm := 'Кафедра іноземних мов';
    end;
    with DeptArr[1] do begin
      Id := 1841; Nm := 'Кафедра германських мов і перекладу';
    end;
    with DeptArr[2] do begin
      Id := 1412; Nm := 'Кафедра англійської філології та перекладу';
    end;
    with DeptArr[3] do begin
      Id := 1832; Nm := 'Кафедра інформаційної діяльності та медіа-комунікацій';
    end;
    with DeptArr[4] do begin
      Id := 1603; Nm := 'Кафедра культурології та філософії культури';
    end;
    with DeptArr[5] do begin
      Id := 1602; Nm := 'Кафедра філософії, історії та політології';
    end;
    with DeptArr[6] do begin
      Id := 1831; Nm := 'Кафедра лінгводидактики';
    end;
    with DeptArr[7] do begin
      Id := 1126; Nm := 'Кафедра іспанської мови та спеціального перекладу';
    end;
    with DeptArr[8] do begin
      Id := 1127; Nm := 'Кафедра професійно орієнтованої польської мови';
    end;
  end;

  // . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

  with DeptGrpArr[3] do begin
    Id := 4;
    Nm := 'Природничо-математичний';

    SetLength(DeptArr, 4);

    with DeptArr[0] do begin
      Id := 1304; Nm := 'Кафедра фізики';
    end;
    with DeptArr[1] do begin
      Id := 1206; Nm := 'Кафедра екологічної безпеки та гідравліки';
    end;
    with DeptArr[2] do begin
      Id := 1116; Nm := 'Кафедра вищої математики та моделювання систем';
    end;
    with DeptArr[3] do begin
      Id := 1635;
      Nm := 'Кафедра математичних методів, квантових систем та технологій';
    end;
  end;

  // . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

  with DeptGrpArr[4] do begin
    Id := 5;
    Nm := 'Безпековий';

    SetLength(DeptArr, 2);

    with DeptArr[0] do begin
      Id := 1606; Nm := 'Кафедра військової підготовки';
    end;
    with DeptArr[1] do begin
      Id := 1155; Nm := 'Кафедра цивільної безпеки та охорони праці';
    end;
  end;
end;

//    function GetStmtProcessed: String;
//    function GetStmtIgnored: String;

end.
