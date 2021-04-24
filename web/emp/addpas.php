<?php
	include_once("../tools/bd.php");
	include_once("../tools/functions.php");

	$ci = (int) $_POST["ci"];
	$farmacia = (int) $_POST["farmacia"];
	$nombre = strtolower($_POST["nombre"]);
	$apellido = strtolower($_POST["apellido"]);
	$edad = (int) $_POST["edad"];
	$cargo = "pasante";
	$telefono = strtolower($_POST["telefono"]);

	$institucion = strtolower($_POST["institucion"]);
	$especialidad = strtolower($_POST["especialidad"]);
	$inicio = $_POST["inicio"];
	$final = $_POST["final"];
	$permiso = (int) $_POST["permiso"];
	$minoria = empty($_POST["minoria"]) ? "false" : "true";
	if($minoria == "true") {
		$ci_r = (int) $_POST["ci_r"];
		$nombre_r = strtolower($_POST["nombre_r"]);
		$apellido_r = strtolower($_POST["apellido_r"]);
		$telefono_r = strtolower($_POST["telefono_r"]);
	}

	if($minoria == "true") {
		if(addEmpleado($ci, $farmacia, $nombre, $apellido, $edad, $cargo, $telefono) &&
		addPasantia($ci, $institucion, $especialidad, $inicio, $final, $permiso, $minoria) &&
		addResponsable($ci, $ci_r, $nombre_r, $apellido_r, $telefono_r)) {
			header('Location: pasante.php?status=ok');
			
		} else {
			header('Location: pasante.php?status=error');
		}

	} else {
		if(addEmpleado($ci, $farmacia, $nombre, $apellido, $edad, $cargo, $telefono) &&
		addPasantia($ci, $institucion, $especialidad, $inicio, $final, $permiso, $minoria)) {
			header('Location: pasante.php?status=ok');
			
		} else {
			header('Location: pasante.php?status=error');
		}
	}
?>