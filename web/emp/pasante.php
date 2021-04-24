<head>	<link rel="stylesheet" href="../css/pasante.css" type="text/css"/>
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

<form action="addpas.php" method="post">
	<h2>Pasante</h2>	
	<input class="inputPasantia" type="text" name="ci" required>
	<label class="labelPasantia">Cedula</label>

	<input class="inputPasantia" type="text" name="farmacia" required>
	<label class="labelPasantia">Farmacia</label>

	<input class="inputPasantia" type="text" name="nombre" required>
	<label class="labelPasantia">Nombre</label>

	<input class="inputPasantia" type="text" name="apellido" required>
	<label class="labelPasantia">Apellido</label>

	
	<input class="inputPasantia" type="text" name="edad" required>
	<label class="labelPasantia">Edad</label>
	<!--Cargo: Farmaceutico en BD-->
	<input class="inputPasantia" id="inputTL" type="text" name="telefono" required>
	<label class="labelPasantia" id="tl">Telefono</label>
  

	<h2>Pasantia</h2> 
	
	<input class="inputPasantia" type="text" name="institucion" required>
	<label class="labelPasantia">Institucion</label>
	<input class="inputPasantia" type="text" name="especialidad" required>
	<label class="labelPasantia">Especialidad</label>

	<label class="ldate">Fecha Inicio</label>
	<input class="idate" type="date" name="inicio">
	<label class="ldate">Fecha Final</label>
	<input class="idate" type="date" name="final">

	<input class="inputPasantia" type="text" name="permiso" required>
	<label class="labelPasantia">Numero de permiso</label>

	<label >Minoria de edad</label>
	<input class="checkbox" type="checkbox" name="minoria" value="true" id="minoria" onclick="show()">

	<div id="oculto" style="display: none;">

		<h2>Responsable</h2> 
		<input class="inputPasantia" type="text" name="ci_r">
		<label class="labelPasantia">Cedula</label>

		<input class="inputPasantia" type="text" name="nombre_r">
		<label class="labelPasantia">Nombre</label>

		<input class="inputPasantia" type="text" name="apellido_r">
		<label class="labelPasantia">Apellido</label>

		<input class="inputPasantia" id="inputTl" type="text" name="telefono_r">
		<label class="labelPasantia" id="tl">Telefono</label>
		
	</div>

	<script type="text/javascript">
		function show() {
 			var x = document.getElementById("oculto");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
	</script>



	<input class="submit" type="submit" value="Submit">
</form>


<script>
	let doc = document.getElementsByClassName("inputPasantia")
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