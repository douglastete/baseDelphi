unit RelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Master, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, uPesquisa;

type
  TFormRelVendas = class(TFormMaster)
    btnImprimir: TButton;
    qryVendas: TFDQuery;
    frxDBVendas: TfrxDBDataset;
    frxVendas: TfrxReport;
    gpbFiltros: TGroupBox;
    lblStatus: TLabel;
    cmbStatus: TComboBox;
    qryVendasvendaId: TFDAutoIncField;
    qryVendasclienteId: TIntegerField;
    qryVendasdataHora: TSQLTimeStampField;
    qryVendasstatus: TStringField;
    qryVendasvalorTotal: TBCDField;
    qryVendasclienteNome: TStringField;
    qryItensVendas: TFDQuery;
    qryItensVendasvendaId: TIntegerField;
    qryItensVendasprodutoId: TIntegerField;
    qryItensVendasdescricao: TWideStringField;
    qryItensVendasprecoUnitario: TBCDField;
    qryItensVendasquantidade: TBCDField;
    frxDBItensVenda: TfrxDBDataset;
    edtCliente: TLabeledEdit;
    btnBuscarCliente: TSpeedButton;
    edtClienteNome: TEdit;
    psqClientes: TPesquisa;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryVendasAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    SQLPadrao: String;
  public
    { Public declarations }
  end;

var
  FormRelVendas: TFormRelVendas;

implementation

{$R *.dfm}

uses VarGlobal, Biblio;

procedure TFormRelVendas.btnImprimirClick(Sender: TObject);
const
  EFETIVADAS = 0;
  PENDENTES = 1;
begin
  inherited;
  qryVendas.Close;
  qryVendas.SQL.Text := SQLPadrao;
  case cmbStatus.ItemIndex of
    EFETIVADAS: qryVendas.SQL.Add('AND v.status = ''E''');
    PENDENTES: qryVendas.SQL.Add('AND v.status = ''A''');
  end;

  if not Trim(edtCliente.Text).IsEmpty then
  begin
    qryVendas.SQL.Add('  AND clienteId = ' + edtCliente.Text);
  end;

  qryVendas.SQL.Add(' ORDER BY v.dataHora');
  qryVendas.Open();
  if qryVendas.IsEmpty then
  begin
    Informar('Nenhum dado foi encontrado!');
    Exit;
  end;
  frxVendas.ShowReport();
end;

procedure TFormRelVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FormRelVendas := nil;
end;

procedure TFormRelVendas.FormCreate(Sender: TObject);
begin
  inherited;
  qryVendas.Connection := Conexao.Connection;
  qryItensVendas.Connection := Conexao.Connection;
  psqClientes.Conexao := Conexao.Connection;
  SQLPadrao := qryVendas.SQL.Text;
end;

procedure TFormRelVendas.qryVendasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryVendas.IsEmpty then
  begin
    Exit;
  end;
  qryItensVendas.Close;
  qryItensVendas.ParamByName('vendaId').AsInteger := qryVendasvendaId.AsInteger;
  qryItensVendas.Open();
end;

end.
