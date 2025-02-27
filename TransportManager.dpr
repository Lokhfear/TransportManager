program TransportManager;

uses
  Vcl.Forms,
  HomeForm in 'HomeForm.pas' {Form1},
  DBConnection in 'DBConnection.pas' {DBConnect},
  ManagerCRUD in 'ManagerCRUD.pas',
  VehicleTypeFrame in 'Frames\VehicleTypeFrame.pas' {VehicleTypeFr: TFrame},
  TripFrame in 'Frames\TripFrame.pas' {TripFr: TFrame},
  TransportFrame in 'Frames\TransportFrame.pas' {TransportFr: TFrame},
  DriverFrame in 'Frames\DriverFrame.pas' {DriverFr: TFrame},
  TripRequestFrame in 'Frames\TripRequestFrame.pas' {TripRequestFr: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDBConnect, DBConnect);
  Application.Run;
end.
