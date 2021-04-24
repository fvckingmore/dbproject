<?php
	if(!empty($_GET)) {
		if($_GET["status"] == "ok") {
			echo "<h2>Registro agregrado correctamente</h2>";

		} else if($_GET["status"] == "error") {
			echo "<h2>Error al agregar registro</h2>";
		}
	}
	?>

<form action="addmed.php" method="post">
	<h2>Medicamento</h2>	
  	<label>Monodroga:</label>
  	<input type="text" name="monodroga" required><br><br>
  	<label>Presentacion:</label>
  	<input type="text" name="presentacion" required><br><br>
  	<label>Accion:</label>
    <input type="text" name="accion" required><br><br>
    <label>Laboratorio:</label>
  	<input type="text" name="laboratorio" required><br><br>
    <input type="submit" value="Submit">
</form>

