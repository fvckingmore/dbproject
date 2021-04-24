# ENTIDADES

- Farmacia
- Empleado
- Titulo
- Pasantia
- Responsable

<hr>

- Inventario
- Medicamento
- Laboratorio

<hr>

- Pedido
- Compra

# LENGUAJE SEMANTICO

- Farmacia (Empleado, Titulo, Pasantia, Responsable, Inventario, Medicamento, Laboratorio, Pedido, Compra)
- Empleado (Titulo, Pasantia, Responsable, Inventario, Medicamento, Laboratorio, Pedido, Compra)
- Titulo (Pasantia, Responsable, Inventario, Medicamento, Laboratorio, Pedido, Compra)
- Pasantia (Respnsable, Inventario, Medicamento, Laboratorio, Pedido, Compra)
- Responsable (Invetario, MEdicamento, Laboratorio, Pedido, Compra)
- Inventario (Medicamento, Laboratorio, Pedido, Compra)
- Medicamento (Laboratorio, Pedido, Compra)
- Laboratorio (Pedido, Compra)
- Pedido (Compra)
- Compra

|DUO|RELACION|
|---|---|
|Farmacia - Empleado|U-M|
|Farmacia - Inventario|U-M|
|Farmacia - Pedido|M-U|
|Farmacia - Compra|M-U|
|Empleado - Titulo|U-U|
|Empleado - Pasantia|U-U|
|Empleado - Pedido|U-U|
|Pasantia - Responsable|U-U|
|Invetario - Medicamento|M-M|
|Medicamento - Laboratorio|M-M|
|Medicamento - Pedido|M-M|
|Medicamento - Compra|M-M|
|Laboratorio - Pedido|M-U|
|Laboratorio - Compra|M-U|
|Pedido - Compra|U-U|

- Una **farmacia** *trabajan* muchos **empleados** 
	- Un **Empleado** *trabaja* en una **Farmacia**
- Una **farmacia** *posee* un **inventario**
	- Un **inventario** *existe* en una **farmacia**
- Una **farmacia** *genera* muchos **pedido**
	+ Un **pedido** es *generado* por una **farmacia** 
- Una **farmacia** *realiza* muchas **compras** 
	+ Una **compra** es *realizada* por una **farmacia**
- Un **empleado** *tiene* un **titulo**
	- Un **titulo** *pertenece* a un **empleado**
- Un **empleado** *tiene* una **pasantia**
	- Una **pasantia** *pertenece* a un **empleado**
- Un **empleado** se *encarga* de muchos **pedidos**
	+ Un **pedido** es *encargado* por un **empleado** 
- Una **pasantia** *tiene* un **representante** 
	- Un **representante** *pertenece* a una **pasantia**
- Un **invetario** *posee* muchos **medicamentos**  
	- Un **medicamento** *pertenece* a muchos **inventarios**
- Un **medicamento** *pertenece* a muchos **laboratorio**
	+ Un **laboratorio** *tiene* muchos **medicamentos** 
- Un **medicamento** es *requerido* en muchos **pedidos**  
	+ Un **pedido** *requiere* muchos **medicamentos**
- Un **medicamento** es *requerido* en muchas **compras**
	+ Una **compra** *requiere* muchos **medicamentos**
- Un **laboratorio** *recibe* muchos **pedidos**
	+ Un **pedido** es *recibido* en un **laboratorio** 
- Un **laboratorio** *recibe* muchas **compras**
	+ Una **compra** es *recibida* por un **laboratorio**
- Un **pedido** *genera* una **compra**
	+ Una **compra** es *generada* por un **pedido**


# Atributos

|Entidad|Atibutos|
|---|---|
|Farmacia|- ID(PK)<br>- Nombre<br>- Ubicacion|
|Empleado|- CI(PK)<br>- Nombre<br>- Apellido<br>- Edad<br>- Cargo<br>- Titulo<br>- Pasantia<br>- Telefono|
|Titulo|- ID(PK)<br>- Universidad<br>- Fecha<br>- n_Registro<br>- p_Sanitario<br>- n_Colegiatura|
|Pasantia|- ID(PK)<br>- Institucion<br>- Especialidad<br>- Fecha_Inicio<br>- Fecha_Final<br>- Numero_Permiso<br>- Representante|
|Respnsable|- CI(PK)<br>- Nombre<br>- Apellido<br>- Telefono|
|Inventario|- ID(PK)<br>- Precio<br>- Nombre|
|Medicamento|- ID(PK)<br>- Monodroga<br>- Presentacion<br>- Laboratorio<br>- Accion_Terapeutica|
|Laboratorio|- ID(PK)<br>- Nombre<br>- Direccion<br>- Telefono|
|Pedido|- ID(PK)<br>- Forma_Pago|
|Compra|- ID(PK)<br>- Forma_Pago|