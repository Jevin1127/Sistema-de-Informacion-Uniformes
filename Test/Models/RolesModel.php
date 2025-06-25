<?php
class RolesModel extends Query {
    private $id,$estado, $rol;
    public function __construct() 
    {
        parent::__construct();
    }

    public function getRoles($estado) 
    {
        $sql = "SELECT * FROM roles WHERE estado = '$estado'";
        return $this->selectAll($sql);
    }
    public function __getRoles() 
    {
        $sql = "SELECT * FROM roles WHERE estado = 1";
        return $this->selectAll($sql);
        
    }

    public function _getRoles() 
    {
        $sql = "SELECT * FROM roles";
        $data = $this->selectAll($sql);
        return $data;
    }
    
    
    public function editarRoles(int $id){
        $sql = "SELECT * FROM roles WHERE id = $id";
        $data = $this->select($sql);
        return $data;
    }

    public function modificarRoles(string $rol, int $id)  
    {
        $this->rol = $rol;
        $this->id = $id;
            $sql = "UPDATE roles SET rol = ? WHERE id = ?";
            $datos = array($this->rol, $this->id);
            $data = $this->save($sql, $datos);
            if ($data == 1) {
                $res = "modificado";
            }else{
                $res = "error";
            } 
        return $res;
    }  

    public function accionRol(int $estado, int $id) 
    {
        $this->id = $id;
        $this->estado = $estado;
        $sql = "UPDATE roles SET estado = ? WHERE id = ?";
        $datos = array($this->estado, $this->id);
        $data = $this->save($sql, $datos);
        return $data;
    }
    public function verificarPermiso(int $id_user, string $nombre) 
    {
            $sql = "SELECT p.id, p.permiso, d.id, d.id_usuario, d.id_permiso FROM permisos p 
            INNER JOIN  detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.permiso = '$nombre'"; //cuando es un string hay que poner las comillas simples
            $data = $this->selectAll($sql);
            return $data;
    }

    public function getPermisos() 
    {
        $sql = "SELECT * FROM permisos";
        return $this->selectAll($sql);
    }


    public function registrar($rol, $permisos)
    {
        $sql = "INSERT INTO roles (rol, permisos) VALUES (?,?)";
        $array = array($rol, $permisos);
        return $this->save($sql, $array);
    }
    public function getValidar($campo, $valor, $accion, $id)
    {
        if ($accion == 'registrar' && $id == 0) {
            $sql = "SELECT id FROM roles WHERE $campo = '$valor'";
        }else{
            $sql = "SELECT id FROM roles WHERE $campo = '$valor' AND id != $id";
        }
        return $this->select($sql);
    }

    public function actualizar($rol, $permisos, $id)
    {
        $sql = "UPDATE roles SET rol=?, permisos=? WHERE id=?";
        $array = array($rol, $permisos, $id);
        return $this->save($sql, $array);
    }
}

?>