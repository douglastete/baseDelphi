unit MasterCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Master, Vcl.StdCtrls, Vcl.ExtCtrls,
  uPesquisa, System.Actions, Vcl.ActnList, Data.DB;

type
  TFormMasterCad = class(TFormMaster)
    aclForm: TActionList;
    acSalvar: TAction;
    acBuscar: TAction;
    acExcluir: TAction;
    acAlterar: TAction;
    acCancelar: TAction;
    psqPadrao: TPesquisa;
    btnAlterar: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    pnlDados: TPanel;
    pnlCodigo: TPanel;
    lblCodigo: TLabel;
    btnBuscar: TButton;
    edtCodigo: TEdit;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acAlterarExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acBuscarExecute(Sender: TObject);
  private
    FEstadoTela: TDataSetState;
    procedure ConsultarRegistro;
    { Private declarations }
  public
    { Public declarations }
    edtFoco: TWinControl;
    property EstadoTela: TDataSetState read FEstadoTela write FEstadoTela;
    function GravarRegistro(): Boolean; virtual; abstract;
    function CarregarRegistro(pID: Integer): Boolean; virtual; abstract;
    function ApagarRegistro(): Boolean; virtual; abstract;
    procedure LimparTela(); virtual; abstract;
    procedure ControleBotoes(); virtual;
  end;

var
  FormMasterCad: TFormMasterCad;

implementation

{$R *.dfm}

uses Biblio;

procedure TFormMasterCad.acAlterarExecute(Sender: TObject);
begin
  inherited;
  EstadoTela := dsEdit;
  ControleBotoes();
  edtFoco.SetFocus;
end;

procedure TFormMasterCad.acBuscarExecute(Sender: TObject);
begin
  inherited;
  if psqPadrao.Execute then
  begin
    edtCodigo.Text := psqPadrao.Resultado;
    edtCodigo.SetFocus;
    keybd_event(13, 0, 0, 0);
  end;
end;

procedure TFormMasterCad.acCancelarExecute(Sender: TObject);
begin
  inherited;
  LimparTela();
  EstadoTela := dsInactive;
  ControleBotoes;
  edtCodigo.SetFocus;
end;

procedure TFormMasterCad.acExcluirExecute(Sender: TObject);
begin
  inherited;
  if not Perguntar('Deseja realmente excluir o registro?') then
  begin
    Exit;
  end;

  try
    if not ApagarRegistro() then
    begin
      Exit;
    end;
    EstadoTela := dsInactive;
    LimparTela();
    ControleBotoes();
    edtCodigo.SetFocus;
  except
    on E: Exception do
    begin
      Atencao('Houve um problema ao excluir o registro. Tente novamente. Erro: ' + E.Message);
    end;
  end;
end;

procedure TFormMasterCad.acSalvarExecute(Sender: TObject);
begin
  inherited;
  if not GravarRegistro() then
  begin
    Exit;
  end;
  EstadoTela := dsInactive;
  LimparTela();
  ControleBotoes();
  edtCodigo.SetFocus;
end;

procedure TFormMasterCad.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key <> VK_RETURN then
  begin
    Exit;
  end;
  if String(edtCodigo.Text).Trim.IsEmpty then
  begin
    if not Perguntar('Deseja realmente incluir um novo registro?') then
    begin
      Exit;
    end;

    EstadoTela := dsInsert;
    ControleBotoes();
    edtFoco.SetFocus;
  end
  else
  begin
    ConsultarRegistro();
  end;
end;

procedure TFormMasterCad.FormCreate(Sender: TObject);
begin
  inherited;
  EstadoTela := dsInactive;
  ControleBotoes;
end;

procedure TFormMasterCad.ConsultarRegistro();
begin
  EstadoTela := dsInactive;
  if CarregarRegistro(String(edtCodigo.Text).ToInteger()) then
  begin
    EstadoTela := dsBrowse;
    ControleBotoes();
    if btnAlterar.Enabled then
    begin
      btnAlterar.SetFocus;
    end
    else
    begin
      btnCancelar.SetFocus;
    end;
  end
  else
  begin
    Atencao('Registro não encontrado!');
    edtCodigo.SelectAll;
    edtCodigo.SetFocus;
  end;
end;

procedure TFormMasterCad.ControleBotoes();
begin
  edtCodigo.Enabled := (EstadoTela = dsInactive);
  acBuscar.Enabled  := edtCodigo.Enabled;

  acSalvar.Enabled   := EstadoTela in [dsEdit, dsInsert];
  pnlDados.Enabled   := acSalvar.Enabled;

  acExcluir.Enabled := EstadoTela = dsBrowse;
  acAlterar.Enabled := acExcluir.Enabled;
  acCancelar.Enabled := acExcluir.Enabled or acSalvar.Enabled;

  btnSair.Enabled   := (EstadoTela = dsInactive);
  pnlDados.Enabled  := acSalvar.Enabled;
end;

end.
