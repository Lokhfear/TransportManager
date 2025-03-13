unit VehicleTypeManager;

interface

uses
  FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils, ManagerCRUD;

type
  TVehicleTypeManager = class(TManagerCRUD)
  public
    constructor Create(AQuery: TFDQuery);
    procedure LoadAll;
    procedure Delete(AID: integer; ShowDeleteMessage: Boolean);
    procedure Update(AID: integer; NewTypeName: String);
    procedure Add(typeName: String; requiredLicenseId : Integer);
    procedure SearchByTypeName(SearchTypeName : string);
  private
  end;

implementation

procedure TVehicleTypeManager.Add(typeName: String; requiredLicenseId : Integer);
begin
try
  FQuery.SQL.Text := 'INSERT INTO vehicle_type (type_name, required_license_id) VALUES (:typeName, :requiredLicenseId)';
  FQuery.ParamByName('typeName').AsString := typeName;
  FQuery.ParamByName('requiredLicenseId').AsInteger := requiredLicenseId;
  FQuery.ExecSQL;

  LoadAll;
except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось создать новый тип транспорта: ' + E.Message);
end;
end;

constructor TVehicleTypeManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TVehicleTypeManager.Delete(AID: integer; ShowDeleteMessage: Boolean);
begin
  if not ShowDeleteMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
    [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text := 'DELETE FROM vehicle_type WHERE id = :id';
    FQuery.ParamByName('id').AsInteger := AID;
    FQuery.ExecSQL;
  end;

  LoadAll;
end;

procedure TVehicleTypeManager.LoadAll;
begin
try
  FQuery.SQL.Text := 'SELECT ' +
    'vt.id, type_name, category_name as license_category ' +
    'FROM vehicle_type vt JOIN license_category lc on vt.required_license_id = lc.id ' +
    'order by category_name ';
  FQuery.Open;
except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось загрузить данные типов транспорта: ' + E.Message);
end;
end;

procedure TVehicleTypeManager.Update(AID: Integer; NewTypeName: String);
begin
try
  FQuery.SQL.Text := 'UPDATE vehicle_type SET type_name = :NewTypeName WHERE id = :AID';
  FQuery.ParamByName('NewTypeName').AsString := NewTypeName;
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;

  LoadAll;
except
  on E: Exception do
    ShowMessage('Ошибка. Не удалось обновить тип транспорта: ' + E.Message);
end;
end;

procedure TVehicleTypeManager.SearchByTypeName(SearchTypeName: string);
begin
  FQuery.Filtered := False;

  if SearchTypeName = '' then
    Exit
  else
   FQuery.Filter := Format('type_name LIKE ''%%%s%%''', [SearchTypeName]);

  FQuery.Filtered := True;
end;




end.

