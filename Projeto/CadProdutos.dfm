inherited FormCadProdutos: TFormCadProdutos
  ActiveControl = edtCodigo
  Caption = 'Cadastro de produtos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnSalvar: TButton
      OnClick = nil
    end
  end
  inherited pnlDados: TPanel
    object btnBuscarFornecedor: TSpeedButton
      Left = 159
      Top = 161
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA495FF4A
        2FFF4629FFBBB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFA294FF3617FF3617FF3617FF593FFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEDFF3E20FF3617FF36
        17FF3617FF7762FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB2A6FF3617FF3617FF3617FF563BFFECE9FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF7F6FFE4E0FFEEEBFFFFFFFF8876FF3617FF3617FF7B
        67FFF2F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDC5FF6851FF391BFF3617FF
        3617FF5A41FF8674FF8E7DFFD6D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFAA9DFF3819FF3F22FF806DFFA597FF9382FF472BFF3819FFB2A6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D0FF3819FF5F46FFEBE7FFFFFFFFFFFFFF
        FFFFFFEEEBFF573DFF3C1EFFE6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8370
        FF3B1CFFE7E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CAFF3617FF9584FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF644CFF5F46FFBBB1FF6148FFFDFDFFFFFFFF
        FFFFFFFFFFFFFFFFFF4E32FF674FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F46
        FF5D44FFAA9DFF3617FFD8D2FFFFFFFFFFFFFFFFFFFFFFFFFF5D44FF5C43FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7D69FF3B1CFFD3CCFF3819FF644CFFE4E0FF
        FFFFFFFFFFFFFDFDFF472BFF6851FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5BC
        FF3617FF8E7DFF9F90FF3819FF6148FFFFFFFFFFFFFFBEB4FF3617FF9D8EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF735EFF3617FF9382FFDED9FFE6E2FF
        FFFFFFD0C8FF4427FF472BFFF1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F4FF6D57FF3617FF4326FF6D57FF6148FF3819FF3E20FFCBC3FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFBAAFFF6F59FF4629FF
        3F22FF6D57FFE1DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object edtDescricao: TLabeledEdit
      Left = 32
      Top = 40
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
      TabOrder = 0
    end
    object edtPrecoUnitario: TLabeledEdit
      Left = 32
      Top = 96
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 67
      EditLabel.Height = 13
      EditLabel.Caption = 'Pre'#231'o Unit'#225'rio'
      TabOrder = 1
      OnExit = edtPrecoUnitarioExit
    end
    object edtFornecedor: TLabeledEdit
      Left = 32
      Top = 160
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Fornecedor'
      TabOrder = 2
    end
    object ckbAtivo: TCheckBox
      Left = 487
      Top = 42
      Width = 74
      Height = 17
      Caption = 'Ativo'
      TabOrder = 3
    end
    object edtFornecedorNome: TEdit
      Left = 189
      Top = 160
      Width = 314
      Height = 21
      ReadOnly = True
      TabOrder = 4
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
        FieldName = 'produtoId'
        Title.Alignment = taCenter
        Title.Caption = 'Produto ID'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'precoUnitario'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o unit'#225'rio'
        Width = 80
        Visible = True
      end>
    CampoResultado = 'produtoId'
    SQL.Strings = (
      'SELECT *'
      '  FROM produtos'
      ' WHERE 1=1')
    PesquisaPadrao = 1
    Filtros = <
      item
        DataType = ftInteger
        Name = 'produtoId'
        ParamType = ptUnknown
        Value = 'C'#243'digo'
      end
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptUnknown
        Value = 'Descri'#231#227'o'
      end>
  end
  object psqFornecedores: TPesquisa
    Colunas = <
      item
        Expanded = False
        FieldName = 'PESSOAID'
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Raz'#227'o Social'
        Width = 450
        Visible = True
      end>
    CampoResultado = 'pessoaId'
    CampoDescricao = 'nome'
    SQL.Strings = (
      'SELECT pessoaId,'
      '             nome'
      '  FROM pessoas'
      ' WHERE status = '#39'A'#39
      '   AND tipo = '#39'Fornecedor'#39)
    MultiSelecao = False
    AbrirAuto = False
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
        Value = 'Raz'#227'o Social'
      end>
    EditCodigo = edtFornecedor
    EditDescricao = edtFornecedorNome
    BotaoPesquisa = btnBuscarFornecedor
    Left = 224
    Top = 144
  end
end
