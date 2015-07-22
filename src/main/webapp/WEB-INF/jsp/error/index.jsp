<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:baseLayout>
   <jsp:body>
		<link rel="stylesheet" href="css/bootstrap.alert.css"> 
		<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js" />"></script>
			<script type="text/javascript">
				
		        $(document).ready(function() {
		        	$("#errorDesc").hide();
		        	$("#MostrarMensagem").click(MostrarMensagem);
		          
		        	function MostrarMensagem(){
		            	$("#errorDesc").show();
		        	} 
		        })
    	</script>
		<!-- <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css"> -->
		
		<title>Lamentamos</title>
	</head>
	
	<body>
	
		<div class="container">
			<h2>Erro</h2>
			<div class="row">
				<div class="alert alert-error">
					Não foi possível realizar a avaliação! Ocorreu o problema: ${ fn:substring(error,0,29)}
				</div>
				<input type="button" value="Voltar" onClick="history.go(-1)"> 
				
				<div align="right"><a href="javascript:void(0)" id="MostrarMensagem" >Detalhes do erro</a></div>
				
				
							<div id="errorDesc">
								<div class="alert alert-error">
										<p>${error}</p>
								</div>
							</div>
				
				
			</div>
			
		</div>
	
		
	</jsp:body>
</t:baseLayout>