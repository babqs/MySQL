Use BancoCurso;

CREATE TABLE pilotos
(
id int unsigned not null auto_increment,
nome varchar(45) not null,
equipe varchar(1) not null,
pontos int unsigned not null default '0',
PRIMARY KEY(id)
);

INSERT INTO pilotos(nome, equipe, pontos) VALUES( 'Fernando', 'A', 2);
INSERT INTO pilotos(nome, equipe, pontos) VALUES( 'Paulo', 'B', 5);
INSERT INTO pilotos(nome, equipe, pontos) VALUES( 'Richa', 'A', 3);
INSERT INTO pilotos(nome, equipe, pontos) VALUES( 'Gomes', 'C', 6);
INSERT INTO pilotos(nome, equipe, pontos) VALUES( 'Fred', 'B', 7);

SELECT * FROM pilotos;

SELECT MAX(pontos) FROM pilotos WHERE equipe != 'B';

SELECT COUNT(pontos) FROM pilotos WHERE equipe = 'B';

SELECT * FROM pilotos ORDER BY pontos DESC LIMIT 1;

SELECT COUNT(*) FROM pilotos WHERE equipe != 'C';

SELECT * FROM pilotos WHERE equipe IN (SELECT equipe FROM pilotos GROUP BY equipe HAVING SUM(pontos) > 5);