unit Helper;

interface

uses
  System.SysUtils, Vcl.Mask, Vcl.Dialogs;

function ExtractDigits(const Input: string): string;
procedure ValidateDateTime(MaskEdit: TMaskEdit; var OutDateTime: TDateTime);
function ValidateDate(MaskEdit: TMaskEdit; var OutDate: TDate): Boolean;

implementation

function ExtractDigits(const Input: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Input) do
  begin
    if CharInSet(Input[i], ['0' .. '9']) then
      Result := Result + Input[i];
  end;
end;

procedure ValidateDateTime(MaskEdit: TMaskEdit; var OutDateTime: TDateTime);
begin
  if MaskEdit.Text = '' then
  begin
    OutDateTime := 0;
    Exit;
  end;

  try
    OutDateTime := StrToDateTime(MaskEdit.EditText);
  except
    on E: EConvertError do
    begin
      MaskEdit.Clear;
      ShowMessage('�������� ������ ���� � �������');
    end;
  end;
end;

function ValidateDate(MaskEdit: TMaskEdit; var OutDate: TDate): Boolean;
begin
  if MaskEdit.Text = '  .  .    ' then
  begin
    OutDate := 0;
    Exit(True);
  end;

  try
    OutDate := StrToDate(MaskEdit.EditText);
  except
    on E: EConvertError do
    begin
    ShowMessage( MaskEdit.Text);
      MaskEdit.Clear;
      ShowMessage('�������� ������ ����');
      Exit(False);
    end;
  end;
  Exit(True);
end;

end.

