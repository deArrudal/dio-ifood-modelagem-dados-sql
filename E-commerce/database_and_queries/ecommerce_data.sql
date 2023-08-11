# Insercao de dados para o banco de dados E-commerce.
use ecommerce;

# Dados cliente: idClient, Fname, Minit, Lname, CPF, Address.
insert into Clients(Fname, Minit, Lname, CPF, Address) values
	('maria', 'm', 'silva', 12346789, 'rua silva de prata, 29, carangola - cidade das flores'),
	('matheus', 'o', 'pimentel', 987654321, 'rua alemeda 289, centro - cidade das flores'),
    ('ricardo', 'f', 'silva', 45678913, 'avenida alemeda vinha 1009, centro - cidade das flores'),
    ('julia', 's', 'franca', 789123465, 'rua laranjeiras 861, centro - cidade das flores'),
    ('roberta', 'g', 'assis', 987453176, 'avenidade koller 19, centro - cidade das flores'),
    ('isabela', 'm', 'cruz', 987346711, 'rua alameda das flores 28, centro - cidade das flores');
          
# Dados produto: idProduct, Pname, classification_kids, category, evaluation, size.
insert into product (Pname, classification_kids, category, evaluation, size) values
	('fone de ouvido', false, 'eletrônico', '4', null),
	('barbie elsa', true, 'brinquedos', '3', null),
    ('body carters', true, 'vestimenta', '5', null),
    ('microfone vedo', false, 'eletrônico', '4', null),
    ('sofa retratil', false, 'móveis', '3', '3x57x80'),
    ('farinha de arroz', false, 'alimentos', '2', null),
    ('fire stick amazon', false, 'eletrônico', '3', null);

# Dados pedido: idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash.
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
	(1, default, 'compra via aplicativo', null, 1),
    (2, default, 'compra via aplicativo', 50, 0),
    (3, 'confirmado', null, null, 1),
    (4, default, 'compra via web site', 150, 0);

# Dados relacionamento produto/pedido: idProductOrderProduct, idProductOrderOrder, productOrderQuantity, productOrderStatus.
insert into productOrder (idProductOrderProduct,idProductOrderOrder,productOrderQuantity,productOrderStatus) values
	(1, 1, 2, null),
	(2, 4, 1, null),
    (3, 3, 1, null);

# Adicionando produto a um pedido existente.
insert into productOrder (idProductOrderProduct, idProductOrderOrder, productOrderQuantity, productOrderStatus) values
	(4, 1, 1, null);

# Dados estoque: idProdStorage, location, quantity.
insert into productStorage (location,quantity) values
	('rio de janeiro', 1000),
	('rio de janeiro', 500),
	('são paulo', 10),
	('são paulo', 100),
	('são paulo', 10),
	('brasília', 60);

# Dados relacionamento produto/estoque: idLocationProduct, idLocationStorage, location.
insert into storageLocation (idLocationProduct,idLocationStorage,location) values 
	(1, 2, 'RJ'),
	(2, 6, 'GO');

# Dados fornecedor: idSupplier, SocialName, CNPJ, contact.
insert into supplier (SocialName, CNPJ, contact) values 
	('almeida e filhos', 123456789012345, '21985474'),
	('eletrônicos silva', 897654398088765, '21985484'),
    ('eletrônicos velma', 879887609826675, '21975474');

# Dados relacionamento produto/fornecedor: idProductSupplier, idProductProduct, quantity.
insert into productSupplier (idProductSupplier, idProductProduct, quantity) values 
	(1, 1, 500),
	(1, 2, 400),
    (2, 4, 633),
    (3, 3, 5),
    (2, 5, 10);
           
# Dados vendedor: idSeller, SocialName, AbstName, CNPJ, CPF, location, contact.
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
	('tech eletronics', null, 128799087678799, null, 'rio de janeiro', 219946287),
	('botique Durgas', null, null, 123456789, 'rio de janeiro', 98788769018),
    ('kids world', null, 676577100907632, null, 'são paulo', 78788739205);

# Dados relacionamento produto/vendedor: idProductSeller, idProductProduct, productQuantity.
insert into productSeller (idProductSeller,idProductProduct,productQuantity) values
	(1, 6, 80),
	(2, 7, 10);