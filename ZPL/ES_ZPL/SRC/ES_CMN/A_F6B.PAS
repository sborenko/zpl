unit A_F6b;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, AxCtrls, OleCtrls, StdCtrls, Buttons, ExtCtrls, IniFiles,
  Math, Menus, DBTables, Db, ShellApi, TTF160_TLB, ComCtrls;

type
  TFormF6B = class(TForm)
    PanelTop: TPanel;
    bBtnExit: TBitBtn;
    sBtnPreview: TSpeedButton;
    sBtnPrinSelection: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ChBoxPrintDialog: TCheckBox;
    popMnu: TPopupMenu;
    popMnuPreview: TMenuItem;
    popMnuPrintSelection: TMenuItem;
    popMnuPrintAll: TMenuItem;
    popMnuSetDialog: TMenuItem;
    popMnuToolBar: TMenuItem;
    popMnuColHeads: TMenuItem;
    popMnuRowHeads: TMenuItem;
    popMnuGridLines: TMenuItem;
    PopMnuFormatNumberDlg: TMenuItem;
    popMnuDm1: TMenuItem;
    popMnuLaunchDesigner: TMenuItem;
    popMnuDm2: TMenuItem;
    popMnuExit: TMenuItem;
    SpeedButton2: TSpeedButton;
    F6B: TF6Book;
    sBtnFormat: TSpeedButton;
    popMnuFormatGeneral: TMenuItem;
    popMnuFormatFixed: TMenuItem;
    popMnuFormatFixed2: TMenuItem;
    popMnuFormatCurrency0: TMenuItem;
    popMnuFormatCurrency2: TMenuItem;
    popMnuFormatDDMMYY: TMenuItem;
    popMnuFormatDDMMYYYY: TMenuItem;
    popMnuFormatHHMM: TMenuItem;
    popMnuFormatHHMMSS: TMenuItem;
    popMnuFormatScientific: TMenuItem;
    popMnuDefaultFont: TMenuItem;
    popMnuEditBar: TMenuItem;
    popMnuSheetDlg: TMenuItem;
    popMnuOptionDlg: TMenuItem;
    popMnuShowZeroValues: TMenuItem;
    pomMnuPrt: TMenuItem;
    popMnuHeads: TMenuItem;
    popMnuFormatSheet: TMenuItem;
    popMnuFormatSelections: TMenuItem;
    popMnuCellsAlign: TMenuItem;
    popMnuCellsFont: TMenuItem;
    popMnuCellsBorder: TMenuItem;
    popMnuCellsPattern: TMenuItem;
    popMnuOthers: TMenuItem;
    popMnuCellsCommon: TMenuItem;
    popMnuPageSetup: TMenuItem;
    popMnuPrintSetup: TMenuItem;
    MainMnu: TMainMenu;
    mMnuFile: TMenuItem;
    mMnuFileNew: TMenuItem;
    mMnuFileOpen: TMenuItem;
    mMnuFileClose: TMenuItem;
    N1: TMenuItem;
    mMnuFileSave: TMenuItem;
    mMnuFileSaveAs: TMenuItem;
    N2: TMenuItem;
    mMnuFilePageSetUp: TMenuItem;
    mMnuFilePrintArea: TMenuItem;
    mMnuFileSetPrintArea: TMenuItem;
    mMnuFileClearPrintArea: TMenuItem;
    mMnuFilePrintTitles: TMenuItem;
    mMnuFileSetPrintTitle: TMenuItem;
    mMnuFileClearPrintTitle: TMenuItem;
    N3: TMenuItem;
    mMnuFilePrintPreview: TMenuItem;
    mMnuFilePrint: TMenuItem;
    N4: TMenuItem;
    mMnuFileHistory: TMenuItem;
    N8: TMenuItem;
    mMnuFileExit: TMenuItem;
    mMnuEdit: TMenuItem;
    mMnuEditCut: TMenuItem;
    mMnuEditCopy: TMenuItem;
    mMnuEditPaste: TMenuItem;
    mMnuEditPasteSpecial: TMenuItem;
    mMnuEditCopyCellFormat: TMenuItem;
    mMnuEditSep1: TMenuItem;
    mMnuEditSort: TMenuItem;
    mMnuEditFill: TMenuItem;
    mMnuEditFillDown: TMenuItem;
    mMnuEditFillUp: TMenuItem;
    mMnuEditClear: TMenuItem;
    mMnuEditClearAll: TMenuItem;
    mMnuEditClearFormat: TMenuItem;
    mMnuEditClearContents: TMenuItem;
    mMnuEditDelete: TMenuItem;
    mMnuEditSep2: TMenuItem;
    mMnuEditFind: TMenuItem;
    mMnuEditReplace: TMenuItem;
    mMnuEditGoTo: TMenuItem;
    mMnuView: TMenuItem;
    mMnuViewToolBar: TMenuItem;
    mMnuViewFormulaBar: TMenuItem;
    mMnuViewStatusBar: TMenuItem;
    mMnuInsert: TMenuItem;
    mMnuInsertCells: TMenuItem;
    mMnuInsertRows: TMenuItem;
    mMnuInsertColumns: TMenuItem;
    mMnuInsertWorksheet: TMenuItem;
    mMnuFormat: TMenuItem;
    mMnuFormatCells: TMenuItem;
    mMnuFormatRow: TMenuItem;
    mMnuFormatRowHeight: TMenuItem;
    mMnuFormatRowHide: TMenuItem;
    mMnuFormatRowUnhide: TMenuItem;
    mMnuFormatRowDefaultHeight: TMenuItem;
    mMnuFormatColumn: TMenuItem;
    mMnuFormatColumnWidth: TMenuItem;
    mMnuFormatColumnAutofitSelection: TMenuItem;
    mMnuFormatColumnHide: TMenuItem;
    mMnuFormatColumnUnhide: TMenuItem;
    mMnuFormatColumnDefaultwidth: TMenuItem;
    mMnuFormatSheet: TMenuItem;
    mMnuFormatSheetProperties: TMenuItem;
    mMnuFormatSheetProtection: TMenuItem;
    mMnuFormatSep1: TMenuItem;
    mMnuFormatFreesePanel: TMenuItem;
    mMnuFormatDefaultFont: TMenuItem;
    mMnuTools: TMenuItem;
    mMnuToolsRecalc: TMenuItem;
    mMnuToolsOptions: TMenuItem;
    mMnuWindows: TMenuItem;
    NewWindow1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    ArrangeIcons1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    StatBar: TStatusBar;
    FontDialog: TFontDialog;
    mMnuDelete: TMenuItem;
    mMnuDeleteRow: TMenuItem;
    mMnuDeleteColumn: TMenuItem;
    mMnuDeleteSheet: TMenuItem;
    PrinterSetupDialog: TPrinterSetupDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrintSelectionClick(Sender: TObject);
    procedure sBtnPrintAllClick(Sender: TObject);
    procedure F6BStartEdit(Sender: TObject;
                var EditString: WideString; var Cancel: Smallint);
    function ColNumber2ColName(nCol : smallInt) : string;
    procedure sBtnPreviewClick(Sender: TObject);
    procedure popMnuSetDialogClick(Sender: TObject);
    procedure popMnuToolBarClick(Sender: TObject);
    procedure popMnuColHeadsClick(Sender: TObject);
    procedure popMnuRowHeadsClick(Sender: TObject);
    procedure popMnuGridLinesClick(Sender: TObject);
    procedure popMnuLaunchDesignerClick(Sender: TObject);
    procedure popMnuExitClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sBtnFormatClick(Sender: TObject);
    procedure popMnuFormatGeneralClick(Sender: TObject);
    procedure popMnuFormatFixedClick(Sender: TObject);
    procedure popMnuFormatFixed2Click(Sender: TObject);
    procedure popMnuFormatCurrency0Click(Sender: TObject);
    procedure popMnuFormatCurrency2Click(Sender: TObject);
    procedure popMnuFormatDDMMYYClick(Sender: TObject);
    procedure popMnuFormatDDMMYYYYClick(Sender: TObject);
    procedure popMnuFormatScientificClick(Sender: TObject);
    procedure popMnuDefaultFontClick(Sender: TObject);
    procedure popMnuFormatHHMMClick(Sender: TObject);
    procedure popMnuFormatHHMMSSClick(Sender: TObject);
    procedure popMnuEditBarClick(Sender: TObject);
    procedure popMnuShowZeroValuesClick(Sender: TObject);
    procedure popMnuCellsAlignClick(Sender: TObject);
    procedure popMnuCellsFontClick(Sender: TObject);
    procedure popMnuCellsBorderClick(Sender: TObject);
    procedure popMnuCellsPatternClick(Sender: TObject);
    procedure popMnuCellsCommonClick(Sender: TObject);
    procedure popMnuPageSetupClick(Sender: TObject);
    procedure popMnuPrintSetupClick(Sender: TObject);
    procedure mMnuFileExitClick(Sender: TObject);
    procedure mMnuFileOpenClick(Sender: TObject);
    procedure mMnuFileSaveAsClick(Sender: TObject);
    procedure AboutProgram1Click(Sender: TObject);
    procedure popMnuSheetDlgClick(Sender: TObject);
    procedure popMnuOptionDlgClick(Sender: TObject);
    procedure mMnuFormatRowHeightClick(Sender: TObject);
    procedure mMnuFormatColumnWidthClick(Sender: TObject);
    procedure F6BSelChange(Sender: TObject);
    procedure mMnuFormatFreesePanelClick(Sender: TObject);
    procedure mMnuFormatDefaultFontClick(Sender: TObject);
    procedure mMnuViewStatusBarClick(Sender: TObject);
    procedure mMnuToolsRecalcClick(Sender: TObject);
    procedure mMnuFileSetPrintAreaClick(Sender: TObject);
    procedure mMnuFileClearPrintAreaClick(Sender: TObject);
    procedure mMnuFormatRowHideClick(Sender: TObject);
    procedure mMnuFormatRowUnhideClick(Sender: TObject);
    procedure mMnuFormatRowDefaultHeightClick(Sender: TObject);
    procedure mMnuFormatColumnAutofitSelectionClick(Sender: TObject);
    procedure mMnuFormatColumnHideClick(Sender: TObject);
    procedure mMnuFormatColumnUnhideClick(Sender: TObject);
    procedure mMnuFormatColumnDefaultwidthClick(Sender: TObject);
    procedure mMnuInsertRowsClick(Sender: TObject);
    procedure mMnuInsertColumnsClick(Sender: TObject);
    procedure mMnuDeleteRowClick(Sender: TObject);
    procedure mMnuDeleteColumnClick(Sender: TObject);
    procedure mMnuFormatSheetProtectionClick(Sender: TObject);
  private
    { Private declarations }
    bSvShowEditBar,
    bSvShowZeroValues,
    bSvShowGridLines,
    bSvShowRowHeading,
    bSvShowColHeading : boolean;
    procedure SetSavedStat;
  public
    { Public declarations }
  end;

