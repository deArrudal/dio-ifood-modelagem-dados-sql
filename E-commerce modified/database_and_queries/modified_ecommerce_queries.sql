# Exemplo de queries feitas com base no modelo de E-commerce.

# 1.Quais clientes realizaram um pedido?
select * from client_list c, order_list o where c.id_client = o.id_client_order_list;

# 2.Retorna clientes que realizaram um pedido e seu status de processamento.
select client_name, id_order as request, order_status as status
    from client_list c, order_list o where c.id_client = o.id_client_order_list;
    
# 3.Retorna o número de clientes que realizaram um pedido.
select count(*) from client_list inner join order_list on id_client = id_client_order_list;

# 4.Retorna informações de pedidos que possuam informações sobre os produtos.   
select * from client_list c
	inner join order_list o on c.id_client = o.id_client_order_list
    inner join relation_product_order p on p.id_product_relation_product_order = o.id_order;

# 5.Exibir detalhes de todos os pedidos.
select client_name, o.id_order as order_id, o.order_status, o.order_description, pd.product_name as productName,
    p.relation_product_order_quantity as quantity
	from client_list c inner join order_list o on c.id_client = o.id_client_order_list
	inner join relation_product_order p on p.id_product_relation_product_order = o.id_order
    inner join product_list pd on p.id_product_relation_product_order = pd.id_product;

# 6.Retorna cliente cujo pedido não possui detalhes sobre o produto.
select * from order_list inner join client_list on id_client_order_list = id_client;

select o.id_order, c.client_name 
	from client_list c inner join order_list o on c.id_client = o.id_client_order_list
		not in (select distinct o.id_order from relation_product_order po inner join order_list o on po.id_product_relation_product_order = o.id_order) 
			inner join client_list c2 on o.id_client_order_list = c2.id_client;

# 7.Exibir número de pedidos por cliente.
select  c.id_client, client_name, count(*) as num_orders 
	from client_list c inner join order_list o on o.id_client_order_list = c.id_client group by id_client order by client_name;

# 8.Exibir número de produtos em cada pedido.
select c.id_client as id_client, c.client_name, o.id_order as id_order, sum(relation_product_order_quantity) as product_quantity  
	from client_list c inner join order_list o on c.id_client = o.id_client_order_list 
		inner join relation_product_order po on po.id_product_relation_product_order = o.id_order
			group by o.id_order;
        
# 9.Exibe dados de cada pedido.
select id_order, client_name, payment_method, payment_status, payment_amount, shipping_status 
	from client_list c inner join order_list o on c.id_client = o.id_client_order_list
		inner join payment p on o.id_order = p.id_order_payment
			inner join shipping s on o.id_order = s.id_order_shipping; 

# 10.Exibe detalhes de clientes e seus respectivos produtos.
select id_client, client_name, id_order, order_status, order_description
	from order_list inner join client_list c on id_client_order_list = c.id_client;
 