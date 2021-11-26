
CREATE DATABASE parqueadero;
USE parqueadero;


CREATE TABLE tipoEmpleado(
idtipo_empleado INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
salario FLOAT NOT NULL,
PRIMARY KEY(idtipo_empleado)
);

CREATE TABLE tipo_Vehiculo(
idtipo_Vehiculo INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
tarifa FLOAT NOT NULL,
PRIMARY KEY(idtipo_Vehiculo)
);


CREATE TABLE lavado(
id_Lavado INT NOT NULL AUTO_INCREMENT,
precio FLOAT NOT NULL,
fecha DATE NOT NULL,
descuento FLOAT NULL, 
clientes_documento VARCHAR(15),
precioFinal INT,
PRIMARY KEY(id_Lavado)
);


create table puesto(
ocupado BOOLEAN NOT NULL,
numero INT NOT NULL AUTO_INCREMENT,
PlacaVehiculo VARCHAR(6) NULL,
tipoPuesto VARCHAR(15) NOT NULL,
PRIMARY KEY(numero)
);


CREATE TABLE casillero(
numero INT NOT NULL AUTO_INCREMENT,
ocupado BOOLEAN NOT NULL,
PRIMARY KEY(numero)
);


CREATE TABLE factura(
idFactura INT NOT NULL AUTO_INCREMENT,
idTicket INT NULL, 
IVA int NOT NULL,
precioTotal float NOT NULL,
hora DATETIME NOT NULL,
PRIMARY KEY(IDFactura)
);


CREATE TABLE empleado(
nombre VARCHAR(15) NOT NULL,
apellido VARCHAR(30) NOT NULL,
documento VARCHAR(15) NOT NULL,
telefono VARCHAR(10) NOT NULL,
fechaIngreso DATE NOT NULL,
PRIMARY KEY(documento),
idtipo_empleado INT NOT NULL
);

CREATE TABLE ticket(
idTicket INT NOT NULL AUTO_INCREMENT,
fecha DATE NOT NULL,
IDvehiculo VARCHAR(6) NULL,
IDcasillero INT NULL,
IDempleado VARCHAR(15) NOT NULL,
PRIMARY KEY(idTicket)
);

CREATE TABLE vehiculo(
horaEntrada DATETIME NOT NULL,
horaSalida DATETIME NULL,
placa VARCHAR(6) NOT NULL,
color VARCHAR(15) NOT NULL,
modelo VARCHAR(15) NULL,
idtipo_Vehiculo INT NOT NULL,
puestoAsignado INT UNIQUE NOT NULL, 
casilleroAsignado INT UNIQUE NOT NULL, 
PRIMARY KEY(placa)
);

CREATE TABLE clientes(
nombre VARCHAR(15),
apellido VARCHAR(30),
documento VARCHAR(15),
telefono VARCHAR(10),
vehiculo_placa VARCHAR(6),
HorasAcum INT NOT NULL,
PRIMARY KEY(documento)
);

CREATE TABLE RegistroVehiculo(
horaEntrada DATETIME NOT NULL,
horaSalida DATETIME NULL,
placa VARCHAR(6) NOT NULL,
color VARCHAR(15) NOT NULL,
modelo VARCHAR(15) NULL,
idtipo_Vehiculo INT NOT NULL,
puestoAsignado INT NOT NULL, 
casilleroAsignado INT NOT NULL,
IDfactura INT NOT NULL
);

# Foreign Keys -------------------------------------------------------- 
ALTER TABLE ticket 
ADD CONSTRAINT FK_ID_vehiculo FOREIGN KEY(IDvehiculo)
REFERENCES vehiculo(placa)
ON DELETE CASCADE ON UPDATE RESTRICT;  

ALTER TABLE ticket 
ADD CONSTRAINT FK_ID_casillero FOREIGN KEY(IDcasillero)
REFERENCES casillero(numero)
on delete restrict on update restrict;

ALTER TABLE ticket 
ADD CONSTRAINT FK_ID_empleado FOREIGN KEY(IDempleado)
REFERENCES empleado(documento)
on delete restrict on update restrict;

