<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<t:baseLayout>
	<jsp:body>
      <!-- Início Conteudo -->
      
      <h2>Exportar Resultado</h2>
      <form name="form" action="${pageContext.request.contextPath}/exportar-detalhes-avaliacao" method="post">
	      <fieldset>
			    <legend>
					Tipos de Exportação
				</legend>
				
				<p>
				   <img	src="${pageContext.request.contextPath}/inicial_arquivos/imagens/pdf.png" alt="pdf" title="Gerar em PDF" height="20" width="20">
				   <input type="radio" name="tiporel" value="4">PDF	
				   <input type="hidden" name="rn" value="${rn}">
				   <input type="hidden" name="isError" value="${isError}">
		           <input class="submit" name="executar" value="Executar" type="submit">			  
				</p>
		  </fieldset>
	  </form>
    
	  <div class="tile --NOVALUE--">	
			<div class="outstanding-header">
				<h2 class="outstanding-title">Página Avaliada</h2>
			</div>
		
			<c:if test="${not empty url}">
				<strong>Página:</strong> ${url} <br>
			</c:if>
			<strong>Título:</strong> ${titulosite} <br>
			<strong>Tamanho:</strong> ${contentLenght} Bytes <br>
			<strong>Data/Hora:</strong> ${data}
      </div>
    
    
	  <div class="tile --NOVALUE--">	
			<div class="outstanding-header">
				<h2 class="outstanding-title">Recomendação Avaliada</h2>
			</div>
			<strong>${recomendacao}</strong>
	  </div>
			
	  <div class="tile --NOVALUE--">
	  		<div class="outstanding-header">
    	    	<h2 class="outstanding-title">Critério(s) Avaliado(s)</h2>
			</div>
				
			<table id="tabelaErros2">
			<caption>Tabela de Erros</caption>
				 <thead>								
						<tr>
						    <th id="numero" class="topo2">Número</th>
							<th id="teste" class="topo2">Teste(s)</th>
							<th id="quantidade" class="topo2">Quantidade</th>
							<th id="linhaCodigoFonte" class="topo2">Linha(s) de Código Fonte</th>
						</tr>
	             </thead>
					            
			     <tbody>
				 	 <c:forEach items="${detalhe.criterios}" var="criterio">
						<tr>
						   <td headers="numero" class="celula"> ${criterio.id} </td>
						   <td headers="teste" class="celula">${criterio.descricao}</td>
						   <td headers="quantidade" class="celula">
								   	
        			   	   		<c:choose>
						  			<c:when test="${rn == '1.1'}">
						   				<c:choose>
						   					<c:when test="${criterio.id == 1 }">
							   						${qtdOcorrenciasHtml}
						   					</c:when>
											<c:when test="${criterio.id == 2 }">
								   					${qtdOcorrenciasCss}
								   			</c:when>
								   			<c:otherwise>
													${criterio.numeroOcorrencias}
											</c:otherwise>
								   		</c:choose>
									</c:when>
								   			<c:otherwise>
								   				${criterio.numeroOcorrencias}
									   		</c:otherwise>
						   		</c:choose>
						   </td>
						   
						   <td headers="linhaCodigoFonte" class="celula">
								   <c:set var="aReq" value="${aReq}" />
								   <c:set var="req" value="${rn}.${criterio.id}" />
								       <c:choose> 
											   <c:when test="${fn:contains(aReq, req)}">
											   		<c:forEach items="${criterio.linhasColunas}" var="linha" varStatus="index">
											   			<c:if test="${fn:contains(aReqIsW3c, req)}">
									     					<c:if test="${fn:contains(aReqIsCss, req)}">
													     	      <a href=" http://jigsaw.w3.org/css-validator/validator?uri=${url}" target="_blanck">
													     						   Servi&ccedil;o de valida&ccedil;&atilde;o de CSS do W3C (link para um novo sitio)
												 				  </a>
														    </c:if>
															
															<c:if test="${!fn:contains(aReqIsCss, req)}">
													     	      <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2F${url}" target="_blanck">
													     				       		Servi&ccedil;o de valida&ccedil;&atilde;o de HTML do W3C (link para um novo sitio)
													     		  </a>
														    </c:if>
									     			    </c:if>
											   		
											   		    <c:if test="${!fn:contains(aReqIsW3c, req)}">
											   					--
											   		    </c:if>
											   		
												     </c:forEach>
											   </c:when>
											   
											   
											    <c:otherwise>
											    	<ul>
														<c:forEach items="${criterio.linhasColunas}" var="linha" varStatus="index">
									         	     		<c:set var="lineOcc" value="${fn:split(linha, '.')}" />
																<li id="linhaCodigoFonte_${criterio.id}.${linha}" style="display:inline"><a href="#${criterio.id}.${linha}" class="sublinharLink">${lineOcc[0]}</a>
														    		<c:if test="${index.index !=  fn:length(criterio.linhas) -1}"> - 
																	</c:if>
																</li>
													 	</c:forEach>
													</ul> 
											     </c:otherwise>
									</c:choose>		   
											   
							    <c:if test="">
								   
							    </c:if>
							  
								    
						</td>
								</tr>

					        </c:forEach> 
							</tbody>
								
						</table>
			     </div>
			
			
			
			<div class="tile --NOVALUE--">
			    <div class="outstanding-header">
					<h2 class="outstanding-title">Código Fonte</h2>
				</div>
				
				<div id="codigo">
					<pre style="overflow: auto; width:100%; height:400px; border:1px solid #cccccc; display:block; white-space:nowrap">					
						<c:forEach items="${listOcorrencia}" var="ocorrencia" varStatus="index">
							<c:set var="aReq" value="${aReq}"/>
							<c:set var="req" value="${rn}.${ocorrencia.criterio}"/>
								<c:if test="${!fn:contains(aReq, req)}">
									<c:choose>
										<c:when test="${ocorrencia.cssEvaluation}">
											<a id="${ocorrencia.criterio}.${ocorrencia.posLineOccurrence}" href="http://jigsaw.w3.org/css-validator/validator?uri=${ocorrencia.tag}" target="_blank">${ocorrencia.line} : Serviço de validação de CSS do W3C : ${ocorrencia.tag}</a>
					            		</c:when>
					            		<c:when test="${ocorrencia.htmlEvaluation}">
					            			<a id="${ocorrencia.criterio}.${ocorrencia.posLineOccurrence}" href="https://validator.w3.org/nu/?doc=${ocorrencia.tag}" target="_blank">${ocorrencia.line} : Serviço de validação de HTML do W3C : ${ocorrencia.tag}</a>
										</c:when>
										<c:otherwise>
											<a id="${ocorrencia.criterio}.${ocorrencia.posLineOccurrence}">${ocorrencia.line} : ${ocorrencia.tag}</a><br>
								 		</c:otherwise>
							 		</c:choose>
							 	</c:if>
						</c:forEach>						
					</pre>
				</div>
			</div>	
			      		
       		
   </jsp:body>
</t:baseLayout>