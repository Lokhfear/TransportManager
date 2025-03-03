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
  object searchGroupbox: TGroupBox
    Left = 0
    Top = 120
    Width = 860
    Height = 41
    Align = alBottom
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 1
    object DBEdit1: TDBEdit
      Left = 16
      Top = 17
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 17
      Width = 162
      Height = 21
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 262
      Top = 15
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 400
      Top = 14
      Width = 473
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 297
    Height = 120
    Align = alLeft
    Caption = 'GroupBox2'
    TabOrder = 2
    ExplicitTop = -6
    object FullNameCreateEdit: TEdit
      Left = 26
      Top = 23
      Width = 231
      Height = 21
      TabOrder = 0
      TextHint = #1069#1075#1080#1087#1090#1077' '#1052#1080#1093#1072#1080#1083' '#1040#1085#1072#1090#1086#1083#1100#1077#1074#1080#1095
      OnEnter = FullNameCreateEditEnter
    end
    object CreateButton: TButton
      Left = 26
      Top = 77
      Width = 231
      Height = 21
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 1
      OnClick = CreateButtonClick
    end
    object employmentStartDatePicker: TDateTimePicker
      Left = 26
      Top = 50
      Width = 231
      Height = 21
      Date = 45716.000000000000000000
      Time = 0.826391643517126800
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 529
    Top = 0
    Width = 331
    Height = 120
    Align = alRight
    Caption = 'GroupBox3'
    TabOrder = 3
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
    Left = 297
    Top = 0
    Width = 232
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
    TabOrder = 4
    ExplicitLeft = 291
    ExplicitTop = 8
  end
end
