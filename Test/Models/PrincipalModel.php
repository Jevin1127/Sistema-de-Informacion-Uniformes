<?php 
class PrincipalModel extends Query{
    public function __construct(){
        parent::__construct();
    }

    public function verificarCorreo($correo)
    {
        $sql = "SELECT id FROM _usuarios WHERE correo = '$correo'";
        return $this->select($sql);
    }

    public function registrarToken($token, $correo){
        $sql = "UPDATE _usuarios SET token = ? WHERE correo = ?";
        $array = array($token, $correo);
        return $this->save($sql, $array);
    }

    public function registrarTokenValidar($token){
        $sql = "UPDATE _usuarios SET hash_ = ?";
        $array = array($token);
        return $this->save($sql, $array);
    }

    public function verificarToken($token)
    {
        $sql = "SELECT id, token FROM _usuarios WHERE token = '$token'";
        return $this->select($sql);
    }


    
    public function modificarClave($clave, $token)
    {
        $sqlSelect = "SELECT clave, token FROM _usuarios WHERE token = ?";
        $userInfo = $this->selected($sqlSelect, array($token));
    
        if (empty($userInfo)) {
            return "El token no es válido.";
        }
    
        $currentPassword = $userInfo['clave'];
        $currentToken = $userInfo['token'];
    
        if ($currentPassword === $clave) {
            return "La nueva contraseña no puede ser igual a la actual.";
        }
    
        if ($currentToken === $clave) {
            return "La nueva contraseña no puede ser igual al token actual.";
        }
    
        $sqlUpdate = "UPDATE _usuarios 
                      SET clave = ?, 
                          token = null, 
                          estado = 1 
                      WHERE token = ?";
        $array = array($clave, $token);
        return $this->save($sqlUpdate, $array);
    }
    
}




?>