object CreateDriver: TCreateDriver
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1103
  ClientHeight = 284
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    552
    284)
  PixelsPerInch = 96
  TextHeight = 13
  object FullNameLabel: TLabel
    Left = 282
    Top = 36
    Width = 23
    Height = 13
    Caption = #1060#1048#1054
  end
  object EmploymentStartDateLabel: TLabel
    Left = 282
    Top = 94
    Width = 106
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090#1099
  end
  object VehicleTypesLabel: TLabel
    Left = 25
    Top = 17
    Width = 88
    Height = 13
    Caption = #1058#1080#1087#1099' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
  end
  object FullNameCreateEdit: TEdit
    Left = 282
    Top = 55
    Width = 231
    Height = 21
    TabOrder = 0
    TextHint = #1069#1075#1080#1087#1090#1077' '#1052#1080#1093#1072#1080#1083' '#1040#1085#1072#1090#1086#1083#1100#1077#1074#1080#1095
  end
  object employmentStartDatePicker: TDateTimePicker
    Left = 282
    Top = 113
    Width = 231
    Height = 21
    Date = 45716.000000000000000000
    Time = 0.826391643517126800
    TabOrder = 1
  end
  object VehicleTypeCheckListBox: TCheckListBox
    Left = 25
    Top = 36
    Width = 232
    Height = 197
    Columns = 1
    ItemHeight = 13
    Items.Strings = (
      ''
      #1090#1077#1082#1089#1090
      #1090#1077#1082#1089#1090
      #1090#1077#1082#1089#1090
      #1090#1077#1082#1089#1090
      #1090#1077#1082#1089#1090
      #1090#1077#1082#1089#1090'3'
      #1090#1077#1082#1089#1090'3'
      #1090#1077#1082#1089#1090'3'
      #1090#1077#1082#1089#1090'3'
      #1090#1077#1082#1089#1090'3'
      #1058#1077#1089#1090#11
      #1058#1077#1089#1090#11
      #1058#1077#1089#1090#11
      #1058#1077#1089#1090#11
      #1058#1077#1089#1090#11
      #1090#1077#1089#1090'2'
      #1090#1077#1089#1090'2'
      #1090#1077#1089#1090'2'
      #1090#1077#1089#1090'2'
      #1090#1077#1089#1090'2')
    Sorted = True
    TabOrder = 2
  end
  object CreateButton: TButton
    Left = 416
    Top = 208
    Width = 117
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 1
    TabOrder = 3
    OnClick = CreateButtonClick
  end
  object CancelButton: TButton
    Left = 277
    Top = 208
    Width = 117
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 2
    TabOrder = 4
  end
end
