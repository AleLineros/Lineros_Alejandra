-- Ejercicio Nº2
-- Desarrollo.

use ventas;
-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar
-- ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT fecha, id FROM pedidos ORDER BY fecha desc;
-- 2. Devuelve todos los datos de los dos pedidos de mayor valor
SELECT * FROM pedidos ORDER BY cantidad desc limit 2;
-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT id_cliente FROM pedidos; 
 -- 4.Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya
-- cantidad total sea superior a $500.
SELECT * FROM pedidos WHERE fecha BETWEEN '2022-01-01' AND '2022-12-31' AND cantidad>500;
-- 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión
-- entre 0.05 y 0.11.
SELECT nombre, apellido FROM vendedores WHERE comisión BETWEEN '0.05' AND '0.11';
-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
SELECT comisión FROM vendedores ORDER BY comisión desc limit 1;
-- 7.Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es
-- NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
SELECT id, nombre, apellido FROM vendedores WHERE cuitcuil is NOT NULL; 
-- 8.  Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y
-- también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM clientes WHERE nombre LIKE 'A%n' OR nombre LIKE 'P%'ORDER BY nombre ASC;
-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá
-- estar ordenado alfabéticamente.
SELECT nombre FROM clientes WHERE nombre NOT LIKE 'A%' ORDER BY nombre ASC;
-- 10..Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en
-- cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT nombre FROM vendedores WHERE nombre LIKE '%el' OR nombre LIKE '%o'ORDER BY nombre ASC;
-- 11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han
-- realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar
-- los elementos repetidos.
SELECT DISTINCT c.id, c.nombre, c.apellido FROM clientes c INNER JOIN pedidos ON  id_cliente= c.id ORDER BY c.nombre ASC;
-- 12. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado
-- debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de
-- los clientes ordenados alfabéticamente.
SELECT * FROM pedidos p INNER JOIN clientes c  ON c.id=id_cliente ORDER BY c.nombre asc;
-- 13..Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El
-- resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe
-- mostrar los datos de los vendedores ordenados alfabéticamente.
SELECT * FROM pedidos p INNER JOIN vendedores v on id_vendedor= v.id ORDER BY v.nombre asc; 
-- 14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
-- con los datos de los vendedores asociados a cada pedido.
SELECT * FROM clientes c INNER JOIN ( pedidos p INNER JOIN vendedores v on id_vendedor= v.id) on id_cliente = c.id;
-- 15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo
-- monto esté entre $300 y $1000.
SELECT c.nombre FROM pedidos INNER JOIN clientes c  ON c.id=id_cliente 
WHERE fecha BETWEEN '2022-01-01' AND '2022-12-31' AND cantidad between "300" and "1000"; -- 16. .Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido
-- realizado por María Santana.
SELECT v.nombre, v.apellido FROM vendedores v INNER JOIN ( pedidos p INNER JOIN clientes c on id_cliente = c.id)
  on id_vendedor= v.id where c.nombre= "maría" and c.apellido= "Santana";
-- 17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez. 
SELECT c.nombre, c.apellido FROM clientes c INNER JOIN ( pedidos p INNER JOIN vendedores v on id_vendedor= v.id )
on id_cliente = c.id  where v.nombre= "Daniel" and v.apellido= "Sàez";
-- 18.  .Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
SELECT * FROM clientes c LEFT JOIN pedidos p  ON c.id=id_cliente ORDER BY c.nombre, c.apellido asc;
-- 19. Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado. Este listado también debe incluir los vendedores que no han realizado ningún
-- pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
SELECT * FROM vendedores v LEFT JOIN pedidos p  ON id_vendedor= v.id ORDER BY v.nombre, v.apellido asc;
-- 20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT * FROM clientes c LEFT JOIN pedidos p  ON c.id=id_cliente WHERE id_cliente IS NULL;
-- 21. Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
SELECT * FROM vendedores v LEFT JOIN pedidos p  ON id_vendedor= v.id WHERE id_vendedor IS NULL;

