unit ManagerCRUD;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs;

type
  TManagerCRUD = class
  private
    FQuery: TFDQuery;
    FTableName: String;
    FCustomSQL: String;
  public
    constructor Create(AQuery: TFDQuery; ATableName: String;
      ACustomSQL: String = '');

    procedure LoadAll;
    procedure Add(AFields, AValues: array of String);
    procedure Delete(AID: Integer; ShowMessage: Boolean);
    procedure Update(AFields, AValues: array of String; AID: Integer);
    procedure Search(AField, AKeyword: String);
    procedure SaveChanges;
    procedure RefreshGrid;
    procedure Commit;
  end;

implementation

constructor TManagerCRUD.Create(AQuery: TFDQuery; ATableName: String;
  ACustomSQL: String);
begin
  FQuery := AQuery;
  FTableName := ATableName;
  FCustomSQL := ACustomSQL;
end;

procedure TManagerCRUD.LoadAll;
begin
  FQuery.SQL.Text := 'SELECT * FROM ' + FTableName;
  FQuery.Open;
end;

procedure TManagerCRUD.Add(AFields, AValues: array of String);
var
  FieldsList, ParamsList: String;
  I: Integer;
begin
  FieldsList := '';
  ParamsList := '';

  for I := Low(AFields) to High(AFields) do
  begin
    if I > Low(AFields) then
    begin
      FieldsList := FieldsList + ', ';
      ParamsList := ParamsList + ', ';
    end;
    FieldsList := FieldsList + AFields[I];
    ParamsList := ParamsList + ':' + AFields[I];
  end;

  FQuery.SQL.Text := Format('INSERT INTO %s (%s) VALUES (%s)',
    [FTableName, FieldsList, ParamsList]);


  // ShowMessage('Generated SQL: ' + FQuery.SQL.Text);

  for I := Low(AValues) to High(AValues) do
    FQuery.ParamByName(AFields[I]).AsString := AValues[I];

  FQuery.ExecSQL;
  RefreshGrid;
end;

procedure TManagerCRUD.Delete(AID: Integer; ShowMessage: Boolean);
begin
  if not ShowMessage or (MessageDlg('Подтвердить удаление', mtConfirmation, [mbOK, mbCancel], 0) = 1) then
  begin
    FQuery.SQL.Text := Format('DELETE FROM %s WHERE id = :id', [FTableName]);
    FQuery.ParamByName('id').AsInteger := AID;
    FQuery.ExecSQL;
    RefreshGrid;
  end;
end;


procedure TManagerCRUD.Update(AFields, AValues: array of String; AID: Integer);
var
  SetClause: String;
  I: Integer;
begin
  SetClause := '';

  for I := Low(AFields) to High(AFields) do
  begin
    if I > Low(AFields) then
      SetClause := SetClause + ', ';
    SetClause := SetClause + Format('%s = :%s', [AFields[I], AFields[I]]);
  end;

  FQuery.SQL.Text := Format('UPDATE %s SET %s WHERE id = :id',
    [FTableName, SetClause]);
  FQuery.ParamByName('id').AsInteger := AID;

  for I := Low(AFields) to High(AFields) do
    FQuery.ParamByName(AFields[I]).AsString := AValues[I];

  FQuery.ExecSQL;
  RefreshGrid;
end;

(*
Работает только по 1 строке.
Даже если сделать по всем. Будет рабоать только по сроковым типам.
*)
procedure TManagerCRUD.Search(AField, AKeyword: String);
begin
  FQuery.Filtered := False;

  FQuery.Filter := Format('Lower(%s) LIKE ''%%%s%%''',
    [AField, LowerCase(AKeyword)]);

  FQuery.Filtered := True;
end;

procedure TManagerCRUD.SaveChanges;
begin
  FQuery.ApplyUpdates(0);
  RefreshGrid;
end;

procedure TManagerCRUD.RefreshGrid;
begin
  // Если передан кастомный SQL-запрос, используем его
  if FCustomSQL <> '' then
  begin
    FQuery.SQL.Text := FCustomSQL;
    FQuery.Open;
  end
  else
  begin
    FQuery.Refresh;
  end;
end;



procedure TManagerCRUD.Commit;
begin
  try
{    // Проверка, что транзакция еще не была начата    if not FQuery.Connection.InTransaction then      FQuery.Connection.StartTransaction; // Начинаем транзакцию, если она еще не начата    // Выполнение всех операций, требующих сохранения изменений    FQuery.ExecSQL; // Если необходимо выполнить операцию, такую как INSERT/UPDATE/DELETE    // Коммит транзакции для сохранения изменений}
    FQuery.Connection.Commit;
    RefreshGrid; // Обновляем грид, чтобы отобразить изменения
  except
    on E: Exception do
    begin

      FQuery.Connection.Rollback;
      ShowMessage('Ошибка при сохранении изменений: ' + E.Message);
    end;
  end;
end;


end.
