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


-- ========================Populando tabelas========================

-- categoria de produtos
insert into categoriaProdutos (nomeCat)
values  ('frios'),
        ('limpeza'),
        ('bebida'),
        ('padaria'),
        ('higiene'),
        ('laticínios'),
        ('hortifruti'),
        ('perecíveis'),
        ('carnes'),
        ('grãos'),
        ('bombomniere');

-- unidade de medidas
insert into unMedidas (descricao, abreviatura)
values  ('litros','L'),
        ('metros','M'),
        ('kilo grama','KG'),
        ('pacote', 'PC'),
        ('caixa', 'CX'),
        ('dúzia', 'DZ'),
        ('mililitros', 'ML'),
        ('unidade','UN');

-- fornecedores
insert into fornecedores (nomeForn, cnpj, endFornecedor, telFix, telCel)
values  ('Seara','000180377369273','rua pinheiro chagas 284','33312934',''),
        ('Minuano','964376297407865','avenida joaquim barbosa 325','33328767',''),
        ('Ambeve','986754327658734','rua francisco vieira 3254','33329485',''),
        ('Delicias do Pão','709876543543217','rua tiradentes 126','33314348',''),
        ('Limpinho Materiais Higiênicos','678903458762345','avenida waldemar fernal 404','33319090',''),
        ('Nestlé', '12345678901234', 'Rua das Amoras 123', '123456789', '987654321'),
        ('Perdigão', '98765432109876', 'Avenida Brasil 456', '123123123', '321321321'),
        ('Coca-Cola', '65498732145698', 'Rua dos Lírios 789', '444555666', '999888777'),
        ('Frigorífico Boa Carne', '34567890123456', 'Estrada Velha 987', '222111333', '555666777'),
        ('Alimentos Saudáveis LTDA', '45678901234567', 'Rua das Palmeiras 654', '111333555', '888777666'),
        ('Lidiane Ovos','678903458762345','avenida pinheiro chagas 204','33314390','');

-- departamentos
insert into departamentos (nomeDep)
values  ('caixa.1'),
        ('caixa.2'),
        ('caixa.3'),
        ('estoque'),
        ('administração'),
        ('marketing'),
        ('RH'),
        ('TI');

-- clientes
insert into clientes (nomeCliente, cpf, tel)
values ('gabriela', '12312312312', '986532178'),
       ('roberto', '98798798765', '987654321'),
       ('carla', '11223344566', '992233445'),
       ('lucas', '22334455667', '993344556'),
       ('patricia', '33445566778', '994455667'),
       ('marcos', '98745634280', '99675475'),
       ('jose', '87676565478', '98563412'),
       ('felipe', '23487647590', '98560056'),
       ('leandro', '01702682580', '98372622'),
       ('aurelio', '99966645376', '98552278'),
       ('ana', '12345678901', '984536278'),
       ('beatriz', '09876543210', '985693210'),
       ('carlos', '11223344556', '986758493'),
       ('daniel', '22334455667', '983472615'),
       ('eduardo', '33445566778', '984578392');

-- produtos
insert into produtos (nomeProd, idUn, idCatProd, idForn, precoProd)
values ('refrigerante coca-cola', 4, 3, 3, 8.00),
       ('presunto Sadia', 3, 1, 1, 22.50),
       ('arroz tipo 1', 4, 11, 5, 12.00),
       ('feijão carioca', 4, 11, 5, 6.50),
       ('manteiga', 1, 7, 1, 12.50),
       ('maçã fuji', 3, 8, 2, 7.00),
       ('iogurte grego', 1, 7, 1, 9.50),
       ('farinha de trigo', 4, 11, 5, 3.50),
       ('café Pilão', 4, 7, 1, 13.50),
       ('cereal matinal', 1, 7, 1, 10.00),
       ('detergente minuano', 4, 2, 5, 1.50),
       ('pão de forma', 3, 4, 4, 13.0),
       ('sabonete lux', 4, 5, 2, 2.0),
       ('presunto', 3, 1, 1, 18.0),
       ('skol', 4, 3, 3, 2.30),
       ('chocolate', 3, 6, 6, 16.0),
       ('leite integral', 1, 7, 1, 4.50),
       ('queijo muçarela', 3, 7, 1, 30.00),
       ('banana', 3, 8, 2, 5.00),
       ('carne bovina', 3, 10, 4, 45.00),
       ('arroz 5kg', 4, 11, 5, 25.00);

-- vendedores
insert into vendedores (nomeVendedor, idDepartamento)
values ('marcela', 2),
       ('sabrina', 3),
       ('carlos', 1),
       ('caio', 1),
       ('rafael', 2),
       ('joana', 2),
       ('paula', 4),
       ('tiago', 3),
       ('pedro', 1),
       ('maria', 5);

-- vendas
insert into vendas (idClient, idVendedor, dataVenda, valortotal)
values (1, 1, '2023-11-01', 180.00),
       (2, 3, '2023-11-02', 220.00),
       (3, 2, '2023-11-03', 55.00),
       (4, 4, '2023-11-04', 95.00),
       (5, 5, '2023-11-05', 140.00),
       (1, 2, '2023-11-06', 160.00),
       (2, 4, '2023-11-07', 210.00),
       (3, 1, '2023-11-08', 50.00),
       (4, 3, '2023-11-09', 75.00),
       (5, 2, '2023-11-10', 130.00),
       (1, 2, '2024-11-13', 35.0),
       (2, 1, '2024-12-04', 20.0),
       (3, 3, '2024-12-20', 12.50),
       (4, 1, '2024-12-20', 13.0),
       (5, 1, '2024-01-03', 5.80),
       (2, 4, '2024-03-03', 3.90),
       (1, 5, '2024-10-01', 150.00),
       (2, 4, '2024-10-02', 200.00),
       (3, 3, '2024-10-03', 50.00),
       (4, 2, '2024-10-04', 75.00),
       (5, 1, '2024-10-05', 125.00);

-- itens venda
insert into itensVendas (idProd, quantidade, idVenda)
values (1, 5, 11),
       (2, 2, 12),
       (3, 3, 13),
       (4, 4, 14),
       (5, 6, 15),
       (6, 2, 16),
       (7, 1, 17),
       (8, 3, 18),
       (9, 7, 19),
       (10, 4, 20),
       (1, 2, 11),
       (2, 1, 12),
       (3, 4, 13),
       (5, 2, 14),
       (6, 3, 15),
       (4, 5, 16),
       (7, 3, 17),
       (8, 1, 18),
       (9, 2, 19),
       (10, 5, 20),
       (1, 4, 2),
       (2, 700, 2),
       (5, 12, 2),
       (3, 10, 2),
       (4, 200, 1),
       (5, 30, 3),
       (4, 300, 4),
       (5, 2, 5),
       (3,100,6),
       (3,900,6),
       (5,300,6),
       (6,700,6),
       (6,200,6),
       (6,400,6),
       (1, 10, 2),
       (2, 5, 3),
       (3, 2, 4),
       (4, 1, 5),
       (5, 4, 1),
       (6, 7, 2),
       (3, 3, 3),
       (2, 1, 4),
       (5, 2, 5),
       (4, 8, 1),
       (1, 20, 2),
       (2, 6, 3),
       (5, 3, 4);

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
