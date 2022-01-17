USE BancoCurso;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

SELECT * FROM funcionarios INNER JOIN veiculos ON funcionario_id = funcionarios.id;
SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;

SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id;
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

#FULL JOIN
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, "Moto", "SB-0003");
UPDATE veiculos SET id = 4 WHERE id = 5;

CREATE TABLE cpf
(
id int unsigned not null,
cpf varchar(14) not null,
PRIMARY KEY(id),
CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

INSERT INTO cpf (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpf (id, cpf) VALUES (2, '222.222.222-22');
INSERT INTO cpf (id, cpf) VALUES (3, '333.333.333-33');
INSERT INTO cpf (id, cpf) VALUES (5, '555.555.555-55');

SELECT * FROM cpf;

SELECT * FROM funcionarios INNER JOIN cpf ON funcionarios.id = cpf.id;
SELECT * FROM funcionarios INNER JOIN cpf USING(id);

CREATE TABLE clientes
(
id int unsigned not null auto_increment,
nome varchar(45) not null,
quem_indicou int unsigned,
PRIMARY KEY (id),
CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES ( 1, 'Andiré', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES ( 2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES ( 3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES ( 4, 'Rafael', 1);

SELECT * FROM clientes;

SELECT a.nome AS CLIENTE, b.nome AS QUEM_INDICOU FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;

SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id INNER JOIN cpf ON cpf.id = f.id;

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 2000;

SELECT * FROM funcionarios_a;

UPDATE funcionarios SET salario = 1500 WHERE id = 3;

DROP VIEW funcionarios_a;

SELECT COUNT(*) FROM funcionarios;
SELECT SUM(salario) FROM funcionarios;
SELECT SUM(salario) FROM funcionarios WHERE salario < 1900;
SELECT AVG(salario) FROM funcionarios;
SELECT MAX(salario) FROM funcionarios;
SELECT MIN(salario) FROM funcionarios;


SELECT DISTINCT(departamento) FROM funcionarios;
SELECT * FROM funcionarios ORDER BY salario;
SELECT * FROM funcionarios ORDER BY salario ASC;
SELECT * FROM funcionarios ORDER BY salario DESC;
SELECT * FROM funcionarios LIMIT 2;
#SELECT * FROM funcionarios OFFSET 2; NAO FUNCIONA

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500;


SELECT nome FROM funcionarios WHERE departamento IN('Marketing', 'TI');
#SUBQUERIES
SELECT nome FROM funcionarios WHERE departamento IN(SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500);
