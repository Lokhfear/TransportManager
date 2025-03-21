unit DriverFrame;

interface

uses
  DBConnection, Helper, DriverLicensesFrame, DriverManager, CreateDriverModal,
  LicenseCategoriesCheckboxManager, Data.DB, FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls, System.Generics.Collections;

type
  TDriverFr = class(TFrame)
    driverGrid: TDBGrid;
    BottomPanel: TPanel;
    UpperPanel: TPanel;
    ManipulationGroupBox: TGroupBox;
    CreateButton: TButton;
    DriverHistoryButton: TButton;
    LoadButton: TButton;
    ChangeButton: TButton;
    SearchBoxGroupBox: TGroupBox;
    FullNameSearchEdit: TEdit;
    EditGroupbox: TGroupBox;
    SelectedLicenseCategoriesEdit: TEdit;
    SelectedFullNameEdit: TEdit;
    FullNameLabel: TLabel;
    DriverLicensesPanel: TPanel;
    ClearButton: TButton;
    SelectedEmploymentStartEdit: TMaskEdit;
    SelectedEmploymentEndEdit: TMaskEdit;
    SearchStartWorkDateFrom: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    SearchStartWorkDateTo: TMaskEdit;
    SearchEndWorkDateFrom: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    SearchEndWorkDateTo: TMaskEdit;
    Label5: TLabel;
    LicenseCategoriesCheckBox: TCheckListBox;
    procedure DeleteButtonClick(Sender: TObject);
    procedure driverGridCellClick(Column: TColumn);
    procedure CreateButtonClick(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure SearchByParam(Sender: TObject);
    procedure ReloadData();
    procedure ClearSelectedData;
    procedure ClearButtonClick(Sender: TObject);
  private
    DriverLicensesQuery: TFDQuery;

    selectedId: Integer;
    DriverLicensesFrame: TDriverLicensesFr;
    SelectedAssignedVehicleTypes: TList<Integer>;

    ManagerCRUD: TDriverManager;
    CheckBoxManager: LicenseCategoriesCheckbox;


  public
    constructor Create(Owner: TComponent;  DriverQuery, TDriverLicensesQuery, licenseCategoryQuery: TFDQuery);
    destructor Destroy;
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TDriverFr }

procedure TDriverFr.ClearButtonClick(Sender: TObject);
begin
  FullNameSearchEdit.Clear;

  SearchStartWorkDateFrom.Clear;
  SearchStartWorkDateTo.Clear;
  SearchEndWorkDateFrom.Clear;
  SearchEndWorkDateTo.Clear;

  ManagerCRUD.DisableFilter;
end;

procedure TDriverFr.ClearSelectedData;
begin
  SelectedFullNameEdit.Clear;
  SelectedEmploymentStartEdit.Clear;
  SelectedLicenseCategoriesEdit.Clear;
  selectedId := -1;
end;



procedure TDriverFr.SearchByParam(Sender: TObject);
var
StartWorkDateFrom, StartWorkDateTo,
EndWorkDateFrom, EndWorkDateTo : TDate;
begin

  ValidateDate(SearchStartWorkDateFrom, StartWorkDateFrom);
  ValidateDate(SearchStartWorkDateTo, StartWorkDateTo);
  ValidateDate(SearchEndWorkDateFrom, EndWorkDateFrom);
  ValidateDate(SearchEndWorkDateTo, EndWorkDateTo);

  ManagerCRUD.SearchByParam(FullNameSearchEdit.Text,
  StartWorkDateFrom, StartWorkDateTo,
  EndWorkDateFrom, EndWorkDateTo);

end;






constructor TDriverFr.Create(Owner: TComponent;  DriverQuery, TDriverLicensesQuery, licenseCategoryQuery: TFDQuery);
begin
  inherited Create(Owner);
  DriverLicensesQuery :=  TDriverLicensesQuery;

  //CheckBoxManager := LicenseCategoriesCheckbox.Create(LicenseCategoriesCheckBox, licenseCategoryQuery);
  //CheckBoxManager.LoadVehicleTypes;


  ManagerCRUD := TDriverManager.Create(DriverQuery);
  ManagerCRUD.LoadAll;

  DriverLicensesFrame := TDriverLicensesFr.Create(Self, ManagerCRUD, TDriverLicensesQuery);
  DriverLicensesFrame.Parent := DriverLicensesPanel;
  DriverLicensesFrame.DriverLicenseStringGrid.ColWidths[0] := 0;
  DriverLicensesFrame.align := alClient;
  DriverLicensesFrame.ResizeColums(DriverLicensesPanel.Width);

end;






procedure TDriverFr.CreateButtonClick(Sender: TObject);
var
  CreateDriverForm: TCreateDriver;
begin
try
    CreateDriverForm := TCreateDriver.Create(Self, ManagerCRUD, DriverLicensesQuery);
    CreateDriverForm.ShowModal();
    ManagerCRUD.LoadAll;

finally
      CreateDriverForm.Free;
  end;
end;

procedure TDriverFr.DeleteButtonClick(Sender: TObject);
var
  selectedId: Integer;
begin
  if driverGrid.SelectedRows.Count = 1 then
  begin
    selectedId := driverGrid.DataSource.DataSet.FieldByName('id').AsInteger;
    ManagerCRUD.Delete(selectedId, true);
  end
  else
    ShowMessage('��� ��������� ����� ��� �� ������ �����');
end;

destructor TDriverFr.Destroy;
begin
  inherited;
end;

procedure TDriverFr.driverGridCellClick(Column: TColumn);
begin
   SelectedFullNameEdit.Text := driverGrid.DataSource.DataSet.FieldByName('full_name').AsString;
   selectedId := driverGrid.DataSource.DataSet.FieldByName('id').AsInteger;
   SelectedLicenseCategoriesEdit.Text :=  driverGrid.DataSource.DataSet.FieldByName('license_categories').AsString;
   SelectedEmploymentStartEdit.Text :=  driverGrid.DataSource.DataSet.FieldByName('employment_start').AsString;
   SelectedEmploymentEndEdit.Text :=  driverGrid.DataSource.DataSet.FieldByName('employment_end').AsString;

   DriverLicensesFrame.LoadDriverLicenses(selectedId);


end;


procedure TDriverFr.LoadButtonClick(Sender: TObject);
begin
ManagerCRUD.LoadAll;
end;

procedure TDriverFr.ReloadData;
begin
    ClearSelectedData;
    ManagerCRUD.LoadAll;
    ManagerCRUD.DisableFilter;
end;

procedure TDriverFr.ChangeButtonClick(Sender: TObject);
var
endDate: Tdate;
begin


  if ValidateDate(SelectedEmploymentEndEdit, endDate) and (SelectedFullNameEdit.Text <> '') and (selectedId <> -1) then
    begin
      ManagerCRUD.Update(selectedId, SelectedFullNameEdit.Text, endDate);
      DriverLicensesFrame.UpdateDriverLicenses(selectedId);
    end
    else
      DriverLicensesFrame.UpdateDriverLicenses(selectedId);

  selectedId := -1;
  SelectedFullNameEdit.Text := '';


end;


end.
