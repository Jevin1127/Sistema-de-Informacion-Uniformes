<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="icon" type="image/png" sizes="32x32" href="<?php echo base_url; ?>Assets/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Iniciar Sesión</title>

    <link href="<?php echo base_url; ?>Assets/css/styles.css" rel="stylesheet" />
    <script src="<?php echo base_url; ?>Assets/js/all.min.js" crossorigin="anonymous"></script>
    <script src="<?php echo base_url; ?>Assets/js/sweetalert2.all.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .password-container {
            position: relative;
            width: 100%;
        }

        .password-container input {
            width: 100%;
            padding-right: 40px;
            /* Espacio para el icono */
        }

        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            transition: 0.4 ease all;
        }

        .password-toggle:hover {
            color: steelblue;
        }
    </style>



</head>

<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">Iniciar Sesión</h3>
                                </div>
                                <br>
                                <center><img src="<?php echo base_url; ?>Assets/images/login-images/160925385_242186104265703_6477669797695369791_n.jpg " width="180" /></center>

                                <?php
                                // Generar un token CSRF
                                if (session_status() == PHP_SESSION_NONE) {
                                    session_start();
                                }

                                if (empty($_SESSION['csrf_token'])) {
                                    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
                                }
                                ?>


                                <div class="card-body">
                                    <form id="frmLogin" method="post" action="tu_script_de_autenticacion.php">
                                        <!-- Campo oculto con el token CSRF -->
                                        <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">

                                        &nbsp;<h7 for="inputPassword"><i class="fas fa-user"></i>&nbsp;Usuario</h7>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="usuario" name="usuario" type="text" placeholder="Ingrese Usuario" oninput="validateInput(this)" maxlength="20" />
                                            <label for="usuario">Ingrese Usuario</label>
                                        </div>

                                        <?php
                                        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                                            session_start();

                                            if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
                                                die('Token CSRF inválido');
                                            }

                                            // Proceder con la autenticación del usuario
                                            $usuario = $_POST['usuario'];
                                            // Verificación y autenticación del usuario
                                        }
                                        ?>
                                        <h7><i class="fas fa-key"></i>&nbsp;Contraseña</h7>
                                        <div class="form-floating mb-3 password-container">
                                            <span class="icon-eye"><i class="fas fa-eye password-toggle" id="togglePassword"></i></span>
                                            <input class="form-control" id="clave" name="clave" type="password" placeholder="Ingrese Contraseña" oninput="removeSpaces(this)" />
                                            <label for="clave">Ingrese Contraseña</label>
                                        </div>
                                        <div class="alert alert-danger text-center d-none" id="alerta" role="alert">
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <button class="btn btn-primary" type="submit" onclick="frmLogin(event);">Iniciar Sesión</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <p>
                                        ¿Olvidaste tu contraseña?
                                        <a href="<?php echo base_url . 'principal/forgot'; ?>">Recuperar contraseña</a>.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">FSociety &copy; Uniformes Del Atlantico <?php echo date("Y"); ?></div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <script src="<?php echo base_url; ?>Assets/js/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="<?php echo base_url; ?>Assets/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<?php echo base_url; ?>Assets/js/scripts.js"></script>
    <script>
        const base_url = "<?php echo base_url; ?>";
    </script>
    <script src="<?php echo base_url; ?>Assets/js/login.js"></script>
</body>

</html>