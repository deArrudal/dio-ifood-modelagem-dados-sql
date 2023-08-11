select now() as timestamp;

create database if not exists manipulation;
use manipulation;

create table bank_accounts (
	id_account int auto_increment primary key,
    agency_number int not null,
    account_number int not null,
    constraint identification_account_constraint unique (agency_number, account_number)
);

create table bank_client (
	id_client int auto_increment,
    client_account int,
    cpf char(11) not null,
    rg char(9) not null,
    name_client varchar(50) not null,
    address varchar(100) not null,
    monthly_salary float,
    primary key (id_client, client_account),
    constraint fk_account_client foreign key (client_account) references bank_accounts(id_account)
    on update cascade
);

create table bank_transactions (
	id_transaction int auto_increment primary key,
    occurence datetime,
    status_transaction varchar(20),
    ammount float,
    source_account int,
    destination_account int,
    constraint fk_source_transaction foreign key (source_account) references bank_accounts(id_account),
    constraint fk_destination_transaction foreign key (destination_account) references bank_accounts(id_account)
);
