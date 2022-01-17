USE BancoCurso;

INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (1, 'Fernando', 1400, 'TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Guilerme', 1450, 'TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Adriana', 2500, 'Jurídico');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Ana', 2700, 'Administrativo');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Bruno', 1900, 'RH');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Isabela', 1100, 'Estagiário');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Lucas', 3000, 'TI');

SELECT * FROM funcionarios;
SELECT * FROM funcionarios WHERE salario > 2000;
SELECT * FROM funcionarios WHERE nome = 'Ana';
SELECT * FROM funcionarios WHERE id = 1;

UPDATE funcionarios SET salario = salario * 1.1 WHERE id = 1;
/*SET SQL_SAFE_UPDATES = 0;*/

UPDATE funcionarios SET salario = salario * 1.1;

UPDATE funcionarios SET salario = ROUND (salario * 1.1, 2);

DELETE FROM funcionarios WHERE id = 4;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-0001');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-0002');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (2, 'Carro', 'SB-0015');

UPDATE veiculos SET id = 3 WHERE id = 4;
SELECT id, veiculo FROM veiculos;
SELECT *, id FROM veiculos;
SELECT * FROM veiculos;

INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Jr', 1000, 2000);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Pleno', 2000, 4000);

SELECT * FROM salarios;

SELECT * FROM funcionarios f WHERE f.salario > 2000;

SELECT nome, salario FROM funcionarios f WHERE f.salario > 2000;

SELECT nome AS 'Funcionário', salario FROM funcionarios f WHERE f.salario > 2000;

SELECT * FROM funcionarios WHERE nome = 'Adriana'
UNION
SELECT * FROM funcionarios WHERE id = 6;

SELECT * FROM funcionarios WHERE nome = 'Isabela'
UNION ALL
SELECT * FROM funcionarios WHERE id = 6;











