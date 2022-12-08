unit EntPessoa;

interface

type
  {$M+}
  TPessoa = class(TObject)
  private
    FCpfCnpj: string;
    FDtNascimento: TDate;
    FStatus: string;
    FPessoaId: Integer;
    FNome: string;
    FTipo: string;
    FNomeFantasia: string;
  published
    property pessoaId: Integer read FPessoaId write FPessoaId;
    property nome: string read FNome write FNome;
    property cpfCnpj: string read FCpfCnpj write FCpfCnpj;
    property status: string read FStatus write FStatus;
    property dtnascimento: TDate read FDtNascimento write FDtNascimento;
    property nomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property tipo: string read FTipo write FTipo;
  end;

implementation

end.
