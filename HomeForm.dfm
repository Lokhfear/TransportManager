object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 503
  ClientWidth = 796
  Color = clBtnFace
  Constraints.MinHeight = 542
  Constraints.MinWidth = 812
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 796
    Height = 503
    ActivePage = TripRequestPage
    Align = alClient
    TabOrder = 0
    OnChange = PageControlChange
    ExplicitWidth = 812
    ExplicitHeight = 542
    object TripRequestPage: TTabSheet
      Caption = #1047#1072#1087#1088#1086#1089#1099
      ExplicitWidth = 804
      ExplicitHeight = 514
      object TripRequestPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 788
        Height = 475
        ActivePage = AllRequestPage
        Align = alClient
        MultiLine = True
        TabOrder = 0
        OnChange = TripRequestPageControlChange
        ExplicitWidth = 804
        ExplicitHeight = 514
        object PendingRequestPage: TTabSheet
          Caption = #1054#1078#1080#1076#1072#1102#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
          ExplicitWidth = 796
          ExplicitHeight = 486
        end
        object AllRequestPage: TTabSheet
          Caption = #1042#1089#1077' '#1079#1072#1087#1088#1086#1089#1099
          ImageIndex = 1
          ExplicitWidth = 796
          ExplicitHeight = 486
        end
      end
    end
    object TripPage: TTabSheet
      Caption = #1052#1072#1088#1096#1088#1091#1090#1099
      ImageIndex = 4
      ExplicitWidth = 804
      ExplicitHeight = 514
    end
    object transportPage: TTabSheet
      Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      ImageIndex = 2
      ExplicitWidth = 804
      ExplicitHeight = 514
    end
    object driverPage: TTabSheet
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      ImageIndex = 3
      ExplicitWidth = 804
      ExplicitHeight = 514
    end
    object VehicleTypePage: TTabSheet
      Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      ImageIndex = 4
      ExplicitWidth = 804
      ExplicitHeight = 514
    end
  end
end
