unit CtrlFornecedor;

interface

uses
  CtrlPessoa, SysUtils;

type
  TCtrlFornecedor = class(TCtrlPessoa)
  public
    constructor Create; overload;
    function Gravar(id: Integer): Boolean; override;
  end;

implementation

{ TCtrlFornecedor }

uses Biblio;

constructor TCtrlFornecedor.Create;
begin
  inherited Create();
  Pessoa.tipo := 'Fornecedor';
end;

function TCtrlFornecedor.Gravar(id: Integer): Boolean;
var
  vCount: Integer;
begin
  if (id = 0) then
  begin
    vCount := ConsultaSQL('SELECT COUNT(pessoaId) FROM pessoas WHERE cpfCnpj = ' + QuotedStr(Pessoa.cpfCnpj));
    if vCount > 0 then
    begin
      Result := False;
      Atencao('Já existe um fornecedor cadastrado com esse mesmo CNPJ!');
      Exit;
    end;
  end;

  if not ValidaCgc(Pessoa.cpfCnpj) then
  begin
    Result := False;
    Atencao('CNPJ inválido!');
    Exit;
  end;

  Result := inherited Gravar(id);
end;

end.
