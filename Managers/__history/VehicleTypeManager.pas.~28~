unit VehicleTypeManager;

interface

uses
  ManagerCRUD, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs, SysUtils;

type
  TVehicleTypeManager = class(TManagerCRUD)
  public
    constructor Create(AQuery: TFDQuery);
    procedure LoadAll;
    procedure Delete(AID: integer; ShowMessage: Boolean);
    procedure Update(AID: integer; NewTypeName: String);
    procedure Add(typeName: String);
    procedure Search(SearchID: Integer; SearchTypeName : string);
  end;

implementation

procedure TVehicleTypeManager.Add(typeName: String);
begin
  FQuery.SQL.Text := 'INSERT INTO vehicle_type (type_name) VALUES (:typeName)';
  FQuery.ParamByName('typeName').AsString := typeName;
  FQuery.ExecSQL;

  LoadAll;
end;

constructor TVehicleTypeManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TVehicleTypeManager.Delete(AID: integer; ShowMessage: Boolean);
begin
  if not ShowMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
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
  FQuery.SQL.Text := 'SELECT ' +
    'id, type_name as "Тип транспорта" ' +
    'FROM vehicle_type';
  FQuery.Open;
end;

procedure TVehicleTypeManager.Update(AID: Integer; NewTypeName: String);
begin
  FQuery.SQL.Text := 'UPDATE vehicle_type SET type_name = :NewTypeName WHERE id = :AID';
  FQuery.ParamByName('NewTypeName').AsString := NewTypeName;
  FQuery.ParamByName('AID').AsInteger := AID;
  FQuery.ExecSQL;

  LoadAll;
end;

procedure TVehicleTypeManager.Search(SearchID: integer; SearchTypeName: string);
begin
  FQuery.Filtered := False;

  FQuery.Filter := Format(
    '(id = %d) and (Тип транспорта LIKE ''%%%s%%'')',
    [SearchID, LowerCase(SearchTypeName)]
  );

  FQuery.Filtered := True;
end;




end.

