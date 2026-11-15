# RetailPro — Dashboard de Rendimiento Comercial y Modelo Analítico

Repositorio oficial del proyecto analítico **RetailPro**, desarrollado para la gestión de datos, modelado relacional, automatización ETL y visualización de indicadores comerciales.

---

## 🚀 Descripción del Proyecto
RetailPro es una solución integral de inteligencia de negocios diseñada para optimizar el análisis de ventas, el seguimiento del rendimiento de productos y el control de inventarios. El proyecto integra bases de datos relacionales, consultas SQL avanzadas y un modelo multidimensional en estrella (`Star Schema`) implementado en Power BI.

---

## 🛠️ Tecnologías y Herramientas Utilizadas
* **Base de Datos / SQL:** PostgreSQL y pgAdmin.
* **Transformación de Datos:** Power Query (limpieza, uniones y tipado ETL).
* **Modelado y Visualización:** Power BI Desktop (Modelo en estrella, medidas DAX y matriz de validación temporal).
* **Control de Versiones:** Git y GitHub.

---

## 📂 Estructura del Repositorio
```text
├── m5_consultas_joins.sql          # Consultas SQL con vistas base, INNER JOINs y análisis ejecutivo
├── schema_y_datos.sql              # Estructura de tablas (categorias, clientes, productos, ventas) e inserciones
├── Pipeline_ETL_RetailPro.pbix     # Archivo principal de Power BI con el modelo relacional y medidas DAX
└── README.md                       # Documentación técnica del repositorio
---

## ⚙️ Instrucciones de Ejecución y Configuración
1. Configuración de la Base de Datos (PostgreSQL / pgAdmin)
Cloná este repositorio en tu computadora o descargá los scripts SQL incluidos.

Abrí pgAdmin y creá una nueva base de datos llamada ventas_tech.

Ejecutá el script de creación de tablas (categorias, clientes, productos, ventas) junto con las sentencias de inserción de datos (INSERT INTO).

2. Ejecución y Auditoría de Consultas
Abrí el archivo m5_consultas_joins.sql en tu entorno de PostgreSQL para verificar la vista base con uniones (INNER JOIN), el resumen ejecutivo mensual y el ranking de productos.

3. Modelo Analítico y Visualización (Power BI Desktop)
Abrí el archivo Pipeline_ETL_RetailPro.pbix en Power BI Desktop.

Verificá que el modelo en estrella (Star Schema) mantenga las relaciones activas de 1 a muchos (1:N) desde la tabla de hechos central ventas hacia las dimensiones (clientes, productos, categorias y Dim_Fechas).

Comprobá las medidas DAX clave centralizadas en la tabla _Medidas:

Total Ventas

Ventas YTD

Ventas LY

% Crecimiento Anual

Validá el comportamiento temporal utilizando la matriz con jerarquía de fechas.
