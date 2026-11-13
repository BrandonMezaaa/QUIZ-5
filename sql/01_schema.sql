-- =============================================================
-- Quiz #5 - SQL
-- MiAutoPuntoCom: esquema normalizado (Parte 1)
-- =============================================================

DROP DATABASE IF EXISTS miautopuntocom;
CREATE DATABASE miautopuntocom CHARACTER SET utf8mb4;
USE miautopuntocom;

-- -------------------------------------------------------------
-- Vehiculos
-- -------------------------------------------------------------
CREATE TABLE Vehiculos (
    id_vehiculo    INT AUTO_INCREMENT PRIMARY KEY,
    vin            VARCHAR(17) NOT NULL UNIQUE,       -- VIN real: 17 caracteres, siempre unico
    marca          VARCHAR(50)  NOT NULL,
    modelo         VARCHAR(50)  NOT NULL,
    anio           SMALLINT     NOT NULL,              -- "year" es palabra reservada en SQL
    color          VARCHAR(30)  NOT NULL,
    precio         DECIMAL(12,2) NOT NULL,              -- dinero: DECIMAL, nunca FLOAT
    tipo           ENUM('sedan','suv','camioneta','hatchback','pickup','coupe','van','otro') NOT NULL,
    estado         ENUM('nuevo','usado') NOT NULL,

    CHECK (anio BETWEEN 1900 AND 2100),
    CHECK (precio >= 0)
);

-- -------------------------------------------------------------
-- Clientes
-- -------------------------------------------------------------
CREATE TABLE Clientes (
    id_cliente     INT AUTO_INCREMENT PRIMARY KEY,
    cedula         VARCHAR(20)  NOT NULL UNIQUE,
    nombre         VARCHAR(60)  NOT NULL,
    apellido       VARCHAR(60)  NOT NULL,
    telefono       VARCHAR(20)  NOT NULL,
    email          VARCHAR(100) NOT NULL UNIQUE,
    direccion      VARCHAR(200) NOT NULL
);

-- -------------------------------------------------------------
-- Vendedores
-- -------------------------------------------------------------
CREATE TABLE Vendedores (
    id_vendedor        INT AUTO_INCREMENT PRIMARY KEY,
    cedula             VARCHAR(20) NOT NULL UNIQUE,
    nombre             VARCHAR(60) NOT NULL,
    apellido           VARCHAR(60) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    comision_porcentual DECIMAL(5,2) NOT NULL,          -- ej. 7.50 significa 7.5%

    CHECK (comision_porcentual BETWEEN 0 AND 100)
);

-- -------------------------------------------------------------
-- Ventas (normalizada: referencia a las otras 3 tablas por llave foranea)
-- -------------------------------------------------------------
CREATE TABLE Ventas (
    id_venta       INT AUTO_INCREMENT PRIMARY KEY,
    id_vehiculo    INT NOT NULL UNIQUE,                 -- un vehiculo se vende una sola vez
    id_cliente     INT NOT NULL,
    id_vendedor    INT NOT NULL,
    fecha_venta    DATE NOT NULL,
    precio_final   DECIMAL(12,2) NOT NULL,
    metodo_pago    ENUM('efectivo','financiamiento','tarjeta') NOT NULL,

    CHECK (precio_final >= 0),

    CONSTRAINT fk_venta_vehiculo
        FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo)
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_venta_vendedor
        FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Indices utiles para busquedas frecuentes (no piden puntos aparte, pero son buena practica)
CREATE INDEX idx_vehiculos_marca_modelo ON Vehiculos(marca, modelo);
CREATE INDEX idx_ventas_fecha ON Ventas(fecha_venta);
