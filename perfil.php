<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario</title>
        <link rel="stylesheet" href="/css/perfil.css">
           

        <?php
session_start();

if (!isset($_SESSION["user_id"])) {
    header("Location: inicio.html?msg=no_access");
    exit();
}
?>


</head>
<body>

<div class="profile-container">
    <h2>Perfil de Usuario</h2>

    <?php if (isset($_GET["msg"])): ?>
    <div class="msg <?= $_GET["type"] ?>">
        <?= htmlspecialchars($_GET["msg"]) ?>
    </div>
    <?php endif; ?>


    <form action="controlador/actualizar_perfil.php" method="POST">

        <label>Nuevo Username</label>
        <input type="text" name="username" placeholder="Escribe tu username">

        <label>Nuevo Email</label>
        <input type="email" name="email" placeholder="Escribe tu email">

        <label>Nueva Contraseña</label>
        <input type="password" name="password" placeholder="Nueva contraseña">

        <button type="submit">Guardar Cambios</button>
    </form>

    <button class="logout" onclick="logout()">Cerrar Sesión</button>
</div>

<script>
    function logout() {
        window.location.href = "/controlador/logout.php";
    }
</script>

</body>
</html>
