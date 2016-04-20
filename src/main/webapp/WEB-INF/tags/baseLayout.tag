<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="body" fragment="true"%>

<!DOCTYPE             html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />


<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/default.css"
	media="screen">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/tab_css.css"
	media="screen">
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/tabAvaliar.css"
	media="screen">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/avaliar.css"
	media="screen">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/detalhesAvaliacao.css"
	media="screen">
	
		<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/criterioSucesso.css"
	media="screen">
	
			<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/contato.css"
	media="screen">
	
			<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/mapa.css"
	media="screen">
	
			<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/perguntasFrequentes.css"
	media="screen">
	
		<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/barra_brasil.css"
	media="screen">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/breadcrumb.css"
	media="screen">	
	

	
<!--  <title>ASES - Avaliador e Simulador de AcessibilidadE em Sites</title>-->
<title>${tituloPagina}</title>

</head>

<body>

	<header id="topoPagina">
		<div>
			<div id="topo">
				<ul id="accessibility">
					<li><a accesskey="1" href="#inicioConteudo" id="link-conteudo">Ir
							para o conteúdo <span>1</span>
					</a></li>
					<li><a accesskey="4" href="#footer-brasil" id="link-rodape">Ir
							para o rodapé <span>4</span>
					</a></li>
				</ul>

				<ul id="portal-siteactions">
					<li id="siteaction-accessibility"><a
						href="${pageContext.request.contextPath}/acessibilidade"
						accesskey="3">ACESSIBILIDADE</a></li>
					<li id="altoContraste"><a accesskey="4">ALTO
							CONTRASTE</a></li>
					<li id="siteaction-mapadosite"><a
						href="${pageContext.request.contextPath}/mapa-site"
						 accesskey="5">MAPA DO SITE</a></li>
				</ul>
			</div>


			<div id="barra-brasil" class="barra_brasil">
				
				<ul id="menu-barra-temp">
					<li><a class="primeiro-link" href="http://brasil.gov.br">Portal
							do Governo Brasileiro</a>
					</li>
					<li><a class="segundo-link"
						href="http://epwg.governoeletronico.gov.br/barra/atualize.html">Atualize
							sua Barra de Governo</a></li>
				</ul>
			</div>
			<div id="logo">
				<h1>
				<span
						id="portal-title-1">Avaliador e Simulador de Acessibilidade
							em Sítios<br>
					</span> 
					<a id="portal-logo"
						href="${pageContext.request.contextPath}"> <span id="portal-title" class="corto">ASES</span><br> 
					</a>
					<span
						id="portal-description">Governo Federal </span>
				</h1>
			</div>
			<nav id="sobre">
				<ul>
				<!--	<li id="portalservicos-perguntas-frequentes"
						class="portalservicos-item"><a href="${pageContext.request.contextPath}/perguntas-frequentes">Perguntas frequentes</a></li>
						-->
					<li id="portalservicos-contato" class="portalservicos-item">
					<!-- <a	href="${pageContext.request.contextPath}/contato">Contato</a> -->
					<a href="http://www.governoeletronico.gov.br/contato">Contato (link para um novo sítio)</a>
					</li>
						<li id="portalservicos-criterios" class="portalservicos-item"><a
						href="${pageContext.request.contextPath}/criteriosSucesso">Critérios de sucesso</a></li>					
				</ul>
			</nav>
		</div>
	</header>

	<div id="main" role="main">  

		<div id="content">
			<a id="inicioConteudo" class="oculto">Início do conteúdo</a>
			<!-- Início Conteudo -->
			<jsp:doBody />
			<!-- Término Conteudo-->
			<a id="fimConteudo" class="oculto">Fim do conteúdo</a>
		</div>
		<div id="voltar-topo">
			<a href="#topoPagina">Voltar para o topo</a>
		</div>
	</div>

	<footer id="footer-brasil"> </footer>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/jquery-1.10.2.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/jquery.cookie.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/tab_script.js"></script> 
		<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/tab_avaliar_script.js"></script> 

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/acessibilidade.js"></script>
		
			<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/avaliar.js"></script>

<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/detalhesAvaliacao.js"></script>

	<!--  	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap.js"></script>-->
		
	<script defer="defer" src="//barra.brasil.gov.br/barra.js"
		type="text/javascript"></script>
</body></html>
