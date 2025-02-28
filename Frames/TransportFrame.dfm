object TransportFr: TTransportFr
  Left = 0
  Top = 0
  Width = 860
  Height = 480
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 182
    Width = 860
    Height = 298
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 835
    ExplicitHeight = 274
    object DBGrid6: TDBGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 296
      Align = alClient
      Color = clWhite
      DataSource = DBConnect.TransportDataSource
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
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
          Width = 500
          Visible = True
        end
        item
          Expanded = False
          FieldName = #1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080
          Width = 120
          Visible = True
        end>
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 138
    Width = 860
    Height = 44
    Align = alBottom
    Caption = 'GroupBox1'
    TabOrder = 1
    object DBEdit1: TDBEdit
      Left = 1
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 128
      Top = 11
      Width = 467
      Height = 21
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 616
      Top = 11
      Width = 106
      Height = 21
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 728
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 448
    Height = 138
    Align = alClient
    Caption = 'GroupBox2'
    TabOrder = 2
    ExplicitWidth = 521
    object DBEdit5: TDBEdit
      Left = 17
      Top = 25
      Width = 186
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 17
      Top = 107
      Width = 386
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
    object DateTimePicker1: TDateTimePicker
      Left = 17
      Top = 64
      Width = 186
      Height = 21
      Date = 45716.000000000000000000
      Time = 0.955198333336738900
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 217
      Top = 25
      Width = 186
      Height = 21
      TabOrder = 3
    end
    object DateTimePicker2: TDateTimePicker
      Left = 217
      Top = 64
      Width = 186
      Height = 21
      Date = 45716.000000000000000000
      Time = 0.955198333336738900
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 448
    Top = 0
    Width = 412
    Height = 138
    Align = alRight
    Caption = 'GroupBox3'
    TabOrder = 3
  end
end
