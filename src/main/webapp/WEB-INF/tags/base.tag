<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="body" fragment="true"%>

<!DOCTYPE html>
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

<!-- 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/domtab.js"></script>
<style type="text/css">
div.domtab div {
	display: none;
}
</style> -->

<title>ASES - Avaliador e Simulador de AcessibilidadE em Sites</title>

</head>

<body>

	<header role="banner">
		<div>
			<div id="topo">
				<ul id="accessibility">
					<li><a accesskey="1" href="#inicioConteudo" id="link-conteudo">Ir
							para o conteúdo <span>1</span>
					</a></li>
					<li><a accesskey="2" href="#footer-brasil" id="link-rodape">Ir
							para o rodapé <span>2</span>
					</a></li>
				</ul>

				<ul id="portal-siteactions">
					<li id="siteaction-accessibility"><a
						href="${pageContext.request.contextPath}/acessibilidade"
						title="Acessibilidade" accesskey="3">ACESSIBILIDADE</a></li>
					<li id="altoContraste"><a href="#contraste" accesskey="4">ALTO
							CONTRASTE</a></li>
					<li id="siteaction-mapadosite"><a
						href="${pageContext.request.contextPath}/mapa-site"
						title="Mapa do Site" accesskey="5">MAPA DO SITE</a></li>
				</ul>
			</div>

			<div id="barra-brasil"
				style="background: #7F7F7F; height: 20px; padding: 0 0 0 10px; display: block;">
				<ul id="menu-barra-temp" style="list-style: none;">
					<li
						style="display: inline; float: left; padding-right: 10px; margin-right: 10px; border-right: 1px solid #EDEDED"><a
						href="http://brasil.gov.br"
						style="font-family: sans, sans-serif; text-decoration: none; color: white;">Portal
							do Governo Brasileiro</a></li>
					<li><a
						style="font-family: sans, sans-serif; text-decoration: none; color: white;"
						href="http://epwg.governoeletronico.gov.br/barra/atualize.html">Atualize
							sua Barra de Governo</a></li>
				</ul>
			</div>

			<div id="logo">
				<h1>
					<a id="portal-logo" title=""
						href="${pageContext.request.contextPath}"> <span
						id="portal-title-1">Avaliador e Simulador de Acessibilidade
							em Sítios<br>
					</span> <span id="portal-title" class="corto">ASES</span><br> <span
						id="portal-description">Governo Federal </span>
					</a>
				</h1>
			</div>
			<div id="sobre">
				<ul>
					<li id="portalservicos-perguntas-frequentes"
						class="portalservicos-item"><a href="perguntas-frequentes"
						title="Perguntas frequentes">Perguntas frequentes</a></li>
					<li id="portalservicos-contato" class="portalservicos-item"><a
						href="contato" title="Contato">Contato</a></li>
						<li id="portalservicos-criterios" class="portalservicos-item"><a
						href="criteriosSucesso" title="Critérios de sucesso">Critérios de sucesso</a></li>
				</ul>
			</div>
		</div>
	</header>

	<div id="main" role="main">

		<div id="content">
			<a id="inicioConteudo" class="oculto" href="#">Início do conteúdo</a>
			<!-- Início Conteudo -->
			<jsp:doBody />
			<!-- Término Conteudo-->
			<a id="fimConteudo" class="oculto" href="#">Fim do conteúdo</a>
		</div>
		<div id="voltar-topo">
			<a href="#inicioConteudo">Voltar para o topo</a>
		</div>
	</div>

	<footer id="footer-brasil" role="contentinfo"> </footer>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/jquery.cookie.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/tab_script.js"></script> 
<!-- -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/inicial_arquivos/js/acessibilidade.js"></script>

	<script defer="defer" src="//barra.brasil.gov.br/barra.js"
		type="text/javascript"></script>
</html>