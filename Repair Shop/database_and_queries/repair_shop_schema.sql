# Criação do banco de dados para o cenário de Oficina.
-- drop database repairshop;

create database repairshop;
use repairshop;

# Tabela clientes.
create table client_list (
	id_client int auto_increment primary key,
    client_first_name varchar(45) not null,
	client_last_name varchar(45) not null,
	client_id_type enum('CPF', 'CNPJ') default 'CPF',
    client_id_number varchar(15) not null,
	client_contact varchar(11) not null,
    constraint unq_client_id_number unique (client_id_number)
);
-- desc client_list;

alter table client_list auto_increment = 1;

# Tabela pagamento.
create table payment (
	id_payment int auto_increment primary key,
    id_client_payment int,
    payment_status enum('Pending', 'Paid') default 'Pending',
    payment_method enum('Card', 'Cash') default 'Card',
    payment_amount float default null,
    payment_date date default null,
    constraint fk_id_client_payment foreign key (id_client_payment) references client_list(id_client)
);
-- desc payment;

# Tabela carros.
create table car_list (
	id_car int auto_increment primary key,
    id_client_car_list int,
    car_plate_number char(7) not null,
    car_maker varchar(45),
    car_model varchar(45),
    car_color varchar(45),
    car_checkin date not null,
    car_checkout date default null,
    constraint unq_car_plate_number unique (car_plate_number),
    constraint fk_id_client_car_list foreign key (id_client_car_list) references client_list(id_client)
);
-- desc car_list;

# Tabela funcionários.
create table worker_list (
	id_worker int auto_increment primary key,
    worker_first_name varchar(45) not null,
    worker_last_name varchar(45) not null,
    worker_fare float not null default 12.50,
    worker_contact varchar(11) not null,
    worker_skill varchar(255)
);
-- desc worker_list;

# Tabela descrição do reparo.
create table repair_list (
	id_repair_list int auto_increment primary key,
	id_car_repair_list int,
	id_worker_repair_list int,
    repair_status enum('Complete','In process') default 'In process',
    repair_description varchar(255),
    constraint fk_id_car_repair_list foreign key (id_car_repair_list) references car_list(id_car),
	constraint fk_id_worker_repair_list foreign key (id_worker_repair_list) references worker_list(id_worker)
);
-- desc repair_list;