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
    Top = 122
    Width = 900
    Height = 344
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clSilver
    Padding.Left = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    object DBGrid5: TDBGrid
      Left = 6
      Top = 1
      Width = 888
      Height = 337
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
          Visible = True
        end>
    end
  end
  object SearchBox: TGroupBox
    Left = 0
    Top = 82
    Width = 900
    Height = 40
    Align = alBottom
    Caption = #1055#1086#1080#1089#1082
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Padding.Left = 5
    Padding.Right = 5
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object typeNameSearchEdit: TEdit
      AlignWithMargins = True
      Left = 263
      Top = 18
      Width = 630
      Height = 20
      Margins.Left = 6
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      TabOrder = 0
      TextHint = #1058#1080#1087' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
      OnChange = typeNameSearchEditChange
      ExplicitLeft = 265
      ExplicitTop = 17
    end
    object idSearchEdit: TEdit
      AlignWithMargins = True
      Left = 7
      Top = 18
      Width = 250
      Height = 20
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      TextHint = 'id'
      OnChange = idSearchEditChange
      ExplicitTop = 17
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 327
    Height = 82
    Align = alClient
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 2
    DesignSize = (
      327
      82)
    object typeNameEdit: TEdit
      AlignWithMargins = True
      Left = 24
      Top = 19
      Width = 271
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1080#1087' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
    end
    object CreateButton: TButton
      Left = 24
      Top = 49
      Width = 271
      Height = 27
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 1
      OnClick = CreateButtonClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 327
    Top = 0
    Width = 573
    Height = 82
    Align = alRight
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' / '#1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    DesignSize = (
      573
      82)
    object CongfirmButton: TButton
      Left = 336
      Top = 19
      Width = 231
      Height = 24
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
      TabOrder = 0
      OnClick = CongfirmButtonClick
    end
    object DeletButton: TButton
      Left = 32
      Top = 49
      Width = 543
      Height = 27
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = DeletButtonClick
    end
    object typenameChangeEdit: TEdit
      Left = 32
      Top = 22
      Width = 298
      Height = 21
      TabOrder = 2
    end
  end
end
