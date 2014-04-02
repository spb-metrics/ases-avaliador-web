<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:baseLayout>
   <jsp:body>
       <div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Mapa do Site</h2>
				</div>
			</div>
			
			<div id="content-core">
			
			<ul id="portal-sitemap" class="navTreeLevel0 visualNoMarker">
						<li class="navTreeItem visualNoMarker">
							<div>
		  						<a href="http://tv1-lnx-04.grupotv1.com/portalmodelo/servicos" title="" class="state-published contenttype-folder">
									<span>Serviços</span>
								</a>
							</div>
							
							<ul class="navTree navTreeLevel2">
									<li class="navTreeItem visualNoMarker">
										<div>
											<a href="${pageContext.request.contextPath}" title="" class="state-published contenttype-link">
												<span>Avaliador e Simulador de Acessibilidade em Sítios</span>
											</a>
										</div>
									</li>
									<li class="navTreeItem visualNoMarker">
										<div>
											<a href="${pageContext.request.contextPath}/perguntas-frequentes"  class="state-published contenttype-link">
												<span>Perguntas frequentes</span>
											</a>
										</div>
									</li>
									<li class="navTreeItem visualNoMarker last-item">
										<div>
											<a href="${pageContext.request.contextPath}/contato" class="state-published contenttype-link">
												<span>Contato</span>
											</a>
										</div>
									</li>
							</ul>
						</li>
						
						<li class="navTreeItem visualNoMarker">
							<div>
								<span>Redes Sociais</span>
							</div>
							<ul class="navTree navTreeLevel2">
								<li class="navTreeItem visualNoMarker">
									<div>
										<a href="https://twitter.com/twitter" class="state-published contenttype-folder">
											<span>Twitter</span>
										</a>
									</div>
								</li>
								<li class="navTreeItem visualNoMarker">
									<div>
										<a href="http://youtube.com/youtube"  class="state-published contenttype-folder">
											<span>You Tube</span>
										</a>
									</div>
								</li>
								<li class="navTreeItem visualNoMarker">
									<div>
										<a href="http://www.facebook.com/facebook"  class="state-published contenttype-folder">
											<span>Facebook</span>
										</a>
									</div>
								</li>
								<li class="navTreeItem visualNoMarker last-item">
									<div>
										<a href="http://flickr.com/flickr" class="state-published contenttype-folder">
											<span>Flickr</span>
										</a>
									</div>
								</li>
							</ul>
						</li>			
						
						<li class="navTreeItem visualNoMarker">
							<div>
								<span>Sobre o site</span>
							</div>
							<ul class="navTree navTreeLevel2">
								<li class="navTreeItem visualNoMarker last-item">
									<div>
										<a href="pagina_acessibilidade.htm" title="Institucional" class="state-published contenttype-folder">
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