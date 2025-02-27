object DBConnect: TDBConnect
  Left = 0
  Top = 0
  Caption = 'DBConnect'
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
      'SELECT tr.id,'
      ' route_name AS "'#1052#1072#1088#1096#1088#1091#1090'", '
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
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    SQL.Strings = (
      'select'
      'id, type_name'
      'from vehicle_type')
    Left = 560
    Top = 32
  end
  object VehicleTypeDataSource: TDataSource
    DataSet = vehicleType
    Left = 608
    Top = 32
  end
  object TransportQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '    t.id      AS '#1085#1086#1084#1077#1088','
      '    type_name AS "'#1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072'",'
      'start_exploitation as "'#1053#1072#1095#1072#1083#1086' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080'",'
      'end_exploitation as "'#1050#1086#1085#1077#1094' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1080'"'
      'FROM'
      '         transport t'
      '    JOIN vehicle_type vt ON t.vehicle_type_id = vt.id')
    Left = 56
    Top = 136
  end
  object ShortDriverQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'Select'
      '  id,'
      ' full_name as "'#1060#1048#1054'"'
      'from driver')
    Left = 56
    Top = 192
  end
  object TransportDataSource: TDataSource
    DataSet = TransportQuery
    Left = 144
    Top = 136
  end
  object ShortDriverDataSource: TDataSource
    DataSet = ShortDriverQuery
    Left = 144
    Top = 192
  end
  object DriverQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'Select id, full_name as "'#1060#1048#1054'", employment_start as "'#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1086' ' +
        #1088#1072#1073#1086#1090#1099'"'
      'from driver')
    Left = 56
    Top = 248
  end
  object tripQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      
        '    TO_CHAR(t.start_datetime, '#39'YYYY-MM-DD HH24:MI'#39') AS "'#1042#1088#1077#1084#1103' '#1086#1090 +
        #1098#1077#1079#1076#1072'",'
      
        '    TO_CHAR(t.end_datetime, '#39'YYYY-MM-DD HH24:MI'#39') AS "'#1042#1088#1077#1084#1103' '#1087#1088#1080#1073 +
        #1099#1090#1080#1103'",'
      '    vt.type_name AS "'#1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072'",'
      '    d.full_name AS "'#1060#1048#1054' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      'FROM trip t'
      'LEFT JOIN transport tr ON t.transport_id = tr.id'
      
        'LEFT JOIN vehicle_type vt ON tr.vehicle_type_id = vt.id  -- '#1048#1089#1087#1088 +
        #1072#1074#1083#1077#1085#1085#1072#1103' '#1089#1074#1103#1079#1100
      
        'LEFT JOIN driver d ON t.driver_id = d.id                 -- '#1045#1089#1083#1080 +
        ' '#1074#1086#1076#1080#1090#1077#1083#1080' '#1093#1088#1072#1085#1103#1090#1089#1103' '#1086#1090#1076#1077#1083#1100#1085#1086
      'ORDER BY t.start_datetime DESC')
    Left = 56
    Top = 304
  end
  object FDQuery3: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'Select full_name'
      'from driver')
    Left = 56
    Top = 360
  end
  object DriverDataSource: TDataSource
    DataSet = DriverQuery
    Left = 144
    Top = 248
  end
  object tripDataSource: TDataSource
    DataSet = tripQuery
    Left = 144
    Top = 304
  end
  object DataSource3: TDataSource
    DataSet = ShortDriverQuery
    Left = 144
    Top = 356
  end
end
