<?php
require "controlador/conexion.php";

$token = $_GET['token'] ?? '';

if (empty($token)) {
    die("Token inválido.");
}

$stmt = $conexion->prepare("SELECT id, reset_expiration FROM usuarios WHERE reset_token = ?");
$stmt->execute([$token]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user || strtotime($user['reset_expiration']) < time()) {
    die("El token ha expirado o es inválido.");
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Restablecer Contraseña</title>
</head>
<body>
<section class="reset">
    <h1>Restablecer Contraseña</h1>
    <form action="controlador/reset_password.php" method="POST">
        <input type="hidden" name="token" value="<?= htmlspecialchars($token) ?>">
        <label for="password">Nueva contraseña:</label>
        <input type="password" name="password" id="password" required>
        <label for="confirm_password">Confirmar contraseña:</label>
        <input type="password" name="confirm_password" id="confirm_password" required>
        <button type="submit">Actualizar contraseña</button>
    </form>
</section>
</body>
</html>
