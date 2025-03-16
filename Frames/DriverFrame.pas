unit DriverFrame;

interface

uses
  DBConnection, DriverLicensesFrame, DriverManager, CreateDriverModal, DriverVehicleTypeCheckManager, Data.DB, FireDAC.Comp.Client,
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
    EditGroupbox: TGroupBox;
    SelectedLicenseCategoriesEdit: TEdit;
    SelectedFullNameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DriverLicensesPanel: TPanel;
    SelectedEmploymentEndEdit: TMaskEdit;
    SelectedEmploymentStartEdit: TMaskEdit;
    procedure DeleteButtonClick(Sender: TObject);
    procedure driverGridCellClick(Column: TColumn);
    procedure CreateButtonClick(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure FullNameCreateEditEnter(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);

    procedure ReloadData();
    procedure ClearSelectedData;
  private
    DriverLicensesQuery: TFDQuery;

    selectedId: Integer;
    DriverLicensesFrame: TDriverLicensesFr;
    SelectedAssignedVehicleTypes: TList<Integer>;

    CheckListBoxManager: VehicleTypesCheckBoxListManager;
    ManagerCRUD: TDriverManager;



  public
    constructor Create(Owner: TComponent; Query, DriverLicenses : TFDQuery);
    destructor Destroy;
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TDriverFr }

procedure TDriverFr.ClearSelectedData;
begin
SelectedFullNameEdit.Clear;
SelectedEmploymentStartEdit.Clear;
SelectedLicenseCategoriesEdit.Clear;
selectedId := -1;
end;

constructor TDriverFr.Create(Owner: TComponent;  Query, DriverLicenses : TFDQuery);
begin
  inherited Create(Owner);
  DriverLicensesQuery:=  DriverLicenses;

  ManagerCRUD := TDriverManager.Create(Query);
  ManagerCRUD.LoadAll;

  DriverLicensesFrame := TDriverLicensesFr.Create(Self, ManagerCRUD, DriverLicenses);
  DriverLicensesFrame.Parent := DriverLicensesPanel;
  DriverLicensesFrame.DriverLicenseStringGrid.ColWidths[0] := 0;
  DriverLicensesFrame.align := alClient;
  DriverLicensesFrame.ResizeColums(DriverLicensesPanel.Width);

end;

procedure TDriverFr.CreateButtonClick(Sender: TObject);
var
  CreateDriverForm: TCreateDriver;
begin
try
    CreateDriverForm := TCreateDriver.Create(Self, ManagerCRUD, DriverLicensesQuery);
    CreateDriverForm.ShowModal();
    ManagerCRUD.LoadAll;

finally
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
   selectedId := driverGrid.DataSource.DataSet.FieldByName('id').AsInteger;
   SelectedLicenseCategoriesEdit.Text :=  driverGrid.DataSource.DataSet.FieldByName('license_categories').AsString;
   SelectedEmploymentStartEdit.Text :=  driverGrid.DataSource.DataSet.FieldByName('employment_start').AsString;

   DriverLicensesFrame.LoadDriverLicenses(selectedId);


end;

procedure TDriverFr.FullNameCreateEditEnter(Sender: TObject);
begin
  CheckListBoxManager.ClearGroupCheckBox;
end;


procedure TDriverFr.LoadButtonClick(Sender: TObject);
begin
ManagerCRUD.LoadAll;
end;

procedure TDriverFr.ReloadData;
begin
    ClearSelectedData;
    ManagerCRUD.LoadAll;
    ManagerCRUD.DisableFilter;
end;

procedure TDriverFr.ChangeButtonClick(Sender: TObject);
begin
  if (SelectedFullNameEdit.Text <> '') and (selectedId <> -1) then
    //if fullNameChangeEdit.Text <> SelectedFullName then
    begin
      ManagerCRUD.Update(selectedId, SelectedFullNameEdit.Text);
      DriverLicensesFrame.UpdateDriverLicenses(selectedId);
    end
    else
      DriverLicensesFrame.UpdateDriverLicenses(selectedId);

  selectedId := -1;
  SelectedFullNameEdit.Text := '';


end;


end.
