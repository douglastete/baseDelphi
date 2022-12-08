unit EntProduto;

interface

type
  {$M+}
  TProduto = class(TObject)
  private
    FStatus: string;
    FProdutoId: Integer;
    FFornecedorId: Integer;
    FDescricao: string;
    FPrecoUnitario: Double;
    FFornecedorNome: String;
  published
    property produtoId: Integer read FProdutoId write FProdutoId;
    property descricao: string read FDescricao write FDescricao;
    property precoUnitario: Double read FPrecoUnitario write FPrecoUnitario;
    property fornecedorId: Integer read FFornecedorId write FFornecedorId;
    property fornecedorNome: String read FFornecedorNome write FFornecedorNome;
    property status: string read FStatus write FStatus;
  end;

implementation

end.
