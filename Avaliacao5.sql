Use BancoCurso;

CREATE TABLE instrutores
(
id int unsigned not null auto_increment,
nome varchar(45) not null,
PRIMARY KEY (id)
);

CREATE TABLE cursos
(
id int unsigned not null auto_increment,
instrutores_curso int unsigned default '0',
titulo varchar(45) not null,
PRIMARY KEY (id),
CONSTRAINT fk_instrutores FOREIGN KEY (instrutores_curso) REFERENCES instrutores (id)
);


INSERT INTO instrutores (nome) VALUES ( 'André' );
INSERT INTO instrutores (nome) VALUES ( 'Carlos' );
INSERT INTO instrutores (nome) VALUES ( 'Samuel' );
INSERT INTO instrutores (nome) VALUES ( 'Fábio' );

INSERT INTO cursos (instrutores_curso, titulo) VALUES ( 1, 'Java');
INSERT INTO cursos (instrutores_curso, titulo) VALUES ( NULL, 'PHP');
INSERT INTO cursos (instrutores_curso, titulo) VALUES ( 1, 'MySQL');
INSERT INTO cursos (instrutores_curso, titulo) VALUES ( 3, 'SQL');
INSERT INTO cursos (instrutores_curso, titulo) VALUES ( 2, 'C++');

SELECT * FROM instrutores;
SELECT * FROM cursos;


SELECT * FROM instrutores i RIGHT JOIN cursos  c ON c.titulo = i.nome;

SELECT * FROM instrutores INNER JOIN cursos ON instrutores_curso = instrutores.id;
SELECT * FROM instrutores RIGHT JOIN cursos ON instrutores_curso = instrutores.id;
SELECT * FROM instrutores LEFT JOIN cursos ON instrutores.id = cursos.id
UNION
SELECT * FROM instrutores RIGHT JOIN cursos ON instrutores.id = cursos.id;

SELECT * FROM instrutores INNER JOIN cursos ON instrutores_curso = instrutores.id;
SELECT * FROM instrutores INNER JOIN cursos USING(id);

#SELECT * FROM instrutores FULL JOIN cursos USING ();