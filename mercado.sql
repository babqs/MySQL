CREATE DATABASE mercado;
USE mercado;

CREATE TABLE usuario
(
id int unsigned not null auto_increment,
nome varchar(50) not null,
login varchar(10) not null,
senha varchar(8) not null,
PRIMARY KEY(id)
);

CREATE TABLE cliente
(
id_cliente int unsigned not null auto_increment,
nome_cliente varchar(50) not null,
data_nascimento_cliente date not null,
PRIMARY KEY(id_cliente)
);

CREATE TABLE pessoa_fisica
(
id_cpf int unsigned not null,
cpf_clientes varchar(14) not null,
PRIMARY KEY (id_cpf),
CONSTRAINT fk_cpf_cliente FOREIGN KEY (id_cpf) REFERENCES cliente (id_cliente)
);

CREATE TABLE pessoa_juridica
(
id_cnpj int unsigned not null,
cnpj_cliente varchar(14),
PRIMARY KEY (id_cnpj),
CONSTRAINT fk_cnpj_cliente FOREIGN KEY (id_cnpj) REFERENCES cliente (id_cliente)
);

CREATE TABLE contato_cliente
(
id_contato_cliente int unsigned not null,
telefone_cliente varchar(11) not null,
email_cliente varchar(25) not null,
PRIMARY KEY(id_contato_cliente),
CONSTRAINT fk_contato_cliente FOREIGN KEY(id_contato_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE endereco_cliente
(
id_endereco_cliente int unsigned not null,
cidade_cliente varchar(20) not null,
rua_cliente varchar(30) not null,
numero_endereco_cliente int unsigned not null,
bairro_cliente varchar(20) not null,
cep_cliente varchar(10) not null,
PRIMARY KEY (id_endereco_cliente),
CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_endereco_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE fornecedor
(
id_fornecedor int unsigned not null auto_increment,
nome_fornecedor varchar(40) not null,
cnpj_fornecedor varchar(18) not null,
PRIMARY KEY(id_fornecedor)
);

ALTER TABLE fornecedor CHANGE COLUMN cnpj_fornecedor cnpj_fornecedor varchar(18) not null;

CREATE TABLE contato_fornecedor
(
id_contato_fornecedor int unsigned not null,
telefone_fornecedor varchar(11) not null,
email_fornecedor varchar(25) not null,
PRIMARY KEY (id_contato_fornecedor),
CONSTRAINT fk_contato_fornecedor FOREIGN KEY(id_contato_fornecedor) REFERENCES fornecedor (id_fornecedor)
);

CREATE TABLE endereco_fornecedor
(
id_endereco_fornecedor int unsigned not null,
cep_fornecedor varchar(10) not null,
cidade_fornecedor varchar(20) not null,
rua_fornecedor varchar(30) not null,
numero_enderenco_fornecedor int unsigned not null,
bairro_fornecedor varchar(20) not null,
PRIMARY KEY (id_endereco_fornecedor),
CONSTRAINT fk_endereco_fornecedor FOREIGN KEY (id_endereco_fornecedor) REFERENCES fornecedor (id_fornecedor)
);
ALTER TABLE endereco_fornecedor CHANGE COLUMN numero_enderenco_fornecedor numero_endereco_fornecedor int unsigned not null;

CREATE TABLE produto
(
id_produto int unsigned not null auto_increment,
descricao_produto varchar(40) not null,
codigo_produto varchar(8) not null,
preco_produto double,
estoque_produto varchar(3) not null,
categoria_id int unsigned not null,
PRIMARY KEY (id_produto),
CONSTRAINT fk_id_produto FOREIGN KEY (categoria_id) REFERENCES categoria_produto (id_categoria)
);
ALTER TABLE produto CHANGE COLUMN id_produto id_produto int unsigned not null auto_increment;
CREATE TABLE entrada_produto
(
id_entrada_produto int unsigned not null auto_increment,
produto_id int unsigned not null,
fornecedor_id int unsigned not null,
qnt_produto int unsigned not null,
PRIMARY KEY (id_entrada_produto),
CONSTRAINT fk_produto_id FOREIGN KEY (produto_id) REFERENCES produto (id_produto),
CONSTRAINT fk_forncedor_id FOREIGN KEY (fornecedor_id) REFERENCES fornecedor (id_fornecedor)
);

DROP TABLE entrada_produto;
CREATE TABLE categoria_produto
(
id_categoria int unsigned not null auto_increment,
descricao_categoria varchar(40) not null,
PRIMARY KEY(id_categoria)
);

CREATE TABLE venda
(
id_venda int unsigned not null auto_increment,
data_venda date,
id_produto_venda int unsigned not null,
id_cliente_venda int unsigned not null,
id_usuario_venda int unsigned not null,
PRIMARY KEY(id_venda),
CONSTRAINT fk_id_produto_venda FOREIGN KEY (id_produto_venda) REFERENCES produto (id_produto),
CONSTRAINT fk_id_cliente_venda FOREIGN KEY (id_cliente_venda) REFERENCES cliente (id_cliente),
CONSTRAINT fk_id_usuario_venda FOREIGN KEY (id_usuario_venda) REFERENCES usuario (id)
);

INSERT INTO usuario (nome, login, senha) VALUES ('Andréia Silva', 'andreias', '1234');
INSERT INTO usuario (nome, login, senha) VALUES ('João Souza', 'joaosouza', '1234');
INSERT INTO usuario (nome, login, senha) VALUES ('Paulo Alves', 'pauloalves', '1234');

SELECT * FROM usuario;


INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'José', 19720531);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Roberta', 19700220);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Claudia', 19660701);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Mario', 19800811);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'João Paulo', 19931105);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Paula', 19690318);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Ana', 20000929);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Fernanda', 19581226);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Mateus', 19851114);
INSERT INTO cliente (nome_cliente, data_nascimento_cliente) VALUES ( 'Luiz', 19620627);

