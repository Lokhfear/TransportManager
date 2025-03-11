unit HomeForm;

interface

uses
  DBConnection, TripRequestFrame, VehicleTypeFrame, DriverFrame, TransportFrame, TripFrame,
  PendingTripRequestFrame, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Controls,
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
    procedure PageControlChange(Sender: TObject);
    procedure TripRequestPageControlChange(Sender: TObject);

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
  TripRequestFrame: TTripRequestFr;
  PendingTriptRequestFrame: TPendingTripRequestFr;

  DBConnect: TDBConnect;
begin
  DBConnect := TDBConnect.Create(nil);

  VehicleTypeFrame := TVehicleTypeFr.Create(Self, DBConnect.vehicleType);
  TripFrame := TTripFr.Create(Self, DBConnect.tripQuery, DBConnect.AvaibleTransportQuery,
   DBConnect.AvaibleDriverQuery);
  TransportFrame := TTransportFr.Create(Self, DBConnect.TransportQuery);
  DriverFrame := TDriverFr.Create(Self, DBConnect.DriverQuery,
    DBConnect.CheckListBoxQuery);
  PendingTriptRequestFrame := TPendingTripRequestFr.Create(Self, DBConnect.pendingRequest,
    DBConnect.AvaibleTransportQuery, DBConnect.AvaibleDriverQuery, DBConnect.tripQuery);
  TripRequestFrame := TTripRequestFr.Create(Self);


  TripFrame.Parent := TripPage;
  TransportFrame.Parent := transportPage;
  DriverFrame.Parent := driverPage;
  PendingTriptRequestFrame.Parent := PendingRequestPage;
  TripRequestFrame.Parent := TripRequestFrame;
  VehicleTypeFrame.Parent := VehicleTypePage;

end;

procedure TForm1.PageControlChange(Sender: TObject);
begin

  case PageControl.ActivePageIndex of

    1:
      TTransportFr(transportPage.Controls[0]).ReloadData;
    2:
      TDriverFr(driverPage.Controls[0]).ReloadData;
    3:
      TVehicleTypeFr(VehicleTypePage.Controls[0]).ReloadData;
    4:
      TTripFr(TripPage.Controls[0]).ReloadData;
  end;
end;


procedure TForm1.TripRequestPageControlChange(Sender: TObject);
begin
     case PageControl.ActivePageIndex of

    0:
      TPendingTripRequestFr(PendingRequestPage.Controls[0]).ReloadData;
    1:
     // TDriverFr(driverPage.Controls[0]).ReloadData;

  end;
end;

end.
