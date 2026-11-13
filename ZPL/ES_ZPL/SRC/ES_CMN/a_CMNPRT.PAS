unit a_CmnPrt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB,  AxCtrls, OleCtrls, TTF160_TLB, ShellApi,
  Math, DBTables, Grids, DBGrids, ExtCtrls, DBClient, DBXpress, SqlExpr;


type
//  String10 = string[10];
  TFormGkCmnPrt = class(TForm)
    qryTmp: TQuery;
    F6B: TF6Book;
    cdsTmp: TClientDataSet;
    DbStp: TDatabase;
    DbMain: TDatabase;
  private
    { Private declarations }
    procedure SetPageParams(PgSetup : F1PageSetup);
  public
    { Public declarations }
  end;

procedure F6PrtTStZ(qryStZ : TQuery);
procedure F6PrtTSbu(qrySbu : TQuery);

var
  FormGkCmnPrt: TFormGkCmnPrt;
  mCellFormat : IF1CellFormat;
  cFileDoc, cRandomFileName : string;


implementation

uses a_Const, a_DM, a_F6B, A_Lib;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFormGkCmnPrt.SetPageParams(PgSetup : F1PageSetup);
begin
  with PgSetup do begin
    LeftMargin := 0.3;
    RightMargin := 0.3;
    TopMargin := 0.35;
    HeaderMargin := 0.3;
    BottomMargin := 0.35;
    FooterMargin := 0.3;
    PgSetUp.CenterHoriz := true;
    PgSetUp.CenterVert := false;
  end;
end;
//------------------------------------------------------------------------------
function ColNumb2ColNm(nCol : SmallInt; FBook : TF6Book) : string;
begin
  if nCol <= 26 then                                   {A..Z}
    Result := Chr(nCol+64)
  else if (nCol >= 27) and (nCol <= 256) then          {AA..IV}
    Result := Copy(FBook.FormatRCNr(1, nCol, False), 1, 2)
  else result := '';
end; {ColNumb2ColNm}
//------------------------------------------------------------------------------
procedure MyPreView(cDirNm, cFileNm : string);
begin
  if bAppDocsToExcel then
    //  ShellExecute(Application.Handle, nil,
    //                  PChar(cDirNm + cFileNm), nil, nil, SW_SHOWNOACTIVATE)
    ShellExecute(Application.Handle, nil,
                 PAnsiChar(cFileNm), nil, PAnsiChar(cDirNm), SW_SHOWNOACTIVATE)
  else
    ShowF6File(cDirNm + cFileNm);   {A_F6B}
end;
//------------------------------------------------------------------------------
procedure F6PrtTStZ(qryStZ : TQuery);
var nSvNR, iRow, nMyConst, nPp, nMaxCol : integer;
    cMsg : ShortString;
    PgSetup : F1PageSetup;
