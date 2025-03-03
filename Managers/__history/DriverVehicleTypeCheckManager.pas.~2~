unit DriverVehicleTypeCheckManager;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.CheckLst, System.Generics.Collections;

type
  VehicleTypesCheckBoxListManager = class
  private
    FQuery: TFDQuery;
    FCheckListBox: TCheckListBox;
  public
    constructor Create(Query: TFDQuery; CheckListBox: TCheckListBox);
    procedure LoadVehicleTypes;
    procedure UpdateCheckedCategories(DriverID: Integer);
    procedure ClearGroupCheckBox;
    function GetSelectedVehicleTypes: TList<Integer>;
  end;

implementation



constructor VehicleTypesCheckBoxListManager.Create(Query: TFDQuery; CheckListBox: TCheckListBox);
begin
  FQuery := Query;
  FCheckListBox := CheckListBox;
end;

procedure VehicleTypesCheckBoxListManager.LoadVehicleTypes;
begin
  FCheckListBox.Items.Clear;

  FQuery.SQL.Text := 'SELECT id, type_name FROM vehicle_type ORDER BY type_name';
  FQuery.Open;

  while not FQuery.Eof do
  begin
    FCheckListBox.Items.AddObject(FQuery.FieldByName('type_name').AsString,
      TObject(FQuery.FieldByName('id').AsInteger));
    FQuery.Next;
  end;
end;

procedure VehicleTypesCheckBoxListManager.ClearGroupCheckBox;
var
  i: Integer;
begin
  for i := 0 to FCheckListBox.Count - 1 do
    FCheckListBox.Checked[i] := False;
end;

procedure VehicleTypesCheckBoxListManager.UpdateCheckedCategories(DriverID: Integer);
var
  i, VehicleID: Integer;
begin
  ClearGroupCheckBox;

  FQuery.SQL.Text := 'SELECT vehicle_type_id FROM driver_vehicle_type WHERE driver_id = :DriverID';
  FQuery.ParamByName('DriverID').AsInteger := DriverID;
  FQuery.Open;

  while not FQuery.Eof do
  begin
    VehicleID := FQuery.FieldByName('vehicle_type_id').AsInteger;

    for i := 0 to FCheckListBox.Count - 1 do
    begin
      if Integer(FCheckListBox.Items.Objects[i]) = VehicleID then
      begin
        FCheckListBox.Checked[i] := True;
        Break;
      end;
    end;

    FQuery.Next;
  end;
end;

function VehicleTypesCheckBoxListManager.GetSelectedVehicleTypes: TList<Integer>;
var
  i: Integer;
  selectedId: Integer;
begin
  Result := TList<Integer>.Create;

  for i := 0 to FCheckListBox.Count - 1 do
  begin
    if FCheckListBox.Checked[i] then
    begin
      selectedId := Integer(FCheckListBox.Items.Objects[i]);
      Result.Add(selectedId);
    end;
  end;
end;

end.

