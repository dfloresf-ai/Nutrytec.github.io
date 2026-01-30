    <?php
session_start();

if (!isset($_SESSION["user_id"])) {
    header("Location: inicio.html?msg=no_access");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
        <meta http-equiv="Content-Security-Policy" content="default-src 'self';">
        <title> NutriTec </title>  
        <link rel="stylesheet" href="/css/styles.css"> 





    </head>

    <body class="inicio">
    
        <div class="profile-container">
    <h2>Perfil de Usuario</h2>


        <header class="header">
        <a href="#" class="logo">Nutritec. <span class="animate" style="--e:1;"></span></a>

        <nav class="navbar">
            <a href="Nutritec.php" class="active">Inicio</a>
            <a href="generar.php">Conocenos</a>
            <a href="perfil.php">Ver Perfil</a>
            <a href="#"></a>
            <a href="#"></a>
            <span class="animate" style="--i:2;"></span>
        </nav>

    </header>

    <section class="Nutri">
        <span class="animate bg"></span>
        
        <div class="home-content">

        <section id="nutri2">
            <div class="container-nutri">
                <h4> Beneficios de la nutricion </h4>
                    <div class="container-card">
                        <div class="card">
                            <p>
                                Una buena alimentación ofrece numerosos beneficios para la salud física y mental, como reducir el riesgo de enfermedades crónicas como diabetes, enfermedades cardíacas y algunos tipos de cáncer, proporcionar la energía necesaria para el día a día, mejorar el rendimiento intelectual y el estado de ánimo, y fortalecer el sistema inmunitario y los huesos. Además, contribuye a mantener un peso saludable y mejora la calidad de vida en general. 

                            </p>

                            <div class="btnNutri">
                                <a href="#" class="btn">Saber mas</a>
                                <a href="#" class="btn">Iniciar</a>
                                <span class="animate" style="--i:8;"></span>
                            </div>
                            
                        </div>
                 </div>
            </div>
        </section>

        </div>
    </section>


                <footer>
                    <div class="container-footer">
                        <p>&copy; NutriTec  2024</p>
                    </div>
                </footer>
    

    </body>
    

</html>