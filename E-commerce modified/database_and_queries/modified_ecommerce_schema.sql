# Criação do banco de dados para o cenário de E-commerce.
-- drop database ecommerce;

create database ecommerce;
use ecommerce;

# Tabela cliente.
create table client_list (
	id_client int auto_increment primary key,
    client_name varchar(50) not null,
    client_cpf char(11),
    client_cnpj char(15),
    client_address varchar(255) not null,
    client_contact varchar(11) not null,
    constraint unq_client_cpf unique (client_cpf),
    constraint unq_client_cnpj unique (client_cnpj),
    constraint chk_client_type check ((client_cpf is not null and client_cnpj is null) or (client_cpf is null and client_cnpj is not null))
);
-- desc client_list;

# Define incremento da tabela cliente.
alter table client_list auto_increment = 1;

# Tabela pedido.
create table order_list (
	id_order int auto_increment primary key,
    id_client_order_list int,
    order_status enum ('complete', 'processing') default 'processing',
    order_description varchar(255),
    constraint fk_id_client_order_list foreign key (id_client_order_list) references client_list(id_client)
);
-- desc order_list;

# Tabela pagamento.
create table payment (
	id_payment int auto_increment primary key,
    id_order_payment int,
    payment_status enum ('complete', 'pending') default 'pending', 
    payment_method enum ('card', 'transfer') default 'card',
    payment_amount float not null,
    constraint fk_id_order_payment foreign key (id_order_payment) references order_list(id_order)
);
-- desc payment;

# Tabela envio (frete).
create table shipping (
	id_shipping int auto_increment primary key,
    id_order_shipping int,
    shipping_status enum ('delivered', 'pending') default 'pending',
	constraint fk_id_order_shipping foreign key (id_order_shipping) references order_list(id_order)  
);
-- desc shipping;

# Tabela produto.
create table product_list (
	id_product int auto_increment primary key,
    product_name varchar(50) not null,
    product_category enum('eletronic', 'food', 'furniture') not null,
    product_rating float default 0
);
-- desc product_list;

# Tabela estoque.
create table storage_list (
	id_storage int auto_increment primary key,
    storage_location varchar(255) not null,
    storage_quantity int not null default 0
);
-- desc storage_list;

# Tabela fornecedor.
create table supplier_list (
	id_supplier int auto_increment primary key,
    supplier_company_name varchar(50) not null,
    supplier_trade_name varchar(50) not null,
    supplier_cnpj char(15) not null,
    supplier_address varchar(255) not null,
    supplier_contact varchar(11) not null,
    constraint unq_supllier_cnpj unique(supplier_cnpj)
);
-- desc supplier_list;

# Tabela vendedor.
create table seller_list (
	id_seller int auto_increment primary key,
    seller_trade_name varchar(50) not null,
    seller_name varchar(50) not null,
    seller_cpf char(11),
    seller_cnpj char(15),
    seller_address varchar(255) not null,
    seller_contact varchar(11) not null,
    constraint unq_seller_cpf unique (seller_cpf),
    constraint unq_seller_cnpj unique (seller_cnpj),
    constraint chk_seller_type check ((seller_cpf is not null and seller_cnpj is null) or (seller_cpf is null and seller_cnpj is not null))
);
-- desc seller_list;

# Tabela de relacionamento produto/pedido.
create table relation_product_order (
	id_order_relation_product_order int,
    id_product_relation_product_order int,
    relation_product_order_status enum('complete','processing') default 'processing',
    relation_product_order_quantity int default 1, 
    primary key (id_order_relation_product_order, id_product_relation_product_order),
    constraint fk_id_order_relation_product_order foreign key (id_order_relation_product_order) references order_list(id_order),
    constraint fk_id_product_relation_product_order foreign key (id_product_relation_product_order) references product_list(id_product)
);
-- desc relation_order_product;

# Tabela de relacionamento produto/vendedor.
create table relation_product_seller (
	id_seller_relation_product_seller int,
    id_product_relation_product_seller int,
    relation_product_seller_quantity int default 1,
    primary key (id_seller_relation_product_seller, id_product_relation_product_seller),
    constraint fk_id_seller_relation_product_seller foreign key (id_seller_relation_product_seller) references seller_list(id_seller),
    constraint fk_id_product_relation_product_seller foreign key (id_product_relation_product_seller) references product_list(id_product)
);
-- desc relation_product_seller;

# Tabela de relacionamento produto/estoque.
create table relation_product_storage (
	id_storage_relation_product_storage int,
    id_product_relation_product_storage int,
    relation_product_storage_location varchar(255) not null,
    relation_product_storage_quantity int not null default 0,
    primary key (id_storage_relation_product_storage, id_product_relation_product_storage),
    constraint fk_id_storage_relation_product_storage foreign key (id_storage_relation_product_storage) references storage_list(id_storage),
    constraint fk_id_product_relation_product_storage foreign key (id_product_relation_product_storage) references product_list(id_product)
);
-- desc relation_product_storage;

# Tabela de relacionamento produto/fornecedor.
create table relation_product_supplier (
	id_supplier_relation_product_supplier int,
    id_product_relation_product_supplier int,
    relation_product_supplier_quantity int not null default 1,
    primary key (id_supplier_relation_product_supplier, id_product_relation_product_supplier),
    constraint fk_id_supplier_relation_product_supplier foreign key (id_supplier_relation_product_supplier) references supplier_list(id_supplier),
    constraint fk_id_product_relation_product_supplier foreign key (id_product_relation_product_supplier) references product_list(id_product)
);
-- desc relation_product_supplier;