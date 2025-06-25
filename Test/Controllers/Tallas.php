<?php
require_once "Config/Helpers.php";
class Tallas extends Controller {
    public function __construct(){
        session_start();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('Tallas')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
        parent::__construct();
    }

    public function index() {
        
            $this->views->getView('Tallas', "index"); // Cambia a la vista para Tallas

    }


    public function listar() 
{
    $model = new TallasModel(); // Cambia a la clase de modelo para tallas
    $data = $model->getTallas(); // Cambia al método correspondiente para obtener Tallas

    for ($i = 0; $i < count($data); $i++) {
        if ($data[$i]['estado'] == 1) {
            $data[$i]['estado'] = '<span class="badge badge-success" style="color:green;">Activo</span>';
            $data[$i]["acciones"] = '<div>
                <button class="btn btn-primary" type="button" onclick="btnEditarTallas(' . $data[$i]['TallasID'] . ');"><i class ="fas fa-edit"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarTallas(' . $data[$i]['TallasID'] . ');" ><i class ="fas fa-trash-alt"></i></button>
            </div>';
        } else {
            $data[$i]['estado'] = '<span class="badge badge-danger" style="color:red;">Inactivo</span>';
            $data[$i]["acciones"] = '<div>
                <button class="btn btn-success" type="button" onclick="btnReingresarTallas(' . $data[$i]['TallasID'] . ');" ><i class ="fas fa-lock-open"></i></button>
            </div>';
        }
    }

    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    die();
}

public function registrar() {
    $TipoTalla = $_POST['TipoTalla'];
    $id = $_POST['TallasID'];

    if (empty($TipoTalla)) {
        $msg = "Todos los campos son obligatorios.";
    } else {
        $model = new TallasModel(); // Asegúrate de tener un modelo llamado ClientesModel para la gestión de clientes
        if (empty($id)) {
            $data = $model->registrarTallas($TipoTalla);
            $msg = ($data == "ok") ? "si" : (($data == "existe") ? "La talla ya existe" : "Error al registrar la talla");
        } else {
            $data = $model->modificarTallas($TipoTalla, $id);
            $msg = ($data == "modificado") ? "modificado" : "Error al modificar la talla";
        }
    }

    echo json_encode($msg, JSON_UNESCAPED_UNICODE);
    die();
}


public function editar(int $TallasID) {
    $model = new TallasModel();
    $data = $model->editarTallas($TallasID);

    if ($data) {
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    } else {
        echo json_encode("error", JSON_UNESCAPED_UNICODE);
    }

    die();
}


public function eliminar(int $TallasID) 
{
    $model = new TallasModel();
    $data = $model->accionTallas(0, $TallasID);

    if ($data == "ok"){
        $msg = "ok";
    } else {
        $msg = "Error al eliminar la talla";
    }

    echo json_encode($msg, JSON_UNESCAPED_UNICODE);
    die();
}

public function reingresar(int $TallasID) 
{
    $model = new TallasModel(); 
    $data = $model->accionTallas(1, $TallasID);

    if ($data == "ok"){
        $msg = "ok";
    } else {
        $msg = "Error al reingresar la talla";
    }

    echo json_encode($msg, JSON_UNESCAPED_UNICODE);
    die();
}

}
?>
