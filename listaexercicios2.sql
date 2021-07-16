CREATE TABLE LeitoOcupacao AS (SELECT * FROM `esus-vepi.LeitoOcupacao`);

CREATE TABLE CidadeNatal AS (SELECT * FROM LeitoOcupacao WHERE municipio = 'Farroupilha');

SELECT sum(ocupacaoSuspeitoCli) AS SomaSuspeitoCli, 
		sum(ocupacaoSuspeitoUti) AS SomaSuspeitoUti, 
		sum(ocupacaoConfirmadoCli) AS SomaConfirmadoCli, 
		sum(ocupacaoConfirmadoUti) AS SomaConfirmadoUti
FROM LeitoOcupacao WHERE municipio = 'Porto Alegre';

SELECT count(*) AS contaNOTIF
FROM LeitoOcupacao GROUP BY origem;

SELECT count(*) AS contaNOTIF
FROM LeitoOcupacao 
WHERE municipio = 'Farroupilha'
GROUP BY origem;

SELECT count(_id) AS contagemNotificacao, DATE_FORMAT(dataNotificacao, '%d/%m/%Y') AS dataNotif
FROM LeitoOcupacao
GROUP BY dataNotif
ORDER BY contagemNotificacao;

SELECT municipio,
		DATE_FORMAT(dataNotificacao, '%d/%m/%Y') as dataNotif,
		sum(ocupacaoConfirmadoUti) AS SomaConfirmadoUti
FROM LeitoOcupacao 
GROUP BY dataNotif, municipio
ORDER BY SomaConfirmadoUti DESC;


