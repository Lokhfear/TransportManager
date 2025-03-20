object TripRequestFr: TTripRequestFr
  Left = 0
  Top = 0
  Width = 840
  Height = 480
  TabOrder = 0
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 840
    Height = 145
    Align = alTop
    TabOrder = 0
    object SearchGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 838
      Height = 143
      Align = alClient
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = -3
      object Label6: TLabel
        Left = 18
        Top = 15
        Width = 46
        Height = 13
        Caption = #1052#1072#1088#1096#1088#1091#1090
      end
      object Label8: TLabel
        Left = 16
        Top = 69
        Width = 80
        Height = 13
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      end
      object Label1: TLabel
        Left = 205
        Top = 18
        Width = 76
        Height = 13
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      end
      object Label2: TLabel
        Left = 278
        Top = 91
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label3: TLabel
        Left = 463
        Top = 91
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label4: TLabel
        Left = 207
        Top = 72
        Width = 67
        Height = 13
        Caption = #1044#1072#1090#1072' '#1074#1099#1077#1079#1076#1072
      end
      object Label7: TLabel
        Left = 392
        Top = 72
        Width = 71
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1088#1080#1077#1079#1076#1072
      end
      object Label9: TLabel
        Left = 278
        Top = 37
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object VehicleTypeSearchComboBox: TDBLookupComboBox
        Left = 16
        Top = 88
        Width = 120
        Height = 21
        KeyField = 'ID'
        ListField = 'TYPE_NAME'
        ListSource = DBConnect.VehicleTypeDataSource
        TabOrder = 0
        OnClick = SearchByParam
      end
      object TripNameSearchEdit: TEdit
        Left = 18
        Top = 34
        Width = 159
        Height = 21
        TabOrder = 1
        OnChange = SearchByParam
      end
      object CreateTimeSearchEditFrom: TMaskEdit
        AlignWithMargins = True
        Left = 210
        Top = 34
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 2
        Text = '  .  .    '
        OnExit = SearchByParam
      end
      object SearchTripStartTo: TMaskEdit
        AlignWithMargins = True
        Left = 301
        Top = 88
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 3
        Text = '  .  .    '
        OnExit = SearchByParam
      end
      object SearchTripStartFrom: TMaskEdit
        AlignWithMargins = True
        Left = 210
        Top = 88
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 4
        Text = '  .  .    '
        OnExit = SearchByParam
      end
      object ClearButton: TButton
        Left = 583
        Top = 88
        Width = 120
        Height = 21
        Caption = #1054#1090#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 5
        OnClick = ClearButtonClick
      end
      object LoadButton: TButton
        Left = 583
        Top = 50
        Width = 120
        Height = 21
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 6
        OnClick = LoadButtonClick
      end
      object CreateTimeSearchEditTo: TMaskEdit
        AlignWithMargins = True
        Left = 301
        Top = 34
        Width = 65
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 7
        Text = '  .  .    '
        OnExit = SearchByParam
      end
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 145
    Width = 840
    Height = 335
    Align = alClient
    TabOrder = 1
    ExplicitTop = 151
    object RequestDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 838
      Height = 333
      Align = alClient
      DataSource = DBConnect.tripRequestDataSource
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ROUTE_NAME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTANCE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREATION_DATE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_NAME'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'START_DATETIME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_DATETIME'
          Visible = True
        end>
    end
  end
  object SearchTripEndFrom: TMaskEdit
    AlignWithMargins = True
    Left = 397
    Top = 89
    Width = 64
    Height = 21
    Margins.Left = 8
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    EditMask = '!99/99/9999'
    MaxLength = 10
    TabOrder = 2
    Text = '  .  .    '
    OnExit = SearchByParam
  end
  object SearchTripEndTo: TMaskEdit
    AlignWithMargins = True
    Left = 487
    Top = 89
    Width = 65
    Height = 21
    Margins.Left = 8
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    EditMask = '!99/99/9999'
    MaxLength = 10
    TabOrder = 3
    Text = '  .  .    '
    OnExit = SearchByParam
  end
end
