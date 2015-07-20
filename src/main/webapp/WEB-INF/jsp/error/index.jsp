<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:baseLayout>
   <jsp:body>
		<link rel="stylesheet" href="css/bootstrap.alert.css"> 
		<!-- <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css"> -->
		
		<title>Lamentamos</title>
	</head>
	
	<body>
	
		<div class="container">
			<h2>Erro</h2>
			<div class="row">
				<div class="alert alert-error">
					Não foi possível realizar a avaliação. Verifique o preenchimento da url, arquivo ou o codigo inserido e se o conteúdo está disponível.
				</div>
				<input type="button" value="Voltar" onClick="history.go(-1)"> 
			</div>
			
		</div>
	</jsp:body>
</t:baseLayout>