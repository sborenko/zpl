object DmMain: TDmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 970
  Top = 245
  Height = 366
  Width = 361
  object DbSpov: TDatabase
    AliasName = 'DBF '#1058#1072#1073#1083#1080#1094#1099
    DatabaseName = 'DbSpov'
    SessionName = 'Default'
    Left = 24
    Top = 24
  end
  object DbOpi: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    Left = 112
    Top = 24
  end
  object QrySpov: TQuery
    DatabaseName = 'DbSpov'
    SQL.Strings = (
      'select distinct numident, pay_mnth, pay_year, zo '
      'from j0510106_1.dbf')
    Left = 24
    Top = 80
  end
  object QryHires: TQuery
    DatabaseName = 'DbMain'
    Left = 112
    Top = 144
  end
  object QryAssigns: TQuery
    DatabaseName = 'DbMain'
    Left = 112
    Top = 200
  end
  object CdsSpans: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 24
  end
  object CdsErrors: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 80
  end
  object QryPerson: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select TabN from z_Upi where Id = :NumIdent')
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NumIdent'
        ParamType = ptUnknown
      end>
  end
end
