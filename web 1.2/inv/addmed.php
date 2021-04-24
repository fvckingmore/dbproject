<?php
	include_once("../tools/bd.php");
	include_once("../tools/functions.php");

	$monodroga = strtolower($_POST["monodroga"]);
	$presentacion = strtolower($_POST["presentacion"]);
	$accion = strtolower($_POST["accion"]);
	$laboratorio = strtolower($_POST["laboratorio"]);
	if(addMedicamento($monodroga, $presentacion, $accion, $laboratorio)) {
		header('Location: medicamentos.php?status=ok');
		
	} else {
		header('Location: medicamentos.php?status=error');
	}
?>