unit PrtRaschList;

interface

uses
  Db, DbTables;

type
  CalcList = class
  public
    class procedure PrtEmplExcel(DtProc: TDateTime; EmplId: Integer;
      EmplName: ShortString);
    class procedure PrtDeptExcel(DtProc: TDateTime; DsSps: TDataSet);
    class procedure PrtEntrpExcel(DtProc: TDateTime;
      DsDepts, DsEmpls: TDataSet);

    class procedure PrtEmplText(DtProc: TDateTime; EmplId: Integer;
      EmplName: ShortString);
    class procedure PrtDept(DeptId: Integer; DtProc: TDateTime;
      DsEmpls: TDataSet);
    class procedure PrtEntpr(DtProc: TDateTime;
      DsDepts, DsEmpls: TDataSet);

    class procedure PrtDept2Copies(DeptId: Integer; DtProc: TDateTime;
      DsEmpls: TDataSet);
    class procedure PrtEntpr2Copies(DtProc: TDateTime;
      DsDepts, DsEmpls: TDataSet);

  end;

implementation

uses
  Controls, Dialogs, Forms, ShellApi, SysUtils, Windows,
  z_Dm, z_Main,
  RaschListExcel, RaschListText, FileLib;

const
  TmpPrefix = '$$$';

//------------------------------------------------------------------------------
class procedure CalcList.PrtEmplExcel(
  DtProc: TDateTime;
  EmplId: Integer;
  EmplName: ShortString);
var
  QryPmnts: TQuery;
  Row, DummyInt: Integer;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  with QryPmnts do begin
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;
  end;

  Row := 1;

  with TRaschListExcel.Create(QryPmnts) do begin
    Print(DtProc, EmplId, EmplName, Row, DummyInt);
    Write;
    Preview;
    Free;
  end;

  QryPmnts.Free;
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
class procedure CalcList.PrtDeptExcel(DtProc: TDateTime; DsSps: TDataSet);
var
  QryPmnts: TQuery;
  RaschList: TRaschListExcel;
  EmplId, Row, SavedEmplId, DummyInt: Integer;
  EmplName: ShortString;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  RaschList := TRaschListExcel.Create(QryPmnts);
  Row := 1;

  with DsSps do begin
    DisableControls;

    SavedEmplId := FieldByName('TabN').AsInteger;
    First;

    while not Eof do begin
      EmplId := FieldByName('TabN').AsInteger;

      // Чтобы ТабНр печатался только по ОСНОВНОМУ подразделению
      if (DtProc >= dDt01012008) and (FieldByName('KdObj').AsInteger <>
        FieldByName('OldKdObj').AsInteger)
        // Себя не печатаю
        // or (EmplId = 12145)
      then begin
        Next;
        Continue;
      end;

      EmplName := FieldByName('FamIO').AsString;

      with QryPmnts do begin
        ParamByName('TabN').AsInteger := EmplId;
        ParamByName('DtProc').AsDateTime := DtProc;
        Open;

        if RecordCount > 0 then begin
          RaschList.Print(DtProc, EmplId, EmplName, Row, DummyInt);
          Inc(Row, 2);
        end;

        Close;
      end;

      Next;
      Application.ProcessMessages;
    end;

    EnableControls;
    Locate('TabN', SavedEmplId, []);
  end;

  with RaschList do begin
    Write;
    Preview;
    Free;
  end;

  QryPmnts.Free;
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
class procedure CalcList.PrtEntrpExcel(
  DtProc: TDateTime;
  DsDepts, DsEmpls: TDataSet);
