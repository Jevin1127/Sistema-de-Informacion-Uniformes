<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link href="<?php echo base_url; ?>Assets/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
	<link rel="icon" type="image/png" sizes="32x32" href="<?php echo base_url; ?>Assets/favicon.ico">
	<link href="<?php echo base_url; ?>Assets/css/styles.css" rel="stylesheet" />
	<link href="<?php echo base_url; ?>Assets/css/estilos.css" rel="stylesheet" />
	<link href="<?php echo base_url; ?>Assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo base_url; ?>Assets/css/bootstrap-extended.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
	<script src="<?php echo base_url; ?>Assets/js/all.min.js" crossorigin="anonymous"></script>
	<title><?php echo $data['title']; ?></title>

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

<body>
	<!-- wrapper -->
	<div class="wrapper container">
		<div class="authentication-reset-password d-flex align-items-center justify-content-center">
			<div class="row">
				<div class="card-body">
					<div class="p-5">
						<div class="text-start">
							<img src="assets/images/logo-img.png" width="180" alt="">
						</div>
						<input type="hidden" id="token" value="<?php echo $data['seguridad']['token']; ?>">
						<h4 class="mt-5 font-weight-bold">Generar Nueva Contraseña</h4>
						<p class="text-muted">Su contraseña será cambiada para activar su cuenta. Por favor, ingrese su nueva contraseña.</p>
						<br>
						<div class="form-floating mb-3 password-container">
							<span class="icon-eye"><i class="fas fa-eye password-toggle" id="togglePassword"></i></span>
							<input type="password" class="form-control" id="nueva_claveotp" placeholder="Contraseña nueva" oninput="removeSpaces(this)"/>
							<label class="nueva_claveotp">Ingrese su nueva contraseña</label>		
						</div>
						<br>
						<div class="form-floating mb-3 password-container">
							<span class="icon-eye1"><i class="fas fa-eye password-toggle" id="togglePassword1"></i></span>
							<input type="password" class="form-control" id="confirmar_claveotp" placeholder="Confirmar contraseña" oninput="removeSpaces(this)"/>
							<label class="confirmar_claveotp">Confirme su nueva contraseña</label>
							
						</div>



						<script>
							const iconEye = document.querySelector(".icon-eye");
							const iconEye1 = document.querySelector(".icon-eye1");

							iconEye.addEventListener("click", function() {
								const icon = this.querySelector("i");
								const togglePassword = document.querySelector('#togglePassword');

								if (this.nextElementSibling.type === "password") {
									// Cambia el tipo de input a "text"
									this.nextElementSibling.type = "text";

									togglePassword.classList.remove('fa-eye');
									togglePassword.classList.add('fa-eye-slash');
								} else {
									// Cambia el tipo de input a "password"
									this.nextElementSibling.type = "password";

									togglePassword.classList.remove('fa-eye-slash');
									togglePassword.classList.add('fa-eye');
								}
							});

							iconEye1.addEventListener("click", function() {
								const icon = this.querySelector("i");
								const togglePassword = document.querySelector('#togglePassword1');

								if (this.nextElementSibling.type === "password") {
									// Cambia el tipo de input a "text"
									this.nextElementSibling.type = "text";

									togglePassword.classList.remove('fa-eye');
									togglePassword.classList.add('fa-eye-slash');
								} else {
									// Cambia el tipo de input a "password"
									this.nextElementSibling.type = "password";

									togglePassword.classList.remove('fa-eye-slash');
									togglePassword.classList.add('fa-eye');
								}
							});

							function removeSpaces(element) {
								element.value = element.value.replace(/\s/g, '');
							}
						</script>
						<div class="d-grid gap-2">
							<button type="button" class="btn btn-primary" id="btnAccionotp">Cambiar Contraseña</button> <a href="<?php echo base_url; ?>" class="btn btn-light"><i class='bx bx-arrow-back mr-1'></i>Volver al menú principal</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end wrapper -->

	<script>
		const base_url = "<?php echo base_url; ?>";
	</script>
	<script src="<?php echo base_url . 'Assets/js/sweetalert2.all.min.js'; ?>"></script>
	<script src="<?php echo base_url . 'Assets/js/otp.js'; ?>"></script>
</body>

</html>