object DriverFr: TDriverFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 161
    Width = 860
    Height = 319
    Align = alBottom
    Padding.Left = 4
    Padding.Top = 4
    Padding.Right = 4
    Padding.Bottom = 4
    TabOrder = 0
    ExplicitTop = 162
    object driverGrid: TDBGrid
      Left = 5
      Top = 5
      Width = 850
      Height = 309
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
  object EditGroupbox: TGroupBox
    Left = 0
    Top = 120
    Width = 860
    Height = 41
    Align = alBottom
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    object SelectedVehicleTypesEdit: TEdit
      AlignWithMargins = True
      Left = 417
      Top = 15
      Width = 417
      Height = 24
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
      Height = 24
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 1
      ExplicitTop = 14
    end
    object SelectedFullNameEdit: TEdit
      AlignWithMargins = True
      Left = 105
      Top = 15
      Width = 192
      Height = 24
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      TabOrder = 2
      ExplicitTop = 14
    end
    object SelectedIdEdit: TEdit
      AlignWithMargins = True
      Left = 10
      Top = 15
      Width = 87
      Height = 24
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 529
    Top = 0
    Width = 331
    Height = 120
    Align = alRight
    Caption = 'GroupBox3'
    TabOrder = 2
    object DeleteButton: TButton
      Left = 23
      Top = 73
      Width = 282
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      TabOrder = 0
      OnClick = DeleteButtonClick
    end
    object ChangeButton: TButton
      Left = 23
      Top = 42
      Width = 282
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = ChangeButtonClick
    end
    object fullNameChangeEdit: TEdit
      Left = 23
      Top = 15
      Width = 282
      Height = 21
      TabOrder = 2
    end
  end
  object VehicleTypeCheckListBox: TCheckListBox
    Left = 370
    Top = 0
    Width = 159
    Height = 120
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
    TabOrder = 3
    ExplicitLeft = 376
    ExplicitWidth = 153
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 370
    Height = 120
    Align = alLeft
    Caption = 'GroupBox1'
    TabOrder = 4
    ExplicitTop = -6
  end
end
