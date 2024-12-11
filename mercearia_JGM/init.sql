CREATE DATABASE empresa;
SHOW DATABASES;

USE empresa;

-- ========================Criando Tabelas========================

create table unMedidas
(
    idUn int primary key auto_increment,
    descricao varchar(10),
    abreviatura varchar(5)
);

create table fornecedores
(
    idForn int primary key auto_increment,
    nomeForn varchar(40),
    cnpj varchar (14),
    endFornecedor varchar(50),
    telFix varchar(30),
    telCel varchar(30)
);

create table categoriaProdutos
(
    idCatProd int primary key auto_increment,
    nomeCat varchar(20)
);

create table produtos
(
    idProd int primary key auto_increment,
    nomeProd varchar(30),
    idUn int,
    idCatProd int,
    idForn int,
    precoProd decimal(10,2),
    foreign key (idun) references unMedidas(idUn) on delete cascade on update cascade,
    foreign key (idForn) references fornecedores(idForn) on delete cascade on update cascade,
    foreign key (idCatProd) references categoriaProdutos(idCatProd) on delete cascade on update cascade
);

create table departamentos
(
    idDepartamento int primary key auto_increment,
    nomeDep varchar(50)
);

create table vendedores
(
    idVendedor int primary key auto_increment,
    nomeVendedor varchar (40),
    idDepartamento int,
    foreign key (idDepartamento) references departamentos(idDepartamento) on delete cascade on update cascade
);

create table clientes
(
    idClient int primary key auto_increment,
    nomeCliente varchar (50),
    cpf varchar(11),
    tel varchar(20)
);

create table vendas
(
    idVenda int primary key auto_increment,
    idClient int,
    idVendedor int,
    dataVenda date,
    valortotal decimal(10,2),
    foreign key (idClient) references clientes(idClient),
    foreign key (idVendedor) references vendedores(idVendedor) on delete cascade on update cascade
);

create table itensVendas
(
    idItVenda int primary key auto_increment,
    idProd int,
    quantidade int,
    idVenda int,
    foreign key (idProd) references produtos(idProd) on delete cascade on update cascade,
    foreign key (idVenda) references vendas(idVenda) on delete cascade on update cascade
);

ALTER TABLE fornecedores MODIFY cnpj VARCHAR(18);




-- ========================Adicionando Operações de Modificação========================

-- inserir salário
ALTER TABLE vendedores ADD salario DECIMAL(10,2);

UPDATE vendedores
SET salario = 1420 WHERE idVendedor = 1; -- 1 salário

UPDATE vendedores
SET salario = 1420 WHERE idVendedor = 2; -- 1 salário

UPDATE vendedores
SET salario = 1420 WHERE idVendedor = 3; -- 1 salário

UPDATE vendedores
SET salario = 2130 WHERE idVendedor = 4; -- 1,5x salário

UPDATE vendedores
SET salario = 4970 WHERE idVendedor = 5; -- 3,5x salário

UPDATE vendedores
SET salario = 4840 WHERE idVendedor = 6; -- 2x salário

UPDATE vendedores
SET salario = 3550 WHERE idVendedor = 7; -- 2,5x salário

UPDATE vendedores
SET salario = 4260 WHERE idVendedor = 8; -- 3x salário

-- inserir data de nascimento em clientes
ALTER TABLE clientes ADD dataNasc DATE;

UPDATE clientes
SET dataNasc = '2004-11-22' WHERE idClient = 1;

UPDATE clientes
SET dataNasc = '2002-05-03' WHERE idClient = 2;

UPDATE clientes
SET dataNasc = '2003-08-20' WHERE idClient = 3;

UPDATE clientes
SET dataNasc = '2005-01-05' WHERE idClient = 4;

UPDATE clientes
SET dataNasc = '2003-05-07' WHERE idClient = 5;

-- Excluir o produto de código 4
DELETE FROM produtos WHERE idProd = 4;

-- Excluir todos os produtos fornecidos pelo fornecedor de código 5
DELETE FROM produtos WHERE idForn = 5;

-- Excluir o fornecedor de código 5
DELETE FROM fornecedores WHERE idForn = 5;

-- Excluir todos os itens da venda de código 3
DELETE FROM itensVendas WHERE idVenda = 3;

-- Excluir a venda de código 3
DELETE FROM vendas WHERE idVenda = 3;

-- Excluir todas as vendas associadas ao cliente de código 2
DELETE FROM vendas WHERE idClient = 2;

-- Excluir todos os itens das vendas associadas ao cliente de código 2
DELETE FROM itensVendas WHERE idVenda IN (SELECT idVenda FROM vendas WHERE idClient = 2);