var
  QryPmnts: TQuery;
  RaschList: TRaschListExcel;
  EmplId, Row, SavedDeptId, SavedEmplId: Integer;
  EmplName : ShortString;
  DummyInt: Integer;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  RaschList := TRaschListExcel.Create(QryPmnts);
  Row := 1;

  with DsEmpls do begin
    SavedEmplId := FieldByName('TabN').AsInteger;
    DisableControls;
  end;

  with DsDepts do begin
    SavedDeptId := DsDepts.FieldByName('KdObj').AsInteger;
    First;

    while not Eof do begin
      with DsEmpls do begin
        First;

        while not Eof do begin
          EmplId := FieldByName('TabN').AsInteger;
          
          // Чтобы ТабНр печатался только по ОСНОВНОМУ подразделению
          if (DtProc >= dDt01012008) and (FieldByName('KdObj').AsInteger <>
            FieldByName('OldKdObj').AsInteger)
            // Себя не печатаю
            // or (EmplId = 12145)
          then begin
            Next;
            Continue;
          end;

          EmplName := FieldByName('FamIO').AsString;

          with QryPmnts do begin
            ParamByName('TabN').AsInteger := EmplId;
            ParamByName('DtProc').AsDateTime := DtProc;
            Open;

            if RecordCount > 0 then begin
              RaschList.Print(DtProc, EmplId, EmplName, Row, DummyInt);
              Inc(Row, 2);
            end;

            Close;
          end; {with QryPmnts}

          Next;
          Application.ProcessMessages;
        end; {while DsSps}
      end; {with DsSps}

      Next;
    end; {while QryPmnts}

    Locate('KdObj', SavedDeptId, []);
  end; {with DsDepts}

  with DsEmpls do begin
    Locate('TabN', SavedEmplId, []);
    EnableControls;
  end;

  with RaschList do begin
    Write;
    Preview;
    Free;
  end;

  QryPmnts.Free;
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
class procedure CalcList.PrtEmplText(
  DtProc: TDateTime;
  EmplId: Integer;
  EmplName: ShortString);
var
  QryPmnts: TQuery;
  Msg: String;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  with QryPmnts do begin
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;
  end;

  with TRschLstTxt.Create('R_List', QryPmnts, true) do begin
    Print(DtProc, EmplId, EmplName);
    Msg := PrintedFileNames;
    Free;
  end;

  QryPmnts.Free;
  Screen.Cursor := crDefault;

  ShowMessage(
    'Расчётный листок выведен в папку ' + RaschListPath + ': ' + Msg);
end;

//------------------------------------------------------------------------------
class procedure CalcList.PrtDept2Copies(
  DeptId: Integer;
  DtProc: TDateTime;
  DsEmpls: TDataSet);
var
  QryPmnts: TQuery;
  FileName: ShortString;
  SavedEmplId, EmplId: Integer;
  EmplName: ShortString;
  Msg: String;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  FileName := 'RLst' + IntToStr(DeptId);

  with TRschLstTxt.Create(FileName, QryPmnts, true) do begin
    with DsEmpls do begin
      DisableControls;

      SavedEmplId := FieldByName('TabN').AsInteger;
      First;

      while not Eof do begin
        EmplId := FieldByName('TabN').AsInteger;
        
        // Чтобы ТабНр печатался только по ОСНОВНОМУ подразделению
        if (DtProc >= dDt01012008) and (FieldByName('KdObj').AsInteger <>
          FieldByName('OldKdObj').AsInteger)
          // Себя не печатаю
          // or (EmplId = 12145)
        then begin
          Next;
          Continue;
        end;

        EmplName := FieldByName('FamIO').AsString;

        with QryPmnts do begin
          ParamByName('DtProc').AsDateTime := DtProc;
          ParamByName('TabN').AsInteger := EmplId;
          Open;

          Print(DtProc, EmplId, EmplName);
          Close;
        end;

        Next;
        Application.ProcessMessages;
      end;

      Locate('TabN', SavedEmplId, []);
      EnableControls;
    end;

    Msg := PrintedFileNames;
    Free;
  end;

  QryPmnts.Free;
  Screen.Cursor := crDefault;

  ShowMessage(
    'Расчётные листки выведены в папку ' + RaschListPath + ': ' + Msg);
