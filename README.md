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
## 💻 Ejecución de Scripts SQL
Para desplegar y verificar la estructura relacional del proyecto, el procedimiento requiere abrir **pgAdmin** en tu entorno de PostgreSQL, crear una nueva base de datos bajo el nombre de `ventas_tech` y ejecutar en orden los bloques de sentencias correspondientes a la creación de las tablas tabulares (`categorias`, `clientes`, `productos` y `ventas`) junto con sus respectivas inserciones de datos. Posteriormente, se debe cargar y auditar el archivo `m5_consultas_joins.sql` para comprobar el funcionamiento de las vistas base, las uniones con `INNER JOIN` y las métricas del resumen ejecutivo mensual y ranking de productos.

Ventas LY

% Crecimiento Anual

Validá el comportamiento temporal utilizando la matriz con jerarquía de fechas.
