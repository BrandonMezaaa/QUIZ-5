USE miautopuntocom;

-- =============================================================
-- PARTE 4: CONSULTAS SQL
-- =============================================================

-- 1. Listar todos los vehículos disponibles (no vendidos) ordenados por precio descendente
SELECT * 
FROM Vehiculos 
WHERE id_vehiculo NOT IN (SELECT id_vehiculo FROM Ventas)
ORDER BY precio DESC;


-- 2. Mostrar el total de ventas realizadas por cada vendedor (nombre del vendedor y cantidad de ventas)
SELECT v.nombre, v.apellido, COUNT(ve.id_venta) AS total_ventas
FROM Vendedores v
LEFT JOIN Ventas ve ON v.id_vendedor = ve.id_vendedor
GROUP BY v.id_vendedor, v.nombre, v.apellido;


-- 3. Calcular el ingreso total generado por cada vendedor
SELECT v.nombre, v.apellido, COALESCE(SUM(ve.precio_final), 0) AS ingreso_total
FROM Vendedores v
LEFT JOIN Ventas ve ON v.id_vendedor = ve.id_vendedor
GROUP BY v.id_vendedor, v.nombre, v.apellido;


-- 4. Encontrar el cliente que ha realizado la compra más costosa
SELECT c.nombre, c.apellido, c.cedula, ve.precio_final, veh.marca, veh.modelo
FROM Ventas ve
JOIN Clientes c ON ve.id_cliente = c.id_cliente
JOIN Vehiculos veh ON ve.id_vehiculo = veh.id_vehiculo
ORDER BY ve.precio_final DESC
LIMIT 1;


-- 5. Listar los vehículos vendidos en el último mes con información del cliente comprador
SELECT veh.marca, veh.modelo, veh.anio, ve.fecha_venta, ve.precio_final, 
       c.nombre AS cliente_nombre, c.apellido AS cliente_apellido
FROM Ventas ve
JOIN Vehiculos veh ON ve.id_vehiculo = veh.id_vehiculo
JOIN Clientes c ON ve.id_cliente = c.id_cliente
WHERE ve.fecha_venta >= DATE_SUB((SELECT MAX(fecha_venta) FROM Ventas), INTERVAL 1 MONTH);


-- 6. Calcular la comisión ganada por cada vendedor basado en sus ventas
SELECT v.nombre, v.apellido, v.comision_porcentual,
       COALESCE(SUM(ve.precio_final * (v.comision_porcentual / 100)), 0) AS comision_total_ganada
FROM Vendedores v
LEFT JOIN Ventas ve ON v.id_vendedor = ve.id_vendedor
GROUP BY v.id_vendedor, v.nombre, v.apellido, v.comision_porcentual;


-- 7. Mostrar el promedio de precios de vehículos vendidos agrupados por tipo
SELECT veh.tipo, AVG(ve.precio_final) AS promedio_precio_vendido
FROM Ventas ve
JOIN Vehiculos veh ON ve.id_vehiculo = veh.id_vehiculo
GROUP BY veh.tipo;


-- 8. Identificar qué marca de vehículo se ha vendido más veces
SELECT veh.marca, COUNT(ve.id_venta) AS total_vendidos
FROM Ventas ve
JOIN Vehiculos veh ON ve.id_vehiculo = veh.id_vehiculo
GROUP BY veh.marca
ORDER BY total_vendidos DESC
LIMIT 1;
