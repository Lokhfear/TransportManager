unit TransportManage;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils;

type
  TTransportManager = class(TManagerCRUD)
  public
    constructor Create(AQuery: TFDQuery);
    procedure LoadAll;
    procedure Delete(numberPlate: String; ShowMessage: Boolean);
    procedure Update(numberPlate: String; EndExploitation: TDate);
    procedure Add(numberPlate: String;
      StartExploitation: TDateTime; VehicleTypeID: Integer);

    procedure LoadAvailableTransport();
     procedure LoadAvailableTransportByType(requiredVehicleType: Integer);
   // procedure FilterByVehicleType(requiredVehicleType: Integer);
  end;

implementation

constructor TTransportManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TTransportManager.LoadAvailableTransport();
begin
  FQuery.SQL.Text :=
    'SELECT t.number_plate, t.start_exploitation, t.end_exploitation, vt.type_name ' +
    'FROM transport t ' +
    'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id ' +
    'WHERE (t.end_exploitation IS NULL OR t.end_exploitation >= SYSDATE) ' +
    'AND t.number_plate NOT IN (' +
    'SELECT transport_id ' +
    'FROM trip trip ' +
    'JOIN trip_request tr ON trip.trip_request_id = tr.id ' +
    'WHERE tr.status = ''� ��������'') ' +
    'ORDER BY t.number_plate';

  FQuery.Open;
end;



 procedure TTransportManager.LoadAvailableTransportByType(requiredVehicleType: Integer);
begin
  FQuery.SQL.Text :=
    'SELECT t.number_plate, t.start_exploitation, t.end_exploitation, vt.type_name ' +
    'FROM transport t ' +
    'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id ' +
    'WHERE (t.end_exploitation IS NULL OR t.end_exploitation >= SYSDATE) ' +
    'AND t.number_plate NOT IN (' +
    'SELECT transport_id ' +
    'FROM trip trip ' +
    'JOIN trip_request tr ON trip.trip_request_id = tr.id ' +
    'WHERE tr.status = ''� ��������'') ' +
    'AND vt.id = :requiredVehicleType ' +
    'ORDER BY t.number_plate';

  FQuery.ParamByName('requiredVehicleType').AsInteger := requiredVehicleType;
  FQuery.Open;
end;






// ������� ���������� (� ������ ������ ����� ����� ��� ������������)
procedure TTransportManager.Add(numberPlate: String;
  StartExploitation: TDateTime; VehicleTypeID: Integer);
begin
  FQuery.SQL.Text :=
    'INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation) '
    + 'VALUES (:numberPlate, :vehicleTypeID, :startExploitation)';
  FQuery.ParamByName('numberPlate').AsString := numberPlate;
  FQuery.ParamByName('vehicleTypeID').AsInteger := VehicleTypeID;
  FQuery.ParamByName('startExploitation').AsDateTime := StartExploitation;
  FQuery.ExecSQL;

  LoadAll;
end;

procedure TTransportManager.Delete(numberPlate: String; ShowMessage: Boolean);
begin
  if not ShowMessage or (MessageDlg('����������� ��������', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text :=
      'DELETE FROM transport WHERE number_plate = :numberPlate';
    FQuery.ParamByName('numberPlate').AsString := numberPlate;

    FQuery.ExecSQL;
  end;

  LoadAll;
end;

procedure TTransportManager.LoadAll;
begin
  FQuery.SQL.Text :=
    'SELECT t.number_plate, vt.type_name, ' +
    't.start_exploitation, t.end_exploitation '
    + 'FROM transport t ' + 'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id';
  FQuery.Open;
end;



procedure TTransportManager.Update(numberPlate: String; EndExploitation: TDate);
begin
  FQuery.SQL.Text :=
    'UPDATE transport ' +
    'SET end_exploitation = :endExploitation ' +
    'WHERE number_plate = :numberPlate';

  FQuery.ParamByName('endExploitation').AsDate := EndExploitation;
  FQuery.ParamByName('numberPlate').AsString := numberPlate;

  FQuery.ExecSQL;

  LoadAll;
end;
end.

