unit CreateTransportModal;

interface

uses
  DBConnection, TransportManage,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TCreateTransport = class(TForm)
    NumberPlateCreateEdit: TEdit;
    StartExploitationCreateDateTimePicker: TDateTimePicker;
    CancelButton: TButton;
    CreateButton: TButton;
    VehicleTypeDBLookupComboBox: TDBLookupComboBox;
    NumberPlateLabel: TLabel;
    startDateLabel: TLabel;
    VehicleTypeLabel: TLabel;
    Label1: TLabel;
    TransportBrandLookupComboBox: TDBLookupComboBox;
    procedure CreateButtonClick(Sender: TObject);
  private
    ManagerCrud: TTransportManager;
  public
    constructor Create(Owner: TComponent; TManagerCrud: TTransportManager);
  end;

implementation

{$R *.dfm}

constructor TCreateTransport.Create(Owner: TComponent; TManagerCrud: TTransportManager);
begin
  inherited Create(Owner);
  ManagerCrud := TManagerCrud;

  StartExploitationCreateDateTimePicker.Date := date;
 // EndExploitationCreateDateTimePicker.Date := date;
end;

procedure TCreateTransport.CreateButtonClick(Sender: TObject);
begin
 // ��������: (��������� �� ���-�� ��������?)
if (Length(NumberPlateCreateEdit.Text) = 6) and
   (not VarIsClear(VehicleTypeDBLookupComboBox.KeyValue))
   and (not VarIsClear(TransportBrandLookupComboBox.KeyValue)) then
  begin
    ManagerCRUD.Add(NumberPlateCreateEdit.Text,
      StartExploitationCreateDateTimePicker.Date,
      VehicleTypeDBLookupComboBox.KeyValue,
      TransportBrandLookupComboBox.KeyValue);

    NumberPlateCreateEdit.Clear;
    VehicleTypeDBLookupComboBox.KeyValue := null;
    TransportBrandLookupComboBox.KeyValue := null;
    StartExploitationCreateDateTimePicker.Date := Date;
    //EndExploitationCreateDateTimePicker.Date := date;
    ModalResult := mrOk;
  end
 else
     ModalResult := mrNone;
end;

end.

