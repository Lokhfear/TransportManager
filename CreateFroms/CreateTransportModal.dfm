object CreateTransport: TCreateTransport
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1088#1072#1085#1089#1087#1086#1088#1090
  ClientHeight = 178
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
    178)
  PixelsPerInch = 96
  TextHeight = 13
  object NumberPlateLabel: TLabel
    Left = 8
    Top = 22
    Width = 110
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
  end
  object startDateLabel: TLabel
    Left = 228
    Top = 24
    Width = 110
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
  end
  object VehicleTypeLabel: TLabel
    Left = 228
    Top = 78
    Width = 80
    Height = 13
    Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
  end
  object Label1: TLabel
    Left = 8
    Top = 78
    Width = 32
    Height = 13
    Caption = #1052#1072#1088#1082#1072
  end
  object NumberPlateCreateEdit: TEdit
    Left = 8
    Top = 41
    Width = 186
    Height = 21
    TabOrder = 0
    TextHint = 'A12BC2'
  end
  object StartExploitationCreateDateTimePicker: TDateTimePicker
    Left = 228
    Top = 43
    Width = 186
    Height = 21
    Date = 45716.000000000000000000
    Time = 0.955198333336738900
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 158
    Top = 141
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
    Top = 141
    Width = 117
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 1
    TabOrder = 3
    OnClick = CreateButtonClick
  end
  object VehicleTypeDBLookupComboBox: TDBLookupComboBox
    Left = 228
    Top = 97
    Width = 186
    Height = 21
    KeyField = 'ID'
    ListField = 'TYPE_NAME'
    ListSource = DBConnect.VehicleTypeDataSource
    TabOrder = 4
  end
  object TransportBrandLookupComboBox: TDBLookupComboBox
    Left = 8
    Top = 97
    Width = 186
    Height = 21
    KeyField = 'ID'
    ListField = 'BRAND_NAME'
    ListSource = DBConnect.TransportBrandDataSource
    TabOrder = 5
  end
end
