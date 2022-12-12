diagrama_bd-tp6-eje1

-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades
-- (id,nombre, cp,id_provincia). Tener en cuenta que:
-- ●En un país hay muchas provincias.
-- ●En una provincia hay muchas localidades.
use elsistema;
CREATE TABLE pais (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
id_pais INT UNSIGNED NOT NULL,
FOREIGN KEY (id_pais) REFERENCES pais(id)
);
CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
cp VARCHAR(30) NOT NULL,
id_provincias INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provincias) REFERENCES provincias(id)
);
-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
-- ●direccion (varchar)
-- ●id_localidad (pk localidad) –Esta es un relación con la tabla localidades
-- ●email
-- ●telefono
-- ●fecha_ingreso
-- ●tms (timestamp)
ALTER TABLE empleados 
ADD dirección VARCHAR (80),
ADD email VARCHAR (80),
ADD telefono VARCHAR (80),
ADD tms TIMESTAMP,
ADD id_localidades INT UNSIGNED NOT NULL,
ADD FOREIGN KEY (id_localidades) REFERENCES localidades(id)
ADD fecha_ingresso DATETIME 
;
-- modifique porque no agregue not null.
ALTER TABLE empleados
MODIFY COLUMN dirección VARCHAR (80) NOT NULL,
MODIFY COLUMN email VARCHAR (45) NOT NULL,
MODIFY COLUMN telefono VARCHAR (45) NOT NULL,
MODIFY COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;
-- 3. Modificar la tabla de departamentos  usando ALTER TABLE y agregar los campos:
-- ●gasto (double)
-- ●tms (timestamp)
ALTER TABLE departamentos
ADD gasto DOUBLE,
ADD COLUMN tms TIMESTAMP
;
-- modifique porque no agregue not null.
ALTER TABLE departamentos
MODIFY COLUMN gasto DOUBLE NOT NULL,
MODIFY COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;
-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.
INSERT INTO pais  VALUES ( "01", "Argentina"), ("02", "Brasil"), ("03","España"),("04", "Chile"), ("05","China");
INSERT INTO provincias VALUES ("01", "Misiones", "01"), ("02", "Salta", "01"),("03", "Entre Rios", "01"),("04", "Formosa", "01"),("05", "Chubut", "01");
INSERT INTO localidades VALUES ("01", "San Pedro", "3352", "01"), ("02","Oran", "4530", "02"), ("03", "Federacion", "3206", "03"),("04", "Formosa", "3600", "04"),
("05", "Puerto Madryn", "9120", "05");
INSERT INTO departamentos VALUES ("01", "Contabilidad","300.000","1","100.000","2020-04-04"), ("02", "Direccion", "600.000","1","50.000", "2021-05-08"),
("03", "Recursos Humanos","100.000","1", "80.000","2021-06-09"), ("04","Ventas","100.000","1","50.000","2022-10-10"), ("05","Produccion","500.000","1","300.000","2022-11-10");
INSERT INTO empleados VALUES ("01","27-29.873.533-9","Carolina","Rodrigez", "02","1", "Felix Bogado","caro@gmail.com","3764268898","2020-11-11","01", "2021-03-04"),
("02","27-28484091-7","Pedro", "Mendez","01","1","Jaureche 800", "pepe@gmail.com", "3764265398", "2020-11-22", "03","2021-03-04"),
("03","27-17007605-9","Mirta","Flores","04","1", "Comandante Andresito", "mirta@gmail.com","3764436516", "2021-04-03", "04","2021-03-04"),
("04", "27-10091303-7", "Cesar", "Castillo", "03","1","Vuelta de obligado", "castillo@gmail.com","3878266295", "2021-04-03","02","2021-03-04"),
("05","27-29090887-9","Clotilde","Martines", "05", "1", "San Martin", "martines@gmail.com", "3872676567", "2020-12-10","05","2021-03-04");
--5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
RENAME TABLE  pedidos TO movimientos;
-- 6. Agregar las entidades:
-- ●Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- ●Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- ●Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica),cuit,id_localidad fk, estado,tms)
-- ●Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
-- Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.Un proveedor está en una localidad.

CREATE TABLE proveedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR (80) NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellidos VARCHAR (30) NOT NULL,
naturaleza VARCHAR (80) NOT NULL,
cuit VARCHAR (40),
id_localidad INT UNSIGNED NOT NULL,
FOREIGN KEY (id_localidad) REFERENCES localidades(id),
estado ENUM ("A","B"),
tms TIMESTAMP
);

CREATE TABLE marcas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripción VARCHAR(30) NOT NULL,
id_provedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provedor) REFERENCES proveedores(id),
estado ENUM ("A","B"),
tms TIMESTAMP
);

CREATE TABLE productos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripción VARCHAR(30) NOT NULL,
id_marcas INT UNSIGNED NOT NULL,
FOREIGN KEY (id_marcas) REFERENCES marcas(id),
stock VARCHAR (30),
precio INT,
estado ENUM ("A","B"),
tms TIMESTAMP
);

CREATE TABLE cajas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
horainicio datetime not null,
horacierre datetime NOT NULL,
estado ENUM ("A","B"),
tms TIMESTAMP
);
-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.

INSERT INTO cajas VALUE ("01", "20-08-10", "20-08-10","A", "20-06-07"),("02", "20-08-09", "20-08-09", "A", "20-08-07"),
("03", "20-12-09", "20-12-12", "A", "20-08-09"),("04", "20-11-09", "20-11-11","A", "20-09-10"),("05", "20-12-09", "20-12-09","A", "20-12-07"); 

