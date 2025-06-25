<?php
require_once "Config/Helpers.php";
class Administracion extends Controller
{

    public function __construct()
    {
        session_start();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        parent::__construct();
    }

    public function index()
    {
        if (!verificar('Configuracion')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
            $model = new AdministracionModel();
            $data = $model->getEmpresa();
            $data['nuevos'] = $model->nuevosProductos();
            $this->views->getView('Administracion', "index", $data);

    }

    public function home()
    {
            $model = new AdministracionModel();
            $data['usuarios'] = $model->getDatos('_usuarios');
            $data['clientes'] = $model->getDatos('clientes');
            $data['productos'] = $model->getDatos('productos_base');
            $data['roles'] = $model->getDatos('roles');
            $data['nuevos'] = $model->nuevosProductos();
            $this->views->getView('Administracion', "Home", $data);
    }

    public function modificar()
    {
        $nombre = $_POST['nombre'];
        $telefono = $_POST['telefono'];
        $direccion = $_POST['direccion'];
        $mensaje = $_POST['mensaje'];
        $id = $_POST['id'];
        $model = new AdministracionModel();
        $data = $model->modificar($nombre, $telefono, $direccion, $mensaje, $id);
        if ($data == "ok") {
            $msg = "ok";
        } else {
            $msg = "error";
        }
        echo json_encode($msg);
        die();
    }

    public function reporteStock()
    {
        $model = new AdministracionModel();
        $data = $model->getStockMinimo();
        echo json_encode($data);
        die();
    }

    public function productosComprados()
    {
        $model = new AdministracionModel();
        $data = $model->getproductosComprados();
        echo json_encode($data);
        die();
    }

    public function kardexEntradaMaxima()
    {
        $model = new AdministracionModel();
        $data = $model->getmaxEntrada();
        echo json_encode($data);
        die();
    }


    public function kardexSalidaMaxima()
    {

        $model = new AdministracionModel();
        $data = $model->getmaxSalida();
        echo json_encode($data);
        die();
    }

    public function comparacion($anio)
    {
        $desde = $anio . '-01-01';
        $hasta = $anio . '-12-31';

        $model = new AdministracionModel();
        $data['venta'] = $model->calcularVentas($desde, $hasta);
        $data['compra'] = $model->calcularCompras($desde, $hasta);

        $data['totalVentas'] = $model->totalVentasCompras($desde, $hasta);
        $data['totalCompras'] = $model->totalComprasVentas($desde, $hasta);

        echo json_encode($data);
        die();
    }

    public function saldos($anio)
    {
        $desde = $anio . '-01-01';
        $hasta = $anio . '-12-31';

        $model = new AdministracionModel();
        $data = $model->calcularSaldos($desde, $hasta);
        echo json_encode($data);
        die();
    }

    public function abonosporMes($anio)
    {
        $desde = $anio . '-01-01';
        $hasta = $anio . '-12-31';

        $model = new AdministracionModel();
        $data['abono'] = $model->calcularAbonoClientes($desde, $hasta);
        echo json_encode($data);
        die();
    }

    public function salidasporMes($anio)
    {
        $desde = $anio . '-01-01';
        $hasta = $anio . '-12-31';

        $model = new AdministracionModel();
        $data['salida'] = $model->calcularKardexSalida($desde, $hasta);
        echo json_encode($data);
        die();
    }

    
    public function productoVendido($anio)
    {
        $desde = $anio . '-01-01';
        $hasta = $anio . '-12-31';

        $model = new AdministracionModel();
        $data['vendido'] = $model->calcularProductoVendido($desde, $hasta);
        echo json_encode($data);
        die();

        
    }

    public function entradasporMes($anio)
    {
        $desde = $anio . '-01-01';
        $hasta = $anio . '-12-31';

        $model = new AdministracionModel();
        $data['entrada'] = $model->calcularKardexEntrada($desde, $hasta);
        echo json_encode($data);
        die();
    }

    public function logs(){

        if (!verificar('Logs de Acceso')) {
            header('Location: ' . base_url . 'Errors/permisos');
        }
        $data['title'] = 'Logs de Acceso';
        $data['script'] = 'funciones.js';
        $this->views->getView('Administracion', 'logs', $data);
    }

    public function listarLogs(){

        $model = new AdministracionModel();
        $data = $model->listarLogs();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function limpiarDatos(){

        $model = new AdministracionModel();
        $data = $model->listarDatos();
        if(empty($data)){
            $msg = array('msg' => 'Datos eliminados con exito', 'type' => 'success');
        }else{
            $msg = array('msg' => 'Error al eliminar los datos', 'type' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function permisos()
    {
        $data['title'] = 'Permisos';
        $this->views->getView('Administracion','permisos',  $data);
    }
}
