CREATE TABLE Leitor( 
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(191) NOT NULL, 
email VARCHAR(191) NOT NULL, 
nascimento DATE NOT NULL
);

CREATE TABLE Autor( 
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(191) NOT NULL, 
nascimento DATE NOT NULL
);

CREATE TABLE Livros( 
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(191) NOT NULL, 
primeira_publicacao DATE NOT NULL, 
categoria VARCHAR(191) NOT NULL,
classificacao VARCHAR(191) NOT NULL,
inicio_leitura DATE NOT NULL,
fim_leitura DATE NOT NULL,
idAutor INT UNSIGNED,
FOREIGN KEY (idAutor) REFERENCES Autor(id)
);

CREATE TABLE Leitor_le_Livro( 
idLivro INT UNSIGNED, 
idLeitor INT UNSIGNED,
FOREIGN KEY (idLivro) REFERENCES Livros(id),
FOREIGN KEY (idLeitor) REFERENCES Leitor(id)
);

INSERT INTO Autor (nome, nascimento)
VALUES ('Rick Riordan','1964-06-05');

INSERT INTO Autor (nome, nascimento)
VALUES ('Suzanne Collins','1962-08-10');

-- ---------------------------------------------------------------------

INSERT INTO Leitor (nome, email, nascimento)
VALUES ('John Doe','johndoe@gmail.com', '2000-10-01');

INSERT INTO Leitor (nome, email, nascimento)
VALUES ('Jane Doe','janedoe@gmail.com', '2000-06-26');

INSERT INTO Leitor (nome, email, nascimento)
VALUES ('Tony Stark','tony@stark.com', '1970-05-29');

-- ---------------------------------------------------------------------

INSERT INTO Livros (nome, primeira_publicacao, categoria, classificacao, inicio_leitura, fim_leitura, idAutor)
VALUES ('Percy Jackson e o Ladrão de Raios','2008-10-20','Aventura','12','2021-10-10','2021-10-20', 1);

INSERT INTO Livros (nome, primeira_publicacao, categoria, classificacao, inicio_leitura, fim_leitura, idAutor)
VALUES ('Percy Jackson e o Mar de Monstros','2009-10-20','Aventura','12','2021-10-30','2021-11-20', 1);

INSERT INTO Livros (nome, primeira_publicacao, categoria, classificacao, inicio_leitura, fim_leitura, idAutor)
VALUES ('Jogos Vorazes','2010-10-20','Aventura','14','2021-10-30','2021-11-20', 2);

SELECT * 
FROM Livros
INNER JOIN Autor ON Livros.idAutor=Autor.id;

-- ----------------- parte 2 - sakila-schema.sql ---------------------------

SELECT * 
FROM actor 
WHERE first_name LIKE '%lett%';

SELECT * 
FROM film
WHERE special_features LIKE '%trailers%';

SELECT rating
FROM film
GROUP BY rating;

SELECT * FROM film 
WHERE LOWER(description) 
LIKE '%drama%' AND rating LIKE 'PG%';

SELECT *,
LENGTH(description) 
FROM film 
WHERE replacement_cost BETWEEN 20 AND 25 ORDER BY LENGTH(description) ASC;

SELECT *, 
    CASE country_id
        WHEN '15' THEN 'Brasil' 
        WHEN '104' THEN 'Espanha' 
        WHEN '49' THEN 'Italia' 
        ELSE 'NA' 
    END AS country 
    
FROM city;
SELECT * 
FROM actor 
WHERE first_name = REVERSE(first_name);

SELECT * 
FROM customer 
WHERE LENGTH(first_name) = LENGTH(last_name) OR email LIKE '%a@%';