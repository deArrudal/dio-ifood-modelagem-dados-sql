use manipulation;

-- select name_client, monthly_salary, monthly_salary*0.07 from bank_client;
select name_client, monthly_salary, monthly_salary*0.07 as taxes from bank_client;