procedure ShowF6File(cFullFileName : string);

var
  FormF6B: TFormF6B;

const SECTION = 'F6B';

implementation

{$R *.DFM}

uses A_Const, A_DM, A_Lib;

//====================================================================
procedure ShowF6File(cFullFileName : string);
begin
  Screen.Cursor := crHourGlass;
  with TFormF6B.Create(Application) do begin
    if cFullFileName <> '' then begin
      F6B.ReadEx(cFullFileName);
      F6B.MaxRow := F6B.LastRow + 1;
      F6B.MaxCol := F6B.LastCol + 1;
      F6B.ColWidth[F6B.MaxCol] := F6B.RowHeight[F6B.MaxRow]*3;
    end;
    SetSavedStat;
    StatBar.Panels[0].Text := F6B.FormatRCNr(F6B.Row, F6B.Col, False);
    Screen.Cursor := crDefault;
    ShowModal;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormF6B.SetSavedStat;
begin
  with F6B do begin
    ShowEditBar := bSvShowEditBar;
    ShowEditBarCellRef := ShowEditBar;
    popMnuEditBar.Checked := ShowEditBar;
    mMnuViewFormulaBar.Checked := ShowEditBar;
    ShowZeroValues := bSvShowZeroValues;
    popMnuShowZeroValues.Checked := ShowZeroValues;
    ShowGridLines := bSvShowGridLines;
    popMnuGridLines.Checked := ShowGridLines;
    ShowRowHeading := bSvShowRowHeading;
    popMnuRowHeads.Checked := ShowRowHeading;
    ShowColHeading := bSvShowColHeading;
    popMnuColHeads.Checked := ShowColHeading;
    PrintFooter := '';
    PrintHeader := '';
    mMnuFormatSheetProtection.Checked := EnableProtection;
  end;
