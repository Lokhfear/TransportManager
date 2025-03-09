object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 121
    Width = 844
    Height = 320
    Align = alClient
    TabOrder = 0
    ExplicitTop = 209
    ExplicitHeight = 232
    object PendingRequestDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 842
      Height = 318
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
          FieldName = 'ROUTE_NAME'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTANCE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREATION_DATE'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_NAME'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQUIRED_VEHICLE_TYPE_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TYPE_NAME'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'START_DATETIME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_DATETIME'
          Visible = True
        end>
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 121
    Align = alTop
    TabOrder = 1
    object SearchGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 842
      Height = 119
      Align = alClient
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 0
      ExplicitWidth = 488
      ExplicitHeight = 207
    end
  end
end
