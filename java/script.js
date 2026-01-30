const container = document.querySelector('.container');
const registerBtn = document.querySelector('.register-btn');
const loginBtn = document.querySelector('.login-btn');

registerBtn.addEventListener('click', () =>{
    container.classList.add('active');
});

loginBtn.addEventListener('click', () =>{
    container.classList.remove('active');
});


// =======================
// EXPRESIONES REGULARES
// =======================
const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const regexPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+\-=]{6,}$/;
const regexUser = /^[A-Za-z0-9_]{4,16}$/;


// =======================
// VALIDACIÓN LOGIN
// =======================
document.getElementById("form-login").addEventListener("submit", function (e) {

    const email = document.getElementById("login-email").value.trim();
    const pass = document.getElementById("login-password").value.trim();
    const error = document.getElementById("login-error");

    // Limpia mensajes
    error.innerHTML = "";

    // Validación de email
    if (!regexEmail.test(email)) {
        error.innerHTML = "⚠️ Correo inválido.";
        e.preventDefault();
        return;
    }

    // Validación password
    if (!regexPassword.test(pass)) {
        error.innerHTML = "⚠️ La contraseña debe tener minimo 6 caracteres, incluir una letra y un número.";
        e.preventDefault();
        return;
    }
});


// =======================
// VALIDACIÓN REGISTRO
// =======================
document.getElementById("form-register").addEventListener("submit", function (e) {

    const username = document.getElementById("reg-username").value.trim();
    const email = document.getElementById("reg-email").value.trim();
    const pass = document.getElementById("reg-password").value.trim();
    const error = document.getElementById("register-error");

    // Limpia
    error.innerHTML = "";

    if (!regexUser.test(username)) {
        error.innerHTML = "⚠️ El usuario debe ser de 4-16 caracteres y solo letras, números o _.";
        e.preventDefault();
        return;
    }

    if (!regexEmail.test(email)) {
        error.innerHTML = "⚠️ Email inválido.";
        e.preventDefault();
        return;
    }

    if (!regexPassword.test(pass)) {
        error.innerHTML = "⚠️ Contraseña mínima de 6 caracteres, con letras y números.";
        e.preventDefault();
        return;
    }
});






/* Peril */
