-- Con comandos MySQL

create table Fabrica(
	Id_fabrica 	number primary key,
	Direccion 	varchar2(20),
	Comuna	varchar2(20),
	Telefono	number,
	Nombre		varchar2(20)				);
create table Producto(
	Id_prod		number primary key,
	Def_prod	varchar2(30),
	Precio		number					);
create table Cliente (
	Id_cliente 	number primary key,
	Nom_Cliente 	varchar2(20),
	Direccion	varchar2(20),
	Comuna	varchar2(15),
	Ciudad 		varchar2(15),
	Tel_Cliente 	number,
	Saldo		number,
	Lim_credito	number,
	Descuento	varchar2(20)				);
create table Pedido(
	Id_pedido	number,
	Fecha 		date,
	Id_Cliente	number,
	Id_prod 		number,
	Cantidad	number,
	constraint pkidped 	primary key (Id_pedido),
	constraint fkcli 		foreign key (Id_cliente) references Cliente(Id_cliente),
	constraint fkidpro 	foreign key (Id_prod) references Producto(Id_prod)	);
create table GuiaCompra(
	ID_guia 	number,
	Fecha 		date,
	Id_pedido	number,
	Id_fabrica 	number,
	constraint pkgcomp 	primary key (ID_guia),
	constraint fkped 	foreign key (Id_pedido) references Pedido(Id_pedido),
	constraint fkfab 	foreign key (Id_fabrica ) references Fabrica(Id_fabrica )	);
desc Fabrica;
desc Producto;
desc Cliente;
desc Pedido;
desc GuiaCompra;

-- Datos no reales ingresados
INSERT INTO Fabrica VALUES (10500,'AGAMOS 1320','BELLOTO',322517878,'COSEBET');
INSERT INTO Fabrica VALUES (10501,'TULIPAN 103','CONSTITUCION',541532899,'COSECON');

INSERT INTO Producto VALUES(10951,'CORTADORA DE PAN LICUATOR',10500);
INSERT INTO Producto VALUES(10952,'DEPORTIVO TERRENEITOR',26990);
INSERT INTO Producto VALUES(10953,'LICUADORA MULTICULTURAL PLOP',35950);
INSERT INTO Producto VALUES(10954,'SILLA 3 PATAS TABULE',9300);
INSERT INTO Producto VALUES(10955,'MESA 2 PATAS BLANQUEZ',16500);

INSERT INTO Cliente VALUES (15973452,'ANDRES','BARRANCA ABAJO 68','CASABLANCA','VALPARAISO',964647878,950000,1000000,'10%');
INSERT INTO Cliente VALUES (19584236,'MARIA','SOLAPA 125','QUINTERO','VALPARAISO',978545689,350000,1500000,'15%');
INSERT INTO Cliente VALUES (20596569,'VIANCA','COLTEPAL 1059','LINARES','MAULE',984849696,500000,1500000,'15%');

INSERT INTO Pedido VALUES (510,'10-JUL-2023',15973452,10952,8);
INSERT INTO Pedido VALUES (511,'10-JUL-2023',20596569,10954,3);

INSERT INTO GuiaCompra VALUES (4900,'11-JUL-2023',510,10500);
INSERT INTO GuiaCompra VALUES (4910,'11-JUL-2023',511,10501);

SELECT * FROM Fabrica;
SELECT * FROM Producto;
SELECT * FROM Cliente;
SELECT * FROM Pedido;
SELECT * FROM GuiaCompra;

-- Obtener el nombre de los clientes de la ciudad de Linares
SELECT Nom_Cliente FROM Cliente 
	WHERE Comuna = 'LINARES';

-- Obtener el nombre de todos los artículos solicitados por Andres
SELECT P.Def_prod FROM Producto P, Pedido B, Cliente C
	WHERE P.Id_prod = B.Id_prod AND B.Id_cliente = C.Id_cliente	AND C.Nom_Cliente = 'ANDRES';

--Obtener el ID cliente que han pedido una cantidad mayor a 5 unidades de productos
SELECT B.Id_cliente FROM Pedido B
	WHERE B.Cantidad > 5;