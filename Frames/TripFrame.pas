unit TripFrame;

interface

uses
  DriverManager, TransportManage, TripManager, Vcl.Controls,
  FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TTripFr = class(TFrame)
    TripPanel: TPanel;
    TopPanel: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    SetDatesButton: TButton;
    GroupBox4: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    ReassignButton: TButton;
    TripGrid: TDBGrid;
  private
    { Private declarations }
    ManagerCRUD: TTripManager;
    DriverManagerCRUD: TDriverManager;
    TransportManagerCRUD: TTransportManager;

  public
    constructor Create(Owner: TComponent; TripQuery, TransportQuery,
      DriverQuery: TFDQuery);
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TTripFr }

constructor TTripFr.Create(Owner: TComponent; TripQuery, TransportQuery,
  DriverQuery: TFDQuery);
begin
  ManagerCRUD := TTripManager.Create(TripQuery);
  TransportManagerCRUD := TTransportManager.Create(TransportQuery);
  DriverManagerCRUD := TDriverManager.Create(DriverQuery);

  ManagerCRUD.LoadAll;
  TransportManagerCRUD.LoadAvailableTransport;
  DriverManagerCRUD.LoadAvailableDrivers;

end;

end.
