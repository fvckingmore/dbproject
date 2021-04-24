CREATE DATABASE IF NOT EXISTS farmaciatst;
USE farmaciatst;

 
 
CREATE TABLE IF NOT EXISTS Farmacias (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  ubicacion VARCHAR(45) NULL,
  PRIMARY KEY (id));


 
 
CREATE TABLE IF NOT EXISTS Empleados (
  ci INT NOT NULL,
  id_farmacia INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  edad INT NULL,
  cargo VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  PRIMARY KEY (ci),
    FOREIGN KEY (id_farmacia)
    REFERENCES Farmacias (id));


 
 
CREATE TABLE IF NOT EXISTS Titulos (
  ci INT NOT NULL,
  universidad VARCHAR(45) NULL,
  fecha DATE NULL,
  n_registro INT NULL,
  p_sanitario INT NULL,
  n_colegiatura INT NULL,
  PRIMARY KEY (ci),
    FOREIGN KEY (ci)
    REFERENCES Empleados (ci));


 
 
CREATE TABLE IF NOT EXISTS Pasantias (
  ci INT NOT NULL,
  institucion VARCHAR(45) NULL,
  especialidad VARCHAR(45) NULL,
  f_inicio DATE NULL,
  f_final DATE NULL,
  n_permiso INT NULL,
  PRIMARY KEY (ci),
    FOREIGN KEY (ci)
    REFERENCES Empleados (ci));


 
 
CREATE TABLE IF NOT EXISTS Responsable (
  ci INT NOT NULL,
  ci_representante INT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  PRIMARY KEY (ci),
    FOREIGN KEY (ci)
    REFERENCES Pasantias (ci));


 
 
CREATE TABLE IF NOT EXISTS Invetarios (
  id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
    FOREIGN KEY (id)
    REFERENCES Farmacias (id));


 
 
CREATE TABLE IF NOT EXISTS Medicamentos (
  id INT NOT NULL AUTO_INCREMENT,
  monodroga VARCHAR(45) NULL,
  presentacion VARCHAR(45) NULL,
  accion VARCHAR(45) NULL,
  PRIMARY KEY (id));


 
 
CREATE TABLE IF NOT EXISTS Inventario_Medicamento (
  id INT NOT NULL AUTO_INCREMENT,
  id_inventario INT NOT NULL,
  id_medicamento INT NOT NULL,
  precio FLOAT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (id_medicamento)
    REFERENCES Medicamentos (id),
    FOREIGN KEY (id_inventario)
    REFERENCES Invetarios (id));


 
 
CREATE TABLE IF NOT EXISTS Laboratorios (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  PRIMARY KEY (id));


 
 
CREATE TABLE IF NOT EXISTS LaboratorioMedicamento (
  id INT NOT NULL AUTO_INCREMENT,
  id_medicamento INT NOT NULL,
  id_laboratorio INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (id_medicamento)
    REFERENCES Medicamentos (id),
    FOREIGN KEY (id_laboratorio)
    REFERENCES Laboratorios (id));


 
 
CREATE TABLE IF NOT EXISTS Pedidos (
  id INT NOT NULL AUTO_INCREMENT,
  id_farmacia INT NOT NULL,
  id_laboratorio INT NOT NULL,
  id_empleado INT NOT NULL,
  forma_pago VARCHAR(45) NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (id_farmacia)
    REFERENCES Farmacias (id),
    FOREIGN KEY (id_laboratorio)
    REFERENCES Laboratorios (id),
    FOREIGN KEY (id_empleado)
    REFERENCES Empleados (ci));


 
 
CREATE TABLE IF NOT EXISTS Compras (
  id INT NOT NULL AUTO_INCREMENT,
  forma_pago VARCHAR(45) NULL,
  id_farmacia INT NOT NULL,
  id_laboratorio INT NOT NULL,
  id_pedido INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (id_farmacia)
    REFERENCES Farmacias (id),
    FOREIGN KEY (id_laboratorio)
    REFERENCES Laboratorios (id),
    FOREIGN KEY (id_pedido)
    REFERENCES Pedidos (id));


 
 
CREATE TABLE IF NOT EXISTS Pedido_Medicamento (
  id INT NOT NULL AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_medicamento INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (id_pedido)
    REFERENCES Pedidos (id),
    FOREIGN KEY (id_medicamento)
    REFERENCES Medicamentos (id));


 
 
CREATE TABLE IF NOT EXISTS Compra_Medicamento (
  id INT NOT NULL AUTO_INCREMENT,
  id_compra INT NOT NULL,
  id_medicamento INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (id_compra)
    REFERENCES Compras (id),
    FOREIGN KEY (id_medicamento)
    REFERENCES Medicamentos (id));

