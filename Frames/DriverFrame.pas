unit DriverFrame;

interface

uses
  DBConnection, DriverManager, CreateDriverModal, DriverVehicleTypeCheckManager, Data.DB, FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls, System.Generics.Collections;

type
  TDriverFr = class(TFrame)
    driverGrid: TDBGrid;
    BottomPanel: TPanel;
    UpperPanel: TPanel;
    ManipulationGroupBox: TGroupBox;
    CreateButton: TButton;
    DeleteButton: TButton;
    DriverHistoryButton: TButton;
    LoadButton: TButton;
    ChangeButton: TButton;
    SearchBoxGroupBox: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    VehicleTypeCheckListBox: TCheckListBox;
    EditGroupbox: TGroupBox;
    SelectedVehicleTypesEdit: TEdit;
    SelectedEmploymentStartEdit: TEdit;
    SelectedFullNameEdit: TEdit;
    SelectedIdEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure DeleteButtonClick(Sender: TObject);
    procedure driverGridCellClick(Column: TColumn);
    procedure CreateButtonClick(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure FullNameCreateEditEnter(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);


  private

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
  CreateDriverForm: TCreateDriver;
begin
try
    CreateDriverForm := TCreateDriver.Create(Self, ManagerCRUD, CheckListBoxManager);
    CreateDriverForm.ShowModal();
    ManagerCRUD.LoadAll;

finally
      CheckListBoxManager.AssignCheckListBox(VehicleTypeCheckListBox);
      CreateDriverForm.Free;
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
    ShowMessage('��� ��������� ����� ��� �� ������ �����');
end;

destructor TDriverFr.Destroy;
begin
  inherited;
end;

procedure TDriverFr.driverGridCellClick(Column: TColumn);
begin
   SelectedFullNameEdit.Text := driverGrid.DataSource.DataSet.FieldByName('full_name').AsString;
   SelectedIdEdit.Text := driverGrid.DataSource.DataSet.FieldByName('id').AsString;
   SelectedVehicleTypesEdit.Text :=  driverGrid.DataSource.DataSet.FieldByName('vehicle_types').AsString;
   SelectedEmploymentStartEdit.Text :=  driverGrid.DataSource.DataSet.FieldByName('employment_start').AsString;

  CheckListBoxManager.UpdateCheckedCategories(StrToInt(SelectedIdEdit.Text));

  SelectedAssignedVehicleTypes.clear;
  SelectedAssignedVehicleTypes :=  CheckListBoxManager.GetSelectedVehicleTypes();
end;

procedure TDriverFr.FullNameCreateEditEnter(Sender: TObject);
begin
  CheckListBoxManager.ClearGroupCheckBox;
end;


procedure TDriverFr.LoadButtonClick(Sender: TObject);
begin
ManagerCRUD.LoadAll;
end;

procedure TDriverFr.ChangeButtonClick(Sender: TObject);
begin
  if (SelectedFullNameEdit.Text <> '') and (SelectedIdEdit.Text <> '') then
    //if fullNameChangeEdit.Text <> SelectedFullName then
    begin
      ManagerCRUD.Update(StrToInt(SelectedIdEdit.Text), SelectedFullNameEdit.Text);
      ManagerCRUD.UpdateDriverVehicleTypes(StrToInt(SelectedIdEdit.Text),
	SelectedAssignedVehicleTypes, CheckListBoxManager.GetSelectedVehicleTypes);
    end
    else
      ManagerCRUD.UpdateDriverVehicleTypes(StrToInt(SelectedIdEdit.Text),
	SelectedAssignedVehicleTypes, CheckListBoxManager.GetSelectedVehicleTypes);

  SelectedIdEdit.Text := '';
  SelectedFullNameEdit.Text := '';

  CheckListBoxManager.LoadVehicleTypes;
end;


end.
