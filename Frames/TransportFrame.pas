unit TransportFrame;

interface

uses
  DBConnection, CreateTransportModal, Helper,
  TransportManage, FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TTransportFr = class(TFrame)
    BottomPanel: TPanel;
    TransportDBGrid: TDBGrid;
    TopPanel: TPanel;
    EditGroupBox: TGroupBox;
    SelectedVehicleTypeEdit: TEdit;
    SelectedStartExploitationDateTimePicker: TDateTimePicker;
    SelectedNumberPlateEdit: TEdit;
    SearchGroupBox: TGroupBox;
    VehicleTypeCreateLabel: TLabel;
    NumberPlateCreateLabel: TLabel;
    NumberPlateSearchEdit: TEdit;
    SelectedBrandNameEdit: TEdit;
    SelectedLicenseCategoryEdit: TEdit;
    VehicleTypeSearchComboBox: TDBLookupComboBox;
    LicenseCategorySearchComboBox: TDBLookupComboBox;
    Label5: TLabel;
    TransportBrandSearchComboBox: TDBLookupComboBox;
    ManipulationGroupBox: TGroupBox;
    LoadButton: TButton;
    CreateButton: TButton;
    ChangeButton: TButton;
    Brandlabel: TLabel;
    ClearButton: TButton;
    SelectedEndExploitationEdit: TMaskEdit;
    SearchStartExploitationFrom: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    SearchStartExploitationTo: TMaskEdit;
    SearchEndExploitationFrom: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    SearchEndExploitationTo: TMaskEdit;

    constructor Create(Owner: TComponent; Query: TFDQuery);
    procedure TransportDBGridCellClick(Column: TColumn);
    procedure ChangeButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ReloadData();
    procedure ClearButtonClick(Sender: TObject);
    procedure SearchByParam(Sender: TObject);
  private
    { Private declarations }
    ManagerCRUD: TTransportManager;
    //selectedNumberPlate: string;
    //selectedEndExploitationDate: TDate;
    procedure clearData;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TTransportFr.ClearButtonClick(Sender: TObject);
begin
 NumberPlateSearchEdit.Clear;
 VehicleTypeSearchComboBox.KeyValue := -1;
 LicenseCategorySearchComboBox.KeyValue := -1;
 TransportBrandSearchComboBox.KeyValue := -1;

 ManagerCRUD.DisableFilter;
end;

procedure TTransportFr.clearData;
begin
    SelectedVehicleTypeEdit.Clear;
    SelectedNumberPlateEdit.Clear;
    SelectedBrandNameEdit.Clear;
    SelectedLicenseCategoryEdit.Clear;
    SelectedEndExploitationEdit.clear;
    SelectedStartExploitationDateTimePicker.date := date;
end;



procedure TTransportFr.ReloadData;
begin
  clearData;
  ManagerCRUD.LoadAll;
end;



procedure TTransportFr.SearchByParam(Sender: TObject);
var
StartExploitationDateFrom, StartExploitationDateTo,
EndExploitationDateFrom, EndExploitationDateTo : TDate;
begin

ValidateDate(SearchStartExploitationFrom, StartExploitationDateFrom);
ValidateDate(SearchStartExploitationTo, StartExploitationDateTo);
ValidateDate(SearchEndExploitationFrom, EndExploitationDateFrom);
ValidateDate(SearchEndExploitationTo, EndExploitationDateTo);

ManagerCRUD.SearchByParam(NumberPlateSearchEdit.Text, VehicleTypeSearchComboBox.Text,
LicenseCategorySearchComboBox.Text, TransportBrandSearchComboBox.Text,
StartExploitationDateFrom, StartExploitationDateTo,
EndExploitationDateFrom, EndExploitationDateTo);

end;

procedure TTransportFr.ChangeButtonClick(Sender: TObject);
var
   EndExploitationDate : TDate;
begin

  if (SelectedNumberPlateEdit.Text = '')  or not
     (ValidateDate(SelectedEndExploitationEdit, EndExploitationDate)) then
  begin
    exit;
  end;


  if EndExploitationDate < SelectedStartExploitationDateTimePicker.Date then
  begin
     ShowMessage('���� ��������� ������������ �� ����� ���� ������ ���� ������ ������������');
     exit;
  end;

  ManagerCRUD.Update(SelectedNumberPlateEdit.Text,
  EndExploitationDate)
  
end;

constructor TTransportFr.Create(Owner: TComponent; Query: TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TTransportManager.Create(Query);
  ManagerCRUD.LoadAll;

  clearData;

  VehicleTypeSearchComboBox.KeyValue := -1;
  LicenseCategorySearchComboBox.KeyValue := -1;
  TransportBrandSearchComboBox.KeyValue := -1;
end;

procedure TTransportFr.CreateButtonClick(Sender: TObject);
var 
  CreateTransportForm: TCreateTransport;
begin

  try
    CreateTransportForm := TCreateTransport.Create(Self, ManagerCRUD);
    CreateTransportForm.ShowModal();
    ManagerCRUD.LoadAll;

finally
      CreateTransportForm.Free;
  end;
  
end;

procedure TTransportFr.LoadButtonClick(Sender: TObject);
begin
  ManagerCRUD.LoadAll;
end;


procedure TTransportFr.TransportDBGridCellClick(Column: TColumn);
begin
  SelectedNumberPlateEdit.Text := TransportDBGrid.DataSource.DataSet.FieldByName
    ('number_plate').AsString;
  SelectedVehicleTypeEdit.Text := TransportDBGrid.DataSource.DataSet.FieldByName
    ('type_name').AsString;
  SelectedBrandNameEdit.Text := TransportDBGrid.DataSource.DataSet.FieldByName
    ('brand_name').AsString;
  SelectedLicenseCategoryEdit.Text := TransportDBGrid.DataSource.DataSet.FieldByName
    ('license_category').AsString;
  SelectedEndExploitationEdit.Text :=
   TransportDBGrid.DataSource.DataSet.FieldByName('end_exploitation')
    .AsString;
  SelectedStartExploitationDateTimePicker.Date :=
    Trunc(TransportDBGrid.DataSource.DataSet.FieldByName('start_exploitation')
    .AsDateTime);

end;

end.
