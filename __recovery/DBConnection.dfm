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
    Left = 144
    Top = 376
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
    ReportOptions.CreateDate = 45735.057585636600000000
    ReportOptions.LastChange = 45735.057585636600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure onEditExit(Sender: TfrxComponent);'
      'begin'
      '                                            '
      'end;'
      ''
      ''
      ''
      'procedure ConfrimButtonOnClick(Sender: TfrxComponent);'
      
        'var startDate, endDate : TDate;                                 ' +
        '                                     '
      'begin'
      
        '  if  ValidDate(StartDateEdit.text) and ValidDate(EndDateEdit.te' +
        'xt)  then'
      '    begin'
      
        '     startDate := StrToDate(StartDateEdit.Text);                ' +
        '                      '
      '     endDate := StrToDate(EndDateEdit.Text);'
      ''
      '     if startDate > endDate then'
      '     begin'
      
        '       showMessage('#39#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1095#1077#1090#1072' '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1087#1086#1079#1078#1077' '#1076#1072#1090#1099' ' +
        #1082#1086#1085#1094#1072#39');'
      '       exit;             '
      '     end;                  '
      '                      '
      '       '
      '     Report.Variables['#39'StartDate'#39'] := startDate;'
      '     Report.Variables['#39'EndDate'#39'] := endDate;'
      ''
      
        '     ConfrimButton.ModalResult := mrok;                         ' +
        '                              '
      '    end            '
      '  else            '
      '   showMessage('#39#1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1088#1088#1077#1082#1090#1085#1091#1102' '#1076#1072#1090#1091#39');                '
      'end;'
      ''
      'begin  '
      ''
      ''
      'end.  '
      '          ')
    Left = 680
    Top = 384
    Datasets = <
      item
        DataSet = frxReport1.TransportResultQuery
        DataSetName = 'FDQuery1'
      end>
    Variables = <
      item
        Name = ' DateParam'
        Value = Null
      end
      item
        Name = 'StartDate'
        Value = ''
      end
      item
        Name = 'EndDate'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FDDatabase1: TfrxFDDatabase
        DriverName = 'Ora'
        DatabaseName = 'FREE'
        Params.Strings = (
          'User_Name=SYSTEM'
          'Database=FREE'
          'Password=220376'
          'DriverID=Ora')
        LoginPrompt = False
        Connected = True
        pLeft = 572
        pTop = 84
      end
      object TransportResultQuery: TfrxFDQuery
        UserName = 'FDQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        IgnoreDupParams = False
        Params = <
          item
            Name = 'startDate'
            DataType = ftDate
            Expression = '<StartDate>'
          end
          item
            Name = 'endDate'
            DataType = ftDate
            Expression = '<EndDate>'
          end>
        SQL.Strings = (
          'SELECT'
          '    brand_name,'
          '    type_name        AS vehicle_type,'
          '    trn.number_plate,'
          '    COUNT(t.id) as total_trip,'
          '    SUM(tr.distance) AS total_distancem,'
          
            '    --'#1089#1095#1080#1090#1072#1077#1090' '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1076#1085#1103#1084' '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1073#1099#1083#1080' '#1087#1086#1077#1079#1076#1082#1080'. '#1053#1072#1076#1086' '#1076#1086#1073#1080#1074#1080 +
            #1090#1100' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1082' '#1074#1088#1077#1084#1077#1085#1080
          
            '    round(SUM(distance) / COUNT(DISTINCT trunc(start_datetime)),' +
            '2) AS avg_daily_distance'
          'FROM'
          '         trip_request tr'
          '    JOIN trip            t ON tr.id = t.trip_request_id'
          
            '    JOIN transport       trn ON t.transport_id = trn.number_plat' +
            'e'
          
            '    JOIN transport_brand tran_b ON trn.transport_brand_id = tran' +
            '_b.id'
          '    JOIN vehicle_type    vt ON trn.vehicle_type_id = vt.id'
          'WHERE'
          '    tr.status_id = 2 and --'#1055#1086#1084#1077#1085#1103#1090#1100' '#1089#1090#1072#1090#1091#1089'?'
          
            '    TRUNC(tr.start_datetime) > :startDate and TRUNC(tr.start_dat' +
            'etime) < :endDate --'#1087#1086' '#1076#1072#1090#1077' '#1085#1072#1095#1072#1083#1072' '#1087#1086#1077#1079#1076#1082#1080
          'GROUP BY'
          '    brand_name,'
          '    type_name,'
          '    trn.number_plate'
          'ORDER BY'
          '    type_name, brand_name    ')
        MacroCreate = True
        MacroExpand = True
        ReadOnly = False
        Database = frxReport1.FDDatabase1
        Macros = <>
        Left = 72.000000000000000000
        Top = 72.000000000000000000
        pLeft = 72
        pTop = 72
        Parameters = <
          item
            Name = 'startDate'
            DataType = ftDate
            Expression = '<StartDate>'
          end
          item
            Name = 'endDate'
            DataType = ftDate
            Expression = '<EndDate>'
          end>
        Macross = <>
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
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 120.000000000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = -3.779530000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1052#1072#1088#1082#1072)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Width = 192.755961650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1053#1086#1084#1077#1088)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1042#1089#1077#1075#1086' '#1087#1086#1077#1079#1076#1086#1082)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 506.457020000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1042#1089#1077#1075#1086' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1103)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1089#1088'. '#1082#1084'/'#1076#1077#1085#1100)
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
        Height = 83.149660000000000000
        Top = 16.000000000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 160.000000000000000000
        Width = 718.110700000000000000
        DataSet = frxReport1.TransportResultQuery
        DataSetName = 'FDQuery1'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = -3.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'BRAND_NAME'
          DataSet = frxReport1.TransportResultQuery
          DataSetName = 'FDQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FDQuery1."BRAND_NAME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataField = 'VEHICLE_TYPE'
          DataSet = frxReport1.TransportResultQuery
          DataSetName = 'FDQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FDQuery1."VEHICLE_TYPE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'NUMBER_PLATE'
          DataSet = frxReport1.TransportResultQuery
          DataSetName = 'FDQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FDQuery1."NUMBER_PLATE"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_TRIP'
          DataSet = frxReport1.TransportResultQuery
          DataSetName = 'FDQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FDQuery1."TOTAL_TRIP"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 506.457020000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_DISTANCEM'
          DataSet = frxReport1.TransportResultQuery
          DataSetName = 'FDQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FDQuery1."TOTAL_DISTANCEM"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'AVG_DAILY_DISTANCE'
          DataSet = frxReport1.TransportResultQuery
          DataSetName = 'FDQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FDQuery1."AVG_DAILY_DISTANCE"]')
          ParentFont = False
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      BorderStyle = bsDialog
      DoubleBuffered = False
      Height = 169.000000000000000000
      ClientHeight = 140.000000000000000000
      Left = 603.000000000000000000
      Top = 327.000000000000000000
      Width = 330.000000000000000000
      Scaled = False
      ClientWidth = 324.000000000000000000
      object ConfrimButton: TfrxButtonControl
        Left = 220.000000000000000000
        Top = 92.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
        OnClick = 'ConfrimButtonOnClick'
      end
      object CancelButton: TfrxButtonControl
        Left = 120.000000000000000000
        Top = 92.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
      end
      object startDateEdit: TfrxEditControl
        Left = 32.000000000000000000
        Top = 52.000000000000000000
        Width = 121.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
        Text = '11'
        OnExit = 'onEditExit'
      end
      object EndDateEdit: TfrxEditControl
        Left = 176.000000000000000000
        Top = 52.000000000000000000
        Width = 121.000000000000000000
        Height = 21.000000000000000000
        Hint = '30.12.2001'
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
        OnExit = 'onEditExit'
      end
      object Label1: TfrxLabelControl
        Left = 32.000000000000000000
        Top = 36.000000000000000000
        Width = 87.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072':'
        Color = clBtnFace
      end
      object Label2: TfrxLabelControl
        Left = 176.000000000000000000
        Top = 36.000000000000000000
        Width = 81.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072':'
        Color = clBtnFace
      end
      object Label3: TfrxLabelControl
        Left = 140.000000000000000000
        Top = 8.000000000000000000
        Width = 83.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1042#1042#1077#1076#1080#1090#1077' '#1087#1077#1088#1080#1086#1076
        Color = clBtnFace
        OnClick = 'Label3OnClick'
      end
      object Label4: TfrxLabelControl
        Left = 160.000000000000000000
        Top = 56.000000000000000000
        Width = 12.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1087#1086
        Color = clBtnFace
      end
      object Label5: TfrxLabelControl
        Left = 20.000000000000000000
        Top = 56.000000000000000000
        Width = 5.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1089
        Color = clBtnFace
      end
    end
  end
end
