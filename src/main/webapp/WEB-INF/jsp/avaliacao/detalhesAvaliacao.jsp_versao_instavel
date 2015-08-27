<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<t:baseLayout>
   <jsp:body>
      <!-- Início Conteudo -->
      
      <form name="form" action="${pageContext.request.contextPath}/exportar-detalhes-avaliacao" method="post">
	      <fieldset>
			   <legend><label for="uri">Exportar Resultado</label></legend>
				<p>
				   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/pdf.png" alt="pdf" title="Gerar em PDF" height="20" width="20">
				   <input type="radio" name="tiporel" value="4">PDF
				   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/odt.png" alt="odt" title="Gerar em ODT" height="20" width="20">
				   <input type="radio" name="tiporel" value="3">ODT
				   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/xls.png" alt="xls" title="Gerar em XLS" height="20" width="20">
				   <input type="radio" name="tiporel" value="2">XLS
				   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/csv_text.png" alt="csv" title="Gerar em CSV" height="20" width="20">
				   <input type="radio" name="tiporel" value="5">CSV
				   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/doc-rtf.png" alt="xls" title="Gerar em RFT" height="20" width="20">
				   <input type="radio" name="tiporel" value="1">RTF
				   <input type="hidden" name="rn" value="${rn}">
		           <input class="submit" name="executar" value="Gerar" type="submit">
				</p>
		  </fieldset>
	  </form>
    
			<div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Recomendação Avaliada</h2>
				</div>
				<p><strong>${recomendacao}</strong>
			</div>
			
			<div class="tile --NOVALUE--">
				<div class="outstanding-header">
    		    	<h2 class="outstanding-title">Critério(s) Avaliado(s)</h2>
				</div>
				
				<table id="tabelaErros2">
								<tbody>
								
								<tr>
									<td colspan="2" class="topo2"> Teste(s) </td>
									<td width="9%" class="topo2"> Quantidade</td>
									<td width="56%" class="topo2"> Linha(s) de Cógido Fonte</td>
								</tr>
					
					 	 <c:forEach items="${detalhe.criterios}" var="criterio">
								<tr>
								   <td class="celula" width="2%"> ${criterio.id} </td>
								   <td class="celula" width="60%" align="left">${criterio.descricao}</td>
								   
								   <td class="celula">${criterio.numeroOcorrencias}</td>
								   <td class="celula">
								     <c:forEach items="${criterio.linhasColunas}" var="linha" varStatus="index">
								     
								     	<c:set var="lineOcc" value="${fn:split(linha, '.')}" />
								     	<a href="#${criterio.id}.${linha}" class="sublinharLink">${lineOcc[0]}</a>
								       	<c:if test="${index.index !=  fn:length(criterio.linhas) -1}"> - </c:if>
					
								     </c:forEach> 
								   </td>
								</tr>

					</c:forEach> 
							</tbody>
								
						</table>
			</div>
			
			
			
			<div class="tile --NOVALUE--" align="left">
			
				<div class="outstanding-header" align="left">
					<h2 class="outstanding-title">Código Fonte</h2>
				</div>
				<div id="codigo" align="left">
					<%-- <c:set var="testeCrit" value="${listOcorrencia[0].criterio}"/>
					<c:set var="count1" value="0"/> --%>
					
					<pre>
						<c:forEach items="${listOcorrencia}" var="ocorrencia" varStatus="index">
							<a name="${ocorrencia.criterio}.${ocorrencia.posLineOccurrence}">${ocorrencia.line} : ${ocorrencia.tag}</a>
						</c:forEach> 
					</pre>
				</div>
			
			</div>	
			<!-- Término Conteudo-->
     
       		<%--  --%>
       		
       		
       		
   </jsp:body>
</t:baseLayout>