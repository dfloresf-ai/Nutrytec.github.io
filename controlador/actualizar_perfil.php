<?php
require "conexion.php";
session_start();


if (!isset($_SESSION["user_id"])) {
    header("Location: ../inicio.html?msg=no_access");
    exit();
}

$id = $_SESSION["user_id"];


$username = trim($_POST["username"] ?? "");
$email    = trim($_POST["email"] ?? "");
$password = trim($_POST["password"] ?? "");

if (empty($username) && empty($email) && empty($password)) {
    header("Location: ../perfil.php?msg=No%20hay%20cambios&type=error");
    exit();
}

    
if (!empty($email)) {
    $check = $conexion->prepare("SELECT id FROM usuarios WHERE email = ? AND id != ?");
    $check->execute([$email, $id]);

    if ($check->rowCount() > 0) {
        header("Location: ../perfil.php?msg=Correo%20ya%20en%20uso&type=error");
        exit();
    }
}

$campos = [];
$valores = [];

if (!empty($username)) {
    $campos[] = "username = ?";
    $valores[] = $username;

   
    $_SESSION["username"] = $username;
}

if (!empty($email)) {
    $campos[] = "email = ?";
    $valores[] = $email;
}

if (!empty($password)) {
    $hashed = password_hash($password, PASSWORD_BCRYPT);
    $campos[] = "password = ?";
    $valores[] = $hashed;
}


$valores[] = $id;


$sql = "UPDATE usuarios SET " . implode(", ", $campos) . " WHERE id = ?";

$stmt = $conexion->prepare($sql);
$stmt->execute($valores);

header("Location: ../perfil.php?msg=Datos%20actualizados%20correctamente&type=success");
exit();
