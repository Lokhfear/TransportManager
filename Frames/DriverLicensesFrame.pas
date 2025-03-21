unit DriverLicensesFrame;

interface

uses
  DriverManager, Helper, FireDAC.Comp.Client, System.Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBCtrls, Vcl.Mask;

type
  TDriverLicenseData = class
  public
    DriverID: Integer;
    LicenseCategoryIDs: TList<Integer>;
    LicenseCategoryNames: TList<string>;
    IssueDates: TList<TDate>;
    ExpirationDates: TList<TDate>;

    constructor Create;
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
    procedure ClearListData();
    procedure GetDriverLicensesFromGrid(var Data: TDriverLicenseData);
    procedure LoadDriverLicenses(DriverID: Integer);
    procedure UpdateDriverLicenseRow(RowIndex: Integer;
  const CategoryName: String; IssueDate, ExpirationDate: TDate; LicenseID: Integer);
    procedure DriverLicenseStringGridClick(Sender: TObject);
  private
    ManagerCrud: TDriverManager;
    FQuery: TFDQuery;

    function IsLicenseIdExists(const licenseId: Integer): Boolean;
    procedure AddRowToStringGrid(category: String;
      issueDate, expirationDate: TDate; categoryId: Integer);
    //function ValidateDate(MaskEdit: TMaskEdit; var OutDate: TDate): Boolean;


  public
    OldDriverLicenseData: TDriverLicenseData;
    NewDriverLicenseData: TDriverLicenseData;

    procedure UpdateDriverLicenses(DriverId: integer);
    procedure ResizeColums(TotalWith: Integer);
    constructor Create(TOwner: TComponent; TManagerCRUD: TDriverManager; AQuery: TFDQuery);
  end;

implementation

{$R *.dfm}


constructor TDriverLicenseData.Create;
begin
  inherited Create;
  LicenseCategoryIDs := TList<Integer>.Create;
  LicenseCategoryNames := TList<string>.Create;
  IssueDates := TList<TDate>.Create;
  ExpirationDates := TList<TDate>.Create;
end;


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

procedure TDriverLicensesFr.ClearListData;
begin
   OldDriverLicenseData.DriverID := -1;
   NewDriverLicenseData.DriverID := -1;

   OldDriverLicenseData.LicenseCategoryIDs.Clear;
   OldDriverLicenseData.LicenseCategoryNames.Clear;
   OldDriverLicenseData.IssueDates.Clear;
   OldDriverLicenseData.ExpirationDates.Clear;

   NewDriverLicenseData.LicenseCategoryIDs.Clear;
   NewDriverLicenseData.LicenseCategoryNames.Clear;
   NewDriverLicenseData.IssueDates.Clear;
   NewDriverLicenseData.ExpirationDates.Clear;
end;

procedure TDriverLicensesFr.ResizeColums(TotalWith: Integer);
begin
  DriverLicenseStringGrid.ColWidths[0] := TotalWith div 5; // 20%
  DriverLicenseStringGrid.ColWidths[1] := TotalWith div 5 * 2; // 40%
  DriverLicenseStringGrid.ColWidths[2] := TotalWith div 5 * 2; // 40%

  DriverLicenseStringGrid.ColWidths[3] := 0;
end;

procedure TDriverLicensesFr.DeleteButtonClick(Sender: TObject);
var
  RowIndex, i: Integer;
  LicenseCategoryID: Integer;
begin
  RowIndex := DriverLicenseStringGrid.Row;

  if RowIndex > 0 then
  begin
    LicenseCategoryID := StrToIntDef(DriverLicenseStringGrid.Cells[3, RowIndex], -1);

    if OldDriverLicenseData.LicenseCategoryIDs.Contains(LicenseCategoryID) then
    begin
      ShowMessage('������ ������� ��� ����������� ��������� ����');
      Exit;
    end;

    // ������� ������ �� �����
    for i := RowIndex to DriverLicenseStringGrid.RowCount - 2 do
    begin
      DriverLicenseStringGrid.Rows[i] := DriverLicenseStringGrid.Rows[i + 1];
    end;
    DriverLicenseStringGrid.RowCount := DriverLicenseStringGrid.RowCount - 1;

    NewDriverLicenseData.LicenseCategoryNames.Delete(RowIndex - 1);
    NewDriverLicenseData.IssueDates.Delete(RowIndex - 1);
    NewDriverLicenseData.ExpirationDates.Delete(RowIndex - 1);
    NewDriverLicenseData.LicenseCategoryIDs.Delete(RowIndex - 1);
  end;

  ClearData;
