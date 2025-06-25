<?php
require_once "Config/Helpers.php";
class MateriaPrima extends Controller {
    public function __construct(){
        session_start();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('Materia Prima')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
        parent::__construct();
    }

    public function index() {

            $this->views->getView('MateriaPrima', "index"); 

    }

    public function listar() 
{
    $model = new MateriaPrimaModel(); 
    $data = $model->getMateriaPrima(); 

    for ($i = 0; $i < count($data); $i++) {
        if ($data[$i]['estado'] == 1) {
            $data[$i]['estado'] = '<span class="badge badge-success" style="color:green;">Activo</span>';
            $data[$i]["acciones"] = '<div>
                <button class="btn btn-primary" type="button" onclick="btnEditarMateriaPrima(' . $data[$i]['id_producto'] . ');"><i class ="fas fa-edit"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarMateriaPrima(' . $data[$i]['id_producto'] . ');" ><i class ="fas fa-trash-alt"></i></button>
            </div>';
        } else {
            $data[$i]['estado'] = '<span class="badge badge-danger" style="color:red;">Inactivo</span>';
            $data[$i]["acciones"] = '<div>
                <button class="btn btn-success" type="button" onclick="btnReingresarMateriaPrima(' . $data[$i]['id_producto'] . ');" ><i class ="fas fa-lock-open"></i></button>
            </div>';
        }
    }

    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    die();
}


    public function registrar() {
        $producto = $_POST['producto'];
        $descripcion = $_POST['descripcion'];

        if (empty($producto) || empty($descripcion)) {
            $msg = "Todos los campos son obligatorios.";
        } else {
            $model = new MateriaPrimaModel();
            if (empty($id)) {
                $data = $model->registrarMateriaPrima($producto, $descripcion);
                $msg = ($data == "ok") ? "si" : (($data == "existe") ? "La materia prima ya existe" : "Error al registrar la materia prima");
            } else {
                $data = $model->modificarMateriaPrima($producto, $descripcion, $id);
                $msg = ($data == "modificado") ? "modificado" : "Error al modificar la materia prima";
            }
        }

        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function editar(int $id_producto) {
        $model = new MateriaPrimaModel();
        $data = $model->editarMateriaPrima($id_producto);

        if ($data) {
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
        } else {
            echo json_encode("error", JSON_UNESCAPED_UNICODE);
        }

        die();
    }

    public function eliminar(int $id_producto) 
    {
        $model = new MateriaPrimaModel();
        $data = $model->accionMateriaPrima(0, $id_producto);

        if ($data == "ok"){
            $msg = "ok";
        } else {
            $msg = "Error al eliminar la materia prima";
        }

        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar(int $id_producto) 
    {
        $model = new MateriaPrimaModel(); 
        $data = $model->accionMateriaPrima(1, $id_producto);

        if ($data == "ok"){
            $msg = "ok";
        } else {
            $msg = "Error al reingresar la materia prima";
        }

        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
}
?>
