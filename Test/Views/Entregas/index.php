<?php include "Views/Templates/header.php"; ?>
<div class="card-header bg-dark text-white text-center fs-4">
    Producto terminado - Listo para entregar
</div>
<br>

<div class="table-responsive-sm">
    <table class="table table-sm table-light" id="tblEntregas">
        <thead class="thead-dark">
            <tr>
                <th>Nº Factura</th>
                <th>Cliente</th>
                <th>Identificacion</th>
                <th>Telefono</th>
                <th>Fecha Entrega</th>
                <th>Total Venta</th>
                <th>Debe</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>

            <!-- Aquí van tus filas de datos -->
        </tbody>
    </table>
</div>


<div class="modal fade" id="abonarModal" tabindex="-1" aria-labelledby="abonarModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="abonarModalLabel">Abonos</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="actualizarTabla()"></button>
            </div>
            <div class="modal-body">
                <form id="abonarForm">
                <input type="hidden" id="pedidoId" name="pedidoId"> 
                    <div class="row mb-2">
                        <div class="col-4">
                            <label for="abonoFactura" class="form-label">Factura</label>
                            <input type="text" class="form-control" id="abonoFactura" name="abonoFactura" readonly>
                        </div>
                        <div class="col-8">
                            <label for="abonoCliente" class="form-label">Cliente</label>
                            <input type="text" class="form-control" id="abonoCliente" name="abonoCliente" readonly>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4">
                            <label for="abonoCantidadDeber" class="form-label">Debe</label>
                            <input type="number" class="form-control" id="abonoCantidadDeber" name="abonoCantidadDeber"
                                readonly step="0.01">
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="fecha_actual">Fecha</label>
                                <input id="fecha_actual" class="form-control" type="date" name="fecha_actual"
                                    placeholder="Cant" disabled>
                            </div>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                        <div class="form-group">
                            <button type="button" class="btn btn-secondary" onclick="copiarTotal()">Pagar Total</button>
                        </div>
                        </div>
                    </div>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            var inputFecha = document.getElementById('fecha_actual');
                            var fechaActual = obtenerFechaActual();
                            inputFecha.value = fechaActual;

                            function obtenerFechaActual() {
                                var today = new Date();
                                var year = today.getFullYear();
                                var month = ('0' + (today.getMonth() + 1)).slice(-2);
                                var day = ('0' + today.getDate()).slice(-2);
                                return year + '-' + month + '-' + day;
                            }
                        });

                        function copiarTotal() {
                            var cantidadDeber = parseFloat(document.getElementById('abonoCantidadDeber').value) || 0;
                            document.getElementById('abonoCantidad').value = cantidadDeber.toFixed(2);
                        }
                    </script>
                    <hr>
                    <div class="row mb-2">
                        <div class="col">
                            <label for="abonoCantidad" class="form-label">Cantidad a abonar</label>
                            <input type="number" class="form-control" id="abonoCantidad" name="abonoCantidad" required
                                step="0.01">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col text-end">
                            <button type="button" class="btn btn-primary" onclick="confirmarAbono()">Confirmar</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>





<?php include "Views/Templates/footer.php"; ?>