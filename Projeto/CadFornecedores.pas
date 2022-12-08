unit CadFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MasterCad, uPesquisa, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, StrUtils, Vcl.Buttons, Data.DB,
  Vcl.Mask;

type
  TFormCadFornecedores = class(TFormMasterCad)
    edtRazaoSocial: TLabeledEdit;
    ckbAtivo: TCheckBox;
    lblCNPJ: TLabel;
    edtCNPJ: TMaskEdit;
    edtNomeFantasia: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  FormCadFornecedores: TFormCadFornecedores;

implementation

{$R *.dfm}

uses uConexao, Biblio, VarGlobal, CtrlFornecedor;

function TFormCadFornecedores.ApagarRegistro: Boolean;
var
  vFornecedor: TCtrlFornecedor;
begin
  vFornecedor := TCtrlFornecedor.Create();
  Result := vFornecedor.Excluir(StrToIntDef(edtCodigo.Text, 0));
end;

function TFormCadFornecedores.CarregarRegistro(pID: Integer): Boolean;
var
  vFornecedor: TCtrlFornecedor;
begin
  Result := False;
  if pID > 0 then
  begin
    vFornecedor := TCtrlFornecedor.Create;
    if not vFornecedor.Consultar(pID) then
    begin
      Exit;
    end;
    edtRazaoSocial.Text := vFornecedor.Pessoa.nome;
    edtNomeFantasia.Text := vFornecedor.Pessoa.nomeFantasia;
    edtCNPJ.Text := vFornecedor.Pessoa.cpfCnpj;
    ckbAtivo.Checked := (vFornecedor.Pessoa.status = 'A');
    Result := True;
  end;
end;

procedure TFormCadFornecedores.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if EstadoTela = dsInsert then
  begin
    ckbAtivo.Checked := True;
  end;
end;

procedure TFormCadFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormCadFornecedores := nil;
  inherited;
end;

procedure TFormCadFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  edtFoco := edtRazaoSocial;
  psqPadrao.Conexao := Conexao.Connection;
end;

function TFormCadFornecedores.GravarRegistro: Boolean;
var
  vFornecedor: TCtrlFornecedor;
begin
  vFornecedor := TCtrlFornecedor.Create();
  vFornecedor.Pessoa.pessoaId := StrToIntDef(edtCodigo.Text, 0);
  vFornecedor.Pessoa.nome := edtRazaoSocial.Text;
  vFornecedor.Pessoa.nomeFantasia := edtNomeFantasia.Text;
  vFornecedor.Pessoa.cpfCnpj := edtCNPJ.Text;
  vFornecedor.Pessoa.status := IfThen(ckbAtivo.Checked, 'A', 'I');
  Result := vFornecedor.Gravar(vFornecedor.Pessoa.pessoaId);
end;

procedure TFormCadFornecedores.LimparTela;
begin
  inherited;
  edtCodigo.Clear;
  edtRazaoSocial.Clear;
  edtNomeFantasia.Clear;
  edtCNPJ.Clear;
  ckbAtivo.Checked := False;
end;

end.
