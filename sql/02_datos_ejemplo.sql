USE miautopuntocom;

-- 10 Vehículos
INSERT INTO Vehiculos (vin, marca, modelo, anio, color, precio, tipo, estado) VALUES
('1HGCM82633A004352', 'Honda',     'Civic',     2024, 'Blanco', 14500000.00, 'sedan',     'Nuevo'),
('JTDBR32E720012345', 'Toyota',    'Corolla',   2022, 'Gris',   11200000.00, 'sedan',     'Usado'),
('3GNAXUEV5LL123456', 'Chevrolet', 'Tahoe',     2023, 'Negro',  28500000.00, 'suv',       'Nuevo'),
('1FTFW1ET5BFA12345', 'Ford',      'F-150',     2021, 'Rojo',   19800000.00, 'pickup',    'Usado'),
('WBA33AY07NC123789', 'BMW',       'Serie 3',   2024, 'Azul',   24000000.00, 'sedan',     'Nuevo'),
('JN1AZ28U58Z987654', 'Nissan',    'Frontier',  2020, 'Blanco', 12500000.00, 'pickup',    'Usado'),
('SALWR2V43KA555111', 'Land Rover','Defender',  2023, 'Verde',  35000000.00, 'suv',       'Nuevo'),
('KM8H83AG5PU333222', 'Hyundai',   'Tucson',    2022, 'Plateado',13800000.00, 'suv',      'Usado'),
('WAUZZZF23PA444555', 'Audi',      'A4',        2023, 'Gris',   21000000.00, 'sedan',     'Nuevo'),
('JTEBU5JR9K5666777', 'Toyota',    'RAV4',      2024, 'Azul',   17500000.00, 'suv',       'Nuevo');

-- 6 Clientes
INSERT INTO Clientes (cedula, nombre, apellido, telefono, email, direccion) VALUES
('1-1111-1111', 'Maria', 'Jimenez', '8888-1111', 'maria.jimenez@example.com', 'San Jose, Costa Rica'),
('2-2222-2222', 'Carlos', 'Vargas',  '8888-2222', 'carlos.vargas@example.com', 'Cartago, Costa Rica'),
('3-3333-3333', 'Ana', 'Rojas',     '8888-3333', 'ana.rojas@example.com',     'Alajuela, Costa Rica'),
('4-4444-4444', 'Luis', 'Montero',  '8888-4444', 'luis.montero@example.com',  'Heredia, Costa Rica'),
('5-5555-5555', 'Sofia', 'Araya',   '8888-5555', 'sofia.araya@example.com',   'Puntarenas, Costa Rica'),
('6-6666-6666', 'David', 'Mora',    '8888-6666', 'david.mora@example.com',    'Limon, Costa Rica');

-- 4 Vendedores (Mayores de 21 años al ser contratados)
INSERT INTO Vendedores (cedula, nombre, apellido, fecha_nacimiento, fecha_contratacion, comision_porcentual) VALUES
('7-7777-7777', 'Esteban', 'Perez', '1990-05-12', '2022-03-15', 5.50),
('8-8888-8888', 'Valeria', 'Gomez', '1995-08-20', '2023-01-10', 6.00),
('9-9999-9999', 'Gabriel', 'Solano','1988-11-05', '2021-06-01', 5.00),
('0-0000-0000', 'Lucia', 'Castro',  '1992-02-28', '2023-07-01', 7.00);

-- 8 Ventas
INSERT INTO Ventas (id_vehiculo, id_cliente, id_vendedor, fecha_venta, precio_final, metodo_pago) VALUES
(1, 1, 1, '2026-01-10', 14300000.00, 'financiamiento'),
(2, 2, 2, '2026-01-15', 11000000.00, 'tarjeta'),
(3, 3, 1, '2026-01-20', 28000000.00, 'efectivo'),
(4, 4, 3, '2026-02-02', 19500000.00, 'financiamiento'),
(5, 5, 4, '2026-02-10', 23800000.00, 'tarjeta'),
(7, 6, 2, '2026-02-15', 34500000.00, 'efectivo'),
(8, 1, 3, '2026-02-20', 13500000.00, 'financiamiento'),
(9, 2, 4, '2026-02-25', 20800000.00, 'tarjeta');
