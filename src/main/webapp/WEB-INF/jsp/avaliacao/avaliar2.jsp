<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page  contentType="text/html; charset=UTF-8"  %>

<html lang="pt_br">
	<head>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		
		
		<script type="text/javascript"  src="js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript"  src="js/ases.js"></script>
		
		<script type="text/javascript"  src="js/bootstrap.min.js"></script>
		
		
		<title>Resultado da Avaliação</title>
	</head>
	
	<body>
	
		<div class="container">
		<h2>Resultado da Avaliação</h2>
		<div class="row">
		<div class="span12">
		<pre class="prettyprint linenums pre-scrollable" >
			<ol class="linenums" id="htmlCode">
				${html}
			</ol>
		</pre>
		</div>
		</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Ponto de Verificação</th>
						<th>Tipo</th>
						<th>Casos Gerais</th>
						<th>Ocorrências</th>
						<th>Linhas</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${itens}">
						<tr>
							<td>${item.checkPoint}</td>
							<td>
								<c:if test="${item.error}">Erro</c:if> 
								<c:if test="${!item.error}">Aviso</c:if>
							</td>
							<td>${item.description}</td>
							<td>${item.numberOfOccurrences}</td>
							<td>${item.stringLines}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
	<script type="text/javascript"> 
			buildCssLines();
	</script>
	<script src="http://platform.twitter.com/widgets.js" type="text/javascript"></script>

	
	<script src="js/bootstrap-alert.js" type="text/javascript"></script>
	<script src="js/bootstrap-modal.js" type="text/javascript"></script>
	<script src="js/bootstrap-dropdown.js" type="text/javascript"></script>
	
	<script src="js/bootstrap-tab.js" type="text/javascript"></script>
	<script src="js/bootstrap-tooltip.js" type="text/javascript"></script>
	<script src="js/bootstrap-popover.js" type="text/javascript"></script>
	
	
	
	
</html>
