unit CtrlProduto;

interface

uses
  CtrlBase, EntProduto, StrUtils, SysUtils, Data.DB;

type
  TCtrlProduto = class(TCtrlBase)
  private
  published
    function GetSQLConsulta(): TParamsSQL; override;
    function GetSQLExclusao(): TParamsSQL; override;
    function GetSQLInclusao(): TParamsSQL; override;
    function GetSQLAlteracao(): TParamsSQL; override;
    procedure PreencherEntidade(); override;
    function Gravar(id: Integer): Boolean; override;
    procedure PreencherEntidadeLista(); override;
  public
    Produto: TProduto;
    constructor Create; overload;
  end;

implementation

{ TCtrlProduto }

uses Biblio;

constructor TCtrlProduto.Create;
begin
  inherited Create();
  Produto := TProduto.Create;
  Produto.status := 'A';
end;

function TCtrlProduto.GetSQLAlteracao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := 'UPDATE produtos SET ' +
                ' descricao = ' + QuotedStr(Produto.descricao) + ',' +
                ' precoUnitario = :PRECO_UNITARIO,' +
                ' status = ' + QuotedStr(Produto.status) + ',' +
                ' fornecedorId = ' + Produto.fornecedorId.ToString() +
                ' WHERE produtoId = :ID';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'PRECO_UNITARIO';
  vParam.AsFloat := Produto.precoUnitario;
end;

function TCtrlProduto.GetSQLConsulta: TParamsSQL;
begin
  Result.SQL := 'SELECT p.produtoId,' +
                '       p.descricao,' +
                '       p.precoUnitario,' +
                '       p.status,' +
                '       p.fornecedorId,' +
                '       f.nome as fornecedorNome' +
                '  FROM produtos p' +
                ' INNER JOIN pessoas f ON f.pessoaId = p.fornecedorId' +
                ' WHERE produtoId = :ID';
  Result.Params := nil;
end;

function TCtrlProduto.GetSQLExclusao: TParamsSQL;
begin
  Result.SQL := 'DELETE FROM produtos ' +
                ' WHERE produtoId = :ID';
  Result.Params := nil;
end;

function TCtrlProduto.GetSQLInclusao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := ' INSERT INTO produtos (' +
                ' descricao,' +
                ' precoUnitario,' +
                ' status,' +
                ' fornecedorId) VALUES (' +
                QuotedStr(Produto.descricao) + ',' +
                ':PRECO_UNITARIO,' +
                QuotedStr(Produto.status) + ',' +
                Produto.fornecedorId.ToString() +
                ')';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'PRECO_UNITARIO';
  vParam.AsFloat := Produto.precoUnitario;
end;

procedure TCtrlProduto.PreencherEntidade;
begin
  inherited;
  Produto.produtoId := DataSet.FieldByName('produtoId').AsInteger;
  Produto.descricao := DataSet.FieldByName('descricao').AsString;
  Produto.precoUnitario := DataSet.FieldByName('precoUnitario').AsFloat;
  Produto.status := DataSet.FieldByName('status').AsString;
  Produto.fornecedorId := DataSet.FieldByName('fornecedorId').AsInteger;
  Produto.fornecedorNome := DataSet.FieldByName('fornecedorNome').AsString;
end;

function TCtrlProduto.Gravar(id: Integer): Boolean;
var
  vCount: Integer;
  vStatus: String;
begin
  if Produto.precoUnitario <= 0 then
  begin
    Atencao('O produto não pode ser gravado com preço unitário zerado!');
    Result := False;
    Exit;
  end;

  if Produto.fornecedorId = 0 then
  begin
    Result := False;
    Atencao('É necessário informar o cliente!');
    Exit;
  end;

  vCount := ConsultaSQL('SELECT COUNT(pessoaId) FROM pessoas WHERE tipo = ''Fornecedor'' and pessoaId = ' + Produto.fornecedorId.ToString);
  if vCount = 0 then
  begin
    Result := False;
    Atencao('O fornecedor informado não foi encontrado!');
    Exit;
  end;

  vStatus := ConsultaSQL('SELECT status FROM pessoas WHERE tipo = ''Fornecedor'' and pessoaId = ' + Produto.fornecedorId.ToString());
  if vStatus <> 'A' then
  begin
    Result := False;
    Atencao('O fornecedor informado não está ativo!');
    Exit;
  end;

  Result := inherited Gravar(id);
end;

procedure TCtrlProduto.PreencherEntidadeLista();
begin
  inherited;
  DataSet.First;
  while not DataSet.Eof do
  begin
    Produto := TProduto.Create;
    PreencherEntidade();
    Lista.Add(Produto);
    DataSet.Next;
  end;
end;

end.
