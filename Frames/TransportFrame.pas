unit TransportFrame;

interface

uses
  DBConnection,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TTransportFr = class(TFrame)
    Panel1: TPanel;
    DBGrid6: TDBGrid;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox2: TGroupBox;
    DBEdit5: TDBEdit;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    DBEdit6: TDBEdit;
    DateTimePicker2: TDateTimePicker;
    GroupBox3: TGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