SELECT * FROM cliente;

INSERT INTO pessoa_fisica (id_cpf, cpf_cliente) VALUES ( 2, '428.286.590-38');
INSERT INTO pessoa_fisica (id_cpf, cpf_cliente) VALUES ( 4, '672.280.730-45');
INSERT INTO pessoa_fisica (id_cpf, cpf_cliente) VALUES ( 5, '085.309.780-13');
INSERT INTO pessoa_fisica (id_cpf, cpf_cliente) VALUES ( 6, '730.940.940-07');
INSERT INTO pessoa_fisica (id_cpf, cpf_cliente) VALUES ( 9, '704.648.510-09');
INSERT INTO pessoa_fisica (id_cpf, cpf_cliente) VALUES ( 10, '300.596.840-54');

SELECT * FROM pessoa_fisica;

INSERT INTO pessoa_juridica (id_cnpj, cnpj_cliente) VALUES ( 1, '07.128.289/0001-78');
INSERT INTO pessoa_juridica (id_cnpj, cnpj_cliente) VALUES ( 3, '83.642.232/0001-70');
INSERT INTO pessoa_juridica (id_cnpj, cnpj_cliente) VALUES ( 7, '90.138.086/0001-06');
INSERT INTO pessoa_juridica (id_cnpj, cnpj_cliente) VALUES ( 8, '72.899.986/0001-94');

SELECT * FROM pessoa_juridica;

SELECT * FROM cliente c LEFT JOIN pessoa_fisica pf ON pf.id_cpf = c.id_cliente
UNION
SELECT * FROM cliente c RIGHT JOIN pessoa_juridica pj ON pj.id_cnpj = c.id_cliente;


INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 1, '04311111111', 'jose@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 2, '04322222222', 'roberta@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 3, '04333333333', 'claudia@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 4, '04344444444', 'mario@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 5, '04355555555', 'joaopaulo@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 6, '04366666666', 'paula@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 7, '04377777777', 'ana@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 8, '04388888888', 'fernanada@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 9, '04399999999', 'mateus@gmail.com');
INSERT INTO contato_cliente (id_contato_cliente, telefone_cliente, email_cliente) VALUES ( 10, '04310101010', 'luiz@gmail.com');

SELECT * FROM contato_cliente;
SELECT * FROM cliente c INNER JOIN contato_cliente ON contato_cliente.id_contato_cliente = c.id_cliente;
SELECT c.id_cliente, c.nome_cliente, c.data_nascimento_cliente, contato_cliente.telefone_cliente, contato_cliente.email_cliente FROM cliente c INNER JOIN contato_cliente ON contato_cliente.id_contato_cliente = c.id_cliente;

INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 1, 'Londrina', 'Rua 01', 11, 'Bairro 01', '80010-010');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 2, 'Bandeirantes', 'Rua 02', 12, 'Bairro 02', '86360-000');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 3, 'Andirá', 'Rua 03', 13, 'Bairro 03', '86380-000');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 4, 'Londrina', 'Rua 04', 14, 'Bairro 04', '84165-560');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 5, 'Londrina', 'Rua 05', 15, 'Bairro 05', '84165-560');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 6, 'Londrina', 'Rua 06', 16, 'Bairro 06', '80010-010');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 7, 'Cornélio Procópio', 'Rua 07', 17, 'Bairro 07', '86300-000');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 8, 'Andirá', 'Rua 08', 18, 'Bairro 08', '86380-000');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 9, 'Andirá', 'Rua 09', 19, 'Bairro 09', '86380-000');
INSERT INTO endereco_cliente (id_endereco_cliente, cidade_cliente, rua_cliente, numero_endereco_cliente, bairro_cliente, cep_cliente)
VALUES ( 10, 'Andirá', 'Rua 10', 20, 'Bairro 10', '86380-000');

