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

-- Tabla de Ubicaciones
CREATE TABLE Ubicaciones (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT
    codigo_postal VARCHAR(6),
    cve_mun VARCHAR(5),
    cve_loc VARCHAR(8),
    latitud DECIMAL(10, 7),
    longitud DECIMAL(10, 7),
    id_asentamiento INT,
    FOREIGN KEY (id_asentamiento) REFERENCES Asentamientos(id_asentamiento) ON DELETE SET NULL
);

-- Tabla de Establecimientos
CREATE TABLE Establecimientos (
    id_establecimiento INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT
    serie_establecimiento CHAR(36),
    nomb_estab VARCHAR(85) NOT NULL,
    raz_social VARCHAR(60),
    codigo_act VARCHAR(8),
    fecha_alta DATE,
    id_ubicacion INT,
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion) ON DELETE SET NULL
);

-- Tabla de Telefonos
CREATE TABLE Telefonos (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY, --  AUTO_INCREMENT
    id_establecimiento INT,
    telefono VARCHAR(15),
    FOREIGN KEY (id_establecimiento) REFERENCES Establecimientos(id_establecimiento) ON DELETE CASCADE
);

-- Tabla de Correos Electrónicos
CREATE TABLE Correos (
    id_correo INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT
    id_establecimiento INT,
    correoelec VARCHAR(85),
    FOREIGN KEY (id_establecimiento) REFERENCES Establecimientos(id_establecimiento) ON DELETE CASCADE
);

-- Tabla de Sitios Web
CREATE TABLE SitiosWeb (
    id_www INT AUTO_INCREMENT PRIMARY KEY, --  AUTO_INCREMENT
    id_establecimiento INT,
    www VARCHAR(45),
    FOREIGN KEY (id_establecimiento) REFERENCES Establecimientos(id_establecimiento) ON DELETE CASCADE
);