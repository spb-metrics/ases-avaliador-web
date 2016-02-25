<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="body" fragment="true"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
 <meta charset="UTF-8" />


<!-- Códigos necessários para trabalhar esta página-->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/default.css"
	media="screen">
	
 <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inicial_arquivos/css/domtab.css"
	media="screen">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/domtab.js"></script>
<style type="text/css">
div.domtab div {
	display: none;
}
</style>

<script
	src="${pageContext.request.contextPath}/inicial_arquivos/js/widgets.js"
	id="twitter-wjs"></script>
<script
	src="${pageContext.request.contextPath}/inicial_arquivos/js/ga.js"
	async="" type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/inicial_arquivos/js/all.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourceplone.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourceplone_003.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourceplone_002.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourcecollective_004.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourcecollective_002.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourcecollective_003.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/legendothers_translation.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourcecollective.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/inicial_arquivos/js/resourcejquery.js"></script>
<title>ASES - Avaliador e Simulador de AcessibilidadE em Sites</title>

</head>

<body>

	<header role="banner"
		class="template-view portaltype-collective-cover-content site-portal section-home userrole-anonymous">
		<div id="barra-brasil">
			<a href="http://brasil.gov.br"
				style="background: #7F7F7F; height: 20px; padding: 4px 0 4px 10px; display: block; font-family: sans, sans-serif; text-decoration: none; color: white;">Portal
				do Governo Brasileiro</a>
			<script src="http://barra.brasil.gov.br/barra.js?cor=verde"
				type="text/javascript"></script>
		</div>
		<div id="accessibility">
			<ul>
				<li><a accesskey="1" href="#content" id="link-conteudo">Ir
						para o conteúdo <span>1</span>
				</a></li>
				<li><a accesskey="2" href="#footer" id="link-rodape">Ir
						para o rodapé <span>2</span>
				</a>
			</ul>
		</div>
		<div id="portal-siteactions">
			<ul>
				<li id="siteaction-accessibility"><a
					href="${pageContext.request.contextPath}/acessibilidade"
					title="Acessibilidade" accesskey="3">ACESSIBILIDADE</a></li>
				<li id="siteaction-contraste"><a href="#contraste"
					title="Alto Contraste" accesskey="4">ALTO CONTRASTE</a></li>
				<li class="last-item" id="siteaction-mapadosite"><a
					href="${pageContext.request.contextPath}/mapa-site"
					title="Mapa do Site" accesskey="5">MAPA DO SITE</a></li>
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
			</ul>
		</div>
	</header>

	<div id="main" role="main">
		<div id="content">

			<!-- Início Conteudo -->
			<jsp:doBody />
			<!-- Término Conteudo-->

		</div>
		<div id="voltar-topo">
			<a href="#header">Voltar para o topo</a>
		</div>
	</div>

	<footer role="contentinfo">
		<div>
			<ul>
				<li><a href="http://www.acessoainformacao.gov.br/"
					class="logo-acesso"> <img
						src="${pageContext.request.contextPath}/inicial_arquivos/imagens/acesso-a-infornacao.png"
						alt="Acesso a Informação"></a></li>
				<li class="last-item"><a href="http://www.brasil.gov.br/"
					class="logo-brasil"> <img
						src="${pageContext.request.contextPath}/inicial_arquivos/imagens/brasil.png"
						alt="Brasil - Governo Federal"></a></li>
			</ul>
		</div>
	</footer>
</body>
</html>
