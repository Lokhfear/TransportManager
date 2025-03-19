unit TripFrame;

interface

uses
  DBConnection, DriverManager, TransportManage, TripManager, Vcl.Controls,
  FireDAC.Comp.Client, Helper,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TTripFr = class(TFrame)
    TripPanel: TPanel;
    TopPanel: TPanel;
    GroupBox2: TGroupBox;
    TripGrid: TDBGrid;
    GroupBox5: TGroupBox;
    SelectedTripNameEdit: TEdit;
    SelectedDistanceEdit: TEdit;
    SelectedFullNameComboBox: TDBLookupComboBox;
    SelectedNuberPlateComboBox: TDBLookupComboBox;
    SelectedVehicleTypeEdit: TEdit;
    SelectedStartDateTimeEdit: TMaskEdit;
    SelectedEndDateTimeEdit: TMaskEdit;
    searchBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    FullNameSearchEdit: TEdit;
    NumberPlateSearchEdit: TEdit;
    TripNameSearchEdit: TEdit;
    ClearButton: TButton;
    VehicleTypeSearchComboBox: TDBLookupComboBox;
    SearchTripStartFrom: TMaskEdit;
    SearchTripStartTo: TMaskEdit;
    Label9: TLabel;
    SearchTripEndTo: TMaskEdit;
    SearchTripEndFrom: TMaskEdit;
    AssignDriverAndTransportButton: TButton;
    Button1: TButton;
    LoadButton: TButton;
    procedure TripGridCellClick(Column: TColumn);
//    procedure AssignDriverAndTransportButtonClick(Sender: TObject);
    procedure SearchByParam(Sender: TObject);
    procedure SetStartOrEndDateTimeButoonClick(Sender: TObject);
    procedure SelectedStartDateTimeEditExit(Sender: TObject);
    procedure SelectedEndDateTimeEditExit(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ReloadData();
    procedure ClearSelectedData();
    procedure ClearButtonClick(Sender: TObject);


  private
    { Private declarations }
    ManagerCRUD: TTripManager;
    DriverManagerCRUD: TDriverManager;
    TransportManagerCRUD: TTransportManager;

    startDate, endDate: TDateTime;

    procedure DisableAllEdit();

  public
    constructor Create(Owner: TComponent; TripQuery, TransportQuery,
      DriverQuery: TFDQuery);
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TTripFr }

procedure TTripFr.SetStartOrEndDateTimeButoonClick(Sender: TObject);
begin
  if (endDate < startDate) then
  begin
    ShowMessage('����� ������� �� ����� ���� ������ ������� �������');
    exit;
  end;

  //ManagerCRUD.UpdateTimes(StrToInt(selectedIdEdit.Text), startDate, endDate);
  ReloadData;
end;

procedure TTripFr.ClearButtonClick(Sender: TObject);
begin
     FullNameSearchEdit.Clear;
     TripNameSearchEdit.Clear;
     NumberPlateSearchEdit.Clear;
     VehicleTypeSearchComboBox.KeyValue := -1;

     SearchTripStartFrom.Clear;
     SearchTripStartTo.Clear;
     SearchTripEndFrom.Clear;
     SearchTripEndTo.Clear;

end;

procedure TTripFr.ClearSelectedData;
begin
  SelectedEndDateTimeEdit.Clear;
  SelectedTripNameEdit.Clear;
  SelectedDistanceEdit.Clear;
  SelectedVehicleTypeEdit.Clear;
  SelectedStartDateTimeEdit.Clear;
  SelectedFullNameComboBox.KeyValue := 0;
  SelectedNuberPlateComboBox.KeyValue := 0;
