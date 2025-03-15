unit DriverManager;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils,
  System.Generics.Collections;

type
  TDriverManager = class(TManagerCRUD)
  public
    constructor Create(AQuery: TFDQuery);
    procedure LoadAll;
    procedure Delete(AID: integer; ShowDeleteMessage: Boolean);
    procedure Update(AID: integer; NewFullName: String);
    function Add(FullName: String; EmploymentStart: TDateTime): Integer;
    // procedure Search(SearchID: Integer; SearchFullName : string);
   //procedure LoadAvailableDrivers();
    procedure LoadDriversWithWorkedHours(startDate: TDate);
    procedure LoadAvailableDriversByType( requeredVehicleTypeid: Integer; startDateTime, endDateTime: TDateTime);
   // procedure LoadAvailableDriversByType(requiredVehicleType: Integer; driverId: Integer) overload;
    procedure UpdateDriverVehicleTypes(DriverID: integer;
      OldVehicleTypes, NewVehicleTypes: TList<integer>);
    procedure AddDriverVehicleType(DriverID, VehicleTypeId: integer);
    procedure AddDriverLicenses(
  DriverID: Integer;
  LicenseCategoryIDs: TArray<Integer>;
  IssueDates: TArray<TDate>;
  ExpirationDates: TArray<TDate>
);

    procedure DeleteDriverVehicleType(DriverID, VehicleTypeId: integer);

  end;

implementation


procedure TDriverManager.LoadDriversWithWorkedHours(startDate: TDate);
begin
  try
    FQuery.SQL.Text :=
      'SELECT d.id, d.full_name, d.employment_start, ' +
      'availabilitychecker.getdriverworkedhours(d.id, :workDate) AS worked_hours ' +
      'FROM driver d ' +
      'JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id ' +
      'order by worked_hours ';

    FQuery.ParamByName('workDate').AsDateTime := startDate;

    FQuery.Open;
  except
    on E: Exception do
      ShowMessage('������ ��� �������� ������ ��������� � ������������� ������: ' + E.Message);
  end;
end;


procedure TDriverManager.LoadAvailableDriversByType(requeredVehicleTypeid: Integer; startDateTime, endDateTime: TDateTime);
var
  WorkDate: TDateTime;
begin
  try

    WorkDate := Trunc(startDateTime);

    FQuery.SQL.Text :=
      'SELECT d.id, d.full_name, d.employment_start, ' +
      'availabilitychecker.getdriverworkedhours(d.id, :workdate) AS worked_hours ' +
      'FROM driver d ' +
      'JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id ' +
      'AND dvt.vehicle_type_id = :requerredVehicleTypeid ' +
      'WHERE availabilitychecker.isdriverfree(d.id, :startdatetime, :enddatetime) ' +
      'ORDER BY worked_hours ';


    FQuery.ParamByName('workdate').AsDateTime := WorkDate;
    FQuery.ParamByName('requerredVehicleTypeid').AsInteger := requeredVehicleTypeid;
    FQuery.ParamByName('startdatetime').AsDateTime := startDateTime;
    FQuery.ParamByName('enddatetime').AsDateTime := endDateTime;


    FQuery.Open;

  except
    on E: Exception do
      ShowMessage('������ ��� �������� ��������� ���������: ' + E.Message);
  end;
end;

{


procedure TDriverManager.LoadAvailableDriversByType(requiredVehicleType: Integer; driverId: Integer);
begin
  try
    FQuery.SQL.Text :=
      'SELECT d.id, d.full_name, d.employment_start ' +
      'FROM driver d ' +
      'JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id ' +
      'WHERE dvt.vehicle_type_id = :requiredVehicleType ' +
      'AND d.id NOT IN (' +
      '  SELECT driver_id ' +
      '  FROM trip t ' +
      '  JOIN trip_request tr ON t.trip_request_id = tr.id ' +
      '  WHERE tr.status = ''� ��������'' ' +
      ') ' +
      'or (d.id = :driverId) ' +
      'GROUP BY d.id, d.full_name, d.employment_start ' +
      'ORDER BY d.full_name';

    FQuery.ParamByName('requiredVehicleType').AsInteger := requiredVehicleType;
    FQuery.ParamByName('driverId').AsInteger := driverId;
    FQuery.Open;

  except
    on E: Exception do
      ShowMessage('������ ��� �������� ��������� ��������� � id ���� ���������� (' +
        requiredVehicleType.ToString + '): ' + E.Message);
  end;
end;
 }

function TDriverManager.Add(FullName: String; EmploymentStart: TDateTime): Integer;
begin
  try
    FQuery.SQL.Text :=
      'INSERT INTO driver (full_name, employment_start) VALUES (:fullName, :employmentStart) '
      + ' RETURNING id INTO :NewID';
    FQuery.ParamByName('fullName').AsString := FullName;
    FQuery.ParamByName('employmentStart').AsDateTime := EmploymentStart;
    FQuery.ParamByName('NewID').DataType := ftInteger;
    FQuery.ParamByName('NewID').ParamType := ptOutput;
    FQuery.ExecSQL;

    Result := FQuery.ParamByName('NewID').AsInteger;

    LoadAll;
  except
    on E: Exception do
      ShowMessage('������ ��� ���������� ��������: ' + E.Message);
  end;