end;
//--------------------------------------------------------------------
procedure TFormF6B.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 50);
	  Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 353);
    Width  := ReadInteger(SECTION, 'wW', 353);
    ChBoxPrintDialog.Checked := ReadBool(SECTION, 'ChBxPrt', true);
    popMnuSetDialog.Checked  := ChBoxPrintDialog.Checked;
    popMnuColHeads.Checked   := ReadBool(SECTION, 'ClHe', false);
    popMnuRowHeads.Checked   := ReadBool(SECTION, 'RwHe', false);
    popMnuGridLines.Checked  := ReadBool(SECTION, 'GrLn', false);
    PanelTop.Visible         := ReadBool(SECTION, 'PnTo', false);
    StatBar.Visible          := ReadBool(SECTION, 'StBr', false);
    bSvShowEditBar           := ReadBool(SECTION, 'ShwEdBar', false);
    bSvShowZeroValues        := ReadBool(SECTION, 'ShwZero', false);
    bSvShowGridLines         := ReadBool(SECTION, 'ShwGrLns', false);
    bSvShowRowHeading        := ReadBool(SECTION, 'ShwRowH', false);
    bSvShowColHeading        := ReadBool(SECTION, 'ShwColH', false);
    Free;
  end;
  // т.к. таблица грузится после FormCreate, установки, касающиеся
  // таблицы грузятся вместе с ней.
  // Посему, если хотим сохранять и затем восстанавивать установки,
  // их нужно запоминать в независящих от таблицы переменных
  // и задавать после загрузки таблицы. Для этого bSvShowEditBar и др.
  popMnuToolBar.Checked     := PanelTop.Visible;
  mMnuViewToolBar.Checked   := PanelTop.Visible;
  mMnuViewStatusBar.Checked := StatBar.Visible;
