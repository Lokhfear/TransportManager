unit DriverLicensesFrame;

interface

uses
  DriverManager,  FireDAC.Comp.Client,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBCtrls, Vcl.Mask;

type
  TDriverLicenseData = class
  public
    DriverID: Integer;
    LicenseCategoryIDs: TArray<Integer>;
    LicenseCategoryNames: TArray<string>;
    IssueDates: TArray<TDate>;
    ExpirationDates: TArray<TDate>;
  end;

  TDriverLicensesFr = class(TFrame)
    DriverLicenseStringGrid: TStringGrid;
    Panel: TPanel;
    BottonPanel: TPanel;
    EditButton: TButton;
    addButton: TButton;
    DeleteButton: TButton;
    EditPanel: TPanel;
    LicenseCategoryComboBox: TDBLookupComboBox;
    issueDateEditMask: TMaskEdit;
    expirationDateEditMask: TMaskEdit;
    procedure addButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ClearData();
    procedure GetDriverLicensesFromGrid(var Data: TDriverLicenseData);
    procedure LoadDriverLicenses(DriverID: Integer);
  private
    ManagerCrud: TDriverManager;
    FQuery: TFDQuery;

    procedure AddRowToStringGrid(category: String;
      issueDate, expirationDate: TDate; categoryId: Integer);
    function ValidateDate(MaskEdit: TMaskEdit; var OutDate: TDate): Boolean;

    procedure CompareDriverLicenses(OldData, NewData: TDriverLicenseData;
      out AddedData, RemovedData: TDriverLicenseData);
  public
    OldDriverLicenseData: TDriverLicenseData;
    NewDriverLicenseData: TDriverLicenseData;

    procedure ResizeColums(TotalWith: Integer);
    constructor Create(TOwner: TComponent; TManagerCRUD: TDriverManager; AQuery: TFDQuery);
  end;

implementation

{$R *.dfm}

constructor TDriverLicensesFr.Create(TOwner: TComponent;
  TManagerCRUD: TDriverManager; AQuery: TFDQuery);
var
  TotalWidth: Integer;
begin
  inherited Create(TOwner);

  FQuery:= AQuery;

  OldDriverLicenseData := TDriverLicenseData.Create;
  NewDriverLicenseData := TDriverLicenseData.Create;

  ManagerCrud := TManagerCRUD;

  DriverLicenseStringGrid.RowCount := 1;
  DriverLicenseStringGrid.ColCount := 4;
  DriverLicenseStringGrid.Cells[0, 0] := '�����';
  DriverLicenseStringGrid.Cells[1, 0] := '���� ������';
  DriverLicenseStringGrid.Cells[2, 0] := '���� ���������';
  DriverLicenseStringGrid.Cells[3, 0] := 'id';

  ResizeColums(DriverLicenseStringGrid.ClientWidth);
end;

procedure TDriverLicensesFr.ClearData;
begin
  LicenseCategoryComboBox.KeyValue := Null;
  issueDateEditMask.Clear;
  expirationDateEditMask.Clear;
end;

procedure TDriverLicensesFr.ResizeColums(TotalWith: Integer);
begin
  DriverLicenseStringGrid.ColWidths[0] := TotalWith div 5; // 20%
  DriverLicenseStringGrid.ColWidths[1] := TotalWith div 5 * 2; // 40%
  DriverLicenseStringGrid.ColWidths[2] := TotalWith div 5 * 2; // 40%

  DriverLicenseStringGrid.ColWidths[3] := 0;
end;

procedure TDriverLicensesFr.DeleteButtonClick(Sender: TObject);
begin
  ClearData;
end;

procedure TDriverLicensesFr.GetDriverLicensesFromGrid(var Data: TDriverLicenseData);
var
  i, RowCount: Integer;
begin
  RowCount := DriverLicenseStringGrid.RowCount - 1;

  SetLength(Data.LicenseCategoryIDs, RowCount);
  SetLength(Data.IssueDates, RowCount);
  SetLength(Data.ExpirationDates, RowCount);
  SetLength(Data.LicenseCategoryNames, RowCount);


  for i := 1 to RowCount do
  begin
    Data.LicenseCategoryNames[i - 1] := DriverLicenseStringGrid.Cells[3, i];
    Data.IssueDates[i - 1] := StrToDateDef(DriverLicenseStringGrid.Cells[1, i], 0);
    Data.ExpirationDates[i - 1] := StrToDateDef(DriverLicenseStringGrid.Cells[2, i], 0);
    Data.LicenseCategoryIDs[i - 1] := StrToIntDef(DriverLicenseStringGrid.Cells[3, i], -1);
  end;
end;



procedure TDriverLicensesFr.EditButtonClick(Sender: TObject);
begin
  LicenseCategoryComboBox.KeyValue := Null;
end;

procedure TDriverLicensesFr.addButtonClick(Sender: TObject);
var
  issueDate, expirationDate: TDate;
begin
  if not VarIsNull(LicenseCategoryComboBox.KeyValue) and
    ValidateDate(issueDateEditMask, issueDate) and
    ValidateDate(expirationDateEditMask, expirationDate) then
  begin
    AddRowToStringGrid(LicenseCategoryComboBox.Text, issueDate, expirationDate, LicenseCategoryComboBox.KeyValue);
    LicenseCategoryComboBox.KeyValue := Null;
  end;
