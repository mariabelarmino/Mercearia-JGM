create database empresa

use empresa

--========================Criando Tabelas========================

create table produtos
(
idProd int primary key auto_increment,
nomeProd varchar(30),
idUn int,
foreign key (idun) references unMedidas(idUn), 
idCatProd int,
foreign key (idCatProd) references categoriaProdutos(idCatProd),
idForn int, 
foreign key (idForn) references fornecedores(idForn),
precoProd decimal(10,2),
)

create table categoriaProdutos
(
idCatProd int primary key auto_increment,
nomeCat varchar(20),
)

create table unMedidas
(
idUn int primary key auto_increment,
descricao varchar(10),
abreviatura varchar(5)
) 

create table fornecedores
(
idForn int primary key auto_increment,
nomeForn varchar(40),
cnpj varchar (15),
endFornecedor varchar(50),
telFix varchar(30),
telCel varchar(30),
)

create table vendedores
(
idVendedor int primary key auto_increment,
nomeVendedor varchar (40),
idDepartamento int,
foreign key (idDepartamento) references departamentos(idDepartamento),
)

create table departamentos
(
idDepartamento int primary key auto_increment,
nomeDep varchar(50),
)

create table clientes
(
idClient int primary key auto_increment,
nomeCliente varchar (50),
cpf varchar(11),
tel varchar(20),
)

create table vendas
(
idVenda int primary key auto_increment,
idClient int,
foreign key (idClient) references clientes(idClient),
idVendedor int,
foreign key (idVendedor) references vendedores(idVendedor),
dataVenda datetime,
valortotal decimal(10,2),
)

create table itensVendas
(
idItVenda int primary key auto_increment,
idProd int,
foreign key (idProd) references produtos(idProd),
quantidade float,
idVenda int,
foreign key (idVenda) references vendas(idVenda),
)

--========================Povoando tabelas========================

-- categoria de produtos
insert into categoriaProdutos (nomeCat)
values  ('frios'),
        ('limpeza'),
        ('bebida'),
        ('padaria'),
        ('higiene'),
        ('bombomniere');


-- unidade de medidas
insert into unMedidas (descricao, abreviatura)
values  ('litros','L'),
        ('metros','M'),
        ('kilo grama','KG'),
        ('unidade','UN');

-- fornecedores
insert into fornecedores (nomeForn, cnpj, endFornecedor, telFix, telCel) 
values  ('Seara','000180377369273','rua pinheiro chagas 284','33312934',''),
        ('Minuano','964376297407865','avenida joaquim barbosa 325','33328767',''),
        ('Ambeve','986754327658734','rua francisco vieira 3254','33329485',''),
        ('Delicias do Pão','709876543543217','rua tiradentes 126','33314348',''),
        ('Limpinho Materiais Higiênicos','678903458762345','avenida waldemar fernal 404','33319090',''),
        ('Lidiane Ovos','678903458762345','avenida pinheiro chagas 204','33314390','');


-- departamentos
insert into departamentos (nomeDep)
values  ('caixa.1'),
        ('caixa.2'),
        ('caixa.3');

-- clientes
insert into clientes (nomeCliente, cpf, tel) 
values ('marcos', '98745634280', '99675475'),
       ('jose', '87676565478', '98563412'),
       ('felipe', '23487647590', '98560056'),
       ('leandro', '01702682580', '98372622'),
       ('aurelio', '99966645376', '98552278');

-- produtos
insert into produtos (nomeProd, idUn, idCatProd, idForn, precoProd) 
values ('detergente minuano', 4, 2, 5, 1.50),
       ('pão de forma', 3, 4, 4, 13.0),
       ('sabonete lux', 4, 5, 2, 2.0),
       ('presunto', 3, 1, 1, 18.0),
       ('skol', 4, 3, 3, 2.30),
       ('chocolate', 3, 6, 6, 16.0);

select * from produtos

-- vendedores
insert into vendedores (nomeVendedor, idDepartamento) 
values ('marcela', 2),
       ('sabrina', 3),
       ('carlos', 1),
       ('caio', 1),
       ('rafael', NULL);

-- vendas
insert into vendas (idClient, idVendedor, dataVenda, valortotal) 
values (1, 2, '2015-11-13', 35.0),
       (2, 1, '2015-12-04', 20.0),
       (3, 3, '2015-12-20', 12.50),
       (4, 1, '2015-12-20', 13.0),
       (5, 1, '2016-01-03', 5.80),
       (2, 4, '2016-03-03', 3.90);

select * from  vendas

-- itens venda
INSERT INTO itensVendas (idProd, quantidade, idVenda) 
VALUES (1, 4.0, 2),
       (2, 700.0, 2),
       (5, 12.0, 2),
       (3, 10.0, 2),
       (4, 200.0, 1),
       (5, 30.0, 3),
       (4, 300.0, 4),
       (5, 2.0, 5),
       (3,100.0,6),
       (3,900.0,6),
       (5,300.0,6),
       (6,700.0,6),
       (6,200.0,6),
       (6,400.0,6);
