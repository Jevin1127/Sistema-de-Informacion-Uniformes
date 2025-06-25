/*!
    * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2023 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});

function removeSpaces(element) {
    element.value = element.value.replace(/\s+/g, '');
}

const iconEye = document.querySelector(".icon-eye")

iconEye.addEventListener("click", function() {
    const icon = this.querySelector("i");
    const togglePassword = document.querySelector('#togglePassword');

    if (this.nextElementSibling.type === "password") {
        // Cambia el tipo de input a "text"
        this.nextElementSibling.type = "text";

        togglePassword.classList.remove('fa-eye');
        togglePassword.classList.add('fa-eye-slash');
    } else {
        // Cambia el tipo de input a "password"
        this.nextElementSibling.type = "password";

        togglePassword.classList.remove('fa-eye-slash');
        togglePassword.classList.add('fa-eye');
    }
});

function validateInput(element) {
    // Convertir a mayúsculas
    element.value = element.value.toUpperCase();

    // Eliminar caracteres especiales, números y espacios
    element.value = element.value.replace(/[^A-Z]/g, '');

    // Limitar a un máximo de 20 caracteres
    if (element.value.length > 20) {
        element.value = element.value.slice(0, 20);
    }

    // Validar longitud mínima
    if (element.value.length < 4) {
        element.setCustomValidity("El usuario debe tener al menos 4 caracteres.");
    } else {
        element.setCustomValidity("");
    }
}

