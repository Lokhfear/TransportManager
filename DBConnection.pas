unit DBConnection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDBConnect = class(TForm)
    FDConnection1: TFDConnection;
    pendingRequest: TFDQuery;
    tripRequestDataSource: TDataSource;
    VehicleTypeDataSource: TDataSource;
    TransportQuery: TFDQuery;
    TransportDataSource: TDataSource;
    DriverQuery: TFDQuery;
    tripQuery: TFDQuery;
    DriverDataSource: TDataSource;
    tripDataSource: TDataSource;
    AvaibleDriverQuery: TFDQuery;
    AvaibleTransportQuery: TFDQuery;
    AvaibleTransportDataSource: TDataSource;
    AvaibleDriverDataSource: TDataSource;
    CheckListBoxQuery: TFDQuery;
    vehicleType: TFDQuery;
    licenseCategoryQuery: TFDQuery;
    licenseCategoryDataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  DBConnect: TDBConnect;

implementation

{$R *.dfm}


constructor TDBConnect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;


end.


