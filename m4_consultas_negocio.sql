-- =========================================================================
-- Motor: PostgreSQL (pgAdmin)
-- Título: Extrayendo métricas clave con SQL - Pre-entrega Módulo 4
--=========================================================================
-- ACLARACIÓN TÉCNICA:
-- En los alias de las columnas se utiliza 'anio' en lugar de 'año' 
-- para evitar errores de codificación y compatibilidad.
-- =========================================================================
-- CONSULTA 1 — Resumen ejecutivo mensual
-- Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes.
-- =========================================================================

SELECT 
    EXTRACT(YEAR FROM fecha_venta) AS anio,
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_facturado,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(YEAR FROM fecha_venta), EXTRACT(MONTH FROM fecha_venta)
ORDER BY anio, mes;


-- =========================================================================
-- CONSULTA 2 — Ranking de productos
-- Top 5 de id_producto por total facturado, mostrando unidades y total.
-- =========================================================================

SELECT 
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
LIMIT 5;


-- =========================================================================
-- CONSULTA 3 — Clientes recurrentes
-- Clientes que realizaron más de un pedido, con total de pedidos y gasto.Agrego orden por total gastado.
-- =========================================================================

SELECT 
    id_cliente,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(id_venta) > 1
ORDER BY total_gastado DESC;


-- =========================================================================
-- CONSULTA 4 — Meses por encima/por debajo del promedio
-- Compara el total facturado mensual frente al promedio general mensual.
-- =========================================================================

WITH ventas_mensuales AS (
    SELECT 
        EXTRACT(YEAR FROM fecha_venta) AS anio,
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_mes
    FROM ventas
    GROUP BY EXTRACT(YEAR FROM fecha_venta), EXTRACT(MONTH FROM fecha_venta)
)
SELECT 
    anio,
    mes,
    total_mes,
    (SELECT AVG(total_mes) FROM ventas_mensuales) AS promedio_general,
    CASE 
        WHEN total_mes >= (SELECT AVG(total_mes) FROM ventas_mensuales) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS rendimiento_mensual
FROM ventas_mensuales
ORDER BY anio, mes;


-- =========================================================================
-- BLOQUE DE CIERRE: 3 Hallazgos concretos encontrados en los datos
-- =========================================================================
/*
  1. Concentración de ventas: El producto con id_producto 1 'Laptop Pro 15)' concentra 
     la mayor parte de la facturación total de la compañía debido a su alto precio unitario, 
     a pesar de tener menor cantidad de unidades vendidas que el producto 2 'Mouse Inalámbrico',
	 evidenciando el peso relativo del producto.
  
  2. Equilibrio en la cartera de clientes: Todos los compradores registrados (del id_cliente 1 al 5)
	 realizaron 2 pedidos lo que indica una tasa de participación homogénea y ausencia de dependencia
	 en un único consumidor recurrente.
	 
  3. Segmentación clara por volumen de gasto en clientes:
     Existe una brecha marcada en el gasto total entre los compradores: mientras que el grupo líder
     (id_cliente = 1 con $2,640.00 e id_cliente = 5 con $2,100.00) concentra el mayor capital aportado,
 	 el resto de los clientes recurrentes se mantiene en un rango más moderado (entre $510.00 y $674.00),
 	 delimitando claramente un segmento VIP o preferencial, el cual debe ser observado con suma atencion.
*/
--
