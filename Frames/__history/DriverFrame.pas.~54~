unit DriverFrame;

interface

uses
  DBConnection, DriverManager, DriverVehicleTypeCheckManager, Data.DB, FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls, System.Generics.Collections;

type
  TDriverFr = class(TFrame)
    driverGrid: TDBGrid;
    Panel1: TPanel;
    searchGroupbox: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox2: TGroupBox;
    FullNameCreateEdit: TEdit;
    CreateButton: TButton;
    GroupBox3: TGroupBox;
    DeleteButton: TButton;
    ChangeButton: TButton;
    fullNameChangeEdit: TEdit;
    employmentStartDatePicker: TDateTimePicker;
    VehicleTypeCheckListBox: TCheckListBox;
    procedure DeleteButtonClick(Sender: TObject);
    procedure driverGridCellClick(Column: TColumn);
    procedure CreateButtonClick(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure FullNameCreateEditEnter(Sender: TObject);


  private
    SelectedFullName: String;
    SelectedDriverId: Integer;
    SelectedAssignedVehicleTypes: TList<Integer>;

    CheckListBoxManager: VehicleTypesCheckBoxListManager;
    ManagerCRUD: TDriverManager;



  public
    constructor Create(Owner: TComponent; Query, CheckListBoxQuery : TFDQuery);
    destructor Destroy;
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TDriverFr }

constructor TDriverFr.Create(Owner: TComponent;  Query, CheckListBoxQuery : TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TDriverManager.Create(Query);
  ManagerCRUD.LoadAll;
  CheckListBoxManager := VehicleTypesCheckBoxListManager.Create(CheckListBoxQuery, VehicleTypeCheckListBox);

  SelectedAssignedVehicleTypes := TList<Integer>.Create;

  CheckListBoxManager.LoadVehicleTypes;
end;

procedure TDriverFr.CreateButtonClick(Sender: TObject);
var
  createdId: Integer;
begin
  if FullNameCreateEdit.Text <> '' then
  begin
    createdId:= ManagerCRUD.Add(FullNameCreateEdit.Text, employmentStartDatePicker.Date);
    ManagerCRUD.UpdateDriverVehicleTypes(createdId, TList<Integer>.Create, CheckListBoxManager.GetSelectedVehicleTypes);

    FullNameCreateEdit.Text := '';
    employmentStartDatePicker.Checked := false;
    CheckListBoxManager.LoadVehicleTypes;
  end;

end;

procedure TDriverFr.DeleteButtonClick(Sender: TObject);
var
  selectedId: Integer;
begin
  if driverGrid.SelectedRows.Count = 1 then
  begin
    selectedId := driverGrid.DataSource.DataSet.FieldByName('id').AsInteger;
    ManagerCRUD.Delete(selectedId, true);
  end
  else
    ShowMessage('Ќет выбранных строк или их больше одной');
end;

destructor TDriverFr.Destroy;
begin
  inherited;
end;

procedure TDriverFr.driverGridCellClick(Column: TColumn);
begin
  SelectedFullName := driverGrid.DataSource.DataSet.FieldByName('full_name').AsString;
  SelectedDriverId := driverGrid.DataSource.DataSet.FieldByName('id').AsInteger;

  fullNameChangeEdit.Text := SelectedFullName;
  CheckListBoxManager.UpdateCheckedCategories(SelectedDriverId);

  SelectedAssignedVehicleTypes.clear;
  SelectedAssignedVehicleTypes :=  CheckListBoxManager.GetSelectedVehicleTypes();
end;

procedure TDriverFr.FullNameCreateEditEnter(Sender: TObject);
begin
  CheckListBoxManager.ClearGroupCheckBox;
end;


procedure TDriverFr.ChangeButtonClick(Sender: TObject);
begin
  if (fullNameChangeEdit.Text <> '') and (SelectedDriverId <> 0) then
    if fullNameChangeEdit.Text <> SelectedFullName then
    begin
      ManagerCRUD.Update(SelectedDriverId, fullNameChangeEdit.Text);
      ManagerCRUD.UpdateDriverVehicleTypes(SelectedDriverId,
	SelectedAssignedVehicleTypes, CheckListBoxManager.GetSelectedVehicleTypes);
    end
    else
      ManagerCRUD.UpdateDriverVehicleTypes(SelectedDriverId,
	SelectedAssignedVehicleTypes, CheckListBoxManager.GetSelectedVehicleTypes);

  SelectedDriverId := 0;
  fullNameChangeEdit.Text := '';

  CheckListBoxManager.LoadVehicleTypes;
end;


end.
