<?php
require_once "Config/Helpers.php";

class Respaldo extends Controller {
    private $respaldoModel;

    public function __construct() {
        session_start();
        parent::__construct();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('Respaldo')) {
            header('Location: ' . base_url . 'Errors/permisos');
            exit();
        }

        $this->respaldoModel = new RespaldoModel();
    }

    public function index() {
        $this->views->getView('Respaldo', "index");
    }

    public function listar() {
        $copias = $this->respaldoModel->getCopias();
    
        // Devuelve los datos en formato JSON
        header('Content-Type: application/json');
        echo json_encode(['status' => 'success', 'data' => $copias]);
        die();
    }
    

    public function crear() {
        $nombreArchivo = 'backup'; 
        if ($this->respaldoModel->crearCopia($nombreArchivo)) {
            echo json_encode(['status' => 'success', 'message' => 'Copia de seguridad creada con éxito.']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'No se pudo crear la copia de seguridad.']);
        }
        die();
    }
    

    public function eliminar($id) {
        if ($this->respaldoModel->eliminarCopia($id)) {
            echo json_encode(['status' => 'success', 'message' => 'Copia eliminada con éxito.']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'No se pudo eliminar la copia.']);
        }
        die();
    }

    public function restaurar($id) {
        if ($this->respaldoModel->restaurarCopia($id)) {
            echo json_encode(['status' => 'success', 'message' => 'Copia restaurada con éxito.']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'No se pudo restaurar la copia.']);
        }
        die();
    }
}
?>
