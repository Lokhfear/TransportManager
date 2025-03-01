unit TripRequestFrame;

interface

uses
  DBConnection,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus;

type
  TTripRequestFr = class(TFrame)
    BottomPanel: TPanel;
    PendingRequestDBGrid: TDBGrid;
    TopPanel: TPanel;
    GroupBox1: TGroupBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    CreateButton: TButton;
    DriverAndTransportGroupBox: TGroupBox;
    TransportGrid: TDBGrid;
    DriverGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
