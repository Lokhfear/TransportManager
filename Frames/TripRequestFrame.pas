unit TripRequestFrame;

interface

uses DBConnection, FireDAC.Comp.Client, TripRequestManager, helper,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TTripRequestFr = class(TFrame)

    RequestDBGrid: TDBGrid;
    TopPanel: TPanel;
    BottomPanel: TPanel;
    SearchGroupBox: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    VehicleTypeSearchComboBox: TDBLookupComboBox;
    TripNameSearchEdit: TEdit;
    CreateTimeSearchEditFrom: TMaskEdit;
    SearchTripStartTo: TMaskEdit;
    SearchTripStartFrom: TMaskEdit;
    SearchTripEndFrom: TMaskEdit;
    SearchTripEndTo: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    ClearButton: TButton;
    LoadButton: TButton;
    CreateTimeSearchEditTo: TMaskEdit;
    Label9: TLabel;
    procedure ClearButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ConfigureDBGridColumns;
  private
     ManagerCRUD: TTripRequestManager;
    { Private declarations }
  public
     constructor Create(Owner: TComponent; TripRequestQuery : TFDQuery);

     procedure ReloadData;
  published
    procedure SearchByParam(Sender: TObject);

  end;

implementation

{$R *.dfm}

{ TTripRequestFr }

procedure TTripRequestFr.ClearButtonClick(Sender: TObject);
begin
  TripNameSearchEdit.Clear;
  CreateTimeSearchEditTo.Clear;
  CreateTimeSearchEditFrom.Clear;
  VehicleTypeSearchComboBox.KeyValue := -1;
  SearchTripStartFrom.Clear;
  SearchTripStartTo.Clear;
  SearchTripEndFrom.Clear;
  SearchTripEndTo.Clear;

  ManagerCRUD.DisableFilter;
end;

constructor TTripRequestFr.Create(Owner: TComponent; TripRequestQuery : TFDQuery);
begin
    inherited Create(Owner);
    ManagerCRUD := TTripRequestManager.Create(TripRequestQuery);
    ManagerCRUD.LoadAllTripRequest;
    ConfigureDBGridColumns;
end;



procedure TTripRequestFr.LoadButtonClick(Sender: TObject);
begin
ReloadData;
end;

procedure TTripRequestFr.ReloadData;
begin
 ManagerCRUD.LoadAllTripRequest;
end;

procedure TTripRequestFr.SearchByParam(Sender: TObject);
var
  CreateDateFrom, CreateDateTo,
  TripStartFrom, TripStartTo,
  TripEndFrom, TripEndTo: TDate;
begin

  if ValidateDate(CreateTimeSearchEditFrom, CreateDateFrom) and
     ValidateDate(CreateTimeSearchEditTo, CreateDateTo) and
     ValidateDate(SearchTripStartFrom, TripStartFrom) and
     ValidateDate(SearchTripStartTo, TripStartTo) and
     ValidateDate(SearchTripEndFrom, TripEndFrom) and
     ValidateDate(SearchTripEndTo, TripEndTo) then
  begin
    ManagerCRUD.SearchByParams(
      TripNameSearchEdit.Text,
      VehicleTypeSearchComboBox.Text,
      CreateDateFrom, CreateDateTo,
      TripStartFrom, TripStartTo,
      TripEndFrom, TripEndTo
    );
  end
  else
  begin
    ShowMessage('Ошибка в формате даты. Пожалуйста, проверьте введённые данные.');
  end;
end;



procedure TTripRequestFr.ConfigureDBGridColumns;
var
  TotalWidth: Integer;
begin

  TotalWidth := RequestDBGrid.ClientWidth;


  RequestDBGrid.Columns[0].Visible := False;
  RequestDBGrid.Columns[5].Visible := False;

  RequestDBGrid.Columns[1].Width := Trunc(TotalWidth * 0.15);
  RequestDBGrid.Columns[2].Width := Trunc(TotalWidth * 0.07);
  RequestDBGrid.Columns[3].Width := Trunc(TotalWidth * 0.10);
  RequestDBGrid.Columns[4].Width := Trunc(TotalWidth * 0.13);
  RequestDBGrid.Columns[6].Width := Trunc(TotalWidth * 0.20);
  RequestDBGrid.Columns[7].Width := Trunc(TotalWidth * 0.15);
  RequestDBGrid.Columns[8].Width := Trunc(TotalWidth * 0.15);
end;
end.
