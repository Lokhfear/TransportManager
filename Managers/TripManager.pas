unit TripManager;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils;

type
  TTripManager = class(TManagerCRUD)
  public
    constructor Create(Query: TFDQuery);
    procedure Add(TripRequestID: Integer; TransportID: String; DriverID: Integer);
    procedure UpdateTimes(AID: Integer; StartTime, EndTime: TDateTime);
    procedure UpdateTrip(AID: Integer; TripRequestID: Integer; TransportID: String; DriverID: Integer);
    procedure Delete(AID: Integer);
  end;

implementation

constructor TTripManager.Create(Query: TFDQuery);
begin
  inherited Create(Query);
end;

procedure TTripManager.Add(TripRequestID: Integer; TransportID: String; DriverID: Integer);
begin
  FQuery.SQL.Text := 'INSERT INTO trip (trip_request_id, transport_id, driver_id) ' +
                     'VALUES (:TripRequestID, :TransportID, :DriverID)';

  FQuery.ParamByName('TripRequestID').AsInteger := TripRequestID;
  FQuery.ParamByName('TransportID').AsString := TransportID;
  FQuery.ParamByName('DriverID').AsInteger := DriverID;

  FQuery.ExecSQL;
end;

procedure TTripManager.UpdateTimes(AID: Integer; StartTime, EndTime: TDateTime);
begin
  FQuery.SQL.Text := 'UPDATE trip SET start_datetime = :StartTime, end_datetime = :EndTime WHERE id = :AID';

  FQuery.ParamByName('StartTime').AsDateTime := StartTime;
  FQuery.ParamByName('EndTime').AsDateTime := EndTime;
  FQuery.ParamByName('AID').AsInteger := AID;

  FQuery.ExecSQL;
end;

procedure TTripManager.UpdateTrip(AID: Integer; TripRequestID: Integer; TransportID: String; DriverID: Integer);
begin
  FQuery.SQL.Text := 'UPDATE trip SET trip_request_id = :TripRequestID, transport_id = :TransportID, driver_id = :DriverID ' +
                     'WHERE id = :AID';

  FQuery.ParamByName('TripRequestID').AsInteger := TripRequestID;
  FQuery.ParamByName('TransportID').AsString := TransportID;
  FQuery.ParamByName('DriverID').AsInteger := DriverID;
  FQuery.ParamByName('AID').AsInteger := AID;

  FQuery.ExecSQL;
end;

procedure TTripManager.Delete(AID: Integer);
begin
  FQuery.SQL.Text := 'DELETE FROM trip WHERE id = :AID';
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;
end;

end.

