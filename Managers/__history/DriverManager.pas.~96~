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
    procedure Update(AID: integer; NewFullName: String; EmploymentEnd: TDate);
    function Add(FullName: String; EmploymentStart: TDateTime): Integer;
    procedure SearchByParam(SearchFullName: string);
    procedure LoadDriversWithWorkedHours(startDate: TDate);
    procedure LoadAvailableDriversByType( requeredVehicleTypeid: Integer; startDateTime, endDateTime: TDateTime);
    procedure AddDriverLicenses(
      DriverID: Integer;
      LicenseCategoryIDs: TList<Integer>;
      IssueDates: TList<TDate>;
      ExpirationDates: TList<TDate>
    );

  procedure DeleteDriverLicenses(
    DriverID: Integer;
    LicenseCategoryIDs: TList<Integer>
  );
   // procedure DeleteDriverVehicleType(DriverID, VehicleTypeId: integer);

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
      ShowMessage('Ошибка при загрузке данных водителей с отработанными часами: ' + E.Message);
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
      ShowMessage('Ошибка при загрузке доступных водителей: ' + E.Message);
  end;
end;


function TDriverManager.Add(FullName: String; EmploymentStart: TDateTime): Integer;
begin
  try
    FQuery.SQL.Text :=
      'INSERT INTO driver (full_name, employment_start, employment_end) VALUES (:fullName, :employmentStart) '
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
      ShowMessage('Ошибка при добавлении водителя: ' + E.Message);
  end;
end;


constructor TDriverManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TDriverManager.Delete(AID: Integer; ShowDeleteMessage: Boolean);
begin
  try
    if not ShowDeleteMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
      [mbOK, mbCancel], 0) = 1) then
    begin
      FQuery.SQL.Text := 'DELETE FROM driver WHERE id = :id';
      FQuery.ParamByName('id').AsInteger := AID;
      FQuery.ExecSQL;
    end;

    LoadAll;
  except
    on E: Exception do
      ShowMessage('Ошибка при удалении водителя: ' + E.Message);
  end;
end;

(*

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
      ShowMessage('Ошибка при добавлении типа транспорта (' +
        VehicleTypeId.ToString + ') водителю: ' + E.Message);
  end;
  // LoadAll;
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
      ShowMessage('Ошибка при удалении типа транспорта (' + VehicleTypeId.ToString +
        ') у водителя: ' + E.Message);
  end;
  // LoadAll;
end;
 *)

procedure TDriverManager.LoadAll;
begin
  try
     FQuery.SQL.Text :=

    'SELECT ' +
    'd.id, ' +
    'd.full_name, ' +
    'd.employment_start, ' +
    'd.employment_end, ' +
    'LISTAGG(lc.category_name, '', '') WITHIN GROUP (ORDER BY lc.category_name) AS license_categories ' +
    'FROM driver d ' +
    'LEFT JOIN driver_license dl ON d.id = dl.driver_id ' +
    'LEFT JOIN license_category lc ON dl.license_category_id = lc.id ' +
    'GROUP BY d.id, d.full_name, d.employment_start, d.employment_end ' +
    'ORDER BY d.full_name';

    FQuery.Open;

  except
    on E: Exception do
      ShowMessage('Ошибка при загрузке данных водителей: ' + E.Message);
  end;
end;


//нельзя поменять дату на null (а надо ли?)
procedure TDriverManager.Update(AID: integer; NewFullName: String; EmploymentEnd: TDate);
begin
  try
    FQuery.SQL.Text :=
     'UPDATE driver SET full_name = :NewFullName, employment_end = :EmploymentEnd WHERE id = :AID';
    FQuery.ParamByName('NewFullName').AsString := NewFullName;
    FQuery.ParamByName('EmploymentEnd').AsDate := EmploymentEnd;
    FQuery.ParamByName('AID').AsInteger := AID;
    FQuery.ExecSQL;

    LoadAll;
  except
    on E: Exception do
      ShowMessage('Ошибка при попытке обновления водителя: ' + E.Message);
  end;
end;



procedure TDriverManager.AddDriverLicenses(
      DriverID: Integer;
      LicenseCategoryIDs: TList<Integer>;
      IssueDates: TList<TDate>;
      ExpirationDates: TList<TDate>
    );
var
  i: Integer;
begin
  if (DriverID = -1) or
     (LicenseCategoryIDs.Count <> IssueDates.count) or
     (LicenseCategoryIDs.Count <> ExpirationDates.Count) then
  begin
    raise Exception.Create('Несоответствие размеров массивов входных данных или пустой DriverID.');
  end;

  FQuery.SQL.Text :=
    'INSERT INTO driver_license (driver_id, license_category_id, issue_date, expiration_date) ' +
    'VALUES (:DriverID, :CategoryID, :IssueDate, :ExpirationDate)';

  try

    for i := 0 to LicenseCategoryIDs.Count - 1 do
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
      ShowMessage('Ошибка при добавлении водительских прав: ' + E.Message);
    end;
  end;
end;

procedure TDriverManager.DeleteDriverLicenses(
  DriverID: Integer;
  LicenseCategoryIDs: TList<Integer>
);
var
  i: Integer;
begin
  if (DriverID = -1) or (LicenseCategoryIDs.Count = 0) then
  begin
    exit;
  end;

  FQuery.SQL.Text :=
    'DELETE FROM driver_license WHERE driver_id = :DriverID AND license_category_id = :CategoryID';

  try
    for i := 0 to LicenseCategoryIDs.Count - 1  do
    begin
      FQuery.ParamByName('DriverID').AsInteger := DriverID;
      FQuery.ParamByName('CategoryID').AsInteger := LicenseCategoryIDs[i];

      FQuery.ExecSQL;
    end;

    ShowMessage('Лицензии удалены успешно.');
  except
    on E: Exception do
    begin
      ShowMessage('Ошибка при удалении водительских прав: ' + E.Message);
    end;
  end;
end;



procedure TDriverManager.SearchByParam(SearchFullName: string);
begin
  FQuery.Filtered := False;
  FQuery.FilterOptions := [foCaseInsensitive];

  if SearchFullName <> '' then
    begin
       FQuery.Filter := Format('full_name LIKE ''%%%s%%''', [SearchFullName]);
       FQuery.Filtered := True;
    end;
end;



end.
