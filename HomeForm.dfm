object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 542
  ClientWidth = 812
  Color = clBtnFace
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
    Width = 812
    Height = 542
    ActivePage = TripRequestPage
    Align = alClient
    TabOrder = 0
    object TripRequestPage: TTabSheet
      Caption = #1047#1072#1087#1088#1086#1089#1099
      object TripRequestPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 804
        Height = 514
        ActivePage = PendingRequestPage
        Align = alClient
        MultiLine = True
        TabOrder = 0
        object PendingRequestPage: TTabSheet
          Caption = #1054#1078#1080#1076#1072#1102#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
          ExplicitLeft = 0
        end
        object AllRequestPage: TTabSheet
          Caption = #1042#1089#1077' '#1079#1072#1087#1088#1086#1089#1099
          ImageIndex = 1
        end
      end
    end
    object TripPage: TTabSheet
      Caption = #1052#1072#1088#1096#1088#1091#1090#1099
      ImageIndex = 4
    end
    object transportPage: TTabSheet
      Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      ImageIndex = 2
      inline TransportFr1: TTransportFr
        Left = 0
        Top = 0
        Width = 804
        Height = 514
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 804
        ExplicitHeight = 514
        inherited BottomPanel: TPanel
          Width = 804
          Height = 355
          ExplicitTop = 159
          ExplicitWidth = 804
          ExplicitHeight = 355
          inherited TransportDBGrid: TDBGrid
            Width = 802
            Height = 353
          end
        end
        inherited TopPanel: TPanel
          Width = 804
          ExplicitWidth = 804
          inherited ManipulationGroupBox: TGroupBox
            Left = 445
            ExplicitLeft = 445
          end
          inherited SearchGroupBox: TGroupBox
            Width = 444
            ExplicitWidth = 444
          end
        end
        inherited EditGroupBox: TGroupBox
          Width = 804
          ExplicitWidth = 804
          inherited SelectedVehicleTypeEdit: TEdit
            ExplicitTop = 15
          end
        end
      end
    end
    object driverPage: TTabSheet
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      ImageIndex = 3
      inline DriverFr1: TDriverFr
        Left = 0
        Top = 0
        Width = 804
        Height = 514
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 804
        ExplicitHeight = 514
        inherited BottomPanel: TPanel
          Width = 804
          Height = 355
          ExplicitTop = 159
          ExplicitWidth = 804
          ExplicitHeight = 355
          inherited driverGrid: TDBGrid
            Width = 794
            Height = 345
          end
        end
        inherited UpperPanel: TPanel
          Width = 804
          ExplicitWidth = 804
          inherited ManipulationGroupBox: TGroupBox
            Left = 445
            ExplicitLeft = 445
            ExplicitTop = 1
            ExplicitHeight = 119
          end
          inherited SearchBoxGroupBox: TGroupBox
            ExplicitLeft = 1
            ExplicitTop = 1
          end
          inherited VehicleTypeCheckListBox: TCheckListBox
            Width = 107
            ExplicitLeft = 338
            ExplicitTop = 1
            ExplicitWidth = 107
          end
        end
        inherited EditGroupbox: TGroupBox
          Width = 804
          ExplicitTop = 121
          ExplicitWidth = 804
        end
      end
    end
    object VehicleTypePage: TTabSheet
      Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      ImageIndex = 4
    end
  end
end
