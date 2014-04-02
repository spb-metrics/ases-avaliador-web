<%@ page  contentType="text/html; charset=UTF-8"  %>
<html lang="pt_br">

	<head>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		
		
		<script type="text/javascript"  src="js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript"  src="js/ases.js"></script>
		
		<script type="text/javascript"  src="js/bootstrap.min.js"></script>
		
		<title>ASES - Avaliador de acessbilidade web baseado no Emag</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="span12">
					
					<form action="avaliar-arquivo" method="post" class="form-horizontal" enctype="multipart/form-data">
					
						<fieldset>
							<legend>ASES</legend>
							    <ul class="nav nav-tabs">
								    <li><a href="${pageContext.request.contextPath}">Verifique o URI</a></li>
								    <li><a href="${pageContext.request.contextPath}/file">Carregar Arquivo</a></li>
								    <li><a href="${pageContext.request.contextPath}/full-text">Entrada Direta</a></li>
								    <li class="active"><a href="${pageContext.request.contextPath}/about">Sobre</a></li>
							    </ul>
								<h4>Versão 0.1</h2>
								
								<p>O ASES é um software cujo proposito é auxiliar na constução de sitios que sejam acessíveis a quaisquer pessoas, independente do seu tipo de deficiência
e dispositivo de navegacao.</p>						
							
							 
						</fieldset>
						
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
