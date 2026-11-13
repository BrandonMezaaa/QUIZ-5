USE miautopuntocom;

INSERT INTO Vehiculos (vin, marca, modelo, anio, color, precio, tipo, estado) VALUES
('1HGCM82633A004352', 'Honda',   'Civic',    2024, 'Blanco', 14500000.00, 'sedan',     'nuevo'),
('JTDBR32E720012345', 'Toyota',  'Corolla',  2022, 'Gris',   11200000.00, 'sedan',     'usado'),
('3GNAXUEV5LL123456', 'Chevrolet','Tahoe',   2023, 'Negro',  28500000.00, 'suv',       'nuevo'),
('1FTFW1ET5BFA12345', 'Ford',    'F-150',    2021, 'Rojo',   19800000.00, 'pickup',    'usado');

INSERT INTO Clientes (cedula, nombre, apellido, telefono, email, direccion) VALUES
('1-1111-1111', 'Maria', 'Jimenez', '8888-1111', 'maria.jimenez@example.com', 'San Jose, Costa Rica'),
('2-2222-2222', 'Carlos', 'Vargas',  '8888-2222', 'carlos.vargas@example.com', 'Cartago, Costa Rica');

INSERT INTO Vendedores (cedula, nombre, apellido, fecha_contratacion, comision_porcentual) VALUES
('3-3333-3333', 'Luis', 'Mora',    '2022-03-15', 5.50),
('4-4444-4444', 'Ana',  'Chaves',  '2023-07-01', 6.00);

INSERT INTO Ventas (id_vehiculo, id_cliente, id_vendedor, fecha_venta, precio_final, metodo_pago) VALUES
(1, 1, 1, '2026-01-10', 14300000.00, 'financiamiento'),
(2, 2, 2, '2026-02-05', 10900000.00, 'tarjeta');
