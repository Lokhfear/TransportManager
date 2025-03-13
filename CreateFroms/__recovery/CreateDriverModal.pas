unit CreateDriverModal;

interface

uses
  DBConnection, DriverManager, DriverVehicleTypeCheckManager,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.ComCtrls, System.Generics.Collections;

type
  TCreateDriver = class(TForm)
    FullNameCreateEdit: TEdit;
    employmentStartDatePicker: TDateTimePicker;
    VehicleTypeCheckListBox: TCheckListBox;
    FullNameLabel: TLabel;
    EmploymentStartDateLabel: TLabel;
    CreateButton: TButton;
    CancelButton: TButton;
    VehicleTypesLabel: TLabel;
    procedure CreateButtonClick(Sender: TObject);
    procedure FullNameLabelClick(Sender: TObject);
  private
    ManagerCRUD: TDriverManager;
    CheckListBoxManager: VehicleTypesCheckBoxListManager;

    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AManagerCRUD: TDriverManager;
      ACheckListBoxManager: VehicleTypesCheckBoxListManager);

    { Public declarations }
  end;

implementation

{$R *.dfm}

constructor TCreateDriver.Create(AOwner: TComponent;
  AManagerCRUD: TDriverManager;
  ACheckListBoxManager: VehicleTypesCheckBoxListManager);
begin
  inherited Create(AOwner);
  ManagerCRUD := AManagerCRUD;
  CheckListBoxManager :=  ACheckListBoxManager;

  CheckListBoxManager.AssignCheckListBox(VehicleTypeCheckListBox);
  CheckListBoxManager.LoadVehicleTypes;
end;

procedure TCreateDriver.CreateButtonClick(Sender: TObject);
var createdId: integer;
begin
    if FullNameCreateEdit.Text <> '' then
  begin
    createdId:= ManagerCRUD.Add(FullNameCreateEdit.Text, employmentStartDatePicker.Date);
    ManagerCRUD.UpdateDriverVehicleTypes(createdId, TList<Integer>.Create, CheckListBoxManager.GetSelectedVehicleTypes);

  end;
end;

procedure TCreateDriver.FullNameLabelClick(Sender: TObject);
begin

end;

end.
