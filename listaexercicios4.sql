CREATE TABLE Insercao(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
dominio VARCHAR(30),
indice INT,
chave VARCHAR(30),
valor VARCHAR(30),
log_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
session_log int);

/*--------------------------------------------------------------*/

DELIMITER $$

CREATE PROCEDURE func(in dominio VARCHAR(30),
							indice INT,
                            chave VARCHAR(30),
                            valor VARCHAR(30),
                            out saida VARCHAR(100)
                            )
BEGIN
	SET saida = CONCAT(dominio, indice, chave, valor,'saida do processo');
    INSERT INTO Insercao(dominio, indice, chave, valor, session_log, log_at)
    VALUES (dominio, indice, chave, valor, connection_id(), now());
END
$$
DELIMITER ;

/*--------------------------------------------------------------*/

DELIMITER $$

CREATE PROCEDURE conta_dep_media(in valor1 INT,
							valor2 INT,
                            out resultado INT
                            )
BEGIN
	SET resultado = (valor1+valor2)/2;    
	CALL func('corrente',1,'ab45', CONCAT(resultado), @saida);
END
$$
DELIMITER ;