--DDL Database Definition Language
--Criando banco de dados
CREATE DATABASE [Event+_Gabriel];

USE [Event+_Gabriel];


--Criando as tabelas
CREATE TABLE TiposDeUsuario--
(
	IdTipoDeUsuario INT PRIMARY KEY IDENTITY,
	TituloTipoUsuario VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE TiposDeEvento--
(
	IdTipoDeEvento INT PRIMARY KEY IDENTITY,
	TituloTipoEvento VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Instituicao--
(
	IdInstituicao INT PRIMARY KEY IDENTITY,
	CNPJ VARCHAR(14) NOT NULL UNIQUE,
	NomeFantasia VARCHAR(30) NOT NULL UNIQUE,
	Endereco VARCHAR(50) NOT NULL
);

CREATE TABLE Evento--
(
	IdEvento INT PRIMARY KEY IDENTITY,
	IdTIpoEvento INT FOREIGN KEY REFERENCES Evento(IdEvento) NOT NULL UNIQUE,
	IdInstituicao INT FOREIGN KEY REFERENCES Instituicao(IdInstituicao) NOT NULL,
	NomeEvento VARCHAR(35) NOT NULL,
	Descricao VARCHAR(150) NOT NULL,
	DataEvento DATE NOT NULL,
	HorarioEvento TIME NOT NULL
);

CREATE TABLE Usuario--
(
	IdUsuario INT PRIMARY KEY IDENTITY,
	IdTipoUsuario INT FOREIGN KEY REFERENCES TiposDeUsuario(IdTipoDeUsuario) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(256) NOT NULL UNIQUE,
	Senha VARCHAR(100) NOT NULL
);

CREATE TABLE PresencasEvento--
(
	IdPresencaEvento INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdEvento INT FOREIGN KEY REFERENCES Evento(IdEvento) NOT NULL,
	Situacao BIT DEFAULT(0)
);

CREATE TABLE Comentario
(
	IdComentario INT PRIMARY KEY IDENTITY,
	IdEvento INT FOREIGN KEY REFERENCES Evento(IdEvento) NOT NULL,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	Descricao VARCHAR(300) NOT NULL,
	Exibe BIT DEFAULT(0)
);