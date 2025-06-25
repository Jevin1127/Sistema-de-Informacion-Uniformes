<?php
require_once "Config/Helpers.php";
class Kardex extends Controller{
    public function __construct(){
        session_start();
        parent::__construct();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('Kardex')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
    }
    public function index() 
    {
       
            $this->views->getView('Kardex', "index");

    }

    public function listar() 
{
    $model = new KardexModel();
    $data = $model->getKardex();

    if ($data) {
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    } else {
        echo json_encode(array('error' => 'No se encontraron datos'), JSON_UNESCAPED_UNICODE);
    }

    die();
}


    public function salir()
    {
        session_destroy();
        header("location:".base_url);
    }
}

?>


