
CREATE TABLE compra_medicamento (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_compra int(11) NOT NULL,
  id_medicamento int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY id_compra (id_compra),
  KEY id_medicamento (id_medicamento),
  FOREIGN KEY (id_compra) REFERENCES compras (id),
  FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id)
);


CREATE TABLE compras (
  id int(11) NOT NULL AUTO_INCREMENT,
  forma_pago varchar(45) DEFAULT NULL,
  id_farmacia int(11) NOT NULL,
  id_laboratorio int(11) NOT NULL,
  id_pedido int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY id_farmacia (id_farmacia),
  KEY id_laboratorio (id_laboratorio),
  KEY id_pedido (id_pedido),
  FOREIGN KEY (id_farmacia) REFERENCES farmacias (id),
  FOREIGN KEY (id_laboratorio) REFERENCES laboratorios (id),
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
  KEY id_farmacia (id_farmacia),
  FOREIGN KEY (id_farmacia) REFERENCES farmacias (id)
);

CREATE TABLE farmacias (
  id int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(45) DEFAULT NULL,
  ubicacion varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE inventario_medicamento (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_medicamento int(11) NOT NULL,
  precio float DEFAULT NULL,
  cantidad int(11) NOT NULL,
  id_farmacia int(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_farmacia) REFERENCES farmacias (id),
  FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id)
);

CREATE TABLE invetarios (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES farmacias (id)
);

CREATE TABLE laboratoriomedicamento (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_medicamento int(11) NOT NULL,
  id_laboratorio int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY id_medicamento (id_medicamento),
  KEY id_laboratorio (id_laboratorio),
  FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id),
  FOREIGN KEY (id_laboratorio) REFERENCES laboratorios (id)
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
  monodroga varchar(45) DEFAULT NULL,
  presentacion varchar(45) DEFAULT NULL,
  accion varchar(45) DEFAULT NULL,
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
  PRIMARY KEY (ci),
  FOREIGN KEY (ci) REFERENCES empleados (ci)
);

CREATE TABLE pedido_medicamento (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_pedido int(11) NOT NULL,
  id_medicamento int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY id_pedido (id_pedido),
  KEY id_medicamento (id_medicamento),
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
  KEY id_farmacia (id_farmacia),
  KEY id_laboratorio (id_laboratorio),
  KEY id_empleado (id_empleado),
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