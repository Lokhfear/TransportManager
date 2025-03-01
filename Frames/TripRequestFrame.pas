unit TripRequestFrame;

interface

uses
  TripRequestManager, DriverManager, TransportManage, FireDAC.Comp.Client,
  DBConnection, Data.DB, Vcl.Menus, Vcl.StdCtrls, Vcl.Controls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, System.Classes, Vcl.ExtCtrls,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Forms;

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
    TransportDBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    procedure PendingRequestDBGridCellClick(Column: TColumn);
    procedure CreateButtonClick(Sender: TObject);
  private
    { Private declarations }
    ManagerCRUD: TTripRequestManager;
    DriverManagerCRUD: TDriverManager;
    TransportManagerCRUD: TTransportManager;

    selectedRequestId: Integer;
    selectedRequestVehicleTypeId: Integer;

  public
    constructor Create(Owner: TComponent; TripRequestQuery, TransportQuery,
      DriverQuery: TFDQuery);

    { Public declarations }
  end;

implementation

{$R *.dfm}

constructor TTripRequestFr.Create(Owner: TComponent;
  TripRequestQuery, TransportQuery, DriverQuery: TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TTripRequestManager.Create(TripRequestQuery);
  TransportManagerCRUD := TTransportManager.Create(TransportQuery);
  DriverManagerCRUD := TDriverManager.Create(DriverQuery);

  ManagerCRUD.LoadAll;
  TransportManagerCRUD.LoadAvailableTransport;
  DriverManagerCRUD.LoadAvailableDrivers;

end;

procedure TTripRequestFr.CreateButtonClick(Sender: TObject);
begin

  if (selectedRequestId <> null) and (DriverDBLookupComboBox.KeyValue <> null) and
    (DriverDBLookupComboBox.KeyValue <> null) then
  begin

    //create trip

    selectedRequestId := null;
    selectedRequestVehicleTypeId := null;
    Label1.Caption := '� ��������� ������:';

    DriverManagerCRUD.LoadAvailableDrivers;
    TransportManagerCRUD.LoadAvailableTransport;
  end;

end;

procedure TTripRequestFr.PendingRequestDBGridCellClick(Column: TColumn);
begin
  selectedRequestId := PendingRequestDBGrid.DataSource.DataSet.FieldByName('id')
    .AsInteger;
  selectedRequestVehicleTypeId := PendingRequestDBGrid.DataSource.DataSet.
    FieldByName('required_vehicle_type_id').AsInteger;

  Label1.Caption := '� ��������� ������:' + selectedRequestId.ToString;

  DriverManagerCRUD.LoadAvailableDriversByType(selectedRequestVehicleTypeId);
  TransportManagerCRUD.LoadAvailableTransportByType
    (selectedRequestVehicleTypeId);
end;

end.
