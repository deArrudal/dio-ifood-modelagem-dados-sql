-- set operators.
create database set_operators;
use set_operators;

create table set_a (
	a char(2)
);

create table set_b (
	a char(2)
);

insert into set_a values ('a1'), ('a2'), ('a2'), ('a3');
insert into set_b values ('a1'), ('a1'), ('a2'), ('a3'), ('a4'), ('a5');

select * from set_a;
select * from set_b;

select * from set_b where a not in (select a from set_a);

(select distinct set_a.a from set_a) union (select distinct set_b.a from set_b);
(select set_a.a from set_a) union (select set_b.a from set_b); 

select set_a.a from set_a where set_a.a in (select set_b.a from set_b);