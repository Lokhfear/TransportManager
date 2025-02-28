unit DriverManager;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils;

type
  TDriverManager = class(TManagerCRUD)
  public
    constructor Create(AQuery: TFDQuery);
    procedure LoadAll;
    procedure Delete(AID: integer; ShowMessage: Boolean);
    procedure Update(AID: integer; NewFullName: String);
    procedure Add(FullName: String; EmploymentStart: TDateTime);
    //procedure Search(SearchID: Integer; SearchFullName : string);
    procedure LoadDriverVehicleTypes(DriverID: Integer);
  end;

implementation

procedure TDriverManager.Add(FullName: String; EmploymentStart: TDateTime);
begin
  FQuery.SQL.Text := 'INSERT INTO driver (full_name, employment_start) VALUES (:fullName, :employmentStart)';
  FQuery.ParamByName('fullName').AsString := FullName;
  FQuery.ParamByName('employmentStart').AsDateTime := EmploymentStart;
  FQuery.ExecSQL;

  LoadAll;
end;

constructor TDriverManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TDriverManager.Delete(AID: integer; ShowMessage: Boolean);
begin
  if not ShowMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text := 'DELETE FROM driver WHERE id = :id';
    FQuery.ParamByName('id').AsInteger := AID;
    FQuery.ExecSQL;
  end;

  LoadAll;
end;

procedure TDriverManager.LoadAll;
begin
  FQuery.SQL.Text := 'SELECT ' +
    'id, full_name AS "ФИО", employment_start AS "Дата начала работы" ' +
    'FROM driver';
  FQuery.Open;
end;

procedure TDriverManager.Update(AID: Integer; NewFullName: String);
begin
  FQuery.SQL.Text := 'UPDATE driver SET full_name = :NewFullName WHERE id = :AID';
  FQuery.ParamByName('NewFullName').AsString := NewFullName;
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;

  LoadAll;
end;



procedure TDriverManager.LoadDriverVehicleTypes(DriverID: Integer);
begin
  FQuery.SQL.Text := '';

  FQuery.ParamByName('DriverID').AsInteger := DriverID;
  FQuery.Open;
end;

end.

