unit VehicleTypeFrame;

interface

uses
  DBConnection, CreateVehicleTypeModal, VehicleTypeManager, Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Controls,
  Vcl.ComCtrls, System.Classes, Vcl.Forms, Vcl.StdCtrls, Winapi.Windows,
  Vcl.Dialogs,
  Vcl.Mask, Vcl.DBCtrls, SysUtils;

type
  TVehicleTypeFr = class(TFrame)
    VehicleTypePanel: TPanel;
    DBGrid5: TDBGrid;
    EditGroupBox: TGroupBox;
    SelectedVehicleTypeEdit: TEdit;
    TopPanel: TPanel;
    SearchGroupBox: TGroupBox;
    ManipulationGroupBox: TGroupBox;
    CongfirmButton: TButton;
    CreateButton: TButton;
    DeleteButton: TButton;
    VehicleTypeSearchEdit: TEdit;
    LoadButton: TButton;
    VehicleTypeSearchLabel: TLabel;
    Label1: TLabel;
    LicenseCategoryLookupComboBox: TDBLookupComboBox;
    ClearButton: TButton;
    procedure DeleteButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);

    procedure DBGrid5CellClick(Column: TColumn);
    procedure CongfirmButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ReloadData();
    procedure clearData();
    procedure VehicleTypeSearchEditChange(Sender: TObject);
    procedure LicenseCategoryLookupComboBoxClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    ManagerCRUD: TVehicleTypeManager;
    selectedId: Integer;
    selectedTypeName: string;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner: TComponent; Query: TFDQuery);
    destructor Destroy;
  end;

implementation

{$R *.dfm}

procedure TVehicleTypeFr.CreateButtonClick(Sender: TObject);
var
  CreateVehicleTypeForm: TCreateVhicleType;
begin
  CreateVehicleTypeForm := TCreateVhicleType.Create(self, ManagerCRUD);
  try
    CreateVehicleTypeForm.ShowModal;
    ManagerCRUD.LoadAll;
  finally
    CreateVehicleTypeForm.Free;
  end;
end;


procedure TVehicleTypeFr.DBGrid5CellClick(Column: TColumn);
begin
  selectedTypeName := DBGrid5.DataSource.DataSet.FieldByName
    ('type_name').AsString;
  selectedId := DBGrid5.DataSource.DataSet.FieldByName('id').AsInteger;

  SelectedVehicleTypeEdit.Text := selectedTypeName;
end;

procedure TVehicleTypeFr.DeleteButtonClick(Sender: TObject);
var
  selectedId: Integer;
begin
  if DBGrid5.SelectedRows.Count <> 1 then
  begin
    selectedId := DBGrid5.DataSource.DataSet.FieldByName('id').AsInteger;
    ManagerCRUD.Delete(selectedId, true);
  end
  else
    ShowMessage('��� ��������� ����� ��� �� ������ �����');
end;

procedure TVehicleTypeFr.ClearButtonClick(Sender: TObject);
begin
VehicleTypeSearchEdit.Clear;
LicenseCategoryLookupComboBox.KeyValue := -1;
ManagerCRUD.DisableFilter;
end;

procedure TVehicleTypeFr.clearData;
begin
SelectedVehicleTypeEdit.Clear;
VehicleTypeSearchEdit.Clear;
end;

procedure TVehicleTypeFr.CongfirmButtonClick(Sender: TObject);
begin
  if (Length(SelectedVehicleTypeEdit.Text) > 0) and (selectedId <> 0) and
    (SelectedVehicleTypeEdit.Text <> selectedTypeName) then
  begin
    if MessageDlg('�� ����� ������ �������� "' + selectedTypeName + '" �� "' +
      SelectedVehicleTypeEdit.Text + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      ManagerCRUD.Update(selectedId, SelectedVehicleTypeEdit.Text);

      selectedId := 0;
      selectedTypeName := '';
      SelectedVehicleTypeEdit.Clear;
    end;
  end;
end;

constructor TVehicleTypeFr.Create(Owner: TComponent; Query: TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TVehicleTypeManager.Create(Query);
  ManagerCRUD.LoadAll;
end;

destructor TVehicleTypeFr.Destroy;
begin

  inherited;
end;

procedure TVehicleTypeFr.LicenseCategoryLookupComboBoxClick(Sender: TObject);
begin
ManagerCRUD.SearchByParam(VehicleTypeSearchEdit.Text, LicenseCategoryLookupComboBox.Text);
end;

procedure TVehicleTypeFr.LoadButtonClick(Sender: TObject);
begin
ManagerCRUD.LoadAll;
end;

procedure TVehicleTypeFr.ReLoadData;
begin
  clearData;
  ManagerCRUD.DisableFilter;
  ManagerCRUD.LoadAll;
end;

procedure TVehicleTypeFr.VehicleTypeSearchEditChange(Sender: TObject);
begin
ManagerCRUD.SearchByParam(VehicleTypeSearchEdit.Text, LicenseCategoryLookupComboBox.Text);
end;

end.
