program TransportManager;

uses
  Vcl.Forms,
  HomeForm in 'HomeForm.pas' {Form1},
  DBConnection in 'DBConnection.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
