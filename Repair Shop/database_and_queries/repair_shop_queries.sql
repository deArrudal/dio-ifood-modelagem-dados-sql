# Exemplos de queries feitas com base no modelo de Oficina.

# 1. Retorna lista de clientes com reparos concluídos.
select concat(client_last_name, ", ", client_first_name) as client_name, concat(car_maker, " ", car_model) as client_car    
    from client_list,  car_list where client_list.id_client = car_list.id_client_car_list and car_list.car_checkout is not null;
    
# 2. Retorna lista de funcionários que trabalharam em cada carro.
select concat(car_maker, " ", car_model) as client_car, concat(worker_last_name, ", ", worker_first_name) as worker_name
	from car_list inner join repair_list on car_list.id_car = repair_list.id_car_repair_list
		inner join worker_list on worker_list.id_worker = repair_list.id_worker_repair_list order by client_car;
        
# 3. Retorna lista de clientes cujo carro apresentou mais de um problema.
select concat(client_last_name, ", ", client_first_name) as client_name
	from client_list inner join car_list on client_list.id_client = car_list.id_client_car_list
		inner join repair_list on car_list.id_car = repair_list.id_car_repair_list
			group by id_car having count(id_car) > 1;
            
# 4. Retorna lista de reparos pagos.
select repair_description 
	from repair_list inner join car_list on car_list.id_car = repair_list.id_car_repair_list
		inner join client_list on client_list.id_client = car_list.id_client_car_list
			inner join payment on client_list.id_client = payment.id_client_payment and payment_status = 'Paid';
            
# 5. Retorna cor do carro de cada cliente.
select concat(client_last_name, ", ", client_first_name) as client_name, car_color
	from client_list, car_list where client_list.id_client = car_list.id_client_car_list;
				