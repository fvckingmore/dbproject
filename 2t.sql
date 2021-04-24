CREATE DATABASE m2t;
USE 2t;

CREATE TABLE IF NOT EXISTS farmacia (
  ciudad VARCHAR(25) NOT NULL,
  tamano INT NULL,
  rif INT NULL,
  PRIMARY KEY (ciudad));



CREATE TABLE IF NOT EXISTS titulo (
  nroRegistro INT NOT NULL,
  universidad VARCHAR(45) NULL,
  fecha VARCHAR(45) NULL,
  nroPermisoSanitario VARCHAR(45) NULL,
  nroColegiatura VARCHAR(45) NULL,
  PRIMARY KEY (nroRegistro));



CREATE TABLE IF NOT EXISTS representante (
  ci INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  nroPermiso VARCHAR(45) NULL,
  PRIMARY KEY (ci));



CREATE TABLE IF NOT EXISTS pasante (
  idpasante INT NOT NULL,
  representante_ci INT NOT NULL,
  universidad VARCHAR(45) NULL,
  especialidad VARCHAR(45) NULL,
  fechaI VARCHAR(45) NULL,
  fechaF VARCHAR(45) NULL,
  PRIMARY KEY (idpasante),
    FOREIGN KEY (representante_ci)
    REFERENCES representante (ci));


CREATE TABLE IF NOT EXISTS empleado (
  ci INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  cargo VARCHAR(45) NULL,
  edad INT NULL,
  farmacia_ciudad VARCHAR(45) NOT NULL,
  titulo_nroRegistro INT NOT NULL,
  pasante_idpasante INT NOT NULL,
  PRIMARY KEY (ci),
    FOREIGN KEY (farmacia_ciudad) REFERENCES farmacia (ciudad),
    FOREIGN KEY (titulo_nroRegistro) REFERENCES titulo (nroRegistro),
    FOREIGN KEY (pasante_idpasante) REFERENCES pasante (idpasante));



CREATE TABLE IF NOT EXISTS laboratorio (
  nombre VARCHAR(25) NOT NULL,
  direccion VARCHAR(45) NULL,
  tlf VARCHAR(45) NULL,
  rif VARCHAR(45) NULL,
  PRIMARY KEY (nombre));


CREATE TABLE IF NOT EXISTS pedido (
  nroP INT NOT NULL AUTO_INCREMENT,
  cantidadP INT NULL,
  farmacia_ciudad INT NOT NULL,
  laboratorio_nombre VARCHAR(25) NOT NULL,
  empleado_ci INT NOT NULL,
  PRIMARY KEY (nroP),
    FOREIGN KEY (farmacia_ciudad)
    REFERENCES farmacia (ciudad),
    FOREIGN KEY (laboratorio_nombre)
    REFERENCES laboratorio (nombre),
    FOREIGN KEY (empleado_ci)
    REFERENCES empleado (ci));



CREATE TABLE IF NOT EXISTS medicamento (
  nombre VARCHAR(30) NOT NULL,
  componente VARCHAR(45) NULL,
  monodroga VARCHAR(45) NULL,
  presentacion VARCHAR(45) NULL,
  accionTerapeutica VARCHAR(45) NULL,
  precio INT NULL,
  PRIMARY KEY (nombre));



CREATE TABLE IF NOT EXISTS compra (
  idcompra INT NOT NULL AUTO_INCREMENT,
  cantMedEntreg INT NULL,
  montoApagar INT NULL,
  farmacia_ciudad INT NOT NULL,
  laboratorio_nombre VARCHAR(25) NOT NULL,
  pedido_nroP INT NOT NULL,
  PRIMARY KEY (idcompra),
    FOREIGN KEY (farmacia_ciudad)
    REFERENCES farmacia (ciudad),
    FOREIGN KEY (laboratorio_nombre)
    REFERENCES laboratorio (nombre),
    FOREIGN KEY (pedido_nroP)
    REFERENCES pedido (nroP));


CREATE TABLE IF NOT EXISTS inv_med (
  id INT NOT NULL AUTO_INCREMENT,
  cantidad INT NULL,
  inventario_id INT NOT NULL,
  medicamento_nombre VARCHAR(30) NOT NULL,
  farmacia_ciudad VARCHAR(25) NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (medicamento_nombre)
    REFERENCES medicamento (nombre),
    FOREIGN KEY (farmacia_ciudad)
    REFERENCES farmacia (ciudad));



CREATE TABLE IF NOT EXISTS ped_med (
  id INT NOT NULL AUTO_INCREMENT,
  pedido_nroP INT NOT NULL,
  medicamento_nombre VARCHAR(30) NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (pedido_nroP)
    REFERENCES pedido (nroP),
    FOREIGN KEY (medicamento_nombre)
    REFERENCES medicamento (nombre));



CREATE TABLE IF NOT EXISTS com_med (
  id INT NOT NULL AUTO_INCREMENT,
  medicamento_nombre VARCHAR(30) NOT NULL,
  compra_idcompra INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (medicamento_nombre)
    REFERENCES medicamento (nombre),
    FOREIGN KEY (compra_idcompra)
    REFERENCES compra (idcompra));


CREATE TABLE IF NOT EXISTS lab_med (
  id INT NOT NULL AUTO_INCREMENT,
  laboratorio_nombre VARCHAR(25) NOT NULL,
  medicamento_nombre VARCHAR(30) NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (laboratorio_nombre)
    REFERENCES laboratorio (nombre),
    FOREIGN KEY (medicamento_nombre)
    REFERENCES medicamento (nombre));


