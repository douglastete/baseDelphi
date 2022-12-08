unit RelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Master, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormRelClientes = class(TFormMaster)
    btnImprimir: TButton;
    qryClientes: TFDQuery;
    frxDBClientes: TfrxDBDataset;
    frxClientes: TfrxReport;
    qryClientespessoaId: TFDAutoIncField;
    qryClientesnome: TStringField;
    qryClientescpfCnpj: TStringField;
    qryClientesstatus: TStringField;
    qryClientesdtnascimento: TDateField;
    qryClientesnomeFantasia: TStringField;
    qryClientestipo: TStringField;
    gpbFiltros: TGroupBox;
    lblStatus: TLabel;
    cmbStatus: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    SQLPadrao: String;
  public
    { Public declarations }
  end;

var
  FormRelClientes: TFormRelClientes;

implementation

{$R *.dfm}

uses VarGlobal, Biblio;

procedure TFormRelClientes.btnImprimirClick(Sender: TObject);
const
  ATIVOS = 0;
  INATIVOS = 1;
begin
  inherited;
  qryClientes.Close;
  qryClientes.SQL.Text := SQLPadrao;
  case cmbStatus.ItemIndex of
    ATIVOS: qryClientes.SQL.Add('AND status = ''A''');
    INATIVOS: qryClientes.SQL.Add('AND status = ''I''');
  end;
  qryClientes.Open();
  if qryClientes.IsEmpty then
  begin
    Informar('Nenhum dado foi encontrado!');
    Exit;
  end;
  frxClientes.ShowReport();
end;

procedure TFormRelClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FormRelClientes := nil;
end;

procedure TFormRelClientes.FormCreate(Sender: TObject);
begin
  inherited;
  qryClientes.Connection := Conexao.Connection;
  SQLPadrao := qryClientes.SQL.Text;
end;

end.
