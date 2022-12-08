unit uPesquisa;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Controls, Vcl.StdCtrls, Vcl.DBCtrls, WinApi.Windows, Vcl.Forms, WinApi.Messages,
  Vcl.Buttons, Dialogs;

type
  TKeyDownEvent = procedure(Sender: TObject; var Key: Word; Shift: TShiftState) of object;

  TPesquisa = class(TComponent)
  private
    FCampoResultado: String;
    FColunas: TDBGridColumns;
    FSQL: TStrings;
    FMultiSelecao: Boolean;
    FConexao: TFDCustomConnection;
    FResultado: Variant;
    FAbrirAuto: Boolean;
    FPesquisaPadrao: Integer;
    FFiltros: TParams;
    FEditCodigo: TCustomEdit;
    FOnKeyDownOriginal: TKeyDownEvent;
    FOnClickOriginal: TNotifyEvent;
    FEditDescricao: TCustomEdit;
    FCampoDescricao: String;
    FOnPreencherCampos: TNotifyEvent;
    FOnExitOriginal: TNotifyEvent;
    FBotaoPesquisa: TControl;
    procedure SetCampoResultado(const Value: String);
    procedure SetSQL(const Value: TStrings);
    procedure SetMultiSelecao(const Value: Boolean);
    procedure SetAbrirAuto(const Value: Boolean);
    procedure SetPesquisaPadrao(const Value: Integer);
    procedure ConfigurarEventos;
    procedure OnKeyDownPesquisa(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnClickPesquisa(Sender: TObject);
    procedure SetEditCodigo(const Value: TCustomEdit);
    procedure SetCampoDescricao(const Value: String);
    procedure SetEditDescricao(const Value: TCustomEdit);
    procedure SetOnPreencherCampos(const Value: TNotifyEvent);
    procedure OnExitPesquisa(Sender: TObject);
    procedure SetBotaoPesquisa(const Value: TControl);
    procedure ConfigurarEventoClick;
    procedure ExecutarPesquisa(Sender: TObject; Key: Word);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    TabelaResultado: TFDMemTable;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute(pFiltro: String = ''): Boolean;
  published
    { Published declarations }
    property Colunas: TDBGridColumns read FColunas write FColunas;
    property CampoResultado: String read FCampoResultado write SetCampoResultado;
    property CampoDescricao: String read FCampoDescricao write SetCampoDescricao;
    property SQL: TStrings read FSQL write SetSQL;
    property MultiSelecao: Boolean read FMultiSelecao write SetMultiSelecao;
    property Conexao: TFDCustomConnection read FConexao write FConexao;
    property Resultado: Variant read FResultado write FResultado;
    property AbrirAuto: Boolean read FAbrirAuto write SetAbrirAuto;
    property PesquisaPadrao: Integer read FPesquisaPadrao write SetPesquisaPadrao;
    property Filtros: TParams read FFiltros write FFiltros;
    property EditCodigo: TCustomEdit read FEditCodigo write SetEditCodigo;
    property EditDescricao: TCustomEdit read FEditDescricao write SetEditDescricao;
    property BotaoPesquisa: TControl read FBotaoPesquisa write SetBotaoPesquisa;
    property OnPreencherCampos: TNotifyEvent read FOnPreencherCampos write SetOnPreencherCampos;
  end;

procedure Register;

implementation

uses Pesquisa;

procedure Register;
begin
  RegisterComponents('TTComps', [TPesquisa]);
end;

{ TPesquisa }

constructor TPesquisa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FColunas := TDBGridColumns.Create(nil, TColumn);
  FSQL := TStringList.Create;
  TabelaResultado := TFDMemTable.Create(Self);
  FFiltros := TParams.Create();
end;

procedure TPesquisa.OnExitPesquisa(Sender: TObject);
begin
  if (Screen.ActiveForm.ActiveControl.Name = 'btnSair') then
  begin
    Exit;
  end;

  ExecutarPesquisa(Sender, 0);
end;

procedure TPesquisa.ExecutarPesquisa(Sender: TObject; Key: Word);
var
  sqqPesquisa: TFDQuery;
  vSucesso: Boolean;
  vTexto: String;
begin
  vSucesso := False;
  sqqPesquisa := TFDQuery.Create(Self);
  sqqPesquisa.Connection := Conexao;
  try
    if (Sender is TDBEdit) then
    begin
      vTexto := TDBEdit(Sender).Text;
    end
    else
    begin
      vTexto := TCustomEdit(Sender).Text;
    end;

    if (vTexto.IsEmpty) and (Key in [VK_RETURN, 0]) then
    begin
      vSucesso := Execute;
    end
    else
    begin
      sqqPesquisa.Close;
      sqqPesquisa.SQL.Text := SQL.Text + sLineBreak;
      sqqPesquisa.SQL.Add('   AND ' + CampoResultado + ' = :' + CampoResultado);
      sqqPesquisa.ParamByName(CampoResultado).AsString := vTexto;
      sqqPesquisa.Open();

      if sqqPesquisa.IsEmpty then
      begin
        if (Sender is TDBEdit) then
        begin
          TDBEdit(Sender).Field.Clear;
        end
        else
        begin
          TCustomEdit(Sender).Clear;
        end;
        Application.MessageBox('Nenhum dado foi encontrado!', 'Informação', MB_OK+MB_ICONINFORMATION);
      end
      else
      begin
        Resultado := sqqPesquisa.FieldByName(CampoResultado).Value;
        TabelaResultado.CloneCursor(sqqPesquisa, True, False);
        TabelaResultado.RecNo := sqqPesquisa.RecNo;
        vSucesso := True;
      end;
    end;

    if vSucesso then
    begin
      EditCodigo.Text := Resultado;
      EditDescricao.Text := TabelaResultado.FieldByName(CampoDescricao).AsString;

      if Assigned(OnPreencherCampos) then
      begin
        OnPreencherCampos(Self);
      end;

      if Key > 0 then
      begin
        TForm(Owner).Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    end;
  finally
    FreeAndNil(sqqPesquisa);
  end;
end;

procedure TPesquisa.OnKeyDownPesquisa(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ExecutarPesquisa(Sender, Key);
    Key := 0;
  end;
  if Assigned(FOnKeyDownOriginal) then
  begin
    FOnKeyDownOriginal(Sender, Key, Shift);
  end;
end;

procedure TPesquisa.OnClickPesquisa(Sender: TObject);
begin
  ExecutarPesquisa(Sender, 0);

  if Assigned(FOnClickOriginal) then
  begin
    FOnClickOriginal(Sender);
  end;
end;

procedure TPesquisa.ConfigurarEventos();
begin
  if EditCodigo is TDBEdit then
  begin
    FOnKeyDownOriginal := TDBEdit(EditCodigo).OnKeyDown;
    TDBEdit(EditCodigo).OnKeyDown := OnKeyDownPesquisa;

    FOnExitOriginal := TDBEdit(EditCodigo).OnExit;
    TDBEdit(EditCodigo).OnExit := OnExitPesquisa;
  end
  else
  begin
    FOnKeyDownOriginal := TEdit(EditCodigo).OnKeyDown;
    TEdit(EditCodigo).OnKeyDown := OnKeyDownPesquisa;

    FOnExitOriginal := TEdit(EditCodigo).OnExit;
    TEdit(EditCodigo).OnExit := OnExitPesquisa;
  end;
end;

procedure TPesquisa.ConfigurarEventoClick();
begin
  if BotaoPesquisa is TSpeedButton then
  begin
    FOnClickOriginal := TSpeedButton(BotaoPesquisa).OnClick;
    TSpeedButton(BotaoPesquisa).OnClick := OnClickPesquisa;
  end
  else
  begin
    FOnClickOriginal := TBitBtn(BotaoPesquisa).OnClick;
    TBitBtn(BotaoPesquisa).OnClick := OnClickPesquisa;
  end;
end;

destructor TPesquisa.Destroy;
begin
  FreeAndNil(FColunas);
  FreeAndNil(FSQL);
  FreeAndNil(TabelaResultado);
  FreeAndNil(FFiltros);
  inherited;
end;

function TPesquisa.Execute(pFiltro: String = ''): Boolean;
var
  vColunas: TMemoryStream;
  I, J, vCount: Integer;
  vRegistros: array of Integer;
  vAchou: Boolean;
begin
  if Colunas.Count = 0 then
  begin
    raise Exception.Create('É necessário informar ao menos uma coluna!');
  end;

  try
    vColunas := TMemoryStream.Create;;
    FColunas.SaveToStream(vColunas);
    vColunas.Position := 0;

    FormPesquisa := TFormPesquisa.Create(Self);
    Result := False;
    Resultado := '';
    FormPesquisa.dbgResultado.Columns.LoadFromStream(vColunas);
    FormPesquisa.SQLBase := SQL.Text + sLineBreak + pFiltro;
    FormPesquisa.Filtros := Filtros;

    for I := 0 to FFiltros.Count - 1 do
    begin
      FormPesquisa.cmbFiltro.Items.Add(FFiltros[I].Value);
    end;                                                  

    FormPesquisa.sqqPesquisa.Connection := Conexao;
    if MultiSelecao then
    begin
      FormPesquisa.dbgResultado.Options := FormPesquisa.dbgResultado.Options + [dgMultiSelect];
    end;
    FormPesquisa.cmbFiltro.ItemIndex := PesquisaPadrao;
    if AbrirAuto then
    begin
      FormPesquisa.Consultar(True);
    end;
    if FormPesquisa.ShowModal = mrOk then
    begin
      Result := True;
      Resultado := FormPesquisa.sqqPesquisa.FieldByName(CampoResultado).Value;

      if MultiSelecao then
      begin
        TabelaResultado.Filtered := False;
      end;

      TabelaResultado.CloneCursor(FormPesquisa.sqqPesquisa, True, False);
      TabelaResultado.RecNo := FormPesquisa.sqqPesquisa.RecNo;

      if MultiSelecao then
      begin
        if FormPesquisa.dbgResultado.SelectedRows.Count = 0 then
        begin
          Exit;
        end;

        TabelaResultado.First;
        for I := 0 to FormPesquisa.dbgResultado.SelectedRows.Count - 1 do
        begin
          TabelaResultado.GotoBookmark(FormPesquisa.dbgResultado.SelectedRows.Items[I]);
          SetLength(vRegistros, Length(vRegistros) + 1);
          vRegistros[High(vRegistros)] := TabelaResultado.RecNo;
        end;

        TabelaResultado.First;

        vCount := TabelaResultado.RecordCount;
        for I := vCount downto 1 do
        begin
          TabelaResultado.RecNo := I;
          vAchou := False;
          for J := 0 to High(vRegistros) do
          begin
            if TabelaResultado.RecNo = vRegistros[J] then
            begin
              vAchou := True;
              Break;
            end;
          end;
          if not vAchou then
          begin
            TabelaResultado.Delete;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(FormPesquisa);
    FreeAndNil(vColunas);
  end;
end;

procedure TPesquisa.SetAbrirAuto(const Value: Boolean);
begin
  FAbrirAuto := Value;
end;

procedure TPesquisa.SetBotaoPesquisa(const Value: TControl);
begin
  FBotaoPesquisa := Value;

  if Assigned(FBotaoPesquisa) then
  begin
    ConfigurarEventoClick();
  end;
end;

procedure TPesquisa.SetCampoDescricao(const Value: String);
begin
  FCampoDescricao := Value;
end;

procedure TPesquisa.SetCampoResultado(const Value: String);
begin
  FCampoResultado := Value;
end;

procedure TPesquisa.SetEditCodigo(const Value: TCustomEdit);
begin
  FEditCodigo := Value;
  if Assigned(FEditCodigo) then
  begin
    ConfigurarEventos();
  end;
end;

procedure TPesquisa.SetEditDescricao(const Value: TCustomEdit);
begin
  FEditDescricao := Value;
end;

procedure TPesquisa.SetMultiSelecao(const Value: Boolean);
begin
  FMultiSelecao := Value;
end;

procedure TPesquisa.SetOnPreencherCampos(const Value: TNotifyEvent);
begin
  FOnPreencherCampos := Value;
end;

procedure TPesquisa.SetPesquisaPadrao(const Value: Integer);
begin
  FPesquisaPadrao := Value;
end;

procedure TPesquisa.SetSQL(const Value: TStrings);
begin
  FSQL.Assign(Value);
end;

end.