ALTER TABLE factura
ADD CONSTRAINT FK_factura_ticket FOREIGN KEY(idTicket)
REFERENCES ticket (idTicket)
on delete SET NULL on update restrict;


ALTER TABLE puesto
ADD CONSTRAINT FK_puesto_vehiculos FOREIGN KEY(PlacaVehiculo)
REFERENCES vehiculo (placa)
on delete SET NULL on update restrict;

ALTER TABLE lavado
ADD CONSTRAINT FK_lavado_cliente FOREIGN KEY(clientes_documento)
REFERENCES clientes (documento)
on delete restrict on update restrict;


ALTER TABLE empleado
ADD CONSTRAINT FK_empleado_tipo FOREIGN KEY(idtipo_empleado)
REFERENCES tipoEmpleado (idtipo_empleado)
on delete restrict on update restrict;


ALTER TABLE vehiculo
ADD CONSTRAINT FK_vehiculo_tipo FOREIGN KEY(idtipo_Vehiculo)
REFERENCES tipo_Vehiculo (idtipo_Vehiculo)
on delete restrict on update restrict;

# INSERTS -------------------------------------

INSERT INTO tipoEmpleado VALUES(1,'RECEPCIONISTA',1000000);
INSERT INTO tipoEmpleado VALUES(2,'VIGILANTE',828000);
INSERT INTO tipoEmpleado VALUES(3,'LAVANDERO',900000);
INSERT INTO tipoEmpleado VALUES(4,'VALET',600000);

INSERT INTO tipo_Vehiculo VALUES(1,'CARRO',2000);
INSERT INTO tipo_Vehiculo VALUES(2,'MOTO',800);

INSERT INTO empleado VALUES('JOSE','ESPARZA','1234876342','3224448872','2020-2-14',1);
INSERT INTO empleado VALUES('ANGEL','RAMIREZ','1002338461','3013676105','2016-8-15',2);
INSERT INTO empleado VALUES('PABLO','JEREZ','284930176','3119749990','2020-12-1',3);
INSERT INTO empleado VALUES('ANTONIO','ARGUELLO','5553287','3154420072','2019-1-20',4);

INSERT INTO casillero VALUES(1,0);
INSERT INTO casillero VALUES(2,0);
INSERT INTO casillero VALUES(3,0);
INSERT INTO casillero VALUES(4,0);
INSERT INTO casillero VALUES(5,0);
INSERT INTO casillero VALUES(6,0);
INSERT INTO casillero VALUES(7,0);
INSERT INTO casillero VALUES(8,0);
INSERT INTO casillero VALUES(9,0);
INSERT INTO casillero VALUES(10,0);
INSERT INTO casillero VALUES(11,0);
INSERT INTO casillero VALUES(12,0);
INSERT INTO casillero VALUES(13,0);
INSERT INTO casillero VALUES(14,0);
INSERT INTO casillero VALUES(15,0);
INSERT INTO casillero VALUES(16,0);
INSERT INTO casillero VALUES(17,0);
INSERT INTO casillero VALUES(18,0);
INSERT INTO casillero VALUES(19,0);
INSERT INTO casillero VALUES(20,0);



INSERT INTO puesto VALUES(0,1,NULL,'CARRO');
INSERT INTO puesto VALUES(0,2,NULL,'MOTO');
INSERT INTO puesto VALUES(0,3,NULL,'CARRO');
INSERT INTO puesto VALUES(0,4,NULL,'MOTO');
INSERT INTO puesto VALUES(0,5,NULL,'CARRO');
INSERT INTO puesto VALUES(0,6,NULL,'MOTO');
INSERT INTO puesto VALUES(0,7,NULL,'CARRO');
INSERT INTO puesto VALUES(0,8,NULL,'MOTO');
INSERT INTO puesto VALUES(0,9,NULL,'CARRO');
INSERT INTO puesto VALUES(0,10,NULL,'MOTO');
INSERT INTO puesto VALUES(0,11,NULL,'CARRO');
INSERT INTO puesto VALUES(0,12,NULL,'MOTO');
INSERT INTO puesto VALUES(0,13,NULL,'CARRO');
INSERT INTO puesto VALUES(0,14,NULL,'MOTO');
INSERT INTO puesto VALUES(0,15,NULL,'CARRO');
INSERT INTO puesto VALUES(0,16,NULL,'MOTO');
INSERT INTO puesto VALUES(0,17,NULL,'CARRO');
INSERT INTO puesto VALUES(0,18,NULL,'MOTO');
INSERT INTO puesto VALUES(0,19,NULL,'CARRO');
INSERT INTO puesto VALUES(0,20,NULL,'MOTO');



