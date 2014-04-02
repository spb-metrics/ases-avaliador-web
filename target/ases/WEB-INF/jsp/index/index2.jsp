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
					
					<form action="avaliar" method="post" class="form-horizontal">
					
						<fieldset>
							<legend>ASES</legend>
							    <ul class="nav nav-tabs">
								    <li class="active"><a href="${pageContext.request.contextPath}
								    ">Verifique o URI</a></li>
								    <li><a href="${pageContext.request.contextPath}/file">Carregar Arquivo</a></li>
								    <li><a href="${pageContext.request.contextPath}/full-text">Entrada Direta</a></li>
								    <li><a href="${pageContext.request.contextPath}/about">Sobre</a></li>
							    </ul>
							<div class="control-group">
								<label class="control-label" for="inputUrl">Url</label>
								<div class="controls">
								<input type="text" id="inputUrl" name="url">
								</div>
							</div>							
							
							 <div class="control-group">
								<div class="controls">
									<label class="checkbox inline" >
										<input type="checkbox" checked="checked" name="mark"> Marcação
									</label>
									<label class="checkbox inline" >
										<input type="checkbox" checked="checked" name="behavior"> Comportamento (DOM)
									</label>
									<label class="checkbox inline" >
										<input type="checkbox" checked="checked" name="content"> Conteúdo / Informação
									</label>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									
									<label class="checkbox inline" >
										<input type="checkbox" checked="checked" name="presentation"> Apresentação / Design
									</label>
									<label class="checkbox inline" >
										<input type="checkbox" checked="checked" name="multimedia"> Multimídia
									</label>
									<label class="checkbox inline" >
										<input type="checkbox" checked="checked" name="form"> Formulários
									</label>
								</div> 
							</div>
								
						</fieldset>
						
						<div style="max-width: 400px; margin: 0 auto 10px;" class="well">
              				<button class="btn btn-large btn-block btn-primary" type="submit">Avaliar</button>
            			</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
