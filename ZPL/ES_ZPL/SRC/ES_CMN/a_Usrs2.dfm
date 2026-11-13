object Form_UsersNew: TForm_UsersNew
  Left = 373
  Top = 156
  Width = 500
  Height = 641
  BorderIcons = [biSystemMenu]
  Caption = 'Form_UsersNew'
  Color = clBtnFace
  Constraints.MaxHeight = 750
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 220
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlUsrs: TPageControl
    Left = 0
    Top = 0
    Width = 492
    Height = 614
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object dbgrUsers: TDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 550
        Hint = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcUsers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrUsersDrawColumnCell
        OnDblClick = dbgrUsersDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'KdUsr'
            ReadOnly = True
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmUsr'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatUsr'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PswUsr'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vkl'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            Width = 103
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 550
        Width = 484
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          484
          33)
        object sBtnForw1: TSpeedButton
          Left = 319
          Top = 3
          Width = 75
          Height = 27
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1083#1077#1077
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
            4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
            0000334A23333364A233333F38333333F383333300003366A6333342A2333333
            F383333F3383333300003334A263364AA3333333F338333F3833333300003336
            4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
            8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
            4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
            0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
            F333333383333333000033334AAA2233333333333F3333383333333300003333
            34A223333333333333F333833333333300003333334A443333333333333F3833
            33333333000033333342A63333333333333F33833333333300003333334AA633
            33333333333F3383333333330000333333666333333333333338883333333333
            0000}
          NumGlyphs = 2
          OnClick = sBtnForw1Click
        end
        object bBtnCancel1: TBitBtn
          Left = 407
          Top = 3
          Width = 75
          Height = 27
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkCancel
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 2
      object Splitter1: TSplitter
        Left = 0
        Top = 307
        Width = 484
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object LabelNmUsr: TLabel
        Left = 0
        Top = 0
        Width = 484
        Height = 17
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'LabelNmUsr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 550
        Width = 484
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          484
          33)
        object sBtnBack2: TSpeedButton
          Left = 319
          Top = 3
          Width = 75
          Height = 27
          Anchors = [akTop, akRight]
          Caption = #1053#1072#1079#1072#1076
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
            44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
            00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
            33833F333383F33300003333AA463362A433333333383F333833F33300003333
            6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
            33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
            6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
            000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
            333383333333F3330000333333322AAA4333333333333833333F333300003333
            333322A4333333333333338333F333330000333333344A433333333333333338
            3F333333000033333336A24333333333333333833F333333000033333336AA43
            33333333333333833F3333330000333333336663333333333333333888333333
            0000}
          NumGlyphs = 2
          OnClick = sBtnBack2Click
        end
        object LabelMsg: TLabel
          Left = 7
          Top = 9
          Width = 55
          Height = 13
          Caption = 'LabelMsg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bBtnCancel2: TBitBtn
          Left = 407
          Top = 3
          Width = 75
          Height = 27
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object dbgrUsrCmp: TDBGrid
        Left = 0
        Top = 17
        Width = 484
        Height = 290
        Hint = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1085#1099#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099
        Align = alTop
        Color = clInfoBk
        DataSource = dsrcUsrCmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'KDUSR'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMCMP'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LVL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 234
            Visible = True
          end>
      end
      object PageControlCmp: TPageControl
        Left = 0
        Top = 310
        Width = 484
        Height = 240
        ActivePage = tsBnkPdr
        Align = alClient
        Style = tsButtons
        TabOrder = 2
        object tsZplSps: TTabSheet
          Caption = 'tsZplSps'
          ImageIndex = 3
          object dbgrUsrZplSps: TDBGrid
            Left = 0
            Top = 0
            Width = 476
            Height = 209
            Align = alClient
            Color = 8250615
            DataSource = dsrcUsrZplSps
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            PopupMenu = pop
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDUSR'
                Width = 39
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTES'
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SHSPS'
                Width = 53
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMSPS'
                Width = 177
                Visible = True
              end>
          end
        end
        object tsBnkPdr: TTabSheet
          Caption = 'tsBnkPdr'
          ImageIndex = 1
          object dbgrBPdr: TDBGrid
            Left = 0
            Top = 0
            Width = 476
            Height = 209
            Hint = 
              #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1088#1072#1089#1095#1077#1090#1085#1099#1077' '#1089#1095#1077#1090#1072' '#1087#1086' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1091' "'#1041#1072#1085#1082'". '#1045#1089#1083#1080' '#1085#1077' '#1079#1072#1087#1086#1083#1085#1077#1085 +
              ' - '#1076#1086#1089#1090#1091#1087#1085#1099' '#1074#1089#1077'.'
            Align = alClient
            Color = 11861218
            DataSource = dsrcBPdr
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pop
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDPDR'
                Width = 26
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMWHO'
                Width = 111
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SCHBU'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMVALSOKR'
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RSCH'
                Width = 91
                Visible = True
              end>
          end
        end
        object tsZero: TTabSheet
          Caption = 'tsZero'
          ImageIndex = 2
        end
        object tsPstSBU: TTabSheet
          Caption = 'tsPstSBU'
          ImageIndex = 3
          object dbgrPstSbu: TDBGrid
            Left = 0
            Top = 0
            Width = 476
            Height = 209
            Align = alClient
            Color = 9752563
            DataSource = dsrcPstSbu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'SCHBU'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDSCH'
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMSCH'
                Width = 196
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTES'
                Width = 145
                Visible = True
              end>
          end
        end
        object tsStG: TTabSheet
          Caption = 'tsStG'
          ImageIndex = 4
          object dbgrUsrOb: TDBGrid
            Left = 0
            Top = 0
            Width = 476
            Height = 209
            Hint = #1057#1087#1080#1089#1086#1082' '#1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1086#1073#1097#1077#1078#1080#1090#1080#1081
            Align = alClient
            Color = clMoneyGreen
            DataSource = dsrcUsrOb
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pop
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEnter = dbGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDOB'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMOB'
                Width = 140
                Visible = True
              end>
          end
        end
      end
    end
  end
  object qryUsers: TQuery
    CachedUpdates = True
    BeforePost = qryUsersBeforePost
    AfterPost = qryUsersAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from Usrs')
    UpdateObject = updUsers
    Left = 40
    Top = 136
    object qryUsersNR: TAutoIncField
      FieldName = 'NR'
      Origin = 'VSKDT.ZplUsrs.NR'
    end
    object qryUsersKdUsr: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KdUsr'
      Origin = 'VSKDT.ZplUsrs.KdUsr'
    end
    object qryUsersNmUsr: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'NmUsr'
      Origin = 'VSKDT.ZplUsrs.NmUsr'
      Size = 25
    end
    object qryUsersKdKatUsr: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KdKatUsr'
      Origin = 'VSKDT.ZplUsrs.KdKatUsr'
    end
    object qryUsersPswUsr: TStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'PswUsr'
      Origin = 'VSKDT.ZplUsrs.PswUsr'
      Size = 25
    end
    object qryUsersKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1080#1089#1086#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.USRS.KDSPS'
    end
    object qryUsersVkl: TStringField
      DisplayLabel = #1042#1082#1083
      FieldName = 'Vkl'
      Origin = 'VSKDT.ZplUsrs.Vkl'
      Size = 1
    end
    object qryUsersNotes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'Notes'
      Origin = 'VSKDT.ZplUsrs.Notes'
      Size = 35
    end
    object qryUsersINCLZPLSPZ: TStringField
      DisplayLabel = #1064#1055#1047
      FieldName = 'INCLZPLSPZ'
      Origin = 'DbMain.USRS.INCLZPLSPZ'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcUsers: TDataSource
    DataSet = qryUsers
    OnDataChange = dsrcUsersDataChange
    Left = 56
    Top = 152
  end
  object updUsers: TUpdateSQL
    ModifySQL.Strings = (
      'update Usrs'
      'set'
      '  KDKATUSR = :KDKATUSR,'
      '  KDUSR = :KDUSR,'
      '  NMUSR = :NMUSR,'
      '  PSWUSR = :PSWUSR,'
      '  KDSPS = :KDSPS,'
      '  NOTES = :NOTES,'
      '  VKL = :VKL,'
      '  INCLZPLSPZ = :INCLZPLSPZ'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Usrs'
      
        '  (KDKATUSR, KDUSR, NMUSR, PSWUSR, KDSPS, NOTES, VKL, INCLZPLSPZ' +
        ')'
      'values'
      
        '  (:KDKATUSR, :KDUSR, :NMUSR, :PSWUSR, :KDSPS, :NOTES, :VKL, :IN' +
        'CLZPLSPZ)')
    DeleteSQL.Strings = (
      'delete from Usrs'
      'where'
      '  NR = :OLD_NR')
    Left = 64
    Top = 160
  end
  object qryTmp: TQuery
    Left = 376
    Top = 104
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 120
    Top = 88
    object popHead: TMenuItem
      Caption = '== '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
    object popCreKdObjLst: TMenuItem
      Caption = #1053#1072#1097#1077#1083#1082#1072#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' ...'
      OnClick = popCreKdObjLstClick
    end
    object popUsrObLst: TMenuItem
      Caption = #1053#1072#1097#1077#1083#1082#1072#1090#1100' '#1086#1073#1097#1077#1078#1080#1090#1080#1081' ...'
      OnClick = popUsrObLstClick
    end
  end
  object qryUsrCmp: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ZZ_UsrCmp')
    UpdateObject = updUsrCmp
    Left = 196
    Top = 123
    object qryUsrCmpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.ZZ_USRCMP.NR'
    end
    object qryUsrCmpKDUSR: TSmallintField
      DisplayLabel = #1050#1076#1055#1086#1083#1100#1079
      FieldName = 'KDUSR'
      Origin = 'DbMain.ZZ_USRCMP.KDUSR'
    end
    object qryUsrCmpNMCMP: TStringField
      DisplayLabel = #1055#1088#1086#1075#1088#1050#1086#1084#1087'-'#1090
      FieldName = 'NMCMP'
      Origin = 'DbMain.ZZ_USRCMP.NMCMP'
      FixedChar = True
      Size = 10
    end
    object qryUsrCmpLVL: TSmallintField
      DisplayLabel = #1059#1088#1086#1074#1077#1085#1100
      FieldName = 'LVL'
      Origin = 'DbMain.ZZ_USRCMP.LVL'
    end
    object qryUsrCmpNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.ZZ_USRCMP.NOTES'
      FixedChar = True
    end
  end
  object dsrcUsrCmp: TDataSource
    DataSet = qryUsrCmp
    OnDataChange = dsrcUsrCmpDataChange
    Left = 208
    Top = 136
  end
  object updUsrCmp: TUpdateSQL
    ModifySQL.Strings = (
      'update ZZ_UsrCmp'
      'set'
      '  KDUSR = :KDUSR,'
      '  NMCMP = :NMCMP,'
      '  LVL = :LVL,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into ZZ_UsrCmp'
      '  (KDUSR, NMCMP, LVL, NOTES)'
      'values'
      '  (:KDUSR, :NMCMP, :LVL, :NOTES)')
    DeleteSQL.Strings = (
      'delete from ZZ_UsrCmp'
      'where'
      '  NR = :OLD_NR')
    Left = 224
    Top = 144
  end
  object qryBPdr: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    DataSource = dsrcUsers
    SQL.Strings = (
      
        'Select bp.NR, bp.KdPdr, w.NmWho, w.KdSbu, s.SchBU, w.KdValPdr, v' +
        '.NmValSokr, rs.RSch'
      'from Zz_UsrBPdr bp'
      '     Left outer join kd_Who w on w.KdWho = bp.KdPdr'
      '     Left outer join kd_RSCH rs on rs.KdWho = bp.KdPdr'
      '     Left outer join kd_SBU s on s.KdSch = w.KdSbu'
      '     Left outer join kd_Val v on v.KdVal = w.KdValPdr'
      'where bp.KdUsr = 104 '
      '      '
      '')
    UpdateObject = updBPdr
    Left = 144
    Top = 496
    object qryBPdrNR: TIntegerField
      FieldName = 'NR'
    end
    object qryBPdrKDPDR: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDPDR'
    end
    object qryBPdrNMWHO: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NMWHO'
      Size = 65
    end
    object qryBPdrKDSBU: TSmallintField
      DisplayLabel = #1050#1076#1057#1095#1041#1059
      FieldName = 'KDSBU'
    end
    object qryBPdrSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryBPdrKDVALPDR: TSmallintField
      FieldName = 'KDVALPDR'
    end
    object qryBPdrNMVALSOKR: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'NMVALSOKR'
      Size = 6
    end
    object qryBPdrRSCH: TStringField
      DisplayLabel = #1056#1057#1095#1077#1090
      FieldName = 'RSCH'
      Size = 25
    end
  end
  object dsrcBPdr: TDataSource
    DataSet = qryBPdr
    Left = 152
    Top = 504
  end
  object updBPdr: TUpdateSQL
    ModifySQL.Strings = (
      'update Zz_UsrBPdr'
      'set'
      '  KDUSR = :KDUSR,'
      '  KDPDR = :KDPDR,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Zz_UsrBPdr'
      '  (KDUSR, KDPDR, NOTES)'
      'values'
      '  (:KDUSR, :KDPDR, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Zz_UsrBPdr'
      'where'
      '  NR = :OLD_NR')
    Left = 160
    Top = 512
  end
  object qryUsrZplSps: TQuery
    CachedUpdates = True
    AfterPost = qryUsrZplSpsAfterPost
    AfterDelete = qryUsrZplSpsAfterDelete
    DatabaseName = 'DbMain'
    DataSource = dsrcUsers
    SQL.Strings = (
      'select u.*, s.ShSps, s.NmSps, s.Notes'
      
        ' from ZZ_UsrKdSps u Left outer join z_KdSps s on s.KdSps = u.KdS' +
        'ps'
      'order by u.KdUsr, u.KdSps'
      '')
    UpdateObject = updUsrZplSps
    Left = 48
    Top = 496
    object qryUsrZplSpsNR: TIntegerField
      FieldName = 'NR'
    end
    object qryUsrZplSpsKDUSR: TSmallintField
      DisplayLabel = #1070#1079#1050#1086#1076
      FieldName = 'KDUSR'
    end
    object qryUsrZplSpsKDSPS: TSmallintField
      DisplayLabel = #1070#1079#1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryUsrZplSpsNOTES: TStringField
      DisplayLabel = #1070#1079#1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object qryUsrZplSpsSHSPS: TStringField
      DisplayLabel = #1064#1092#1088#1057#1087#1089
      FieldName = 'SHSPS'
      Size = 15
    end
    object qryUsrZplSpsNMSPS: TStringField
      DisplayLabel = #1057#1087#1080#1089#1086#1082
      FieldName = 'NMSPS'
      Size = 65
    end
    object qryUsrZplSpsNOTES_1: TStringField
      DisplayLabel = #1057#1087#1089#1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES_1'
      Size = 65
    end
  end
  object dsrcUsrZplSps: TDataSource
    DataSet = qryUsrZplSps
    Left = 56
    Top = 504
  end
  object updUsrZplSps: TUpdateSQL
    ModifySQL.Strings = (
      'update ZZ_UsrKdSps'
      'set'
      '  KDUSR = :KDUSR,'
      '  KDSPS = :KDSPS,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into ZZ_UsrKdSps'
      '  (KDUSR, KDSPS, NOTES)'
      'values'
      '  (:KDUSR, :KDSPS, :NOTES)')
    DeleteSQL.Strings = (
      'delete from ZZ_UsrKdSps'
      'where'
      '  NR = :OLD_NR')
    Left = 64
    Top = 512
  end
  object qryPstSbu: TQuery
    CachedUpdates = True
    OnNewRecord = qryPstSbuNewRecord
    DatabaseName = 'DbMain'
    DataSource = dsrcUsers
    SQL.Strings = (
      'Select s.KdSch, s.SchBU, s.NmSch, u.* '
      '   from zz_usrSbu u'
      '       Left Outer join Kd_Sbu s on s.KdSch = u.KdSbu')
    UpdateObject = updPstSbu
    Left = 216
    Top = 496
    object qryPstSbuKDSCH: TSmallintField
      DisplayLabel = 'KdSch'
      FieldName = 'KDSCH'
    end
    object qryPstSbuSCHBU: TStringField
      DisplayLabel = 'SchBU'
      FieldName = 'SCHBU'
      OnValidate = qryPstSbuSCHBUValidate
      Size = 10
    end
    object qryPstSbuNMSCH: TStringField
      DisplayLabel = 'NmSch'
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryPstSbuNR: TIntegerField
      FieldName = 'NR'
    end
    object qryPstSbuKDUSR: TSmallintField
      FieldName = 'KDUSR'
    end
    object qryPstSbuKDSBU: TSmallintField
      FieldName = 'KDSBU'
    end
    object qryPstSbuNOTES: TStringField
      DisplayLabel = 'Notes'
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object dsrcPstSbu: TDataSource
    DataSet = qryPstSbu
    Left = 224
    Top = 504
  end
  object updPstSbu: TUpdateSQL
    ModifySQL.Strings = (
      'update zz_usrSbu'
      'set'
      '  KDUSR = :KDUSR,'
      '  KDSBU = :KDSBU,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into zz_usrSbu'
      '  (KDUSR, KDSBU, NOTES)'
      'values'
      '  (:KDUSR, :KDSBU, :NOTES)')
    DeleteSQL.Strings = (
      'delete from zz_usrSbu'
      'where'
      '  NR = :OLD_NR')
    Left = 232
    Top = 512
  end
  object qryUsrOb: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    DataSource = dsrcUsers
    SQL.Strings = (
      'Select uo.*, ob.NmOb from sg_UsrOb uo'
      '  Left Outer Join sg_KdOb ob on ob.KdOb = uo.KdOb')
    UpdateObject = updUsrOb
    Left = 280
    Top = 496
    object qryUsrObNR: TIntegerField
      FieldName = 'NR'
    end
    object qryUsrObKDUSR: TSmallintField
      FieldName = 'KDUSR'
    end
    object qryUsrObKDOB: TSmallintField
      DisplayLabel = #1050#1076#1054#1073#1097#1078
      FieldName = 'KDOB'
    end
    object qryUsrObNMOB: TStringField
      DisplayLabel = #1054#1073#1097#1077#1078#1080#1090#1080#1077
      FieldName = 'NMOB'
      FixedChar = True
      Size = 35
    end
  end
  object dsrcUsrOb: TDataSource
    DataSet = qryUsrOb
    Left = 288
    Top = 504
  end
  object updUsrOb: TUpdateSQL
    ModifySQL.Strings = (
      'update sg_UsrOb'
      'set'
      '  NR = :NR,'
      '  KDUSR = :KDUSR,'
      '  KDOB = :KDOB'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into sg_UsrOb'
      '  (NR, KDUSR, KDOB)'
      'values'
      '  (:NR, :KDUSR, :KDOB)')
    DeleteSQL.Strings = (
      'delete from sg_UsrOb'
      'where'
      '  NR = :OLD_NR')
    Left = 296
    Top = 512
  end
end
