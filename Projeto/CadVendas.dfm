inherited FormCadVendas: TFormCadVendas
  ActiveControl = edtCodigo
  Caption = 'Cadastro de Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnExcluir: TButton
      Left = 299
      ExplicitLeft = 299
    end
    object btnEfetivar: TButton
      AlignWithMargins = True
      Left = 380
      Top = 3
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Efetivar'
      TabOrder = 5
      OnClick = btnEfetivarClick
    end
  end
  inherited pnlDados: TPanel
    object btnBuscarCliente: TSpeedButton
      Left = 151
      Top = 33
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
    object lblDtNascimento: TLabel
      Left = 151
      Top = 69
      Width = 105
      Height = 13
      Caption = 'Data e hora da venda'
    end
    object lblStatusDesc: TLabel
      Left = 512
      Top = 13
      Width = 35
      Height = 13
      Caption = 'Status:'
    end
    object lblStatus: TLabel
      Left = 553
      Top = 13
      Width = 31
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCliente: TLabeledEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cliente'
      TabOrder = 0
    end
    object edtClienteNome: TEdit
      Left = 181
      Top = 32
      Width = 314
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtValorTotal: TLabeledEdit
      Left = 24
      Top = 88
      Width = 121
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor Total'
      ReadOnly = True
      TabOrder = 2
    end
    object edtDataHoraVenda: TMaskEdit
      Left = 151
      Top = 88
      Width = 118
      Height = 21
      TabStop = False
      EditMask = '!99/99/9999 99:99;1;_'
      MaxLength = 16
      ReadOnly = True
      TabOrder = 3
      Text = '  /  /       :  '
    end
    object gpbItens: TGroupBox
      Left = 24
      Top = 139
      Width = 745
      Height = 253
      Caption = 'Itens'
      TabOrder = 4
      object btnBuscarProduto: TSpeedButton
        Left = 95
        Top = 40
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
      object btnLimparDadosItem: TSpeedButton
        Left = 678
        Top = 40
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5C4BDD49A90D59D93D59E94D59E94D59D93D49A90E6C5BFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD49A90D59F94D6A095D6
          A095D6A095D6A095D59F94D49A90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD59E94D49B8FD49C91D49C91D49C91D49C91D49B8FD59E94FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD69E94D49B90D59D92D5
          9D92D59D92D59D92D49B90D69E94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD69E94D49B90D59D92D59D92D59D92D59D92D49B90D69E94FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD69E94D49B90D59D92D5
          9D92D59D92D59D92D49B90D69E94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD69E94D49B90D59D92D59D92D59D92D59D92D49B90D69E94FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD69E94D49B90D59D92D5
          9D92D59D92D59D92D49B90D69E94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD9A69DD7A197D7A398D7A398D7A398D7A398D7A197D9A69DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC98174B4503FB85847BB6050B8
          5948B85948BB6050B85847B4503FC98174FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF1E0DCEBD1CDEFDBD7C77D70F0DCD8F0DCD8C77D70EFDBD7EBD1CDF1E0
          DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7ECEBC4
          7567C47668F7EDEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = btnLimparDadosItemClick
      end
      object btnConfirmarItem: TSpeedButton
        Left = 649
        Top = 40
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF9EDF3D288EE
          C05AEEC05AF2D188FDF8EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFEFC157DD9B03D8B567D6C091D3BD8ED4AF61D89300EBBB53FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9AD1CDCB761E0E4F2E0E1E6DF
          DEE0DDDCDED9DADED3D7E4D2AB58E3A215FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F0C558DEBB66E7EBFBE6E4E2E6E4E2EBECEEE3E1DEE0DDD9DDD9D5D6DAE7D2AB
          56EBBB53FFFFFFFFFFFFFFFFFFFEF9EEE2A409EAF0FFEBE9E9EDECEBF1F4F6A2
          7648EEEFF0E6E4E2E1DEDBDDDAD6D6D9E6D99400FDF8EDFFFFFFFFFFFFF6D88A
          E5C677EFF1FAF1F0F0FAFEFF915A21793400905920F1F5F7E6E5E3E1DEDBDCDD
          E2D5B163F2D187FFFFFFFFFFFFF2CA61E9D7A8F3F5FAF7F7F98F571D834504EB
          E6E28446068F571DF1F5F8E7E4E2E0DFE1D6C091EDBF5AFFFFFFFFFFFFF3CB61
          ECD9ABFBFDFFD1BCA77B3800F7F7F8FAFCFFF3F3F48243038F561CF0F3F6E4E4
          E8D9C494EDC15BFFFFFFFFFFFFF6DA8BEACC7DF9FCFFFCFEFFFFFFFFF9FAFAF6
          F5F4F7F7F8F3F2F38344038B5014E8ECF3DBB96BF3D288FFFFFFFFFFFFFDFAEE
          E6AD0FFAFFFFF9F8F8F9F8F8F9F8F7F8F7F6F5F4F3F5F5F6EDEBE9A3774BEAF1
          FFDC9C03FEF8EDFFFFFFFFFFFFFFFFFFF3CB5BEACA74FDFFFFFAF9F9F8F7F8F8
          F7F6F7F5F4F3F2F1F1F0F1F4FDFFDEBA66EEC256FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEEB721EACA74FBFFFFFAFCFFFAFBFFF8F9FEF4F6FFF1F5FFE1BF6BE8AC
          1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3CB5BE6AD10EBCD7EEE
          DCAFECDAACE7C979E1A40AF0C458FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFAEDF6DA8BF2CA60F2CA60F5D88BFEF9EDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = btnConfirmarItemClick
      end
      object edtProdutoNome: TEdit
        Left = 124
        Top = 40
        Width = 261
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtProdutoID: TLabeledEdit
        Left = 13
        Top = 41
        Width = 76
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'Produto'
        TabOrder = 0
      end
      object edtPrecoUnitario: TLabeledEdit
        Left = 391
        Top = 40
        Width = 80
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        EditLabel.Width = 67
        EditLabel.Height = 13
        EditLabel.Caption = 'Pre'#231'o Unit'#225'rio'
        ReadOnly = True
        TabOrder = 2
        OnChange = edtPrecoUnitarioChange
      end
      object edtQuantidade: TLabeledEdit
        Left = 477
        Top = 40
        Width = 80
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'Quantidade'
        TabOrder = 3
        OnChange = edtQuantidadeChange
        OnKeyPress = edtQuantidadeKeyPress
      end
      object edtValorTotalItem: TLabeledEdit
        Left = 563
        Top = 40
        Width = 80
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'Valor Total'
        ReadOnly = True
        TabOrder = 4
      end
      object dbgItens: TDBGrid
        Left = 13
        Top = 68
        Width = 716
        Height = 173
        DataSource = dtsItensVenda
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgItensDblClick
        OnKeyDown = dbgItensKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Width = 283
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'precoUnitario'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o Unit'#225'rio'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Total'
            Width = 95
            Visible = True
          end>
      end
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
        FieldName = 'vendaId'
        Title.Alignment = taCenter
        Title.Caption = 'Venda ID'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clienteNome'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorTotal'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Total'
        Width = 80
        Visible = True
      end>
    CampoResultado = 'vendaId'
    SQL.Strings = (
      'SELECT v.*, c.nome as clienteNome'
      '  FROM vendas v'
      ' INNER JOIN pessoas c ON c.pessoaId = v.clienteId'
      ' WHERE 1 = 1')
    PesquisaPadrao = 1
    Filtros = <
      item
        DataType = ftInteger
        Name = 'v.vendaId'
        ParamType = ptUnknown
        Value = 'C'#243'digo'
      end
      item
        DataType = ftWideString
        Name = 'c.nome'
        ParamType = ptUnknown
        Value = 'Cliente (Nome)'
      end>
  end
  object psqClientes: TPesquisa
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
      '   AND tipo = '#39'Cliente'#39)
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
    EditCodigo = edtCliente
    EditDescricao = edtClienteNome
    BotaoPesquisa = btnBuscarCliente
    Left = 224
    Top = 144
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    AfterPost = cdsItensVendaAfterPost
    OnCalcFields = cdsItensVendaCalcFields
    Left = 488
    Top = 280
    object cdsItensVendaprodutoId: TIntegerField
      FieldName = 'produtoId'
    end
    object cdsItensVendadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cdsItensVendaprecoUnitario: TFloatField
      FieldName = 'precoUnitario'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsItensVendaquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsItensVendavalorTotal: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'valorTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsItensVendatotalVenda: TAggregateField
      FieldName = 'totalVenda'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(valorTotal)'
    end
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 488
    Top = 328
  end
  object psqProdutos: TPesquisa
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
    CampoDescricao = 'descricao'
    SQL.Strings = (
      'SELECT *'
      '  FROM produtos'
      ' WHERE status = '#39'A'#39)
    MultiSelecao = False
    AbrirAuto = False
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
    EditCodigo = edtProdutoID
    EditDescricao = edtProdutoNome
    BotaoPesquisa = btnBuscarProduto
    OnPreencherCampos = psqProdutosPreencherCampos
    Left = 144
    Top = 264
  end
end
