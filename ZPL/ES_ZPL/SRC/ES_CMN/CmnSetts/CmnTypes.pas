unit CmnTypes;

interface

type
  TPwdMode = (
    PwdRaw, // И пишутся и используются оригинальные пароли;
    PwdTransit, // переходный период: пишутся оба вида, используются хэшированные;
    PwdHash); // и пишутся и используются хэшированные.

implementation

end.
