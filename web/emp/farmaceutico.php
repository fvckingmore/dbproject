<head><link rel="stylesheet" href="../css/farmaceutico.css"></head>

<!--
<?php
	if(!empty($_GET)) {
		if($_GET["status"] == "ok") {
			echo "<h2>Registro agregrado correctamente</h2>";

		} else if($_GET["status"] == "error") {
			echo "<h2>Error al agregar registro</h2>";
		}
	}
	?>
-->

<div class="topnav">
	
	<a href="empleado.php">Empleado</a>
	<a href="news.asp">Inventario</a>
	<a href="contact.asp">Pedido</a>
	<a href="about.asp">Compra</a>
	
</div>

<form action="addfarm.php" method="post">
	<h2>Farmaceutico</h2>	
	<label>Cedula:</label>
  	<input type="text" name="ci" required>
  	<label>Farmacia:</label>
  	<input type="text" name="farmacia" required>
  	<label>Nombre:</label>
  	<input type="text" name="nombre" required>
  	<label>Apellido:</label>
  	<input type="text" name="apellido" required>
  	<label>Edad:</label>
  	<input type="text" name="edad" required>
  	<!--Cargo: Farmaceutico en BD-->
  	<label>Telefono:</label>
  	<input type="text" name="telefono" required>
	
	<h2>Titulo</h2>	
	<label>Univesidad:</label>
  	<input type="text" name="universidad" required>
  	<label>Fecha:</label>
	<input type="date" name="fecha">
  	<label>Numero Registro:</label>
  	<input type="text" name="registro" required>
  	<label>Permiso Sanitario:</label>
  	<input type="text" name="sanitario" required>
  	<label>Numero Colegiatura:</label>
  	<input type="text" name="colegiatura" required>
  	<input class="button" type="submit" value="Submit">
</form>

