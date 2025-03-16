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
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYMENT_START'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYMENT_END'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LICENSE_CATEGORIES'
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
      Left = 624
      Top = 1
      Width = 235
      Height = 183
      Align = alRight
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      TabOrder = 0
      object CreateButton: TButton
        Left = 40
        Top = 112
        Width = 160
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 0
        OnClick = CreateButtonClick
      end
      object DeleteButton: TButton
        Left = 40
        Top = 79
        Width = 160
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 1
      end
      object DriverHistoryButton: TButton
        Left = 40
        Top = 143
        Width = 160
        Height = 29
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1103
        Enabled = False
        TabOrder = 2
      end
      object LoadButton: TButton
        Left = 40
        Top = 48
        Width = 160
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 3
        OnClick = LoadButtonClick
      end
      object ChangeButton: TButton
        Left = 40
        Top = 17
        Width = 160
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 4
        OnClick = ChangeButtonClick
      end
    end
    object SearchBoxGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 368
      Height = 183
      Align = alLeft
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      object Label1: TLabel
        Left = 18
        Top = 68
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object Label2: TLabel
        Left = 176
        Top = 68
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object Label3: TLabel
        Left = 18
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object Label4: TLabel
        Left = 176
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object Edit1: TEdit
        Left = 18
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 18
        Top = 84
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'Edit1'
      end
      object Edit3: TEdit
        Left = 176
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
      end
      object Edit4: TEdit
        Left = 176
        Top = 84
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'Edit1'
      end
    end
    object DriverLicensesPanel: TPanel
      Left = 369
      Top = 1
      Width = 255
      Height = 183
      Align = alClient
      TabOrder = 2
    end
  end
  object EditGroupbox: TGroupBox
    Left = 0
    Top = 185
    Width = 860
    Height = 36
    Align = alTop
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    object SelectedLicenseCategoriesEdit: TEdit
      AlignWithMargins = True
      Left = 553
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
      TabOrder = 1
      ExplicitHeight = 21
    end
    object SelectedEmploymentEndEdit: TMaskEdit
      AlignWithMargins = True
      Left = 434
      Top = 15
      Width = 111
      Height = 19
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Anchors = [akLeft, akTop, akRight]
      EditMask = '!99/99/9999'
      MaxLength = 10
      TabOrder = 2
      Text = '  .  .    '
      ExplicitHeight = 21
    end
    object SelectedEmploymentStartEdit: TMaskEdit
      AlignWithMargins = True
      Left = 322
      Top = 15
      Width = 104
      Height = 19
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Anchors = [akLeft, akTop, akRight]
      EditMask = '!99/99/9999'
      MaxLength = 10
      TabOrder = 3
      Text = '  .  .    '
      ExplicitHeight = 21
    end
  end
end
