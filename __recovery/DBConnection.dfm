object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 458
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=FREE'
      'User_Name=SYSTEM'
      'Password=220376'
      'DriverID=Ora'
      'CharacterSet=UTF8')
    Connected = True
    Left = 80
    Top = 24
  end
  object pendingRequest: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT route_name AS "'#1052#1072#1088#1096#1088#1091#1090'", '
      '       distance AS "'#1056#1072#1089#1089#1090#1086#1103#1085#1080#1077'", '
      '       creation_date AS "'#1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103'", '
      '       status AS "'#1057#1090#1072#1090#1091#1089'", '
      '       type_name AS "'#1058#1088#1072#1085#1089#1087#1086#1088#1090'"'
      'FROM trip_request tr '
      'LEFT JOIN vehicle_type vh ON tr.required_vehicle_type_id = vh.id'
      'WHERE status = '#39#1054#1078#1080#1076#1072#1077#1090#39
      'ORDER BY creation_date')
    Left = 152
    Top = 24
  end
  object tripRequestDataSource: TDataSource
    DataSet = pendingRequest
    Left = 208
    Top = 24
  end
  object vehicleType: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select type_name as "'#1058#1080#1087' '#1090#1072#1088#1072#1085#1089#1087#1086#1088#1090#1072'"'
      'from vehicle_type')
    Left = 560
    Top = 32
  end
  object VehicleTypeDataSource: TDataSource
    Left = 608
    Top = 32
  end
end
