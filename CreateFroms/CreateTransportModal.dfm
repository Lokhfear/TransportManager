object CreateTransport: TCreateTransport
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1088#1072#1085#1089#1087#1086#1088#1090
  ClientHeight = 171
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  DesignSize = (
    454
    171)
  PixelsPerInch = 96
  TextHeight = 13
  object NumberPlateLabel: TLabel
    Left = 8
    Top = 14
    Width = 110
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
  end
  object startDateLabel: TLabel
    Left = 12
    Top = 68
    Width = 110
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
  end
  object VehicleTypeLabel: TLabel
    Left = 232
    Top = 14
    Width = 80
    Height = 13
    Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
  end
  object endDateLabel: TLabel
    Left = 232
    Top = 68
    Width = 104
    Height = 13
    Caption = #1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
  end
  object NumberPlateCreateEdit: TEdit
    Left = 8
    Top = 33
    Width = 186
    Height = 21
    TabOrder = 0
    TextHint = 'A12BC2'
  end
  object StartExploitationCreateDateTimePicker: TDateTimePicker
    Left = 8
    Top = 87
    Width = 186
    Height = 21
    Date = 45716.000000000000000000
    Time = 0.955198333336738900
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 158
    Top = 128
    Width = 117
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 2
    TabOrder = 2
  end
  object CreateButton: TButton
    Left = 297
    Top = 128
    Width = 117
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 1
    TabOrder = 3
    OnClick = CreateButtonClick
  end
  object EndExploitationCreateDateTimePicker: TDateTimePicker
    Left = 228
    Top = 87
    Width = 186
    Height = 21
    Date = 45716.000000000000000000
    Time = 0.955198333336738900
    Enabled = False
    TabOrder = 4
  end
  object VehicleTypeDBLookupComboBox: TDBLookupComboBox
    Left = 228
    Top = 33
    Width = 186
    Height = 21
    KeyField = 'ID'
    ListField = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
    ListSource = DBConnect.VehicleTypeDataSource
    TabOrder = 5
  end
end
