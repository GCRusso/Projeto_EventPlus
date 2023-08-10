-- DML (Data Manipulation Language)

USE [Event+_Gabriel]

--Inserir dados nas tabelas
INSERT INTO TiposDeUsuario(TituloTipoUsuario)
VALUES ('Administrador'),('Comum');

INSERT INTO TiposDeEvento(TituloTipoEvento)
VALUES ('SQL Server');

INSERT INTO Instituicao(CNPJ,Endereco,NomeFantasia)
VALUES('15642364598785', 'R. Niteroi 180 Sao Caetano', 'DevSchool');

INSERT INTO Usuario(IdTipoUsuario,Nome,Email,Senha)
VALUES(1, 'Gabriel', 'gabriel@gmail.com','123456');

INSERT INTO Evento(IdTipoDeEvento, IdInstituicao,NomeEvento,Descricao,DataEvento,HorarioEvento)
VALUES(1,1,'Introdução ao SQL Server', 'Conceitos basicos do SQL Server, DQL, DML E DLL','2023-08-16','10:00:00');

INSERT INTO PresencasEvento(IdUsuario,IdEvento,Situacao)
VALUES(1,1,1);

INSERT INTO Comentario(IdEvento,IdUsuario,Descricao,Exibe)
VALUES(1,1,'Adorei o evento!',1);

INSERT INTO Comentario(IdEvento,IdUsuario,Descricao)
VALUES(1,1,'Não gostei do Evento!');