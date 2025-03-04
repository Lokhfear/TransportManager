unit TripManager;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils;

type
  TTripManager = class(TManagerCRUD)
  public
    constructor Create(Query: TFDQuery);
    procedure LoadAll;
    procedure Add(TripRequestID: Integer; TransportID: String; DriverID: Integer);
    procedure UpdateTimes(AID: Integer; StartTime, EndTime: TDateTime);
    procedure UpdateTrip(AID: Integer; TripRequestID: Integer; TransportID: String; DriverID: Integer);
    procedure Delete(AID: Integer; ShowDeleteMessage: Boolean);
  end;

implementation

constructor TTripManager.Create(Query: TFDQuery);
begin
  inherited Create(Query);
end;

procedure TTripManager.Add(TripRequestID: Integer; TransportID: String; DriverID: Integer);
begin
try
  FQuery.SQL.Text := 'INSERT INTO trip (trip_request_id, transport_id, driver_id) ' +
                     'VALUES (:TripRequestID, :TransportID, :DriverID)';

  FQuery.ParamByName('TripRequestID').AsInteger := TripRequestID;
  FQuery.ParamByName('TransportID').AsString := TransportID;
  FQuery.ParamByName('DriverID').AsInteger := DriverID;

  FQuery.ExecSQL;

except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось создать маршрут: ' + E.Message);
end;
end;

procedure TTripManager.UpdateTimes(AID: Integer; StartTime, EndTime: TDateTime);
begin
try
  FQuery.SQL.Text := 'UPDATE trip SET start_datetime = :StartTime, end_datetime = :EndTime WHERE id = :AID';

  FQuery.ParamByName('StartTime').AsDateTime := StartTime;
  FQuery.ParamByName('EndTime').AsDateTime := EndTime;
  FQuery.ParamByName('AID').AsInteger := AID;

  FQuery.ExecSQL;

  except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось обновить время: ' + E.Message);
end;
end;

procedure TTripManager.UpdateTrip(AID: Integer; TripRequestID: Integer; TransportID: String; DriverID: Integer);
begin
try
  FQuery.SQL.Text := 'UPDATE trip SET trip_request_id = :TripRequestID, transport_id = :TransportID, driver_id = :DriverID ' +
                     'WHERE id = :AID';

  FQuery.ParamByName('TripRequestID').AsInteger := TripRequestID;
  FQuery.ParamByName('TransportID').AsString := TransportID;
  FQuery.ParamByName('DriverID').AsInteger := DriverID;
  FQuery.ParamByName('AID').AsInteger := AID;

  FQuery.ExecSQL;
except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось обновить маршрут: ' + E.Message);

end;
end;

procedure TTripManager.Delete(AID: Integer; ShowDeleteMessage: Boolean);
begin
try
if not ShowDeleteMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
  FQuery.SQL.Text := 'DELETE FROM trip WHERE id = :AID';
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;
  end;
  except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось удалить: ' + E.Message);
end;
end;

procedure TTripManager.LoadAll;
begin
try
  FQuery.SQL.Text := 'SELECT ' +
    't.id, ' +
    'd.full_name, ' +
    'trq.route_name, ' +
    'trq.distance, ' +
    't.transport_id, ' +
    'vt.type_name, ' +
    'TO_CHAR(t.start_datetime, ''YYYY-MM-DD HH24:MI''), '+
    'TO_CHAR(t.end_datetime, ''YYYY-MM-DD HH24:MI''), '+
    'trq.required_vehicle_type_id ' +
'FROM trip t ' +
'LEFT JOIN transport tr ON t.transport_id = tr.number_plate ' +
'LEFT JOIN vehicle_type vt ON tr.vehicle_type_id = vt.id ' +
'LEFT JOIN driver d ON t.driver_id = d.id ' +
'JOIN trip_request trq on t.trip_request_id = trq.id ' +
'ORDER BY t.start_datetime DESC ';

FQuery.open;
except
  on E: Exception do
    ShowMessage('Ошибка. Не загрузить данные маршрутов: ' + E.Message);

end;
end;

end.

