<?php include "Views/Templates/header.php"; ?>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active" style="color: #ffffff; font-family: 'Arial', sans-serif; font-size: 20px; text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);">
        Usuarios
    </li>
</ol>
<button class="btn btn-primary mb-2" type="button" onclick="frmUsuario();">Nuevo Registro <i class="fas fa-plus"></i></button>
<div class="table-responsive">
    <table class="table table-light" id="tblUsuarios">
        <thead class="thead-dark">
            <tr>
                <th>Id</th>
                <th>Usuario</th>
                <th>Nombre</th>
                <th>Correos</th>
                <th>Caja</th>
                <th>Roles</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        </tbody>
    </table>
</div>

<div id="nuevo_usuario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title text-white" id="title">Nuevo Usuario</h5>
                <button type="button" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" id="frmUsuarios">
                    <div class="form-group" id="usuarios">
                        <label for="usuario">Usuario</label>
                        <input type="hidden" id="id" name="id">
                        <input id="usuario" class="form-control" type="text" name="usuario" placeholder="Usuario" oninput="validateUsuarioInput(this)" maxlength="15">
                    </div>
                    <span id='errorUsuario' class="text-danger"></span>

                    <script>
                        function validateUsuarioInput(element) {
                            // Convertir a mayúsculas
                            element.value = element.value.toUpperCase();

                            // Eliminar caracteres especiales, números y espacios
                            element.value = element.value.replace(/[^A-Z]/g, '');

                            // Limitar a un máximo de 15 caracteres
                            if (element.value.length > 15) {
                                element.value = element.value.slice(0, 15);
                            }

                            // Validar longitud mínima
                            if (element.value.length < 2) {
                                element.setCustomValidity("El usuario debe tener al menos 2 caracteres.");
                                document.getElementById('errorUsuario').innerText = "El usuario debe tener al menos 2 caracteres.";
                            } else {
                                element.setCustomValidity("");
                                document.getElementById('errorUsuario').innerText = "";
                            }
                        }
                    </script>




                    <div class="form-group" id="nombres">
                        <label for="nombre">Nombre</label>
                        <input id="nombre" class="form-control" type="text" name="nombre" placeholder="Nombre del usuario" oninput="validateNombreInput(this)" maxlength="30">
                    </div>
                    <span id='errorNombre' class="text-danger"></span>

                    <script>
                        function validateNombreInput(element) {
                            // Convertir a mayúsculas
                            element.value = element.value.toUpperCase();

                            // Eliminar caracteres especiales y números, pero permitir espacios
                            element.value = element.value.replace(/[^A-Z\s]/g, '');

                            // Limitar a un máximo de 30 caracteres
                            if (element.value.length > 30) {
                                element.value = element.value.slice(0, 30);
                            }

                            // Validar longitud mínima
                            if (element.value.length < 2) {
                                element.setCustomValidity("El nombre debe tener al menos 2 caracteres.");
                                document.getElementById('errorNombre').innerText = "El nombre debe tener al menos 2 caracteres.";
                            } else {
                                element.setCustomValidity("");
                                document.getElementById('errorNombre').innerText = "";
                            }
                        }
                    </script>
                    <span id='errorNombre' class="text-danger"></span>


                    <div class="form-group" id="correos">
                        <label for="correo">Correo Electrónico</label>
                        <input id="correo" class="form-control" type="text" name="correo" placeholder="Correo electrónico" oninput="validateCorreoInput(this)" required>
                    </div>
                    <span id='errorCorreo' class="text-danger"></span>

                    <script>
                        function validateCorreoInput(element) {
                            // Eliminar espacios inmediatamente
                            element.value = element.value.replace(/\s/g, '');

                            // Definir la expresión regular para validar el correo
                            let validarCorreo = /^(?!.*(\w)\1{10})[a-zA-Z0-9_.%+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]{1,3}$/;

                            // Validar longitud mínima y máxima
                            let minLength = 5; // Mínimo 5 caracteres
                            let maxLength = 50; // Máximo 50 caracteres

                            if (element.value.length < minLength || element.value.length > maxLength) {
                                element.setCustomValidity(`El correo electrónico debe tener entre ${minLength} y ${maxLength} caracteres.`);
                                document.getElementById('errorCorreo').innerText = `El correo electrónico debe tener entre ${minLength} y ${maxLength} caracteres.`;
                            } else if (!validarCorreo.test(element.value)) {
                                element.setCustomValidity("El correo electrónico no es válido.");
                                document.getElementById('errorCorreo').innerText = "El correo electrónico no es válido o contiene caracteres repetidos consecutivamente más de 10 veces.";
                            } else {
                                element.setCustomValidity("");
                                document.getElementById('errorCorreo').innerText = "";
                            }
                        }
                    </script>



                    <div class="row" id="claves">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="clave">Contraseña</label>
                                <input id="clave" class="form-control" type="password" name="clave" placeholder="Contraseña" oninput="validatePasswordInput(this)" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="confirmar">Confirmar Contraseña</label>
                                <input id="confirmar" class="form-control" type="password" name="confirmar" placeholder="Confirmar contraseña" oninput="validatePasswordInput(this)" required>
                            </div>
                        </div>
                        <span id="errorPassword" class="text-danger"></span>

                        <script>
                            function validatePasswordInput(element) {
                                // Eliminar espacios en blanco al inicio y final
                                element.value = element.value.trim();

                                // Definir la longitud mínima y máxima para la contraseña
                                let minLength = 8; // Mínimo 8 caracteres
                                let maxLength = 20; // Máximo 20 caracteres

                                // Validar longitud de la contraseña
                                if (element.value.length < minLength || element.value.length > maxLength) {
                                    element.setCustomValidity(`La contraseña debe tener entre ${minLength} y ${maxLength} caracteres.`);
                                    document.getElementById('errorPassword').innerText = `La contraseña debe tener entre ${minLength} y ${maxLength} caracteres.`;
                                } else {
                                    element.setCustomValidity("");
                                    document.getElementById('errorPassword').innerText = "";
                                }

                                // Validar espacios en blanco
                                if (element.value.includes(' ')) {
                                    element.setCustomValidity("La contraseña no debe contener espacios en blanco.");
                                    document.getElementById('errorPassword').innerText = "La contraseña no debe contener espacios en blanco.";
                                } else {
                                    element.setCustomValidity("");
                                    document.getElementById('errorPassword').innerText = "";
                                }

                            }
                        </script>
                    </div>
                    <span id='errorClave' class="text-danger"></span>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group" id="cajas">
                                <label for="caja">Caja</label>
                                <select id="caja" class="input-group-text" name="caja">
                                    <option selected> Seleccionar </option>
                                    <?php foreach ($data['cajas'] as $row) {  ?>
                                        <option value="<?php echo $row['id']; ?>"><?php echo $row['caja']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group" id="roles">
                                <label for="caja">Rol</label>
                                <select id="rol" class="input-group-text" name="rol">
                                    <option selected> Seleccionar </option>
                                    <?php foreach ($data['roles'] as $row) {  ?>
                                        <option value="<?php echo $row['id']; ?>"><?php echo $row['rol']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>


                    </div>
                    <br>
                    <button class="btn btn-primary" type="submit" onclick="registrarUser(event);" id="btnAccion">Registrar</button>
                    <b-btn class="btn btn-danger" type="button" data-bs-dismiss="modal">Cancelar</b-btn>
            </div>
            </form>
        </div>
    </div>
</div>
</div>


<?php include "Views/Templates/footer.php"; ?>