INSERT INTO clientes VALUES('Gabriel', 'Ordonez', '1004842192', '3013532971', 'XYW123', 0);
INSERT INTO clientes VALUES('Juan', 'Perez', '1005842399', '3013432673', 'KAW123', 0);
INSERT INTO clientes VALUES('Mario', 'Anaya', '1002342162', '3213531944', 'XKT128', 0);
INSERT INTO clientes VALUES('Anderson', 'Ramirez', '1104892392', '3913534971', 'AYA123', 0);
INSERT INTO clientes VALUES('Laura', 'Jaimes', '604841999', '3313932971', 'PGW953', 0);
INSERT INTO clientes VALUES('Andres', 'Jerez', '2003862498', '3003563771', 'ABC123', 0);
INSERT INTO clientes VALUES('Hans', 'Garcia', '112823192', '3153952971', 'GNR385', 0);

--- Funcion para calcular el precio total de un servicio 

delimiter $$
CREATE FUNCTION precioPagar(horaEntrada DATETIME, horaSalida DATETIME, tipoV INT) RETURNS FLOAT DETERMINISTIC  
BEGIN   
				DECLARE numH INT; 
 				DECLARE vlrP FLOAT; 
 				DECLARE IVA FLOAT DEFAULT 1.19; 
 				
 				if tipoV = 1 then 
 				SET numH = ROUND((TIMESTAMPDIFF(SECOND, horaEntrada, horaSalida))/3600) + 1;
 				SET vlrP = numH * 2000;
 				
 				ELSEIF tipoV = 2 then 
 				SET numH = ROUND((TIMESTAMPDIFF(SECOND, horaEntrada, horaSalida))/3600) + 1;
 				SET vlrP = numH * 800;
				END if; 
				
				RETURN vlrP * IVA;
END 
$$
delimiter ;


--- Funcion para calcular unicamente el IVA de nuestro recibo 

delimiter $$
CREATE FUNCTION IVAT(horaEntrada DATETIME, horaSalida DATETIME, tipoV INT) RETURNS FLOAT DETERMINISTIC  
BEGIN   
				DECLARE numH INT; 
 				DECLARE vlrP FLOAT; 
 				DECLARE IVA FLOAT DEFAULT 1.19; 
 				
 				if tipoV = 1 then 
 				SET numH = ROUND((TIMESTAMPDIFF(SECOND, horaEntrada, horaSalida))/3600) + 1;
 				SET vlrP = numH * 2000;
 				
 				ELSEIF tipoV = 2 then 
 				SET numH = ROUND((TIMESTAMPDIFF(SECOND, horaEntrada, horaSalida))/3600) + 1;
 				SET vlrP = numH * 800;
				END if; 
				
				RETURN (vlrP * IVA)-vlrP;
END 
$$
delimiter ;

--- Funcion para calcular la cantidad de horas acumuladas
delimiter $$
CREATE FUNCTION getcantHr(horaEntrada DATETIME, horaSalida DATETIME, cantidadHoras INT) RETURNS INT DETERMINISTIC  
BEGIN   
				DECLARE numHT INT; 
 				set numHT = ROUND((TIMESTAMPDIFF(SECOND, horaEntrada, horaSalida))/3600) + cantidadHoras;
				RETURN numHT;
END 
$$
delimiter ;

