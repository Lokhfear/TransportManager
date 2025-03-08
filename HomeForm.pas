unit HomeForm;

interface

uses
  DBConnection, VehicleTypeFrame, DriverFrame, TransportFrame, TripFrame,
  TripRequestFrame, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Controls,
  Vcl.ComCtrls, System.Classes, Vcl.Forms, Vcl.Dialogs;

type
  TForm1 = class(TForm)
    PageControl: TPageControl;
    TripRequestPage: TTabSheet;
    transportPage: TTabSheet;
    driverPage: TTabSheet;
    TripRequestPageControl: TPageControl;
    PendingRequestPage: TTabSheet;
    AllRequestPage: TTabSheet;
    VehicleTypePage: TTabSheet;
    TripPage: TTabSheet;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  VehicleTypeFrame: TVehicleTypeFr;
  TripFrame: TTripFr;
  TransportFrame: TTransportFr;
  DriverFrame: TDriverFr;
  TriptRequestFrame: TTripRequestFr;

  DBConnect: TDBConnect;
begin
  DBConnect := TDBConnect.Create(nil);

  VehicleTypeFrame := TVehicleTypeFr.Create(Self, DBConnect.vehicleType);
  TripFrame := TTripFr.Create(Self, DBConnect.tripQuery, DBConnect.AvaibleTransportQuery,
   DBConnect.AvaibleDriverQuery);
  TransportFrame := TTransportFr.Create(Self, DBConnect.TransportQuery);
  DriverFrame := TDriverFr.Create(Self, DBConnect.DriverQuery,
    DBConnect.CheckListBoxQuery);
  TriptRequestFrame := TTripRequestFr.Create(Self, DBConnect.pendingRequest,
    DBConnect.AvaibleTransportQuery, DBConnect.AvaibleDriverQuery, DBConnect.tripQuery);

  TripFrame.Parent := TripPage;
  TransportFrame.Parent := transportPage;
  DriverFrame.Parent := driverPage;
  TriptRequestFrame.Parent := TripRequestPage;
  VehicleTypeFrame.Parent := VehicleTypePage;

end;

end.
