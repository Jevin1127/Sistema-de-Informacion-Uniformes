<?php
require_once "Config/Helpers.php";
class Inventario extends Controller{
    public function __construct(){
        session_start();
        parent::__construct();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('Inventario')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
    }
    
    public function index() 
    {
       
            $model = new InventarioModel();
            $data['productos'] = $model->getInventario();
            $this->views->getView('Inventario', "index", $data);
            
    }
    


    public function listar() 
{
    $model = new InventarioModel();
    $data = $model->getInventario();

    if ($data) {
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    } else {
        echo json_encode(array('error' => 'No se encontraron datos'), JSON_UNESCAPED_UNICODE);
    }

    die();
}


    
}

?>
