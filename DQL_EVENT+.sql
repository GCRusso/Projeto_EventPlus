-- DQL 
/*Trazer os seguintes dados
- Nome do usuario
- Tipo do usuário
- Data do evento
- Local do evento (Instituição)
- Titulo do evento
- Nome do evento
- Descrição do evento
- Situação do evento
- Comentário do evento
*/

USE [Event+_Gabriel]

SELECT 
	Usuario.Nome AS NomeUsuario,
	TiposDeUsuario.TituloTipoUsuario AS Usuario,
	Evento.DataEvento AS DataEvento,
	CONCAT (Instituicao.NomeFantasia, '', Instituicao.Endereco) AS Local,
	Evento.NomeEvento AS NomeEvento,
	TiposDeEvento.TituloTipoEvento AS TipoEvento,
	Evento.Descricao AS DescricaoEvento,
	CASE WHEN PresencasEvento.Situacao = 1 THEN 'Presente' ELSE 'Faltou' END AS Presença,
	Comentario.Descricao AS Comentario

FROM 
Usuario	LEFT JOIN TiposDeUsuario ON Usuario.IdTipoUsuario = TiposDeUsuario.IdTipoDeUsuario,
Evento LEFT JOIN Instituicao ON Instituicao.IdInstituicao = Evento.IdInstituicao
LEFT JOIN TiposDeEvento ON TiposDeEvento.IdTipoDeEvento = Evento.IdTipoDeEvento,
PresencasEvento LEFT JOIN Comentario ON PresencasEvento.IdUsuario = Comentario.IdUsuario