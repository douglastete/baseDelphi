inherited FormCadFornecedores: TFormCadFornecedores
  ActiveControl = edtCodigo
  Caption = 'Cadastro de fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    object lblCNPJ: TLabel
      Left = 32
      Top = 118
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object edtRazaoSocial: TLabeledEdit
      Left = 32
      Top = 40
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = 'Raz'#227'o Social'
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
    object edtCNPJ: TMaskEdit
      Left = 32
      Top = 137
      Width = 121
      Height = 21
      EditMask = '!99.999.999/9999-99;1;_'
      MaxLength = 18
      TabOrder = 2
      Text = '  .   .   /    -  '
    end
    object edtNomeFantasia: TLabeledEdit
      Left = 32
      Top = 88
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 71
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome Fantasia'
      TabOrder = 3
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
      ' WHERE tipo = '#39'Fornecedor'#39)
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
