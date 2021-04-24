<head>
	<link rel="stylesheet" href="..//css/empleado.css" type="text/css"/>	
</head>

<?php
	if(!empty($_GET)) {
		if($_GET["status"] == "ok") {
			echo "<h2>Registro agregrado correctamente</h2>";

		} else if($_GET["status"] == "error") {
			echo "<h2>Error al agregar registro</h2>";
		}
	}
?>



<div class="topnav">
	
	<a href="empleado.php">Empleado</a>
	<a href="news.asp">Inventario</a>
	<a href="contact.asp">Pedido</a>
	<a href="about.asp">Compra</a>
	
</div>

<form action="addemp.php" method="post" class="formEmpleado">
	<h2 class="titleEmpleado">Empleado</h2>	
	
	<input class="inputEmpleado" name="ci"required>
	<label class="labelEmpleado">Cedula de identidad</label>
	
	<input class="inputEmpleado" type="text" name="farmacia" required>
	<label class="labelEmpleado">Farmacia</label>
	
	<input class="inputEmpleado" type="text" name="nombre"  required>
	<label class="labelEmpleado">Nombre</label>
	
	<input class="inputEmpleado" type="text" name="apellido" required>
	<label class="labelEmpleado">Apellido</label>
	
	<input class="inputEmpleado" type="text" name="edad"  required>
	<label class="labelEmpleado">Edad</label>
	<!--Cargo: Farmaceutico en BD-->
	
	<input class="inputEmpleado" type="text" name="telefono" required>
	<label class="labelEmpleado">Telefono</label>

	
	<select name="cargo[]" id=botonCargo>
		<option value="administrativo">Administrativo</option>
		<option value="analista">Analista de compra</option>
		<option value="auxiliar">Auxiliar de farmacia</option>
		<option value="vigilante">Vigilante</option>
		<option value="cajero">Cajero</option>

	</select><br><br>
    <label class="labelEmpleado" id="Cargo">Cargo </label>
	<input class="submitEmpleado" type="submit" value="Submit">
</form>


<script>
	let doc = document.getElementsByClassName("inputEmpleado")
	for(let i=0 ; i < doc.length; i++){
		doc[i].addEventListener('keyup', function() {
			if(this.value.length>=1){
				this.nextElementSibling.classList.add("stop");
			}
			else{
				this.nextElementSibling.classList.remove("stop");
			}
		})
	}

</script>
