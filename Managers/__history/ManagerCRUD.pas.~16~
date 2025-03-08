unit ManagerCRUD;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, Vcl.Dialogs;

type
  TManagerCRUD = class
    procedure DisableFilter;

  protected
    FQuery: TFDQuery;

    constructor Create(AQuery: TFDQuery);

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
