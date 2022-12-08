unit Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormPesquisa = class(TForm)
    pnlPesquisa: TPanel;
    dbgResultado: TDBGrid;
    pnlBotoes: TPanel;
    btnSair: TButton;
    Label1: TLabel;
    cmbFiltro: TComboBox;
    edtFiltro: TMaskEdit;
    sqqPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure cmbFiltroSelect(Sender: TObject);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgResultadoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgResultadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FSQLBase: String;
    FFiltros: TParams;
    procedure SetSQLBase(const Value: String);
    procedure SelecionarRegistro;
    procedure AjustarTamanho;
    { Private declarations }
  public
    { Public declarations }
  published
    property SQLBase: String read FSQLBase write SetSQLBase;
    property Filtros: TParams read FFiltros write FFiltros;
    procedure Consultar(pAbrirAuto: Boolean);
  end;

var
  FormPesquisa: TFormPesquisa;

implementation

{$R *.dfm}


procedure TFormPesquisa.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormPesquisa.cmbFiltroSelect(Sender: TObject);
begin
  edtFiltro.Clear;
  edtFiltro.SetFocus;
  if Filtros[cmbFiltro.ItemIndex].DataType = ftDate then
  begin
    edtFiltro.EditMask := '99/99/9999';
  end
  else
  begin
    edtFiltro.EditMask := '';
  end;
end;

procedure TFormPesquisa.dbgResultadoDblClick(Sender: TObject);
begin
  SelecionarRegistro();
end;

procedure TFormPesquisa.dbgResultadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key <> VK_RETURN then
  begin
    Exit;
  end;
  Key := 0;
  SelecionarRegistro();
end;

procedure TFormPesquisa.SelecionarRegistro();
begin
  if sqqPesquisa.IsEmpty then
  begin
    Exit;
  end;
  dbgResultado.SelectedRows.CurrentRowSelected := True;
  ModalResult := mrOk;
end;

procedure TFormPesquisa.edtFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    Consultar(False);
  end;
end;

procedure TFormPesquisa.Consultar(pAbrirAuto: Boolean);
begin
  sqqPesquisa.Close;

  sqqPesquisa.SQL.Text := SQLBase;

  if not pAbrirAuto then
  begin
    if Filtros[cmbFiltro.ItemIndex].DataType in [ftString, ftWideString] then
    begin
      sqqPesquisa.SQL.Add('   AND ' + Filtros[cmbFiltro.ItemIndex].Name + ' LIKE :' + Filtros[cmbFiltro.ItemIndex].Name);
      sqqPesquisa.ParamByName(Filtros[cmbFiltro.ItemIndex].Name).AsString := edtFiltro.Text + '%';
    end
    else
    if Filtros[cmbFiltro.ItemIndex].DataType = ftDate then
    begin
      sqqPesquisa.SQL.Add('   AND ' + Filtros[cmbFiltro.ItemIndex].Name + ' = :' + Filtros[cmbFiltro.ItemIndex].Name);
      sqqPesquisa.ParamByName(Filtros[cmbFiltro.ItemIndex].Name).AsDate := StrToDate(edtFiltro.Text);
    end
    else
    begin
      sqqPesquisa.SQL.Add('   AND ' + Filtros[cmbFiltro.ItemIndex].Name + ' = :' + Filtros[cmbFiltro.ItemIndex].Name);
      sqqPesquisa.ParamByName(Filtros[cmbFiltro.ItemIndex].Name).AsString := edtFiltro.Text;
    end;
  end;

  sqqPesquisa.Open();

  if sqqPesquisa.IsEmpty then
  begin
    Application.MessageBox('Nenhum dado foi encontrado!', 'Informação', MB_OK+MB_ICONINFORMATION);
    if not pAbrirAuto then
    begin
      edtFiltro.SetFocus;
    end;
  end
  else
  begin
    if not pAbrirAuto then
    begin
      dbgResultado.SetFocus;
    end;
  end;
end;

procedure TFormPesquisa.SetSQLBase(const Value: String);
begin
  FSQLBase := Value;
end;

procedure TFormPesquisa.AjustarTamanho();
var
  vTamanhoColunas: Integer;
  I: Integer;
begin
  vTamanhoColunas := 50;
  for I := 0 to dbgResultado.Columns.Count - 1 do
  begin
    vTamanhoColunas := vTamanhoColunas + dbgResultado.Columns[I].Width;
  end;

  if Self.Width < vTamanhoColunas then
  begin
    Self.Width := vTamanhoColunas;
  end;
end;

procedure TFormPesquisa.FormShow(Sender: TObject);
begin
  AjustarTamanho();
  if sqqPesquisa.IsEmpty then
  begin
    cmbFiltroSelect(nil);
    edtFiltro.SetFocus;
  end
  else
  begin
    dbgResultado.SetFocus;
  end;
end;

end.
