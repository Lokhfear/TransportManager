unit VehicleTypeFrame;

interface

uses
  DBConnection, VehicleTypeManager, Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Controls,
  Vcl.ComCtrls, System.Classes, Vcl.Forms, Vcl.StdCtrls, Winapi.Windows,
  Vcl.Dialogs,
  Vcl.Mask, Vcl.DBCtrls, SysUtils;

type
  TVehicleTypeFr = class(TFrame)
    VehicleTypePanel: TPanel;
    DBGrid5: TDBGrid;
    SearchBox: TGroupBox;
    typeNameSearchEdit: TEdit;
    idSearchEdit: TEdit;
    GroupBox1: TGroupBox;
    typeNameEdit: TEdit;
    CreateButton: TButton;
    GroupBox2: TGroupBox;
    CongfirmButton: TButton;
    DeletButton: TButton;
    typenameChangeEdit: TEdit;
    procedure DeletButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure typeNameSearchEditChange(Sender: TObject);
    procedure idSearchEditChange(Sender: TObject);

    procedure searchByParam();
    procedure DBGrid5CellClick(Column: TColumn);
    procedure CongfirmButtonClick(Sender: TObject);

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
begin
  if typeNameEdit.Text <> '' then
    ManagerCRUD.Add(typeNameEdit.Text);
  typeNameEdit.Clear;
end;

procedure TVehicleTypeFr.DBGrid5CellClick(Column: TColumn);
begin
  selectedTypeName := DBGrid5.DataSource.DataSet.FieldByName
    ('��� ����������').AsString;
  selectedId := DBGrid5.DataSource.DataSet.FieldByName('id').AsInteger;

  typenameChangeEdit.Text := selectedTypeName;
end;

procedure TVehicleTypeFr.DeletButtonClick(Sender: TObject);
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
  if (Length(typenameChangeEdit.Text) > 0) and (selectedId <> 0) and
    (typenameChangeEdit.Text <> selectedTypeName) then
  begin
    if MessageDlg('�� ����� ������ �������� "' + selectedTypeName + '" �� "' +
      typenameChangeEdit.Text + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      ManagerCRUD.Update(selectedId, typenameChangeEdit.Text);

      selectedId := 0;
      selectedTypeName := '';
      typenameChangeEdit.Clear;
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

procedure TVehicleTypeFr.idSearchEditChange(Sender: TObject);
begin
  searchByParam();
end;

procedure TVehicleTypeFr.typeNameSearchEditChange(Sender: TObject);
begin
  searchByParam();
end;

procedure TVehicleTypeFr.searchByParam();
var
  SearchID: Integer;
begin
  if (typenameChangeEdit.Text = '') and (idSearchEdit.Text = '') then
    ManagerCRUD.DisableFilter;

  if TryStrToInt(idSearchEdit.Text, SearchID) then
    ManagerCRUD.Search(SearchID, typenameChangeEdit.Text)
end;

end.
