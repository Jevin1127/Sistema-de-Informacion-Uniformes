<?php
class KardexModel extends Query {
    private $id_kardex, $id_inventario, $proveedor, $id_producto, $producto, $descripcion, $tipo_kardex, $fecha_entrada, $cantidad_entrada, $fecha_salida, $factura, $cantidad_salida, $motivo_salida, $precio_unitario, $costo_total;
    public function __construct() 
    {
        parent::__construct();
    }

    public function getKardex() 
    {
        $sql = "SELECT * FROM kardex";
        $data = $this->selectAll($sql);
        return $data;
    }


    public function getCajas() 
    {
        $sql = "SELECT * FROM caja WHERE estado = 1";
        $data = $this->selectAll($sql);
        return $data;
    }
    public function getUsuarios() 
    {
        $sql = "SELECT u.*, c.id as id_caja, c.caja FROM _usuarios u INNER JOIN caja c where u.id_caja = c.id";
        $data = $this->selectAll($sql);
        return $data;
    }



    public function verificarPermiso(int $id_user, string $nombre) 
    {
            $sql = "SELECT p.id, p.permiso, d.id, d.id_usuario, d.id_permiso FROM permisos p 
            INNER JOIN  detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.permiso = '$nombre'"; //cuando es un string hay que poner las comillas simples
            $data = $this->selectAll($sql);
            return $data;
    }
}

?>