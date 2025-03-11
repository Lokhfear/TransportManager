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
      StartExploitation: TDateTime; VehicleTypeID: Integer);

   //procedure LoadAvailableTransport();
    procedure LoadAvailableTransportByType(requiredVehicleType: Integer; startDateTime, endDateTime: TDateTime);
   // procedure LoadAvailableTransportByType(requiredVehicleType: Integer; NumberPlate: string) overload;
   // procedure FilterByVehicleType(requiredVehicleType: Integer);
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
      'WHERE availabilitychecker.istransportfree(t.number_plate, :startDateTime, :endDateTime) = 1 ' + // Проверка на доступность
      'AND (t.end_exploitation IS NULL OR t.end_exploitation > SYSDATE) ' +
      'AND vt.id = :requiredVehicleType ' + // Фильтрация по типу транспорта
      'ORDER BY t.number_plate';

    FQuery.ParamByName('startDateTime').AsDateTime := startDateTime;
    FQuery.ParamByName('endDateTime').AsDateTime := endDateTime;
    FQuery.ParamByName('requiredVehicleType').AsInteger := requiredVehicleType;
    FQuery.Open;

  except
    on E: Exception do
      ShowMessage('Ошибка. Не удалось загрузить свободный транспорт по заданному типу: ' + E.Message);
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
      '  WHERE tr.status = ''В процессе'' ' +
      ') ' +
      'AND vt.id = :requiredVehicleType ' +
      'or t.number_plate = :NumberPlate ' +
      'ORDER BY t.number_plate';

    FQuery.ParamByName('requiredVehicleType').AsInteger := requiredVehicleType;
    FQuery.ParamByName('NumberPlate').AsString := NumberPlate;
    FQuery.Open;

  except
    on E: Exception do
      ShowMessage('Ошибка. Не удалось загрузить транспорт с заданным номером и типом: ' + E.Message);
  end;
end;

}

procedure TTransportManager.Add(numberPlate: String;
  StartExploitation: TDateTime; VehicleTypeID: Integer);
begin
try
  FQuery.SQL.Text :=
    'INSERT INTO transport (number_plate, vehicle_type_id, start_exploitation) '
    + 'VALUES (:numberPlate, :vehicleTypeID, :startExploitation)';
  FQuery.ParamByName('numberPlate').AsString := numberPlate;
  FQuery.ParamByName('vehicleTypeID').AsInteger := VehicleTypeID;
  FQuery.ParamByName('startExploitation').AsDateTime := StartExploitation;
  FQuery.ExecSQL;

  LoadAll;

  except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось создать новый транспорт: ' + E.Message);
end;
end;

procedure TTransportManager.Delete(numberPlate: String; ShowDeleteMessage: Boolean);
begin
try
  if not ShowDeleteMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
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
    ShowMessage('Ошибка. Не удалось удалить транспорт: ' + E.Message);
end;
end;

procedure TTransportManager.LoadAll;
begin
try
  FQuery.SQL.Text :=
    'SELECT t.number_plate, vt.type_name, ' +
    't.start_exploitation, t.end_exploitation '
    + 'FROM transport t ' + 'JOIN vehicle_type vt ON t.vehicle_type_id = vt.id';
  FQuery.Open;
except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось загрузить данные транспорта: ' + E.Message);
end;
end;



procedure TTransportManager.Update(numberPlate: String; EndExploitation: TDate);
begin
try
  FQuery.SQL.Text :=
    'UPDATE transport ' +
    'SET end_exploitation = :endExploitation ' +
    'WHERE number_plate = :numberPlate';

  FQuery.ParamByName('endExploitation').AsDate := EndExploitation;
  FQuery.ParamByName('numberPlate').AsString := numberPlate;

  FQuery.ExecSQL;

  LoadAll;
  except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось обновить выбранный транспорт: ' + E.Message);
end;
end;
end.

