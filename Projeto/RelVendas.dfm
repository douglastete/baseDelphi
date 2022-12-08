inherited FormRelVendas: TFormRelVendas
  Caption = 'Relat'#243'rio de vendas'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    object btnImprimir: TButton
      AlignWithMargins = True
      Left = 623
      Top = 3
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnImprimirClick
    end
  end
  object gpbFiltros: TGroupBox
    Left = 0
    Top = 0
    Width = 782
    Height = 436
    Align = alClient
    Caption = 'Fitlros'
    TabOrder = 1
    object lblStatus: TLabel
      Left = 16
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object btnBuscarCliente: TSpeedButton
      Left = 295
      Top = 52
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
    object cmbStatus: TComboBox
      Left = 16
      Top = 51
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = 'Efetivadas'
      Items.Strings = (
        'Efetivadas'
        'Pendentes'
        'Todas')
    end
    object edtCliente: TLabeledEdit
      Left = 168
      Top = 51
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cliente'
      TabOrder = 1
    end
    object edtClienteNome: TEdit
      Left = 325
      Top = 51
      Width = 314
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  object qryVendas: TFDQuery
    AfterScroll = qryVendasAfterScroll
    SQL.Strings = (
      'SELECT v.*, c.nome as clienteNome'
      '  FROM vendas v'
      ' INNER JOIN pessoas c ON c.pessoaId = v.clienteId'
      ' WHERE 1 = 1'
      '')
    Left = 392
    Top = 208
    object qryVendasvendaId: TFDAutoIncField
      FieldName = 'vendaId'
      Origin = 'vendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryVendasclienteId: TIntegerField
      FieldName = 'clienteId'
      Origin = 'clienteId'
    end
    object qryVendasdataHora: TSQLTimeStampField
      FieldName = 'dataHora'
      Origin = 'dataHora'
    end
    object qryVendasstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      FixedChar = True
      Size = 1
    end
    object qryVendasvalorTotal: TBCDField
      FieldName = 'valorTotal'
      Origin = 'valorTotal'
      Required = True
      Precision = 10
      Size = 2
    end
    object qryVendasclienteNome: TStringField
      FieldName = 'clienteNome'
      Origin = 'clienteNome'
      Size = 100
    end
  end
  object frxDBVendas: TfrxDBDataset
    UserName = 'frxDBVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'vendaId=vendaId'
      'clienteId=clienteId'
      'dataHora=dataHora'
      'status=status'
      'valorTotal=valorTotal'
      'clienteNome=clienteNome')
    DataSet = qryVendas
    BCDToCurrency = False
    Left = 480
    Top = 232
  end
  object frxVendas: TfrxReport
    Version = '6.3.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Microsoft Print to PDF'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44902.659910405100000000
    ReportOptions.LastChange = 44902.659910405100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 472
    Top = 168
    Datasets = <
      item
        DataSet = frxDBItensVenda
        DataSetName = 'frxDBItensVenda'
      end
      item
        DataSet = frxDBVendas
        DataSetName = 'frxDBVendas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 52.913420000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 18.897650000000000000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Vendas por Cliente')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779530000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 442.205010000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data/Hora')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBVendas
        DataSetName = 'frxDBVendas'
        RowCount = 0
        object frxDBClientespessoaId: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 2.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'vendaId'
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendas."vendaId"]')
          ParentFont = False
        end
        object frxDBClientesnome: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 2.559060000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataField = 'clienteNome'
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendas."clienteNome"]')
          ParentFont = False
        end
        object frxDBClientesstatus: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 2.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[IIF(<frxDBVendas."status"> = '#39'E'#39', '#39'Efetivada'#39', '#39'Pendente'#39')]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 26.236240000000000000
          Width = 710.551640000000000000
          Color = clSilver
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 442.205010000000000000
          Top = 2.559060000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'dataHora'
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          DisplayFormat.FormatStr = 'dd/MM/yyyy hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendas."dataHora"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 31.015770000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Lista de itens')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 52.913420000000000000
          Width = 691.653990000000000000
          Color = clSilver
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 64.252010000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 11.338590000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade de vendas:')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBVendas."valorTotal">,MasterData1)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 37.795300000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor total das vendas:')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 3.779530000000000000
          Width = 691.653990000000000000
          Color = clSilver
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        DataSet = frxDBItensVenda
        DataSetName = 'frxDBItensVenda'
        RowCount = 0
        object frxDBItensVendaprodutoId: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'produtoId'
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBItensVenda."produtoId"]')
        end
        object frxDBItensVendadescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 3.779530000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBItensVenda."descricao"]')
        end
        object frxDBItensVendaprecoUnitario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'precoUnitario'
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBItensVenda."precoUnitario"]')
        end
        object frxDBItensVendaquantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'quantidade'
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBItensVenda."quantidade"]')
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[<frxDBItensVenda."quantidade">*<frxDBItensVenda."precoUnitario"' +
              '>]')
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 30.236240000000000000
          Width = 691.653990000000000000
          Color = clSilver
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 105.826840000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 423.307360000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          Frame.Typ = []
          Memo.UTF8W = (
            'Pre'#231'o Unit')
        end
        object Memo13: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 517.795610000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 612.283860000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBItensVenda
          DataSetName = 'frxDBItensVenda'
          Frame.Typ = []
          Memo.UTF8W = (
            'Vlr. Total')
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 461.102660000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 4.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[COUNT(DetailData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 4.779530000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade de itens:')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 27.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[SUM(<frxDBItensVenda."precoUnitario">*<frxDBItensVenda."quantid' +
              'ade">,DetailData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 27.456710000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor total dos itens:')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 52.913420000000000000
          Width = 691.653990000000000000
          Color = clSilver
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object qryItensVendas: TFDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM itens_vendas'
      ' WHERE vendaId = :vendaId')
    Left = 392
    Top = 256
    ParamData = <
      item
        Name = 'VENDAID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryItensVendasvendaId: TIntegerField
      FieldName = 'vendaId'
      Origin = 'vendaId'
      Required = True
    end
    object qryItensVendasprodutoId: TIntegerField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      Required = True
    end
    object qryItensVendasdescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryItensVendasprecoUnitario: TBCDField
      FieldName = 'precoUnitario'
      Origin = 'precoUnitario'
      Required = True
      Precision = 10
      Size = 2
    end
    object qryItensVendasquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object frxDBItensVenda: TfrxDBDataset
    UserName = 'frxDBItensVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'vendaId=vendaId'
      'produtoId=produtoId'
      'descricao=descricao'
      'precoUnitario=precoUnitario'
      'quantidade=quantidade')
    DataSet = qryItensVendas
    BCDToCurrency = False
    Left = 480
    Top = 280
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
      ' WHERE tipo = '#39'Cliente'#39)
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
    Left = 256
    Top = 120
  end
end
