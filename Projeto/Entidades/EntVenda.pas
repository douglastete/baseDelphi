unit EntVenda;

interface

uses
  Generics.Collections, EntItemVenda;

type
  {$M+}
  TVenda = class(TObject)
  private
    FStatus: string;
    FDataHora: TDateTime;
    FListaItens: TObjectList<TItemVenda>;
    FValorTotal: Double;
    FVendaId: Integer;
    FClienteId: Integer;
    FClienteNome: String;
  published
    property vendaId: Integer read FVendaId write FVendaId;
    property clienteId: Integer read FClienteId write FClienteId;
    property clienteNome: String read FClienteNome write FClienteNome;
    property dataHora: TDateTime read FDataHora write FDataHora;
    property ListaItens: TObjectList<TItemVenda> read FListaItens write FListaItens;
    property valorTotal: Double read FValorTotal write FValorTotal;
    property status: string read FStatus write FStatus;
  public
    constructor Create; overload;
    destructor Destroy; reintroduce; overload;
  end;

implementation

{ TVenda }

constructor TVenda.Create;
begin
  inherited Create;
  ListaItens := TObjectList<TItemVenda>.Create;
end;

destructor TVenda.Destroy;
begin
  ListaItens.Destroy;
  inherited Destroy;
end;

end.