SELECT * FROM endereco_cliente;

SELECT c.id_cliente, c.nome_cliente, c.data_nascimento_cliente, cc.telefone_cliente, cc.email_cliente,
e.cidade_cliente, e.bairro_cliente, e.rua_cliente, e.numero_endereco_cliente FROM cliente c 
INNER JOIN contato_cliente cc ON cc.id_contato_cliente = c.id_cliente
INNER JOIN endereco_cliente e ON e.id_endereco_cliente = c.id_cliente;

SELECT * FROM cliente c RIGHT JOIN endereco_cliente ec ON ec.id_endereco_cliente = c.id_cliente;

INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor) VALUES ( 'Blue Bom Alimentos', '39.124.235/0001-20');
INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor) VALUES ( 'Coca-Cola', '29.061.633/0001-91');
INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor) VALUES ( 'Marilan', '26.301.558/0001-09');
INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor) VALUES ( 'Bauducco', '33.745.129/0001-88');
INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor) VALUES ( 'Alvorada Orgânicos', '83.529.744/0001-25');
INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor) VALUES ( 'Carnes e Frios', '58.327.185/0001-23');

SELECT * FROM fornecedor;

INSERT INTO contato_fornecedor (id_contato_fornecedor, telefone_fornecedor, email_fornecedor) VALUES ( 1, '04312121212', 'bluebom@gmail.com');
INSERT INTO contato_fornecedor (id_contato_fornecedor, telefone_fornecedor, email_fornecedor) VALUES ( 2, '04313131313', 'cocacola@gmail.com');
INSERT INTO contato_fornecedor (id_contato_fornecedor, telefone_fornecedor, email_fornecedor) VALUES ( 3, '04314141414', 'marilan@gmail.com');
INSERT INTO contato_fornecedor (id_contato_fornecedor, telefone_fornecedor, email_fornecedor) VALUES ( 4, '04315151515', 'bauducco@gmail.com');
INSERT INTO contato_fornecedor (id_contato_fornecedor, telefone_fornecedor, email_fornecedor) VALUES ( 5, '04316161616', 'organicos@gmail.com');
INSERT INTO contato_fornecedor (id_contato_fornecedor, telefone_fornecedor, email_fornecedor) VALUES ( 6, '04317171717', 'carnesefrios@gmail.com');

SELECT * FROM contato_fornecedor;
SELECT * FROM fornecedor f INNER JOIN contato_fornecedor cf ON cf.id_contato_fornecedor = f.id_fornecedor;

INSERT INTO endereco_fornecedor (id_endereco_fornecedor, cep_fornecedor, cidade_fornecedor, rua_fornecedor, numero_endereco_fornecedor, bairro_fornecedor)
VALUES ( 1, '83505-725', 'Almirante Tamandaré', 'Rua Barra dos Coqueiros', 1236, 'Jardim São Vicente');
INSERT INTO endereco_fornecedor (id_endereco_fornecedor, cep_fornecedor, cidade_fornecedor, rua_fornecedor, numero_endereco_fornecedor, bairro_fornecedor)
VALUES ( 2, '86061-230', 'Londrina', 'Rua Ozório Duque Estrada', 5684, 'Itamarati');
INSERT INTO endereco_fornecedor (id_endereco_fornecedor, cep_fornecedor, cidade_fornecedor, rua_fornecedor, numero_endereco_fornecedor, bairro_fornecedor)
VALUES ( 3, '87043-605', 'Maringá', 'Rua Rio Cinza', 5894, 'Jardim Novo Oásis');
INSERT INTO endereco_fornecedor (id_endereco_fornecedor, cep_fornecedor, cidade_fornecedor, rua_fornecedor, numero_endereco_fornecedor, bairro_fornecedor)
VALUES ( 4, '82220-516', 'Curitiba', 'Rua Lúcia Soppelsa de Boni', 1896, 'Abranches');
INSERT INTO endereco_fornecedor (id_endereco_fornecedor, cep_fornecedor, cidade_fornecedor, rua_fornecedor, numero_endereco_fornecedor, bairro_fornecedor)
VALUES ( 5, '87115-082', 'Sarandi', 'Rua 9319', 25, 'Parque Cercado');
INSERT INTO endereco_fornecedor (id_endereco_fornecedor, cep_fornecedor, cidade_fornecedor, rua_fornecedor, numero_endereco_fornecedor, bairro_fornecedor)
VALUES ( 6, '86801-732', 'Apucarana', 'Rua Carlos Augusto', 496, 'Jardim Franca');

SELECT * FROM endereco_fornecedor;

