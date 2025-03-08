unit TripRequestManager;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils;

type
  TTripRequestManager = class(TManagerCRUD)
  public
    constructor Create(AQuery: TFDQuery);
    procedure LoadAll;
    procedure FilterByStatusPending;
    procedure Delete(AID: integer; ShowDeleteMessage: Boolean);
    procedure UpdateStatus(AID: integer; NewStatus: String);
    procedure Add(RouteName: String; Distance: Double; CreationDate: TDateTime; RequiredVehicleTypeID: Integer);
  end;

implementation

constructor TTripRequestManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TTripRequestManager.Add(RouteName: String; Distance: Double; CreationDate: TDateTime; RequiredVehicleTypeID: Integer);
begin
try
  FQuery.SQL.Text := 'INSERT INTO trip_request (route_name, distance, creation_date, required_vehicle_type_id) ' +
    'VALUES (:RouteName, :Distance, :CreationDate, :RequiredVehicleTypeID)';

  FQuery.ParamByName('RouteName').AsString := RouteName;
  FQuery.ParamByName('Distance').AsFloat := Distance;
  FQuery.ParamByName('CreationDate').AsDateTime := CreationDate;
  FQuery.ParamByName('RequiredVehicleTypeID').AsInteger := RequiredVehicleTypeID;

  FQuery.ExecSQL;

  LoadAll;
except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось создать новый запрос: ' + E.Message);
end;
end;

procedure TTripRequestManager.Delete(AID: integer; ShowDeleteMessage: Boolean);
begin
try
  if not ShowDeleteMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text := 'DELETE FROM trip_request WHERE id = :id';
    FQuery.ParamByName('id').AsInteger := AID;
    FQuery.ExecSQL;
  end;

  LoadAll;
except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось удалить запрос: ' + E.Message);
end;
end;

procedure TTripRequestManager.UpdateStatus(AID: integer; NewStatus: String);
begin
try
  FQuery.SQL.Text := 'UPDATE trip_request SET status = :NewStatus WHERE id = :AID';
  FQuery.ParamByName('NewStatus').AsString := NewStatus;
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;

  LoadAll;

  except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось обновить статус запроса: ' + E.Message);
end;

end;

procedure TTripRequestManager.LoadAll;
begin
try
  FQuery.SQL.Text := 'SELECT tr.id, ' +
    'route_name, distance, creation_date, status, tr.required_vehicle_type_id, vh.type_name ' +
    'FROM trip_request tr ' +
    'LEFT JOIN vehicle_type vh ON tr.required_vehicle_type_id = vh.id ' +
    'WHERE status = ''Ожидает'' ' +
    'ORDER BY creation_date';
  FQuery.Open;
  except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось загрузить данные запросов: ' + E.Message);
end;
end;

procedure TTripRequestManager.FilterByStatusPending;
begin
  FQuery.Filtered := False;

  FQuery.Filter := 'status = ''Ожидает''';
  FQuery.Filtered := True;
end;

end.