end;
//--------------------------------------------------------------------
procedure TFormF6B.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'ChBxPrt', ChBoxPrintDialog.Checked);
    WriteBool(SECTION, 'ClHe', popMnuColHeads.Checked);
    WriteBool(SECTION, 'RwHe', popMnuRowHeads.Checked);
    WriteBool(SECTION, 'GrLn', popMnuGridLines.Checked);
    WriteBool(SECTION, 'PnTo', PanelTop.Visible);
    WriteBool(SECTION, 'StBr', StatBar.Visible);
    WriteBool(SECTION, 'ShwEdBar', F6B.ShowEditBar);
    WriteBool(SECTION, 'ShwZero', F6B.ShowZeroValues);
    WriteBool(SECTION, 'ShwGrLns', F6B.ShowGridLines);
    WriteBool(SECTION, 'ShwRowH', F6B.ShowRowHeading);
    WriteBool(SECTION, 'ShwColH', F6B.ShowColHeading);
	  Free;
  end;
end;
//--------------------------------------------------------------------
function TFormF6B.ColNumber2ColName(nCol : smallInt) : string;
begin
  if nCol <= 26 then                                  {A..Z}
    result := Chr(nCol+64)
  else if (nCol > 27) and (nCol <= 256) then          {AA..IV}
    result := Copy(F6B.FormatRCNr(1, nCol, False), 1, 2)
  else result := '';
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFileSetPrintAreaClick(Sender: TObject);
var bIsSelection : boolean;
begin
  bIsSelection := pos(':', F6B.Selection) > 0;
  if not bIsSelection then begin
    MessageDlg('Ничего не выделено для печати.',
                                            mtError, [mbOk], 0);
    Exit;
  end;
  F6B.SetPrintAreaFromSelection;
  mMnuFileSetPrintArea.Enabled := false;
  mMnuFileClearPrintArea.Enabled := true;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFileClearPrintAreaClick(Sender: TObject);
