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
    ExplicitTop = 177
    ExplicitHeight = 303
    object TripGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 325
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
          FieldName = 'TO_CHAR(T.START_DATETIME,'#39'YYYY-MM-DDHH24:MI'#39')'
          Title.Caption = #1042#1088#1077#1084#1103' '#1086#1090#1098#1077#1079#1076#1072
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TO_CHAR(T.END_DATETIME,'#39'YYYY-MM-DDHH24:MI'#39')'
          Title.Caption = #1042#1077#1088#1084#1103' '#1087#1088#1080#1073#1099#1090#1080#1103
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQUIRED_VEHICLE_TYPE_ID'
          Visible = False
        end>
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 153
    Align = alTop
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 462
      Height = 151
      Align = alClient
      Caption = #1042#1085#1077#1089#1090#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 0
      ExplicitLeft = -5
      ExplicitTop = -3
      object GroupBox3: TGroupBox
        Left = 2
        Top = 15
        Width = 231
        Height = 134
        Align = alLeft
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1090#1091
        TabOrder = 0
        ExplicitHeight = 22
        object DateTimePicker1: TDateTimePicker
          Left = 16
          Top = 29
          Width = 186
          Height = 21
          Date = 45718.000000000000000000
          Time = 0.967379212961532200
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 16
          Top = 56
          Width = 186
          Height = 21
          Date = 45718.000000000000000000
          Time = 0.967379212961532200
          TabOrder = 1
        end
        object SetDatesButton: TButton
          Left = 16
          Top = 96
          Width = 186
          Height = 25
          Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
          TabOrder = 2
        end
      end
      object GroupBox4: TGroupBox
        Left = 233
        Top = 15
        Width = 227
        Height = 134
        Align = alClient
        Caption = #1055#1077#1088#1077#1085#1072#1079#1085#1072#1095#1080#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1103' '#1080' '#1090#1088#1072#1085#1089#1087#1086#1088#1090
        TabOrder = 1
        ExplicitLeft = 229
        ExplicitTop = 12
        ExplicitWidth = 397
        ExplicitHeight = 175
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 50
          Top = 29
          Width = 145
          Height = 21
          DataField = 'FULL_NAME'
          KeyField = 'ID'
          ListField = 'FULL_NAME'
          ListSource = DBConnect.AvaibleDriverDataSource
          TabOrder = 0
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 50
          Top = 56
          Width = 145
          Height = 21
          KeyField = 'NUMBER_PLATE'
          ListField = 'NUMBER_PLATE'
          ListSource = DBConnect.AvaibleTransportDataSource
          TabOrder = 1
        end
        object ReassignButton: TButton
          Left = 50
          Top = 96
          Width = 145
          Height = 25
          Caption = #1055#1077#1088#1077#1085#1072#1079#1085#1072#1095#1080#1090#1100
          TabOrder = 2
        end
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
      ExplicitLeft = 467
      ExplicitTop = -3
      ExplicitHeight = 303
    end
  end
end
