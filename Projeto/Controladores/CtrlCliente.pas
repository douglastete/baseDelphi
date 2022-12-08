unit CtrlCliente;

interface

uses
  CtrlPessoa, SysUtils;

type
  TCtrlCliente = class(TCtrlPessoa)
  public
    constructor Create; overload;
    function Gravar(id: Integer): Boolean; override;
  end;

implementation

{ TCtrlCliente }

uses Biblio;

constructor TCtrlCliente.Create;
begin
  inherited Create();
  Pessoa.tipo := 'Cliente';
end;

function TCtrlCliente.Gravar(id: Integer): Boolean;
var
  vCount: Integer;
begin
  if (id = 0) then
  begin
    vCount := ConsultaSQL('SELECT COUNT(pessoaId) FROM pessoas WHERE cpfCnpj = ' + QuotedStr(Pessoa.cpfCnpj));
    if vCount > 0 then
    begin
      Result := False;
      Atencao('Já existe um cliente cadastrado com esse mesmo CPF!');
      Exit;
    end;
  end;

  if not ValidaCgc(Pessoa.cpfCnpj) then
  begin
    Result := False;
    Atencao('CPF inválido!');
    Exit;
  end;

  Result := inherited Gravar(id);
end;

end.
