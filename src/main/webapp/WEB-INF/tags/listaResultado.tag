<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="lista" required="true" type="java.util.List" %>
<%@ attribute name="cssClass" required="true" type="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<c:choose>
    <c:when test="${cssClass == 'mark'}">
    <a id="inicio_${cssClass}" class="oculto">Início do conteúdo das recomendações da seção marcação</a> 
    </c:when>
    
    <c:when test="${cssClass == 'behavior'}">
    <a id="inicio_${cssClass}" class="oculto">Início do conteúdo das recomendações da seção comportamento</a> 
    </c:when>
    
    <c:when test="${cssClass == 'information'}">
    <a id="inicio_${cssClass}" class="oculto">Início do conteúdo das recomendações da seção conteúdo/informação</a> 
    </c:when>
    
    <c:when test="${cssClass == 'presentation'}">
    <a id="inicio_${cssClass}" class="oculto">Início do conteúdo das recomendações da seção apresentação/design</a> 
    </c:when>
    
    <c:when test="${cssClass == 'multimedia'}">
    <a id="inicio_${cssClass}" class="oculto">Início do conteúdo das recomendações da seção multimídia</a> 
    </c:when>
    
    <c:when test="${cssClass == 'form'}">
    <a id="inicio_${cssClass}" class="oculto">Início do conteúdo das recomendações da seção formulários</a> 
    </c:when>
    </c:choose>

<table class="${cssClass}_error">
<c:choose>
    <c:when test="${cssClass == 'mark'}">
    <caption class="imgErro"> <span>Erros da seção marcação</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'behavior'}">
       <caption class="imgErro"> <span>Erros da seção comportamento</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'information'}">
       <caption class="imgErro"> <span>Erros da seção conteúdo/informação</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'presentation'}">
       <caption class="imgErro"> <span>Erros da seção apresentação/design</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'multimedia'}">
       <caption class="imgErro"> <span>Erros da seção multimídia</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'form'}">
       <caption class="imgErro"> <span>Erros da seção formulários</span></caption>
    </c:when>
    </c:choose>		
	
	<thead>
		<tr>
		    <th id="erro_numero_recomendacao_${cssClass}" class="topo2  indiceAvaliar0">Número</th>
			<th id="erro_recomendacao_${cssClass}" class="topo2  indiceAvaliar1"> Recomendações </th>
			<th id="erro_quantidade_${cssClass}" class="topo2"> Quantidade</th>
			<th id="erro_linha_codigo_fonte_${cssClass}" class="topo2"> Linha(s) do código fonte</th>
		</tr>
	</thead>
    
    <tbody>
		<c:forEach items="${lista}" var="item">
			<c:if test="${item.error }">
				<tr id="erro_numero_recomendacao_${cssClass}_${item.checkPoint}">
				   <td headers="erro_numero_recomendacao_${cssClass}" class="celula  indiceAvaliar0"><a class="sublinharLink" href="http://emag.governoeletronico.gov.br/#r${item.checkPoint}">${item.checkPoint} (link para um novo sítio)</a></td>
				   <td headers="erro_recomendacao_${cssClass}" class="celula  indiceAvaliar0"> ${item.description} </td>
				   <td headers="erro_quantidade_${cssClass}" class="celula">${item.numberOfOccurrences} </td>
				   <td headers="erro_linha_codigo_fonte_${cssClass}" class="celula">
	               
				   	<c:choose>
				   		<c:when test="${item.possuiLinhas}">
				   			<a class="sublinharLink" href="${pageContext.request.contextPath}/detalhes-avaliacao/${item.checkPoint}/true">${item.stringLines}</a>
				   		</c:when>
				   		<c:otherwise>
				   			<c:if test="${item.stringLines=='---'}">Requer validaçãoo Humana</c:if>
				   		</c:otherwise>
				   	</c:choose>
	
	                </td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
			
					 	<br>
															
<table class="${cssClass}_warning" id="${cssClass}_aviso">

<c:choose>
    <c:when test="${cssClass == 'mark'}">
    <caption class="imgAviso"><span>Avisos da seção marcação</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'behavior'}">
       <caption class="imgAviso"><span>Avisos da seção comportamento</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'information'}">
      <caption class="imgAviso"><span>Avisos da seção conteúdo/informação</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'presentation'}">
      <caption class="imgAviso"><span>Avisos da seção apresentação/design</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'multimedia'}">
      <caption class="imgAviso"><span>Avisos da seção multimídia</span></caption>
    </c:when>
    
    <c:when test="${cssClass == 'form'}">
       <caption class="imgAviso"><span>Avisos da seção formulários</span></caption>
    </c:when>
    </c:choose>	

	<thead>
		<tr>
		    <th id="aviso_numero_recomendacao_${cssClass}" class="topo2 indiceAvaliar0">Número</th>
			<th id="aviso_recomendacao_${cssClass}" class="topo2 indiceAvaliar1"> Recomendações </th>
			<th id="aviso_quantidade_${cssClass}" class="topo2"> Quantidade</th>
			<th id="aviso_linha_codigo_fonte_${cssClass}" class="topo2"> Linha(s) do código fonte</th>
		</tr>
	</thead>
	
	<tbody>

		<c:forEach items="${lista}" var="item">
	
			<c:if test="${not item.error }">
			
				<tr id="aviso_numero_recomendacao__${cssClass}_${item.checkPoint}">
			   		<td headers="aviso_numero_recomendacao_${cssClass}" class="celula indiceAvaliar0"><a  class="sublinharLink" href="http://emag.governoeletronico.gov.br/#r${item.checkPoint}">${item.checkPoint} (link para um novo sítio)</a></td>
			   		<td headers="aviso_recomendacao_${cssClass}" class="celula indiceAvaliar1"> ${item.description}</td>
			   		<td headers="aviso_quantidade_${cssClass}" class="celula">${item.numberOfOccurrences}</td>
			   		<td headers="aviso_linha_codigo_fonte_${cssClass}" class="celula">
			   			<c:choose>
			   					<c:when test="${item.possuiLinhas}">
									<a class="sublinharLink" href="${pageContext.request.contextPath}/detalhes-avaliacao/${item.checkPoint}/false">${item.stringLines}</a>
			   					</c:when>
				
				   				<c:otherwise>
									<c:if test="${item.stringLines=='---'}">Requer validação Humana</c:if>
			   					</c:otherwise>
		       			</c:choose>
		       		</td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
			
	</table>
	<c:choose>
    <c:when test="${cssClass == 'mark'}">
    <a id="fim_${cssClass}" class="oculto">Fim do conteúdo das recomendações da seção marcação</a> 
    </c:when>
    
    <c:when test="${cssClass == 'behavior'}">
    <a id="fim_${cssClass}" class="oculto">Fim do conteúdo das recomendações da seção comportamento</a> 
    </c:when>
    
    <c:when test="${cssClass == 'information'}">
    <a id="fim_${cssClass}" class="oculto">Fim do conteúdo das recomendações da seção conteúdo/informação</a> 
    </c:when>
    
    <c:when test="${cssClass == 'presentation'}">
    <a id="fim_${cssClass}" class="oculto">Fim do conteúdo das recomendações da seção apresentação/design</a> 
    </c:when>
    
    <c:when test="${cssClass == 'multimedia'}">
    <a id="fim_${cssClass}" class="oculto">Fim do conteúdo das recomendações da seção multimídia</a> 
    </c:when>
    
    <c:when test="${cssClass == 'form'}">
    <a id="fim_${cssClass}" class="oculto">Fim do conteúdo das recomendações da seção formulários</a> 
    </c:when>
    </c:choose>		
