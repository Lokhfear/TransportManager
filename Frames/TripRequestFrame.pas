unit TripRequestFrame;

interface

uses
  TripRequestManager, DriverManager, TransportManage, TripManager, FireDAC.Comp.Client,
  DBConnection, Data.DB, Vcl.Menus, Vcl.StdCtrls, Vcl.Controls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, System.Classes, Vcl.ExtCtrls,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Forms,
  Vcl.Mask;

type
  TTripRequestFr = class(TFrame)
    BottomPanel: TPanel;
    PendingRequestDBGrid: TDBGrid;
    TopPanel: TPanel;
    GroupBox1: TGroupBox;
    CreateButton: TButton;
    DriverAndTransportGroupBox: TGroupBox;
    TransportGrid: TDBGrid;
    DriverGrid: TDBGrid;
    DriverDBLookupComboBox: TDBLookupComboBox;
    TransportDBLookupComboBox: TDBLookupComboBox;
    RequestIdDBEdit: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure PendingRequestDBGridCellClick(Column: TColumn);
    procedure CreateButtonClick(Sender: TObject);
    procedure DriverGridCellClick(Column: TColumn);
    procedure TransportGridCellClick(Column: TColumn);
  private
    { Private declarations }
    ManagerCRUD: TTripRequestManager;
    DriverManagerCRUD: TDriverManager;
    TransportManagerCRUD: TTransportManager;
    TripManagerCRUD: TTripManager;

    selectedRequestId: Integer;
    selectedRequestVehicleTypeId: Integer;

    procedure clearSelectedData();

  public
    constructor Create(Owner: TComponent; TripRequestQuery, TransportQuery,
      DriverQuery, TripQuery: TFDQuery);

    { Public declarations }
  end;

implementation

{$R *.dfm}

constructor TTripRequestFr.Create(Owner: TComponent;
  TripRequestQuery, TransportQuery, DriverQuery, TripQuery: TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TTripRequestManager.Create(TripRequestQuery);
  TransportManagerCRUD := TTransportManager.Create(TransportQuery);
  DriverManagerCRUD := TDriverManager.Create(DriverQuery);
  TripManagerCRUD := TTripManager.Create(TripQuery);

  ManagerCRUD.LoadAll;
  TransportManagerCRUD.LoadAvailableTransport;
  DriverManagerCRUD.LoadAvailableDrivers;

  clearSelectedData;
end;

procedure TTripRequestFr.CreateButtonClick(Sender: TObject);
begin
  // ���������, ��� ID ������ ����������
if (selectedRequestId = 0) or VarIsNull(DriverDBLookupComboBox.KeyValue) or VarIsNull(TransportDBLookupComboBox.KeyValue) then
     exit;
  TripManagerCRUD.Add(selectedRequestId, TransportDBLookupComboBox.KeyValue, DriverDBLookupComboBox.KeyValue);
  ManagerCRUD.UpdateStatus(selectedRequestId, '� ��������');

  clearSelectedData;

  DriverManagerCRUD.LoadAvailableDrivers;
  TransportManagerCRUD.LoadAvailableTransport;
end;



procedure TTripRequestFr.DriverGridCellClick(Column: TColumn);
begin
    DriverDBLookupComboBox.KeyValue := DriverGrid.DataSource.DataSet.FieldByName('id').AsInteger;
end;

procedure TTripRequestFr.clearSelectedData;
begin
  selectedRequestId := 0;
  selectedRequestVehicleTypeId := 0;
  DriverDBLookupComboBox.KeyValue := Null;
  TransportDBLookupComboBox.KeyValue := Null;
  RequestIdDBEdit.Clear;
end;



procedure TTripRequestFr.PendingRequestDBGridCellClick(Column: TColumn);
begin

  clearSelectedData;

  selectedRequestId := PendingRequestDBGrid.DataSource.DataSet.FieldByName('id')
    .AsInteger;
  selectedRequestVehicleTypeId := PendingRequestDBGrid.DataSource.DataSet.
    FieldByName('required_vehicle_type_id').AsInteger;


  DriverManagerCRUD.LoadAvailableDriversByType(selectedRequestVehicleTypeId);
  TransportManagerCRUD.LoadAvailableTransportByType
    (selectedRequestVehicleTypeId);
end;

procedure TTripRequestFr.TransportGridCellClick(Column: TColumn);
begin
 TransportDBLookupComboBox.KeyValue := TransportGrid.DataSource.DataSet.FieldByName('number_plate').AsString;
end;

end.
