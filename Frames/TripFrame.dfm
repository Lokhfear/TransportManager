object TripFr: TTripFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object TripPanel: TPanel
    Left = 0
    Top = 153
    Width = 860
    Height = 327
    Align = alClient
    TabOrder = 0
    object TripGrid: TDBGrid
      Left = 1
      Top = 39
      Width = 858
      Height = 287
      Align = alClient
      Color = clWhite
      DataSource = DBConnect.tripDataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = TripGridCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NAME'
          Title.Caption = #1060#1048#1054
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ROUTE_NAME'
          Title.Caption = #1052#1040#1056#1064#1056#1059#1058
          Width = 190
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTANCE'
          Title.Caption = #1082#1084
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRANSPORT_ID'
          Title.Caption = #1053#1054#1052#1045#1056
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TYPE_NAME'
          Title.Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'START_DATETIME'
          Title.Caption = #1042#1088#1077#1084#1103' '#1086#1090#1098#1077#1079#1076#1072
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_DATETIME'
          Title.Caption = #1042#1077#1088#1084#1103' '#1087#1088#1080#1073#1099#1090#1080#1103
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQUIRED_VEHICLE_TYPE_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DRIVER_ID'
          Visible = False
        end>
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 1
      Width = 858
      Height = 38
      Align = alTop
      Caption = 'GroupBox5'
      TabOrder = 1
      object selectedIdEdit: TEdit
        AlignWithMargins = True
        Left = 14
        Top = 15
        Width = 51
        Height = 21
        Margins.Left = 12
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Enabled = False
        TabOrder = 0
      end
      object SelectedTripNameEdit: TEdit
        AlignWithMargins = True
        Left = 222
        Top = 15
        Width = 184
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Enabled = False
        TabOrder = 1
      end
      object SelectedDistanceEdit: TEdit
        AlignWithMargins = True
        Left = 410
        Top = 15
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Enabled = False
        TabOrder = 2
      end
      object SelectedFullNameComboBox: TDBLookupComboBox
        AlignWithMargins = True
        Left = 73
        Top = 15
        Width = 145
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        DataField = 'FULL_NAME'
        KeyField = 'ID'
        ListField = 'FULL_NAME'
        ListSource = DBConnect.AvaibleDriverDataSource
        TabOrder = 3
      end
      object SelectedNuberPlateComboBox: TDBLookupComboBox
        AlignWithMargins = True
        Left = 463
        Top = 15
        Width = 82
        Height = 21
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        KeyField = 'NUMBER_PLATE'
        ListField = 'NUMBER_PLATE'
        ListSource = DBConnect.AvaibleTransportDataSource
        TabOrder = 4
      end
      object SelectedVehicleTypeEdit: TEdit
        AlignWithMargins = True
        Left = 549
        Top = 15
        Width = 75
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Enabled = False
        TabOrder = 5
      end
      object SelectedStartDateTimeEdit: TMaskEdit
        AlignWithMargins = True
        Left = 630
        Top = 15
        Width = 119
        Height = 21
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        EditMask = '!99/99/9999 99:99;0;_'
        MaxLength = 16
        TabOrder = 6
        Text = ''
        OnExit = SelectedStartDateTimeEditExit
        ExplicitTop = 14
      end
      object SelectedEndDateTimeEdit: TMaskEdit
        AlignWithMargins = True
        Left = 755
        Top = 15
        Width = 102
        Height = 21
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        EditMask = '!99/99/9999 99:99;0;_'
        MaxLength = 16
        TabOrder = 7
        Text = ''
        OnExit = SelectedEndDateTimeEditExit
      end
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 153
    Align = alTop
    TabOrder = 1
    object searchBox: TGroupBox
      Left = 1
      Top = 1
      Width = 462
      Height = 151
      Align = alClient
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 0
      object Edit1: TEdit
        Left = 14
        Top = 30
        Width = 135
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit4: TEdit
        Left = 166
        Top = 30
        Width = 135
        Height = 21
        TabOrder = 1
        Text = 'Edit1'
      end
      object Edit7: TEdit
        Left = 14
        Top = 61
        Width = 135
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
      end
      object Edit8: TEdit
        Left = 166
        Top = 61
        Width = 135
        Height = 21
        TabOrder = 3
        Text = 'Edit1'
      end
      object Edit9: TEdit
        Left = 14
        Top = 92
        Width = 135
        Height = 21
        TabOrder = 4
        Text = 'Edit1'
      end
      object Edit10: TEdit
        Left = 166
        Top = 92
        Width = 135
        Height = 21
        TabOrder = 5
        Text = 'Edit1'
      end
      object Edit11: TEdit
        Left = 14
        Top = 126
        Width = 135
        Height = 21
        TabOrder = 6
        Text = 'Edit1'
      end
      object Edit12: TEdit
        Left = 166
        Top = 126
        Width = 135
        Height = 21
        TabOrder = 7
        Text = 'Edit1'
      end
    end
    object GroupBox2: TGroupBox
      Left = 463
      Top = 1
      Width = 396
      Height = 151
      Align = alRight
      Caption = 'GroupBox1'
      TabOrder = 1
      DesignSize = (
        396
        151)
      object AssignDriverAndTransportButton: TButton
        Left = 27
        Top = 64
        Width = 350
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1055#1077#1088#1077#1085#1072#1079#1085#1072#1095#1080#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1103' '#1080' '#1090#1088#1072#1085#1089#1087#1086#1088#1090
        TabOrder = 0
        OnClick = AssignDriverAndTransportButtonClick
      end
      object LoadButton: TButton
        Left = 210
        Top = 33
        Width = 161
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 1
        OnClick = LoadButtonClick
      end
      object Button1: TButton
        Left = 27
        Top = 33
        Width = 161
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100'?'
        Enabled = False
        TabOrder = 2
      end
    end
  end
end
