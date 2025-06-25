<?php include "Views/Templates/header.php"; ?>

<div class="card">
    <div class="card-header bg-dark text-white text-center fs-4">
        Gestión de Copias de Seguridad
    </div>

    <div class="card-body">
        <button class="btn btn-primary" onclick="crearCopia()">Crear Copia de Seguridad</button>
        <div class="table-responsive mt-3">
            <table class="table table-light" id="tablaCopias">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php include "Views/Templates/footer.php"; ?>
