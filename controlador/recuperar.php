<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require "conexion.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST["email"]);

    $stmt = $conexion->prepare("SELECT id FROM usuarios WHERE email = ?");
    $stmt->execute([$email]);

    if ($stmt->rowCount() === 0) {
        die("Correo no existe en la base de datos.");
    }

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

  
    if (function_exists('random_bytes')) {
        $token = bin2hex(random_bytes(32));
    } else {
        $token = bin2hex(openssl_random_pseudo_bytes(32));
    }

    $expiracion = date("Y-m-d H:i:s", strtotime("+1 hour"));

    $stmt = $conexion->prepare("UPDATE usuarios SET reset_token = ?, reset_expiration = ? WHERE id = ?");
    $stmt->execute([$token, $expiracion, $user['id']]);

    echo "Token generado: <a href='/reset_password.php?token=$token'>Restablecer contraseña</a>";
}
?>
