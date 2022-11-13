use sistema;
-- 1. Lista el apellido de todos los empleados.
SELECT apellido FROM empleados; 
-- 3Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido FROM empleados;
-- 4. Lista todas las columnas de la tabla empleados.
SELECT * FROM empleados;
-- 5 Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
SELECT cuil_cuit FROM empleados; 
-- 6. Lista el nombre y apellido de los empleados en una única columna.
SELECT concat_ws('  ', nombre, apellido) as persona FROM empleados;
-- 7 Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT  ucase(concat(nombre,"  ", coalesce(apellido,"")))FROM empleados;
-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT  lcase(concat(nombre,"  ", coalesce(apellido,"")))FROM empleados;
-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre, presupuesto AS presupuesto_actual FROM departamentos
ORDER BY presupuesto_actual asc;
-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre FROM departamentos ORDER BY nombre asc;
-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre FROM departamentos ORDER BY nombre desc;
-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética
-- tendiendo en cuenta en primer lugar su apellido y luego su nombre. 
SELECT apellido, nombre FROM empleados ORDER BY apellido asc, coalesce(" ",nombre) asc;
-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen
-- mayor presupuesto.
 SELECT  nombre, presupuesto FROM departamentos ORDER BY  presupuesto desc limit 3;
 -- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen
-- menor presupuesto.
SELECT  nombre, presupuesto FROM departamentos ORDER BY  presupuesto asc limit 3;
--  15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que
-- tienen un presupuesto mayor o igual a $150000.
SELECT nombre, presupuesto FROM  departamentoS WHERE presupuesto >=150000;
-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que
-- tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM  departamentoS WHERE presupuesto > 100000 and presupuesto < 200000;
-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto
-- entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM  departamentoS WHERE NOT (presupuesto > 100000 and presupuesto < 200000);
-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre
-- $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM  departamentoS WHERE presupuesto BETWEEN 100000 and  200000;
-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto
-- entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM  departamentos WHERE NOT (presupuesto BETWEEN 100000 and  200000);
-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT * FROM empleados INNER JOIN departamentos ON id_departamento = iddepartamento;
-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada
-- uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden
-- alfabético) y en segundo lugar por apellido y el nombre de los empleados.
SELECT * FROM empleados e INNER JOIN departamentos dp ON dp.iddepartamento= e.id_departamento ORDER BY dp.Nombre, dp.presupuesto, dp.estado, e.Nombre ASC;
-- 22.Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
SELECT DISTINCT dp.iddepartamento, dp.Nombre, e.nombre FROM departamentos dp 
INNER JOIN empleados e ON dp.iddepartamento = e.id_departamento WHERE lcase(e.cuil_cuit)= "27-38382980-3" ;
-- 23. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos
-- departamentos que tienen empleados.
SELECT DISTINCT dp.iddepartamento, dp.Nombre, e.nombre FROM departamentos dp 
INNER JOIN empleados e ON dp.iddepartamento= e.id_departamento WHERE dp.iddepartamento IS NOT NULL;
-- 24.Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz. 
SELECT DISTINCT dp.iddepartamento, dp.Nombre, e.nombre, e.apellido FROM departamentos dp 
INNER JOIN empleados e ON dp.iddepartamento = e.id_departamento WHERE lcase (e.nombre)= "pepe"and lcase (e.apellido)= "Ruiz" ;
-- 25.  Devuelve un listado con los datos de los empleados que trabajan en el departamento de
-- I+D. Ordena el resultado alfabéticamente.
SELECT DISTINCT dp.iddepartamento, dp.Nombre, e.nombre, e.apellido FROM departamentos dp 
INNER JOIN empleados e ON dp.iddepartamento = e.id_departamento WHERE lcase (dp.nombre)= "I+D" ORDER BY e.nombre asc;
-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT * FROM sistema.empleados e INNER JOIN sistema.departamentos dp ON e.id_departamento =dp.iddepartamento
WHERE dp.nombre= "Sistemas"or dp.nombre="Contabilidad" or dp.nombre ="I+D"
ORDER BY e.apellido asc, e.nombre asc;
-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no
-- tienen un presupuesto entre $100000 y $200000.
SELECT * FROM sistema.empleados e INNER JOIN sistema.departamentos dp ON e.id_departamento =dp.iddepartamento
WHERE presupuesto not between 100000 and 200000;

