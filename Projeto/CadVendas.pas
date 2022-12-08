unit CadVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MasterCad, uPesquisa, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, StrUtils,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TFormCadVendas = class(TFormMasterCad)
    edtCliente: TLabeledEdit;
    btnBuscarCliente: TSpeedButton;
    edtClienteNome: TEdit;
    edtValorTotal: TLabeledEdit;
    lblDtNascimento: TLabel;
    edtDataHoraVenda: TMaskEdit;
    lblStatusDesc: TLabel;
    lblStatus: TLabel;
    psqClientes: TPesquisa;
    gpbItens: TGroupBox;
    edtProdutoNome: TEdit;
    btnBuscarProduto: TSpeedButton;
    edtProdutoID: TLabeledEdit;
    edtPrecoUnitario: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    edtValorTotalItem: TLabeledEdit;
    btnLimparDadosItem: TSpeedButton;
    btnConfirmarItem: TSpeedButton;
    dbgItens: TDBGrid;
    cdsItensVenda: TClientDataSet;
    cdsItensVendaprodutoId: TIntegerField;
    cdsItensVendadescricao: TStringField;
    cdsItensVendaprecoUnitario: TFloatField;
    cdsItensVendaquantidade: TFloatField;
    dtsItensVenda: TDataSource;
    psqProdutos: TPesquisa;
    cdsItensVendatotalVenda: TAggregateField;
    cdsItensVendavalorTotal: TFloatField;
    btnEfetivar: TButton;
    procedure edtCodigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparDadosItemClick(Sender: TObject);
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure dbgItensDblClick(Sender: TObject);
    procedure edtPrecoUnitarioChange(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure cdsItensVendaAfterPost(DataSet: TDataSet);
    procedure psqProdutosPreencherCampos(Sender: TObject);
    procedure cdsItensVendaCalcFields(DataSet: TDataSet);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnEfetivarClick(Sender: TObject);
    procedure dbgItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure LimparDadosItem();
    procedure CalcularTotalItem();
    { Private declarations }
  public
    { Public declarations }
    function ApagarRegistro(): Boolean; override;
    function CarregarRegistro(pID: Integer): Boolean; override;
    function GravarRegistro(): Boolean; override;
    procedure LimparTela(); override;
    procedure ControleBotoes(); override;
  end;

var
  FormCadVendas: TFormCadVendas;

implementation

{$R *.dfm}

uses CtrlVenda, VarGlobal, Biblio, CtrlItemVenda, EntItemVenda;

function TFormCadVendas.ApagarRegistro: Boolean;
var
  vVenda: TCtrlVenda;
begin
  vVenda := TCtrlVenda.Create();
  Result := vVenda.Excluir(StrToIntDef(edtCodigo.Text, 0));
end;

function TFormCadVendas.CarregarRegistro(pID: Integer): Boolean;
var
  vVenda: TCtrlVenda;
  vItensVenda: TCtrlItemVenda;
  I: Integer;
begin
  Result := False;
  if pID > 0 then
  begin
    vVenda := TCtrlVenda.Create;
    if not vVenda.Consultar(pID) then
    begin
      Exit;
    end;
    edtCliente.Text := vVenda.Venda.clienteId.ToString;
    edtClienteNome.Text := vVenda.Venda.clienteNome;
    edtValorTotal.Text := FormatFloat('0.00', vVenda.Venda.valorTotal);
    edtDataHoraVenda.Text := FormatDateTime('dd/MM/yyyy hh:nn', vVenda.Venda.dataHora);
    lblStatus.Caption := IfThen(vVenda.Venda.status = 'P', 'Pendente', 'Efetivada');
    if lblStatus.Caption = 'Pendente' then
    begin
      lblStatus.Font.Color := clBlue;
    end
    else
    begin
      lblStatus.Font.Color := clGreen;
    end;
    lblStatus.Refresh;

    vItensVenda := TCtrlItemVenda.Create;
    if not vItensVenda.Consultar(pID, True) then
    begin
      Exit;
    end;

    for I := 0 to vItensVenda.Lista.Count -1 do
    begin
      cdsItensVenda.Append;
      cdsItensVendaprodutoId.AsInteger := (vItensVenda.Lista[I] as TItemVenda).produtoId;
      cdsItensVendadescricao.AsString := (vItensVenda.Lista[I] as TItemVenda).descricao;
      cdsItensVendaprecoUnitario.AsFloat := (vItensVenda.Lista[I] as TItemVenda).precoUnitario;
      cdsItensVendaquantidade.AsFloat := (vItensVenda.Lista[I] as TItemVenda).quantidade;
      cdsItensVenda.Post;
    end;

    Result := True;
  end;
end;

procedure TFormCadVendas.cdsItensVendaAfterPost(DataSet: TDataSet);
begin
  inherited;
  edtValorTotal.Text := FormatFloat('0.00', cdsItensVendatotalVenda.Value);
end;

procedure TFormCadVendas.cdsItensVendaCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsItensVendavalorTotal.AsFloat := (cdsItensVendaquantidade.AsFloat * cdsItensVendaprecoUnitario.AsFloat);
end;

procedure TFormCadVendas.ControleBotoes;
begin
  inherited;
  btnEfetivar.Enabled := acExcluir.Enabled and (lblStatus.Caption = 'Pendente');
  btnExcluir.Enabled := acExcluir.Enabled and (lblStatus.Caption = 'Pendente');
  btnAlterar.Enabled := btnExcluir.Enabled;
end;

procedure TFormCadVendas.dbgItensDblClick(Sender: TObject);
begin
  inherited;
  edtProdutoID.Text := cdsItensVendaprodutoId.AsString;
  edtProdutoNome.Text := cdsItensVendadescricao.AsString;
  edtPrecoUnitario.Text := FormatFloat('0.00', cdsItensVendaprecoUnitario.AsFloat);
  edtQuantidade.Text := FormatFloat('0.00', cdsItensVendaquantidade.AsFloat);
  edtValorTotal.Text := FormatFloat('0.00', cdsItensVendavalorTotal.AsFloat);
end;

procedure TFormCadVendas.dbgItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if KEY <> VK_DELETE then
  begin
    Exit;
  end;

  if Perguntar('Deseja realmente excluir esse item?') then
  begin
    cdsItensVenda.Delete;
  end;
end;

procedure TFormCadVendas.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if EstadoTela = dsInsert then
  begin
    lblStatus.Caption := 'Pendente';
    edtDataHoraVenda.Text := FormatDateTime('dd/MM/yyyy hh:nn', Now);
  end;
end;

procedure TFormCadVendas.edtPrecoUnitarioChange(Sender: TObject);
begin
  inherited;
  CalcularTotalItem();
end;

procedure TFormCadVendas.CalcularTotalItem();
begin
  edtValorTotalItem.Text := FormatFloat('0.00', StrToFloatDef(edtPrecoUnitario.Text, 0) * StrToFloatDef(edtQuantidade.Text, 0));
end;

procedure TFormCadVendas.edtQuantidadeChange(Sender: TObject);
begin
  inherited;
  CalcularTotalItem();
end;

procedure TFormCadVendas.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    btnConfirmarItem.Click;
  end;
end;

procedure TFormCadVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FormCadVendas := nil;
end;

procedure TFormCadVendas.FormCreate(Sender: TObject);
begin
  inherited;
  edtFoco := edtCliente;
  psqPadrao.Conexao := Conexao.Connection;
  psqClientes.Conexao := Conexao.Connection;
  psqProdutos.Conexao := Conexao.Connection;
  cdsItensVenda.CreateDataSet;
  LimparTela;
end;

function TFormCadVendas.GravarRegistro: Boolean;
var
  vVenda: TCtrlVenda;
  vItemVenda: TItemVenda;
begin
  if cdsItensVenda.IsEmpty then
  begin
    Atencao('Não é possível gravar uma venda sem itens!');
    edtProdutoID.SetFocus;
    Result := False;
    Exit;
  end;

  vVenda := TCtrlVenda.Create();
  vVenda.Venda.vendaId := StrToIntDef(edtCodigo.Text, 0);
  vVenda.Venda.clienteId := StrToIntDef(edtCliente.Text, 0);
  vVenda.Venda.valorTotal := StrToFloatDef(edtValorTotal.Text, 0);
  vVenda.Venda.status := Copy(lblStatus.Caption, 1, 1);
  vVenda.Venda.dataHora := StrToDateTimeDef(edtDataHoraVenda.Text, 0);

  cdsItensVenda.First;
  while not cdsItensVenda.Eof do
  begin
    vItemVenda := TItemVenda.Create;
    vItemVenda.vendaId := vVenda.Venda.vendaId;
    vItemVenda.produtoId := cdsItensVendaprodutoId.AsInteger;
    vItemVenda.descricao := cdsItensVendadescricao.AsString;
    vItemVenda.precoUnitario := cdsItensVendaprecoUnitario.AsFloat;
    vItemVenda.quantidade := cdsItensVendaquantidade.AsFloat;
    vVenda.Venda.ListaItens.Add(vItemVenda);
    cdsItensVenda.Next;
  end;

  Result := vVenda.Gravar(vVenda.Venda.vendaId);
end;

procedure TFormCadVendas.LimparTela;
begin
  inherited;
  edtCodigo.Clear;
  edtCliente.Clear;
  edtClienteNome.Clear;
  lblStatus.Caption := '';
  edtValorTotal.Clear;
  edtDataHoraVenda.Clear;
  cdsItensVenda.EmptyDataSet;
end;

procedure TFormCadVendas.psqProdutosPreencherCampos(Sender: TObject);
begin
  inherited;
  if Trim(edtProdutoID.Text).IsEmpty then
  begin
    Exit;
  end;

  if cdsItensVenda.Locate('produtoId', edtProdutoID.Text, []) then
  begin
    Atencao('Produto já inserido na venda!');
    edtProdutoID.SetFocus;
    Exit;
  end;

  edtPrecoUnitario.Text := FormatFloat('0.00', psqProdutos.TabelaResultado.FieldByName('precoUnitario').AsFloat);
end;

procedure TFormCadVendas.btnConfirmarItemClick(Sender: TObject);
begin
  inherited;
  if StrToFloatDef(edtPrecoUnitario.Text, 0) = 0 then
  begin
    Atencao('Não é possível vender item com preço unitário zerado!');
    edtProdutoID.SetFocus;
    Exit;
  end;

  if StrToFloatDef(edtQuantidade.Text, 0) = 0 then
  begin
    Atencao('Não é possível vender item com quantidade zerada!');
    edtProdutoID.SetFocus;
    Exit;
  end;

  if cdsItensVenda.Locate('produtoId', edtProdutoID.Text, []) then
  begin
    cdsItensVenda.Edit;
  end
  else
  begin
    cdsItensVenda.Append;
  end;

  cdsItensVendaprodutoId.AsInteger := StrToIntDef(edtProdutoID.Text, 0);
  cdsItensVendadescricao.AsString := edtProdutoNome.Text;
  cdsItensVendaprecoUnitario.AsFloat := StrToFloatDef(edtPrecoUnitario.Text, 0);
  cdsItensVendaquantidade.AsFloat := StrToFloatDef(edtQuantidade.Text, 0);
  cdsItensVenda.Post;
  LimparDadosItem();
end;

procedure TFormCadVendas.btnEfetivarClick(Sender: TObject);
var
  vVenda: TCtrlVenda;
begin
  inherited;
  vVenda := TCtrlVenda.Create();
  if vVenda.EfetivarVenda(StrToIntDef(edtCodigo.Text, 0)) then
  begin
    Informar('Venda efetivada com sucesso!');
    LimparTela();
    EstadoTela := dsInactive;
    ControleBotoes;
    edtCodigo.SetFocus;
  end;
end;

procedure TFormCadVendas.btnLimparDadosItemClick(Sender: TObject);
begin
  inherited;
  LimparDadosItem();
end;

procedure TFormCadVendas.LimparDadosItem();
begin
  edtProdutoID.Clear;
  edtProdutoNome.Clear;
  edtPrecoUnitario.Clear;
  edtQuantidade.Clear;
  edtValorTotalItem.Clear;
end;

end.
