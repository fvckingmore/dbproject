<head>  <link rel="stylesheet" href="../css/pasante.css" type="text/css"/>
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

<form action="addmed.php" method="post">
	<h2>Medicamento</h2>	
    <input class="inputPasantia" type="text" name="monodroga" required>
  	<label class="labelPasantia">Monodroga:</label>

    <input class="inputPasantia" type="text" name="presentacion" required>
  	<label class="labelPasantia">Presentacion:</label>

    <input class="inputPasantia" type="text" name="accion" required>
  	<label class="labelPasantia">Accion:</label>

    <input class="inputPasantia" type="text" name="laboratorio" required>
    <label class="labelPasantia">Laboratorio:</label>
    
    <input class="inputPasantia" type="submit" value="Agrear a inventario">
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
