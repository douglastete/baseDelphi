program Montreal;

uses
  Vcl.Forms,
  SysUtils,
  Principal in 'Principal.pas' {FormPrincipal},
  uConexao in 'uConexao.pas',
  VarGlobal in 'VarGlobal.pas',
  Biblio in 'Biblio.pas',
  EntPessoa in 'Entidades\EntPessoa.pas',
  CtrlBase in 'Controladores\CtrlBase.pas',
  CtrlPessoa in 'Controladores\CtrlPessoa.pas',
  CtrlCliente in 'Controladores\CtrlCliente.pas',
  CtrlFornecedor in 'Controladores\CtrlFornecedor.pas',
  CtrlProduto in 'Controladores\CtrlProduto.pas',
  EntProduto in 'Entidades\EntProduto.pas',
  Master in 'Master.pas' {FormMaster},
  MasterCad in 'MasterCad.pas' {FormMasterCad},
  CadProdutos in 'CadProdutos.pas' {FormCadProdutos},
  CadClientes in 'CadClientes.pas' {FormCadClientes},
  CadFornecedores in 'CadFornecedores.pas' {FormCadFornecedores},
  RelClientes in 'RelClientes.pas' {FormRelClientes},
  EntVenda in 'Entidades\EntVenda.pas',
  CtrlVenda in 'Controladores\CtrlVenda.pas',
  EntItemVenda in 'Entidades\EntItemVenda.pas',
  CtrlItemVenda in 'Controladores\CtrlItemVenda.pas',
  CadVendas in 'CadVendas.pas' {FormCadVendas},
  RelVendas in 'RelVendas.pas' {FormRelVendas};

{$R *.res}

begin
  Application.Initialize;

  _LocalEXE := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));

  Conexao := TConexao.Create;
  Conexao.ConectarBD();

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