begin
  F6B.PrintArea := '';
  mMnuFileSetPrintArea.Enabled := true;
  mMnuFileClearPrintArea.Enabled := false;
end;
//--------------------------------------------------------------------
procedure TFormF6B.sBtnPrintSelectionClick(Sender: TObject);
var bIsSelection : boolean;
begin
  bIsSelection := pos(':', F6B.Selection) > 0;
  if not bIsSelection then begin
    MessageDlg('Ничего не выделено для печати.',
                                            mtError, [mbOk], 0);
    Exit;
  end;
  with F6B do begin
    SetPrintAreaFromSelection;
    PrintGridLines := false;
    PrintNoColor := true;
    FilePrint(ChBoxPrintDialog.Checked);
  end;
end;
//--------------------------------------------------------------------
procedure TFormF6B.sBtnPrintAllClick(Sender: TObject);
var nSvRow, nSvCol : integer;
begin
  with F6B do begin
    GetActiveCell(nSvRow, nSvCol);
    DefinedName['Print_Area'] := '';
    PrintGridLines := false;
    PrintNoColor := true;
    FilePrint(ChBoxPrintDialog.Checked);
  end;
end;
//--------------------------------------------------------------------
procedure TFormF6B.F6BStartEdit(Sender: TObject;
                   var EditString: WideString; var Cancel: Smallint);
begin
//  if bFormF6FillEnd then
//    Cancel := 1;
end;
//--------------------------------------------------------------------
procedure TFormF6B.sBtnPreviewClick(Sender: TObject);
begin
  F6B.FilePrintPreview;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuSetDialogClick(Sender: TObject);
begin
  ChBoxPrintDialog.Checked := not ChBoxPrintDialog.Checked;
  popMnuSetDialog.Checked := ChBoxPrintDialog.Checked;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuToolBarClick(Sender: TObject);
begin
  PanelTop.Visible := not PanelTop.Visible;
  popMnuToolBar.Checked := PanelTop.Visible;
  mMnuViewToolBar.Checked := PanelTop.Visible;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuViewStatusBarClick(Sender: TObject);
begin
  StatBar.Visible := not StatBar.Visible;
  mMnuViewStatusBar.Checked := StatBar.Visible;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuColHeadsClick(Sender: TObject);
begin
  F6B.ShowColHeading := not F6B.ShowColHeading;
  popMnuColHeads.Checked := F6B.ShowColHeading;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuRowHeadsClick(Sender: TObject);
begin
  F6B.ShowRowHeading := not F6B.ShowRowHeading;
  popMnuRowHeads.Checked := F6B.ShowRowHeading;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuGridLinesClick(Sender: TObject);
begin
  F6B.ShowGridLines := not F6B.ShowGridLines;
  popMnuGridLines.Checked := F6B.ShowGridLines;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuLaunchDesignerClick(Sender: TObject);
begin
  F6B.LaunchDesigner;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuExitClick(Sender: TObject);
begin
  Close;
end;
//--------------------------------------------------------------------
procedure TFormF6B.SpeedButton2Click(Sender: TObject);
var pBuf : WideString; pFileType : SmallInt;
begin
  pBuf := '';
  F6B.SaveFileDlg('Сохранение на диск', pBuf, pFileType);
  if (pFileType > 0) and (pBuf <> '') then
    F6B.Write(pBuf, pFileType);
end;
//--------------------------------------------------------------------
procedure TFormF6B.sBtnFormatClick(Sender: TObject);
begin
  F6B.FormatCellsDlg(F1AllPages - F1NumberPage);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatGeneralClick(Sender: TObject);
begin
  F6B.FormatGeneral;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatFixedClick(Sender: TObject);
begin
  F6B.FormatFixed;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatFixed2Click(Sender: TObject);
begin
  F6B.FormatFixed2;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatCurrency0Click(Sender: TObject);
begin
  F6B.FormatCurrency0;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatCurrency2Click(Sender: TObject);
begin
  F6B.FormatCurrency2;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatDDMMYYClick(Sender: TObject);
