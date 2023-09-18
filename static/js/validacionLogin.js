function validarFormulario() {
    const nombreUsuario = document.getElementById('nombre_usuario').value;
    const contrasena = document.getElementById('contrasena').value;
    
    if (nombreUsuario.trim() === '' || contrasena.trim() === '') {
        alert('Por favor, completa todos los campos.');
        return false;
    }

    return true;
}

document.addEventListener('DOMContentLoaded', function () {
    const formUsuario = document.querySelector('form[action="LoginUsuarioServlet"]');
    const formEmpleado = document.querySelector('form[action="LoginEmpleadoServlet"]');

    if (formUsuario) {
        formUsuario.addEventListener('submit', function (event) {
            if (!validarFormulario()) {
                event.preventDefault();
            }
        });
    }

    if (formEmpleado) {
        formEmpleado.addEventListener('submit', function (event) {
            if (!validarFormulario()) {
                event.preventDefault();
            }
        });
    }
});
