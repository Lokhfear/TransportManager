object TransportFr: TTransportFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 145
    Width = 860
    Height = 335
    Align = alClient
    TabOrder = 0
    ExplicitTop = 133
    ExplicitHeight = 347
    object TransportDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 333
      Align = alClient
      Color = clWhite
      DataSource = DBConnect.TransportDataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = TransportDBGridCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMBER_PLATE'
          Title.Caption = #1053#1054#1052#1045#1056
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TYPE_NAME'
          Title.Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
          Width = 500
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'START_EXPLOITATION'
          Title.Caption = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_EXPLOITATION'
          Title.Caption = #1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Width = 120
          Visible = True
        end>
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 145
    Align = alTop
    TabOrder = 1
    object CreateGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 494
      Height = 143
      Align = alClient
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 0
      ExplicitHeight = 66
      object VehicleTypeCreateLabel: TLabel
        Left = 228
        Top = 14
        Width = 80
        Height = 13
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      end
      object EndExploitationCreateLabel: TLabel
        Left = 228
        Top = 56
        Width = 104
        Height = 13
        Caption = #1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
      end
      object NumberPlateCreateLabel: TLabel
        Left = 17
        Top = 14
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object StartEploitationCreateLabel: TLabel
        Left = 17
        Top = 56
        Width = 110
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
      end
      object CreateButton: TButton
        Left = 17
        Top = 102
        Width = 397
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 0
        OnClick = CreateButtonClick
      end
      object StartExploitationCreateDateTimePicker: TDateTimePicker
        Left = 17
        Top = 75
        Width = 186
        Height = 21
        Date = 45716.000000000000000000
        Time = 0.955198333336738900
        TabOrder = 1
      end
      object EndExploitationCreateDateTimePicker: TDateTimePicker
        Left = 228
        Top = 75
        Width = 186
        Height = 21
        Date = 45716.000000000000000000
        Time = 0.955198333336738900
        Enabled = False
        TabOrder = 2
      end
      object VehicleTypeDBLookupComboBox: TDBLookupComboBox
        Left = 228
        Top = 33
        Width = 186
        Height = 21
        KeyField = 'ID'
        ListField = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
        ListSource = DBConnect.VehicleTypeDataSource
        TabOrder = 3
      end
      object NumberPlateCreateEdit: TEdit
        Left = 17
        Top = 33
        Width = 186
        Height = 21
        TabOrder = 4
      end
    end
    object GroupBox3: TGroupBox
      Left = 495
      Top = 1
      Width = 364
      Height = 143
      Align = alRight
      Caption = 'GroupBox3'
      TabOrder = 1
      ExplicitLeft = 496
      ExplicitTop = 0
      ExplicitHeight = 133
      object SelectedTransportLabel: TLabel
        Left = 35
        Top = 81
        Width = 95
        Height = 13
        Caption = #1042#1099#1073#1072#1088#1085#1085#1099#1081' '#1085#1086#1084#1077#1088':'
        ParentShowHint = False
        ShowHint = False
      end
      object EndExploitationChangeDateTimePicker: TDateTimePicker
        Left = 33
        Top = 33
        Width = 186
        Height = 21
        Date = 45716.000000000000000000
        Time = 0.955198333336738900
        TabOrder = 0
      end
      object DeleteButton: TButton
        Left = 225
        Top = 76
        Width = 136
        Height = 26
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 1
      end
      object ChangeButton: TButton
        Left = 225
        Top = 33
        Width = 136
        Height = 21
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        OnClick = ChangeButtonClick
      end
    end
  end
end
