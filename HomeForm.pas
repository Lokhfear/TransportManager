unit HomeForm;

interface

uses
  DBConnection,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    PageControl: TPageControl;
    TripRequestPage: TTabSheet;
    tripPage: TTabSheet;
    transportPage: TTabSheet;
    driverPage: TTabSheet;
    vehicleTypePage: TTabSheet;
    TripRequestPageControl: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    DBGrid1: TDBGrid;
    PendingTripRequest: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    searchVehicleTypeEdit: TEdit;
    CreateVehicleTypeButton: TButton;
    searchLabel: TLabel;
    addLabel: TLabel;
    CreateVehicleTypeLabel: TEdit;
    GridPanel1: TGridPanel;
    DBGrid4: TDBGrid;
    DBGrid3: TDBGrid;
    TripPanel: TPanel;
    DBGrid5: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Panel1: TPanel;
    DBGrid6: TDBGrid;
    Panel3: TPanel;
    DBGrid7: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
