object VehicleTypeFr: TVehicleTypeFr
  Left = 0
  Top = 0
  Width = 900
  Height = 466
  Align = alClient
  Color = clSilver
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object VehicleTypePanel: TPanel
    Left = 0
    Top = 125
    Width = 900
    Height = 341
    Align = alClient
    Padding.Left = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    object DBGrid5: TDBGrid
      Left = 6
      Top = 1
      Width = 888
      Height = 334
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Color = clWhite
      DataSource = DBConnect.VehicleTypeDataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid5CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TYPE_NAME'
          Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LICENSE_CATEGORY'
          Title.Caption = #1058#1088#1077#1073#1091#1077#1084#1099#1077' '#1087#1088#1072#1074#1072
          Visible = True
        end>
    end
  end
  object EditGroupBox: TGroupBox
    Left = 0
    Top = 83
    Width = 900
    Height = 42
    Align = alTop
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Padding.Left = 5
    Padding.Right = 5
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -3
    object SelectedVehicleTypeEdit: TEdit
      AlignWithMargins = True
      Left = 19
      Top = 18
      Width = 604
      Height = 22
      Margins.Left = 12
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      TabOrder = 0
      TextHint = #1058#1080#1087' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
      ExplicitHeight = 24
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 83
    Align = alTop
    Color = clSilver
    TabOrder = 2
    object SearchGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 559
      Height = 81
      Align = alClient
      Caption = #1055#1086#1080#1089#1082
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitTop = -4
      object VehicleTypeSearchLabel: TLabel
        Left = 18
        Top = 25
        Width = 84
        Height = 13
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072':'
      end
      object Label1: TLabel
        Left = 266
        Top = 20
        Width = 93
        Height = 13
        Caption = #1058#1088#1077#1073#1091#1077#1084#1099#1077' '#1087#1088#1072#1074#1072':'
      end
      object VehicleTypeSearchEdit: TEdit
        Left = 18
        Top = 44
        Width = 213
        Height = 21
        TabOrder = 0
        TextHint = #1051#1077#1075#1082#1086#1074#1086#1081
        OnChange = VehicleTypeSearchEditChange
      end
      object Edit1: TEdit
        Left = 266
        Top = 44
        Width = 213
        Height = 21
        TabOrder = 1
        TextHint = #1051#1077#1075#1082#1086#1074#1086#1081
        OnChange = VehicleTypeSearchEditChange
      end
    end
    object ManipulationGroupBox: TGroupBox
      Left = 560
      Top = 1
      Width = 339
      Height = 81
      Align = alRight
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        339
        81)
      object CongfirmButton: TButton
        Left = 175
        Top = 51
        Width = 161
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        TabOrder = 0
        OnClick = CongfirmButtonClick
      end
      object CreateButton: TButton
        Left = 6
        Top = 20
        Width = 163
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 1
        OnClick = CreateButtonClick
      end
      object DeleteButton: TButton
        Left = 6
        Top = 51
        Width = 163
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 2
        OnClick = DeleteButtonClick
      end
      object LoadButton: TButton
        Left = 175
        Top = 20
        Width = 161
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 3
        OnClick = LoadButtonClick
      end
    end
  end
end
