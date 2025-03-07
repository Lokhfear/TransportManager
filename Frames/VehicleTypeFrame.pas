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
    selectedIdEdit: TEdit;
    TopPanel: TPanel;
    SearchGroupBox: TGroupBox;
    ManipulationGroupBox: TGroupBox;
    IdSearchEdit: TEdit;
    CongfirmButton: TButton;
    CreateButton: TButton;
    DeleteButton: TButton;
    VehicleTypeSearchEdit: TEdit;
    LoadButton: TButton;
    IdSearchLabel: TLabel;
    VehicleTypeSearchLabel: TLabel;
    procedure DeleteButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
//    procedure SelectedVehicleTypeEditChange(Sender: TObject);
//   procedure selectedIdEditChange(Sender: TObject);

//    procedure searchByParam();
    procedure DBGrid5CellClick(Column: TColumn);
    procedure CongfirmButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);

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
    ('��� ����������').AsString;
  selectedId := DBGrid5.DataSource.DataSet.FieldByName('id').AsInteger;

  selectedIdEdit.Text := selectedId.ToString;
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

{procedure TVehicleTypeFr.selectedIdEditChange(Sender: TObject);
begin
  searchByParam();
  end;
  }
procedure TVehicleTypeFr.LoadButtonClick(Sender: TObject);
begin
ManagerCRUD.LoadAll;
end;

{procedure TVehicleTypeFr.SelectedVehicleTypeEditChange(Sender: TObject);
begin
  searchByParam();
  end;
  }
{procedure TVehicleTypeFr.searchByParam();
var
  SearchID: Integer;
  begin
    if (SelectedVehicleTypeEdit.Text = '') and (idSearchEdit.Text = '') then
        ManagerCRUD.DisableFilter;

          if TryStrToInt(idSearchEdit.Text, SearchID) then
              ManagerCRUD.Search(SearchID, SelectedVehicleTypeEdit.Text)
              end;}

end.
