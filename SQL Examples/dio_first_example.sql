# display databases and table.
show databases;
show tables;

# create and set a new database.
create database if not exists first_example;
use first_example;

# create tables inside the first_example database.
create table person(
	person_id smallint unsigned,
    fname varchar(20),
    lname varchar(20),
    gender enum('M','F'),
    birth_date date,
    street varchar(30),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    constraint pk_person primary key (person_id)
    );
desc person;
create table favorite_food(
	person_id smallint unsigned,
	food varchar(20),
	constraint pk_favorite_food primary key(person_id, food),
	constraint fk_favorite_food_person_id foreign key(person_id)
	references person(person_id)
);
desc favorite_food;

# populate the tables.
insert into person values(
	'1', 'carolina', 'silva', 'F', '1979-08-21', 'rua das rosas', 'sampaio', 'rj', 'brasil', '26054-89'
);
insert into person values(
	'2', 'felipe', 'mello', 'M', '1980-07-20', 'rua das maças', 'sampaio', 'rj', 'brasil', '26055-90'
);
select * from person;
insert into favorite_food values ('1', 'apple pie');
insert into favorite_food values ('2', 'sheppard pie');
select * from favorite_food;