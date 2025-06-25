<?php
class RespaldoModel extends Query {
    private $backupDirectory = 'Backups/';

    public function __construct() {
        parent::__construct();

        if (!is_dir($this->backupDirectory)) {
            mkdir($this->backupDirectory, 0755, true);
        }
    }

    public function getCopias() {
        date_default_timezone_set('America/Tegucigalpa');
        
        $files = array_diff(scandir($this->backupDirectory), array('.', '..'));
        $data = [];
    
        foreach ($files as $file) {
            $filePath = $this->backupDirectory . DIRECTORY_SEPARATOR . $file;
            if (is_file($filePath)) {
                $data[] = [
                    'nombre' => $file,
                    'fecha' => date('Y-m-d H:i:s', filemtime($filePath)) 
                ];
            }
        }
    
        return $data;
    }
    
    

    public function crearCopia($nombreArchivo) {
        $fecha = date('Y-m-d_H-i-s');
        $filePath = $this->backupDirectory . $nombreArchivo . '_' . $fecha . '.sql';
    
        $command = "\"C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin\\mysqldump.exe\" --user=root --host=localhost --no-tablespaces --skip-column-statistics sistema > " . escapeshellarg($filePath);
    
        $output = [];
        $returnVar = 0;
        exec($command, $output, $returnVar);
    
        if ($returnVar === 0 && file_exists($filePath) && filesize($filePath) > 0) {
            return true;
        } else {
            error_log("Error al crear la copia de seguridad: " . implode("\n", $output));
            return false;
        }
    }
    
    public function eliminarCopia($fileName) {
        $filePath = $this->backupDirectory . $fileName;
        if (file_exists($filePath)) {
            return unlink($filePath);
        }
        return false;
    }

    public function restaurarCopia($fileName) {
        $filePath = $this->backupDirectory . $fileName;

        $command = "\"C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin\\mysql.exe\" --user=root --host=localhost sistema < " . escapeshellarg($filePath);
        exec($command, $output, $returnVar);

        return $returnVar === 0;
    }

    public function verificarPermiso(int $id_user, string $nombre) {
        $sql = "SELECT p.id, p.permiso, d.id, d.id_usuario, d.id_permiso FROM permisos p 
                INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.permiso = '$nombre'";
        $data = $this->selectAll($sql);
        return $data;
    }
}
?>