--- Funcion para calcular la cantidad de descuento 
delimiter $$
CREATE FUNCTION descu(documentoCliente VARCHAR(15)) RETURNS INT DETERMINISTIC  
BEGIN   
				DECLARE numHr INT; 
				DECLARE numC INT;
 				set numHr = (SELECT HorasAcum FROM clientes WHERE documentoCliente = documento);
 				if numHr >= 40 then 
 				SET numC = 40;
 				ELSEIF numHr < 40 then 
 				SET numC = numHr;
 				end if; 
 				UPDATE clientes SET HorasAcum = HorasAcum - numC WHERE documentoCliente = documento;
				RETURN numC * 500;
END 
$$
delimiter ;

--- Funcion para calcular el total del lavado
delimiter $$
CREATE FUNCTION preciofinal(descuento INT) RETURNS INT DETERMINISTIC  
BEGIN   
				DECLARE final INT;
				
				SET final = 20000 - descuento; 
				
				RETURN final;
END 
$$
delimiter ;

--- Funcion para calcular el precio final del lavado 
delimiter $$
CREATE FUNCTION precio(descuento INT) RETURNS INT DETERMINISTIC  
BEGIN   
				DECLARE Prec INT DEFAULT 20000; 
				
				SET Prec = Prec - descuento ; 
				
				RETURN Prec;
END 
$$
delimiter ;

--- Funcion para obtener el idTicket a la hora de generar la factura y el registro

delimiter $$
CREATE FUNCTION getidTicket(placaVeh VARCHAR(6)) RETURNS INT DETERMINISTIC  
BEGIN   
				DECLARE id INT; 
				
				SET id = (SELECT idTicket FROM ticket t WHERE IDvehiculo = placaVeh); 
				
				RETURN id;
END 
$$
delimiter ;

--- Funcion para obtener el idFactura a la hora de generar un registro

delimiter $$
CREATE FUNCTION getidFact(placaVeh VARCHAR(6)) RETURNS INT DETERMINISTIC  
BEGIN   
				DECLARE id INT; 
				
				SET id = (SELECT idFactura FROM factura f WHERE idTicket = getidTicket(placaVeh)); 
				
				RETURN id;
END 
$$
delimiter ;


--- Trigger para  generar un ticket, asignar un puesto y un casillero al ingreso de un vehiculo 

 delimiter $$ 
CREATE TRIGGER ingresoVehiculo AFTER INSERT ON vehiculo
FOR EACH ROW 
BEGIN 

UPDATE puesto SET ocupado = 1, PlacaVehiculo = NEW.placa WHERE numero = NEW.puestoAsignado;

UPDATE casillero SET ocupado = 1 WHERE numero = NEW.casilleroAsignado;

INSERT INTO ticket (fecha, IDvehiculo, IDcasillero, IDempleado) VALUES (CURDATE(), NEW.placa, NEW.casilleroAsignado, '1234876342');

END 
$$

delimiter ;




--- Trigger para llenar la tabla registroVehiculo, liberar el puesto, casillero, generar la factura y acumular horas.
 
  delimiter $$
CREATE TRIGGER elimVehiculo BEFORE DELETE ON vehiculo
FOR EACH ROW 
BEGIN 

INSERT INTO factura (idTicket, IVA, precioTotal, hora) 
VALUES (getidTicket(OLD.placa), 
            IVAT(OLD.horaEntrada,NOW(),OLD.idtipo_Vehiculo), 
            precioPagar(OLD.horaEntrada, NOW(), OLD.idtipo_Vehiculo),
            NOW());

UPDATE puesto SET ocupado = 0, PlacaVehiculo = NULL WHERE numero = OLD.puestoAsignado;
UPDATE casillero SET ocupado = 0 WHERE numero = OLD.casilleroAsignado;

if (select EXISTS(SELECT vehiculo_placa FROM clientes WHERE vehiculo_placa = OLD.placa)) = 1 then 

UPDATE clientes SET HorasAcum = getcantHr(OLD.horaEntrada,NOW(),HorasAcum);

END if; 

--
INSERT INTO RegistroVehiculo VALUES(OLD.horaEntrada, OLD.horaSalida, OLD.placa, OLD.color, OLD.modelo, 
                                                OLD.idtipo_Vehiculo, OLD.puestoAsignado, OLD.casilleroAsignado,getidFact(OLD.placa));

END 
$$
delimiter ;
