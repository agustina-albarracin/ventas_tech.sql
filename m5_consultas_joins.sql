
-- =========================================================================
-- Pre-entrega 5: Consultas con JOINs para el proyecto- Cruzando tablas para enriquecer el análisis-
-- Motor: PostgreSQL (pgAdmin)
-- =========================================================================


-- =========================================================================
-- CONSULTA 1 — Vista base del proyecto (INNER JOIN)
-- Propósito: Combinar la tabla de hechos (ventas) con las dimensiones 
-- (clientes, productos y categorías) para generar la vista analítica principal.
-- =========================================================================
SELECT 
    v.fecha_venta,
    v.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad AS ciudad_cliente,
    p.nombre_producto,
    cat.nombre_categoria AS categoria_producto,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria;

-- Hallazgo: La vista integrada cruza exitosamente las 10 transacciones 
-- comerciales de marzo de 2024 con sus respectivas dimensiones, permitiendo
-- visualizar que la categoría 'Computación' (con productos como Laptop Pro 15 y Monitor 4K 27) 
-- genera los mayores volúmenes de ingresos por ticket, mientras que 'Accesorios' concentra
-- la mayor cantidad de unidades por pedido en distintas ciudades del país (Buenos Aires, Córdoba, Rosario, Mendoza y Tucumán).

-- =========================================================================
-- CONSULTA 2 — Clientes sin ventas (LEFT JOIN)
-- Propósito: Detectar clientes registrados que nunca han realizado una compra, 
-- para que el área de CRM pueda contactarlos y reactivarlos.
-- =========================================================================
SELECT 
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- Hallazgo: 0 de los 5 clientes registrados se encuentran sin compras (todos tienen transacciones), 
-- lo que indica una tasa de conversión inicial del 100% en la base actual de prueba del CRM.

-- =========================================================================
-- CONSULTA 3 — Productos sin ventas (LEFT JOIN)
-- Propósito: Identificar los artículos del catálogo que no poseen ninguna venta registrada, 
-- para que el área de producto tome decisiones sobre stock o promociones.
-- =========================================================================
SELECT 
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio,
    p.stock
FROM productos p
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

-- Hallazgo: 0 de los 6 productos del catálogo se encuentran sin movimiento; todos los artículos 
-- registran al menos una venta, reflejando un catálogo inicial totalmente activo y sin stock retenido.

-- =========================================================================
-- CONSULTA 4 — Consolidado por canal (UNION ALL)
-- Propósito: Clasificar y agrupar el total facturado dividiendo las ventas de forma 
-- simulada por canales operativos (ej. 'Online' vs 'Presencial') usando un subquery con UNION ALL.
-- =========================================================================
SELECT 
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, (cantidad * precio_unitario) AS total, 'Online' AS canal
    FROM ventas WHERE id_venta <= 5
    UNION ALL
    SELECT fecha_venta, (cantidad * precio_unitario) AS total, 'Presencial' AS canal
    FROM ventas WHERE id_venta > 5
) AS consolidado
GROUP BY canal;
-- Hallazgo: Al desglosar la facturación total ($6,444.00) mediante la partición simulada de canales
--(id_venta <= 5 para Online e id_venta > 5 para Presencial), se identifica que el canal 'Online' concentra $3,620.00 (56.16%)
--impulsado por las primeras 5 transacciones de mayor impacto, mientras que el canal 'Presencial' aporta $2,824.00 (43.84%). 
--El canal digital tracciona los tickets de mayor valor en la etapa inicial del ciclo comercial.
