object DMSpan: TDMSpan
  OldCreateOrder = False
  Left = 879
  Top = 232
  Height = 228
  Width = 215
  object QryPere: TQuery
    SQL.Strings = (
      'select dt_beg, okltrf from z_pere'
      'where tabn = :tabn and dt_beg <= :monthEnd'
      'order by dt_beg desc'
      '')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tabn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'monthEnd'
        ParamType = ptUnknown
      end>
  end
  object QrySpecDays: TQuery
    SQL.Strings = (
      'select e_day, rab_chas'
      'from e_days'
      'where e_day >= :monthBeg and e_day <= :monthEnd'
      'order by e_day desc')
    Left = 96
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'monthBeg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'monthEnd'
        ParamType = ptUnknown
      end>
  end
  object QryHelper: TQuery
    Left = 32
    Top = 96
  end
end
