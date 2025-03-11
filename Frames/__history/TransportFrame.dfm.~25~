object TransportFr: TTransportFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 159
    Width = 860
    Height = 321
    Align = alClient
    TabOrder = 0
    ExplicitTop = 163
    ExplicitHeight = 317
    object TransportDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 319
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
    Height = 121
    Align = alTop
    TabOrder = 1
    object ManipulationGroupBox: TGroupBox
      Left = 501
      Top = 1
      Width = 358
      Height = 119
      Align = alRight
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      TabOrder = 0
      DesignSize = (
        358
        119)
      object CreateButton: TButton
        Left = 18
        Top = 17
        Width = 163
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 0
        OnClick = CreateButtonClick
      end
      object DeleteButton: TButton
        Left = 18
        Top = 48
        Width = 163
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 1
      end
      object LoadButton: TButton
        Left = 187
        Top = 48
        Width = 163
        Height = 25
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 2
        OnClick = LoadButtonClick
      end
      object ChangeButton: TButton
        Left = 187
        Top = 17
        Width = 163
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 3
        OnClick = ChangeButtonClick
      end
      object TransportHistoryButton: TButton
        Left = 32
        Top = 79
        Width = 306
        Height = 32
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
        Enabled = False
        TabOrder = 4
      end
    end
    object SearchGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 500
      Height = 119
      Align = alClient
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      object VehicleTypeCreateLabel: TLabel
        Left = 224
        Top = 22
        Width = 80
        Height = 13
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      end
      object NumberPlateCreateLabel: TLabel
        Left = 3
        Top = 22
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label1: TLabel
        Left = 4
        Top = 71
        Width = 110
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
      end
      object Label2: TLabel
        Left = 224
        Top = 71
        Width = 104
        Height = 13
        Caption = #1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
      end
      object Label3: TLabel
        Left = 102
        Top = 93
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label4: TLabel
        Left = 324
        Top = 93
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Edit3: TEdit
        Left = 12
        Top = 41
        Width = 192
        Height = 21
        TabOrder = 0
        Text = 'Edit3'
      end
      object Edit4: TEdit
        Left = 234
        Top = 41
        Width = 192
        Height = 21
        TabOrder = 1
        Text = 'Edit3'
      end
      object Edit5: TEdit
        Left = 12
        Top = 90
        Width = 84
        Height = 21
        TabOrder = 2
        Text = 'Edit3'
      end
      object Edit6: TEdit
        Left = 120
        Top = 90
        Width = 84
        Height = 21
        TabOrder = 3
        Text = 'Edit3'
      end
      object Edit7: TEdit
        Left = 234
        Top = 90
        Width = 84
        Height = 21
        TabOrder = 4
        Text = 'Edit3'
      end
      object Edit8: TEdit
        Left = 342
        Top = 90
        Width = 84
        Height = 21
        TabOrder = 5
        Text = 'Edit3'
      end
    end
  end
  object EditGroupBox: TGroupBox
    Left = 0
    Top = 121
    Width = 860
    Height = 38
    Align = alTop
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Padding.Left = 5
    Padding.Right = 5
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object SelectedVehicleTypeEdit: TEdit
      AlignWithMargins = True
      Left = 117
      Top = 15
      Width = 484
      Height = 21
      Margins.Left = 12
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 0
      TextHint = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      ExplicitTop = 18
    end
    object SelectedEndExploitationDateTimePicker: TDateTimePicker
      AlignWithMargins = True
      Left = 736
      Top = 15
      Width = 111
      Height = 21
      Margins.Left = 12
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Date = 45719.000000000000000000
      Time = 0.840898888891388200
      TabOrder = 1
    end
    object SelectedStartExploitationDateTimePicker: TDateTimePicker
      AlignWithMargins = True
      Left = 613
      Top = 15
      Width = 111
      Height = 21
      Margins.Left = 12
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Date = 45719.000000000000000000
      Time = 0.840898888891388200
      Enabled = False
      TabOrder = 2
    end
    object SelectedNumberPlateEdit: TEdit
      AlignWithMargins = True
      Left = 19
      Top = 15
      Width = 86
      Height = 21
      Margins.Left = 12
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 3
      TextHint = #1053#1086#1084#1077#1088
    end
  end
end
