document.addEventListener('DOMContentLoaded', function () {
    const btnAccion = document.querySelector('#btnAccion');
    const nueva_clave = document.querySelector('#nueva_clave');
    const confirmar_clave = document.querySelector('#confirmar_clave');
    const token = document.querySelector('#token');

    const validarContraseñalarga = /^.{8,}$/;
    const validarContraseñasegura = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$/;

    btnAccion.addEventListener('click', function () {
        const nueva = nueva_clave.value;
        const confirmar = confirmar_clave.value;

        if (!nueva || !confirmar) {
            mostrarMensaje('warning', 'Todos los campos con * son requeridos');
        } else if (!validarContraseñalarga.test(nueva)) {
            mostrarMensaje('error', 'Contraseña muy corta', 'La contraseña debe contener mínimo 8 caracteres.');
        } else if (!validarContraseñasegura.test(nueva)) {
            mostrarMensaje('error', 'Contraseña insegura', 'La contraseña debe tener mayúsculas, minúsculas, números y caracteres especiales.');
        } else if (nueva !== confirmar) {
            mostrarMensaje('warning', 'Las contraseñas no coinciden');
        } else {
            const url = base_url + 'principal/cambiarClave/';
            const params = {
                nueva: nueva,
                confirmar: confirmar,
                token: token.value
            };

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(params)
            })
            .then(response => response.json())
            .then(data => {
                if (data.type === 'success') {
                    mostrarMensaje('success', data.msg);
                    setTimeout(() => {
                        window.location.href = base_url;
                    }, 3000);
                } else {
                    mostrarMensaje('error', data.msg);
                }
            })
            .catch(error => {
                mostrarMensaje('error', 'Error al procesar la solicitud');
                console.error('Error:', error);
            });
        }
    });

    function mostrarMensaje(icon, title, text = '') {
        Swal.fire({
            icon: icon,
            title: title,
            text: text,
            showConfirmButton: false,
            timer: 2000,
            toast: true,
            position: 'top-right'
        });
    }
});
