<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<t:baseLayout>
	<jsp:body>

		<div class="funcionalidades">
		<ul class="breadcrumb">
			<li>
				<span>Você está em: </span>
			</li>
			<li><a href="${pageContext.request.contextPath}">ASES</a></li>
			<li><a id="voltar" href="#">|  Resumo de avaliação  |</a></li>			
			<li>Detalhes de Avaliação da recomendação ${rn}</li>
		</ul>
	</div>
	
	
      <!-- Início Conteudo -->
      
         
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
    
    <hr class="hr_linhaDupla">
    
	  <div class="tile --NOVALUE--">	
			<div class="outstanding-header">
				<h2 class="outstanding-title">Recomendação Avaliada</h2>
			</div>
			<strong> ${rn} ${recomendacao}</strong>
	  </div>
			<hr class="hr_linhaDupla">
	  <div class="tile --NOVALUE--">
	  		<div class="outstanding-header">
    	    	<h2 class="outstanding-title">Critério(s) Avaliado(s)</h2>
			</div>
				
			<table id="tabelaErros2">
			<caption>Tabela de Erros</caption>
				 <thead>								
						<tr>
						    <th id="numero" class="topo2 indiceDetalhes0">Número</th>
							<th id="teste" class="topo2 indiceDetalhes1">Teste(s)</th>
							<th id="quantidade" class="topo2">Quantidade</th>
							<th id="linhaCodigoFonte" class="topo2">Linha(s) de Código Fonte</th>
						</tr>
	             </thead>
					            
			     <tbody>
				 	 <c:forEach items="${detalhe.criterios}" var="criterio">
				 	
						<tr>
							<!-- retirar o ponto da recomendação -->
							<c:set var="var_recomendacaoComPonto" value="${rn}" />
							<c:set var="var_RecomendacaoSemPonto"
								value="${fn:replace(var_recomendacaoComPonto,'.','')}" />
						   <td headers="numero" class="celula"><a
								href="${pageContext.request.contextPath}/criteriosSucesso#criterio_${var_RecomendacaoSemPonto}${criterio.id}"> ${criterio.id} </a></td>
						   <!-- Fim retirar o ponto da recomendação -->
						   
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
											   		<c:forEach items="${criterio.linhasColunas}" var="linha"
											varStatus="index">
											   			<c:if test="${fn:contains(aReqIsW3c, req)}">
									     					<c:if test="${fn:contains(aReqIsCss, req)}">
													     	      <a
														href=" http://jigsaw.w3.org/css-validator/validator?uri=${url}"> Serviço de validação de CSS do W3C (link para um novo sitio)
												 				  </a>
														    </c:if>
															
															<c:if test="${!fn:contains(aReqIsCss, req)}">
													     	      <a
														href="http://validator.w3.org/check?uri=http%3A%2F%2F${url}">Serviçoo de validação de HTML do W3C (link para um novo sitio)
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
														<c:forEach items="${criterio.linhasColunas}" var="linha"
												varStatus="index">
									         	     		<c:set var="lineOcc"
													value="${fn:split(linha, '.')}" />
									         	     		
									         	     <%--Para trocar os "." por "_" devido problemas com css  --%>
									         	    
									         	    <c:set var="var_01"
													value="${criterio.id}_${linha}" />
													<c:set var="linhaSelecionar"
													value="${fn:replace(var_01,'.','_')}" />
													
													<%-- ***********  --%>
													
																<li id="linhaCodigoFonte_${criterio.id}.${linha}"><a
													href="#selecionar_${linhaSelecionar}" class="sublinharLink">${lineOcc[0]}</a>
														    		<c:if
														test="${index.index !=  fn:length(criterio.linhas) -1}"> - 
																	</c:if>
																</li>
																
													 	</c:forEach>
													</ul> 
											     </c:otherwise>
									</c:choose>	   
											   							  				  		    
						</td>
								</tr>

					        </c:forEach> 
							</tbody>
								
						</table>
			     </div>
			
			<hr class="hr_linhaDupla">
			
			<div class="tile --NOVALUE--">
			    <div class="outstanding-header">
					<h2 class="outstanding-title">Código Fonte</h2>
				</div>
				
				<div id="codigo">
					<pre>					
						<c:forEach items="${listOcorrencia}" var="ocorrencia"
						varStatus="index">
							<c:set var="aReq" value="${aReq}" />
							<c:set var="req" value="${rn}.${ocorrencia.criterio}" />
								<c:if test="${!fn:contains(aReq, req)}">
									<c:choose>
										<c:when test="${ocorrencia.cssEvaluation}">
											<a
										id="${ocorrencia.criterio}.${ocorrencia.posLineOccurrence}"
										href="http://jigsaw.w3.org/css-validator/validator?uri=${ocorrencia.tag}">${ocorrencia.line} : Serviço de validação de CSS do W3C : ${ocorrencia.tag}</a>
					            		</c:when>
					            		<c:when test="${ocorrencia.htmlEvaluation}">
					            			<a id="${ocorrencia.criterio}.${ocorrencia.posLineOccurrence}">${ocorrencia.line} : Serviço de validação de HTML do W3C : ${ocorrencia.tag}</a>
										</c:when>
										<c:otherwise>
										
										 <%--Para trocar os "." por "_" devido problemas com css  --%>
									         	    
									         	    <c:set var="var_01"
										value="${ocorrencia.criterio}_${ocorrencia.posLineOccurrence}" />
													<c:set var="linhaSelecionar"
										value="${fn:replace(var_01,'.','_')}" />
													
													<%-- ***********  --%>
										
											<a id="selecionar_${linhaSelecionar}">${ocorrencia.line} : ${ocorrencia.tag}</a>
									<br>
								 		</c:otherwise>
							 		</c:choose>
							 	</c:if>
						</c:forEach>						
					</pre>
				</div>
			</div>	
			<br>
		<hr class="hr_linhaDupla">
		
		<h2 class="outstanding-title">Aviso</h2>


<p>Avaliação tem por base testes automáticos em código-fonte (X)HTML interpretados do <a href="http://emag.governoeletronico.gov.br/">Modelo de Acessibilidade em Governo Eletrônico (eMAG) (link para novo sítio)</a>. </p>

<p>Lembrar que nota não contempla os itens classificados como avisos e os itens passíveis de avaliação humana. Para saber quais testes são contemplados pelo software, <a href="${pageContext.request.contextPath}/criteriosSucesso">favor verificar os critérios de sucesso trabalhados pelo ASESWEB</a>.<p> 


			<hr class="hr_linhaDupla">     	
			<div class="tile --NOVALUE--">
	
	 <h2 class="outstanding-title">Exportar Resultado</h2>
	
      <form name="form"
				action="${pageContext.request.contextPath}/exportar-detalhes-avaliacao"
				method="post">
	      <fieldset>
			    <legend>
					Tipos de Exportação
				</legend>
				
				<br>
				   <img
						src="${pageContext.request.contextPath}/inicial_arquivos/imagens/pdf.png"
						alt="pdf" title="Gerar em PDF">
				   <input type="radio" id="tiporel" value="4" checked="checked"><label
						for="tiporel">PDF</label>
				   <input type="hidden" name="rn" value="${rn}">
				   <input type="hidden" name="isError" value="${isError}">
		           <input class="submit" name="executar" value="Executar"
						type="submit">			  
			
		  </fieldset>
	  </form>	
       		</div>
   </jsp:body>
</t:baseLayout>