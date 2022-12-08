unit CtrlVenda;

interface

uses
  CtrlBase, EntVenda, StrUtils, SysUtils, Data.DB;

type
  TCtrlVenda = class(TCtrlBase)
  private
  published
    function GetSQLConsulta(): TParamsSQL; override;
    function GetSQLExclusao(): TParamsSQL; override;
    function GetSQLInclusao(): TParamsSQL; override;
    function GetSQLAlteracao(): TParamsSQL; override;
    procedure PreencherEntidade(); override;
    procedure PreencherEntidadeLista(); override;
    function Gravar(id: Integer): Boolean; override;
    function EfetivarVenda(pID: Integer): Boolean;
  public
    Venda: TVenda;
    constructor Create; overload;
  end;

implementation

{ TCtrlVenda }

uses Biblio, CtrlItemVenda;

constructor TCtrlVenda.Create;
begin
  inherited Create();
  Venda := TVenda.Create;
  Venda.status := 'P';
end;

function TCtrlVenda.GetSQLAlteracao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := 'UPDATE vendas SET ' +
                ' clienteId = ' + Venda.clienteId.ToString + ',' +
                ' dataHora = :DATA_HORA,' +
                ' status = ' + QuotedStr(Venda.status) + ',' +
                ' valorTotal = :VALOR_TOTAL' +
                ' WHERE vendaId = :ID';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'DATA_HORA';
  vParam.AsDateTime := Venda.dataHora;

  vParam := Result.Params.AddParameter;
  vParam.Name := 'VALOR_TOTAL';
  vParam.AsFloat := Venda.valorTotal;
end;

function TCtrlVenda.GetSQLConsulta: TParamsSQL;
begin
  Result.SQL := 'SELECT v.vendaId,' +
                '       v.clienteId,' +
                '       v.dataHora,' +
                '       v.status,' +
                '       v.valorTotal,' +
                '       c.nome as clienteNome' +
                '  FROM vendas v' +
                ' INNER JOIN pessoas c ON c.pessoaId = v.clienteId' +
                ' WHERE vendaId = :ID';
  Result.Params := nil;
end;

function TCtrlVenda.GetSQLExclusao: TParamsSQL;
begin
  Result.SQL := 'DELETE FROM vendas ' +
                ' WHERE vendaId = :ID';
  Result.Params := nil;
end;

function TCtrlVenda.GetSQLInclusao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := ' INSERT INTO vendas (' +
                ' clienteId,' +
                ' dataHora,' +
                ' status,' +
                ' valorTotal) VALUES (' +
                Venda.clienteId.ToString + ',' +
                ':DATA_HORA,' +
                QuotedStr(Venda.status) + ',' +
                ':VALOR_TOTAL' +
                ')';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'DATA_HORA';
  vParam.AsDateTime := Venda.dataHora;

  vParam := Result.Params.AddParameter;
  vParam.Name := 'VALOR_TOTAL';
  vParam.AsFloat := Venda.valorTotal;
end;

procedure TCtrlVenda.PreencherEntidade;
begin
  inherited;
  Venda.vendaId := DataSet.FieldByName('vendaId').AsInteger;
  Venda.clienteId := DataSet.FieldByName('clienteId').AsInteger;
  Venda.dataHora := DataSet.FieldByName('dataHora').AsDateTime;
  Venda.status := DataSet.FieldByName('status').AsString;
  Venda.valorTotal := DataSet.FieldByName('valorTotal').AsFloat;
  Venda.clienteId := DataSet.FieldByName('clienteId').AsInteger;
  Venda.clienteNome := DataSet.FieldByName('clienteNome').AsString;
end;

function TCtrlVenda.Gravar(id: Integer): Boolean;
var
  vCount: Integer;
  vStatus: String;
  vItemVenda: TCtrlItemVenda;
  I: Integer;
begin
  if Venda.clienteId = 0 then
  begin
    Result := False;
    Atencao('É necessário informar o cliente!');
    Exit;
  end;

  if Venda.ListaItens.Count = 0 then
  begin
    Result := False;
    Atencao('É necessário informar ao menos um produto!');
    Exit;
  end;

  if Venda.valorTotal <= 0 then
  begin
    Result := False;
    Atencao('Valor total da venda inválido!');
    Exit;
  end;

  vCount := ConsultaSQL('SELECT COUNT(pessoaId) FROM pessoas WHERE tipo = ''Cliente'' and pessoaId = ' + Venda.clienteId.ToString);
  if vCount = 0 then
  begin
    Result := False;
    Atencao('O cliente informado não foi encontrado!');
    Exit;
  end;

  vStatus := ConsultaSQL('SELECT status FROM pessoas WHERE tipo = ''Cliente'' and pessoaId = ' + Venda.clienteId.ToString());
  if vStatus <> 'A' then
  begin
    Result := False;
    Atencao('O cliente informado não está ativo!');
    Exit;
  end;

  Result := inherited Gravar(id);

  if Result then
  begin
    if (id > 0) then
    begin
      ExecutarSQL('DELETE FROM itens_vendas WHERE vendaId = ' + id.ToString());
    end
    else
    begin
      id := ConsultaSQL('SELECT MAX(vendaId) FROM vendas');
    end;
    vItemVenda := TCtrlItemVenda.Create;
    for I := 0 to Venda.ListaItens.Count -1 do
    begin
      vItemVenda.ItemVenda := Venda.ListaItens[I];
      vItemVenda.ItemVenda.vendaId := id;
      vItemVenda.Gravar(0);
    end;
  end;
end;

procedure TCtrlVenda.PreencherEntidadeLista();
begin
  inherited;
  DataSet.First;
  while not DataSet.Eof do
  begin
    Venda := TVenda.Create;
    PreencherEntidade();
    Lista.Add(Venda);
    DataSet.Next;
  end;
end;

function TCtrlVenda.EfetivarVenda(pID: Integer): Boolean;
begin
  try
    ExecutarSQL('UPDATE vendas SET status = ''E'' WHERE vendaId = ' + pID.ToString());
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      Atencao('Houve um erro ao efetivar a venda. Erro: ' + E.Message);
    end;
  end;
end;

end.