-- Excluir o cliente de código 2
DELETE FROM clientes WHERE idClient = 2;

-- Excluir todos os produtos associados a essa categoria
DELETE FROM produtos WHERE idCatProd = 4;

-- Excluir a categoria de produtos
DELETE FROM categoriaProdutos WHERE idCatProd = 4;



-- Ordenar produtos em ordem alfabética
SELECT * FROM produtos ORDER BY nomeProd;


-- Selecione todos os clientes cujo nome comece com a letra P
SELECT * FROM clientes WHERE nomeCliente LIKE 'P%';

-- Mostre os códigos dos vendedores que fizeram vendas com valores acima de R$ 1000
SELECT idVendedor FROM vendas WHERE valortotal > 1000;

-- Mostre os nomes dos produtos cujos códigos forem 2, 5, 6 e 10
SELECT idProd, nomeProd AS produtos FROM produtos WHERE idProd IN (2, 5, 6, 10);


-- Adicionar coluna cidade em vendedores
ALTER TABLE vendedores ADD cidade VARCHAR(30);

-- Atualizar a cidade dos vendedores
UPDATE vendedores SET cidade = 'alfenas' WHERE idVendedor = 1;
UPDATE vendedores SET cidade = 'paraguaçu' WHERE idVendedor = 2;
UPDATE vendedores SET cidade = 'alfenas' WHERE idVendedor = 3;
UPDATE vendedores SET cidade = 'areado' WHERE idVendedor = 4;
UPDATE vendedores SET cidade = 'alfenas' WHERE idVendedor = 5;

-- Mostre os vendedores de Alfenas com salário maior que R$ 890,00
SELECT * FROM vendedores WHERE salario > 890 AND cidade = 'alfenas';

-- Apagar a coluna cidade dos vendedores
ALTER TABLE vendedores DROP COLUMN cidade;



-- ========================Adicionando Operações de Consulta========================

-- consultas básicas e aninhadas

SELECT * FROM clientes;

SELECT * FROM produtos WHERE precoProd > 10;

SELECT * FROM vendas WHERE idClient = 1;

SELECT nomeProd FROM produtos WHERE idCatProd = 3;

SELECT * FROM vendedores WHERE salario > 3000;

-- operações com strings

SELECT CONCAT(nomeCliente, ' - ', tel) AS Cliente_Contato FROM clientes;

SELECT * FROM clientes WHERE nomeCliente LIKE '%a%';

SELECT * FROM vendedores WHERE nomeVendedor LIKE 'M%';

SELECT * FROM produtos WHERE nomeProd LIKE '%coca%';

SELECT * FROM fornecedores WHERE nomeForn LIKE '%a';

-- funções agregadas, agrupamento e cláusulas HAVING

SELECT SUM(valortotal) AS Total_Vendas FROM vendas;

SELECT idVendedor, COUNT(idVenda) AS Numero_Vendas FROM vendas GROUP BY idVendedor;

SELECT AVG(precoProd) AS Media_Preco FROM produtos;

SELECT COUNT(idClient) AS Total_Clientes FROM clientes;

SELECT idVendedor, SUM(valortotal) AS Total_Vendas FROM vendas GROUP BY idVendedor;

-- ordenação

SELECT nomeProd FROM produtos ORDER BY nomeProd;

SELECT nomeCliente FROM clientes ORDER BY nomeCliente DESC;

SELECT nomeVendedor, salario FROM vendedores ORDER BY salario DESC;

SELECT nomeProd, precoProd FROM produtos ORDER BY precoProd;

SELECT idVenda, valortotal FROM vendas ORDER BY valortotal DESC;

-- operações de conjuntos (união, interseção e diferença)

SELECT nomeProd FROM produtos WHERE idCatProd = 1
UNION
SELECT nomeProd FROM produtos WHERE idCatProd = 2;

SELECT nomeProd FROM produtos WHERE idCatProd = 1
INTERSECT
SELECT nomeProd FROM produtos WHERE idCatProd = 7;

SELECT nomeProd FROM produtos WHERE idCatProd = 3
EXCEPT
SELECT nomeProd FROM produtos WHERE idCatProd = 1;

SELECT nomeVendedor FROM vendedores WHERE idDepartamento = 1
UNION
SELECT nomeVendedor FROM vendedores WHERE idDepartamento = 2;

-- join

-- Inner Join: Mostrar vendas com o nome do cliente e vendedor
SELECT v.idVenda, c.nomeCliente, ve.nomeVendedor, v.valortotal
FROM vendas v
         JOIN clientes c ON v.idClient = c.idClient
         JOIN vendedores ve ON v.idVendedor = ve.idVendedor;

