unit EntItemVenda;

interface

type
  {$M+}
  TItemVenda = class(TObject)
  private
    FDescricao: String;
    FProdutoID: Integer;
    FPrecoUnitario: Double;
    FQuantidade: Double;
    FVendaID: Integer;
  published
    property vendaId: Integer read FVendaID write FVendaID;
    property produtoId: Integer read FProdutoID write FProdutoID;
    property descricao: String read FDescricao write FDescricao;
    property precoUnitario: Double read FPrecoUnitario write FPrecoUnitario;
    property quantidade: Double read FQuantidade write FQuantidade;
  end;

implementation

end.