begin
  F6B.NumberFormat := 'dd/mm/yy';
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatDDMMYYYYClick(Sender: TObject);
begin
  F6B.NumberFormat := 'dd/mm/yyyy';
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatScientificClick(Sender: TObject);
begin
  F6B.FormatScientific;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuDefaultFontClick(Sender: TObject);
begin
  F6B.FormatDefaultFontDlg;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatHHMMClick(Sender: TObject);
begin
  F6B.NumberFormat := 'hh:mm';
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuFormatHHMMSSClick(Sender: TObject);
begin
  F6B.NumberFormat := 'hh:mm:ss';
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuCellsAlignClick(Sender: TObject);
begin
  F6B.FormatCellsDlg(F1AlignmentPage);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuCellsFontClick(Sender: TObject);
begin
  F6B.FormatCellsDlg(F1FontPage);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuCellsBorderClick(Sender: TObject);
begin
  F6B.FormatCellsDlg(F1BorderPage);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuCellsPatternClick(Sender: TObject);
begin
  F6B.FormatCellsDlg(F1PatternsPage);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuCellsCommonClick(Sender: TObject);
begin
  F6B.FormatCellsDlg(F1AllPages - F1NumberPage);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuPageSetupClick(Sender: TObject);
begin
  F6B.FilePageSetupDlgEx(F1AllPages);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuPrintSetupClick(Sender: TObject);
begin
  PrinterSetupDialog.Execute;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFileExitClick(Sender: TObject);
begin
  Close;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFileOpenClick(Sender: TObject);
//var pBuf : WideString; pFileType : SmallInt;

var cResult : String; hWndParent : HWND;
begin
  cResult := '';
  hWndParent := Handle;
  cResult := F6B.OpenFileDlgEx ('Выберите файл', hWndParent);
//  ShowMessage(cResult);
  if cResult <> '' then
    F6B.ReadEx(cResult);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFileSaveAsClick(Sender: TObject);
var pBuf : WideString; pFileType : SmallInt;
begin
  F6B.SaveFileDlg('Выберите имя и тип файла', pBuf, pFileType);
  if (pBuf <> '') and (pFileType > 0) then
    F6b.Write(pBuf, pFileType);
end;
//--------------------------------------------------------------------
procedure TFormF6B.AboutProgram1Click(Sender: TObject);
begin
  MessageDlg('Адаптирую под себя Tidestone''овскую' + #13#10 +
             'Formula One Version 6.0.0 Build 40',
             mtInformation, [mbOk], 0);
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuSheetDlgClick(Sender: TObject);
begin
  F6B.FormatSheetDlg(F1AllPages, False);
  // т.к. тут могут быть изменены некоторые параметры,
  // нужно переустановить флажки соответствующих пунктов меню
  popMnuEditBar.Checked        := F6B.ShowEditBar;
  popMnuShowZeroValues.Checked := F6B.ShowZeroValues;
  popMnuGridLines.Checked      := F6B.ShowGridLines;
  popMnuColHeads.Checked       := F6B.ShowColHeading;
  popMnuRowHeads.Checked       := F6B.ShowRowHeading;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuOptionDlgClick(Sender: TObject);
begin
  F6B.OptionsDlg(F1AllPages);
  // т.к. тут могут быть изменены некоторые параметры,
  // нужно переустановить флажки соответствующих пунктов меню
  popMnuEditBar.Checked        := F6B.ShowEditBar;
  popMnuShowZeroValues.Checked := F6B.ShowZeroValues;
  popMnuGridLines.Checked      := F6B.ShowGridLines;
  popMnuColHeads.Checked       := F6B.ShowColHeading;
  popMnuRowHeads.Checked       := F6B.ShowRowHeading;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuEditBarClick(Sender: TObject);
begin
  F6B.ShowEditBar := not F6B.ShowEditBar;
  F6B.ShowEditBarCellRef := F6B.ShowEditBar;
  popMnuEditBar.Checked := F6B.ShowEditBar;
  mMnuViewFormulaBar.Checked := F6B.ShowEditBar;
