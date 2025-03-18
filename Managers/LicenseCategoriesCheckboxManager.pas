unit LicenseCategoriesCheckBoxManager;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.CheckLst,
  System.Generics.Collections;

type
  LicenseCategoriesCheckbox = class
  private
    FQuery: TFDQuery;
    FCheckListBox: TCheckListBox;
  public
    constructor Create(CheckListBox: TCheckListBox;
 Query: TFDQuery);
    procedure LoadVehicleTypes;
    // procedure UpdateCheckedCategories(DriverID: Integer);
    procedure ClearGroupCheckBox;
    function GetSelectedVehicleTypes: TList<String>;

    procedure AssignCheckListBox(CheckListBox: TCheckListBox);
  end;

implementation

procedure LicenseCategoriesCheckbox.AssignCheckListBox
  (CheckListBox: TCheckListBox);
begin
  FCheckListBox := CheckListBox;
end;

constructor LicenseCategoriesCheckbox.Create(CheckListBox: TCheckListBox;
 Query: TFDQuery);
begin
  FQuery := Query;
  FCheckListBox := CheckListBox;
  LoadVehicleTypes;
end;

procedure LicenseCategoriesCheckbox.LoadVehicleTypes;
begin
  FCheckListBox.Items.Clear;

  FQuery.SQL.Text := 'select * from license_category';
  FQuery.Open;

  while not FQuery.Eof do
  begin
    FCheckListBox.Items.Add(FQuery.FieldByName('category_name').AsString);
    FQuery.Next;
  end;
end;

procedure LicenseCategoriesCheckbox.ClearGroupCheckBox;
var
  i: Integer;
begin
  for i := 0 to FCheckListBox.Count - 1 do
    FCheckListBox.Checked[i] := False;
end;

{
  procedure VehicleTypesCheckBoxListManager.UpdateCheckedCategories();
  var
  LicenseCategory: string;
  i : Integer;
  begin
  ClearGroupCheckBox;

  FQuery.SQL.Text := 'SELECT category_name as license_category FROM license_category';
  FQuery.Open;

  while not FQuery.Eof do
  begin
  LicenseCategory := FQuery.FieldByName('license_category').AsString;

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
}
function LicenseCategoriesCheckbox.GetSelectedVehicleTypes: TList<String>;
var
  i: Integer;
  selectedLicenseCategory: String;
begin
  Result := TList<String>.Create;

  for i := 0 to FCheckListBox.Count - 1 do
  begin
    if FCheckListBox.Checked[i] then
    begin
      selectedLicenseCategory := FCheckListBox.Items.Strings[i];
      Result.Add(selectedLicenseCategory);
    end;
  end;
end;

end.
