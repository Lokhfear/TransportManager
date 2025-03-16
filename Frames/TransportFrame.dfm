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
          Title.Caption = #1053#1086#1084#1077#1088
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TYPE_NAME'
          Title.Caption = #1058#1080#1087
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LICENSE_CATEGORY'
          Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BRAND_NAME'
          Title.Caption = #1052#1072#1088#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'START_EXPLOITATION'
          Title.Caption = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_EXPLOITATION'
          Title.Caption = #1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
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
    ParentBackground = False
    TabOrder = 1
    object SearchGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 663
      Height = 119
      Align = alClient
      Caption = #1055#1086#1080#1089#1082
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitTop = -4
      object VehicleTypeCreateLabel: TLabel
        Left = 120
        Top = 22
        Width = 80
        Height = 13
        Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      end
      object NumberPlateCreateLabel: TLabel
        Left = 12
        Top = 22
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label1: TLabel
        Left = 12
        Top = 71
        Width = 110
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
      end
      object Label2: TLabel
        Left = 272
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
        Left = 364
        Top = 93
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label5: TLabel
        Left = 272
        Top = 22
        Width = 54
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      end
      object Brandlabel: TLabel
        Left = 358
        Top = 22
        Width = 32
        Height = 13
        Caption = #1052#1072#1088#1082#1072
      end
      object NumberPlateSearchEdit: TEdit
        Left = 12
        Top = 41
        Width = 84
        Height = 21
        TabOrder = 0
        OnChange = NumberPlateSearchEditChange
      end
      object Edit5: TEdit
        Left = 12
        Top = 90
        Width = 84
        Height = 21
        TabOrder = 1
      end
      object Edit6: TEdit
        Left = 120
        Top = 90
        Width = 84
        Height = 21
        TabOrder = 2
      end
      object Edit7: TEdit
        Left = 274
        Top = 90
        Width = 84
        Height = 21
        TabOrder = 3
      end
      object Edit8: TEdit
        Left = 382
        Top = 93
        Width = 84
        Height = 21
        TabOrder = 4
      end
      object VehicleTypeSearchComboBox: TDBLookupComboBox
        Left = 120
        Top = 41
        Width = 120
        Height = 21
        KeyField = 'ID'
        ListField = 'TYPE_NAME'
        ListSource = DBConnect.VehicleTypeDataSource
        TabOrder = 5
        OnClick = VehicleTypeSearchComboBoxClick
      end
      object LicenseCategorySearchComboBox: TDBLookupComboBox
        Left = 274
        Top = 41
        Width = 56
        Height = 21
        KeyField = 'ID'
        ListField = 'CATEGORY_NAME'
        ListSource = DBConnect.licenseCategoryDataSource
        TabOrder = 6
        OnClick = LicenseCategorySearchComboBoxClick
      end
      object TransportBrandSearchComboBox: TDBLookupComboBox
        Left = 358
        Top = 41
        Width = 152
        Height = 21
        KeyField = 'ID'
        ListField = 'BRAND_NAME'
        ListSource = DBConnect.TransportBrandDataSource
        TabOrder = 7
        OnClick = TransportBrandSearchComboBoxClick
      end
      object ClearButton: TButton
        Left = 528
        Top = 91
        Width = 120
        Height = 25
        Caption = #1054#1090#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 8
        OnClick = ClearButtonClick
      end
    end
    object ManipulationGroupBox: TGroupBox
      Left = 664
      Top = 1
      Width = 195
      Height = 119
      Align = alRight
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      ExplicitLeft = 670
      ExplicitTop = -4
      DesignSize = (
        195
        119)
      object LoadButton: TButton
        Left = 24
        Top = 22
        Width = 161
        Height = 25
        Anchors = [akTop, akRight, akBottom]
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 0
        OnClick = LoadButtonClick
      end
      object CreateButton: TButton
        Left = 24
        Top = 53
        Width = 163
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 1
        OnClick = CreateButtonClick
      end
      object ChangeButton: TButton
        Left = 24
        Top = 84
        Width = 163
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        OnClick = ChangeButtonClick
      end
      object TransportHistoryButton: TButton
        Left = 6
        Top = 59
        Width = 16
        Height = 19
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
        Enabled = False
        TabOrder = 3
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
      Left = 119
      Top = 15
      Width = 192
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 0
      TextHint = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
    end
    object SelectedEndExploitationDateTimePicker: TDateTimePicker
      AlignWithMargins = True
      Left = 744
      Top = 15
      Width = 111
      Height = 21
      Margins.Left = 4
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
      Left = 629
      Top = 15
      Width = 111
      Height = 21
      Margins.Left = 4
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
      Width = 96
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
    object SelectedBrandNameEdit: TEdit
      AlignWithMargins = True
      Left = 349
      Top = 15
      Width = 276
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 4
    end
    object SelectedLicenseCategoryEdit: TEdit
      AlignWithMargins = True
      Left = 315
      Top = 15
      Width = 30
      Height = 21
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Enabled = False
      TabOrder = 5
    end
  end
end
