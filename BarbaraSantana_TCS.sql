CREATE DATABASE BarbaraSantana_TCS;
USE BarbaraSantana_TCS;

CREATE TABLE vendedor
(
id_vendedor int unsigned not null auto_increment,
nome_vendedor varchar(50) not null,
email_vendedor varchar(50) not null,
telefone_vendedor varchar(15) not null,
PRIMARY KEY(id_vendedor)
);

CREATE TABLE cliente
(
id_cliente int unsigned not null auto_increment,
nome_cliente varchar(50) not null,
email_cliente varchar(50) not null,
telefone_cliente varchar(15) not null,
PRIMARY KEY(id_cliente)
);

CREATE TABLE produto
(
id_produto int unsigned not null auto_increment,
descricao_produto varchar(60) not null,
preco_produto double not null default '0',
codigo_produto int unsigned not null,
PRIMARY KEY(id_produto)
);

SELECT * FROM vendedor;
SELECT * FROM cliente;
SELECT * FROM produto;

CREATE TABLE pedido_compra
(
id_pedido int unsigned not null auto_increment,
data_pedido DATE,
vendedor_id int unsigned not null default '0',
cliente_id int unsigned not null default '0',
produto_id int unsigned not null default '0',
PRIMARY KEY(id_pedido),
CONSTRAINT fk_vendedor_pedido_compra FOREIGN KEY(vendedor_id) REFERENCES vendedor (id_vendedor),
CONSTRAINT fk_cliente_pedido_compra FOREIGN KEY(cliente_id) REFERENCES cliente (id_cliente),
CONSTRAINT fk_produto_pedido_compra FOREIGN KEY(produto_id) REFERENCES produto (id_produto)
);

SELECT * FROM pedido_compra;

INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Carlos', 'carlos@gmail.com', '1111-1111');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'André', 'andre@gmail.com', '2222-2222');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Ana', 'ana@gmail.com', '3333-3333');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Felipe', 'felipe@gmail.com', '4444-4444');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Bruno', 'bruno@gmail.com', '5555-5555');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Caio', 'caio@gmail.com', '6666-6666');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Daniel', 'daniel@gmail.com', '7777-7777');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Bruna', 'bruna@gmail.com', '8888-8888');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Julia', 'julia@gmail.com', '1212-1212');
INSERT INTO vendedor(nome_vendedor, email_vendedor, telefone_vendedor) VALUES ( 'Jorge', 'jorge@gmail.com', '1010-1010');

INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Maria', 'maria@gmail.com', '2121-2121');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Neuza', 'neuza@gmail.com', '2323-2323');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'João', 'joao@gmail.com', '2424-2424');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Tiago', 'tiago@gmail.com', '2525-2525');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Célia', 'celia@gmail.com', '2626-2626');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Luiz', 'luiz@gmail.com', '2727-2727');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Paula', 'paula@gmail.com', '2828-2828');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Matheus', 'matheus@gmail.com', '2929-2929');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Emília', 'emilia@gmail.com', '3030-3030');
INSERT INTO cliente(nome_cliente, email_cliente, telefone_cliente) VALUES ( 'Eduardo', 'eduardo@gmail.com', '3131-3131');

INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Televisão', 3661.26, 789250);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Geladeira', 3999.90, 2004480);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Fogão', 1879, 98823138);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Fritadeira Sem Óleo', 365, 789895);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Micro-ondas', 629.90, 78998823);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Liquidificador', 139.99, 8823046);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Sanduicheira', 104.40, 913560407);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Batedeira', 113.90, 8230614);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Ferro', 65.92, 49016663);
INSERT INTO produto(descricao_produto, preco_produto, codigo_produto) VALUES ('Ventilador', 99.99, 313840);

INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211216, 6, 2, 10);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20220101, 6, 2, 5);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211123, 1, 8, 1);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211224, 7, 9, 4);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211124, 8, 3, 9);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211202, 2, 1, 7);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211206, 5, 4, 2);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211229, 4, 5, 6);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211130, 3, 7, 8);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211230, 9, 6, 3);
INSERT INTO pedido_compra(data_pedido, vendedor_id, cliente_id, produto_id) VALUES (20211231, 1, 3, 7);

SELECT * FROM pedido_compra;

ALTER TABLE pedido_compra CHANGE COLUMN data_pedido data_pedido DATE;
DELETE FROM pedido_compra WHERE id_pedido = 2;

SELECT * FROM vendedor ORDER BY nome_vendedor ASC;

SELECT * FROM cliente ORDER BY id_cliente DESC;

UPDATE cliente SET nome_cliente = 'Willian', email_cliente = 'willian@gmail.com', telefone_cliente = '9999-9999' WHERE id_cliente = 5;

SELECT * FROM pedido_compra;

#11
SELECT v.nome_vendedor AS Vendedor, c.nome_cliente AS Cliente, p.descricao_produto AS 'Descrição Produto', pc.data_pedido AS 'Data Pedido'
FROM pedido_compra pc INNER JOIN vendedor v ON v.id_vendedor = pc.vendedor_id 
INNER JOIN cliente c ON c.id_cliente = pc.cliente_id INNER JOIN produto p ON  p.id_produto = pc.produto_id;