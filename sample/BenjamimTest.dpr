program BenjamimTest;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils
    , Benjamim

    ;

var
  LToken: string;

begin
  ReportMemoryLeaksOnShutdown := true;

  try
    Benjamim.JWT.Password('secret'); { OPTIONAL }

    Benjamim.JWT.Header.Algorithm(TJwtAlgorithm.HS256); { OPTIONAL - DEFAULT TJwtAlgorithm.HS256 }

    Benjamim.JWT.Payload.jti(1)
      .iss('Luis Nt')
      .sub('Chave de acesso')
      .aud('192.168.0.77')
      .iat('2021-01-31 15:55:21.123')
      .nbf('2021-01-31 18:01:01.001')
      .exp('2021-01-31 22:01:01.001')
      .add('price', 10.5)
      .add('name', 'your fullname')
      .add('phone', 559822223333)
      ;
    LToken := Benjamim.JWT.Signature.Sign;

    WriteLn(LToken);

  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;

end.
