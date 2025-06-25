<?php
require_once "Config/Helpers.php";
class Roles extends Controller
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('Roles')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
    }

    public function index()
    {
        $model = new RolesModel();
        $data['title'] = 'Roles';
        $data['script'] = 'funciones.js';
        $data['permisos'] = $model->getPermisos();
        $this->views->getView('Roles', 'index', $data);
    }


    function listar()
    {
        //<button class="btn btn-primary" type="button" onclick="btnEditarRol('.$data[$i]['id'].');"><i class ="fas fa-edit"></i></button>
        $model = new RolesModel();
        $data = $model->_getRoles();
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge badge-success" style="color:green;">Activo</span>';
                $data[$i]["acciones"] = '<div>      
                <button class="btn btn-primary" type="button" onclick="btnEditarRol(' . $data[$i]['id'] . ');"><i class ="fas fa-edit"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarRol(' . $data[$i]['id'] . ');" ><i class ="fas fa-trash-alt"></i></button>

            </div>';
            } else {
                $data[$i]['estado'] = '<span class="badge badge-danger" style="color:red;">Inactivo</span>';
                $data[$i]["acciones"] = '<div>
                <button class="btn btn-success" type="button" onclick="btnReingresarRol(' . $data[$i]['id'] . ');" ><i class ="fas fa-lock-open"></i></button>
                </div>';
            }
        }
        echo  json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function registrar()
    {
        $rol = $_POST['rol'];
        $permisos = (!empty($_POST['permisos'])) ? $_POST['permisos'] : null;
        $id = $_POST['id'] ?? '';  // Proporcionar un valor predeterminado si 'id' no está presente
        $listaPermisos = ($permisos != null) ? json_encode($permisos) : null;

        if ($id == '') {
            $model = new RolesModel();
            $verificar = $model->getValidar('rol', $rol, 'registrar', 0);
            if (empty($verificar)) {
                $model = new RolesModel();
                $data = $model->registrar($rol, $listaPermisos);
                if ($data > 0) {
                    $res = "si";
                } else {
                    $res = array('msg' => 'ERROR AL REGISTRAR', 'type' => 'error');
                }
            } else {
                $res = array('msg' => 'EL ROL YA EXISTE', 'type' => 'warning');
            }
        } else {
            $model = new RolesModel();
            $verificar = $model->getValidar('rol', $rol, 'actualizar', $id);
            if (empty($verificar)) {
                $model = new RolesModel();
                $data = $model->actualizar($rol, $listaPermisos, $id);
                if ($data == 1) {
                    $res = "modificado";
                } else {
                    $res = array('msg' => 'ERROR AL MODIFICAR', 'type' => 'error');
                }
            } else {
                $res = array('msg' => 'El ROL YA EXISTE', 'type' => 'warning');
            }
        }

        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }


    public function editar($id)
    {
        $model = new RolesModel();
        $rol = $model->editarRoles($id);

        // Asegurarse de que 'permisos' esté decodificado correctamente
        if (isset($rol['permisos'])) {
            $rol['permisos'] = json_decode($rol['permisos'], true); // Decodifica los permisos a un array
        }

        echo json_encode($rol, JSON_UNESCAPED_UNICODE);
        die();
    }



    public function eliminar(int $id)
    {
        $model = new RolesModel();
        $data = $model->accionRol(0, $id);
        if ($data == 1) {
            $msg = "ok";
        } else {
            $msg = "Error al eliminar el rol";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar(int $id)
    {
        $model = new RolesModel();
        $data = $model->accionRol(1, $id);
        if ($data == 1) {
            $msg = "ok";
        } else {
            $msg = "Error al reingresar el Rol";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }



    public function salir()
    {
        session_destroy();
        header("location:" . base_url);
    }
}
