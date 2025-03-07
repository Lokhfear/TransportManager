object DriverFr: TDriverFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 159
    Width = 860
    Height = 321
    Align = alClient
    Padding.Left = 4
    Padding.Top = 4
    Padding.Right = 4
    Padding.Bottom = 4
    TabOrder = 0
    ExplicitTop = 162
    ExplicitHeight = 319
    object driverGrid: TDBGrid
      Left = 5
      Top = 5
      Width = 850
      Height = 311
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
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NAME'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYMENT_START'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEHICLE_TYPES'
          Width = 450
          Visible = True
        end>
    end
  end
  object UpperPanel: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 121
    Align = alTop
    TabOrder = 1
    object ManipulationGroupBox: TGroupBox
      Left = 501
      Top = 1
      Width = 358
      Height = 119
      Align = alRight
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      TabOrder = 0
      ExplicitLeft = 502
      ExplicitTop = 0
      ExplicitHeight = 120
      object CreateButton: TButton
        Left = 18
        Top = 17
        Width = 163
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 0
        OnClick = CreateButtonClick
      end
      object DeleteButton: TButton
        Left = 18
        Top = 48
        Width = 163
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 1
      end
      object DriverHistoryButton: TButton
        Left = 32
        Top = 82
        Width = 306
        Height = 29
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1103
        Enabled = False
        TabOrder = 2
      end
      object LoadButton: TButton
        Left = 187
        Top = 48
        Width = 163
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 3
        OnClick = LoadButtonClick
      end
      object ChangeButton: TButton
        Left = 187
        Top = 17
        Width = 163
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 4
        OnClick = ChangeButtonClick
      end
    end
    object SearchBoxGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 337
      Height = 119
      Align = alLeft
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      ExplicitLeft = -5
      ExplicitTop = -4
      object Label1: TLabel
        Left = 18
        Top = 68
        Width = 71
        Height = 14
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
    object VehicleTypeCheckListBox: TCheckListBox
      Left = 338
      Top = 1
      Width = 163
      Height = 119
      Align = alClient
      Columns = 1
      ItemHeight = 13
      Items.Strings = (
        ''
        #1090#1077#1082#1089#1090
        #1090#1077#1082#1089#1090
        #1090#1077#1082#1089#1090
        #1090#1077#1082#1089#1090
        #1090#1077#1082#1089#1090
        #1090#1077#1082#1089#1090'3'
        #1090#1077#1082#1089#1090'3'
        #1090#1077#1082#1089#1090'3'
        #1090#1077#1082#1089#1090'3'
        #1090#1077#1082#1089#1090'3'
        #1058#1077#1089#1090#11
        #1058#1077#1089#1090#11
        #1058#1077#1089#1090#11
        #1058#1077#1089#1090#11
        #1058#1077#1089#1090#11
        #1090#1077#1089#1090'2'
        #1090#1077#1089#1090'2'
        #1090#1077#1089#1090'2'
        #1090#1077#1089#1090'2'
        #1090#1077#1089#1090'2')
      Sorted = True
      TabOrder = 2
      ExplicitLeft = 344
      ExplicitTop = -4
    end
  end
  object EditGroupbox: TGroupBox
    Left = 0
    Top = 121
    Width = 860
    Height = 38
    Align = alTop
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    ExplicitTop = 123
    object SelectedVehicleTypesEdit: TEdit
      AlignWithMargins = True
      Left = 417
      Top = 15
      Width = 417
      Height = 21
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 0
    end
    object SelectedEmploymentStartEdit: TEdit
      AlignWithMargins = True
      Left = 305
      Top = 15
      Width = 104
      Height = 21
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 1
    end
    object SelectedFullNameEdit: TEdit
      AlignWithMargins = True
      Left = 105
      Top = 15
      Width = 192
      Height = 21
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      TabOrder = 2
    end
    object SelectedIdEdit: TEdit
      AlignWithMargins = True
      Left = 10
      Top = 15
      Width = 87
      Height = 21
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 3
    end
  end
end
