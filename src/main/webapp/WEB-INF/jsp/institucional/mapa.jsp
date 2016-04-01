<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:baseLayout>
   <jsp:body>
       <div class="funcionalidades">
	   		<ul class="breadcrumb">
				<li>
					<span>Você está em:</span>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}">Página Inicial  |</a>
				</li>
               	<li>Mapa do Site</li>
			</ul>
	   </div>
       
   
       <div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Mapa do Site</h2>
				</div>
		</div>
			
		<div>
			
			<ul id="mapaSite">
				<li>
					<div>
		  				<h3><span>Serviços</span></h3>
					</div>
					
					<ul>
					<li class="linhasMapa">										
						<div>
							<a href="${pageContext.request.contextPath}"><span>Avaliador e Simulador de Acessibilidade em Sítios</span></a>
						</div>
					</li>
									
					<li class="linhasMapa">
						<div>
							<a href="${pageContext.request.contextPath}/perguntas-frequentes">
								<span>Perguntas Frequentes</span>
							</a>
						</div>
					</li>
					
					<li class="linhasMapa">
						<div>
							<a href="${pageContext.request.contextPath}/contato">
								<span>Contato</span>
							</a>
						</div>
					</li>
					
					<li class="linhasMapa">
						<div>
							<a href="${pageContext.request.contextPath}/criteriosSucesso">
								<span>Critérios de Sucesso</span>
							</a>
						</div>
					</li>
					</ul>
				</li>
						
				<li>
					<div>
						<h3><span>Sobre o site</span></h3>
					</div>
					<ul>
						<li class="linhasMapa">
							<div>
								<a href="${pageContext.request.contextPath}/acessibilidade">
									<span>Acessibilidade</span>
								</a>
							</div>
						</li>
					</ul>
				</li>
				</ul>
			
			
			</div>
   </jsp:body>
</t:baseLayout>