begin
  Screen.Cursor := crHourGlass;
  FormGkCmnPrt := TFormGkCmnPrt.Create(Application);
  with FormGkCmnPrt, F6B do begin
    PgSetup := CreateNewPageSetup;
    SetPageParams(PgSetup);
    SetPageSetup(PgSetup);
    nMyConst := RowHeight[1];
    ShowGridLines    := false;
    ShowColHeading   := true;
    ShowRowHeading   := true;
    ShowZeroValues   := false;
    ShowTabs         := 0;
    PrintNoColor     := true;
    PrintGridLines   := false;
    PrintFooter      := '';
    PrintHeader      := '';
    PrintLandscape   := false;
    DefaultFontCharSet := F1RussianCharSet;
    DefaultFontSize := 10;
    nMaxCol := 4;
    ColWidth[1] := Round( 4 * nMyConst);   // № п/п
    ColWidth[2] := Round( 5 * nMyConst);   // Код
    ColWidth[3] := Round(10 * nMyConst);   // КЕКВ
    ColWidth[4] := Round(75 * nMyConst);   // Наименование
    iRow := 1;
    cMsg := 'Справочник КЕКВ';
    TextRC[iRow, 1] := cMsg;
    SetSelection(iRow, 1, iRow, nMaxCol);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    RowHeight[iRow] := Round(1.5 * nMyConst);
    FontBold := true;
    Inc(iRow);
    RowHeight[iRow] := Round(2.5 * nMyConst);
    SetSelection(iRow, 1, iRow, nMaxCol);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    TextRC[iRow, 1] := '№ п/п';
    TextRC[iRow, 2] := 'Код';
    TextRC[iRow, 3] := 'КЕКВ';
    TextRC[iRow, 4] := 'Наименование';
    nPp := 0;
    with qryStZ do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        Inc(iRow);
        Inc(nPp);
        if FieldByName('HsCh').AsBoolean then begin
          SetSelection(iRow, 1, iRow, nMaxCol);
          FontBold := true;
          NumberRC[iRow, 1] := nPp;
          NumberRC[iRow, 2] := FieldByName('KdStZ').AsInteger;
          TextRC[iRow, 3] := FieldByName('ShStZ').AsString;
          TextRC[iRow, 4] := FieldByName('NmStZ').AsString;
          SetSelection(iRow, 3, iRow, 4);
          FontUnderLine := true;
          SetSelection(iRow, 4, iRow, 4);
          SetAlignment(F1HAlignCenter, true, F1VAlignBottom, 0); end
        else begin
          NumberRC[iRow, 1] := nPp;
          NumberRC[iRow, 2] := FieldByName('KdStZ').AsInteger;
          TextRC[iRow, 3] := FieldByName('ShStZ').AsString;
          TextRC[iRow, 4] := MyReplicate(' ', FieldByName('Lvl').AsInteger * 6) +
                         FieldByName('NmStZ').AsString;
          SetSelection(iRow, 4, iRow, 4);
          SetAlignment(F1HAlignLeft, true, F1VAlignBottom, 0);
          if FieldByName('Lvl').AsInteger > 0 then begin
            SetSelection(iRow, 3, iRow, 4);
            FontItalic := true;
            SetSelection(iRow, 3, iRow, 3);
            SetAlignment(F1HAlignCenterAcrossCells, true, F1VAlignBottom, 0);
          end;
        end;
        SetSelection(iRow, 1, iRow, nMaxCol);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    cRandomFileName := RandomFileName;
    if bAppDocsToExcel then begin
      cRandomFileName := cRandomFileName + '.xls';
      WriteEx(cDirTemp + cRandomFileName, F1FileExcel97); end
    else begin
      cRandomFileName := cRandomFileName + '.vts';
      WriteEx(cDirTemp + cRandomFileName, F1FileFormulaOne6);
    end;
    Screen.Cursor := crDefault;
    Free;
  end;
  Screen.Cursor := crDefault;
  MyPreView(cDirTemp, cRandomFileName);
end;
//------------------------------------------------------------------------------
procedure F6PrtTSbu(qrySbu : TQuery);
var nSvNR, iRow, nMyConst, nMaxCol : integer;
    cMsg : ShortString;
    PgSetup : F1PageSetup;
