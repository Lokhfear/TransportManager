unit DriverFrame;

interface

uses
  DBConnection, DriverManager, Data.DB, FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls;

type
  TDriverFr = class(TFrame)
    driverGrid: TDBGrid;
    Panel1: TPanel;
    searchGroupbox: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    VehicleTypeCheckListBox: TCheckListBox;
    GroupBox2: TGroupBox;
    FullNameCreateEdit: TEdit;
    CreateButton: TButton;
    GroupBox3: TGroupBox;
    DeleteButton: TButton;
    ChangeButton: TButton;
    fullNameChangeEdit: TEdit;
    employmentStartDatePicker: TDateTimePicker;
    procedure DeleteButtonClick(Sender: TObject);
    procedure driverGridCellClick(Column: TColumn);
    procedure CreateButtonClick(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure FullNameCreateEditEnter(Sender: TObject);


  private
    SelectedFullName: String;
    SelectedDriverId: Integer;

    DBConnection: TFDConnection;
    ManagerCRUD: TDriverManager;

    procedure LoadVehicleTypes;
    procedure UpdateCheckedCategories(DriverID: Integer);
    procedure ClearGroupCheckBox;

  public
    constructor Create(Owner: TComponent; Query: TFDQuery;
      Connection: TFDConnection);
    destructor Destroy;
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TDriverFr }

constructor TDriverFr.Create(Owner: TComponent; Query: TFDQuery;
  Connection: TFDConnection);
begin
  inherited Create(Owner);
  ManagerCRUD := TDriverManager.Create(Query);
  ManagerCRUD.LoadAll;
  DBConnection := Connection;
  LoadVehicleTypes;
end;

procedure TDriverFr.CreateButtonClick(Sender: TObject);
begin
  if FullNameCreateEdit.Text <> '' then
  begin
    ManagerCRUD.Add(FullNameCreateEdit.Text, employmentStartDatePicker.Date);

    FullNameCreateEdit.Text := '';
    employmentStartDatePicker.Checked := false;
    LoadVehicleTypes;
  end;

end;

procedure TDriverFr.DeleteButtonClick(Sender: TObject);
var
  selectedId: Integer;
begin
  if driverGrid.SelectedRows.Count <> 1 then
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
  SelectedFullName := driverGrid.DataSource.DataSet.FieldByName('���').AsString;
  SelectedDriverId := driverGrid.DataSource.DataSet.FieldByName('id').AsInteger;

  fullNameChangeEdit.Text := SelectedFullName;
  UpdateCheckedCategories(SelectedDriverId);
end;

procedure TDriverFr.FullNameCreateEditEnter(Sender: TObject);
begin
ClearGroupCheckBox;
end;


procedure TDriverFr.LoadVehicleTypes;
var
  Query: TFDQuery;
begin
  VehicleTypeCheckListBox.Items.Clear;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DBConnection;
    Query.SQL.Text :=
      'SELECT id, type_name FROM vehicle_type ORDER BY type_name';
    Query.Open;

    while not Query.Eof do
    begin
      VehicleTypeCheckListBox.Items.AddObject(Query.FieldByName('type_name')
	.AsString, TObject(Query.FieldByName('id').AsInteger));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TDriverFr.ChangeButtonClick(Sender: TObject);
begin

  LoadVehicleTypes;
end;

procedure TDriverFr.ClearGroupCheckBox;
var
  i: Integer;
begin

  for i := 0 to VehicleTypeCheckListBox.Count - 1 do
    VehicleTypeCheckListBox.Checked[i] := false;
end;

procedure TDriverFr.UpdateCheckedCategories(DriverID: Integer);
var
  Query: TFDQuery;
  i, VehicleID: Integer;
begin
  ClearGroupCheckBox;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DBConnection;
    Query.SQL.Text :=
      'SELECT vehicle_type_id FROM driver_vehicle_type WHERE driver_id = :DriverID';
    Query.ParamByName('DriverID').AsInteger := DriverID;
    Query.Open;

    while not Query.Eof do
    begin
      VehicleID := Query.FieldByName('vehicle_type_id').AsInteger;

      for i := 0 to VehicleTypeCheckListBox.Count - 1 do
      begin
	if Integer(VehicleTypeCheckListBox.Items.Objects[i]) = VehicleID then
	begin
	  VehicleTypeCheckListBox.Checked[i] := true;
	  Break;
	end;
      end;

      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

end.
