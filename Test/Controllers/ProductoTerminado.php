<?php
require_once "Config/Helpers.php";
class ProductoTerminado extends Controller{
    public function __construct(){
        session_start();
        parent::__construct();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        if (!verificar('producto terminado')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
    }
    
    public function index() 
    {
       
            $model = new ProductoTerminadoModel();
            $data['productosPT'] = $model->getAllPT();
            $this->views->getView('Productoterminado', "index", $data);    

    }
        
}

?>
