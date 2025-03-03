unit TransportFrame;

interface

uses
  DBConnection, CreateTransportModal,
  TransportManage, FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TTransportFr = class(TFrame)
    BottomPanel: TPanel;
    TransportDBGrid: TDBGrid;
    TopPanel: TPanel;
    ManipulationGroupBox: TGroupBox;
    EditGroupBox: TGroupBox;
    SelectedVehicleTypeEdit: TEdit;
    SelectedEndExploitationDateTimePicker: TDateTimePicker;
    SelectedStartExploitationDateTimePicker: TDateTimePicker;
    SelectedNumberPlateEdit: TEdit;
    SearchGroupBox: TGroupBox;
    VehicleTypeCreateLabel: TLabel;
    NumberPlateCreateLabel: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CreateButton: TButton;
    DeleteButton: TButton;
    LoadButton: TButton;
    ChangeButton: TButton;
    TransportHistoryButton: TButton;

    constructor Create(Owner: TComponent; Query: TFDQuery);
    procedure TransportDBGridCellClick(Column: TColumn);
    procedure ChangeButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
  private
    { Private declarations }
    ManagerCRUD: TTransportManager;
    //selectedNumberPlate: string;
    //selectedEndExploitationDate: TDate;
    procedure clearData;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TTransportFr.clearData;
begin
    SelectedVehicleTypeEdit.Clear;
    SelectedNumberPlateEdit.Clear;
    SelectedEndExploitationDateTimePicker.date := date;
    SelectedStartExploitationDateTimePicker.date := date;
end;

procedure TTransportFr.ChangeButtonClick(Sender: TObject);
begin

  //Невозможно поставить null в end_exploitation из-за dataPicker
  if SelectedNumberPlateEdit.Text = '' then
  begin
    exit;
    ShowMessage('Выберите транспорт');
  end;
  
  ManagerCRUD.Update(SelectedNumberPlateEdit.Text,
  SelectedEndExploitationDateTimePicker.Date)
  
end;

constructor TTransportFr.Create(Owner: TComponent; Query: TFDQuery);
begin
  inherited Create(Owner);
  ManagerCRUD := TTransportManager.Create(Query);
  ManagerCRUD.LoadAll;

  clearData;

end;

procedure TTransportFr.CreateButtonClick(Sender: TObject);
var 
  CreateTransportForm: TCreateTransport;
begin

  try
    CreateTransportForm := TCreateTransport.Create(Self, ManagerCRUD);
    CreateTransportForm.ShowModal();
    ManagerCRUD.LoadAll;

finally
      CreateTransportForm.Free;
  end;
  
end;



procedure TTransportFr.LoadButtonClick(Sender: TObject);
begin
  ManagerCRUD.LoadAll;
end;

procedure TTransportFr.TransportDBGridCellClick(Column: TColumn);
begin
  SelectedNumberPlateEdit.Text := TransportDBGrid.DataSource.DataSet.FieldByName
    ('number_plate').AsString;
  SelectedVehicleTypeEdit.Text := TransportDBGrid.DataSource.DataSet.FieldByName
    ('type_name').AsString;
  SelectedEndExploitationDateTimePicker.Date :=
    Trunc(TransportDBGrid.DataSource.DataSet.FieldByName('end_exploitation')
    .AsDateTime);
  SelectedStartExploitationDateTimePicker.Date :=
    Trunc(TransportDBGrid.DataSource.DataSet.FieldByName('start_exploitation')
    .AsDateTime);

end;

end.
