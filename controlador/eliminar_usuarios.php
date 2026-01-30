<?php
session_start();
require "conexion.php";


if (!isset($_SESSION["user_id"]) || $_SESSION["rol"] !== "admin") {
    header("Location: ../inicio.html?msg=no_access");
    exit();
}

$id = $_POST["id"] ?? 0;

if ($id > 0) {
    $stmt = $conexion->prepare("DELETE FROM usuarios WHERE id = ? AND rol = 'usuario'");
    $stmt->execute([$id]);
}

header("Location: ../panelAdmin.php?msg=usuario_eliminado");
exit();
?>
