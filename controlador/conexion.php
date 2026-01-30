<?php
$host = "localhost";
$dbname = "nutritec";     // Cambia por el nombre de tu BD
$user = "root";           // Usuario de MySQL
$pass = "#Toor1290";               // Contraseña (si tienes)

try {
    $conexion = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}
?>
