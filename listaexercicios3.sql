/*Questão1--------------------------------------------------------------*/

SET GLOBAL log_bin_trust_function_creators =1;

DELIMITER $$

CREATE FUNCTION soma(
	value1 INT, 
    value2 INT)
RETURNS INT
BEGIN
	RETURN value1+value2;
      
END$$
DELIMITER ;

SELECT soma(4,5);

/*Questão2--------------------------------------------------------------*/

SET GLOBAL log_bin_trust_function_creators =1;

DELIMITER $$

CREATE FUNCTION media(
	value1 DOUBLE, 
    value2 DOUBLE,
    value3 DOUBLE)
RETURNS DOUBLE
BEGIN
	RETURN (value1+value2+value3)/3;
      
END$$
DELIMITER ;

SELECT media(8.9,8.1,9.0);

/*Questão3---------------------------------------------------------------*/

CREATE TABLE Alunos (
matricula INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(30) NOT NULL,
curso VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
disciplinaID INT,
nota1 DOUBLE,
nota2 DOUBLE,
notaFinal DOUBLE,
FOREIGN KEY (disciplinaID) REFERENCES Disciplina(id)
);

INSERT INTO Alunos (nome, curso, email, nota1, nota2) 
VALUES ("Martha Jones", "Medicina", "mjones@gmail.com", 9.8, 10.0);

INSERT INTO Alunos (nome, curso, email, nota1, nota2) 
VALUES ("Jack Harkness", "Turismo", "jackharkness@gmail.com", 8.0, 8.5);

INSERT INTO Alunos (nome, curso, email, nota1, nota2) 
VALUES ("Sarah Jane Smith", "Engenharia de Software", "sjsmith@gmail.com", 10.0, 9.8);

INSERT INTO Alunos (nome, curso, email, nota1, nota2) 
VALUES ("John Smith", "Astrofísica", "johnsmith@gmail.com", 10.0, 10.0);

INSERT INTO Alunos (nome, curso, email, nota1, nota2) 
VALUES ("Rose Tyler", "Marketing", "rosetyler@gmail.com", 9.8, 8.2);

/*Questão4--------------------------------------------------------------*/  

CREATE TABLE Disciplina(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(30) NOT NULL,
curso VARCHAR(30) NOT NULL,
nomeProfessor VARCHAR(30) NOT NULL
);
    
INSERT INTO Disciplina (nome, curso, nomeProfessor) 
VALUES ("Estratégias de Marketing I", "Marketing", "Clark Kent");

INSERT INTO Disciplina (nome, curso, nomeProfessor) 
VALUES ("Física I", "Astrofísica", "Bruce Benner");

INSERT INTO Disciplina (nome, curso, nomeProfessor) 
VALUES ("Matemática Discreta", "Astrofísica", "Tony Stark");

INSERT INTO Disciplina (nome, curso, nomeProfessor) 
VALUES ("Lógica I", "Engenharia de Software", "Aja-Adanna");

INSERT INTO Disciplina (nome, curso, nomeProfessor) 
VALUES ("Ética", "Marketing", "Itachi Uchiha");

/*Questão5---------------------------------------------------------------*/

SET GLOBAL log_bin_trust_function_creators =1;

DELIMITER $$

CREATE FUNCTION mediaAluno(
	value1 DOUBLE,
    value2 DOUBLE,
    nomeAluno VARCHAR(30),
    disciplinaId INT)
RETURNS DOUBLE
BEGIN
	UPDATE Alunos SET notaFinal = (value1+value2)/2, Alunos.disciplinaID = disciplinaId
    WHERE Alunos.nome = nomeAluno;
    RETURN (value1+value2)/2;
END$$
DELIMITER ;

SELECT mediaAluno(8.9,8.1,"John Smith", 2);

