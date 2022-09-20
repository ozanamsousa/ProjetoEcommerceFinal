-- criação do banco de dados para cenário ecommerce

create database ecommerce;
use ecommerce;

-- criação da tabela cliente

create table Cliente(
idCliente int auto_increment primary key,
Pnome varchar(10),
Abnome char (3),
Snome varchar (20),
Aniversario date,
CPF char(11),
Endereço varchar (255)
);

insert into Cliente(idCliente, Pnome, Abnome, Snome, Aniversario, CPF, Endereço) 
values 
(1,'Maria','E','Souza','1992-05-30',98311443092,'243-Rua Roraima-Novo Oriente-Belo Oriente'),
(2,'Jose','P','Aguiar','1979-04-23',84896214030,'42- Rua Petrolina-Nova Iguaçu-Ipatinga'),
(3,'Gustavo','F','Pereira','1980-05-08',61804713040,'2456-Rua Ferroviaria-Petropoles-Mesquita'),
(4,'Gabriel','B','Gusmão','1990-08-12',81726054047,'12-Rua das Flores-Limeira-Açucena'),
(5,'Loriane','P','Fernandes','1992-10-30',90999271008,'56-Rua Felicio-Alagoano-Periquito'),
(6,'Felicia','W','Schineider','1992-10-30',07233235007,'09-Reviver-Flor de lis-Naque'),
(7,'Georginia','F','Revitaa','1992-11-10','14685275098','53-Rua Cecilio Morais-Petrol-Coronel F'),
(8,'Francisca','F','Joventina','1986-05-24','12685375098','76-Rua de Baixio-Servidão-Gov-Valadares'),
(9,'George','P','Grow','1962-01-22','54685272098','76-Rua Felicino-Caladao-Timoteo'),
(10,'Marcos','M','Souza','1986-05-30','44685255198','98-Rua imbiroba-Sete Mares-Lagoano'),
(11,'Pedro','C','Carvalho','1972-02-10','34685275098','798-Rua Aguas Claras- Belo monte-Petronio'),
(12,'Felipe','F','Silva','1982-03-20','24685575098','5463-Venicio-Campos Alto-Alto Caparao');
select * from cliente;
desc cliente;
-- criar tabela produto

create table Produto(
idProduto int auto_increment primary key,
ProdNome varchar(100) not null,
Marca varchar(100) not null,
ClassificaçãoCriança bool default false,
Categoria enum ('Eletronico','Brinquedos','Moveis','Celular') not null,
Descrição varchar(255),
Avaliação float,
Tamanho varchar (100),
Valor float
);

insert into Produto(ProdNome,Marca,ClassificaçãoCriança,Categoria,Descrição,Avaliação,Tamanho,Valor)
value
('Fone de Ouvido Samsung Galaxy','Samsung',null,'Eletronico','O Galaxy Buds Live é um fone de ouvido totalmente sem fio (TWS), tipo canal aberto, e que graças ao seu design ergonômico oferece o conforto para curtir suas músicas por horas',4,'3cmX1mm',530.00),
('GoPro Hero 10','GoPro',null,'Eletronico','Graças à alta taxa de quadros em 5K com 60 qps e 4K com 120 qps, você pode captar imagens muito melhores',5,'55mmX34mm',3.03900),
('Caixa de Som Portátil','LG',null,'Eletronico',' Bateria com duração de até 24 horas.','4','96mmX245mm',1.58900),
('Caixa de Som JBL PARTYBOX','JBL',null,'Eletronico',' Entrada para microfone e guitarra ou violão.',4,'511mmX290mm',1.89999),
('Caixa de Som Portátil LG XBOOM GO PL5','LG',null,'Eletronico','Com uma bateria de 3900 mAh, você tem até 18 horas de música com uma única recarga.',5,'79mmX199mm',459.00),
('Caixa de Som Portatil Toshiba','Toshiba',null,'Eletronico','Com uma bateria de 2000 mAh, você tem até 20 horas de música com uma única recarga.',3,'88,9mmX139,7mm',259.99),
('Notebook Lenovo 15,6','Lenovo',null,'Eletronico','i5-8250U Core i5 Memória B330-15IKBR Windows 10 Preto',5,'18mmX289mm',3.59910),
('Notebook Vaio SE14 14','VAIO',null,'Eletronico','Intel CoreTM i5-8265U 8GB RAM 256GB SSD VJSE41G11X-B0111H',5,'19,8mmX324mm',4.04910),
('Smartphone Samsung Galaxy Z','Samsung',null,'Celular','Flip3 5G Tela dobravel de 6,7" 128GB Processador Snapdragon 8GB de RAM Camera Dupla Traseira Preto',5,'86,4mmX72,2mm',6.29910),
('Smartphone Samsung Galaxy S10','Samsung',null,'Celular','28 GB Preto 6.1" 4G',5,'149,9mmX70,4mm',3.59910);
select * from Produto;
-- criação da tabela de pagamento
create table Pagamento(
idCliente int,
idPagamento int,
tipoPagamento enum ('Boleto','Cartão', 'Dois cartões,Pix'),
LimiteAvaliado float,
Validade date,
primary key (idCliente, idPagamento)
);

