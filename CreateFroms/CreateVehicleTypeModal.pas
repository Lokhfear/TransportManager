unit CreateVehicleTypeModal;

interface

uses
  VehicleTypeManager, DBConnection,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TCreateVhicleType = class(TForm)
    CancelButton: TButton;
    CreateButton: TButton;
    typeNameEdit: TEdit;
    TypeNameLabel: TLabel;
    Label1: TLabel;
    LicenseCategoryComboBox: TDBLookupComboBox;
    procedure CreateButtonClick(Sender: TObject);
  private
    ManagerCrud: TVehicleTypeManager;
  public
    constructor Create(Owner: TComponent; TManagerCrud: TVehicleTypeManager);
  end;



implementation

{$R *.dfm}
{ TForm2 }

constructor TCreateVhicleType.Create(Owner: TComponent; TManagerCrud: TVehicleTypeManager);
begin
  inherited Create(Owner);
  ManagerCrud := TManagerCrud;
end;


procedure TCreateVhicleType.CreateButtonClick(Sender: TObject);
begin
  if (typeNameEdit.Text <> '') and  not VarIsNull(LicenseCategoryComboBox.KeyValue)  then
    ManagerCrud.Add(typeNameEdit.Text, LicenseCategoryComboBox.KeyValue);

  typeNameEdit.Clear;
  ManagerCrud.LoadAll;
end;

end.
