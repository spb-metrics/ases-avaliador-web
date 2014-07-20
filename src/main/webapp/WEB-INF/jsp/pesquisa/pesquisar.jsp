<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:baseLayout>
   <jsp:body>
     <div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Resultado da Pesquisa</h2>
				</div>
			</div>
			
			<div id="content-core">
			
					<div id="search-results">
						
						<dl class="searchResults">
							<dt class="contenttype-collective-nitf-content">	
								<a href="contato.html" class="state-published">Formulário de Contato
								</a>
							</dt>
							<dd>
								<cite class="documentLocation link-location">
                                  <span>Localizado em</span>
									<span dir="ltr">
                                    	<a href="${pageContext.request.contextPath}/contato">Contato					
										</a>
                                    </span>
								</cite>
                             </dd>
							 <dt class="contenttype-collective-nitf-content">	
								<a href="perguntas_frequentes.htm" class="state-published">Pergunta 1
								</a>
							</dt>
							<dd>
								<cite class="documentLocation link-location">
                                  <span>Localizado em</span>
									<span dir="ltr">
                                    	<a href="${pageContext.request.contextPath}/perguntas-frequentes">Perguntas Frequentes					
										</a>
                                    </span>
								</cite>
                             </dd>		
					</div>
			
			<div class="outstanding-header">
			</div>
			
			<span><strong>Total de Páginas: </strong>7</span>
			
			<div class="listingBar">
    
				<!-- Link to first -->
    
				<!-- Current page -->
    
        		[<span>1</span>]
    
				<!-- Pagelist with links to next pages for quick navigation -->
    
				<a href="">2</a>
				
				
				<a href="">3</a>
				
				<!-- Link to last -->
				<span>
					
					   ...
					
					<a href="">7</a>
				</span>
				
			</div>
						
			</div>
   </jsp:body>
</t:baseLayout>