INSERT INTO proveedores VALUES ("01","Nestle Argentina S.A.", "NESTLE", "X", "JURIDICA", "30-54676404-0", "04", "A", "20-03-03"),
("02","ARCOR SAIC", "ARCOR", "-", "JURIDICA", "30-50279317-5", "02", "A", "20-03-03 11:59:00"),
("03","Grupo Aguas DANONE", "DANONE", "-", "jURIDICA", "30-51705022-5", "04", "A", "20-04-10 08:29:00"),
("04","PEPSICO de Argentina S.R.L.A", "PEPSICO", "-", "jURIDICA", "30-53764771-6", "03", "A", "21-02-05 08:00:00"),
("05","COCA-COLA Femsa de BS.AS.", "COCA-COLA COMPANY", "-", "jURIDICA", "30-52539008-6", "03", "A", "21-05-12 09:15:00");

INSERT INTO marcas VALUES ("01", "GATORADE", "Bebida", "04", "A", "21-08-09 10:34:00"),
("02", "DORITOS", "Alimentos",  "04", "A", "21-07-10 09:21:00"),
("03", "LAYS", "Alimentos",  "04", "A", "21-07-10 11:34:00"),
("04", "PEHUAMAR", "Alimentos","04", "A", "21-08-09 12:00:00"),
("05", "FANTA", "Bebida", "05", "A", "21-09-10 08:34:00");

INSERT INTO productos VALUES ("01", "Gaseosa", "Bebida saborizada con gas", "05", "67","600", "A", "21-09-10 08:34:00"),
("02", "Aperitivo", "Alimento a base de maiz", "02", "12","450", "A", "21-07-10 09:21:00"),
("03", "Papas fritas", "Alimento a base de papas", "03", "127","369", "A", "21-07-10 09:31:00"),
("04", "Papas fritas", "Alimento a base de papas", "04", "21","426", "A", "21-07-10 09:33:00"),
("05", "Bebida", "bebida saborizada sin gas", "01", "456","160", "A", "21-08-03 08:01:00");

-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.

SELECT nombre,presupuesto, gasto, presupuesto-(gasto) AS "presupuesto actual" FROM departamentos WHERE estado=1;

-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad

SELECT localidades.nombre ,pais.nombre FROM localidades 
INNER JOIN provincias ON provincias.id = id_provincias INNER JOIN pais ON pais.id = id_pais;

-- 10. Modificar (UPADTE):
-- ●el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- ●el fecha_ingreso y la localidad de otro empleado.
UPDATE empleados
SET telefono = 3751456798
WHERE idemplaedo= 1;

UPDATE empleados
SET id_localidades= 2
WHERE idemplaedo= 3 ;
UPDATE empleados
SET fecha_ingresso = "2020-09-08"
WHERE idemplaedo= 3 ;
-- en realidad se deberia hacer : UDATE empleados SET fecha_ingresso= "2020-09-08", id_localidades=2 WHERE idempleado=3.

-- 11. Insertar 5 vendedores.
INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
-- se deberia hacer como una sentencia de alter table, pero por alguna razon no me dejaba el programa.
ALTER TABLE movimientos
ADD COLUMN tms TIMESTAMP;
ALTER TABLE movimientos
ADD estado ENUM ("A","B");
ALTER TABLE movimientos
ADD id_producto INT UNSIGNED NOT NULL,
ADD FOREIGN KEY (id_producto) REFERENCES productos(id),
ADD COLUMN tipo_movimientos VARCHAR (40);

-- 13. Insertar 5 movimientos distintos.
-- La sentencia deberia ser : INSERT INTO movimientos (id, cantidad, id_vendedor, tms, estado, id_producto )
-- VALUES (1,'234', '2','2022-08-08 14:23:00','A', '3'),(2,'234', '2','2022-10-08 13:05:00','A', '3'),
-- (3,'234', '3','2022-12-08 09:07:00','A' ,'4'),(4,'234', '3','2022-08-08 09:23:00','A', '5'),
-- (5,'234', '1','2022-08-08 10:23:00','A', '4');
-- Pero me dice :Error Code: 1364. Field 'id_cliente' doesn't have a default value. por eso inserte datos en la tabla clientes (utilice valores del tp5).

INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',100);
INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',200);
INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',NULL);
INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',200);

INSERT INTO movimientos VALUES(1,'234', '2022-08-08 ','2', '3','2022-08-09 17:23:00','A', '2', 'ingreso');
INSERT INTO movimientos VALUES(2,'22', '2022-09-18 ','3', '3','2022-04-19 10:23:00','A', '1', 'egreso');
INSERT INTO movimientos VALUES(3,'32', '2022-08-08 ','1', '2','2022-02-21 08:23:00','A', '4', 'ingreso');
INSERT INTO movimientos VALUES(4,'44', '2022-10-08 ','5', '4','2022-10-09 12:03:00','A', '3', 'egreso');
INSERT INTO movimientos VALUES(5,'34', '2022-02-08 ','2', '5','2022-02-09 09:00:00','A', '5', 'ingreso');

-- 14. Borrar lógicamente (UPDATE de la columna estado):
-- ●2 movimientos que fueron cargados mal
-- ●un pais que tenga al menos 3 localidades
UPDATE movimientos
SET estado= "B"
WHERE id= 2 or id=3;

UPDATE pais
SET nombre= NULL WHERE  id=1;

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
-- manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto.


-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE parámetros (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tms TIMESTAMP,
cosas JSON,
id_usuario INT NOT NULL 
);