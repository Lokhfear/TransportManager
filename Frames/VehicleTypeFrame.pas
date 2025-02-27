unit VehicleTypeFrame;

interface

uses
  DBConnection, ManagerCRUD, Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Controls,
  Vcl.ComCtrls, System.Classes, Vcl.Forms, Vcl.StdCtrls, Winapi.Windows, Vcl.Dialogs,
  Vcl.Mask, Vcl.DBCtrls;

type
  TVehicleTypeFr = class(TFrame)
    VehicleTypePanel: TPanel;
    DBGrid5: TDBGrid;
    SearchBox: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    typeNameEdit: TEdit;
    CreateButton: TButton;
    GroupBox2: TGroupBox;
    CongfirmButton: TButton;
    DeletButton: TButton;
    typenameChangeEdit: TEdit;
    procedure DeletButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure CongfirmButtonClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);




  private
    Manager: TManagerCRUD;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner: TComponent; Query: TFDQuery);
    destructor Destroy;
  end;

implementation

{$R *.dfm}

procedure TVehicleTypeFr.CreateButtonClick(Sender: TObject);
begin
  if typeNameEdit.Text <> '' then
    Manager.Add(['type_name'], [typeNameEdit.Text]);
  typeNameEdit.Clear;
end;


procedure TVehicleTypeFr.DeletButtonClick(Sender: TObject);
var
  SelectedID: Integer;
begin
  if DBGrid5.SelectedRows.Count <> 1 then
  begin
    SelectedID := DBGrid5.DataSource.DataSet.FieldByName('id').AsInteger;
    Manager.Delete(SelectedID, true);
  end
  else
    ShowMessage('��� ��������� ����� ��� �� ������ �����');
end;



procedure TVehicleTypeFr.CongfirmButtonClick(Sender: TObject);
begin
   Manager.Commit;
end;

constructor TVehicleTypeFr.Create(Owner: TComponent; Query: TFDQuery);
begin
  inherited Create(Owner);
  Manager := TManagerCRUD.Create(Query, 'VEHICLE_TYPE',
    'SELECT id, type_name FROM VEHICLE_TYPE');
  Manager.LoadAll;
end;

destructor TVehicleTypeFr.Destroy;
begin

  inherited;
end;

procedure TVehicleTypeFr.Edit2Change(Sender: TObject);
begin
Manager.Search('type_name', Edit2.Text);
end;




end.
