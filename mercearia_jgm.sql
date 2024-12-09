create database empresa

use empresa

--========================Criando Tabelas========================

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

create table categoriaProdutos
(
idCatProd int primary key auto_increment,
nomeCat varchar(20)
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

--========================Populando tabelas========================

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

select * from produtos

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

select * from  vendas

-- itens venda
INSERT INTO itensVendas (idProd, quantidade, idVenda) 
VALUES (1, 5, 11),
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