end;


procedure TDriverLicensesFr.DriverLicenseStringGridClick(Sender: TObject);
var
 RowIndex: Integer;
begin
  RowIndex := DriverLicenseStringGrid.Row;

  if RowIndex > 0 then
  begin
  issueDateEditMask.Text :=  DriverLicenseStringGrid.Cells[1, RowIndex];
  expirationDateEditMask.Text := DriverLicenseStringGrid.Cells[2, RowIndex];
  LicenseCategoryComboBox.KeyValue :=  StrToInt(DriverLicenseStringGrid.Cells[3, RowIndex])
  end;
end;

procedure TDriverLicensesFr.GetDriverLicensesFromGrid(var Data: TDriverLicenseData);
var
  i, RowCount: Integer;
begin

  RowCount := DriverLicenseStringGrid.RowCount;

  if RowCount > 1 then
  begin
    for i := 1 to RowCount - 1 do
    begin
      Data.LicenseCategoryNames.Add(DriverLicenseStringGrid.Cells[0, i]);
      Data.IssueDates.Add(StrToDateDef(DriverLicenseStringGrid.Cells[1, i], 0));
      Data.ExpirationDates.Add(StrToDateDef(DriverLicenseStringGrid.Cells[2, i], 0));
      Data.LicenseCategoryIDs.Add(StrToIntDef(DriverLicenseStringGrid.Cells[3, i], -1));
    end;
  end;
  //ShowMessage(Data.LicenseCategoryIDs.count.ToString);
end;


procedure TDriverLicensesFr.EditButtonClick(Sender: TObject);
var
  issueDate, expirationDate: TDate;
  RowIndex: Integer;
  LicenseCategoryID: Integer;
begin
  RowIndex := DriverLicenseStringGrid.Row;
  if RowIndex > 0 then
  begin
    LicenseCategoryID := StrToIntDef(DriverLicenseStringGrid.Cells[3, RowIndex], -1);

    if OldDriverLicenseData.LicenseCategoryIDs.Contains(LicenseCategoryID) then
    begin
      ShowMessage('���������� �������� ��������� ����, ������� ��� ����������');
      Exit;
    end;

    if ValidateDate(issueDateEditMask, issueDate) and
       ValidateDate(expirationDateEditMask, expirationDate) and
       not VarIsNull(LicenseCategoryComboBox.KeyValue) then
    begin
      UpdateDriverLicenseRow(RowIndex, LicenseCategoryComboBox.Text,
                             issueDate, expirationDate, LicenseCategoryComboBox.KeyValue);
    end;

    LicenseCategoryComboBox.KeyValue := Null;
  end
  else
    ShowMessage('�������� ������ ��� ��������������');
end;




procedure TDriverLicensesFr.UpdateDriverLicenseRow(RowIndex: Integer;
  const CategoryName: String; IssueDate, ExpirationDate: TDate; LicenseID: Integer);
begin

  if (RowIndex <= 0) or (RowIndex >= DriverLicenseStringGrid.RowCount) then
  begin
    ShowMessage('�������� ������ ������.');
    Exit;
  end;

  if ExpirationDate < IssueDate then
  begin
    ShowMessage('���� ��������� �� ����� ���� ������ ���� ������.');
    Exit;
  end;


  DriverLicenseStringGrid.Cells[0, RowIndex] := CategoryName;
  DriverLicenseStringGrid.Cells[1, RowIndex] := DateToStr(IssueDate);
  DriverLicenseStringGrid.Cells[2, RowIndex] := DateToStr(ExpirationDate);
  DriverLicenseStringGrid.Cells[3, RowIndex] := IntToStr(LicenseID);

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


