object TripRequestFr: TTripRequestFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 209
    Width = 860
    Height = 271
    Align = alClient
    TabOrder = 0
    ExplicitTop = 200
    ExplicitHeight = 280
    object PendingRequestDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 269
      Align = alClient
      Color = clWhite
      DataSource = DBConnect.tripRequestDataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = PendingRequestDBGridCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ROUTE_NAME'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTANCE'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREATION_DATE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQUIRED_VEHICLE_TYPE_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TYPE_NAME'
          Width = 200
          Visible = True
        end>
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 209
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -1
    ExplicitTop = -5
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 234
      Height = 207
      Align = alLeft
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1079#1072#1103#1074#1082#1091
      TabOrder = 0
      ExplicitLeft = -3
      ExplicitTop = -3
      object Label1: TLabel
        Left = 26
        Top = 37
        Width = 55
        Height = 13
        Caption = #8470' '#1079#1072#1103#1074#1082#1080':'
      end
      object CreateButton: TButton
        Left = 26
        Top = 142
        Width = 145
        Height = 25
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
        TabOrder = 0
        OnClick = CreateButtonClick
      end
      object DriverDBLookupComboBox: TDBLookupComboBox
        Left = 26
        Top = 76
        Width = 145
        Height = 21
        DataField = 'FULL_NAME'
        KeyField = 'ID'
        ListField = 'FULL_NAME'
        ListSource = DBConnect.DriverDataSource
        TabOrder = 1
      end
      object TransportDBLookupComboBox2: TDBLookupComboBox
        Left = 26
        Top = 103
        Width = 145
        Height = 21
        KeyField = 'NUMBER_PLATE'
        ListField = 'NUMBER_PLATE'
        ListSource = DBConnect.TransportDataSource
        TabOrder = 2
      end
    end
    object DriverAndTransportGroupBox: TGroupBox
      Left = 235
      Top = 1
      Width = 624
      Height = 207
      Align = alClient
      Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1090#1088#1072#1085#1089#1087#1086#1088#1090' '#1080' '#1074#1086#1076#1080#1090#1077#1083#1080
      TabOrder = 1
      ExplicitTop = -3
      object TransportGrid: TDBGrid
        Left = 496
        Top = 15
        Width = 126
        Height = 190
        Align = alRight
        DataSource = DBConnect.TransportDataSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMBER_PLATE'
            Title.Caption = #1053#1086#1084#1077#1088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TYPE_NAME'
            Width = -1
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'START_EXPLOITATION'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'END_EXPLOITATION'
            Visible = False
          end>
      end
      object DriverGrid: TDBGrid
        Left = 2
        Top = 15
        Width = 494
        Height = 190
        Align = alClient
        DataSource = DBConnect.DriverDataSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
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
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPLOYMENT_START'
            Visible = True
          end>
      end
    end
  end
end
