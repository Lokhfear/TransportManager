object TripFr: TTripFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object TripPanel: TPanel
    Left = 0
    Top = 131
    Width = 860
    Height = 349
    Align = alClient
    TabOrder = 0
    object TripGrid: TDBGrid
      Left = 1
      Top = 39
      Width = 858
      Height = 309
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
          Visible = False
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
      object SelectedTripNameEdit: TEdit
        AlignWithMargins = True
        Left = 159
        Top = 15
        Width = 184
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Enabled = False
        TabOrder = 0
      end
      object SelectedDistanceEdit: TEdit
        AlignWithMargins = True
        Left = 347
        Top = 15
        Width = 47
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Enabled = False
        TabOrder = 1
      end
      object SelectedFullNameComboBox: TDBLookupComboBox
        AlignWithMargins = True
        Left = 10
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
        TabOrder = 2
      end
      object SelectedNuberPlateComboBox: TDBLookupComboBox
        AlignWithMargins = True
        Left = 400
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
        TabOrder = 3
      end
      object SelectedVehicleTypeEdit: TEdit
        AlignWithMargins = True
        Left = 486
        Top = 15
        Width = 75
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Enabled = False
        TabOrder = 4
      end
      object SelectedStartDateTimeEdit: TMaskEdit
        AlignWithMargins = True
        Left = 567
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
        TabOrder = 5
        Text = ''
        OnExit = SelectedStartDateTimeEditExit
      end
      object SelectedEndDateTimeEdit: TMaskEdit
        AlignWithMargins = True
        Left = 692
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
        TabOrder = 6
        Text = ''
        OnExit = SelectedEndDateTimeEditExit
      end
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 131
    Align = alTop
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 664
      Top = 1
      Width = 195
      Height = 129
      Align = alRight
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      TabOrder = 0
      DesignSize = (
        195
        129)
      object AssignDriverAndTransportButton: TButton
        Left = 21
        Top = 94
        Width = 163
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1055#1077#1088#1077#1085#1072#1079#1085#1072#1095#1080#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1103' '#1080' '#1090#1088#1072#1085#1089#1087#1086#1088#1090
        TabOrder = 0
      end
      object Button1: TButton
        Left = 21
        Top = 63
        Width = 163
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100'?'
        Enabled = False
        TabOrder = 1
      end
      object LoadButton: TButton
        Left = 21
        Top = 32
        Width = 163
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 2
        OnClick = LoadButtonClick
      end
    end
    object searchBox: TGroupBox
      Left = 1
      Top = 1
      Width = 663
      Height = 129
      Align = alClient
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 69
        Width = 76
        Height = 13
        Caption = #1042#1088#1077#1084#1103' '#1086#1090#1098#1077#1079#1076#1072
      end
      object Label2: TLabel
        Left = 261
        Top = 68
        Width = 83
        Height = 13
        Caption = #1042#1088#1077#1084#1103' '#1087#1088#1080#1073#1099#1090#1080#1103
      end
      object Label3: TLabel
        Left = 115
        Top = 87
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label5: TLabel
        Left = 16
        Top = 15
        Width = 23
        Height = 13
        Caption = #1060#1048#1054
      end
      object Label6: TLabel
        Left = 207
        Top = 15
        Width = 46
        Height = 13
        Caption = #1052#1072#1088#1096#1088#1091#1090
      end
      object Label7: TLabel
        Left = 389
        Top = 15
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label8: TLabel
        Left = 486
        Top = 15
        Width = 80
        Height = 13
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      end
      object Label9: TLabel
        Left = 361
        Top = 87
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object FullNameSearchEdit: TEdit
        Left = 16
        Top = 34
        Width = 166
        Height = 21
        TabOrder = 0
        OnChange = SearchByParam
      end
      object NumberPlateSearchEdit: TEdit
        Left = 382
        Top = 34
        Width = 94
        Height = 21
        TabOrder = 1
        OnChange = SearchByParam
      end
      object TripNameSearchEdit: TEdit
        Left = 207
        Top = 34
        Width = 148
        Height = 21
        TabOrder = 2
        OnChange = SearchByParam
      end
      object ClearButton: TButton
        Left = 479
        Top = 84
        Width = 120
        Height = 21
        Caption = #1054#1090#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 3
        OnClick = ClearButtonClick
      end
      object VehicleTypeSearchComboBox: TDBLookupComboBox
        Left = 486
        Top = 34
        Width = 120
        Height = 21
        KeyField = 'ID'
        ListField = 'TYPE_NAME'
        ListSource = DBConnect.VehicleTypeDataSource
        TabOrder = 4
        OnClick = SearchByParam
      end
      object SearchTripStartFrom: TMaskEdit
        AlignWithMargins = True
        Left = 18
        Top = 85
        Width = 94
        Height = 21
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999 99:99;0;_'
        MaxLength = 16
        TabOrder = 5
        Text = ''
        OnExit = SearchByParam
      end
      object SearchTripStartTo: TMaskEdit
        AlignWithMargins = True
        Left = 136
        Top = 84
        Width = 94
        Height = 21
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999 99:99;0;_'
        MaxLength = 16
        TabOrder = 6
        Text = ''
        OnExit = SearchByParam
      end
      object SearchTripEndTo: TMaskEdit
        AlignWithMargins = True
        Left = 382
        Top = 84
        Width = 94
        Height = 21
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999 99:99;0;_'
        MaxLength = 16
        TabOrder = 7
        Text = ''
        OnExit = SearchByParam
      end
      object SearchTripEndFrom: TMaskEdit
        AlignWithMargins = True
        Left = 264
        Top = 84
        Width = 94
        Height = 21
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999 99:99;0;_'
        MaxLength = 16
        TabOrder = 8
        Text = ''
        OnExit = SearchByParam
      end
    end
  end
end
