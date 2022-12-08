inherited FormCadClientes: TFormCadClientes
  ActiveControl = edtCodigo
  Caption = 'Cadastro de clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    object lblDtNascimento: TLabel
      Left = 32
      Top = 132
      Width = 88
      Height = 13
      Caption = 'Dt. de Nascimento'
    end
    object lblCPF: TLabel
      Left = 32
      Top = 86
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object edtNome: TLabeledEdit
      Left = 32
      Top = 40
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 0
    end
    object ckbAtivo: TCheckBox
      Left = 487
      Top = 42
      Width = 74
      Height = 17
      Caption = 'Ativo'
      TabOrder = 1
    end
    object edtDtNascimento: TMaskEdit
      Left = 32
      Top = 151
      Width = 120
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object edtCPF: TMaskEdit
      Left = 32
      Top = 105
      Width = 118
      Height = 21
      EditMask = '!999.999.999/99;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '   .   .   /  '
    end
  end
  inherited pnlCodigo: TPanel
    inherited edtCodigo: TEdit
      OnExit = edtCodigoExit
    end
  end
  inherited psqPadrao: TPesquisa
    Colunas = <
      item
        Expanded = False
        FieldName = 'pessoaId'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente ID'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 400
        Visible = True
      end>
    CampoResultado = 'pessoaId'
    SQL.Strings = (
      'SELECT *'
      '  FROM pessoas'
      ' WHERE tipo = '#39'Cliente'#39)
    PesquisaPadrao = 1
    Filtros = <
      item
        DataType = ftInteger
        Name = 'pessoaId'
        ParamType = ptUnknown
        Value = 'C'#243'digo'
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptUnknown
        Value = 'Nome'
      end>
  end
end
