-- BD realizada con comandos MySQL
CREATE TABLE ciudad
	(codigo number(6) primary key, nomciudad varchar2(30));
CREATE TABLE conductor
	(rut varchar2(10) primary key,nombre varchar2(50), fono varchar2(15), direc varchar2(50),comuna varchar2(50), salario number(8,2));
CREATE TABLE camion
	(patente varchar2(6) primary key, modelo varchar2(20),tipo varchar2(20),potencia number(4));
CREATE TABLE paquete
	(numero number(6), descrip varchar2(50),destin varchar2(50),dirdestin varchar2(50), rut_cond varchar2(10),codigo_dest number(6),
	CONSTRAINT pknum primary key(numero),
        CONSTRAINT fkrut FOREIGN KEY(rut_cond) REFERENCES conductor(rut),
        CONSTRAINT fkcod FOREIGN KEY(codigo_dest) REFERENCES ciudad(codigo));
CREATE TABLE ruta
	(fecha varchar2(10),hora varchar2(5),patente varchar2(6),rut varchar2(10),
        CONSTRAINT fkrt FOREIGN KEY(rut) REFERENCES conductor(rut),
        CONSTRAINT fkpat FOREIGN KEY(patente) REFERENCES camion(patente));
DESC paquete;
DESC ciudad;
DESC conductor;
DESC camion;
DESC ruta;

-- Datos no reales ingresados
INSERT INTO Ciudad VALUES (251300,'SUCURSAL BELLOTO');
INSERT INTO Ciudad VALUES (272400,'SUCURSAL CASABLANCA');
INSERT INTO Ciudad VALUES (275100,'SUCURSAL TALCA');
INSERT INTO Ciudad VALUES (280800,'SUCURSAL TEMUCO');
INSERT INTO Ciudad VALUES (185200,'SUCURSAL CABILDO');

INSERT INTO Conductor VALUES(18752463,'Manuel Perez','945458723','Angamos 1520','Villa Alemana',980200);
INSERT INTO Conductor VALUES(14256895,'Diego Gonzalez','945256895','Petunias 620','Casablanca',1050950);
INSERT INTO Conductor VALUES(13568993,'Mario Hugo Tais','978458569','Calbuco 312','Talca',1152300);
INSERT INTO Conductor VALUES(15245869,'Humberto Vargas','952635698','Terramar 252','Portales',1462500);
INSERT INTO Conductor VALUES(21356984,'Dyan Leyton','945287596','Tucson 754','Cabildo',952000);

INSERT INTO Camion VALUES (TSHX45,'BMW','CAMION',740);
INSERT INTO Camion VALUES (SHYX78,'VOLVO','CAMION',840);
INSERT INTO Camion VALUES (PQTR55,'SHAM','CAMION',820);
INSERT INTO Camion VALUES (TTFF84,'VOLVO','CAMION',720);
INSERT INTO Camion VALUES (PRSS56,'BMW','CAMION',740);

INSERT INTO Paquete VALUES (154890, 'Encomienda 150 KG', 'Padre Las Casas', 'Tuca Tuca 45236',13568993,280800);
INSERT INTO Paquete VALUES (256300, 'Encomienda 35 Litros', 'Quilpue', 'Imperiales 4523',14256895,251300);
INSERT INTO Paquete VALUES (254800, 'Pallet 3 m3', 'La Ligua', 'Av a la Costa 7850',21356984,185200);
INSERT INTO Paquete VALUES (361200, 'Paquete Frágil', 'Santiago', 'Calle 12 Poniente 123', 14256895, 251300);
INSERT INTO Paquete VALUES (752100, 'Insumos Urgentes', 'Valparaíso', 'Avenida Costanera 567', 18752463, 272400);
INSERT INTO Paquete VALUES (489600, 'Artículos Electrónicos', 'Concepción', 'Av. Los Pinos 789', 13568993, 275100);
INSERT INTO Paquete VALUES (623400, 'Productos Perecibles', 'Rancagua', 'Calle de la Fruta 456', 15245869, 280800);
INSERT INTO Paquete VALUES (962500, 'Encomienda 200 KG', 'Temuco', 'Ruta 5 Sur 654', 21356984, 185200);
INSERT INTO Paquete VALUES (587400, 'Equipamiento Industrial', 'Antofagasta', 'Industrial 123', 14256895, 251300);
INSERT INTO Paquete VALUES (364800, 'Articulos varios', 'Arica', 'Avenida Palmeras 987', 13568993, 275100);
INSERT INTO Paquete VALUES (712600, 'Artículos de Oficina', 'Iquique', 'Oficina Central 456', 15245869, 280800);
INSERT INTO Paquete VALUES (945300, 'Paquete Especial', 'Copiapó', 'Calle del Oro 987', 21356984, 185200);

INSERT INTO Ruta VALUES ('11-JUL-2023', '09:20', 'PQTR55', 13568993);
INSERT INTO Ruta VALUES ('10-JUL-2023', '11:35', 'PRSS56', 14256895);
INSERT INTO Ruta VALUES ('13-JUL-2023', '07:20', 'TSHX45', 21356984);
INSERT INTO Ruta VALUES ('15-JUL-2023', '14:45', 'TSHX45', 14256895);
INSERT INTO Ruta VALUES ('14-JUL-2023', '10:30', 'SHYX78', 18752463);
INSERT INTO Ruta VALUES ('16-JUL-2023', '08:15', 'PQTR55', 13568993);
INSERT INTO Ruta VALUES ('12-JUL-2023', '12:20', 'TTFF84', 15245869);
INSERT INTO Ruta VALUES ('17-JUL-2023', '09:55', 'PRSS56', 21356984);
INSERT INTO Ruta VALUES ('18-JUL-2023', '16:10', 'TSHX45', 14256895);
INSERT INTO Ruta VALUES ('19-JUL-2023', '07:30', 'SHYX78', 18752463);
INSERT INTO Ruta VALUES ('20-JUL-2023', '11:45', 'PQTR55', 13568993);
INSERT INTO Ruta VALUES ('21-JUL-2023', '13:25', 'TTFF84', 15245869);
INSERT INTO Ruta VALUES ('22-JUL-2023', '14:15', 'PRSS56', 21356984);

SELECT * FROM Ciudad;
SELECT * FROM Conductor;
SELECT * FROM Camion;
SELECT * FROM Paquete;
SELECT * FROM Ruta;

-- Obtener el nombre de los conductores de la ciudad de Talca
SELECT nombre FROM Conductor 
	WHERE Comuna = 'Talca';
-- Obtener el destino de paquete transportado por Dyan
SELECT p.destin FROM paquete p
	INNER JOIN conductor c ON p.rut_cond = c.rut
	WHERE c.nombre = "Dyan Leyton";	
--Obtener el codigo del paquete transportado en la ruta del 13 de Julio
SELECT r.patente, r.rut, p.numero FROM ruta r
	INNER JOIN paquete p ON r.rut = p.rut_cond
	WHERE r.fecha = '13-JUL-2023';