SELECT vendedores.nombre, vendedores.apellido, " " as cliente_id, vendedores.id as vendedor_id  FROM ventas.pedidos 
LEFT JOIN ventas.vendedores on ventas.pedidos.id_vendedor=ventas.vendedores.id 
WHERE ventas.pedidos.id_vendedor is NULL
union 
SELECT clientes.nombre, clientes.apellido, clientes.id  as cliente_id, " " from ventas.pedidos
right join ventas.clientes on ventas.pedidos.id_cliente=ventas.clientes.id where ventas.pedidos.id_cliente is null 
order by apellido asc, nombre asc;
-- 23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT sum(cantidad)  as "Cantidad total " FROM pedidos;
-- 24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT round( avg(cantidad),2) FROM pedidos; 
-- solución 2. 
SELECT AVG(cantidad) AS cantidad_medio, SUM(cantidad) AS cantidad_total, AVG(cantidad/id) AS cantidad_venta_medio
FROM pedidos;
-- 25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
-- 26.Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT DISTINCT count(*) FROM clientes;
-- 27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
 SELECT cantidad FROM pedidos ORDER BY  cantidad desc limit 1;
 -- otra solucion puede ser
 SELECT MAX(cantidad) FROM pedidos;
 -- 28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT  cantidad FROM pedidos ORDER BY  cantidad asc limit 1;
-- otra solucion puede ser
SELECT MIN(cantidad) FROM pedidos;
-- 29..Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la
-- tabla cliente
SELECT ciudad, max(categoría) as "valor maximo de la categoria" FROM clientes GROUP BY ciudad;
-- 30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellido, la fecha y el valor de la cantidad.
SELECT id_cliente, fecha, max(cantidad)FROM pedidos GROUP BY fecha;
-- 31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen
-- la cantidad de $2000
SELECT id_cliente, fecha, max(cantidad)FROM pedidos GROUP BY fecha having  max(cantidad) > 2000;
-- 32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la
-- fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
SELECT  max(cantidad),fecha FROM pedidos GROUP BY id_vendedor having month(fecha)=08;
-- 33. Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de
-- pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir
-- clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el
-- listado indicando que el número de pedidos realizados es 0.
SELECT c.id,c.nombre,c.apellido, p.*from pedidos p right  join clientes c 
on p.id_cliente= c.id ORDER BY c.apellido ASC,  c.nombre ASC;
-- 34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2020
SELECT c.id,c.nombre,c.apellido, p.*from pedidos p right  join clientes c 
on p.id_cliente= c.id GROUP BY id_cliente having year(fecha)=2020;
-- 35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT max(cantidad),fecha, p.id FROM pedidos p GROUP BY year(fecha);
-- 36.Devuelve el número total de pedidos que se han realizado cada año.
SELECT count(id),fecha FROM pedidos p GROUP BY year(fecha);
-- 37. Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
SELECT * FROM pedidos WHERE id_cliente = (SELECT id FROM clientes WHERE nombre = 'Adela' and apellido ='Salas');
-- 38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
SELECT count(*) FROM pedidos WHERE id_vendedor = (SELECT id FROM vendedores WHERE nombre = 'Daniel' and apellido ='Sáez');
-- 39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
SELECT * FROM clientes WHERE id = (SELECT id_cliente FROM pedidos WHERE cantidad = (SELECT MAX(cantidad) FROM pedidos WHERE YEAR(fecha) = 2020));
--40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
-- (El cliente pepe ruiz no esta registrado con el apellido santana)
SELECT fecha, cantidad FROM clientes INNER JOIN pedidos ON clientes.id = pedidos.id_cliente WHERE clientes.nombre= 'Pepe' AND apellido = 'Ruiz' 
 AND pedidos.cantidad = (select MIN(cantidad) FROM clientes INNER JOIN  pedidos ON clientes.id = pedidos.id_cliente  WHERE clientes.nombre = 'Pepe' and apellido= 'Ruiz');
-- 41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM clientes WHERE id NOT IN  (SELECT id_cliente FROM pedidos);
-- 42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM vendedores WHERE id NOT IN  (SELECT id_vendedor FROM pedidos);
-- 43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM clientes c WHERE NOT EXISTS (SELECT id_cliente FROM pedidos p WHERE c.id=p.id_cliente);
-- 44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM vendedores v WHERE NOT EXISTS (SELECT id_vendedor FROM pedidos p WHERE v.id=p.id_vendedor);