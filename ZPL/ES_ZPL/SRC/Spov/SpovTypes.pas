unit SpovTypes;

interface

type
  TDisplayProgressHandler = procedure(
    cAppendix: ShortString;
    nYear, nQuarter, nMonth,
    nCurrRow, nRowsTotal,
    nStepsTotal: integer;
    cStepName, cStepState: ShortString) of object;

implementation

end.
