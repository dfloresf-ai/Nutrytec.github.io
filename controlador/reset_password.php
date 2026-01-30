<?php
require "conexion.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $token = $_POST['token'];
    $password = $_POST['password'];
    $confirm = $_POST['confirm_password'];

    if ($password !== $confirm) {
        die("Las contraseñas no coinciden.");
    }

   
    $stmt = $conexion->prepare("SELECT id FROM usuarios WHERE reset_token = ? AND reset_expiration > NOW()");
    $stmt->execute([$token]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        die("Token inválido o expirado.");
    }

  
    $hashed = password_hash($password, PASSWORD_BCRYPT);
    $stmt = $conexion->prepare("UPDATE usuarios SET password = ?, reset_token = NULL, reset_expiration = NULL WHERE id = ?");
    $stmt->execute([$hashed, $user['id']]);

    echo "Contraseña actualizada correctamente. <a href='/inicio.html'>Inicia sesión</a>";
}
?>
