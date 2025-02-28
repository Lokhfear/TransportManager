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
    procedure Delete(AID: integer; ShowMessage: Boolean);
    procedure Update(AID: integer; NewFullName: String);
    procedure Add(FullName: String; EmploymentStart: TDateTime);
    // procedure Search(SearchID: Integer; SearchFullName : string);

    procedure UpdateDriverVehicleTypes(DriverID: integer;
      OldVehicleTypes, NewVehicleTypes: TList<integer>);
    procedure AddDriverVehicleType(DriverID, VehicleTypeId: integer);
    procedure DeleteDriverVehicleType(DriverID, VehicleTypeId: integer);
  end;

implementation

procedure TDriverManager.Add(FullName: String; EmploymentStart: TDateTime);
begin
  FQuery.SQL.Text :=
    'INSERT INTO driver (full_name, employment_start) VALUES (:fullName, :employmentStart) ' +
    ' RETURNING id INTO :NewID';
  FQuery.ParamByName('fullName').AsString := FullName;
  FQuery.ParamByName('employmentStart').AsDateTime := EmploymentStart;
  FQuery.ExecSQL;

  LoadAll;
end;

procedure TDriverManager.AddDriverVehicleType(DriverID, VehicleTypeId: integer);
begin
  FQuery.SQL.Text :=
    'INSERT INTO driver_vehicle_type (driver_id, vehicle_type_id) VALUES (:driverID, :vehicleTypeId)';
  FQuery.ParamByName('driverID').AsInteger := DriverID;
  FQuery.ParamByName('vehicleTypeId').AsInteger := VehicleTypeId;
  FQuery.ExecSQL;

  // LoadAll;
end;

constructor TDriverManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TDriverManager.Delete(AID: integer; ShowMessage: Boolean);
begin
  if not ShowMessage or (MessageDlg('����������� ��������', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text := 'DELETE FROM driver WHERE id = :id';
    FQuery.ParamByName('id').AsInteger := AID;
    FQuery.ExecSQL;
  end;

  LoadAll;
end;

procedure TDriverManager.DeleteDriverVehicleType(DriverID,
  VehicleTypeId: integer);
begin
  FQuery.SQL.Text := 'DELETE FROM driver_vehicle_type ' +
    'WHERE driver_id = :driverID AND vehicle_type_id = :vehicleTypeId';
  FQuery.ParamByName('driverID').AsInteger := DriverID;
  FQuery.ParamByName('vehicleTypeId').AsInteger := VehicleTypeId;
  FQuery.ExecSQL;

  // LoadAll;
end;

procedure TDriverManager.LoadAll;
begin
  FQuery.SQL.Text := 'SELECT ' + 'd.id, ' + 'd.full_name AS "���", ' +
    'd.employment_start AS "���� ������ ������", ' +
    'COALESCE(LISTAGG(vt.type_name, '', '') WITHIN GROUP (ORDER BY vt.type_name), ''��� �����'') AS "���� ����������" '
    + 'FROM driver d ' +
    'LEFT JOIN driver_vehicle_type dvt ON d.id = dvt.driver_id ' +
    'LEFT JOIN vehicle_type vt ON dvt.vehicle_type_id = vt.id ' +
    'GROUP BY d.id, d.full_name, d.employment_start ' + 'ORDER BY d.full_name';

  FQuery.Open;
end;

procedure TDriverManager.Update(AID: integer; NewFullName: String);
begin
  FQuery.SQL.Text :=
    'UPDATE driver SET full_name = :NewFullName WHERE id = :AID';
  FQuery.ParamByName('NewFullName').AsString := NewFullName;
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;

  LoadAll;
end;

procedure TDriverManager.UpdateDriverVehicleTypes(DriverID: integer;
  OldVehicleTypes, NewVehicleTypes: TList<integer>);
var
  i: integer;
  VehicleTypeId: integer;
begin
  // ������� ���� ����� �� ��������
  for i := 0 to OldVehicleTypes.Count - 1 do
  begin
    VehicleTypeId := OldVehicleTypes[i];
    if NewVehicleTypes.IndexOf(VehicleTypeId) = -1 then
      DeleteDriverVehicleType(DriverID, VehicleTypeId);

  end;

  // ������� ���� ����� �� ����������
  for i := 0 to NewVehicleTypes.Count - 1 do
  begin

    VehicleTypeId := NewVehicleTypes[i];
    if OldVehicleTypes.IndexOf(VehicleTypeId) = -1 then
      AddDriverVehicleType(DriverID, VehicleTypeId);

  end;

  LoadAll
end;

end.
