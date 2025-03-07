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
      ' route_name, '
      '       distance,'
      '       creation_date ,'
      '       status,'
      '       tr.required_vehicle_type_id,'
      '       type_name'
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
      'SELECT id, type_name as "'#1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072'"'
      'FROM vehicle_type')
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
      '    t.number_plate,'
      '    type_name,'
      'start_exploitation,'
      'end_exploitation'
      'FROM'
      '         transport t'
      '    JOIN vehicle_type vt ON t.vehicle_type_id = vt.id')
    Left = 56
    Top = 136
  end
  object TransportDataSource: TDataSource
    DataSet = TransportQuery
    Left = 144
    Top = 136
  end
  object DriverQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '    d.id,'
      '    d.full_name,'
      '    d.employment_start,'
      '    LISTAGG(vt.type_name, '#39', '#39') WITHIN GROUP('
      '    ORDER BY'
      '        vt.type_name'
      '    )                  AS vehicle_types'
      'FROM'
      '         driver d'
      '    JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id'
      '    JOIN vehicle_type        vt ON dvt.vehicle_type_id = vt.id'
      'GROUP BY'
      '    d.id,'
      '    d.full_name,'
      '    d.employment_start'
      'ORDER BY'
      '    d.full_name')
    Left = 56
    Top = 248
  end
  object tripQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    t.id,'
      '    d.full_name,'
      '    t.driver_id,'
      '    trq.route_name,'
      '    trq.distance,'
      '    t.transport_id,'
      '    vt.type_name,'
      
        '    TO_CHAR(t.start_datetime, '#39'DD.MM.YYYY HH24:MI'#39') as start_dat' +
        'etime,'
      
        '    TO_CHAR(t.end_datetime, '#39'DD.MM.YYYY HH24:MI'#39') as end_datetim' +
        'e,'
      '    trq.required_vehicle_type_id'
      '    '
      'FROM trip t'
      'LEFT JOIN transport tr ON t.transport_id = tr.number_plate'
      'LEFT JOIN vehicle_type vt ON tr.vehicle_type_id = vt.id'
      'LEFT JOIN driver d ON t.driver_id = d.id '
      'JOIN trip_request trq on t.trip_request_id = trq.id'
      'ORDER BY t.start_datetime DESC')
    Left = 56
    Top = 304
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
  object AvaibleDriverQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    id, '
      '    full_name, '
      '    employment_start'
      'FROM '
      '    driver d'
      'JOIN '
      '    driver_vehicle_type dvt ON d.id = dvt.driver_id'
      'WHERE'
      '    id NOT IN ('
      '        SELECT'
      '            driver_id'
      '        FROM'
      '            trip t'
      '        JOIN '
      '            trip_request tr ON t.trip_request_id = tr.id'
      '            AND tr.status = '#39#1042' '#1087#1088#1086#1094#1077#1089#1089#1077#39
      '    )'
      'GROUP BY '
      '    id, full_name, employment_start'
      'ORDER BY '
      '    full_name')
    Left = 288
    Top = 192
  end
  object AvaibleTransportQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    t.number_plate, '
      '    t.start_exploitation, '
      '    t.end_exploitation, '
      '    vt.type_name'
      'FROM transport t'
      'JOIN vehicle_type vt '
      '    ON t.vehicle_type_id = vt.id'
      
        'AND (t.end_exploitation IS NULL OR t.end_exploitation >= SYSDATE' +
        ')'
      'AND t.number_plate NOT IN ('
      '    SELECT transport_id '
      '    FROM trip trip '
      '    JOIN trip_request tr '
      '        ON trip.trip_request_id = tr.id '
      '    WHERE tr.status = '#39#1042' '#1087#1088#1086#1094#1077#1089#1089#1077#39
      ')')
    Left = 288
    Top = 136
  end
  object AvaibleTransportDataSource: TDataSource
    DataSet = AvaibleTransportQuery
    Left = 352
    Top = 136
  end
  object AvaibleDriverDataSource: TDataSource
    DataSet = AvaibleDriverQuery
    Left = 352
    Top = 192
  end
  object CheckListBoxQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    id, '
      '    full_name, '
      '    employment_start'
      'FROM '
      '    driver d'
      'JOIN '
      '    driver_vehicle_type dvt ON d.id = dvt.driver_id'
      'WHERE'
      '    id NOT IN ('
      '        SELECT'
      '            driver_id'
      '        FROM'
      '            trip t'
      '        JOIN '
      '            trip_request tr ON t.trip_request_id = tr.id'
      '            AND tr.status = '#39#1042' '#1087#1088#1086#1094#1077#1089#1089#1077#39
      '    )'
      'GROUP BY '
      '    id, full_name, employment_start'
      'ORDER BY '
      '    full_name')
    Left = 496
    Top = 136
  end
end
