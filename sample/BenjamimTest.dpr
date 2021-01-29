program BenjamimTest;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  Benjamim.JWT;

begin
  ReportMemoryLeaksOnShutdown := true;

  try
    Benjamim.JWT;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