end;

procedure TDriverLicensesFr.AddRowToStringGrid(category: String;
  issueDate, expirationDate: TDate; categoryId: Integer);
var
  RowIndex: Integer;
begin
  RowIndex := DriverLicenseStringGrid.RowCount;
  DriverLicenseStringGrid.RowCount := RowIndex + 1;

  DriverLicenseStringGrid.Cells[0, RowIndex] := category;
  DriverLicenseStringGrid.Cells[1, RowIndex] := DateToStr(issueDate);
  DriverLicenseStringGrid.Cells[2, RowIndex] := DateToStr(expirationDate);
  DriverLicenseStringGrid.Cells[3, RowIndex] := IntToStr(categoryId);
end;

function TDriverLicensesFr.ValidateDate(MaskEdit: TMaskEdit;
  var OutDate: TDate): Boolean;
begin
  if MaskEdit.Text = '' then
  begin
    OutDate := 0;
    Exit(False);
  end;

  try
    OutDate := StrToDate(MaskEdit.EditText);
  except
    on E: EConvertError do
    begin
      MaskEdit.Clear;
      ShowMessage('�������� ������ ����');
      Exit(False);
    end;
  end;
  Exit(True);
end;



procedure TDriverLicensesFr.CompareDriverLicenses(OldData,
  NewData: TDriverLicenseData; out AddedData, RemovedData: TDriverLicenseData);
var
  i, j: Integer;
  Found: Boolean;
begin
  AddedData := TDriverLicenseData.Create;
  RemovedData := TDriverLicenseData.Create;

  for i := 0 to High(NewData.LicenseCategoryIDs) do
  begin
    Found := False;
    for j := 0 to High(OldData.LicenseCategoryIDs) do
    begin
      if (NewData.LicenseCategoryIDs[i] = OldData.LicenseCategoryIDs[j]) then
      begin
        Found := True;
        Break;
      end;
    end;

    if not Found then
    begin
      SetLength(AddedData.LicenseCategoryIDs,
        Length(AddedData.LicenseCategoryIDs) + 1);
      SetLength(AddedData.IssueDates, Length(AddedData.IssueDates) + 1);
      SetLength(AddedData.ExpirationDates,
        Length(AddedData.ExpirationDates) + 1);

      AddedData.LicenseCategoryIDs[High(AddedData.LicenseCategoryIDs)] :=
        NewData.LicenseCategoryIDs[i];
      AddedData.IssueDates[High(AddedData.IssueDates)] := NewData.IssueDates[i];
      AddedData.ExpirationDates[High(AddedData.ExpirationDates)] :=
        NewData.ExpirationDates[i];
    end;
  end;

  for i := 0 to High(OldData.LicenseCategoryIDs) do
  begin
    Found := False;
    for j := 0 to High(NewData.LicenseCategoryIDs) do
    begin
      if (OldData.LicenseCategoryIDs[i] = NewData.LicenseCategoryIDs[j]) then
      begin
        Found := True;
        Break;
      end;
    end;

    if not Found then
    begin
      SetLength(RemovedData.LicenseCategoryIDs,
        Length(RemovedData.LicenseCategoryIDs) + 1);
      SetLength(RemovedData.IssueDates, Length(RemovedData.IssueDates) + 1);
      SetLength(RemovedData.ExpirationDates,
        Length(RemovedData.ExpirationDates) + 1);

      RemovedData.LicenseCategoryIDs[High(RemovedData.LicenseCategoryIDs)] :=
        OldData.LicenseCategoryIDs[i];
      RemovedData.IssueDates[High(RemovedData.IssueDates)] :=
        OldData.IssueDates[i];
      RemovedData.ExpirationDates[High(RemovedData.ExpirationDates)] :=
        OldData.ExpirationDates[i];
    end;
  end;
end;





 procedure TDriverLicensesFr.LoadDriverLicenses(DriverID: Integer);
var
  RowIndex: Integer;
begin
  if DriverID = -1 then Exit;

  DriverLicenseStringGrid.RowCount := 1; // ������� �����

  FQuery.Close;
  FQuery.SQL.Text :=
    'SELECT dl.license_category_id, lc.category_name, dl.issue_date, dl.expiration_date ' +
    'FROM driver_license dl ' +
    'JOIN license_category lc ON dl.license_category_id = lc.id ' +
    'WHERE dl.driver_id = :DriverID ' +
    'ORDER BY lc.category_name';

  FQuery.ParamByName('DriverID').AsInteger := DriverID;
  FQuery.Open;

  while not FQuery.Eof do
  begin
    RowIndex := DriverLicenseStringGrid.RowCount;
    DriverLicenseStringGrid.RowCount := RowIndex + 1;

    DriverLicenseStringGrid.Cells[0, RowIndex] := FQuery.FieldByName('category_name').AsString;
    DriverLicenseStringGrid.Cells[1, RowIndex] := DateToStr(FQuery.FieldByName('issue_date').AsDateTime);
    DriverLicenseStringGrid.Cells[2, RowIndex] := DateToStr(FQuery.FieldByName('expiration_date').AsDateTime);
    DriverLicenseStringGrid.Cells[3, RowIndex] := FQuery.FieldByName('license_category_id').AsString;

    FQuery.Next;
  end;
end;




end.
