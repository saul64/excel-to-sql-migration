# 📂 Migración de Base de Datos de Excel a MySQL en un Servidor

A continuacion se describe el metodo que se llevo acabo para migrar una base de datos desde un archivo de Excel a un servidor MySQL, asegurando una estructura normalizada y una correcta inserción de datos.

---
## 🚀 Pasos del Proceso

### 1️⃣ Normalización de Datos
Antes de migrar los datos a MySQL, se realizó un proceso de normalización conforme a las **tres formas normales (1FN, 2FN y 3FN)** para optimizar la integridad y eliminar redundancias.

### 2️⃣ Separación de Tablas
- Se requiere separar las tablas en distintas hojas

### 3️⃣ Conversión a CSV
- Se requiere eliminar los encabezados de las tablas (titulos de columnas)
- Cada hoja de Excel se exportó en formato **CSV (Comma Separated Values)**.
- Se usó `,` como separador y `"` para encerrar texto.

### 4️⃣ Creación de Base de Datos y Tablas en MySQL
Se diseñaron las tablas con sus respectivos campos y relaciones:

```sql
CREATE DATABASE data_establecimientos;
USE data_establecimientos;

-- Tabla de Asentamientos
CREATE TABLE Asentamientos (
    id_asentamiento INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT
    nombre_asent VARCHAR(30),
    tipo_asent VARCHAR(30),
    tipo_vial VARCHAR(30),
    edificio VARCHAR(25),
    numero_ext VARCHAR(10)
);
```
5️⃣ Inserción de Datos desde CSV
Para insertar datos desde CSV, se utilizó:

```sql
LOAD DATA INFILE '/ruta/al/archivo.csv'
INTO TABLE ejemplo
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

6️⃣ Conexión al Servidor y Carga de Datos
Se estableció conexión al servidor MySQL mediante SSH
Se ejecutaron los querys de creación de tablas.
Se cargaron los datos de los archivos CSV en las tablas.

7️⃣ Verificación de la Migración
Se realizaron consultas para comprobar la correcta inserción de datos:
```sql
SELECT * FROM ejemplo LIMIT 10;
```

Se revisó la integridad de relaciones y se aplicaron pruebas de consistencia.

## ⚠️ Consideraciones
- ✔ **Formato CSV**: Verificar que no haya errores en el delimitador.
- ✔ **Compatibilidad de Tipos de Datos**: Asegurar que los tipos en MySQL sean adecuados.
- ✔ **Manejo de Errores**: Usar `SHOW WARNINGS;` después de la carga para revisar errores.

## 🔧 Herramientas Utilizadas
- 🛠 **Microsoft Excel** - Organización y exportación a CSV
- 🛠 **MySQL Server** - Base de datos destino
- 🛠 **MySQL Workbench / CLI** - Cliente MySQL
- 🛠 **SSH** - Para conexión remota al servidor
