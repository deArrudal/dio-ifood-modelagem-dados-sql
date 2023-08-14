# Inserção de dados para o banco de dados da Oficina.
use repairshop;

# Dados cliente: id_client, client_first_name, client_last_name, client_id_type, client_id_number, client_contact.
insert into client_list (client_first_name, client_last_name, client_id_type, client_id_number, client_contact) values
	('Luke', 'Johnson', default, '34675368904', '01135674588'),
    ('John', 'Smith', 'CNPJ', '243653168564268', '01136759483'),
	('Rita', 'M. Socorro', 'CPF', '43215468803', '01137659435'),
    ('Carmem', 'Lopez', default, '45743927907', '01125439652');
-- select * from client_list;
    
# Dados pagamento: id_payment, id_client_payment, payment_status, payment_method, payment_amount, payment_date.
insert into payment (id_client_payment, payment_status, payment_method, payment_amount, payment_date) values
	(1, default, default, default, default),
	(3, 'Paid', 'Card', 127.00, '2023-07-17'),
	(4, default, default, default, default),
	(2, 'Paid', 'Cash', 68.75, '2023-08-10');
-- select * from payment;

# Dados carros: id_car, id_client_car_list, car_plate_number, car_maker, car_model, car_color, car_checkin, car_checkout.
insert into car_list (id_client_car_list, car_plate_number, car_maker, car_model, car_color, car_checkin, car_checkout) values
(1, 'ABC0123', 'Renault', 'Kwid', 'Gray', '2023-08-10', default),
(2, 'BEE4R22', 'Volkswagen', 'Saveiro', 'Black', '2023-08-02', '2023-08-11'),
(3, 'BRAOS17', 'Fiat', 'Uno', 'Yellow', '2023-07-08', '2023-07-17'),
(3, 'BRA49CC', 'Ford', 'Fiesta', 'White', '2023-07-08', '2023-07-18'),
(4, 'RIO2A18', 'Honda', 'Fit', 'Black', '2023-08-05', default);
-- select * from car_list;

# Dados funcionários: id_worker, worker_first_name, worker_last_name, worker_fare, worker_contact, worker_skill.
insert into worker_list (worker_first_name, worker_last_name, worker_fare, worker_contact, worker_skill) values
('Pedro', 'da Silva', 13.00, '01128769456', 'engine, hydraulics'),
('Miguel', 'de la Cruz', default, '01135469733', 'body shop');
-- select * from worker_list;

# Dados reparos: id_repair, id_car_repair_list, id_worker_repair_list, repair_status, repair_description.
insert into repair_list (id_car_repair_list, id_worker_repair_list, repair_status, repair_description) values
(1, 1, default, 'Vazamento de Óleo'),
(1, 2, default, 'Porta Amassada'),
(2, 2, 'Complete', 'Pintura'),
(3, 2, 'Complete', 'Matelinho de Ouro'),
(5, 1, default, 'Troca de Velas'),
(4, 1, 'Complete', 'Bico injetor');
-- select * from repair_list;