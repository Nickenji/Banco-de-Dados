/* Query que consulta pelas eventos que possuem transporte,
	ela deve retornar somente os eventos que possuem uma rota para o local do evento,
    ou seja, somente os eventos que possuem transporte fretado. O resultado esperado da
    consulta é : endereco do evento, nome do lugar, nome do motorista e a rota, NULL caso
    não exista o transporte.
*/

SELECT
	L.endereco,
    L.nome,
    T.motorista,
    T.rota
FROM local AS L
LEFT JOIN Transporte AS T ON
L.CNPJ_Local = T.CNPJ_Local