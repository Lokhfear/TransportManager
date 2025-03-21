unit CreateDriverModal;

interface

uses
  DBConnection,  FireDAC.Comp.Client, DriverLicensesFrame, DriverManager,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.ComCtrls,
  System.Generics.Collections,
  Datasnap.DBClient, Vcl.Mask, Vcl.ExtCtrls;

type
  TCreateDriver = class(TForm)
    FullNameCreateEdit: TEdit;
    employmentStartDatePicker: TDateTimePicker;
    FullNameLabel: TLabel;
    EmploymentStartDateLabel: TLabel;
    CreateButton: TButton;
    CancelButton: TButton;
    VehicleTypesLabel: TLabel;
    DriverLicensesPanel: TPanel;
    procedure CreateButtonClick(Sender: TObject);


  private
    ManagerCRUD: TDriverManager;
    DriverLicensesFrame: TDriverLicensesFr;

 

    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AManagerCRUD: TDriverManager; DriverLicensesQuery: TFDQuery);

    { Public declarations }
  end;

implementation

{$R *.dfm}

constructor TCreateDriver.Create(AOwner: TComponent;
  AManagerCRUD: TDriverManager; DriverLicensesQuery: TFDQuery);
begin
  inherited Create(AOwner);
  ManagerCRUD := AManagerCRUD;

  DriverLicensesFrame := TDriverLicensesFr.Create(Self, AManagerCRUD, DriverLicensesQuery);
  DriverLicensesFrame.Parent := DriverLicensesPanel;
  DriverLicensesFrame.Align := alClient;
  DriverLicensesFrame.ResizeColums(DriverLicensesPanel.Width);
end;

procedure TCreateDriver.CreateButtonClick(Sender: TObject);
var
  createdId: Integer;
begin

// DriverLicensesFrame.GetDriverLicensesFromGrid(DriverLicensesFrame.NewDriverLicenseData);
  try
  ModalResult := mrNone;

    if FullNameCreateEdit.Text <> '' then
    begin
      createdId := ManagerCRUD.Add(FullNameCreateEdit.Text,
        employmentStartDatePicker.Date);

         //  ShowMessage(IntToStr(createdId));

      ManagerCRUD.AddDriverLicenses(createdId,
        DriverLicensesFrame.NewDriverLicenseData.LicenseCategoryIDs,
        DriverLicensesFrame.NewDriverLicenseData.IssueDates,
        DriverLicensesFrame.NewDriverLicenseData.ExpirationDates);

         ModalResult := mrOk;
    end
    else
    begin
      ShowMessage('����������, ������� ��� ��������.');
    end;
  except
    on E: Exception do

      ShowMessage('������ ��� �������� �������� ��� ���������� ��������: ' + E.Message);
    end;
  end;
end.
