<?php
require_once "Config/Helpers.php";
class Reportes extends Controller{
    
    public function __construct(){
        session_start();
        if (empty($_SESSION['activo'])) {
            header("location: ".base_url);
        }
        if (!verificar('Reportes')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
        parent::__construct();
    }
    public function index() 
    {

            $model = new ReportesModel();
            $data['usuarios'] = $model->getDatos('_usuarios');
            $data['clientes'] = $model->getDatos('clientes');
            $data['productos'] = $model->getDatos('productos_base');
            $data['roles'] = $model->getDatos('roles');
            $this->views->getView('Reportes', "index", $data);

    }

    public function contarClientes() {
        $model = new ReportesModel();
        $data = $model->contarClientesPorEstado();
        echo json_encode($data);
        die();
    }

    public function mostrarClientesConMasCompras() {
        $ventasModel = new ReportesModel();
        $clientes = $ventasModel->getClientesConMasCompras();
        echo json_encode($clientes);
    }

    public function mostrarProveedoresConMasCompras() {
        $comprasModel = new ReportesModel(); 
        $proveedores = $comprasModel->getProveedoresConMasCompras();
        echo json_encode($proveedores);
    }
    
    
    public function mayorCantidadProductos() {
        $inventarioModel = new ReportesModel();  
        $productos = $inventarioModel->getProductosConMasCantidad();
        echo json_encode($productos);
        die(); 
    }

    public function menorCantidadProductos() {
        $inventarioModel = new ReportesModel(); 
        $productos = $inventarioModel->getProductosConMenosCantidad();
        echo json_encode($productos);
        die(); 
    }

    public function contarUsuariosPorEstado() {
        $model = new ReportesModel(); 
        $data = $model->contarUsuariosPorEstado();
        echo json_encode($data);
        die();
    }

    public function getRolesConMasUsuarios() {
        $model = new ReportesModel(); 
        $data = $model->getRolConMasUsuarios();
        echo json_encode($data);
        die();
    }
    
    public function getProductosMasVendidos() {
        $model = new ReportesModel(); 
        $data = $model->getProductosMasVendidos();
        echo json_encode($data);
        die();
    }
    

} 
?>