function TDriverLicensesFr.IsLicenseIdExists(const licenseId: Integer): Boolean;
begin
  Result := NewDriverLicenseData.LicenseCategoryIDs.Contains(licenseId);
end;


procedure TDriverLicensesFr.AddRowToStringGrid(category: String;
  issueDate, expirationDate: TDate; categoryId: Integer);
var
  RowIndex: Integer;
begin

  if IsLicenseIdExists(categoryId) then
  begin
    ShowMessage('����� licenseId ��� ����������!');
    Exit;
  end;

  RowIndex := DriverLicenseStringGrid.RowCount;
  DriverLicenseStringGrid.RowCount := RowIndex + 1;

  DriverLicenseStringGrid.Cells[0, RowIndex] := category;
  DriverLicenseStringGrid.Cells[1, RowIndex] := DateToStr(issueDate);
  DriverLicenseStringGrid.Cells[2, RowIndex] := DateToStr(expirationDate);
  DriverLicenseStringGrid.Cells[3, RowIndex] := IntToStr(categoryId);

  NewDriverLicenseData.LicenseCategoryIDs.Add(categoryId);
  NewDriverLicenseData.LicenseCategoryNames.Add(category);
  NewDriverLicenseData.IssueDates.Add(issueDate);
  NewDriverLicenseData.ExpirationDates.Add(expirationDate);
end;


procedure TDriverLicensesFr.UpdateDriverLicenses(DriverId: integer);
var
  i: Integer;
  AddedData, RemovedData: TDriverLicenseData;
begin

 // ShowMessage(OldDriverLicenseData.LicenseCategoryIDs.Count.ToString);
 // ShowMessage(NewDriverLicenseData.LicenseCategoryIDs.Count.ToString);

  if (NewDriverLicenseData = nil) or (OldDriverLicenseData = nil) then
  begin
    ShowMessage('������: ������ �������� �� ���������.');
    Exit;
  end;

  AddedData := TDriverLicenseData.Create;
  RemovedData := TDriverLicenseData.Create;

  AddedData.DriverID := DriverId;
  RemovedData.DriverID := DriverId;


  for i := 0 to NewDriverLicenseData.LicenseCategoryIDs.Count - 1 do
  begin
    if not OldDriverLicenseData.LicenseCategoryIDs.Contains(NewDriverLicenseData.LicenseCategoryIDs[i]) then
    begin
      AddedData.LicenseCategoryIDs.Add(NewDriverLicenseData.LicenseCategoryIDs[i]);
      AddedData.IssueDates.Add(NewDriverLicenseData.IssueDates[i]);
      AddedData.ExpirationDates.Add(NewDriverLicenseData.ExpirationDates[i]);
    end;
  end;

  (*  ������ ������� ����������� ����


  for i := 0 to OldDriverLicenseData.LicenseCategoryIDs.Count - 1 do
  begin
    if not NewDriverLicenseData.LicenseCategoryIDs.Contains(OldDriverLicenseData.LicenseCategoryIDs[i]) then
      RemovedData.LicenseCategoryIDs.Add(OldDriverLicenseData.LicenseCategoryIDs[i]);
  end;


  if RemovedData.LicenseCategoryIDs.Count > 0 then
    ManagerCrud.DeleteDriverLicenses(RemovedData.DriverID, RemovedData.LicenseCategoryIDs);

  *)

  if AddedData.LicenseCategoryIDs.Count > 0 then
    ManagerCrud.AddDriverLicenses(AddedData.DriverID, AddedData.LicenseCategoryIDs, AddedData.IssueDates, AddedData.ExpirationDates);

  ClearListData;
end;





 procedure TDriverLicensesFr.LoadDriverLicenses(DriverID: Integer);
var
  RowIndex: Integer;
begin
  if DriverID = -1 then Exit;

  OldDriverLicenseData.DriverID := DriverID;
  NewDriverLicenseData.DriverID := DriverID;

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

  ClearListData;
  GetDriverLicensesFromGrid(OldDriverLicenseData);
  GetDriverLicensesFromGrid(NewDriverLicenseData);
end;




end.
