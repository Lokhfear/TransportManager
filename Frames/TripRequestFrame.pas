unit TripRequestFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TTripRequestFr = class(TForm)
    BottomPanel: TPanel;
    PendingRequestDBGrid: TDBGrid;
    TopPanel: TPanel;
    SearchGroupBox: TGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TripRequestFr: TTripRequestFr;

implementation

{$R *.dfm}

end.
