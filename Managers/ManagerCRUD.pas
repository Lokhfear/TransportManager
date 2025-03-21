unit ManagerCRUD;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs;

type
  TManagerCRUD = class
    procedure DisableFilter;

  public

  protected
    FQuery: TFDQuery;

    constructor Create(AQuery: TFDQuery);
    function AddDateFilter(const FieldName: string; DateFrom, DateTo: TDate): string;

    { procedure Delete(AID: Integer; ShowMessage: Boolean; FTableName: string);
      virtual; overload;
      procedure Delete(AID: String; ShowMessage: Boolean; FTableName: string);
      virtual; overload; }

  private

  public
  end;

implementation

constructor TManagerCRUD.Create(AQuery: TFDQuery);
begin
  FQuery := AQuery;
end;

procedure TManagerCRUD.DisableFilter;
begin
  FQuery.Filtered := False;
end;

function TManagerCRUD.AddDateFilter(const FieldName: string; DateFrom, DateTo: TDate): string;
begin
  Result := '';
  if (DateFrom <> 0) and (DateTo <> 0) then
    Result := Format('%s BETWEEN ''%s'' AND ''%s''', [FieldName, DateToStr(DateFrom), DateToStr(DateTo)])
  else if (DateFrom <> 0) then
    Result := Format('%s >= ''%s''', [FieldName, DateToStr(DateFrom)])
  else if (DateTo <> 0) then
    Result := Format('%s <= ''%s''', [FieldName, DateToStr(DateTo)]);
end;

{ procedure TManagerCRUD.Delete(AID: String; ShowMessage: Boolean;
  FTableName: string);
  begin
  if not ShowMessage or (MessageDlg('Подтвердить удаление', mtConfirmation,
  [mbOK, mbCancel], 0) = 1) then
  begin
  FQuery.SQL.Text := Format('DELETE FROM %s WHERE id = :id', [FTableName]);
  FQuery.ParamByName('id').AsString := AID;
  FQuery.ExecSQL;
  end;
  end;) begin
  FQuery.SQL.Text := AQuery;
  FQuery.Open;
  end;
}

end.
