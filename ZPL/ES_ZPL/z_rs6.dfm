object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 454
  Top = 303
  Height = 253
  Width = 527
  object CdsVidN: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 16
    object CdsVidNId: TIntegerField
      FieldName = 'Id'
    end
    object CdsVidNVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object CdsVidNKdObj: TIntegerField
      FieldName = 'KdObj'
    end
    object CdsVidNKdKatP: TIntegerField
      FieldName = 'KdKatP'
    end
    object CdsVidNKdTheme: TIntegerField
      FieldName = 'KdTheme'
    end
    object CdsVidNKdSps: TIntegerField
      FieldName = 'KdSps'
    end
    object CdsVidNGrp: TIntegerField
      FieldName = 'Grp'
    end
    object CdsVidNSovm: TStringField
      FieldName = 'Sovm'
      Size = 1
    end
    object CdsVidNDtBeg: TDateTimeField
      FieldName = 'DtBeg'
    end
    object CdsVidNDtEnd: TDateTimeField
      FieldName = 'DtEnd'
    end
  end
  object CdsLocks: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 16
  end
end
