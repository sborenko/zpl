unit z_ChONU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls;

type
  TFormChOtklNU = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dbgrONu: TDBGrid;
    qryONu: TQuery;
    dsrcONu: TDataSource;
    qryONuFAM: TStringField;
    qryONuIMA: TStringField;
    qryONuOTCH: TStringField;
    qryONuNR: TIntegerField;
    qryONuKDSPS: TSmallintField;
    qryONuNCH: TStringField;
    qryONuDTPROC: TDateTimeField;
    qryONuTABN: TIntegerField;
    qryONuKDOBJ: TSmallintField;
    qryONuKDKATP: TSmallintField;
    qryONuNOTES: TStringField;
    qryONuOLDKDOBJ: TSmallintField;
    qryONuSVNCH: TStringField;
    qryONuFamIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const SECTION = 'z_ChONU';

var
  FormChOtklNU: TFormChOtklNU;

implementation

uses a_Const, a_Dm, z_Dm, z_Main;

{$R *.dfm}



{
select u.Fam, u.Ima, u.Otch, s.*
from z_sps s
     Left outer join z_UPI u on u.TabN = s.TabN
 where s.DtProc = '09/01/2008' and
                 Exists (Select Tabn from z_Otkl where z_Otkl.TabN = s.TabN and
                                 z_Otkl.DtProc = s.DtProc) and not
                 Exists (Select Tabn from z_NU where z_NU.TabN = s.TabN and
                                 z_NU.DtProc = s.DtProc)


}

end.
 