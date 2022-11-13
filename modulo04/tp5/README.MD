# CURSO PROGRAMACIÓN WEB FULL STACK
## NIVEL 2
### Módulo 4 - Bases de datos
###### Ejercicio 1:

Partiendo del modelo entidad relación, ejecutar el script y resolver las consultas. Guardar en un archivo  tp5-eje1.sql las consultas

**Modelo ER Empleados - Departamentos**

![image](https://user-images.githubusercontent.com/113069388/201545257-c6189b8e-3da6-4563-a16d-6f14cdb923be.png)


Script para mysql

DROP DATABASE IF EXISTS sistema;

CREATE DATABASE sistema CHARACTER SET utf8mb4;

USE sistema;

CREATE TABLE departamentos (

iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

nombre VARCHAR(100) NOT NULL,

presupuesto DOUBLE UNSIGNED NOT NULL,

estado  boolean NOT NULL

);


CREATE TABLE empleados (

idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

cuil_cuit VARCHAR(15) NOT NULL UNIQUE,

nombre VARCHAR(100) NOT NULL,

apellido VARCHAR(100) NOT NULL,

id_departamento INT UNSIGNED,

estado BOOLEAN,

FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);


INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true);  

INSERT INTO departamentos VALUES(2, 'Sistemas', 150000, true);  

INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 280000, true);

INSERT INTO departamentos VALUES(4, 'Contabilidad', 110000, true);

INSERT INTO departamentos VALUES(5, 'I+D', 375000, true);

INSERT INTO departamentos VALUES(6, 'Proyectos', 0,true );

INSERT INTO departamentos VALUES(7, 'Publicidad', 0, true);

INSERT INTO departamentos VALUES(8, 'Comercial', 0, false);

INSERT INTO empleados VALUES(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true);

INSERT INTO empleados VALUES(2, '27-29557532-1', 'Adela', 'Salas', 2, true);

INSERT INTO empleados VALUES(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true);

INSERT INTO empleados VALUES(4, '20-41705545-1', 'Adrián', 'Suárez',4,true);

INSERT INTO empleados VALUES(5, '20-17087203-3', 'Marcos', 'Loyola',5,true);

INSERT INTO empleados VALUES(6, '27-38382980-3', 'María', 'Santana', 1, true);

INSERT INTO empleados VALUES(7, '23-80576669-1', 'Pilar', 'Ruiz', 2, true); 

INSERT INTO empleados VALUES(8, '24-71651431-3', 'Pepe', 'Ruiz', 3, true);

INSERT INTO empleados VALUES(9, '25-36399183-3', 'Juan', 'Gómez', 2, true);

INSERT INTO empleados VALUES(10, '20-34638446-3', 'Diego','Flores', 5, true);

INSERT INTO empleados VALUES(11, '27-36738983-3', 'Marta','Herrera', 1, true);

INSERT INTO empleados VALUES(12, '27-44123836-1', 'Irene','Salas', NULL, false);

INSERT INTO empleados VALUES(13, '20-38265162-1', 'Juan Antonio', NULL, true);



**Ejercicio 2:**
Partiendo del modelo entidad relación, ejecutar el script y resolver las consultas. Guardar en un archivo tp5-eje2.sql

**Modelo ER Gestion de Pedidos**

![image](https://user-images.githubusercontent.com/113069388/201545310-66973424-e17b-4103-944f-3e5ad7f4b139.png)


Script para mysql

DROP DATABASE IF EXISTS ventas;

CREATE DATABASE ventas CHARACTER SET utf8mb4;

USE ventas;

CREATE TABLE clientes (

id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

nombre VARCHAR(30) NOT NULL,

apellido VARCHAR(30) NOT NULL,

cuitcuil VARCHAR(20),

ciudad VARCHAR(100),

categoría INT UNSIGNED

);


CREATE TABLE vendedores (

id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

nombre VARCHAR(30) NOT NULL,

apellido VARCHAR(30) NOT NULL,

cuitcuil VARCHAR(20),

comisión FLOAT
);


CREATE TABLE pedidos (

id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

cantidad DOUBLE NOT NULL,

fecha DATE,

id_cliente INT UNSIGNED NOT NULL,

id_vendedor INT UNSIGNED NOT NULL,

FOREIGN KEY (id_cliente) REFERENCES clientes(id),

FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)

);


INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',
100);

INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',
200);

INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',
NULL);

INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);

INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',
200);

INSERT INTO clientes VALUES(6, 'María', 'Santana', '27-38771523-1', 'Obera',
100);

INSERT INTO clientes VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);

INSERT INTO clientes VALUES(8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200);

INSERT INTO clientes VALUES(9, 'Guillermo', 'López', '20-42481328-1',
'Andresito', 225);

INSERT INTO clientes VALUES(10, 'Daniel', 'Santana', '20-40159624-3',
'Apostoles', 125);

INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);

INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);

INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);

INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);

INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);

INSERT INTO vendedores VALUES(6, 'Manuel','Domínguez', '20-29876342-3', 0.13);

INSERT INTO vendedores VALUES(7, 'Antonio','Vega', '20-32521596-3', 0.11);

INSERT INTO vendedores VALUES(8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);

INSERT INTO pedidos VALUES(1, 150.5, '2020-10-05', 5, 2);

INSERT INTO pedidos VALUES(2, 270.65, '2019-09-10', 1, 5);

INSERT INTO pedidos VALUES(3, 65.26, '2022-10-05', 2, 1);

INSERT INTO pedidos VALUES(4, 110.5, '2021-08-17', 8, 3);

INSERT INTO pedidos VALUES(5, 948.5, '2021-09-10', 5, 2);

INSERT INTO pedidos VALUES(6, 2400.6, '2021-07-27', 7, 1);

INSERT INTO pedidos VALUES(7, 5760, '2018-09-10', 2, 1);

INSERT INTO pedidos VALUES(8, 1983.43, '2021-10-10', 4, 6);

INSERT INTO pedidos VALUES(9, 2480.4, '2019-10-10', 8, 3);
