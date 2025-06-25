<?php include "Views/Templates/header.php"; ?>

<div class="card">
    <div class="card-body">

        <hr>
        <div class="text-center">
            <h4 class="card-title m-0">Datos de Acceso</h4>
            <div class="d-flex align-items-center justify-content-between">
                <div></div>
                <div class="dropdown ms-auto">
                    <h6 class="m-0">
                        <div class="d-flex align-items-center">

                            <div class="mx-2"></div> <!-- Espacio horizontal -->
                            <div class="border p-2">Limpiar todos los datos</div>
                            <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown">
                                <i class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#" id="btnLimpiar"><i class="fas fa-trash text-danger"></i> Limpiar</a></li>
                            </ul>
                        </div>
                    </h6>
                </div>
                <div></div>
            </div>
        </div>
        <div class="table-responsive-sm">

            <table class="table table-sm table-light" id="tblLogs">

                <thead class="thead-dark">
                    <tr>
                        <th>Evento</th>
                        <th>Ip</th>
                        <th>Detalle</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Aquí van tus filas de datos -->
                </tbody>
            </table>
        </div>
    </div>
</div>





<?php include "Views/Templates/footer.php"; ?>