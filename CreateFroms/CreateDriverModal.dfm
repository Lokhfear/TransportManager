object CreateDriver: TCreateDriver
  Left = 0
  Top = 0
  Anchors = [akTop]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1103
  ClientHeight = 355
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    610
    355)
  PixelsPerInch = 96
  TextHeight = 13
  object FullNameLabel: TLabel
    Left = 330
    Top = 28
    Width = 23
    Height = 13
    Caption = #1060#1048#1054
  end
  object EmploymentStartDateLabel: TLabel
    Left = 330
    Top = 94
    Width = 106
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090#1099
  end
  object VehicleTypesLabel: TLabel
    Left = 32
    Top = 9
    Width = 172
    Height = 13
    Caption = #1048#1084#1077#1102#1097#1080#1077#1089#1103' '#1074#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1077' '#1087#1088#1072#1074#1072':'
  end
  object FullNameCreateEdit: TEdit
    Left = 330
    Top = 47
    Width = 231
    Height = 21
    TabOrder = 0
    TextHint = #1069#1075#1080#1087#1090#1077' '#1052#1080#1093#1072#1080#1083' '#1040#1085#1072#1090#1086#1083#1100#1077#1074#1080#1095
  end
  object employmentStartDatePicker: TDateTimePicker
    Left = 330
    Top = 113
    Width = 231
    Height = 21
    Date = 45716.000000000000000000
    Time = 0.826391643517126800
    TabOrder = 1
  end
  object CreateButton: TButton
    Left = 461
    Top = 296
    Width = 100
    Height = 25
    Anchors = [akTop, akBottom]
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 1
    TabOrder = 2
    OnClick = CreateButtonClick
  end
  object CancelButton: TButton
    Left = 330
    Top = 296
    Width = 100
    Height = 25
    Anchors = [akTop, akBottom]
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 2
    TabOrder = 3
  end
  object DriverLicensesPanel: TPanel
    Left = 32
    Top = 28
    Width = 255
    Height = 300
    TabOrder = 4
  end
end
