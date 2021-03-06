﻿USE PIMIV

CREATE TABLE USUARIOS (
	ID INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL,
	NUMERO_TEL INT NOT NULL,
	OPERADORA VARCHAR(6) NOT NULL,
	LOGRADOURO VARCHAR(30) NOT NULL,
	NUMERO_END INT NOT NULL,
	CIDADE VARCHAR(15) NOT NULL,
	ESTADO VARCHAR(3) NOT NULL,
	CEP VARCHAR(10) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	SENHA VARCHAR(50) NOT NULL,
	USUARIO VARCHAR(30) NOT NULL,
	ATIVO INT NOT NULL
);

drop table USUARIOS

CREATE TABLE FUNCIONARIOS (
	ID INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL,
	NUMERO_TEL INT NOT NULL,
	OPERADORA VARCHAR(6) NOT NULL,
	LOGRADOURO VARCHAR(30) NOT NULL,
	NUMERO_END INT NOT NULL,
	CIDADE VARCHAR(15) NOT NULL,
	ESTADO VARCHAR(3) NOT NULL,
	CEP INT NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	SENHA VARCHAR(50) NOT NULL,
	USUARIO VARCHAR(30) NOT NULL,
	CARGO VARCHAR(30) NOT NULL
);


GO
CREATE PROC GetAllUsers
AS
BEGIN
	SELECT * FROM USUARIOS
END

GO
CREATE PROC GetAllFuncs
AS
BEGIN
	SELECT * FROM FUNCIONARIOS
END

GO
CREATE PROC GetUser
	@USER VARCHAR(30)
AS
BEGIN
	SELECT * FROM USUARIOS WHERE USUARIO = @USER;
END


EXEC GetAllUsers;

GO
CREATE PROC GetFunc
	@USUARIO VARCHAR(30)
AS
BEGIN
	SELECT * FROM FUNCIONARIOS WHERE USUARIO = @USUARIO
END

GO
CREATE PROCEDURE InserirFunc
	@NOME VARCHAR(50),
	@NUMERO_TEL INT,
	@OPERADORA VARCHAR(6),
	@LOGRADOURO VARCHAR(30),
	@NUMERO_END VARCHAR(30),
	@CIDADE VARCHAR(15),
	@ESTADO VARCHAR(3),
	@CEP VARCHAR(20),
	@EMAIL VARCHAR(50),
	@USUARIO VARCHAR(30),
	@SENHA VARCHAR(50),
	@CARGO VARCHAR(15)
AS
BEGIN
INSERT INTO  FUNCIONARIOS(
	NOME, NUMERO_TEL, OPERADORA, LOGRADOURO, NUMERO_END, CIDADE, ESTADO,
	CEP, EMAIL, USUARIO, SENHA, CARGO
)
VALUES(
	@NOME, @NUMERO_TEL, @OPERADORA, @LOGRADOURO, @NUMERO_END, @CIDADE, @ESTADO,
	@CEP, @EMAIL, @USUARIO, @SENHA, @CARGO
);
END;

GO
CREATE PROCEDURE InserirUsuario
	@NOME VARCHAR(50),
	@NUMERO_TEL INT,
	@OPERADORA VARCHAR(6),
	@LOGRADOURO VARCHAR(30),
	@NUMERO_END VARCHAR(30),
	@CIDADE VARCHAR(15),
	@ESTADO VARCHAR(3),
	@CEP VARCHAR(20),
	@EMAIL VARCHAR(50),
	@USUARIO VARCHAR(30),
	@SENHA VARCHAR(50)
AS
BEGIN
INSERT INTO  USUARIOS(
	NOME, NUMERO_TEL, OPERADORA, LOGRADOURO, NUMERO_END, CIDADE, ESTADO,
	CEP, EMAIL, USUARIO, SENHA
)
VALUES(
	@NOME, @NUMERO_TEL, @OPERADORA, @LOGRADOURO, @NUMERO_END, @CIDADE, @ESTADO,
	@CEP, @EMAIL, @USUARIO, @SENHA
);
END;

CREATE TABLE CHAMADOS(
	ID INT IDENTITY PRIMARY KEY,
	CLIENTE VARCHAR(30),
	RESPONSAVEL VARCHAR(30),
	STAT VARCHAR(15),
	CATEGORIA VARCHAR(20) NOT NULL,
	SUBCATEGORIA VARCHAR(20) NOT NULL,
	DESCRICAO VARCHAR(100) NOT NULL
);

GO
CREATE PROC InserirChamado
	@USUARIO_LOG VARCHAR(20),
	@CATEGORIA VARCHAR(20),
	@SUBCATEGORIA VARCHAR(20),
	@DESCRICAO VARCHAR(100)
AS
BEGIN
	INSERT INTO CHAMADOS(CATEGORIA, SUBCATEGORIA, DESCRICAO, SOLICITANTE)
	VALUES('CATEGORIA', 'SUBCAT', 'DESCRIPTION', 'BRUNO LINS')
END;



EXEC GetAllFuncs