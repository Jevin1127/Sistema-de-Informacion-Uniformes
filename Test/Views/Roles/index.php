<?php include "Views/Templates/header.php"; ?>
<script src="<?php echo base_url; ?>Assets/js/sweetalert2.all.min.js"></script>
<style>
.btn-outline-primary {
    display: flex;
    align-items: center;
    padding: 5px 10px;
    font-size: 0.875rem;
}

.btn-outline-primary input[type="checkbox"] {
    margin-right: 5px;
    width: 16px;
    height: 16px;
}

</style>

<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active" style="color: #ffffff; font-family: 'Arial', sans-serif; font-size: 20px; text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);">
        Roles
    </li>
</ol>
<button class="btn btn-primary mb-2" type="button" onclick="frmRol();">Nuevo Registro <i class="fas fa-plus"></i></button>
<div class="table-responsive">
    <table class="table table-light" id="tblRoles">
        <thead class="thead-dark">
            <tr>
                <th>Id</th>
                <th>Roles</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        </tbody>
    </table>
</div>

<div id="nuevo_rol" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document"> <!-- Añadido modal-lg para hacerlo más grande -->
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title text-white" id="title">Nuevo Rol</h5>
                <button type="button" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" id="frmRol">
                <div class="form-floating mb-3">
                            <input class="form-control" id="rol" name="rol" type="text" placeholder="Ingrese Rol" oninput="validateInput(this)" maxlength="15" />
                            <label for="rol">Ingrese Rol</label>
                            <input type="hidden" id="id" name="id">
                            <div id="errorNombre" class="text-danger"></div>
                        </div>
                    <div class="form-group"> <!-- Mover el label y el hr dentro del form-group -->
                        <center><label for="permisos"><i class="fas fa-key"></i> Permisos <span class="text-danger">*</span></label></center>
                        <hr>
                    </div>
                    <div class="container-fluid"> <!-- Cambiado container por container-fluid para ocupar todo el ancho -->
                        <div class="row">
                            <?php foreach ($data['permisos'] as $permiso) { ?>
                                <div class="col-md-6">
                                    <label class="btn btn-outline-primary d-flex align-items-center">
                                        <input type="checkbox" name="permisos[]" value="<?php echo $permiso['permiso'] ?>"> <?php echo $permiso['permiso'] ?> <!-- Usar el nombre del permiso -->
                                    </label>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="button" onclick="registrarRol(event);" id="btnAccionRol">Registrar</button>
                    <button class="btn btn-danger" type="button" data-bs-dismiss="modal">Cancelar</button> <!-- Cambiado b-btn por button -->
                </form>
            </div>
        </div>
    </div>
</div>

<script>
        function validateInput(element) {
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
                element.setCustomValidity("El rol debe tener al menos 2 caracteres.");
            } else {
                element.setCustomValidity("");
            }
        }

    </script>

<?php include "Views/Templates/footer.php"; ?>