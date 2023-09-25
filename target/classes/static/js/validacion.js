document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('registroClienteForm');

    form.addEventListener('submit', function (event) {
        event.preventDefault(); 
        const nombreCliente = document.getElementById('nombreCliente').value;
        const apellidoCliente = document.getElementById('ApellidoCliente').value;
        const dniCliente = document.getElementById('DniCliente').value;
        const correoCliente = document.getElementById('CorreoCliente').value;
        const telefonoCliente = document.getElementById('TelefonoCliente').value;
       
        if (validacionExitosa) {
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'url_del_backend', true);
            xhr.setRequestHeader('Content-Type', 'application/json');

            const data = JSON.stringify({
                nombre: nombreCliente,
                apellido: apellidoCliente,
                dni: dniCliente,
                correo: correoCliente,
                telefono: telefonoCliente,
            });

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        
                        console.log('Registro exitoso');
                    } else {
                       
                        console.error('Error en la solicitud al backend');
                    }
                }
            };

            xhr.send(data);
        }
    });
});