-- Left Join: Mostrar todos os clientes e suas vendas (inclusive clientes sem vendas)
SELECT c.nomeCliente, v.idVenda, v.valortotal
FROM clientes c
         LEFT JOIN vendas v ON c.idClient = v.idClient;

-- Right Join: Mostrar todas as vendas e os produtos vendidos
SELECT v.idVenda, p.nomeProd, iv.quantidade
FROM vendas v
         RIGHT JOIN itensVendas iv ON v.idVenda = iv.idVenda
         JOIN produtos p ON iv.idProd = p.idProd;

-- Join com múltiplas tabelas: Mostrar vendedores e as vendas realizadas
SELECT ve.nomeVendedor, v.idVenda, v.valortotal
FROM vendas v
         JOIN vendedores ve ON v.idVendedor = ve.idVendedor;

-- Join para mostrar todos os produtos de uma venda
SELECT p.nomeProd, iv.quantidade, iv.idVenda
FROM itensVendas iv
         JOIN produtos p ON iv.idProd = p.idProd;

-- operações com multiconjuntos

-- Seleciona produtos com preço maior que qualquer um dos produtos da categoria 2
SELECT nomeProd, precoProd
FROM produtos
WHERE precoProd > ANY (SELECT precoProd FROM produtos WHERE idCatProd = 2);

-- Seleciona produtos com preço menor que todos os produtos da categoria 3
SELECT nomeProd, precoProd
FROM produtos
WHERE precoProd < ALL (SELECT precoProd FROM produtos WHERE idCatProd = 3);

-- Seleciona vendas realizadas por qualquer vendedor do departamento 1
SELECT *
FROM vendas
WHERE idVendedor = ANY (SELECT idVendedor FROM vendedores WHERE idDepartamento = 1);

-- Seleciona clientes que realizaram mais vendas que todos os clientes do departamento 2
SELECT idClient, COUNT(idVenda) AS TotalVendas
FROM vendas
GROUP BY idClient
HAVING COUNT(idVenda) > ALL (SELECT COUNT(idVenda)
                             FROM vendas
                             WHERE idVendedor IN (SELECT idVendedor FROM vendedores WHERE idDepartamento = 2)
                             GROUP BY idClient);

-- Seleciona fornecedores que fornecem produtos mais baratos que qualquer produto da categoria 5
SELECT nomeForn
FROM fornecedores
WHERE idForn = ANY (SELECT idForn FROM produtos WHERE precoProd < ANY (SELECT precoProd FROM produtos WHERE idCatProd = 5));

-- exists

-- Seleciona clientes que realizaram pelo menos uma venda
SELECT nomeCliente
FROM clientes c
WHERE EXISTS (SELECT 1 FROM vendas v WHERE v.idClient = c.idClient);


-- Seleciona produtos que foram vendidos pelo menos uma vez
SELECT nomeProd
FROM produtos p
WHERE EXISTS (SELECT 1 FROM itensVendas iv WHERE iv.idProd = p.idProd);


-- Seleciona vendedores que já realizaram pelo menos uma venda
SELECT nomeVendedor
FROM vendedores v
WHERE EXISTS (
    SELECT 1
    FROM vendas ve
    WHERE ve.idVendedor = v.idVendedor AND ve.valortotal > 100
);

-- Seleciona produtos que nunca foram vendidos
SELECT nomeForn
FROM fornecedores f
WHERE EXISTS (
    SELECT 1
    FROM produtos p
             JOIN itensVendas iv ON p.idProd = iv.idProd
    WHERE p.idForn = f.idForn
);

-- Seleciona categorias de produtos que possuem pelo menos um produto vendido
SELECT nomeCliente
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM vendas v
             JOIN itensVendas iv ON v.idVenda = iv.idVenda
             JOIN produtos p ON iv.idProd = p.idProd
    WHERE v.idClient = c.idClient AND p.idCatProd = 7
);

-- visualizando toda o banco
SELECT  * FROM produtos;
SELECT * FROM vendedores;
SELECT * FROM clientes;
SELECT * FROM vendas;
SELECT * FROM departamentos;
SELECT * FROM categoriaProdutos;
SELECT * FROM fornecedores;
SELECT * FROM unMedidas;
SELECT * FROM itensVendas;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'produtos' AND COLUMN_NAME IN ('nome_prod', 'preco_prod', 'id_cat_prod', 'id_forn', 'id_un');

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'produtos' AND COLUMN_NAME IN ('nome_prod', 'preco_prod', 'id_cat_prod', 'id_forn', 'id_un');


describe produtos;