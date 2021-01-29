## Benjamim is José's younger brother
#### JWT library for token creation and verification

> **RFC7519**  - Internet Engineering Task Force (IETF)
>
> **UPDATED**  -  May 2015
>
> **URL** - https://tools.ietf.org/html/rfc7519


#### Generate a new Token
##### Support Types 
```delphi
{
    jti - Jwt ID          - Jwt ID (ID)
    iss - Issuer          - Issuer (Issuer)
    sub - Subject         - Subject matter
    aud - Audience        - Audience (Remote IP)
    iat - Issued At       - Issued on (When Token was Issued / Automatic)
    nbf - Not Before      - Validity Started (Starts At)
    exp - Expiration Time - Expired Validity (Expires On)
    add - custom key      - can be: integer, decimal, datetime, boolean, JsonObject, JsonArray and Variant 
    
    jti - Jwt ID          - Jwt ID ( ID )
    iss - Issuer          - Emissor ( Emissor )
    sub - Subject         - Assunto
    aud - Audience        - Audiência ( Remote IP )
    iat - Issued At       - Emitido em ( Quando o Token foi Emitido / Automático )
    nbf - Not Before      - Validade Iniciada ( Inicia Em )
    exp - Expiration Time - Validade Terminada ( Expirar Em )
    add - custom key      - can be: integer, decimal, datetime, boolean, JsonObject, JsonArray e Variant  
}
```     

##### Sample use
```delphi
    uses Bemjamim;
    { 
       Set the password using the JWT.Password ('secret') method; is optional. 
       Loads the JWT_PRIVATE_PASSWORD environment by default and if it does not exist
       will use the DEFAULT_PASSWORD = 'your-256-bit-secret' constant contained in
       unit Core.JWT.Utils.pas    
    
       Definir a senha atraves do método JWT.Password('secret'); é opcional 
       Carrega por padrão a ambiente JWT_PRIVATE_PASSWORD e se não existir 
       usará a constante DEFAULT_PASSWORD='secret' contida na 
       unit Core.JWT.Utils.pas 
    }
    Bemjamim.JWT.Password('secret'); { OPTIONAL }

    Bemjamim.JWT.Header.Algorithm(TJwtAlgorithm.HS256); { OPTIONAL - DEFAULT TJwtAlgorithm.HS256 } 
    
    Bemjamim.JWT.Payload
                .jti(1)                           
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
    LToken := Bemjamim.JWT.Signature.Sign; 
```

#### Verify a Token
##### Sample use
```delphi
    uses Bemjamim;

    Bemjamim.JWT.Password('secret'); { OPCIONAL }
      
    Bemjamim.JWT.Token(aValue).Signature.Verify; { true / false }
```
