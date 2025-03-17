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
      'SELECT '
      '    tr.id, '
      '    route_name, '
      '    distance, '
      '    creation_date,'
      '    status_name, '
      '    tr.required_vehicle_type_id, '
      '    vh.type_name, '
      
        '    TO_CHAR(start_datetime, '#39'DD.MM.YYYY HH24:MI'#39') AS start_datet' +
        'ime, '
      '    TO_CHAR(end_datetime, '#39'DD.MM.YYYY HH24:MI'#39') AS end_datetime'
      'FROM trip_request tr'
      'LEFT JOIN vehicle_type vh ON tr.required_vehicle_type_id = vh.id'
      'join status s on tr.status_id = s.id and s.id = 1'
      'ORDER BY creation_date')
    Left = 152
    Top = 24
  end
  object tripRequestDataSource: TDataSource
    DataSet = pendingRequest
    Left = 208
    Top = 24
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
      'SELECT '
      '    t.number_plate, '
      '    vt.type_name,'
      '    lc.category_name as license_category,'
      '    tb.brand_name,'
      '    t.start_exploitation, '
      '    t.end_exploitation'
      'FROM transport t'
      'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id'
      'JOIN license_category lc ON vt.required_license_id = lc.id'
      'JOIN transport_brand tb On t.transport_brand_id = tb.id'
      'order by type_name')
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
      'SELECT '
      '    d.id, '
      '    d.full_name, '
      '    d.employment_start,'
      '    d.employment_end,'
      
        '    LISTAGG(lc.category_name, '#39', '#39') WITHIN GROUP (ORDER BY lc.ca' +
        'tegory_name) AS license_categories'
      'FROM driver d'
      'LEFT JOIN driver_license dl ON d.id = dl.driver_id'
      'LEFT JOIN license_category lc ON dl.license_category_id = lc.id'
      'GROUP BY d.id, d.full_name, d.employment_start, d.employment_end'
      'ORDER BY d.full_name')
    Left = 56
    Top = 248
  end
  object tripQuery: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    t.id, '
      '    t.driver_id, '
      '    d.full_name, '
      '    trq.route_name, '
      '    trq.distance, '
      '    t.transport_id, '
      '    vt.type_name, '
      '    trq.required_vehicle_type_id,'
      
        '    to_char(trq.start_datetime, '#39'DD.MM.YYYY HH24:MI'#39') AS start_d' +
        'atetime,'
      
        '    to_char(trq.end_datetime, '#39'DD.MM.YYYY HH24:MI'#39')   AS end_dat' +
        'etime'
      'FROM trip t '
      'LEFT JOIN transport tr ON t.transport_id = tr.number_plate '
      'LEFT JOIN vehicle_type vt ON tr.vehicle_type_id = vt.id '
      'LEFT JOIN driver d ON t.driver_id = d.id '
      'JOIN trip_request trq ON t.trip_request_id = trq.id '
      'ORDER BY trq.start_datetime DESC')
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
      'SELECT'
      '    id,'
      '    full_name,'
      '    employment_start,'
      
        '    availabilitychecker.getdriverworkedhours(id, SYSDATE)as work' +
        'ed_hours'
      'FROM'
      '         driver d'
      '    JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id'
      'order by worked_hours ')
    Left = 288
    Top = 192
  end
  object AvaibleTransportQuery: TFDQuery
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
  object DriverLicensesQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT driver_id, license_category_id, issue_date, expiration_da' +
        'te'
      
        'from driver_license dl join license_category lc on dl.license_ca' +
        'tegory_id = lc.id'
      'order by dl.driver_id, lc.category_name')
    Left = 496
    Top = 136
  end
  object vehicleType: TFDQuery
    Active = True
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    SQL.Strings = (
      'SELECT vt.id, type_name, category_name as license_category'
      
        'FROM vehicle_type vt join license_category lc on vt.required_lic' +
        'ense_id = lc.id'
      'order by category_name ')
    Left = 560
    Top = 32
  end
  object licenseCategoryQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    SQL.Strings = (
      'select * from license_category')
    Left = 48
    Top = 376
  end
  object licenseCategoryDataSource: TDataSource
    DataSet = licenseCategoryQuery
    Left = 136
    Top = 384
  end
  object DriverLicensesDataSource: TDataSource
    DataSet = vehicleType
    Left = 560
    Top = 136
  end
  object TransportBrandQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from transport_brand')
    Left = 280
    Top = 384
  end
  object TransportBrandDataSource: TDataSource
    DataSet = TransportBrandQuery
    Left = 344
    Top = 384
  end
  object frxReport1: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45733.875815393520000000
    ReportOptions.LastChange = 45733.875815393520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 704
    Top = 400
    Datasets = <
      item
        DataSet = frxReport1.FDQuery1
        DataSetName = 'FDQuery1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FDQuery1: TfrxFDQuery
        UserName = 'FDQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        IgnoreDupParams = False
        Params = <>
        MacroCreate = True
        MacroExpand = True
        ReadOnly = False
        Database = frxReport1.FDDatabase1
        Macros = <>
        Left = 72.000000000000000000
        Top = 36.000000000000000000
        pLeft = 72
        pTop = 36
        Parameters = <>
        Macross = <>
      end
      object FDDatabase1: TfrxFDDatabase
        DriverName = 'Ora'
        DatabaseName = 'FREE'
        Params.Strings = (
          'Database=FREE'
          'User_Name=SYSTEM'
          'Password=220376'
          'DriverID=Ora')
        Connected = True
        pLeft = 720
        pTop = 48
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
end
