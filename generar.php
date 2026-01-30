<?php
session_start();

if (!isset($_SESSION["user_id"])) {
    header("Location: inicio.html?msg=no_access");
    exit();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritec-Generar Dieta</title>
    <link rel="stylesheet" href="/css/styles.css">


</head>


<body class="generar">

    <header class="header">
        <a href="#" class="logo">Nutritec. <span class="animate" style="--e:1;"></span></a>

        <nav class="navbar">
            <a href="/generar.php" class="active">Conocenos</a>
            <a href="Nutritec.php">Inicio</a>
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
            <span class="animate" style="--i:2;"></span>
        </nav>

    </header>

    <section id="nuestras-dietas">
        <a href="#" class="logo">Nutritec. <span class="animate" style="--e:1;"></span></a>
        <div class="container-dietas">
            <h2>Conocenos</h2>
            <div class="programas">
                <div class="carta">
                    <h3>Como Funciona</h3>
                    <p> Nutritec es una herramienta que ayuda a los usuarios a mejorar 
                        en las nesesidades alimentarias generando y recomendando alimentos
                        saludables para los usuarios.
                    </p>
                    </div>  

                <div class="carta">
                    <h3>Conoce tu cuerpo</h3>
                    <p>  
                        NutriTec ofrece una calculadora de imc en el que puede evaluar el estado
                        saludable en el que te encuentras, como asi como recomendarte si nesesitas
                        dietas que te ayuden con la perdida o ganancia de peso.
                    </p>
                </div>

                <div class="carta">
                    <h3>Alimetos Saludables</h3>
                    <p>
                        Saber que alimentos son saludables es fundamental en el area de nutricion
                        y para ello <b>NutriTec</b> se encarga de generar dietas a base de una recopilacion
                        de datos para que se ajusten a los gustos de los usuarios.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section id="final">
        <h2>Para mas Informacion de herramientas de nutricion</h2><br><br>
        <form action="https://wellhub.com/es-mx/blog/bienestar-emocional/apps-de-nutricion-y-alimentacion-saludable/">
            <button>Iniciar</button>
        </form>
    </section>

    <footer>
        <div class="container-footer">
            <p>&copy; NutriTec  2024</p>
        </div>
    </footer>   
</body>
</html>