<?php
	include_once("../tools/bd.php");
	include_once("../tools/functions.php");

	$ci = (int) $_POST["ci"];
	$farmacia = (int) $_POST["farmacia"];
	$nombre = strtolower($_POST["nombre"]);
	$apellido = strtolower($_POST["apellido"]);
	$edad = (int) $_POST["edad"];
	$cargo = "farmaceutico";
	$telefono = strtolower($_POST["telefono"]);

	$universidad = strtolower($_POST["universidad"]);
	$fecha = $_POST["fecha"];
	$registro = (int) $_POST["registro"];
	$sanitario = (int) $_POST["sanitario"];
	$colegiatura = (int) $_POST["colegiatura"];
	
	if(addEmpleado($ci, $farmacia, $nombre, $apellido, $edad, $cargo, $telefono) &&
	addTitulo($ci, $universidad, $fecha, $registro, $sanitario, $colegiatura)) {
		header('Location: farmaceutico.php?status=ok');
		
	} else {
		header('Location: farmaceutico.php?status=error');
	}
?>