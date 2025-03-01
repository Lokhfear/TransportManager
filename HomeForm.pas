unit HomeForm;

interface

uses
  DBConnection, VehicleTypeFrame, TripFrame, TransportFrame, DriverFrame, TripRequestFrame, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Controls,
  Vcl.ComCtrls, System.Classes, Vcl.Forms, Vcl.Dialogs;


type
  TForm1 = class(TForm)
    PageControl: TPageControl;
    TripRequestPage: TTabSheet;
    tripPage: TTabSheet;
    transportPage: TTabSheet;
    driverPage: TTabSheet;
    TripRequestPageControl: TPageControl;
    PendingRequestPage: TTabSheet;
    AllRequestPage: TTabSheet;
    VehicleTypePage: TTabSheet;
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



  VehicleTypeFrame := TVehicleTypeFr.Create(Self, DBConnect.VehicleType);
  TripFrame := TTripFr.Create(Self);
  TransportFrame := TTransportFr.Create(Self, DBConnect.TransportQuery);
  DriverFrame := TDriverFr.Create(Self, DBConnect.DriverQuery, DBConnect.FDConnection1);
  TriptRequestFrame := TTripRequestFr.Create(Self);


  VehicleTypeFrame.Parent := VehicleTypePage;
 // TripFrame.Parent := TripPage;
  TransportFrame.Parent := TransportPage;
  DriverFrame.Parent := DriverPage;
  TriptRequestFrame.Parent := TripRequestPage;

end;

end.
