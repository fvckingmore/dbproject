<?php
	include_once("../tools/bd.php");
	include_once("../tools/functions.php");

	$ci = (int) $_POST["ci"];
	$farmacia = (int) $_POST["farmacia"];
	$nombre = strtolower($_POST["nombre"]);
	$apellido = strtolower($_POST["apellido"]);
	$edad = (int) $_POST["edad"];
	$cargo = $_POST["cargo"];
	$telefono = strtolower($_POST["telefono"]);
	if(addEmpleado($ci, $farmacia, $nombre, $apellido, $edad, $cargo[0], $telefono)) {
		header('Location: empleado.php?status=ok');
		
	} else {
		header('Location: empleado.php?status=error');
	}
?>