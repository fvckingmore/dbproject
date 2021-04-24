CREATE DATABASE IF NOT EXISTS `farmaciatst`;
USE `farmaciatst` ;

-- -----------------------------------------------------
-- Table `mydb`.`Famacias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Famacias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `ubicacion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Empleados` (
  `ci` INT NOT NULL,
  `id_farmacia` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `edad` INT NULL,
  `cargo` VARCHAR(45) NULL,
  `pasantia` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `Empleadoscol` VARCHAR(45) NULL,
  PRIMARY KEY (`ci`),
    FOREIGN KEY (`id_farmacia`)
    REFERENCES `farmaciatst`.`Famacias` (`id`);


-- -----------------------------------------------------
-- Table `mydb`.`Titulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Titulos` (
  `ci` INT NOT NULL,
  `universidad` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `n_registro` INT NULL,
  `p_sanitario` INT NULL,
  `n_colegiatura` INT NULL,
  PRIMARY KEY (`ci`),
    FOREIGN KEY (`ci`)
    REFERENCES `farmaciatst`.`Empleados` (`ci`);


-- -----------------------------------------------------
-- Table `mydb`.`Pasantias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Pasantias` (
  `ci` INT NOT NULL,
  `institucion` VARCHAR(45) NULL,
  `especialidad` VARCHAR(45) NULL,
  `f_inicio` DATE NULL,
  `f_final` DATE NULL,
  `n_permiso` INT NULL,
  PRIMARY KEY (`ci`),
    FOREIGN KEY (`ci`)
    REFERENCES `farmaciatst`.`Empleados` (`ci`);


-- -----------------------------------------------------
-- Table `mydb`.`Responsable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Responsable` (
  `ci` INT NOT NULL,
  `ci_representante` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`ci`),
    FOREIGN KEY (`ci`)
    REFERENCES `farmaciatst`.`Pasantias` (`ci`);


-- -----------------------------------------------------
-- Table `mydb`.`Invetarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Invetarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`id`)
    REFERENCES `farmaciatst`.`Famacias` (`id`);


-- -----------------------------------------------------
-- Table `mydb`.`Medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Medicamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monodroga` VARCHAR(45) NULL,
  `presentacion` VARCHAR(45) NULL,
  `accion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`Inventario_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Inventario_Medicamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_inventario` INT NOT NULL,
  `id_medicamento` INT NOT NULL,
  `precio` FLOAT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `farmaciatst`.`Medicamentos` (`id`),
    FOREIGN KEY (`id_inventario`)
    REFERENCES `farmaciatst`.`Invetarios` (`id`);


-- -----------------------------------------------------
-- Table `mydb`.`Laboratorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Laboratorios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`Laboratorio-Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Laboratorio-Medicamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_medicamento` INT NOT NULL,
  `id_laboratorio` INT NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `farmaciatst`.`Medicamentos` (`id`),
    FOREIGN KEY (`id_laboratorio`)
    REFERENCES `farmaciatst`.`Laboratorios` (`id`);


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_farmacia` INT NOT NULL,
  `id_laboratorio` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `forma_pago` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`id_farmacia`)
    REFERENCES `farmaciatst`.`Famacias` (`id`),
    FOREIGN KEY (`id_laboratorio`)
    REFERENCES `farmaciatst`.`Laboratorios` (`id`),
    FOREIGN KEY (`id_empleado`)
    REFERENCES `farmaciatst`.`Empleados` (`ci`);


-- -----------------------------------------------------
-- Table `mydb`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `forma_pago` VARCHAR(45) NULL,
  `id_farmacia` INT NOT NULL,
  `id_laboratorio` INT NOT NULL,
  `id_pedido` INT NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`id_farmacia`)
    REFERENCES `farmaciatst`.`Famacias` (`id`),
    FOREIGN KEY (`id_laboratorio`)
    REFERENCES `farmaciatst`.`Laboratorios` (`id`),
    FOREIGN KEY (`id_pedido`)
    REFERENCES `farmaciatst`.`Pedidos` (`id`);


-- -----------------------------------------------------
-- Table `mydb`.`Pedido_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Pedido_Medicamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_medicamento` INT NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`id_pedido`)
    REFERENCES `farmaciatst`.`Pedidos` (`id`),
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `farmaciatst`.`Medicamentos` (`id`);


-- -----------------------------------------------------
-- Table `mydb`.`Compra_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmaciatst`.`Compra_Medicamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_medicamento` INT NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`id_compra`)
    REFERENCES `farmaciatst`.`Compras` (`id`),
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `farmaciatst`.`Medicamentos` (`id`);

