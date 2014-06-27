<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:baseLayout>
   <jsp:body>
      
      <!-- Início Conteudo -->
			<div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Recomendação Avaliada</h2>
				</div>
				<p><strong>1. Respeitar os padrões de desenvolvimento web</strong>
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
								     <c:forEach items="${criterio.linhas}" var="linha">
								       <a href="#${linha}" class="sublinharLink">  ${linha}</a> -
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
					<pre>
						<c:forEach items="${detalhe.ocorrencias}" var="ocorrencia">
							<a name="${ocorrencia.line}">${ocorrencia.line}: ${ocorrencia.tag}</a>
						</c:forEach> 
					</pre>
				</div>
			
			</div>	
			<!-- Término Conteudo-->
     
       		
       		
       		
       		
   </jsp:body>
</t:baseLayout>