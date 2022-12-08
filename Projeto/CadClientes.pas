unit CadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MasterCad, uPesquisa, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, StrUtils, Vcl.Buttons, Data.DB,
  Vcl.Mask;

type
  TFormCadClientes = class(TFormMasterCad)
    edtNome: TLabeledEdit;
    ckbAtivo: TCheckBox;
    lblDtNascimento: TLabel;
    lblCPF: TLabel;
    edtDtNascimento: TMaskEdit;
    edtCPF: TMaskEdit;
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
  FormCadClientes: TFormCadClientes;

implementation

{$R *.dfm}

uses uConexao, Biblio, VarGlobal, CtrlCliente;

function TFormCadClientes.ApagarRegistro: Boolean;
var
  vCliente: TCtrlCliente;
begin
  vCliente := TCtrlCliente.Create();
  Result := vCliente.Excluir(StrToIntDef(edtCodigo.Text, 0));
end;

function TFormCadClientes.CarregarRegistro(pID: Integer): Boolean;
var
  vCliente: TCtrlCliente;
begin
  Result := False;
  if pID > 0 then
  begin
    vCliente := TCtrlCliente.Create;
    if not vCliente.Consultar(pID) then
    begin
      Exit;
    end;
    edtNome.Text := vCliente.Pessoa.nome;
    edtCPF.Text := vCliente.Pessoa.cpfCnpj;
    edtDtNascimento.Text := FormatDateTime('dd/MM/yyyy', vCliente.Pessoa.dtnascimento);
    ckbAtivo.Checked := (vCliente.Pessoa.status = 'A');
    Result := True;
  end;
end;

procedure TFormCadClientes.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if EstadoTela = dsInsert then
  begin
    ckbAtivo.Checked := True;
  end;
end;

procedure TFormCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormCadClientes := nil;
  inherited;
end;

procedure TFormCadClientes.FormCreate(Sender: TObject);
begin
  inherited;
  edtFoco := edtNome;
  psqPadrao.Conexao := Conexao.Connection;
end;

function TFormCadClientes.GravarRegistro: Boolean;
var
  vCliente: TCtrlCliente;
begin
  vCliente := TCtrlCliente.Create();
  vCliente.Pessoa.pessoaId := StrToIntDef(edtCodigo.Text, 0);
  vCliente.Pessoa.nome := edtNome.Text;
  vCliente.Pessoa.cpfCnpj := edtCPF.Text;
  vCliente.Pessoa.dtnascimento := StrToDateDef(edtDtNascimento.Text, 0);
  vCliente.Pessoa.status := IfThen(ckbAtivo.Checked, 'A', 'I');
  Result := vCliente.Gravar(vCliente.Pessoa.pessoaId);
end;

procedure TFormCadClientes.LimparTela;
begin
  inherited;
  edtCodigo.Clear;
  edtNome.Clear;
  edtCPF.Clear;
  edtDtNascimento.Clear;
  ckbAtivo.Checked := False;
end;

end.
