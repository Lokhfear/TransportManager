unit HomeForm;

interface

uses
  DBConnection,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, VehicleTypeFrame;

type
  TForm1 = class(TForm)
    PageControl: TPageControl;
    TripRequestPage: TTabSheet;
    tripPage: TTabSheet;
    transportPage: TTabSheet;
    driverPage: TTabSheet;
    TripRequestPageControl: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    DBGrid1: TDBGrid;
    PendingTripRequest: TPanel;
    GridPanel1: TGridPanel;
    DBGrid4: TDBGrid;
    DBGrid3: TDBGrid;
    TripPanel: TPanel;
    DBGrid5: TDBGrid;
    DBNavigator2: TDBNavigator;
    Panel3: TPanel;
    DBGrid7: TDBGrid;
    Panel1: TPanel;
    DBGrid6: TDBGrid;
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
  VehicleTypeFrame: TVehicleTypeFrameForm;
begin
 VehicleTypeFrame := TVehicleTypeFrameForm.Create(Self);  // ������ ����� ������ �����

  // ��������� ����� � ������� VehicleTypePage
  VehicleTypeFrame.Parent := VehicleTypePage;
end;

end.
