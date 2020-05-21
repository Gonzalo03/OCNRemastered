<?php

require_once('conexion.php');

$codPtr = $_POST['codPtr'];
$serie = $_POST['serie'];
$marca = $_POST['marca'];
$modelo = $_POST['modelo'];
$ofiArea = $_POST['ofiArea'];
$obserAnota = $_POST['obserAnota'];

$consulta = "INSERT INTO pc VALUES ('".$codPtr."', '".$serie."', '".$marca."', '".$modelo."', '".$ofiArea."', '".$obserAnota."')";
mysqli_query($conexion, $consulta) or die (mysqli_error());
mysqli_close();

?>