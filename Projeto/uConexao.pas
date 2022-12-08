unit uConexao;

interface

uses
  System.SysUtils, System.Classes, IniFiles, Forms, Rest.JSON, System.JSON,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Windows, FireDAC.Phys.MSSQLDef,
  Vcl.Imaging.pngimage, Controls, Math;

type
  {$M+}
  TConexao = class(TObject)
  private
    FConnection: TFDConnection;
    FTransaction: TFDTransaction;
  published
    property Connection: TFDConnection read FConnection write FConnection;
    property Transaction: TFDTransaction read FTransaction write FTransaction;
  public
    procedure ConectarBD();
  end;

implementation

uses VarGlobal, Biblio;

procedure TConexao.ConectarBD();
var
  vIniFile: TIniFile;
begin
  if not FileExists(_LocalEXE + 'DBParams.ini') then
  begin
    Atencao('Arquivo de configuração "' + _LocalEXE + 'DBParams.ini' + '" não encontrado!');
    Halt;
  end;

  Connection := TFDConnection.Create(Application);
  Transaction := TFDTransaction.Create(Application);
  Connection.Transaction := Transaction;
  vIniFile := TIniFile.Create(_LocalEXE + 'DBParams.ini');
  try
    Connection.Params.LoadFromFile(_LocalEXE + 'DBParams.ini');
    try
      Connection.Open;
    except
      on E: Exception do
      begin
        Atencao('Erro ao conectar com o banco de dados! Erro: ' + E.Message);
        Halt;
      end;
    end;
  finally
    FreeAndNil(vIniFile);
  end;
end;

end.
