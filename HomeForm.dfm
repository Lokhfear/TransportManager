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
    ActivePage = transportPage
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
        inherited Panel1: TPanel
          Width = 804
          Height = 381
          inherited TransportDBGrid: TDBGrid
            Width = 802
            Height = 379
          end
        end
        inherited CreateGroupBox: TGroupBox
          Width = 440
        end
        inherited GroupBox3: TGroupBox
          Left = 440
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
        inherited Panel1: TPanel
          Top = 195
          Width = 804
          inherited driverGrid: TDBGrid
            Width = 794
          end
        end
        inherited searchGroupbox: TGroupBox
          Top = 154
          Width = 804
        end
        inherited VehicleTypeCheckListBox: TCheckListBox
          Width = 176
          Height = 154
        end
        inherited GroupBox2: TGroupBox
          Height = 154
        end
        inherited GroupBox3: TGroupBox
          Left = 473
          Height = 154
        end
      end
    end
    object VehicleTypePage: TTabSheet
      Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      ImageIndex = 4
    end
  end
end
