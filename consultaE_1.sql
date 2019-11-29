/* Query que consulta pelas atividades que são realizadas em um mês em específico,
	ela deve retornar somente as atividades que satisfazem a condição dentro do LIKE,
    ou seja, somente as atividades dentro do mês desejado. O resultado esperado da
    consulta é : a data da atividade e seu nome.
*/

SELECT
    A.data,
    CONCAT(
		COALESCE(T.tema,
		W.tema,
		R.objetivo,
		ASO.tipo_a_social,
		C.tema,
		AA.tipo_artigo,
		P.nome_palestra)
        ) AS nome_atividade
FROM atividade AS A
LEFT JOIN Tutorial AS T ON
A.id_atividade = T.ID_Atividade
LEFT JOIN Workshop AS W ON
A.id_atividade = W.ID_Atividade
LEFT JOIN Reuniao AS R ON
A.id_atividade = R.ID_Atividade
LEFT JOIN Atividade_Social AS ASO ON
A.id_atividade = ASO.ID_Atividade
LEFT JOIN Concurso AS C ON
A.id_atividade = C.ID_Atividade
LEFT JOIN Apresentacao_Artigo AS AA ON
A.id_atividade = AA.ID_Atividade
LEFT JOIN Palestra AS P ON
A.id_atividade = P.ID_Atividade
WHERE data LIKE '%-05-%' -- Mês de 01 a 12