begin
  Screen.Cursor := crHourGlass;
  FormGkCmnPrt := TFormGkCmnPrt.Create(Application);
  with FormGkCmnPrt, F6B do begin
    PgSetup := CreateNewPageSetup;
    SetPageParams(PgSetup);
    SetPageSetup(PgSetup);
    nMyConst := RowHeight[1];
    ShowGridLines    := false;
    ShowColHeading   := true;
    ShowRowHeading   := true;
    ShowZeroValues   := false;
    ShowTabs         := 0;
    PrintNoColor     := true;
    PrintGridLines   := false;
    PrintFooter      := '';
    PrintHeader      := '';
    PrintLandscape   := false;
    DefaultFontCharSet := F1RussianCharSet;
    DefaultFontSize := 10;
    nMaxCol := 3;
    if bFlagDbg then
      nMaxCol := 5;
    ColWidth[1]  := Round(10 * nMyConst);  // Счёт
    ColWidth[2]  := Round(10 * nMyConst);  // Счёт_17
    ColWidth[3]  := Round(75 * nMyConst);  // Наименование
    if bFlagDbg then begin
      ColWidth[3]  := Round(70 * nMyConst);  // Наименование
      ColWidth[4]  := Round( 6 * nMyConst);  // Код
      ColWidth[5]  := Round( 4 * nMyConst);  // Архив
    end;
    iRow := 1;
    cMsg := 'План счетов бухгалтерского учёта';
    TextRC[iRow, 1] := cMsg;
    SetSelection(iRow, 1, iRow, nMaxCol);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    RowHeight[iRow] := Round(1.5 * nMyConst);
    FontBold := true;
    Inc(iRow);
    RowHeight[iRow] := Round(2.5 * nMyConst);
    SetSelection(iRow, 1, iRow, nMaxCol);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    TextRC[iRow, 1] := 'Счёт до 2017 г.';
    TextRC[iRow, 2] := 'Счёт с 2017 г.';
    TextRC[iRow, 3] := 'Название счёта';
    if bFlagDbg then begin
      TextRC[iRow, 4] := 'Код';
      TextRC[iRow, 5] := 'Арх';
    end;
    with qrySbu do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        Inc(iRow);
        if (FieldByName('Lvl').AsInteger = 0) and
                   FieldByName('HsCh').AsBoolean then begin
          cMsg := FieldByName('SchBU').AsString + ' ' +
                     FieldByName('NmSch').AsString;
          if bFlagDbg then
            SetSelection(iRow, 1, iRow, nMaxCol)
 //           SetSelection(iRow, 1, iRow, nMaxCol-2)   // ???
          else
            SetSelection(iRow, 1, iRow, nMaxCol);
          FontBold := true;
          FontUnderLine := true;
          TextRC[iRow, 1] := cMsg;
          if bFlagDbg then begin
            NumberRC[iRow, nMaxCol-1] := FieldByName('KdSch').AsInteger;
            TextRC[iRow, nMaxCol] := FieldByName('Arc').AsString;
            SetSelection(iRow, nMaxCol, iRow, nMaxCol);
             SetAlignment(F1HAlignCenter, false, F1VAlignBottom, 0);
          end; end
        else begin
          TextRC[iRow, 1] := FieldByName('SchBU').AsString;
          TextRC[iRow, 2] := FieldByName('Sch_17').AsString;
          SetSelection(iRow, 1, iRow, nMaxCol);
          if FieldByName('Lvl').AsInteger <= 1 then begin
            SetSelection(iRow, 1, iRow, 1);
            SetAlignment(F1HAlignCenter, false, F1VAlignBottom, 0);
            TextRC[iRow, 2] := ' ' + FieldByName('NmSch').AsString; end
          else begin
            SetSelection(iRow, 1, iRow, 2);
            FontSize := 9;
            SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);
            SetSelection(iRow, 2, iRow, 2);
            FontSize := 9;
            TextRC[iRow, 3] := MyReplicate(' ',
                                           FieldByName('Lvl').AsInteger * 6) +
                                                 FieldByName('NmSch').AsString;
          end;
          if bFlagDbg then begin
            NumberRC[iRow, nMaxCol-1] := FieldByName('KdSch').AsInteger;
            TextRC[iRow, nMaxCol] := FieldByName('Arc').AsString;
            SetSelection(iRow, nMaxCol, iRow, nMaxCol);
            SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
          end;
        end;
        SetSelection(iRow, 1, iRow, nMaxCol);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    cRandomFileName := RandomFileName;
    if bAppDocsToExcel then begin
      cRandomFileName := cRandomFileName + '.xls';
      WriteEx(cDirTemp + cRandomFileName, F1FileExcel97); end
    else begin
      cRandomFileName := cRandomFileName + '.vts';
      WriteEx(cDirTemp + cRandomFileName, F1FileFormulaOne6);
    end;
    Screen.Cursor := crDefault;
    Free;
  end;
  Screen.Cursor := crDefault;
  MyPreView(cDirTemp, cRandomFileName);
end;

end.
