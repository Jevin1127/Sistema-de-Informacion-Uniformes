<?php
require_once "Config/Helpers.php";
class Entregas extends Controller
{
    public function __construct()
    {
        session_start();
        parent::__construct();
        $this->model = new EntregasModel();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('Entregas')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
    }


    public function index()
    {     
            $model = new EntregasModel();
            $data['cajas'] = $model->getCajas();
            $data['roles'] = $model->getRoles();
            $this->views->getView('Entregas', "index", $data);
    }

    function listar()
    {
        $model = new EntregasModel();
        $data = $model->getListas();
    
        if ($data) {
            foreach ($data as &$row) {
                // Mantener el botón PDF sin cambios
                $acciones = ' <a class="btn btn-danger" href="' . base_url . ("Ventas/generarPdfv/" . $row['id']) . '" target="_blank"><i class="fas fa-file-pdf"></i></a>';
    
                if ($row['estado'] == 0) {
                    if ($row['saldo'] == 0) {
                        $acciones .= '
                            <button class="btn btn-danger" type="button" onclick="btnDesactivarEntrega(' . $row['id'] . ');">Entregar</button>
                        ';
                    } else {
                        $acciones .= '
                            <div class="dropdown d-inline">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton' . $row['id'] . '" data-bs-toggle="dropdown" aria-expanded="false">
                                    Acciones
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton' . $row['id'] . '">
                                    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#abonarModal" onclick="setAbonoId(' . $row['id'] . ');">
                                    <i class="fa-solid fa-money-bills"></i>
                                    Abonar
                                    </a></li>
                                    <li><a class="dropdown-item" href="#" onclick="btnNoEntregado(' . $row['id'] . ');">
                                    <i class="fa-solid fa-circle-exclamation"></i>
                                    No Reclamado
                                    </a></li>
                                </ul>
                            </div>
                        ';
                    }
                }
    
                $row['acciones'] = $acciones;
            }
    
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
        } else {
            echo json_encode(array('error' => 'No se encontraron datos'), JSON_UNESCAPED_UNICODE);
        }
    
        exit;
    }
    
    


    public function desactivar(int $id)
    {
        $model = new EntregasModel();
        $data = $model->VentaEntregado(2, $id);
        if ($data == 1) {
            $msg = "ok";
        } else {
            $msg = "Error al Entregar el registro";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }


    public function getPedido($id) {
        $model = new EntregasModel();
        $data = $model->getPedido($id);
    
        if ($data) {
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
        } else {
            echo json_encode(array('error' => 'No se encontraron datos'), JSON_UNESCAPED_UNICODE);
        }
    
        exit;
    }
    

    public function procesarAbono()
    {
        $id = $_POST['id']; 
        $cantidadAbonada = $_POST['abonoCantidad'];
    
        $model = new EntregasModel();
        $nuevoSaldo = $model->abonarCantidad($id, $cantidadAbonada);
    
        if ($nuevoSaldo !== false) {
            if ($nuevoSaldo <= 0) {
                $mensaje = "¡Ya se pagó el total del pedido!";
            } else {
                $mensaje = "Abono procesado con éxito.";
            }
            
            echo json_encode([
                'success' => true,
                'mensaje' => $mensaje,
                'nuevoSaldo' => $nuevoSaldo
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'mensaje' => 'Error al procesar el abono.'
            ]);
        }
        
        exit;
    }
    

    public function cambiarEstado(int $id)
    {
        $model = new EntregasModel();
        $data = $model->NoEntregado(3, $id);
        if ($data == 1) {
            $msg = "ok";
        } else {
            $msg = "Error en el Registro";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }


}

?>