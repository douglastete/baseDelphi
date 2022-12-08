unit CadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MasterCad, uPesquisa, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, StrUtils, Vcl.Buttons, Data.DB;

type
  TFormCadProdutos = class(TFormMasterCad)
    edtDescricao: TLabeledEdit;
    edtPrecoUnitario: TLabeledEdit;
    edtFornecedor: TLabeledEdit;
    ckbAtivo: TCheckBox;
    edtFornecedorNome: TEdit;
    btnBuscarFornecedor: TSpeedButton;
    psqFornecedores: TPesquisa;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPrecoUnitarioExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CarregarRegistro(pID: Integer): Boolean; override;
    function GravarRegistro(): Boolean; override;
    function ApagarRegistro(): Boolean; override;
    procedure LimparTela(); override;
  end;

var
  FormCadProdutos: TFormCadProdutos;

implementation

{$R *.dfm}

uses uConexao, Biblio, VarGlobal, CtrlProduto;

function TFormCadProdutos.ApagarRegistro: Boolean;
var
  vProduto: TCtrlProduto;
begin
  vProduto := TCtrlProduto.Create();
  Result := vProduto.Excluir(StrToIntDef(edtCodigo.Text, 0));
end;

function TFormCadProdutos.CarregarRegistro(pID: Integer): Boolean;
var
  vProduto: TCtrlProduto;
begin
  Result := False;
  if pID > 0 then
  begin
    vProduto := TCtrlProduto.Create;
    if not vProduto.Consultar(pID) then
    begin
      Exit;
    end;
    edtDescricao.Text := vProduto.Produto.descricao;
    edtPrecoUnitario.Text := FormatFloat('0.00', vProduto.Produto.precoUnitario);
    edtFornecedor.Text := vProduto.Produto.fornecedorId.ToString;
    edtFornecedorNome.Text := vProduto.Produto.fornecedorNome;
    ckbAtivo.Checked := (vProduto.Produto.status = 'A');
    Result := True;
  end;
end;

procedure TFormCadProdutos.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if EstadoTela = dsInsert then
  begin
    ckbAtivo.Checked := True;
  end;
end;

procedure TFormCadProdutos.edtPrecoUnitarioExit(Sender: TObject);
begin
  inherited;
  edtPrecoUnitario.Text := FormatFloat('0.00', StrToFloatDef(edtPrecoUnitario.Text, 0));
end;

procedure TFormCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormCadProdutos := nil;
  inherited;
end;

procedure TFormCadProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  edtFoco := edtDescricao;
  psqPadrao.Conexao := Conexao.Connection;
  psqFornecedores.Conexao := Conexao.Connection;
end;

function TFormCadProdutos.GravarRegistro: Boolean;
var
  vProduto: TCtrlProduto;
begin
  vProduto := TCtrlProduto.Create();
  vProduto.Produto.produtoId := StrToIntDef(edtCodigo.Text, 0);
  vProduto.Produto.descricao := edtDescricao.Text;
  vProduto.Produto.precoUnitario := StrToFloatDef(edtPrecoUnitario.Text, 0);
  vProduto.Produto.status := IfThen(ckbAtivo.Checked, 'A', 'I');
  vProduto.Produto.fornecedorId := StrToIntDef(edtFornecedor.Text, 0);
  Result := vProduto.Gravar(vProduto.Produto.produtoId);
end;

procedure TFormCadProdutos.LimparTela;
begin
  inherited;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtPrecoUnitario.Clear;
  ckbAtivo.Checked := False;
  edtFornecedor.Clear;
  edtFornecedorNome.Clear;
end;

end.
