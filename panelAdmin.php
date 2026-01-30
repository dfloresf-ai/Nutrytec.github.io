<?php
session_start();
require "controlador/conexion.php";

if (!isset($_SESSION["user_id"]) || $_SESSION["rol"] !== "admin") {
    header("Location: inicio.html?msg=no_access");
    exit();
}

$stmt = $conexion->prepare("SELECT id, username, email, rol FROM usuarios WHERE rol = 'usuario'");
$stmt->execute();
$usuarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Panel Admin</title>
    <link rel="stylesheet" href="/css/styles.css">
    <style>
        table {
            width: 85%;
            margin: 40px auto;
            border-collapse: collapse;
            background: white;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }
        th {
            background: #f4f4f4;
        }
        .btn-eliminar {
            background: #e63946;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-eliminar:hover {
            background: #c92d3b;
        }
    </style>
</head>
<body class="cuerpoAdmin">

<header class="header">
    <a href="#" class="logo">Nutritec. <span class="animate" style="--e:1;"></span></a>
    <nav class="navbar">
        <a href="#" class="active">Usuarios</a>
    </nav>
    <a class="btn sing-up" onclick="logout()">Cerrar Sesión <span class="animate" style="--i:3;"></span></a>
</header>

<script>
function logout() {
    window.location.href = "/controlador/logout.php";
}
</script>

<section class="panelAdmin">

    <div class="centerPanel">
        <h1>Panel de Administración</h1>
    <h2>Hola, <?php echo htmlspecialchars($_SESSION["username"]); ?> (Admin)</h2>
    <p>Aquí puedes gestionar usuarios, ver estadísticas, etc.</p>
    
    
    <div >
        <table class="tabla">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Rol</th>
            <th>Acción</th>
        </tr>
        <?php foreach($usuarios as $u): ?>
        <tr>
            <td><?= $u['id'] ?></td>
            <td><?= htmlspecialchars($u['username']) ?></td>
            <td><?= htmlspecialchars($u['email']) ?></td>
            <td><?= $u['rol'] ?></td>
            <td>
                <form method="POST" action="controlador/eliminar_usuarios.php" onsubmit="return confirm('¿Eliminar a este usuario?');">
                    <input type="hidden" name="id" value="<?= $u['id'] ?>">
                    <button type="submit" class="btn-eliminar">Eliminar</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
    </div>
    
</div>

</section>

</body>
</html>