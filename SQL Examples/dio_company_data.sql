use company;

insert into employee values 
	('john', 'b', 'smith', 123456789, '1965-01-09', '731-fondren-houston-tx', 'M', 30000, null, 5),    
    ('franklin', 't', 'wong', 333444555, '1955-12-08', '638-voss-houston-tx', 'M', 40000, 123456789, 5),
    ('alicia', 'j', 'zelaya', 999888777, '1968-01-19', '3321-castle-spring-tx', 'F', 25000, 333444555, 4),
    ('jennifer', 's', 'wallace', 987654321, '1941-06-20', '291-berry-bellaire-tx', 'F', 43000, null, 4);
select * from employee;

insert into dependent values
	(333444555, 'alice', 'F', '1986-04-05', 'daughter'),
	(333444555, 'theodore', 'M', '1983-10-25', 'son'),
	(333444555, 'joy', 'F', '1958-05-03', 'spouse'),
	(987654321, 'abner', 'M', '1942-02-28', 'spouse'),
	(123456789, 'michael', 'M', '1988-01-04', 'son'),
	(123456789, 'alice', 'F', '1988-12-30', 'daughter'),
	(123456789, 'elizabeth', 'F', '1967-05-05', 'spouse');
select * from dependent;

insert into department values
	('research', 5, '1986-05-22', 333444555, '1988-05-22'),
	('administration', 4, '1994-01-01', 987654321, '1995-01-01');
select * from department;

insert into dept_locations values
	(5, 'sugarland'),
    (5, 'houston'),
    (5, 'bellaire'),
	(4, 'stafford');
select * from dept_locations;

insert into project values
	('productx', 1, 'bellaire', 5),
    ('producty', 2, 'sugarland', 5),
    ('productz', 3, 'houston', 5),
    ('computerization', 4, 'stafford', 4),
    ('newbenefits', 5, 'stafford', 4);
select * from project;

insert into works_on values
	(123456789, 1, 32.5),
    (123456789, 2, 7.5),
    (333444555, 2, 10.0),
	(333444555, 3, 10.0),
	(333444555, 4, 10.0),
	(333444555, 5, 10.0),
    (999888777, 4, 10.0),
    (999888777, 5, 30.0),
    (987654321, 4, 20.0),
    (987654321, 5, 15.0);
select * from works_on;