end;

//------------------------------------------------------------------------------
class procedure CalcList.PrtEntpr2Copies(
  DtProc: TDateTime;
  DsDepts, DsEmpls: TDataSet);
var
  QryPmnts: TQuery;
  FileName, EmplName, Msg: ShortString;
  EmplId, SavedDeptId: Integer;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  FileName := 'RLAll';

  DsEmpls.DisableControls;

  with TRschLstTxt.Create(FileName, QryPmnts, true) do begin
    with DsDepts do begin
      SavedDeptId := FieldByName('KdObj').AsInteger;
      First;

      while not Eof do begin
        with DsEmpls do begin
          First;

          while not Eof do begin
            EmplId := FieldByName('TabN').AsInteger;
            
            // Чтобы ТабНр печатался только по ОСНОВНОМУ подразделению
            if (DtProc >= dDt01012008) and (FieldByName('KdObj').AsInteger <>
              FieldByName('OldKdObj').AsInteger)
              // Себя не печатаю
              // or (EmplId = 12145)
            then begin
              Next;
              Continue;
            end;

            EmplName := FieldByName('FamIO').AsString;

            with QryPmnts do begin
              ParamByName('TabN').AsInteger := EmplId;
              ParamByName('DtProc').AsDateTime := DtProc;
              Open;

              Print(DtProc, EmplId, EmplName);
              Close;
            end;

            Next;
            Application.ProcessMessages;
          end;
        end;

        Next;
      end;

      Locate('KdObj', SavedDeptId, []);
    end;

    Msg := PrintedFileNames;
    Free;
  end;

  DsEmpls.EnableControls;
  QryPmnts.Free;
  Screen.Cursor := crDefault;

  ShowMessage(
    'Расчётные листки выведены в папку ' + RaschListPath + ': ' + Msg);
end;

//------------------------------------------------------------------------------
class procedure CalcList.PrtDept(
  DeptId: Integer;
  DtProc: TDateTime;
  DsEmpls : TDataSet);
var
  QryPmnts: TQuery;
  RaschList1,
  RaschList2,
  RaschList: TRschLstTxt;
  SavedEmplId, EmplId, ListCount: Integer;
  EmplName, Msg: ShortString;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  RaschList1 := TRschLstTxt.Create(TmpPrefix + 'r1', QryPmnts, false);
  RaschList2 := TRschLstTxt.Create(TmpPrefix + 'r2', QryPmnts, false);

  with DsEmpls do begin
    DisableControls;

    SavedEmplId := FieldByName('TabN').AsInteger;
    First;

    ListCount := 0;

    while not Eof do begin
      EmplId := FieldByName('TabN').AsInteger;
      
      // Чтобы ТабНр печатался только по ОСНОВНОМУ подразделению
      if (DtProc >= dDt01012008) and (FieldByName('KdObj').AsInteger <>
        FieldByName('OldKdObj').AsInteger)
        // Себя не печатаю
        // or (EmplId = 12145)
      then begin
        Next;
        Continue;
      end;

      EmplName := FieldByName('FamIO').AsString;

      with QryPmnts do begin
        ParamByName('DtProc').AsDateTime := DtProc;
        ParamByName('TabN').AsInteger := EmplId;
        Open;
        Inc(ListCount);

        if ListCount Mod 2 = 1 then
          RaschList1.Print(DtProc, EmplId, EmplName)
        else
          RaschList2.Print(DtProc, EmplId, EmplName);

        Close;
      end;

      Next;
    end;

    Locate('TabN', SavedEmplId, []);
    EnableControls;
  end;

  QryPmnts.Free;

  RaschList := TRschLstTxt.Create('RL_' + IntToStr(DeptId), nil, false);
  RaschList.MergeLists(RaschList1, RaschList2);

  RaschList1.Free;
  RaschList2.Free;
  Msg := RaschList.PrintedFileNames;
  RaschList.Free;

  FileUtils.DeleteFiles(RaschListPath, TmpPrefix + '*.txt');
  Screen.Cursor := crDefault;

  ShowMessage(
    'Расчётные листки выведены в папку ' + RaschListPath + ': ' + Msg);
