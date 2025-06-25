<?php include "Views/Templates/header.php"; ?>
<style>
        body {
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            width: 100%;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            margin: auto;
        }
        .card-body {
            text-align: center;
            padding: 2rem;
        }
        .card-body h4 {
            color: #dc3545;
            font-size: 3rem;
        }
        .card-body p {
            color: #6c757d;
            font-size: 1.4rem;
            margin: 1rem 0;
            text-align: justify;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 1.2rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .img-fluid {
            border-radius: 0 15px 15px 0;
            width: 100%;
            height: auto;
        }
        .footer {
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            width: 100%;
            position: absolute;
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="card py-5">
            <div class="row g-0">
                <div class="col-xl-5 d-flex align-items-center">
                    <div class="card-body p-4">
                        <h4 class="font-weight-bold">NO TIENES PERMISOS</h4>
                        <p>
                            El Administrador no te asignó el permiso de entrar a este módulo.
                        </p>
                        <div class="mt-5"> 
                            <a href="<?php echo base_url;?>Administracion/home" class="btn btn-primary btn-lg px-md-5 radius-30">Regresar</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-7">
                    <img src="https://cdn.searchenginejournal.com/wp-content/uploads/2019/03/shutterstock_1338315902.png" class="img-fluid" alt="Imagen de error">
                </div>
            </div>
            <footer class="footer">
                <p>Copyright &copy; Uniformes del Atlántico 2024</p>
            </footer>
        </div>
    </div>
</body>
<?php include "Views/Templates/footer.php"; ?>