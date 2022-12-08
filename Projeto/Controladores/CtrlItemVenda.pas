unit CtrlItemVenda;

interface

uses
  CtrlBase, EntItemVenda, StrUtils, SysUtils, Data.DB;

type
  TCtrlItemVenda = class(TCtrlBase)
  published
    function GetSQLConsulta(): TParamsSQL; override;
    function GetSQLExclusao(): TParamsSQL; override;
    function GetSQLInclusao(): TParamsSQL; override;
    function GetSQLAlteracao(): TParamsSQL; override;
    procedure PreencherEntidade(); override;
    procedure PreencherEntidadeLista(); override;
    function Gravar(id: Integer): Boolean; override;
  public
    ItemVenda: TItemVenda;
    constructor Create; overload;
  end;

implementation

{ TCtrlItemVenda }

uses Biblio;

constructor TCtrlItemVenda.Create;
begin
  inherited Create();
  ItemVenda := TItemVenda.Create;
end;

function TCtrlItemVenda.GetSQLAlteracao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := 'UPDATE itens_vendas SET ' +
                ' produtoId = ' + ItemVenda.produtoId.ToString + ',' +
                ' descricao = ' + QuotedStr(ItemVenda.descricao) + ',' +
                ' precoUnitario = :PRECO_UNITARIO,' +
                ' quantidade = :QUANTIDADE' +
                ' WHERE produtoId = :ID';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'PRECO_UNITARIO';
  vParam.AsFloat := ItemVenda.precoUnitario;

  vParam := Result.Params.AddParameter;
  vParam.Name := 'QUANTIDADE';
  vParam.AsFloat := ItemVenda.quantidade;
end;

function TCtrlItemVenda.GetSQLConsulta: TParamsSQL;
begin
  Result.SQL := 'SELECT i.vendaId,' +
                '       i.produtoId,' +
                '       i.descricao,' +
                '       i.precoUnitario,' +
                '       i.quantidade' +
                '  FROM itens_vendas i' +
                ' WHERE vendaId = :ID';
  Result.Params := nil;
end;

function TCtrlItemVenda.GetSQLExclusao: TParamsSQL;
begin
  Result.SQL := 'DELETE FROM itens_vendas ' +
                ' WHERE vendaId = :ID';
  Result.Params := nil;
end;

function TCtrlItemVenda.GetSQLInclusao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := ' INSERT INTO itens_vendas (' +
                ' vendaId,' +
                ' produtoId,' +
                ' descricao,' +
                ' precoUnitario,' +
                ' quantidade) VALUES (' +
                ItemVenda.vendaId.ToString + ',' +
                ItemVenda.produtoId.ToString + ',' +
                QuotedStr(ItemVenda.descricao) + ',' +
                ':PRECO_UNITARIO,' +
                ':QUANTIDADE' +
                ')';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'PRECO_UNITARIO';
  vParam.AsFloat := ItemVenda.precoUnitario;

  vParam := Result.Params.AddParameter;
  vParam.Name := 'QUANTIDADE';
  vParam.AsFloat := ItemVenda.quantidade;
end;

procedure TCtrlItemVenda.PreencherEntidade;
begin
  inherited;
  ItemVenda.vendaId := DataSet.FieldByName('vendaId').AsInteger;
  ItemVenda.produtoId := DataSet.FieldByName('produtoId').AsInteger;
  ItemVenda.descricao := DataSet.FieldByName('descricao').AsString;
  ItemVenda.precoUnitario := DataSet.FieldByName('precoUnitario').AsFloat;
  ItemVenda.quantidade := DataSet.FieldByName('quantidade').AsFloat;
end;

procedure TCtrlItemVenda.PreencherEntidadeLista();
begin
  inherited;
  DataSet.First;
  while not DataSet.Eof do
  begin
    ItemVenda := TItemVenda.Create;
    PreencherEntidade();
    Lista.Add(ItemVenda);
    DataSet.Next;
  end;
end;

function TCtrlItemVenda.Gravar(id: Integer): Boolean;
var
  vCount: Integer;
  vStatus: String;
begin
  if ItemVenda.precoUnitario <= 0 then
  begin
    Atencao('O produto não pode ser gravado com preço unitário zerado!');
    Result := False;
    Exit;
  end;

  if ItemVenda.quantidade <= 0 then
  begin
    Atencao('O produto não pode ser gravado com quantidade zerada!');
    Result := False;
    Exit;
  end;

  if ItemVenda.produtoId = 0 then
  begin
    Result := False;
    Atencao('É necessário informar o produto!');
    Exit;
  end;

  vCount := ConsultaSQL('SELECT COUNT(produtoId) FROM produtos WHERE produtoId = ' + ItemVenda.produtoId.ToString);
  if vCount = 0 then
  begin
    Result := False;
    Atencao('O produto informado não foi encontrado!');
    Exit;
  end;

  vStatus := ConsultaSQL('SELECT status FROM produtos WHERE produtoId = ' + ItemVenda.produtoId.ToString);
  if vStatus <> 'A' then
  begin
    Result := False;
    Atencao('O produto informado não está ativo!');
    Exit;
  end;

  Result := inherited Gravar(id);
end;

end.
