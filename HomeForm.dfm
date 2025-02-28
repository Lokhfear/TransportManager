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
    ActivePage = VehicleTypePage
    Align = alClient
    TabOrder = 0
    object TripRequestPage: TTabSheet
      Caption = #1047#1072#1087#1088#1086#1089#1099
      object TripRequestPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 804
        Height = 514
        ActivePage = TabSheet6
        Align = alClient
        TabOrder = 0
        object TabSheet6: TTabSheet
          Caption = 'TabSheet6'
          object PendingTripRequest: TPanel
            Left = 0
            Top = 291
            Width = 796
            Height = 195
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 1
              Top = 1
              Width = 794
              Height = 193
              Align = alClient
              Color = clWhite
              DataSource = DBConnect.tripRequestDataSource
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = #1052#1072#1088#1096#1088#1091#1090
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #1057#1090#1072#1090#1091#1089
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #1058#1088#1072#1085#1089#1087#1086#1088#1090
                  Visible = True
                end>
            end
          end
          object GridPanel1: TGridPanel
            Left = 384
            Top = 0
            Width = 412
            Height = 291
            Align = alRight
            Caption = 'GridPanel1'
            ColumnCollection = <
              item
                Value = 50.000000000000000000
              end
              item
                Value = 50.000000000000000000
              end>
            ControlCollection = <
              item
                Column = 0
                Control = DBGrid4
                Row = 0
              end
              item
                Column = 1
                Control = DBGrid3
                Row = 0
              end>
            RowCollection = <
              item
                Value = 100.000000000000000000
              end>
            TabOrder = 1
            object DBGrid4: TDBGrid
              Left = 1
              Top = 1
              Width = 206
              Height = 289
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = DBConnect.ShortDriverDataSource
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = #1060#1048#1054
                  Width = 300
                  Visible = True
                end>
            end
            object DBGrid3: TDBGrid
              Left = 206
              Top = 1
              Width = 203
              Height = 289
              Align = alLeft
              DataSource = DBConnect.TransportDataSource
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = #1053#1054#1052#1045#1056
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
                  Width = 80
                  Visible = True
                end>
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'TabSheet7'
          ImageIndex = 1
        end
        object TabSheet8: TTabSheet
          Caption = 'TabSheet8'
          ImageIndex = 2
        end
      end
    end
    object tripPage: TTabSheet
      Caption = #1052#1072#1088#1096#1088#1091#1090#1099
      ImageIndex = 1
    end
    object transportPage: TTabSheet
      Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      ImageIndex = 2
    end
    object driverPage: TTabSheet
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      ImageIndex = 3
    end
    object VehicleTypePage: TTabSheet
      Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      ImageIndex = 4
    end
  end
end
