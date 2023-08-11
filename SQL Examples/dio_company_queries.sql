use company;

select ssn, first_name, dept_name from employee e, department d where (e.ssn = d.manager_ssn);

select last_name, dependent_name, relationship from employee, dependent where employee_ssn = ssn;

select birthday_date, address from employee where first_name = 'john' and last_name = 'smith';

select * from department where dept_name = 'research';

select first_name, last_name, address from employee, department where dept_name = 'research' and employee.dept_number = department.dept_number;

select project.project_number, employee_ssn, first_name, hours from project, works_on, employee where project.project_number = works_on.project_number
	and employee_ssn = ssn;
    
# Queries with alias.
select * from department, dept_locations where department.dept_number = dept_locations.dept_number;
select dept_name, lcl.dept_location from department as dept, dept_locations as lcl where dept.dept_number = lcl.dept_number;

# Concatenation.
select concat(last_name, ', ', first_name) as employee from employee;