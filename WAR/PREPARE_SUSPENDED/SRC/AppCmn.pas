unit AppCmn;

interface

type
  StepEnum = (StepBackupWar, StepUnpackZip, StepPrepSuspEmpls);
  StepSet = set of StepEnum;

  TProgressProc = procedure(Level: Integer; Text: ShortString;
    NewLine: Boolean = true) of object;

const
  STEP_DONE = 'Шаг выполнен.';
  STEP_ERROR = 'Ошибка выполнения шага.';

implementation

end.
