inherited FormMasterCad: TFormMasterCad
  Caption = 'MasterCad'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    object btnAlterar: TButton
      AlignWithMargins = True
      Left = 623
      Top = 3
      Width = 75
      Height = 33
      Action = acAlterar
      Align = alRight
      TabOrder = 1
    end
    object btnSalvar: TButton
      AlignWithMargins = True
      Left = 542
      Top = 3
      Width = 75
      Height = 33
      Action = acSalvar
      Align = alRight
      TabOrder = 2
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 461
      Top = 3
      Width = 75
      Height = 33
      Action = acCancelar
      Align = alRight
      TabOrder = 3
    end
    object btnExcluir: TButton
      AlignWithMargins = True
      Left = 380
      Top = 3
      Width = 75
      Height = 33
      Action = acExcluir
      Align = alRight
      TabOrder = 4
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 41
    Width = 782
    Height = 395
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
  end
  object pnlCodigo: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 2
    object lblCodigo: TLabel
      Left = 0
      Top = 0
      Width = 57
      Height = 37
      Align = alLeft
      AutoSize = False
      Caption = '  C'#243'digo:'
      Layout = tlCenter
      ExplicitLeft = -3
      ExplicitTop = -4
    end
    object btnBuscar: TButton
      AlignWithMargins = True
      Left = 187
      Top = 6
      Width = 75
      Height = 25
      Margins.Top = 6
      Margins.Bottom = 6
      Action = acBuscar
      Align = alLeft
      TabOrder = 0
    end
    object edtCodigo: TEdit
      AlignWithMargins = True
      Left = 60
      Top = 8
      Width = 121
      Height = 21
      Margins.Top = 8
      Margins.Bottom = 8
      Align = alLeft
      NumbersOnly = True
      TabOrder = 1
      OnKeyDown = edtCodigoKeyDown
    end
  end
  object aclForm: TActionList
    Left = 344
    Top = 8
    object acSalvar: TAction
      Caption = 'Salvar'
      OnExecute = acSalvarExecute
    end
    object acBuscar: TAction
      Caption = 'Buscar'
      OnExecute = acBuscarExecute
    end
    object acExcluir: TAction
      Caption = 'Excluir'
      OnExecute = acExcluirExecute
    end
    object acAlterar: TAction
      Caption = 'Alterar'
      OnExecute = acAlterarExecute
    end
    object acCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = acCancelarExecute
    end
  end
  object psqPadrao: TPesquisa
    Colunas = <>
    MultiSelecao = False
    AbrirAuto = False
    PesquisaPadrao = 0
    Filtros = <>
    Left = 344
    Top = 56
  end
end
