<?php
require "conexion.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: ../inicio.html?msg=method_not_allowed");
    exit();
}

$action = $_POST["action"] ?? "";


if ($action === "register") {

    $username = trim($_POST["username"]);
    $email    = trim($_POST["email"]);
    $password = trim($_POST["password"]);

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        header("Location: ../inicio.html?msg=error_registro");
        exit();
    }

    
    $passwordHash = password_hash($password, PASSWORD_BCRYPT);

    
    $rol = "usuario";


    $stmt = $conexion->prepare("INSERT INTO usuarios (username, email, password, rol) VALUES (?, ?, ?, ?)");
    $ok = $stmt->execute([$username, $email, $passwordHash, $rol]);

    if ($ok) {
        header("Location: ../inicio.html?msg=registro_ok");
    } else {
        header("Location: ../inicio.html?msg=error_registro");
    }
    exit();
}



if ($action === "login") {

    $email    = trim($_POST["email"]);
    $password = trim($_POST["password"]);

    $stmt = $conexion->prepare("SELECT * FROM usuarios WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user || !password_verify($password, $user["password"])) {
        header("Location: ../inicio.html?msg=error_login");
        exit();
    }


    $_SESSION["user_id"] = $user["id"];
    $_SESSION["username"] = $user["username"];
    $_SESSION["rol"] = $user["rol"];

    if ($user["rol"] === "admin") {
    header("Location: ../panelAdmin.php?msg=login_ok");
} else {
    header("Location: ../Nutritec.php?msg=login_ok");
}
    exit();
}

?>

