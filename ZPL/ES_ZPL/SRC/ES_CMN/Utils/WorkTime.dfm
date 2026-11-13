object DataWorkTime: TDataWorkTime
  OldCreateOrder = False
  Left = 895
  Top = 166
  Height = 150
  Width = 215
  object Query: TQuery
    SQL.Strings = (
      'select *'
      'from e_days'
      'where e_day between :DtBeg and :DtEnd')
    Left = 24
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DtBeg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DtEnd'
        ParamType = ptUnknown
      end>
  end
end
