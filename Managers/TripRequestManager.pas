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
    procedure UpdateStatus(AID: integer; NewStatusID: Integer);
    procedure Add(RouteName: String; Distance: Double; RequiredVehicleTypeID: Integer; StartDateTime, EndDateTime: TDateTime);
    //procedure UpdateTimes(AID: Integer; StartTime, EndTime: TDateTime);
  end;

implementation

constructor TTripRequestManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;


procedure TTripRequestManager.Add(RouteName: String; Distance: Double;
  RequiredVehicleTypeID: Integer; StartDateTime, EndDateTime: TDateTime);
begin
try
  FQuery.SQL.Text := '  INSERT INTO trip_request (route_name, distance, creation_date, ' +
      '    required_vehicle_type_id, start_datetime, end_datetime) ' +
      'VALUES (:route_name, :distance, SYSDATE, :required_vehicle_type_id, ' +
      ':start_datetime, :end_datetime); ';

  FQuery.ParamByName('route_name').AsString := RouteName;
  FQuery.ParamByName('Distance').AsFloat := Distance;
  FQuery.ParamByName('RequiredVehicleTypeID').AsInteger := RequiredVehicleTypeID;
  FQuery.ParamByName('start_datetime').AsDateTime := StartDateTime;
  FQuery.ParamByName('end_datetime').AsDateTime := EndDateTime;

  FQuery.ExecSQL;

  LoadAll;
except
  on E: Exception do
    ShowMessage('������. �� ������� ������� ����� ������: ' + E.Message);
end;
end;

procedure TTripRequestManager.Delete(AID: integer; ShowDeleteMessage: Boolean);
begin
try
  if not ShowDeleteMessage or (MessageDlg('����������� ��������', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text := 'DELETE FROM trip_request WHERE id = :id';
    FQuery.ParamByName('id').AsInteger := AID;
    FQuery.ExecSQL;
  end;

  LoadAll;
except
  on E: Exception do
    ShowMessage('������. �� ������� ������� ������: ' + E.Message);
end;
end;

procedure TTripRequestManager.UpdateStatus(AID: integer; NewStatusID: Integer);
begin
try
  FQuery.SQL.Text := 'UPDATE trip_request SET status_id = :NewStatusID WHERE id = :AID';
  FQuery.ParamByName('NewStatusID').AsInteger := NewStatusID;
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;

  LoadAll;

  except
  on E: Exception do
    ShowMessage('������. �� ������� �������� ������ �������: ' + E.Message);
end;

end;

procedure TTripRequestManager.LoadAll;
begin
try
  FQuery.SQL.Text := 'SELECT ' +
    'tr.id, ' +
    'route_name, ' +
    'distance, '  +
    'creation_date, ' +
    'tr.status_id, ' +
    'status_name, '  +
    'tr.required_vehicle_type_id, ' +
    'vh.type_name, '  +
    'TO_CHAR(start_datetime, ''DD.MM.YYYY HH24:MI'') AS start_datetime, ' +
    'TO_CHAR(end_datetime, ''DD.MM.YYYY HH24:MI'') AS end_datetime ' +
'FROM trip_request tr ' +
'LEFT JOIN vehicle_type vh ON tr.required_vehicle_type_id = vh.id ' +
'join status s on tr.status_id = s.id and s.id = 1 ' +
'ORDER BY creation_date, start_datetime';

  FQuery.Open;
  except
  on E: Exception do
    ShowMessage('������. �� ������� ��������� ������ ��������: ' + E.Message);
end;
end;


 {
procedure TTripRequestManager.UpdateTimes(AID: Integer; StartTime, EndTime: TDateTime);
begin

   if (EndTime < StartTime) then
   begin
     ShowMessage('������. ����� ������� ������ ������� �������');
     exit;
   end;


  try
    FQuery.SQL.Text := 'UPDATE trip SET start_datetime = :StartTime, end_datetime = :EndTime WHERE id = :AID';
      FQuery.ParamByName('StartTime').AsDateTime := StartTime;
      FQuery.ParamByName('EndTime').AsDateTime := EndTime;

    FQuery.ParamByName('AID').AsInteger := AID;

    FQuery.ExecSQL;

  except
    on E: Exception do
      ShowMessage('������. �� ������� �������� �����: ' + E.Message);
  end;
end;
}




procedure TTripRequestManager.FilterByStatusPending;
begin
  FQuery.Filtered := False;

 // FQuery.Filter := 'status = ''�������''';
  FQuery.Filtered := True;
end;

end.

