unit CtrlPessoa;

interface

uses
  CtrlBase, EntPessoa, StrUtils, SysUtils, Data.DB;

type
  TCtrlPessoa = class(TCtrlBase)
  private
  published
    function GetSQLConsulta(): TParamsSQL; override;
    function GetSQLExclusao(): TParamsSQL; override;
    function GetSQLInclusao(): TParamsSQL; override;
    function GetSQLAlteracao(): TParamsSQL; override;
    procedure PreencherEntidade(); override;
    procedure PreencherEntidadeLista(); override;
  public
    Pessoa: TPessoa;
    constructor Create; overload;
  end;

implementation

{ TCtrlPessoa }

constructor TCtrlPessoa.Create;
begin
  inherited Create();
  Pessoa := TPessoa.Create;
  Pessoa.status := 'A';
end;

function TCtrlPessoa.GetSQLAlteracao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := 'UPDATE pessoas SET ' +
                ' nome = ' + QuotedStr(Pessoa.nome) + ',' +
                ' cpfCnpj = ' + QuotedStr(Pessoa.cpfCnpj) + ',' +
                ' status = ' + QuotedStr(Pessoa.status) + ',' +
                ' dtnascimento = :DTNASCIMENTO, ' +
                ' nomeFantasia = ' + QuotedStr(Pessoa.nomeFantasia) + ',' +
                ' tipo = ' + QuotedStr(Pessoa.tipo) +
                ' WHERE pessoaId = :ID';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'DTNASCIMENTO';
  vParam.AsDate := Pessoa.dtnascimento;
end;

function TCtrlPessoa.GetSQLConsulta: TParamsSQL;
begin
  Result.SQL := 'SELECT pessoaId,' +
                '       nome,' +
                '       cpfCnpj,' +
                '       status,' +
                '       dtnascimento,' +
                '       nomeFantasia,' +
                '       tipo' +
                '  FROM pessoas ' +
                ' WHERE pessoaId = :ID';
  Result.Params := nil;
end;

function TCtrlPessoa.GetSQLExclusao: TParamsSQL;
begin
  Result.SQL := 'DELETE FROM pessoas ' +
                ' WHERE pessoaId = :ID';
  Result.Params := nil;
end;

function TCtrlPessoa.GetSQLInclusao: TParamsSQL;
var
  vParam: TParam;
begin
  Result.SQL := ' INSERT INTO pessoas (' +
                ' nome,' +
                ' cpfCnpj,' +
                ' status,' +
                ' dtnascimento,' +
                ' nomeFantasia,' +
                ' tipo) VALUES (' +
                QuotedStr(Pessoa.nome) + ',' +
                QuotedStr(Pessoa.cpfCnpj) + ',' +
                QuotedStr(Pessoa.status) + ',' +
                ':DTNASCIMENTO, ' +
                QuotedStr(Pessoa.nomeFantasia) + ',' +
                QuotedStr(Pessoa.tipo) +
                ')';

  Result.Params := TParams.Create(nil);
  vParam := Result.Params.AddParameter;
  vParam.Name := 'DTNASCIMENTO';
  vParam.AsDate := Pessoa.dtnascimento;
end;

procedure TCtrlPessoa.PreencherEntidade;
begin
  inherited;
  Pessoa.pessoaId := DataSet.FieldByName('pessoaId').AsInteger;
  Pessoa.nome := DataSet.FieldByName('nome').AsString;
  Pessoa.cpfCnpj := DataSet.FieldByName('cpfCnpj').AsString;
  Pessoa.status := DataSet.FieldByName('status').AsString;
  Pessoa.dtnascimento := DataSet.FieldByName('dtnascimento').AsDateTime;
  Pessoa.nomeFantasia := DataSet.FieldByName('nomeFantasia').AsString;
  Pessoa.tipo := DataSet.FieldByName('tipo').AsString;
end;

procedure TCtrlPessoa.PreencherEntidadeLista();
begin
  inherited;
  DataSet.First;
  while not DataSet.Eof do
  begin
    Pessoa := TPessoa.Create;
    PreencherEntidade();
    Lista.Add(Pessoa);
    DataSet.Next;
  end;
end;

end.
