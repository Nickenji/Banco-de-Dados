/* Query que consulta pelo tema de evento que está em alta,
	ela deve retornar somente o evento que possui a maior quantidade de atividades.
    O resultado esperado da consulta é: nome do evento, tema e a quantidade de atividades.
*/

SELECT
	E.nome_evento,
    E.tema,
	COUNT(A.ID_Evento) AS qntd_de_atividades
FROM atividade AS A
INNER JOIN Evento AS E ON
A.ID_Evento = E.ID_Evento
GROUP BY E.nome_evento
HAVING COUNT(A.ID_Evento) = (
	SELECT
		MAX(contagem)
	FROM (
		SELECT
			E2.nome_evento,
			COUNT(A2.ID_Evento) AS contagem
		FROM atividade AS A2
		INNER JOIN Evento AS E2 ON
		A2.ID_Evento = E2.ID_Evento
		GROUP BY E2.nome_evento
	) AS AUX
)