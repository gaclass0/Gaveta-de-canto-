USE [Eagle]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nome_cliente] [varchar](100) NOT NULL,
	[cpf_cliente] [varchar](11) NOT NULL,
	[data_nascimento] [date] NOT NULL,
	[sexo] [bit] NOT NULL,
	[cliente_endereco] [varchar](100) NOT NULL,
	[cliente_telefone] [varchar](11) NOT NULL,
	[cliente_email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_produto]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_produto](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[nome_produto] [varchar](50) NOT NULL,
	[quantidade_produto] [int] NOT NULL,
	[valor_produto] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tb_produto] PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[uspClienteAlterar]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspClienteAlterar]
	@id_cliente as int,
	@nome_cliente as varchar (100),
	@cpf_cliente as varchar (11),
	@data_nascimento as date,
	@sexo as bit,
	@cliente_endereco as varchar (100),
	@cliente_telefone as varchar (11),
	@cliente_email as varchar (50)

AS

BEGIN

UPDATE
	tb_cliente
	 

	SET

	nome_cliente = @nome_cliente,
	cpf_cliente=  @cpf_cliente,
	data_nascimento= @data_nascimento,
	sexo= @sexo,
	cliente_endereco= @cliente_endereco,
	cliente_telefone= @cliente_telefone,
	cliente_email= @cliente_email
	
WHERE 
      id_cliente = @id_cliente
	  SELECT @id_cliente AS retorno
END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteConsultarporNome]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteConsultarporNome]

	@nome_cliente as varchar (100)

AS
BEGIN 

	SELECT

		id_cliente,
		nome_cliente,
		cpf_cliente,
		data_nascimento,
		sexo,
		cliente_endereco,
		cliente_telefone,
		cliente_email
	
		

		FROM
			tb_cliente
		WHERE
			nome_cliente LIKE '%' + @nome_cliente + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteInserir1]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteInserir1]

	@nome_cliente as varchar(100),
	@cpf_cliente as varchar (11),
	@data_nascimento as date,
	@sexo as bit,
	@cliente_endereco as varchar (100),
	@cliente_telefone as varchar(11),
	@cliente_email as varchar (50)

AS
BEGIN

	INSERT INTO tb_cliente
		(
	nome_cliente,
	cpf_cliente ,
	data_nascimento,
	sexo ,
	cliente_endereco  ,
	cliente_telefone ,
	cliente_email 
		)

		VALUES
		(
		@nome_cliente,
		@cpf_cliente ,
		@data_nascimento,
		@sexo ,
		@cliente_endereco  ,
		@cliente_telefone ,
		@cliente_email 
		)

	SELECT @@IDENTITY AS RETORNO
END
GO
/****** Object:  StoredProcedure [dbo].[uspClinteConsultarporID]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClinteConsultarporID]

@id_cliente AS INT

AS
BEGIN 

	SELECT

		id_cliente,
		nome_cliente,
		cpf_cliente,
		data_nascimento,
		sexo,
		cliente_endereco,
		cliente_telefone,
		cliente_email
	
		

		FROM
			tb_Cliente
		WHERE
			id_cliente = @id_cliente;
END
GO
/****** Object:  StoredProcedure [dbo].[uspClinteExcluir]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClinteExcluir]

@id_cliente AS INT

AS
BEGIN 

		DELETE FROM
			tb_cliente
		WHERE
			id_cliente = @id_cliente;
		SELECT @id_cliente AS RETORNO
END
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoAlterar]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoAlterar]

@id_produto as int,
@nome_produto as varchar (50),
@quantidade_produto as int,
@valor_produto as decimal (18,2)

AS
BEGIN 

UPDATE
	tb_produto

	SET

	nome_produto = @nome_produto,
	quantidade_produto = @quantidade_produto,
	valor_produto = @valor_produto

	WHERE 
	id_produto = @id_produto
	SELECT @id_produto AS Retorno

END 
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoConsultarPorId]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoConsultarPorId]

	@id_produto as int
AS
BEGIN
	

	SELECT
	
		id_produto
		nome_produto,
		quantidade_produto,
		valor_produto
		
	FROM	
		tb_produto
	WHERE
		id_produto = @id_produto
END

	
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoConsultarPorNome]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoConsultarPorNome]

	@nome_produto AS varchar (50)
AS
BEGIN
	

	SELECT
	
		id_produto
		nome_produto,
		quantidade_produto,
		valor_produto
		
	FROM	
		tb_produto
	
	WHERE
			nome_produto LIKE '%' + @nome_produto + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoExcluir]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoExcluir]

	@id_produto as int
AS
BEGIN
	
	DELETE FROM 
		tb_produto
	WHERE
		id_produto = @id_produto;
		SELECT @id_produto AS Retorno
END
	
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoInserir]    Script Date: 24/06/2023 23:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoInserir] 

	@nome_produto as varchar(50),
	@quantidade_produto as int,
	@valor_produto as decimal (18,2)


AS
BEGIN
	

	INSERT INTO
		tb_produto
(
		nome_produto,
		quantidade_produto,
		valor_produto
		
		)

		VALUES
(
		@nome_produto,
		@quantidade_produto,
		@valor_produto
		
		)

		SELECT @@IDENTITY AS Retorno


END
GO