end;

//------------------------------------------------------------------------------
class procedure CalcList.PrtEntpr(
  DtProc: TDateTime;
  DsDepts, DsEmpls: TDataSet);
const
  CutLine = '**********  Л и н и я   о т р е з а  **********';
var
  QryPmnts: TQuery;
  RaschList1,
  RaschList2,
  CurRaschList,
  FinalRaschList: TRschLstTxt;
  SavedDeptId, EmplId: Integer;
  // При смене полосы по смене подразделения
  // DeptCount: Integer;
  EmplName, Msg: ShortString;
begin
  Screen.Cursor := crHourGlass;

  QryPmnts := TQuery.Create(nil);
  DmMain.PreparePmntsQry(QryPmnts, false, false, true, false);

  RaschList1 := TRschLstTxt.Create(TmpPrefix + 'r1', QryPmnts, false);
  RaschList2 := TRschLstTxt.Create(TmpPrefix + 'r2', QryPmnts, false);
  CurRaschList := RaschList1;

  DsEmpls.DisableControls;

  with DsDepts do begin
    SavedDeptId := FieldByName('KdObj').AsInteger;
    First;

    // DeptCount := 0;

    while not Eof do begin
      with DsEmpls do
        if RecordCount > 0 then begin
          { Переход на другую полосу по изменении подразделения
          Inc(DeptCount);

          if DeptCount mod 2 = 1 then
            CurRaschList := RaschList1
          else
            CurRaschList := RaschList2;
          }

          // Переход на другую полосу по количеству строк на каждой из полос
          // В случае равенства - просто смена полосы
          if RaschList1.RowCount < RaschList2.RowCount then
            CurRaschList := RaschList1
          else if RaschList1.RowCount > RaschList2.RowCount then
            CurRaschList := RaschList2
          else if CurRaschList = RaschList1 then
            CurRaschList := RaschList2
          else
            CurRaschList := RaschList1;

          First;

          while not Eof do begin
            EmplId := FieldByName('TabN').AsInteger;
            
            // Чтобы ТабНр печатался только по ОСНОВНОМУ подразделению
            if (DtProc >= dDt01012008) and (FieldByName('KdObj').AsInteger <>
              FieldByName('OldKdObj').AsInteger)
              // Себя не печатаю
              // or (EmplId = 12145)
            then begin
              Next;
              Continue;
            end;

            EmplName := FieldByName('FamIO').AsString;

            with QryPmnts do begin
              ParamByName('DtProc').AsDateTime := DtProc;
              ParamByName('TabN').AsInteger := EmplId;
              Open;

              CurRaschList.Print(DtProc, EmplId, EmplName);
              Close;
            end;

            Next;
          end;

          CurRaschList.Write('');
          CurRaschList.Write('');
          CurRaschList.Write(CutLine);
          CurRaschList.Write('');
          CurRaschList.Write('');
        end;

      Next;
    end;

    DsDepts.Locate('KdObj', SavedDeptId, []);
  end;

  DsEmpls.EnableControls;

  FinalRaschList := TRschLstTxt.Create('RL_All', nil, false);
  FinalRaschList.MergeLists(RaschList1, RaschList2);

  Screen.Cursor := crDefault;

  RaschList1.Free;
  RaschList2.Free;
  Msg := FinalRaschList.PrintedFileNames;
  FinalRaschList.Free;

  FileUtils.DeleteFiles(RaschListPath, TmpPrefix + '*.txt');
  Screen.Cursor := crDefault;

  ShowMessage(
    'Расчётные листки выведены в папку ' + RaschListPath + ': ' + Msg);
end;

end.
