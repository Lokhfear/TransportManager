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
    ReportOptions.CreateDate = 45733.875815393500000000
    ReportOptions.LastChange = 45733.875815393500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 704
    Top = 400
    Datasets = <
      item
        DataSet = frxReport1.DriverWorkTimaeQuery
        DataSetName = 'DriverWorkTimaeQuery'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object DriverWorkTimaeQuery: TfrxFDQuery
        UserName = 'DriverWorkTimaeQuery'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        IgnoreDupParams = False
        Params = <>
        SQL.Strings = (
          'WITH daily_work AS ('
          '    SELECT '
          '        d.id AS driver_id,'
          '        d.full_name,'
          '        tr.required_vehicle_type_id AS vehicle_type,'
          '        TRUNC(tr.start_datetime) AS work_day, '
          '        COUNT(t.id) AS count_trip, '
          
            '        SUM(EXTRACT(HOUR FROM (tr.end_datetime - tr.start_dateti' +
            'me) DAY TO SECOND) + '
          
            '            EXTRACT(MINUTE FROM (tr.end_datetime - tr.start_date' +
            'time) DAY TO SECOND) / 60) AS sum_hours'
          '    FROM driver d'
          '    JOIN trip t ON d.id = t.driver_id'
          '    JOIN trip_request tr ON t.trip_request_id = tr.id'
          
            '    WHERE tr.status_id = 2                     --'#1087#1086#1077#1079#1076#1082#1080' '#1074' '#1087#1088#1086#1094#1077 +
            #1089#1089#1077'. '#1053#1072#1076#1086' '#1090#1086#1083#1100#1082#1086' '#1079#1072#1074#1077#1088#1097#1077#1085#1085#1099#1077'. ('#1103' '#1085#1080#1075#1076#1077' '#1085#1077' '#1089#1090#1072#1074#1083#1102' '#1089#1090#1072#1090#1091#1089' '#1079#1072#1074#1077#1088#1096#1077#1085 +
            #1085#1099#1081')'
          
            '    GROUP BY d.id, d.full_name, tr.required_vehicle_type_id, TRU' +
            'NC(tr.start_datetime)'
          ')'
          ''
          'SELECT '
          '    dw.full_name,'
          '    SUM(dw.count_trip) AS total_trips,'
          '    ROUND(SUM(dw.sum_hours), 2) AS total_hours,'
          '    ROUND(AVG(dw.sum_hours), 2) AS avg_hours_per_day,'
          ''
          '    --'
          
            '    ROUND(SUM(CASE WHEN dw.vehicle_type = 1 THEN dw.sum_hours EL' +
            'SE 0 END), 2) AS vehicle_type_1,'
          
            '    ROUND(SUM(CASE WHEN dw.vehicle_type = 2 THEN dw.sum_hours EL' +
            'SE 0 END), 2) AS vehicle_type_2,'
          
            '    ROUND(SUM(CASE WHEN dw.vehicle_type = 3 THEN dw.sum_hours EL' +
            'SE 0 END), 2) AS vehicle_type_3,'
          
            '    ROUND(SUM(CASE WHEN dw.vehicle_type = 4 THEN dw.sum_hours EL' +
            'SE 0 END), 2) AS vehicle_type_4,'
          
            '    ROUND(SUM(CASE WHEN dw.vehicle_type = 5 THEN dw.sum_hours EL' +
            'SE 0 END), 2) AS vehicle_type_5,'
          
            '    ROUND(SUM(CASE WHEN dw.vehicle_type = 6 THEN dw.sum_hours EL' +
            'SE 0 END), 2) AS vehicle_type_6,'
          
            '    ROUND(SUM(CASE WHEN dw.vehicle_type = 7 THEN dw.sum_hours EL' +
            'SE 0 END), 2) AS vehicle_type_7'
          ''
          'FROM daily_work dw'
          'GROUP BY dw.full_name'
          'ORDER BY avg_hours_per_day                                ')
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
          'DriverID=Ora'
          'CharacterSet=UTF8')
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        DataSet = frxReport1.DriverWorkTimaeQuery
        DataSetName = 'DriverWorkTimaeQuery'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'FULL_NAME'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."FULL_NAME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 117.165430000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_TRIPS'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."TOTAL_TRIPS"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_HOURS'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."TOTAL_HOURS"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'AVG_HOURS_PER_DAY'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."AVG_HOURS_PER_DAY"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE_1'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."VEHICLE_TYPE_1"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE_2'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."VEHICLE_TYPE_2"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 521.575140000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE_3'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."VEHICLE_TYPE_3"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE_4'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."VEHICLE_TYPE_4"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE_5'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."VEHICLE_TYPE_5"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE_6'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."VEHICLE_TYPE_6"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE_7'
          DataSet = frxReport1.DriverWorkTimaeQuery
          DataSetName = 'DriverWorkTimaeQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[DriverWorkTimaeQuery."VEHICLE_TYPE_7"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Top = 11.338590000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1058#1063#1045#1058)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Top = 34.015770000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1054' '#1050#1054#1051#1048#1063#1045#1057#1058#1042#1045' '#1056#1040#1041#1054#1063#1048#1061' '#1063#1040#1057#1054#1042' '#1042#1054#1044#1048#1058#1045#1051#1045#1049)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 60.472480000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072': [Date]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Top = 60.472480000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1040#1085#1072#1083#1080#1079#1080#1088#1091#1077#1084#1099#1081' '#1087#1077#1088#1080#1086#1076': '#1089' 1 '#1084#1072#1088#1090#1072' 2025 '#1075#1086#1076#1072' '#1087#1086' 15 '#1084#1072#1088#1090#1072' 2025 '#1075#1086#1076#1072)
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1060#1048#1054)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 117.165430000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1050#1086#1083'-'#1074#1086' '#1087#1086#1077#1079#1076#1086#1082)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 0.000000000000000003
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1042#1089#1077#1075#1086' '#1095#1072#1089#1086#1074)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1095#1072#1089#1086#1074'/'#1089#1091#1090)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1090#1080#1087'1')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1090#1080#1087'2')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 521.575140000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1090#1080#1087'3')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1090#1080#1087'4')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1090#1080#1087'5')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1090#1080#1087'6')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1090#1080#1087'7')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 631.181510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
        end
      end
    end
  end
end
