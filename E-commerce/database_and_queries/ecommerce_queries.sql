# Exemplo de queries feitas com base no modelo de E-commerce.

# 1.Quais clientes realizaram um pedido?
select * from clients c, orders o where c.idClient = o.idOrderClient;

# 2.Retorna clientes que realizaram um pedido e seu status de processamento.
select concat(Fname, ' ', Lname) as client_name, idOrder as request, orderStatus as status
    from clients c, orders o where c.idClient = idOrderClient;
    
# 3.Retorna o número de clientes que realizaram um pedido.
select count(*) from clients inner join orders on idClient = idOrderClient;

# 4.Retorna informações de pedidos que possuam informações sobre os produtos.   
select * from clients c
	inner join orders o on c.idClient = o.idOrderClient
    inner join productOrder p on p.idProductOrderOrder = o.idOrder;

# 5.Exibir detalhes de todos os pedidos.
select concat(c.Fname, ' ', c.Lname) as client_name,
	o.idOrder as orderID,
    o.orderStatus,
    o.orderDescription,
    pd.pName as productName,
    p.productOrderQuantity as Quantity
	from clients c inner join orders o on c.idClient = o.idOrderClient
	inner join productOrder p on p.idProductOrderOrder = o.idOrder
    inner join product pd on p.idProductOrderProduct = pd.idProduct;

# 6.Retorna cliente cujo pedido não possui detalhes sobre o produto.
select * from orders inner join clients on idOrderClient = idClient;

select o.idOrder, concat(c2.FName, ' ', c2.LName) as Client_Name 
	from clients c inner join orders o on c.idClient = o.idOrderClient
		not in (select distinct o.idOrder from productOrder po inner join orders o on po.idProductOrderOrder = o.idOrder) 
			inner join clients c2 on o.idOrderClient = c2.idClient;

# 7.Exibir número de pedidos por cliente.
select  c.idClient, concat(c.Fname, ' ', c.Lname) as complete_name, count(*) as numOrders 
	from clients c inner join orders o on o.idOrderClient = c.idClient group by idClient order by complete_name;

# 8.Exibir número de produtos em cada pedido.
select c.idClient as idClient, concat(c.FName, ' ', c.LName) as complete_name, o.idOrder as idOrder, sum(productOrderQuantity) as product_quantity  
	from clients c inner join orders o on c.idClient = o.idOrderClient inner join productOrder po on po.idProductOrderOrder = o.idOrder
		group by o.idOrder;
        
# 9.Exibe clientes com mais de dois produtos no pedido.
select c.idClient as idClient, concat(c.FName, ' ', c.LName) as complete_name, sum(productOrderQuantity) as product_quantity
	from clients c inner join orders o on c.idClient = o.idOrderClient inner join productOrder po on po.idProductOrderOrder = o.idOrder
		group by c.idClient having sum(productOrderQuantity) > 2;

# 10.Exibe detalhes de clientes e seus respectivos produtos.
select idClient as client_id,
	concat(c.FName, ' ', c.LName) as complete_name, 
	idOrder,
    orderStatus as order_status,
    orderDescription as order_description,
    sendValue as shipping,
    paymentCash as payment
    from orders inner join clients c on idOrderClient = c.idClient;
 