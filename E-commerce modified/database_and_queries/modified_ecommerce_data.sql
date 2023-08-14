# Insercao de dados para o banco de dados E-commerce.
use ecommerce;

# Dados cliente: id_client, client_name, client_cpf, client_cnpj, client_address, client_contact.
insert into client_list (client_name, client_cpf, client_cnpj, client_address, client_contact) values
	('maria m silva', 12346789, null, 'rua silva de prata, 29, carangola - cidade das flores', '01129463566'),
	('matheus o pimentel', 987654321, null, 'rua alemeda 289, centro - cidade das flores', '02136753576'),
    ('ricardo f silva', 45678913, null, 'avenida alemeda vinha 1009, centro - cidade das flores', '01794756844'),
    ('julia s franca', 789123465, null, 'rua laranjeiras 861, centro - cidade das flores', '02137584925');
    
-- select * from client_list;

# Dados pedido: id_order, id_client_order_list, order_status, order_description.
insert into order_list (id_client_order_list, order_status, order_description) values
	(1, default, 'via site'),
    (2, default, 'via telephone'),
    (3, 'complete', null),
    (4, default, 'via app');
    
-- select * from order_list;
    
# Dados pagamento: id_payment, id_order_payment, payment_method, payment_amount.
insert into payment (id_order_payment, payment_status, payment_method, payment_amount) values
	(1, 'complete', 'card', 15.00),
    (2, 'pending', 'transfer', 635.00),
    (3, default, default, 4.50),
    (4, 'complete', 'transfer', 125.99);
    
-- select * from payment;
    
# Dados shipping: id_shipping, id_order_shipping, shipping_status.
insert into shipping (id_order_shipping, shipping_status) values
	(1, 'delivered'),
    (2, 'pending'),
    (3, default),
    (4, 'pending');

-- select * from shipping;

# Dados produto: id_product, product_name, product_category, product_rating.
insert into product_list (product_name, product_category, product_rating) values
	('earbuds', 'eletronic', '4'),
    ('sofa', 'furniture', '3'),
    ('rice', 'food', default),
    ('fire stick amazon', 'eletronic', '3');
    
-- select * from product_list;
    
# Dados estoque: id_storage, storage_location, storage_quantity.
insert into storage_list (storage_location, storage_quantity) values
	('rio de janeiro', 200),
	('são paulo', 5),
	('são paulo', 60),
	('brasília', 10);
    
-- select * from storage_list;
    
# Dados fornecedor: id_supplier, supplier_company_name, supplier_trade_name, supplier_cnpj, supplier_address, supplier_contact.
insert into supplier_list (supplier_company_name, supplier_trade_name, supplier_cnpj, supplier_address, supplier_contact) values 
	('almeida une corpo', 'almeida une corpo', '123456789012345', 'rua silva de prata, 29, carangola - cidade das flores', '01121985474'),
	('eletrônicos silva', 'eletrônicos silva', '897654398088765', 'rua alemeda 289, centro - cidade das flores', '02121985484'),
    ('eletrônicos velma', 'eletrônicos velma', '879887609826675', 'avenida alemeda vinha 1009, centro - cidade das flores', '03521975474');
    
-- select * from supplier_list;

# Dados vendedor: id_seller, seller_trade_name, seller_name, seller_cpf, seller_cnpj, seller_address, seller_contact.
insert into seller_list (seller_trade_name, seller_name, seller_cpf, seller_cnpj, seller_address, seller_contact) values
	('tech eletronics', 'luigi j gomez', null, '128799087678799', 'rio de janeiro', '02121994628'),
	('botique Durgas', 'maria m peixoto', null, '123456789467543', 'rio de janeiro', '01588769018'),
    ('kids world', 'lucia j flores', '67657710090', null, 'são paulo', '01188739205');
    
-- select * from seller_list;

# Dados relacionamento produto/pedido: id_order_relation_product_order, id_product_relation_product_order, 
	-- relation_product_order_status, relation_product_order_quantity. 
insert into relation_product_order (id_order_relation_product_order, id_product_relation_product_order, relation_product_order_status,
	relation_product_order_quantity) values
	(1, 1, default, 1),
	(2, 4, 'complete', 1),
    (3, 3, 'processing', 3),
    (4, 2, 'complete', 2);

-- select * from relation_product_order;

# Dados relacionamento produto/vendedor: id_seller_relation_product_seller, id_product_relation_product_seller, relation_product_seller_quantity.
insert into relation_product_seller (id_seller_relation_product_seller, id_product_relation_product_seller, relation_product_seller_quantity) values
	(1, 1, 10),
	(3, 3, 50),
    (1, 2, 5),
	(2, 4, 20);
    
-- select * from relation_product_seller;

# Dados relacionamento produto/estoque: id_storage_relation_product_storage, id_product_relation_product_storage, 
	-- relation_product_storage_location, relation_product_storage_quantity.
insert into relation_product_storage (id_storage_relation_product_storage, id_product_relation_product_storage,
	relation_product_storage_location, relation_product_storage_quantity) values 
	(1, 1, 'RJ', 10),
	(2, 2, 'SP', 10),
	(3, 3, 'SP', 10),
	(4, 4, 'DF', 10);
    
-- select * from relation_product_storage;

# Dados relacionamento produto/fornecedor: id_supplier_relation_product_supplier, id_product_relation_product_supplier,
	-- relation_product_supplier_quantity.
insert into relation_product_supplier (id_supplier_relation_product_supplier, id_product_relation_product_supplier,
	relation_product_supplier_quantity) values 
	(1, 1, 10),
	(1, 2, 4),
    (2, 4, 17),
    (3, 3, 22);
    
-- select * from relation_product_supplier;

