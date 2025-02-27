object TransportFr: TTransportFr
  Left = 0
  Top = 0
  Width = 835
  Height = 456
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 182
    Width = 835
    Height = 274
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 804
    object DBGrid6: TDBGrid
      Left = 1
      Top = 1
      Width = 833
      Height = 272
      Align = alClient
      Color = clWhite
      DataSource = Form2.TransportDataSource
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
          FieldName = #1053#1054#1052#1045#1056
          Visible = True
        end
        item
          Expanded = False
          FieldName = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Visible = True
        end
        item
          Expanded = False
          FieldName = #1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Visible = True
        end>
    end
  end
end
