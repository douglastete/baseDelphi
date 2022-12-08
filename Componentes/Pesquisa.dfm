object FormPesquisa: TFormPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa'
  ClientHeight = 283
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 38
      Height = 26
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Filtro:'
      Layout = tlCenter
      ExplicitHeight = 35
    end
    object cmbFiltro: TComboBox
      AlignWithMargins = True
      Left = 47
      Top = 5
      Width = 145
      Height = 24
      Margins.Top = 5
      Align = alLeft
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cmbFiltroSelect
    end
    object edtFiltro: TMaskEdit
      AlignWithMargins = True
      Left = 198
      Top = 5
      Width = 417
      Height = 22
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      CharCase = ecUpperCase
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 1
      Text = ''
      OnKeyDown = edtFiltroKeyDown
      ExplicitHeight = 24
    end
  end
  object dbgResultado: TDBGrid
    Left = 0
    Top = 32
    Width = 625
    Height = 215
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgResultadoDblClick
    OnKeyDown = dbgResultadoKeyDown
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 247
    Width = 625
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnSair: TButton
      AlignWithMargins = True
      Left = 547
      Top = 3
      Width = 75
      Height = 30
      Align = alRight
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
  end
  object sqqPesquisa: TFDQuery
    CachedUpdates = True
    Left = 304
    Top = 136
  end
  object dsPesquisa: TDataSource
    DataSet = sqqPesquisa
    Left = 304
    Top = 192
  end
end
