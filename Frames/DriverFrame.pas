unit DriverFrame;

interface

uses
  DBConnection, DriverManager, Data.DB, FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TDriverFr = class(TFrame)
    DBGrid7: TDBGrid;
    Panel1: TPanel;
    searchGroupbox: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CreateButton: TButton;
    GroupBox3: TGroupBox;
    DeleteButton: TButton;
    ChangeButton: TButton;
    Edit1: TEdit;
    CheckListBox1: TCheckListBox;
  private
    ManagerCRUD: TDriverManager;
    { Private declarations }
  public
    constructor Create(Owner: TComponent; Query: TFDQuery);
    destructor Destroy;
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TDriverFr }

constructor TDriverFr.Create(Owner: TComponent; Query: TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TDriverManager.Create(Query);
  ManagerCRUD.LoadAll;
end;

destructor TDriverFr.Destroy;
begin
  inherited;
end;

end.