end;
//--------------------------------------------------------------------
procedure TFormF6B.popMnuShowZeroValuesClick(Sender: TObject);
begin
  F6B.ShowZeroValues := not F6B.ShowZeroValues;
  popMnuShowZeroValues.Checked := F6B.ShowZeroValues;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatRowHeightClick(Sender: TObject);
begin
  F6B.RowHeightDlg;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatRowHideClick(Sender: TObject);
begin
  with F6B do
    SetRowHidden(Row, Row, true);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatRowUnhideClick(Sender: TObject);
begin
  with F6B do
    SetRowHidden(MinRow, LastRow, false);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatRowDefaultHeightClick(Sender: TObject);
begin
  F6B.DefRowHeightDlg;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatColumnWidthClick(Sender: TObject);
begin
  F6B.ColWidthDlg;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatColumnAutofitSelectionClick(Sender: TObject);
var bIsSelection : boolean;  cMsg : string;
begin
  cMsg := F6B.Selection;
  bIsSelection := pos(':', cMsg) > 0;
  if not bIsSelection then
    MessageDlg('Ничего не выделено для печати.',
                                            mtError, [mbOk], 0)
  else
    MessageDlg('Выделено: ' + cMsg, mtInformation, [mbOk], 0);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatColumnHideClick(Sender: TObject);
begin
  with F6B do
    SetColHidden(Col, Col, true);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatColumnUnhideClick(Sender: TObject);
begin
  with F6B do
    SetColHidden(MinCol, LastCol, false);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatColumnDefaultwidthClick(Sender: TObject);
begin
  F6B.DefColWidthDlg;
end;
//--------------------------------------------------------------------
procedure TFormF6B.F6BSelChange(Sender: TObject);
begin
  StatBar.Panels[0].Text := F6B.FormatRCNr(F6B.Row, F6B.Col, False);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatFreesePanelClick(Sender: TObject);
begin
  with F6B do begin
    if (FixedRows <> 0) or (FixedCols <> 0) then begin
      FixedRows := 0;
      FixedCols := 0;
      mMnuFormatFreesePanel.Caption := 'Зафиксировать'; end
    else begin
      if Col > 1 then begin
        FixedCol := 1;
        FixedCols := Col-1;
      end;
      if Row > 1 then begin
        FixedRow := 1;
        FixedRows := Row-1;
      end;
      mMnuFormatFreesePanel.Caption := 'Расфиксировать';
    end;
  end;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatDefaultFontClick(Sender: TObject);
var pBuf : WideString; pCharSet : TOleEnum; pSize : SmallInt;
begin
  F6B.GetDefaultFontEx(pBuf, pCharSet, pSize);
  with FontDialog.Font do begin
    Name := pBuf;
    CharSet := pCharSet;
    Size := pSize div 20;
  end;
  if FontDialog.Execute then
    F6B.SetDefaultFontEx(FontDialog.Font.Name,
                            FontDialog.Font.CharSet,
                            FontDialog.Font.Size);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuToolsRecalcClick(Sender: TObject);
begin
  F6B.Recalc;
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuInsertRowsClick(Sender: TObject);
begin
  with F6B do
    InsertRange(Row, -1, Row, -1, F1ShiftRows + F1FixupPrepend);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuInsertColumnsClick(Sender: TObject);
begin
  with F6B do
    InsertRange(-1, Col, -1, Col, F1ShiftCols + F1FixupPrepend);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuDeleteRowClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Удалить строку ' +
                      IntToStr(F6B.Row) + '?:'),
                      PChar(Application.Title),
            MB_YESNO + MB_ICONWARNING) = IDYES) then with F6B do
    DeleteRange(Row, -1, Row, -1, F1ShiftRows);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuDeleteColumnClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Удалить колонку ' +
                      ColNumber2ColName(F6B.Col) + '?:'),
                      PChar(Application.Title),
            MB_YESNO + MB_ICONWARNING) = IDYES) then with F6B do
    DeleteRange(-1, Col, -1, Col, F1ShiftCols);
end;
//--------------------------------------------------------------------
procedure TFormF6B.mMnuFormatSheetProtectionClick(Sender: TObject);
begin
  F6B.EnableProtection := not F6B.EnableProtection;
  mMnuFormatSheetProtection.Checked := F6B.EnableProtection;
end;

end.
