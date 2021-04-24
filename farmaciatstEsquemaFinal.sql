CREATE TABLE compra_medicamento (
	id int(11) NOT NULL AUTO_INCREMENT,
	id_compra int(11) NOT NULL,
	id_medicamento int(11) NOT NULL,
	PRIMARY KEY (id),
		FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id),
		FOREIGN KEY (id_compra) REFERENCES compras (id)
);

CREATE TABLE compras (
	id int(11) NOT NULL AUTO_INCREMENT,
	id_pedido int(11) NOT NULL,
	vencimiento date NOT NULL,
	cancelado tinyint(1) NOT NULL,
	PRIMARY KEY (id),
		FOREIGN KEY (id_pedido) REFERENCES pedidos (id)
);

CREATE TABLE empleados (
	ci int(11) NOT NULL,
	id_farmacia int(11) NOT NULL,
	nombre varchar(45) DEFAULT NULL,
	apellido varchar(45) DEFAULT NULL,
	edad int(11) DEFAULT NULL,
	cargo varchar(45) DEFAULT NULL,
	telefono varchar(45) DEFAULT NULL,
	PRIMARY KEY (ci),
		FOREIGN KEY (id_farmacia) REFERENCES farmacias (id)
);

CREATE TABLE farmacias (
	id int(11) NOT NULL AUTO_INCREMENT,
	nombre varchar(45) DEFAULT NULL,
	ubicacion varchar(45) DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE inventario (
	id int(11) NOT NULL AUTO_INCREMENT,
	id_farmacia int(11) NOT NULL,
	id_medicamento int(11) NOT NULL,
	cantidad int(11) NOT NULL,
	PRIMARY KEY (id),
		FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id),
		FOREIGN KEY (id_farmacia) REFERENCES farmacias (id)
);

CREATE TABLE laboratorio_medicamento (
	id int(11) NOT NULL AUTO_INCREMENT,
	id_laboratorio int(11) NOT NULL,
	id_medicamento int(11) NOT NULL,
	PRIMARY KEY (id),
		FOREIGN KEY (id_laboratorio) REFERENCES laboratorios (id),
		FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id)
);

CREATE TABLE laboratorios (
	id int(11) NOT NULL AUTO_INCREMENT,
	nombre varchar(45) DEFAULT NULL,
	direccion varchar(45) DEFAULT NULL,
	telefono varchar(45) DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE medicamentos (
	id int(11) NOT NULL AUTO_INCREMENT,
	monodroga varchar(45) CHARACTER SET latin1 DEFAULT NULL,
	presentacion varchar(45) CHARACTER SET latin1 DEFAULT NULL,
	accion varchar(45) CHARACTER SET latin1 DEFAULT NULL,
	precio int(11) DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE pasantias (
	ci int(11) NOT NULL,
	institucion varchar(45) DEFAULT NULL,
	especialidad varchar(45) DEFAULT NULL,
	f_inicio date DEFAULT NULL,
	f_final date DEFAULT NULL,
	n_permiso int(11) DEFAULT NULL,
	minoria_edad tinyint(1) DEFAULT NULL,
	activo tinyint(1) DEFAULT NULL,
	PRIMARY KEY (ci),
	FOREIGN KEY (ci) REFERENCES empleados (ci)
);

CREATE TABLE pedido_medicamento (
	id int(11) NOT NULL AUTO_INCREMENT,
	id_pedido int(11) NOT NULL,
	id_medicamento int(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_pedido) REFERENCES pedidos (id),
	FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id)
);

CREATE TABLE pedidos (
	id int(11) NOT NULL AUTO_INCREMENT,
	id_farmacia int(11) NOT NULL,
	id_laboratorio int(11) NOT NULL,
	id_empleado int(11) NOT NULL,
	forma_pago varchar(45) DEFAULT NULL,
	PRIMARY KEY (id),
		FOREIGN KEY (id_farmacia) REFERENCES farmacias (id),
		FOREIGN KEY (id_laboratorio) REFERENCES laboratorios (id),
		FOREIGN KEY (id_empleado) REFERENCES empleados (ci)
);

CREATE TABLE responsable (
	ci int(11) NOT NULL,
	ci_representante int(11) DEFAULT NULL,
	nombre varchar(45) DEFAULT NULL,
	apellido varchar(45) DEFAULT NULL,
	telefono varchar(45) DEFAULT NULL,
	PRIMARY KEY (ci),
		FOREIGN KEY (ci) REFERENCES pasantias (ci)
);

CREATE TABLE titulos (
	ci int(11) NOT NULL,
	universidad varchar(45) DEFAULT NULL,
	fecha date DEFAULT NULL,
	n_registro int(11) DEFAULT NULL,
	p_sanitario int(11) DEFAULT NULL,
	n_colegiatura int(11) DEFAULT NULL,
	PRIMARY KEY (ci),
		FOREIGN KEY (ci) REFERENCES empleados (ci)
);