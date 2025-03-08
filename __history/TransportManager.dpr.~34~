program TransportManager;

uses
  Vcl.Forms,
  HomeForm in 'HomeForm.pas' {Form1},
  DBConnection in 'DBConnection.pas' {DBConnect},
  ManagerCRUD in 'Managers\ManagerCRUD.pas',
  VehicleTypeFrame in 'Frames\VehicleTypeFrame.pas' {VehicleTypeFr: TFrame},
  TripFrame in 'Frames\TripFrame.pas' {TripFr: TFrame},
  TransportFrame in 'Frames\TransportFrame.pas' {TransportFr: TFrame},
  DriverFrame in 'Frames\DriverFrame.pas' {DriverFr: TFrame},
  TripRequestFrame in 'Frames\TripRequestFrame.pas' {TripRequestFr: TFrame},
  VehicleTypeManager in 'Managers\VehicleTypeManager.pas',
  DriverManager in 'Managers\DriverManager.pas',
  TransportManage in 'Managers\TransportManage.pas',
  TripManager in 'Managers\TripManager.pas',
  TripRequestManager in 'Managers\TripRequestManager.pas',
  CreateVehicleTypeModal in 'CreateFroms\CreateVehicleTypeModal.pas' {CreateVhicleType},
  CreateTransportModal in 'CreateFroms\CreateTransportModal.pas' {CreateTransport},
  CreateDriverModal in 'CreateFroms\CreateDriverModal.pas' {CreateDriver},
  DriverVehicleTypeCheckManager in 'Managers\DriverVehicleTypeCheckManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDBConnect, DBConnect);
  //Application.CreateForm(TCreateDriver, CreateDriver);
  //Application.CreateForm(TCreateVhicleType, CreateVhicleType);
  //Application.CreateForm(TCreateTransport, CreateTransport);
  Application.Run;
end.
