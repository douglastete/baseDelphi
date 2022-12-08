unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes2: TMenuItem;
    N1: TMenuItem;
    Vendas1: TMenuItem;
    Vendas2: TMenuItem;
    procedure Produtos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses CadProdutos, CadClientes, CadFornecedores, RelClientes, CadVendas,
  RelVendas;

procedure TFormPrincipal.Clientes1Click(Sender: TObject);
begin
  if Assigned(FormCadClientes) then
  begin
    FormCadClientes.Show;
    Exit;
  end;

  FormCadClientes := TFormCadClientes.Create(Application);
  FormCadClientes.Show;
end;

procedure TFormPrincipal.Clientes2Click(Sender: TObject);
begin
  if Assigned(FormRelClientes) then
  begin
    FormRelClientes.Show;
    Exit;
  end;

  FormRelClientes := TFormRelClientes.Create(Application);
  FormRelClientes.Show;
end;

procedure TFormPrincipal.Fornecedores1Click(Sender: TObject);
begin
  if Assigned(FormCadFornecedores) then
  begin
    FormCadFornecedores.Show;
    Exit;
  end;

  FormCadFornecedores := TFormCadFornecedores.Create(Application);
  FormCadFornecedores.Show;
end;

procedure TFormPrincipal.Produtos1Click(Sender: TObject);
begin
  if Assigned(FormCadProdutos) then
  begin
    FormCadProdutos.Show;
    Exit;
  end;

  FormCadProdutos := TFormCadProdutos.Create(Application);
  FormCadProdutos.Show;
end;

procedure TFormPrincipal.Vendas1Click(Sender: TObject);
begin
  if Assigned(FormCadVendas) then
  begin
    FormCadVendas.Show;
    Exit;
  end;

  FormCadVendas := TFormCadVendas.Create(Application);
  FormCadVendas.Show;
end;

procedure TFormPrincipal.Vendas2Click(Sender: TObject);
begin
  if Assigned(FormRelVendas) then
  begin
    FormRelVendas.Show;
    Exit;
  end;

  FormRelVendas := TFormRelVendas.Create(Application);
  FormRelVendas.Show;
end;

end.