end;
 {
procedure TTripFr.AssignDriverAndTransportButtonClick(Sender: TObject);
begin
  if selectedIdEdit.Text <> '' then
  begin

    ManagerCRUD.UpdateTrip(StrToInt(selectedIdEdit.Text),
      SelectedNuberPlateComboBox.KeyValue,
      StrToInt(SelectedFullNameComboBox.KeyValue));

    ClearSelectedData;
    ReloadData;
  end;
end;

}
constructor TTripFr.Create(Owner: TComponent; TripQuery, TransportQuery,
  DriverQuery: TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TTripManager.Create(TripQuery);
  TransportManagerCRUD := TTransportManager.Create(TransportQuery);
  DriverManagerCRUD := TDriverManager.Create(DriverQuery);

  ManagerCRUD.LoadAll;
  //TransportManagerCRUD.LoadAvailableTransport;
  //DriverManagerCRUD.LoadAvailableDrivers;

end;

procedure TTripFr.DisableAllEdit;
begin
  SelectedEndDateTimeEdit.Enabled := False;
  SelectedStartDateTimeEdit.Enabled := False;
  SelectedFullNameComboBox.Enabled := False;
  SelectedNuberPlateComboBox.Enabled := False;
end;


procedure TTripFr.ReloadData;
begin
  ClearSelectedData;
  ManagerCRUD.LoadAll;
  ManagerCRUD.DisableFilter;
 // TransportManagerCRUD.LoadAvailableTransport;
 // DriverManagerCRUD.LoadAvailableDrivers;
end;


procedure TTripFr.LoadButtonClick(Sender: TObject);
begin
  ReloadData;
end;

procedure TTripFr.SearchByParam(Sender: TObject);
var
  StartTripDateTimeFrom, StartTripDateTimeTo,
  EndTripDateTimeFrom, EndTripDateTimeTo: TDateTime;
begin

  if ValidateDateTime(SearchTripStartFrom, StartTripDateTimeFrom)
     and ValidateDateTime(SearchTripStartTo, StartTripDateTimeTo)
     and ValidateDateTime(SearchTripEndFrom, EndTripDateTimeFrom)
     and ValidateDateTime(SearchTripEndTo, EndTripDateTimeTo) then
  begin

    ManagerCRUD.SearchByParam(
      NumberPlateSearchEdit.Text,
      TripNameSearchEdit.Text,
      FullNameSearchEdit.Text,
      VehicleTypeSearchComboBox.Text,
      StartTripDateTimeFrom,
      StartTripDateTimeTo,
      EndTripDateTimeFrom,
      EndTripDateTimeTo
    );
  end;
end;


procedure TTripFr.SelectedEndDateTimeEditExit(Sender: TObject);
begin
  ValidateDateTime(SelectedEndDateTimeEdit, endDate);
end;

procedure TTripFr.SelectedStartDateTimeEditExit(Sender: TObject);
begin
  ValidateDateTime(SelectedStartDateTimeEdit, startDate);
end;

procedure TTripFr.TripGridCellClick(Column: TColumn);
var
  vehicleTypeId, driver_id: Integer;
  numberPlate: String;
  startDateString, endDateString: string;
  // startDateTime, endDateTime: TDateTime;
begin
  DisableAllEdit;

  vehicleTypeId := TripGrid.DataSource.DataSet.FieldByName
    ('required_vehicle_type_id').AsInteger;
  numberPlate := TripGrid.DataSource.DataSet.FieldByName
    ('transport_id').AsString;
  driver_id := TripGrid.DataSource.DataSet.FieldByName('driver_id').AsInteger;

  // �������� ���������� ���������� � ��������� ��� ������� ���� ����������
 // TransportManagerCRUD.LoadAvailableTransportByType(vehicleTypeId, numberPlate);
 // DriverManagerCRUD.LoadAvailableDriversByType(vehicleTypeId, driver_id);

  SelectedNuberPlateComboBox.KeyValue := numberPlate;
  SelectedFullNameComboBox.KeyValue := driver_id;

  //selectedIdEdit.Text := TripGrid.DataSource.DataSet.FieldByName('id').AsString;
  SelectedTripNameEdit.Text := TripGrid.DataSource.DataSet.FieldByName
    ('route_name').AsString;
  SelectedDistanceEdit.Text := TripGrid.DataSource.DataSet.FieldByName
    ('distance').AsString;
  SelectedVehicleTypeEdit.Text := TripGrid.DataSource.DataSet.FieldByName
    ('type_name').AsString;

  startDateString := TripGrid.DataSource.DataSet.FieldByName
    ('start_datetime').AsString;
  endDateString := TripGrid.DataSource.DataSet.FieldByName
    ('end_datetime').AsString;

  SelectedStartDateTimeEdit.Text := ExtractDigits(startDateString);
  SelectedEndDateTimeEdit.Text := ExtractDigits(endDateString);

  ValidateDateTime(SelectedStartDateTimeEdit, startDate);
  ValidateDateTime(SelectedEndDateTimeEdit, endDate);

  if (SelectedStartDateTimeEdit.Text = '') and
    (SelectedEndDateTimeEdit.Text = '') then
  begin
    SelectedNuberPlateComboBox.Enabled := true;
    SelectedFullNameComboBox.Enabled := true;
    SelectedStartDateTimeEdit.Enabled := true;
  end
  else if (SelectedStartDateTimeEdit.Text <> '') and
    (SelectedEndDateTimeEdit.Text = '') then
  begin
    SelectedEndDateTimeEdit.Enabled := true;

  end;

end;

end.
