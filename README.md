# ventas_tech.sql

# 🛒 TechStore - Sistema de Gestión y Análisis de Datos (SQL & PostgreSQL)

Repositorio oficial para las entregas y prácticas de gestión de bases de datos y análisis de negocio orientadas al caso **TechStore** (RetailPro), implementado en entornos relacionales normalizados utilizando **PostgreSQL (pgAdmin)**.

---

## 🛠️ Requisitos del Entorno

*   **Motor de base de datos:** PostgreSQL (versión 13 o superior recomendada).
*   **Herramienta de gestión:** pgAdmin 4.
*   **Convenciones técnicas:** Todos los scripts evitan el uso de tildes y eñes (`ñ`) en los nombres de objetos y alias de columnas para asegurar la máxima compatibilidad de codificación (Encoding UTF-8) y prevenir errores de sintaxis.

---

## 🚀 Instrucciones de Ejecución

Para probar y replicar el proyecto de manera limpia desde tu entorno de desarrollo, ejecutá los scripts en el siguiente orden estricto:

1.  **Crear la Base de Datos:**
    Abre una herramienta de consulta en tu servidor PostgreSQL y crea el esquema base:
    ```sql
    CREATE DATABASE Ventas_Tech_DB;
    ```
    *Nota: Conéctate a la base de datos `Ventas_Tech_DB` antes de ejecutar los scripts siguientes.*

2.  **Ejecutar el Modelo de Datos (M3):**
    *   Carga el archivo `modulo_3/ventas_tech_db.sql` en el Query Tool de pgAdmin.
    *   Ejecuta el script completo para borrar tablas previas (patrón repetible), crearlas en el orden correcto respetando las *Foreign Keys* e insertar los registros iniciales.

3.  **Ejecutar las Consultas de Negocio (M4):**
    *   Carga y ejecuta el archivo `modulo_4/m4_consultas_negocio.sql` para visualizar el resumen mensual, el ranking de artículos, la recurrencia de clientes y el análisis del promedio general.

4.  **Ejecutar los Cruces y Vistas con JOINs (M5):**
    *   Carga y ejecuta el archivo `modulo_5/m5_consultas_joins.sql` para generar la vista analítica unificada, auditar carencias comerciales (clientes y productos sin movimiento) y consolidar la facturación por canales operativos.
