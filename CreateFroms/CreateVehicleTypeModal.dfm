object CreateVhicleType: TCreateVhicleType
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1090#1080#1087' '#1090#1088#1072#1089#1087#1086#1088#1090#1072
  ClientHeight = 151
  ClientWidth = 456
  Color = clWhite
  Constraints.MinHeight = 180
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    456
    151)
  PixelsPerInch = 96
  TextHeight = 13
  object TypeNameLabel: TLabel
    Left = 24
    Top = 24
    Width = 135
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1080#1087#1072' '#1090#1088#1072#1089#1087#1086#1088#1090#1072':'
  end
  object CancelButton: TButton
    Left = 173
    Top = 104
    Width = 117
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 2
    TabOrder = 0
  end
  object CreateButton: TButton
    Left = 312
    Top = 104
    Width = 117
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Constraints.MinHeight = 25
    ModalResult = 1
    TabOrder = 1
    OnClick = CreateButtonClick
  end
  object typeNameEdit: TEdit
    AlignWithMargins = True
    Left = 24
    Top = 44
    Width = 405
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight, akBottom]
    Constraints.MinHeight = 25
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1080#1087' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
  end
end
