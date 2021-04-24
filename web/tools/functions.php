<?php
	include_once("bd.php");

	function conectar() {
		return mysqli_connect(hostname,username,password,dbname);
	}

	function addEmpleado($ci, $farmacia, $nombre, $apellido, 
	$edad, $cargo, $telefono) {
		$link = conectar();
		$table = "empleados";
		if (!$link) {
      		die("Connection failed: " . mysqli_connect_error());
		}

		$sql = "INSERT INTO $table (ci, id_farmacia, nombre, apellido, edad, cargo, telefono) VALUES ($ci, $farmacia, '$nombre', '$apellido', $edad, '$cargo', '$telefono')";
		$result = mysqli_query($link, $sql); 
		mysqli_close($link);
		if($result) {
			return true;

		} else {
			return false;
		}
	}

	function addTitulo($ci, $universidad, $fecha, 
	$registro, $sanitario, $colegiatura ) {
		$link = conectar();
		$table = "titulos";
		if (!$link) {
      		die("Connection failed: " . mysqli_connect_error());
		}

		$sql = "INSERT INTO $table (ci, universidad, fecha, n_registro, p_sanitario, n_colegiatura) VALUES ($ci, '$universidad', '$fecha', $registro, $sanitario, $colegiatura)";
		$result = mysqli_query($link, $sql); 
		mysqli_close($link);
		if($result) {
			return true;

		} else {
			return false;
		}
	}

	function addPasantia($ci, $institucion, $especialidad, 
	$inicio, $final, $permiso, $minoria) {
		$link = conectar();
		$table = "pasantias";
		if (!$link) {
      		die("Connection failed: " . mysqli_connect_error());
		}

		$sql = "INSERT INTO $table (ci, institucion, especialidad, f_inicio, f_final, n_permiso, minoria_edad) VALUES ($ci, '$institucion', '$especialidad', '$inicio', '$final', $permiso, $minoria)";
		$result = mysqli_query($link, $sql); 
		mysqli_close($link);
		if($result) {
			return true;

		} else {
			return false;
		}
	}

	function addResponsable($ci, $ci_r, $nombre, $apellido, $telefono) {
		$link = conectar();
		$table = "responsable";
		if (!$link) {
      		die("Connection failed: " . mysqli_connect_error());
		}

		$sql = "INSERT INTO $table (ci, ci_representante,nombre,apellido,telefono) VALUES ($ci, $ci_r, '$nombre', '$apellido', '$telefono')";
		$result = mysqli_query($link, $sql); 
		mysqli_close($link);
		if($result) {
			return true;

		} else {
			return false;
		}
	}

	function addMedicamento($monodroga, $presentacion, $accion, $laboratorio) {
		$link = conectar();
		$table1 = "medicamentos";
		$table2 = "laboratoriomedicamento";
		if (!$link) {
      		die("Connection failed: " . mysqli_connect_error());
		}

		$result = mysqli_query($link, "SELECT id FROM laboratorios WHERE nombre='$laboratorio'");
		$row = mysqli_fetch_array($result);
		$lab = $row['id'];
		$sql = "INSERT INTO $table1 (monodroga, presentacion, accion) VALUES ('$monodroga', '$presentacion', '$accion')"; 


		if(mysqli_multi_query($link, $sql)) {
			$result = mysqli_query($link, "SELECT id FROM medicamentos WHERE monodroga='$monodroga' AND presentacion='$presentacion'");
			$row = mysqli_fetch_array($result);
			$med = $row['id'];
			$sql2 = "INSERT INTO $table2 (id_laboratorio, id_medicamento) VALUES ($lab, $med)";
			if(mysqli_multi_query($link, $sql2)) {
				return true;
			}
		}

		return false;
	}
?>