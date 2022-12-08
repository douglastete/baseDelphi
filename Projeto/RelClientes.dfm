inherited FormRelClientes: TFormRelClientes
  Caption = 'Relat'#243'rio de clientes'
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
    object cmbStatus: TComboBox
      Left = 16
      Top = 51
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = 'Ativos'
      Items.Strings = (
        'Ativos'
        'Inativos'
        'Todos')
    end
  end
  object qryClientes: TFDQuery
    SQL.Strings = (
      'SELECT * FROM pessoas'
      'WHERE tipo = '#39'Cliente'#39)
    Left = 392
    Top = 208
    object qryClientespessoaId: TFDAutoIncField
      FieldName = 'pessoaId'
      Origin = 'pessoaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryClientescpfCnpj: TStringField
      FieldName = 'cpfCnpj'
      Origin = 'cpfCnpj'
    end
    object qryClientesstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      FixedChar = True
      Size = 1
    end
    object qryClientesdtnascimento: TDateField
      FieldName = 'dtnascimento'
      Origin = 'dtnascimento'
    end
    object qryClientesnomeFantasia: TStringField
      FieldName = 'nomeFantasia'
      Origin = 'nomeFantasia'
      Size = 100
    end
    object qryClientestipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
    end
  end
  object frxDBClientes: TfrxDBDataset
    UserName = 'frxDBClientes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'pessoaId=pessoaId'
      'nome=nome'
      'cpfCnpj=cpfCnpj'
      'status=status'
      'dtnascimento=dtnascimento'
      'nomeFantasia=nomeFantasia'
      'tipo=tipo')
    DataSet = qryClientes
    BCDToCurrency = False
    Left = 472
    Top = 232
  end
  object frxClientes: TfrxReport
    Version = '6.3.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Microsoft Print to PDF'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44902.659910405090000000
    ReportOptions.LastChange = 44902.659910405090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 472
    Top = 168
    Datasets = <
      item
        DataSet = frxDBClientes
        DataSetName = 'frxDBClientes'
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
            'Relat'#243'rio de Clientes')
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
          DataSet = frxDBClientes
          DataSetName = 'frxDBClientes'
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
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          DataSet = frxDBClientes
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBClientes
          DataSetName = 'frxDBClientes'
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
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBClientes
        DataSetName = 'frxDBClientes'
        RowCount = 0
        object frxDBClientespessoaId: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 2.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'pessoaId'
          DataSet = frxDBClientes
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBClientes."pessoaId"]')
          ParentFont = False
        end
        object frxDBClientesnome: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 2.559060000000000000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBClientes
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBClientes."nome"]')
          ParentFont = False
        end
        object frxDBClientesstatus: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 2.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBClientes
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[IIF(<frxDBClientes."status"> = '#39'A'#39', '#39'Ativo'#39', '#39'Inativo'#39')]')
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
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 238.110390000000000000
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
          DataSet = frxDBClientes
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade de clientes listados:')
          ParentFont = False
        end
      end
    end
  end
end