end;

procedure TDriverManager.AddDriverVehicleType(DriverID, VehicleTypeId: integer);
begin
  try
    FQuery.SQL.Text :=
      'INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (:driverID, :vehicleTypeId)';
    FQuery.ParamByName('driverID').AsInteger := DriverID;
    FQuery.ParamByName('vehicleTypeId').AsInteger := VehicleTypeId;
    FQuery.ExecSQL;

  except
    on E: Exception do
      ShowMessage('������ ��� ���������� ���� ���������� (' +
        VehicleTypeId.ToString + ') ��������: ' + E.Message);
  end;
  // LoadAll;
end;

constructor TDriverManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TDriverManager.Delete(AID: Integer; ShowDeleteMessage: Boolean);
begin
  try
    if not ShowDeleteMessage or (MessageDlg('����������� ��������', mtConfirmation,
      [mbOK, mbCancel], 0) = 1) then
    begin
      FQuery.SQL.Text := 'DELETE FROM driver WHERE id = :id';
      FQuery.ParamByName('id').AsInteger := AID;
      FQuery.ExecSQL;
    end;

    LoadAll;
  except
    on E: Exception do
      ShowMessage('������ ��� �������� ��������: ' + E.Message);
  end;
end;

procedure TDriverManager.DeleteDriverVehicleType(DriverID,
  VehicleTypeId: integer);
begin
  try
    FQuery.SQL.Text := 'DELETE FROM driver_vehicle_type ' +
      'WHERE driver_id = :driverID AND vehicle_type_id = :vehicleTypeId';
    FQuery.ParamByName('driverID').AsInteger := DriverID;
    FQuery.ParamByName('vehicleTypeId').AsInteger := VehicleTypeId;
    FQuery.ExecSQL;
  except
    on E: Exception do
      ShowMessage('������ ��� �������� ���� ���������� (' + VehicleTypeId.ToString +
        ') � ��������: ' + E.Message);
  end;
  // LoadAll;
end;

procedure TDriverManager.LoadAll;
begin
  try
    FQuery.SQL.Text := 'SELECT ' + 'd.id, ' + 'd.full_name, ' +
      'd.employment_start, ' +
      'LISTAGG(vt.type_name, '', '') WITHIN GROUP (ORDER BY vt.type_name) AS vehicle_types '
      + 'FROM driver d ' +
      'LEFT JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id ' +
      'LEFT JOIN vehicle_type vt ON dvt.vehicle_type_id = vt.id ' +
      'GROUP BY d.id, d.full_name, d.employment_start ' +
      'ORDER BY d.full_name';

    FQuery.Open;
  except
    on E: Exception do
      ShowMessage('������ ��� �������� ������ ���������: ' + E.Message);
  end;
end;

procedure TDriverManager.Update(AID: integer; NewFullName: String);
begin
  try
    FQuery.SQL.Text :=
      'UPDATE driver SET full_name = :NewFullName WHERE id = :AID';
    FQuery.ParamByName('NewFullName').AsString := NewFullName;
    FQuery.ParamByName('AID').AsInteger := AID;
    FQuery.ExecSQL;

    LoadAll;
  except
    on E: Exception do
      ShowMessage('������ ��� ������� ���������� ��� ��������: ' + E.Message);
  end;
end;



procedure TDriverManager.AddDriverLicenses(
  DriverID: Integer;
  LicenseCategoryIDs: TArray<Integer>;
  IssueDates: TArray<TDate>;
  ExpirationDates: TArray<TDate>
);
var
  i: Integer;
begin
  if (DriverID = -1) or
     (Length(LicenseCategoryIDs) <> Length(IssueDates)) or
     (Length(LicenseCategoryIDs) <> Length(ExpirationDates)) then
  begin
    raise Exception.Create('�������������� �������� �������� ������� ������ ��� ������ DriverID.');
  end;

  ShowMessage(IntToStr(DriverID) + ' '+ IntToStr(LicenseCategoryIDs[1]));

  FQuery.SQL.Text :=
    'INSERT INTO driver_license (driver_id, license_category_id, issue_date, expiration_date) ' +
    'VALUES (:DriverID, :CategoryID, :IssueDate, :ExpirationDate)';

  try

    for i := 0 to High(LicenseCategoryIDs) do
    begin
      FQuery.ParamByName('DriverID').AsInteger := DriverID;
      FQuery.ParamByName('CategoryID').AsInteger := LicenseCategoryIDs[i];
      FQuery.ParamByName('IssueDate').AsDate := IssueDates[i];
      FQuery.ParamByName('ExpirationDate').AsDate := ExpirationDates[i];


      FQuery.ExecSQL;
    end;


  except
    on E: Exception do
    begin
      ShowMessage('������ ��� ���������� ������������ ����: ' + E.Message);
    end;
  end;
end;




procedure TDriverManager.UpdateDriverVehicleTypes(DriverID: integer;
  OldVehicleTypes, NewVehicleTypes: TList<integer>);
var
  i: integer;
  VehicleTypeId: integer;
begin

  try

    LoadAll
  except
    on E: Exception do
      ShowMessage('������ ��� ������� ���������� ����� ���������� � ��������: '
        + E.Message);
  end;
end;

end.
