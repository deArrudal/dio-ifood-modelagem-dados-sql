# Criação do banco de dados para o cenário de E-commerce.
-- drop database ecommerce;

create database ecommerce;
use ecommerce;

# Tabela cliente.
create table clients (
	idClient int auto_increment primary	key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF)
);
-- desc clients;

alter table clients auto_increment = 1; -- Define incremento da tabela cliente.

# Tabela produto.
create table product (
	idProduct int auto_increment primary key,
    Pname varchar(30) not null,
    classification_kids bool default false,
    category enum('eletrônico', 'vestimenta', 'brinquedos', 'alimentos', 'móveis') not null,
    evaluation float default 0,
    size varchar(10)
);
-- desc product;

# Tabela pagamento.
create table payments (
	idPayment int,
    idClient int,
    typePayment enum('cartão', 'boleto', 'pix'),
    limitAvailable float,
    primary key(idClient, idPayment),
    constraint fk_idClient_payments foreign key (idClient) references clients(idClient)
);
-- desc payments;

# Tabela pedido.
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('cancelado', 'confirmado', 'em processamento') not null default 'em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);
-- desc orders;

# Tabela estoque.
create table productStorage(
	idProdStorage int auto_increment primary key,
    location varchar(50) not null,
    quantity int not null default 0
);
-- desc productStorage;

# Tabela fornecedor.
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact varchar(11) not null,
    constraint unique_supllier unique(CNPJ)
);
-- desc supplier;

# Tabela vendedor.
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);
-- desc seller;

# Tabela de relacionamento produto/vendedor.
create table productSeller(
	idProductSeller int,
    idProductProduct int,
    productQuantity int default 1,
    primary key (idProductSeller, idProductProduct),
    constraint fk_product_seller foreign key (idProductSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProductProduct) references product(idProduct)
);
-- desc productSeller;

# Tabela de relacionamento produto/pedido.
create table productOrder(
	idProductOrderProduct int,
    idProductOrderOrder int,
    productOrderQuantity int default 1, 
    productOrderStatus enum('disponível','indisponível') default 'indisponível',
    primary key (idProductOrderProduct, idProductOrderOrder),
    constraint fk_product_order_seller foreign key (idProductOrderProduct) references product(idProduct),
    constraint fk_product_order_product foreign key (idProductOrderOrder) references orders(idOrder)
);
-- desc productOrder;

# Tabela de relacionamento produto/estoque.
create table storageLocation(
	idLocationProduct int,
    idLocationStorage int,
    location varchar(255) not null,
    primary key (idLocationProduct, idLocationStorage),
    constraint fk_storage_location_product foreign key (idLocationProduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLocationStorage) references productStorage(idProdStorage)
);
-- desc storageLocation;

# Tabela de relacionamento produto/fornecedor.
create table productSupplier(
	idProductSupplier int,
    idProductProduct int,
    quantity int not null,
    primary key (idProductSupplier, idProductProduct),
    constraint fk_product_supplier_supplier foreign key (idProductSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idProductProduct) references product(idProduct)
);
-- desc productSupplier;