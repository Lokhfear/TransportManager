unit TransportManage;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils;

type
  TTransportManager = class(TManagerCRUD)
  public
    constructor Create(AQuery: TFDQuery);
    procedure LoadAll;
    procedure Delete(numberPlate: String; ShowDeleteMessage: Boolean);
    procedure Update(numberPlate: String; EndExploitation: TDate);
    procedure Add(numberPlate: String;
      StartExploitation: TDateTime; VehicleTypeID, TransportBrandID: Integer);
    procedure SearchByParam(
              NumberPlate, VehicleTypeName, LicenseCategory, TransportBrand: string;
              StartExploitationDateFrom, StartExploitationDateTo,
              EndExploitationDateFrom, EndExploitationDateTo: TDate);
    procedure LoadAvailableTransportByType(requiredVehicleType: Integer; startDateTime, endDateTime: TDateTime);

  end;

implementation

constructor TTransportManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;


procedure TTransportManager.LoadAvailableTransportByType(requiredVehicleType: Integer; startDateTime, endDateTime: TDateTime);
begin
  try
    FQuery.SQL.Text :=
      'SELECT t.number_plate, vt.type_name, t.start_exploitation, t.end_exploitation ' +
      'FROM transport t ' +
      'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id ' +
      'WHERE availabilitychecker.istransportfree(t.number_plate, :startDateTime, :endDateTime) = 1 ' + // �������� �� �����������
      'AND (t.end_exploitation IS NULL OR t.end_exploitation >  TRUNC(:startDateTime)) ' +
      'AND vt.id = :requiredVehicleType ' +
      'ORDER BY t.number_plate';

    FQuery.ParamByName('startDateTime').AsDateTime := startDateTime;
    FQuery.ParamByName('endDateTime').AsDateTime := endDateTime;
    FQuery.ParamByName('requiredVehicleType').AsInteger := requiredVehicleType;
    FQuery.Open;

  except
    on E: Exception do
      ShowMessage('������. �� ������� ��������� ��������� ��������� �� ��������� ����: ' + E.Message);
  end;
end;







{




procedure TTransportManager.LoadAvailableTransportByType(requiredVehicleType: Integer; NumberPlate: string);
begin
  try
    FQuery.SQL.Text :=
      'SELECT t.number_plate, t.start_exploitation, t.end_exploitation, vt.type_name ' +
      'FROM transport t ' +
      'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id ' +
      'WHERE (t.end_exploitation IS NULL OR t.end_exploitation >= SYSDATE) ' +
      'AND t.number_plate NOT IN (' +
      '  SELECT transport_id ' +
      '  FROM trip trip ' +
      '  JOIN trip_request tr ON trip.trip_request_id = tr.id ' +
      '  WHERE tr.status = ''� ��������'' ' +
      ') ' +
      'AND vt.id = :requiredVehicleType ' +
      'or t.number_plate = :NumberPlate ' +
      'ORDER BY t.number_plate';

    FQuery.ParamByName('requiredVehicleType').AsInteger := requiredVehicleType;
    FQuery.ParamByName('NumberPlate').AsString := NumberPlate;
    FQuery.Open;

  except
    on E: Exception do
      ShowMessage('������. �� ������� ��������� ��������� � �������� ������� � �����: ' + E.Message);
  end;
end;

}

procedure TTransportManager.Add(numberPlate: String;
  StartExploitation: TDateTime; VehicleTypeID, TransportBrandID: Integer);
begin
try
  FQuery.SQL.Text :=
    'INSERT INTO transport (number_plate, transport_brand_id, vehicle_type_id, start_exploitation) '
    + 'VALUES (:numberPlate, :transportBrandID, :vehicleTypeID, :startExploitation)';
  FQuery.ParamByName('numberPlate').AsString := numberPlate;
  FQuery.ParamByName('transportBrandID').AsInteger := TransportBrandID;
  FQuery.ParamByName('vehicleTypeID').AsInteger := VehicleTypeID;
  FQuery.ParamByName('startExploitation').AsDateTime := StartExploitation;
  FQuery.ExecSQL;

  LoadAll;

  except
  on E: Exception do
    ShowMessage('������. �� ������� ������� ����� ���������: ' + E.Message);
