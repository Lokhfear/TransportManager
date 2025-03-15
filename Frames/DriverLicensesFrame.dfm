object DriverLicensesFr: TDriverLicensesFr
  Left = 0
  Top = 0
  Width = 250
  Height = 200
  Constraints.MaxWidth = 250
  Constraints.MinHeight = 200
  Constraints.MinWidth = 250
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 200
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 300
    object DriverLicenseStringGrid: TStringGrid
      Left = 1
      Top = 58
      Width = 248
      Height = 141
      Align = alClient
      ColCount = 3
      RowCount = 3
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 57
    end
    object BottonPanel: TPanel
      Left = 1
      Top = 1
      Width = 248
      Height = 25
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 7
      ExplicitWidth = 246
      object EditButton: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 78
        Height = 19
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 0
        Margins.Bottom = 2
        Align = alLeft
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 0
        OnClick = EditButtonClick
        ExplicitTop = 4
      end
      object addButton: TButton
        AlignWithMargins = True
        Left = 83
        Top = 3
        Width = 78
        Height = 19
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 0
        Margins.Bottom = 2
        Align = alLeft
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = addButtonClick
        ExplicitTop = 4
      end
      object DeleteButton: TButton
        AlignWithMargins = True
        Left = 163
        Top = 3
        Width = 78
        Height = 19
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alLeft
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 2
        OnClick = DeleteButtonClick
        ExplicitTop = 4
      end
    end
    object EditPanel: TPanel
      AlignWithMargins = True
      Left = 1
      Top = 29
      Width = 248
      Height = 26
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      TabOrder = 2
      ExplicitLeft = 4
      ExplicitTop = 58
      object LicenseCategoryComboBox: TDBLookupComboBox
        AlignWithMargins = True
        Left = 9
        Top = 1
        Width = 60
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'ID'
        ListField = 'CATEGORY_NAME'
        ListSource = DBConnect.licenseCategoryDataSource
        TabOrder = 0
        ExplicitTop = 0
      end
      object issueDateEditMask: TMaskEdit
        AlignWithMargins = True
        Left = 77
        Top = 1
        Width = 78
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Align = alLeft
        Anchors = [akLeft, akTop, akRight]
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 1
        Text = '  .  .    '
        ExplicitTop = 0
      end
      object expirationDateEditMask: TMaskEdit
        AlignWithMargins = True
        Left = 163
        Top = 1
        Width = 78
        Height = 21
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Align = alLeft
        Anchors = [akLeft, akTop, akRight]
        EditMask = '!99/99/9999'
        MaxLength = 10
        TabOrder = 2
        Text = '  .  .    '
      end
    end
  end
end