-- criar tabela pedido

create table OrdemServiço(
idOrdem int auto_increment primary key,
idOrdemProduto int,
idOrdemCliente int,
StatusOrdem enum ('Cancelado', 'Confirmado','Em processamento') default 'Em processamento',
DescriçãoOrdem varchar (255),
ValorOrdem float default 10,
PagamentoDinheiro bool default false,
constraint fk_ordem_cliente foreign key (idOrdemCliente) references Cliente(idCliente),
constraint fk_ordem_Produto foreign key (idOrdemProduto) references Produto(idProduto) 
);
select*from OrdemServiço;
insert into OrdemServiço(idOrdemCliente,StatusOrdem,DescriçãoOrdem,ValorOrdem,PagamentoDinheiro) values
(1,'Confirmado','Compra Site',null,default),
(2,'Cancelado','Compra Site',null,1),
(3,default,'Compra Aplicativo',null,1),
(4,'Confirmado','Compra Site',null,1),
(5,'Confirmado','Compra Aplicativo',null,default),
(6,'Confirmado','Compra Aplicativo',null,default),
(7,'Confirmado','Compra Aplicativo',null,default),
(8,'Confirmado','Compra Site',null,1),
(9,'Confirmado','Compra Site',null,1),
(10,'Confirmado','Compra Site',null,1),
(11,'Confirmado','Compra Site',null,1),
(12,'Confirmado','Compra Site',null,default);

desc OrdemServiço;
select * from OrdemServiço;

-- criar tabela estoque

create table ProdutoEstoque(
idProdEstoque int auto_increment primary key,
idProdEstoqueProd int,
EstoqueLocalização varchar(255),
Quantidade int default 0,
constraint fk_produto_estoque foreign key (idProdEstoqueProd) references Produto(idProduto)
);

insert into ProdutoEstoque(EstoqueLocalização,Quantidade) values
('342-Rua Guaratiba-Toquarto-SP',20),
('21-Rua das Flores-Rio Preto-SP',30),
('456-Rua Estica e Puxa-Petropolis-RJ',40);
select * from ProdutoEstoque;

-- criar tabela fornecedor
create table Fornecedor(
idFornecedor int auto_increment primary key,
RazãoSocial varchar(255) not null,
CNPJ char(15) not null,
Contato char(11) not null,
constraint unique_fornecedor unique (CNPJ)
);

insert into Fornecedor(RazãoSocial,CNPJ,Contato) values
('Mario fernandes Ltda',46441947000139,98765943212),
('Marcos de Sá',14661100000173,92353246743),
('Nicolas Pereira',96459480000122, 96235643532);

select * from Fornecedor;

-- criar tabela vendedor
create table Vendedor(
idVendedor int auto_increment primary key,
Nome varchar(255) not null,
Snome varchar(255),
Endereço varchar(255),
Contato char(11) not null
);
insert into Vendedor (Nome,Snome,Endereço,Contato) values
('Feliciano','Pereira','Rua 3-Soberano-BO','98765463721'),
('Carlos','Soares','Rua 50-Soberano-SA','98763463721'),
('Francine','Silva','Rua 10-Soberano-AS','98715463721'),
('Marcos','Souza','Rua 23-Soberano-PO','98765263721'),
('Matheus','Souza','Rua 5-Soberano-PR','98765363721'),
('Isabela','Goveia','Rua 10-Soberano-GR','98775463721'),
('Fernanda','Gular','Rua 20-Soberano-GA','98775463721'),
('Jussara','Felix','Rua 09-Soberano-SA','98715463721'),
('Juca','Feliz','Rua 80-Soberano-BO','98765462721'),
('Santos','Ferreira','Rua 11-Soberano-SA','98715463721');
select * from Vendedor;
create table PessoaJuridica(
idPJVendedor int,
idPJCliente int,
CNPJ char(15),
constraint fk_PessoaJuridica_Vendedor foreign key (idPJVendedor) references Vendedor(idVendedor),
constraint fk_PessoaJuridica_Cliente foreign key (idPJCliente) references Cliente(idCliente) 
);
insert into PessoaJuridica(idPJCliente,CNPJ) values
(1,'95803376000140'),
(2,'11943847000126'),
(3,'61155403000102'),
(4,'37148035000182'),
(5,'39873348000129');

