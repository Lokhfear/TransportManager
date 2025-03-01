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
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ROUTE_NAME'
          Title.Caption = #1052#1072#1088#1096#1088#1091#1090
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTANCE'
          Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREATION_DATE'
          Title.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1072#1076#1085#1080#1103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Caption = #1057#1090#1072#1090#1091#1089
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TYPE_NAME'
          Title.Caption = #1058#1088#1077#1073#1091#1077#1084#1099#1081' '#1090#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
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
      object DBComboBox1: TDBComboBox
        Left = 16
        Top = 94
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object DBComboBox2: TDBComboBox
        Left = 16
        Top = 40
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object CreateButton: TButton
        Left = 16
        Top = 142
        Width = 145
        Height = 25
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
        TabOrder = 2
      end
    end
    object DriverAndTransportGroupBox: TGroupBox
      Left = 235
      Top = 1
      Width = 624
      Height = 207
      Align = alClient
      Caption = #1042#1099#1073#1086#1088' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1080' '#1074#1086#1076#1080#1090#1077#1083#1103
      TabOrder = 1
      ExplicitLeft = 208
      ExplicitTop = -88
      ExplicitWidth = 185
      ExplicitHeight = 105
      object TransportGrid: TDBGrid
        Left = 6
        Top = 15
        Width = 240
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
      end
      object DriverGrid: TDBGrid
        Left = 246
        Top = 15
        Width = 376
        Height = 190
        Align = alRight
        DataSource = DBConnect.DriverDataSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
end
