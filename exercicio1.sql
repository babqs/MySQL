CREATE DATABASE BancoCursoAtv;
USE BancoCursoAtv;

CREATE TABLE cursos
(
id int unsigned not null auto_increment,
nome varchar(20) not null,
tipo varchar(30) not null,
preco double null default '0',
PRIMARY KEY(id)
);

CREATE TABLE instrutor
(
id int unsigned not null auto_increment,
nome varchar(50) not null,
telefone varchar(12) not null default '',
PRIMARY KEY(id)
);

CREATE TABLE alunos
(
id int unsigned not null auto_increment,
nome varchar(50) not null,
endereco varchar(90) not null,
email varchar(40) not null,
PRIMARY KEY(id)
);

SELECT * FROM cursos;
SELECT * FROM instrutor;
SELECT * FROM alunos;

ALTER TABLE cursos CHANGE COLUMN nome nome varchar(100) not null;
ALTER TABLE cursos CHANGE COLUMN tipo tipo varchar(60) not null;

INSERT INTO cursos (nome, tipo, preco) VALUES( 'Java Web com Servelets e JSPs', 'Programação', 0);
INSERT INTO cursos (nome, tipo, preco) VALUES( 'SQL Completo', 'Banco de Dados', 0);
INSERT INTO cursos (nome, tipo, preco) VALUES( 'Lógica de Programação', 'Programação', 0);
INSERT INTO cursos (nome, tipo, preco) VALUES( 'Análise Orientada a Objetos', 'Programação Orientada', 0);
INSERT INTO cursos (nome, tipo, preco) VALUES( 'WEB: HTML5, CSS3, JavaScript & Ajax', 'Programação WEB', 558.00);
INSERT INTO cursos (nome, tipo, preco) VALUES( 'Fundamentos de Java 16', 'Programação', 396.00);
INSERT INTO cursos (nome, tipo, preco) VALUES( 'PHP 7 Completo', 'Programação', 558.00);

UPDATE cursos SET tipo = 'Programação Orienteado Objetos' WHERE id = 4;
UPDATE cursos SET tipo = 'Programação Orienteado Objetos' WHERE id = 5;

INSERT INTO instrutor (nome, telefone) VALUES ( 'Camila Esposito', '043988570032');
INSERT INTO instrutor (nome, telefone) VALUES ( 'Bárbara Santana', '043999565453');
INSERT INTO instrutor (nome, telefone) VALUES ( 'Maria Clara Quesada', '043999300109');

INSERT INTO alunos (nome, endereco, email) VALUES ( 'Carlos Silva', 'Rua 01', 'carlos@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'André Pereira', 'Rua 02', 'andre@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Ana Souza', 'Rua 03', 'ana@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Felipe Alves', 'Rua 04', 'felipe@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Bruno', 'Rua 05', 'bruno@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Caio', 'Rua 06', 'caio@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Daniel', 'Rua 07', 'daniel@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Bruna', 'Rua 08', 'bruna@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Julia', 'Rua 09', 'julia@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Jorge', 'Rua 10', 'jorge@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Mateus', 'Rua 11', 'mateus@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Henrique', 'Rua 12', 'henrique@gmail.com');
INSERT INTO alunos (nome, endereco, email) VALUES ( 'Beatriz', 'Rua 13', 'beatriz@gmail.com');