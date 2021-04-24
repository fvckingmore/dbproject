<head>  
	<link rel="stylesheet" href="../css/empleado.css" type="text/css"/>
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


<form action="addmed.php" method="post" class="formEmpleado">
	<h2>Pedido</h2>	
		<select name="cargo[]" id=botonCargo>
			<option value="administrativo">Seleccionar...</option>
		</select><br>
		<label class="labelEmpleado">Farmacia:</label>

		<select name="cargo[]" id=botonCargo>
			<option value="administrativo">Seleccionar...</option>
		</select><br>
		<label class="labelEmpleado">Laboratorio:</label>

		<select name="cargo[]" id=botonCargo>
			<option value="administrativo">Seleccionar...</option>
		</select><br>
		<label class="labelEmpleado">Medicamento:</label>

		<input class="inputEmpleado" type="text" name="accion" required>
		<label class="labelEmpleado">Forma de pago:</label>


			<input class="submitEmpleado" type="submit" value="Añadir a pedido">
		<input class="submitEmpleado" type="submit" value="Realizar pedido">
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