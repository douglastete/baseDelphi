unit CtrlBase;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Forms, SysUtils, System.Classes, Generics.Collections;

type
  {$M+}
  TParamsSQL = record
    SQL: String;
    Params: TParams;
  end;

  TCtrlBase = class(TObject)
  private
    FDataSet: TFDQuery;
    FLista: TList<TObject>;
  published
    property DataSet: TFDQuery read FDataSet write FDataSet;
    property Lista: TList<TObject> read FLista write FLista;
    function Gravar(id: Integer): Boolean; virtual;
    function Consultar(id: Integer; pLista: Boolean = False): Boolean;
    function Excluir(id: Integer): Boolean;
    function GetSQLConsulta(): TParamsSQL; virtual; abstract;
    function GetSQLExclusao(): TParamsSQL; virtual; abstract;
    function GetSQLInclusao(): TParamsSQL; virtual; abstract;
    function GetSQLAlteracao(): TParamsSQL; virtual; abstract;
    procedure PreencherEntidade(); virtual; abstract;
    procedure PreencherEntidadeLista(); virtual; abstract;
    function ConsultaSQL(pSQL: String): Variant;
    procedure ExecutarSQL(pSQL: String);
  public
    constructor Create; overload;
    destructor Destroy; reintroduce;
  end;

implementation

{ TCtrlBase }

uses Biblio, VarGlobal;

function TCtrlBase.Consultar(id: Integer; pLista: Boolean = False): Boolean;
var
  vParamsSQL: TParamsSQL;
  I: Integer;
begin
  try
    if FDataSet.Active then
    begin
      FDataSet.Close;
    end;
    FDataSet.SQL.Clear;
    vParamsSQL := GetSQLConsulta();
    FDataSet.SQL.Add(vParamsSQL.SQL);
    if Assigned(vParamsSQL.Params) then
    begin
      for I := 0 to vParamsSQL.Params.Count -1 do
      begin
        FDataSet.ParamByName(vParamsSQL.Params[I].Name).Value := vParamsSQL.Params[I].Value;
      end;
    end;
    FDataSet.ParamByName('id').AsInteger := id;
    FDataSet.Open();
    PreencherEntidade();
    if pLista then
    begin
      PreencherEntidadeLista();
    end;
    Result := not FDataSet.IsEmpty;
  except
    on E: Exception do
    begin
      Atencao(E.Message);
      Result := False;
    end;
  end;
end;

function TCtrlBase.Excluir(id: Integer): Boolean;
var
  vParamsSQL: TParamsSQL;
  I: Integer;
begin
  try
    if FDataSet.Active then
    begin
      FDataSet.Close;
    end;
    FDataSet.SQL.Clear;
    vParamsSQL := GetSQLExclusao();
    FDataSet.SQL.Add(vParamsSQL.SQL);
    if Assigned(vParamsSQL.Params) then
    begin
      for I := 0 to vParamsSQL.Params.Count -1 do
      begin
        FDataSet.ParamByName(vParamsSQL.Params[I].Name).Value := vParamsSQL.Params[I].Value;
      end;
    end;
    FDataSet.ParamByName('id').AsInteger := id;
    FDataSet.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      Atencao(E.Message);
      Result := False;
    end;
  end;
end;

function TCtrlBase.Gravar(id: Integer): Boolean;
var
  vParamsSQL: TParamsSQL;
  I: Integer;
begin
  try
    if FDataSet.Active then
    begin
      FDataSet.Close;
    end;
    FDataSet.SQL.Clear;
    if (id = 0) then
    begin
      vParamsSQL := GetSQLInclusao();
    end
    else
    begin
      vParamsSQL := GetSQLAlteracao();
    end;
    FDataSet.SQL.Add(vParamsSQL.SQL);
    if Assigned(vParamsSQL.Params) then
    begin
      for I := 0 to vParamsSQL.Params.Count -1 do
      begin
        FDataSet.ParamByName(vParamsSQL.Params[I].Name).Value := vParamsSQL.Params[I].Value;
      end;
    end;
    if (id > 0) then
    begin
      FDataSet.ParamByName('id').AsInteger := id;
    end;

    FDataSet.ExecSQL();
    Result := True;
  except
    on E: Exception do
    begin
      Atencao(E.Message);
      Result := False;
    end;
  end;
end;

function TCtrlBase.ConsultaSQL(pSQL: String): Variant;
begin
  if FDataSet.Active then
  begin
    FDataSet.Close;
  end;
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add(pSQL);
  FDataSet.Open();
  if FDataSet.Fields[0].IsNull then
  begin
    case FDataSet.Fields[0].DataType of
      ftString, ftMemo, ftOraClob: Result := '';
    else
      Result:=0;
    end;
  end
  else
  begin
    Result := FDataSet.Fields[0].AsVariant;
  end;
end;

procedure TCtrlBase.ExecutarSQL(pSQL: String);
begin
  if FDataSet.Active then
  begin
    FDataSet.Close;
  end;
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add(pSQL);
  FDataSet.ExecSQL();
end;

constructor TCtrlBase.Create;
begin
  inherited;
  FDataSet := TFDQuery.Create(Application);
  FDataSet.Connection := Conexao.Connection;
  FLista := TList<TObject>.Create;
end;

destructor TCtrlBase.Destroy;
begin
  if DataSet.Active then
  begin
    DataSet.Close;
  end;
  FreeAndNil(FDataSet);
  inherited Destroy;
end;

end.
