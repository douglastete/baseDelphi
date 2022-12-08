USE [montreal]
GO

/****** Object:  Table [dbo].[pessoas]    Script Date: 08/12/2022 20:50:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pessoas](
	[pessoaId] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[cpfCnpj] [varchar](20) NULL,
	[status] [char](1) NULL,
	[dtnascimento] [date] NULL,
	[nomeFantasia] [varchar](100) NULL,
	[tipo] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pessoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [montreal]
GO

/****** Object:  Table [dbo].[produtos]    Script Date: 08/12/2022 20:51:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[produtos](
	[produtoId] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NULL,
	[precoUnitario] [numeric](10, 2) NULL,
	[status] [char](1) NULL,
	[fornecedorId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[produtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [montreal]
GO

/****** Object:  Table [dbo].[vendas]    Script Date: 08/12/2022 20:51:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[vendas](
	[vendaId] [int] IDENTITY(1,1) NOT NULL,
	[clienteId] [int] NULL,
	[dataHora] [datetime] NULL,
	[status] [char](1) NULL,
	[valorTotal] [numeric](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[vendaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[vendas]  WITH CHECK ADD  CONSTRAINT [FK_vendas_pessoas] FOREIGN KEY([clienteId])
REFERENCES [dbo].[pessoas] ([pessoaId])
GO

ALTER TABLE [dbo].[vendas] CHECK CONSTRAINT [FK_vendas_pessoas]
GO


USE [montreal]
GO

/****** Object:  Table [dbo].[itens_vendas]    Script Date: 08/12/2022 20:51:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[itens_vendas](
	[vendaId] [int] NOT NULL,
	[produtoId] [int] NOT NULL,
	[descricao] [nvarchar](100) NULL,
	[precoUnitario] [numeric](10, 2) NOT NULL,
	[quantidade] [numeric](10, 2) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[itens_vendas]  WITH CHECK ADD  CONSTRAINT [FK_itens_vendas_produtos] FOREIGN KEY([produtoId])
REFERENCES [dbo].[produtos] ([produtoId])
GO

ALTER TABLE [dbo].[itens_vendas] CHECK CONSTRAINT [FK_itens_vendas_produtos]
GO

ALTER TABLE [dbo].[itens_vendas]  WITH CHECK ADD  CONSTRAINT [FK_itens_vendas_vendas] FOREIGN KEY([vendaId])
REFERENCES [dbo].[vendas] ([vendaId])
GO

ALTER TABLE [dbo].[itens_vendas] CHECK CONSTRAINT [FK_itens_vendas_vendas]
GO


