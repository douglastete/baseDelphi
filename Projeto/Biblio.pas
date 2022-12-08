unit Biblio;

interface

uses
  System.SysUtils, System.Classes, IniFiles, Forms, Rest.JSON, System.JSON,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, Windows,
  Vcl.Imaging.pngimage, Controls, Math;

function SoNumero(pString: String): String;
procedure Atencao(pMensagem: String);
function Perguntar(pMensagem: String): Boolean;
procedure Informar(pMensagem: String);
function ValidaCgc(pCGC: String): Boolean;

implementation

function SoNumero(pString: String): String;
var
  I : Byte;
begin
  Result := '';
  for I := 1 To Length(pString) do
  begin
    if CharInSet(pString[I], ['0'..'9']) then
    begin
      Result := Result + pString [I];
    end;
  end;
end;

procedure Atencao(pMensagem: String);
begin
  Application.MessageBox(PWideChar(pMensagem), 'Atenção', MB_OK + MB_ICONWARNING);
end;

procedure Informar(pMensagem: String);
begin
  Application.MessageBox(PWideChar(pMensagem), 'Informação', MB_OK + MB_ICONINFORMATION);
end;

function Perguntar(pMensagem: String): Boolean;
begin
  Result := Application.MessageBox(PWideChar(pMensagem), 'Confirmar', MB_YESNO + MB_ICONQUESTION) = mrYes;
end;

function RetirarCaracter(Entrada: String; Caracter: Char): String;
var
  I: Integer;
begin
  Result := '';
  if Pos(Caracter, Entrada) > 0 then
  begin
    for I := 1 to Length(Entrada) do
    begin
      if Entrada[I] <> Caracter then
      begin
        Result := Result + Entrada[I];
      end;
    end;
  end
  else
  begin
    Result := Entrada;
  end;
end;

function AllTrim(s: String): String;
begin
  Result := RetirarCaracter(s, ' ');
end;

function Valor(VStr: String): Variant;
begin
  try
    Result := StrToFloatDef(RetirarCaracter(AllTrim(VStr),'.'), 0);
  except
    Result := 0;
  end;
end;

function ValidaCgc(pCGC: String): Boolean;
Var
  VNumeros, Digito1, Digito2: String;
  s, Cont, Digito, Soma: Integer;
Begin
  VNumeros := SoNumero(pCGC);

  case Length(VNumeros) of
    11:
      begin
        // Primeiro Dígito
        Cont := 1;
        Soma := 0;
        for s := 9 downto 1 do
        begin
          Cont := Cont + 1;
          Soma := Soma + StrToInt(Copy(VNumeros, s, 1)) * Cont;
        end;
        Soma := Soma * 10;
        Digito1 := IntToStr(Soma mod 11);
        if Valor(Digito1) >= 10 then
        begin
          Digito1 := '0';
        end;

        // Segundo Dígito
        Cont := 1;
        Soma := 0;
        for s := 10 downto 1 do
        begin
          Cont := Cont + 1;
          Soma := Soma + Valor(Copy(VNumeros, s, 1)) * Cont;
        end;
        Soma := Soma * 10;
        Digito2 := IntToStr(Soma mod 11);
        if Valor(Digito2) >= 10 then
        begin
          Digito2 := '0';
        end;
      end;

    14:
      begin
        Soma := 5 * Valor(VNumeros[1]) + 4 * Valor(VNumeros[2]) + 3 *
          Valor(VNumeros[3]) + 2 * Valor(VNumeros[4]) + 9 * Valor(VNumeros[5]) +
          8 * Valor(VNumeros[6]) + 7 * Valor(VNumeros[7]) + 6 *
          Valor(VNumeros[8]) + 5 * Valor(VNumeros[9]) + 4 * Valor(VNumeros[10])
          + 3 * Valor(VNumeros[11]) + 2 * Valor(VNumeros[12]);
        Digito := Soma mod 11;
        if Digito > 1 then
        begin
          Digito := 11 - Digito
        end
        else
        begin
          Digito := 0;
        end;
        Digito1 := IntToStr(Digito);

        Soma := 6 * Valor(VNumeros[1]) + 5 * Valor(VNumeros[2]) + 4 *
          Valor(VNumeros[3]) + 3 * Valor(VNumeros[4]) + 2 * Valor(VNumeros[5]) +
          9 * Valor(VNumeros[6]) + 8 * Valor(VNumeros[7]) + 7 *
          Valor(VNumeros[8]) + 6 * Valor(VNumeros[9]) + 5 * Valor(VNumeros[10])
          + 4 * Valor(VNumeros[11]) + 3 * Valor(VNumeros[12]) + 2 *
          StrToInt(Digito1);
        Digito := Soma mod 11;
        if Digito > 1 then
        begin
          Digito := 11 - Digito
        end
        else
        begin
          Digito := 0;
        end;
        Digito2 := IntToStr(Digito);
      end;
  else
    Digito2 := '999';
  end;

  if Copy(VNumeros, Length(VNumeros) - 1, 2) <> Digito1 + Digito2 then
  begin
    Result := False
  end
  else
  begin
    Result := True;
  end;
end;

end.