SELECT f.id_fornecedor, f.nome_fornecedor, f.cnpj_fornecedor, cf.email_fornecedor, cf.telefone_fornecedor,
ef.cidade_fornecedor, ef.bairro_fornecedor, ef.rua_fornecedor, ef.numero_endereco_fornecedor
FROM fornecedor f INNER JOIN contato_fornecedor cf ON cf.id_contato_fornecedor = f.id_fornecedor
INNER JOIN endereco_fornecedor ef ON ef.id_endereco_fornecedor = f.id_fornecedor;

INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Feijão', '1a2b3c4d', 8.29, 'Sim', 7);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Arroz', '1q2w3e4r', 19.80, 'Sim', 7);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Farinha de Trigo', '1a2s3d4f', 3.99, 'Sim', 7);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Biscoito', '7z8x9c7v', 6.95, 'Sim', 1);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Pão', '8b9n7m4j', 9.75, 'Sim', 1);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Ovo', '7d4f5g6h', 11.75, 'Sim', 7);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Bolo', '9c6v5bg8', 17.99, 'Sim', 1);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Presunto', '8t5y2u1i', 35.90, 'Sim',2 );
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Queijo', '9s6d5f4g', 27.90, 'Sim', 2);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Carne', '4h1j2ki5', 27.99, 'Sim', 8);
INSERT INTO produto (descricao_produto, codigo_produto, preco_produto, estoque_produto, categoria_id)
VALUES ( 'Refrigerante', '9r8t5g4f', 6.99, 'Sim', 5);

SELECT * FROM produto;

SELECT * FROM produto ORDER BY preco_produto;
SELECT AVG(preco_produto) FROM produto;
SELECT SUM(preco_produto) FROM produto;

INSERT INTO categoria_produto (descricao_categoria) VALUES ('Padaria');
INSERT INTO categoria_produto (descricao_categoria) VALUES ('Frios e Laticínios');
INSERT INTO categoria_produto (descricao_categoria) VALUES ('Higiene');
INSERT INTO categoria_produto (descricao_categoria) VALUES ('Limpeza');
INSERT INTO categoria_produto (descricao_categoria) VALUES ('Bebidas');
INSERT INTO categoria_produto (descricao_categoria) VALUES ('Hortifruti');
INSERT INTO categoria_produto (descricao_categoria) VALUES ('Mercearia');
INSERT INTO categoria_produto (descricao_categoria) VALUES ('Carnes');

SELECT cp.id_categoria, cp.descricao_categoria, p.descricao_produto FROM categoria_produto cp INNER JOIN produto p ON p.categoria_id = cp.id_categoria;
SELECT descricao_produto FROM produto WHERE categoria_id IN(1, 7);
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;

INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 1, 1, 20);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 2, 1, 30);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 3, 1, 35);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 4, 3, 5);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 5, 4, 5);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 6, 5, 2);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 7, 4, 15);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 8, 6, 6);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 9, 6, 4);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 10, 6, 22);
INSERT INTO entrada_produto (produto_id, fornecedor_id, qnt_produto) VALUES ( 11, 2, 16);
UPDATE entrada_produto SET qnt_produto = 
SELECT SUM(qnt_produto) FROM entrada_produto;
SELECT * FROM entrada_produto;

SELECT p.descricao_produto, p.preco_produto, p.estoque_produto, f.nome_fornecedor, ep.qnt_produto FROM entrada_produto ep
INNER JOIN produto p ON ep.produto_id = p.id_produto
INNER JOIN fornecedor f ON ep.fornecedor_id = f.id_fornecedor;

INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220110, 5, 7, 2);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220109, 9, 1, 1);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220107, 1, 3, 1);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220106, 3, 3, 3);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220102, 6, 2, 3);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220102, 8, 6, 3);

SELECT * FROM venda;

SELECT venda.id_venda, usuario.id, usuario.nome, cliente.id_cliente, cliente.nome_cliente, produto.id_produto, produto.descricao_produto, produto.preco_produto, venda.data_venda
FROM venda
INNER JOIN produto ON venda.id_produto_venda = produto.id_produto
INNER JOIN cliente ON venda.id_cliente_venda = cliente.id_cliente
INNER JOIN usuario ON venda.id_usuario_venda = usuario.id;

CREATE TRIGGER limpa_estoque
AFTER INSERT
ON entrada_produto
FOR EACH ROW
CALL atualiza_estoque();

INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220102, 6, 6, 3);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220102, 6, 6, 3);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220102, 9, 2, 3);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220102, 9, 2, 3);
INSERT INTO venda (data_venda, id_produto_venda, id_cliente_venda, id_usuario_venda) VALUES ( 20220102, 9, 2, 3);
CALL atualiza_estoque;
SELECT * FROM entrada_produto;
DROP TRIGGER limpa_estoque;