unit SalaryConst;

interface

type
  // Режимы показа нач.удерж. на главной форме
  TNuShowMode = (
    snuDetail = 1, // старый детальный с огромной кучей пересчётов
    snuCondens,    // старый сжатый
    snuNewShort    // новая попытка показать понятно
  );

const
  EMPL_FULLTIME = 0;
  EMPL_OUTER_PARTTIME = 1;
  EMPL_INNER_PARTTIME = 3;

implementation

end.