select * from PessoaJuridica;
create table PessoaFisica(
idPFVendedor int,
idPFCliente int,
CPF char(11),
constraint fk_PessoaFisica_Vendedor foreign key (idPFVendedor) references Vendedor(idVendedor),
constraint fk_PessoaFisica_Cliente foreign key (idPFCliente) references Cliente(idCliente) 
);

insert into PessoaFisica(idPFCliente,CPF)values
(6,05622711045),
(7,58664609047),
(8,85763300084),
(9,41660985005),
(10,54994668078);

select * from PessoaJuridica;
-- criação tabela produto vendedor
create table ProdutoVendedor(
idProdVendedor int,
idProduto int,
ProdQuantidade int default 1,
primary key (idProdVendedor, idProduto),
constraint fk_produto_vendedor foreign key (idProdVendedor) references Vendedor(idVendedor),
constraint fk_product_produto foreign key (idProduto) references Produto (idProduto)
);
desc ProdutoVendedor;
desc ordemserviço;
create table ProdPedido(
idPedidoProd int,
idOrdemCliente int,
poStatus enum ('Disponivel','Sem estoque') default 'Disponivel',
primary key (idPedidoProd, idOrdemCliente),
constraint fk_produtoOrdem_vendedor foreign key (idOrdemCliente) references produto(idProduto),
constraint fk_produtoOrdem_produto foreign key (idOrdemCliente) references OrdemServiço(idOrdem)
);

create table LocalizaçãoEstoque(
idLocalizaçãoProd int,
idLocalizaçãoEstoque int,
Localização varchar(255) not null,
primary key (idLocalizaçãoProd, idLocalizaçãoEstoque),
constraint fk_estoque_localização_produto foreign key (idLocalizaçãoProd) references produto(idProduto),
constraint fk_estoque_localização_estoque foreign key (idLocalizaçãoEstoque) references ProdutoEstoque(idProdEstoque)
);
desc Fornecedor;
create table ProdFornecedor(
idPFFornecedor int,
idPFProduto int,
Quantidade int not null,
primary key (idPFFornecedor, idPFProduto),
constraint fk_produto_fornecedor_fornecedor foreign key (idPFFornecedor) references Fornecedor(idFornecedor),
constraint fk_produto_fornecedor_produto foreign key (idPFProduto) references produto (idProduto)
);
create table Entrega(
idEntrega int,
StatusEntrega enum ('Em Andamento','A caminho', 'Entregue') default 'Em Andamento',
CodRastreio varchar(255)
);
show tables;
select * from Vendedor;
-- recuperação simples com Select
-- Realizando a busca de um produto cujo a marca do produto contém Samsung.
select * from Produto where marca = 'Samsung';
-- filtros com Where
-- Realizando a busca de clientes que efetuaram o pagamento da compra pelo Site.
select concat(Pnome,' ',Snome) as Nome_completo, Endereço from Cliente, OrdemServiço  where idCliente = idOrdem and  StatusOrdem = 'Confirmado';
-- Realizando a busca de clientes que efetuaram o pagamento da compra pelo Site via cartão.
select concat(Pnome,' ',Snome) as Nome_completo, Endereço from Cliente, OrdemServiço  where idCliente = idOrdem and  StatusOrdem = 'Em processamento';
-- Realizando a busca de clientes que cancelaram a compra.
select concat(Pnome,' ',Snome) as Nome_completo, Endereço from Cliente, OrdemServiço  where idCliente = idOrdem and  StatusOrdem = 'Cancelado';
-- Realizando a busca dos clientes que são PJ
select concat(Pnome,' ',Snome) as Nome_completo, Endereço from (Cliente join PessoaJuridica on idPJCliente=idCliente); 
-- Realizando a busca dos clientes que são PF
select concat(Pnome,' ',Snome) as Nome_completo, Endereço from (Cliente join PessoaFisica on idPFCliente=idCliente); 
-- Realizando a busca e agrupando
select StatusOrdem, count(*) from OrdemServiço order by ValorOrdem;