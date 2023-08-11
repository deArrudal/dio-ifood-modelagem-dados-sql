# DDL commands.
use manipulation;

-- drop table bank_client;

alter table bank_accounts add credit_limit float not null default 500.00;
desc bank_accounts;

alter table bank_accounts modify column credit_limit float default 100.00;
desc bank_accounts;

alter table bank_accounts drop column credit_limit;
desc bank_accounts;

insert into bank_accounts (agency_number, account_number) values (123, 456);
select * from bank_accounts;

insert into bank_client (client_account, cpf, rg, name_client, address, monthly_salary) values (1, 12345678901, 123456789, 'john smith', 'boulevard avenue', 504.00);
select * from bank_client;

alter table bank_client add uff char(2) not null default 'rj';
desc bank_client;

update bank_client set uff = 'mg' where (id_client = 1 and client_account = 1);
