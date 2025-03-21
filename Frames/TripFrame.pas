unit TripFrame;

interface

uses
  DBConnection, DriverManager, TransportManage, TripManager, Vcl.Controls,
  FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TTripFr = class(TFrame)
    TripPanel: TPanel;
    TopPanel: TPanel;
    searchBox: TGroupBox;
    GroupBox2: TGroupBox;
    TripGrid: TDBGrid;
    GroupBox5: TGroupBox;
    AssignDriverAndTransportButton: TButton;
    LoadButton: TButton;
    selectedIdEdit: TEdit;
    SelectedTripNameEdit: TEdit;
    SelectedDistanceEdit: TEdit;
    Button1: TButton;
    SelectedFullNameComboBox: TDBLookupComboBox;
    SelectedNuberPlateComboBox: TDBLookupComboBox;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    SelectedVehicleTypeEdit: TEdit;
    SelectedStartDateTimeEdit: TMaskEdit;
    SelectedEndDateTimeEdit: TMaskEdit;
    procedure TripGridCellClick(Column: TColumn);
    procedure AssignDriverAndTransportButtonClick(Sender: TObject);
    procedure SetStartOrEndDateTimeButoonClick(Sender: TObject);
    procedure SelectedStartDateTimeEditExit(Sender: TObject);
    procedure SelectedEndDateTimeEditExit(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ReloadData();
    procedure ClearSelectedData();

  private
    { Private declarations }
    ManagerCRUD: TTripManager;
    DriverManagerCRUD: TDriverManager;
    TransportManagerCRUD: TTransportManager;

    startDate, endDate: TDateTime;

    procedure ValidateDateTime(MaskEdit: TMaskEdit; var OutDateTime: TDateTime);
    function ExtractDigits(const Input: string): string;
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

procedure TTripFr.ClearSelectedData;
begin
  selectedIdEdit.Clear;
  SelectedEndDateTimeEdit.Clear;
  SelectedTripNameEdit.Clear;
  SelectedDistanceEdit.Clear;
  SelectedVehicleTypeEdit.Clear;
  SelectedStartDateTimeEdit.Clear;
  SelectedFullNameComboBox.KeyValue := 0;
  SelectedNuberPlateComboBox.KeyValue := 0;
end;

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

// ����� ReadOnly?
procedure TTripFr.DisableAllEdit;
begin
  SelectedEndDateTimeEdit.Enabled := False;
  SelectedStartDateTimeEdit.Enabled := False;
  SelectedFullNameComboBox.Enabled := False;
  SelectedNuberPlateComboBox.Enabled := False;
end;

function TTripFr.ExtractDigits(const Input: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Input) do
  begin
    if CharInSet(Input[i], ['0' .. '9']) then
      Result := Result + Input[i];
  end;
end;

procedure TTripFr.LoadButtonClick(Sender: TObject);
begin
  ReloadData;
end;

procedure TTripFr.ReloadData;
begin
  ClearSelectedData;
  ManagerCRUD.LoadAll;
  ManagerCRUD.DisableFilter;
 // TransportManagerCRUD.LoadAvailableTransport;
 // DriverManagerCRUD.LoadAvailableDrivers;
end;


procedure TTripFr.ValidateDateTime(MaskEdit: TMaskEdit;
  var OutDateTime: TDateTime);
begin
  if MaskEdit.Text = '' then
  begin
    OutDateTime := 0;
    exit;
  end;

  try
    OutDateTime := StrToDateTime(MaskEdit.EditText);
  except
    on E: EConvertError do
    begin
      MaskEdit.Clear;
      ShowMessage('�������� ������ ���� � �������');
    end;
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

  selectedIdEdit.Text := TripGrid.DataSource.DataSet.FieldByName('id').AsString;
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