end;
end;

procedure TTransportManager.Delete(numberPlate: String; ShowDeleteMessage: Boolean);
begin
try
  if not ShowDeleteMessage or (MessageDlg('����������� ��������', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text :=
      'DELETE FROM transport WHERE number_plate = :numberPlate';
    FQuery.ParamByName('numberPlate').AsString := numberPlate;

    FQuery.ExecSQL;
  end;

  LoadAll;
except
  on E: Exception do
    ShowMessage('������. �� ������� ������� ���������: ' + E.Message);
end;
end;

procedure TTransportManager.LoadAll;
begin
try
  FQuery.SQL.Text :=
   'SELECT t.number_plate, vt.type_name, lc.category_name AS license_category, ' +
      'tb.brand_name, t.start_exploitation, t.end_exploitation ' +
      'FROM transport t ' +
      'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id ' +
      'JOIN license_category lc ON vt.required_license_id = lc.id ' +
      'JOIN transport_brand tb ON t.transport_brand_id = tb.id ' +
      'ORDER BY vt.type_name';
  FQuery.Open;
except
  on E: Exception do
    ShowMessage('������. �� ������� ��������� ������ ����������: ' + E.Message);
end;
end;



procedure TTransportManager.Update(numberPlate: String; EndExploitation: TDate);
begin
try
  FQuery.SQL.Text :=
    'UPDATE transport ' +
    'SET end_exploitation = :endExploitation ' +
    'WHERE number_plate = :numberPlate';

if EndExploitation = 0 then
begin
  FQuery.ParamByName('endExploitation').DataType := ftDate;
  FQuery.ParamByName('endExploitation').Clear;
end
else
  FQuery.ParamByName('endExploitation').AsDate := EndExploitation;


  FQuery.ParamByName('numberPlate').AsString := numberPlate;

  FQuery.ExecSQL;

  LoadAll;
  except
  on E: Exception do
    ShowMessage('������. �� ������� �������� ��������� ���������: ' + E.Message);
end;
end;


procedure TTransportManager.SearchByParam(
  NumberPlate, VehicleTypeName, LicenseCategory, TransportBrand: string;
  StartExploitationDateFrom, StartExploitationDateTo,
  EndExploitationDateFrom, EndExploitationDateTo: TDate
);
var
   FilterString : string;
   DateFilter: string;
begin
  try
    FQuery.Filtered := False;

    FQuery.Filter := '';
    FQuery.FilterOptions := [foCaseInsensitive];

     FilterString := Format('number_plate LIKE ''%%%s%%''', [NumberPlate]);

    if VehicleTypeName <> '' then
      FilterString := FilterString + ' AND ' + Format('type_name = ''%s''', [VehicleTypeName]);
    if LicenseCategory <> '' then
      FilterString := FilterString + ' AND ' + Format('license_category = ''%s''', [LicenseCategory]);
    if TransportBrand <> '' then
      FilterString := FilterString + ' AND ' + Format('brand_name = ''%s''', [TransportBrand]);

      DateFilter := AddDateFilter('start_exploitation', StartExploitationDateFrom, StartExploitationDateTo);
    if DateFilter <> '' then
      FilterString := FilterString + ' AND ' + DateFilter;


if (EndExploitationDateFrom <> 0) or (EndExploitationDateTo <> 0) then
    begin
     // DateFilter := '"end_exploitation" IS NOT NULL';
      DateFilter := DateFilter + AddDateFilter('end_exploitation', EndExploitationDateFrom, EndExploitationDateTo);
    end;

    if DateFilter <> '' then
      FilterString := FilterString + ' AND ' + DateFilter;

    FQuery.Filter := FilterString;
    FQuery.Filtered := True;
  except
    on E: Exception do
      ShowMessage('������ ��� ���������� ������: ' + E.Message);
  end;
end;

end.

