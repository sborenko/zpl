unit CustStruct;

interface

const
  ID_NOT_DEFINED = 0;
  STR_NOT_DEFINED = '';

type
  String1 = string[1];
  String4 = string[4];
  String15 = string[15];

  TResult = record
    Succeed: boolean;
    ErrCode: integer;
    Error: ShortString;
  end;

  TPersInfo = record
    Id: integer;
    {Familia,
    Nomen,
    Patrium}
    Short: ShortString;
  end;

  TVidNInfo = record
    VidN: String4;
    ShVidN: String15;
    NmVidN: string;
    KEKV: string4;
    Otpuskn, Bolnic, Sovm,
    Zp13,
    Otp,
    Bln,
    SPrm,
    CPrm,
    Deti, DetiM, DetiK, DetiG,
    Spov,
    Ind,
    Dhd,
    OklFnd,
    CBudg,
    SNdb,
    SPdn,
    SPrf,
    SPens,
    SAlim,
    SSocStrah,
    SBzr,
    CNdb,
    Sp_PF,
    Sp_FSTVP,
    Sp_FSNV,
    Sp_FZ: string1;
  end;

  TItemInfo = record
    Id: integer;
    Short: ShortString;
  end;

  TCustStruct = class
  public
    class function InitPayTypeInfo: TVidNInfo;
    class function InitItemInfo: TItemInfo;

    class function InitResult: TResult;
  end;

implementation

//------------------------------------------------------------------------------
class function TCustStruct.InitPayTypeInfo: TVidNInfo;
begin
  with Result do begin
    VidN   := STR_NOT_DEFINED;
    ShVidN := '';
  end;
end;

//------------------------------------------------------------------------------
class function TCustStruct.InitItemInfo: TItemInfo;
begin
  with Result do begin
    Id    := ID_NOT_DEFINED;
    Short := '';
  end;
end;

//------------------------------------------------------------------------------
class function TCustStruct.InitResult: TResult;
begin
  Result.Succeed := true;
  Result.ErrCode := 0;
  Result.Error   := '';
end;

end.
