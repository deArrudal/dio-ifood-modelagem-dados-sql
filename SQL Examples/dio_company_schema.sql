#drop database company;
create schema if not exists company;
use company; # set active database.

# create a table without using the use company command.
create table company.employee(
	first_name varchar(15) not null,
    middle_initial char,
    last_name varchar(15) not null,
    ssn char(9) not null,
    birthday_date date,
    address varchar(30),
    sex char,
    salary decimal(10, 2),
    super_ssn char(9),
    dept_number int not null,
    constraint chk_salary_employee check (salary > 2000.0),
    constraint pk_employee primary key (ssn)
);

# create a table 
create table department (
	dept_name varchar(15) not null,
    dept_number int not null,
    dept_start_date date,
    manager_ssn char(9),
    manager_start_date date,
    constraint chk_date_dept check (dept_start_date < manager_start_date),
    constraint pk_department primary key (dept_number),
    constraint unique_name_dept unique (dept_name),
    constraint fk_deparment foreign key (manager_ssn) references employee(ssn)
);

create table dept_locations (
	dept_number int not null,
    dept_location varchar(15) not null,
    constraint pk_dept_locations primary key (dept_number, dept_location),
    constraint fk_dept_locations foreign key (dept_number) references department(dept_number)
);

create table project (
	project_name varchar(15) not null,
    project_number int not null,
    project_location varchar(15),
    dept_number int not null,
    constraint pk_project primary key (project_number),
    constraint unique_project unique (project_name),
    constraint fk_project foreign key (dept_number) references department(dept_number)
);

create table works_on (
	employee_ssn char(9) not null,
    project_number int not null,
    hours decimal(3, 1) not null,
    constraint pk_works_on primary key (employee_ssn, project_number),
    constraint fk_works_on_employee foreign key (employee_ssn) references employee(ssn),
    constraint fk_works_on_project foreign key (project_number) references project(project_number)
);

create table dependent (
	employee_ssn char(9) not null,
    dependent_name varchar(15) not null,
    sex char, # 'F' or 'M'
    birthday_date date,
    relationship varchar(8),
    constraint pk_dependent primary key (employee_ssn, dependent_name),
    constraint fk_dependent foreign key (employee_ssn) references employee(ssn)
);

show tables;
select * from information_schema.table_constraints where constraint_schema = 'company';

# show how to alter a table.
-- alter table department drop constraint #name;
--		add constraint #new_name foreign key(manager_ssn) references employee(ssn);
--		on update cascade;