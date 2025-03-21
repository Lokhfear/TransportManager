object DriverFr: TDriverFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 221
    Width = 860
    Height = 259
    Align = alClient
    Padding.Left = 4
    Padding.Top = 4
    Padding.Right = 4
    Padding.Bottom = 4
    ParentBackground = False
    TabOrder = 0
    object driverGrid: TDBGrid
      Left = 5
      Top = 5
      Width = 850
      Height = 249
      Align = alClient
      Color = clWhite
      DataSource = DBConnect.DriverDataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = driverGridCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FULL_NAME'
          Title.Caption = #1060#1048#1054
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYMENT_START'
          Title.Caption = #1053#1072#1095#1072#1083#1086' '#1088#1072#1073#1086#1090#1099
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYMENT_END'
          Title.Caption = #1050#1086#1085#1077#1094' '#1088#1072#1073#1086#1090#1099
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LICENSE_CATEGORIES'
          Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1088#1072#1074
          Visible = True
        end>
    end
  end
  object UpperPanel: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 185
    Align = alTop
    TabOrder = 1
    object ManipulationGroupBox: TGroupBox
      Left = 648
      Top = 1
      Width = 211
      Height = 183
      Align = alRight
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object CreateButton: TButton
        Left = 40
        Top = 50
        Width = 160
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 0
        OnClick = CreateButtonClick
      end
      object DriverHistoryButton: TButton
        Left = 40
        Top = 143
        Width = 160
        Height = 29
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1103
        Enabled = False
        TabOrder = 1
      end
      object LoadButton: TButton
        Left = 40
        Top = 19
        Width = 160
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 2
        OnClick = LoadButtonClick
      end
      object ChangeButton: TButton
        Left = 40
        Top = 81
        Width = 160
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 3
        OnClick = ChangeButtonClick
      end
    end
    object SearchBoxGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 384
      Height = 183
      Align = alLeft
      Caption = #1055#1086#1080#1089#1082
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      ExplicitLeft = -5
      ExplicitTop = -4
      object FullNameLabel: TLabel
        Left = 18
        Top = 19
        Width = 27
        Height = 13
        Caption = #1060#1048#1054':'
      end
      object Label1: TLabel
        Left = 17
        Top = 86
        Width = 78
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1086' '#1088#1072#1073#1086#1090#1099
      end
      object Label3: TLabel
        Left = 96
        Top = 105
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label2: TLabel
        Left = 18
        Top = 131
        Width = 72
        Height = 13
        Caption = #1050#1086#1085#1077#1094' '#1088#1072#1073#1086#1090#1099
      end
      object Label4: TLabel
        Left = 96
        Top = 150
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label5: TLabel
        Left = 202
        Top = 19
        Width = 58
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080':'
      end
      object FullNameSearchEdit: TEdit
        Left = 17
        Top = 38
        Width = 155
        Height = 21
        TabOrder = 0
        OnChange = SearchByParam
      end
      object ClearButton: TButton
        Left = 240
        Top = 147
        Width = 120
        Height = 21
        Caption = #1054#1090#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 1
        OnClick = ClearButtonClick
      end
      object SearchStartWorkDateFrom: TMaskEdit
        AlignWithMargins = True
        Left = 25
        Top = 102
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 2
        Text = '  .  .    '
        OnExit = SearchByParam
      end
      object SearchStartWorkDateTo: TMaskEdit
        AlignWithMargins = True
        Left = 112
        Top = 102
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 3
        Text = '  .  .    '
        OnExit = SearchByParam
      end
      object SearchEndWorkDateFrom: TMaskEdit
        AlignWithMargins = True
        Left = 24
        Top = 147
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 4
        Text = '  .  .    '
        OnExit = SearchByParam
      end
      object SearchEndWorkDateTo: TMaskEdit
        AlignWithMargins = True
        Left = 112
        Top = 147
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 5
        Text = '  .  .    '
        OnExit = SearchByParam
      end
      object LicenseCategoriesCheckBox: TCheckListBox
        Left = 202
        Top = 38
        Width = 158
        Height = 85
        ItemHeight = 13
        TabOrder = 6
      end
    end
    object DriverLicensesPanel: TPanel
      Left = 385
      Top = 1
      Width = 263
      Height = 183
      Align = alClient
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 379
      ExplicitTop = -4
    end
  end
  object EditGroupbox: TGroupBox
    Left = 0
    Top = 185
    Width = 860
    Height = 36
    Align = alTop
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object SelectedLicenseCategoriesEdit: TEdit
      AlignWithMargins = True
      Left = 560
      Top = 15
      Width = 290
      Height = 19
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 0
      ExplicitHeight = 21
    end
    object SelectedFullNameEdit: TEdit
      AlignWithMargins = True
      Left = 10
      Top = 15
      Width = 304
      Height = 19
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 1
      ExplicitHeight = 21
    end
    object SelectedEmploymentStartEdit: TMaskEdit
      AlignWithMargins = True
      Left = 322
      Top = 15
      Width = 111
      Height = 19
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      EditMask = '!99/99/9999'
      MaxLength = 10
      TabOrder = 2
      Text = '  .  .    '
      ExplicitHeight = 21
    end
    object SelectedEmploymentEndEdit: TMaskEdit
      AlignWithMargins = True
      Left = 441
      Top = 15
      Width = 111
      Height = 19
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      EditMask = '!99/99/9999'
      MaxLength = 10
      TabOrder = 3
      Text = '  .  .    '
      ExplicitHeight = 21
    end
  end
end
