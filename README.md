# Quiz #5 — SQL: MiAutoPuntoCom

**CE 2103 — Algoritmos y Estructuras de Datos II**

Base de datos en MySQL para el sistema de información de la empresa MiAutoPuntoCom (venta de vehículos).

> Esta entrega cubre la **Parte 1 (30%)**: creación de las tablas normalizadas. El enunciado en PDF parecía continuar después de esta parte; si hay una Parte 2 o 3 (datos, consultas), falta agregarlas a este repositorio.

## Diagrama entidad-relación

![Diagrama ER](diagrama/er_diagram.png)

*Nota: el diagrama se generó automáticamente a partir de las tablas ya creadas en MySQL, y dibuja la relación Vehículos–Ventas como 1 a muchos por defecto. En la práctica es 1 a 1, porque `id_vehiculo` tiene una restricción `UNIQUE` en `Ventas`: un mismo vehículo no se puede vender dos veces.*

## Decisiones de diseño

| Tabla | Decisión | Por qué |
|---|---|---|
| Vehiculos | `vin` es `VARCHAR(17) UNIQUE` | El VIN real siempre mide 17 caracteres y es único por definición |
| Vehiculos | `anio` en vez de `year` | `YEAR` es palabra reservada de SQL |
| Vehiculos | `precio` es `DECIMAL(12,2)`, no `FLOAT` | `FLOAT` pierde precisión en dinero; `DECIMAL` es exacto |
| Vehiculos | `tipo` y `estado` son `ENUM` | El enunciado da una lista cerrada de opciones (sedán, SUV, camioneta...; nuevo/usado) |
| Clientes / Vendedores | `cedula` es `UNIQUE` | Una persona no puede registrarse dos veces con la misma cédula |
| Ventas | Llaves foráneas a las otras 3 tablas | El enunciado pide explícitamente que esté normalizada y referencie a las demás tablas |
| Ventas | `id_vehiculo` es `UNIQUE` | Un vehículo solo se vende una vez (evita vender el mismo carro dos veces) |
| Ventas | `metodo_pago` es `ENUM` | El enunciado da una lista cerrada (efectivo, financiamiento, tarjeta) |
| Todas | `CHECK` en año, precio y comisión | Evita datos imposibles (año 1700, precios negativos, comisión de 500%) |

## Estructura del repositorio

```text
.
├── README.md
├── sql/
│   ├── 01_schema.sql           # crea la base y las 4 tablas
│   └── 02_datos_ejemplo.sql    # datos de prueba
└── diagrama/
    └── er_diagram.png
```

## Cómo ejecutarlo

Requisitos: MySQL Server 8.0+ instalado.

```bash
mysql -u root -p < sql/01_schema.sql
mysql -u root -p < sql/02_datos_ejemplo.sql
```

## Pruebas realizadas

El esquema se ejecutó contra un MySQL 8.0.46 real. Se probó que las restricciones funcionan:

| Prueba | Resultado |
|---|---|
| Insertar un VIN que ya existe | Rechazado (`Duplicate entry ... for key 'Vehiculos.vin'`) |
| Vender el mismo vehículo dos veces | Rechazado (`Duplicate entry ... for key 'Ventas.id_vehiculo'`) |
| Vender a un vendedor que no existe (id_vendedor=999) | Rechazado (`foreign key constraint fails`) |
| Insertar un vehículo con año 1700 | Rechazado (`Check constraint ... is violated`) |
| Consulta con JOIN de las 4 tablas | Funciona correctamente |
