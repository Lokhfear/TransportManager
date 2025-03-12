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
    procedure Add(typeName: String);
    procedure SearchByTypeName(SearchTypeName : string);
  private
  end;

implementation

procedure TVehicleTypeManager.Add(typeName: String);
begin
try
  FQuery.SQL.Text := 'INSERT INTO vehicle_type (type_name) VALUES (:typeName)';
  FQuery.ParamByName('typeName').AsString := typeName;
  FQuery.ExecSQL;

  LoadAll;
except
  on E: Exception do
    ShowMessage('������. �� ������� ������� ����� ��� ����������: ' + E.Message);
end;
end;

constructor TVehicleTypeManager.Create(AQuery: TFDQuery);
begin
  inherited Create(AQuery);
end;

procedure TVehicleTypeManager.Delete(AID: integer; ShowDeleteMessage: Boolean);
begin
  if not ShowDeleteMessage or (MessageDlg('����������� ��������', mtConfirmation,
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
    'id, type_name ' +
    'FROM vehicle_type';
  FQuery.Open;
except
  on E: Exception do
    ShowMessage('������. �� ������� ��������� ������ ����� ����������: ' + E.Message);
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
    ShowMessage('������. �� ������� �������� ��� ����������: ' + E.Message);
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

