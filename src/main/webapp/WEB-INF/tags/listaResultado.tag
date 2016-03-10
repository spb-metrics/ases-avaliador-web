<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="lista" required="true" type="java.util.List" %>
<%@ attribute name="cssClass" required="true" type="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<p><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/stop.gif" alt="Erros" height="19" width="20"> Erros</p>

<table class="${cssClass}_error">
	<caption>Tabela de Erros</caption>
	<thead>
		<tr>
		    <th id="erro_numero_recomendacao_${cssClass}" class="topo2">Numero</th>
			<th id="erro_recomendacao_${cssClass}" class="topo2"> Recomendações </th>
			<th id="erro_quantidade_${cssClass}" class="topo2"> Quantidade</th>
			<th id="erro_linha_codigo_fonte_${cssClass}" class="topo2"> Linha(s) do código fonte</th>
		</tr>
	</thead>
    
    <tbody>
		<c:forEach items="${lista}" var="item">
			<c:if test="${item.error }">
				<tr id="erro_numero_recomendacao_${cssClass}_${item.checkPoint}">
				   <td headers="erro_numero_recomendacao_${cssClass}" class="celula"><a target="_blank" class="sublinharLink" href="http://emag.governoeletronico.gov.br/#r${item.checkPoint}">${item.checkPoint}</a></td>
				   <td headers="erro_recomendacao_${cssClass}" class="celula"> ${item.description} </td>
				   <td headers="erro_quantidade_${cssClass}" class="celula">${item.numberOfOccurrences} </td>
				   <td headers="erro_linha_codigo_fonte_${cssClass}" class="celula">
	               
				   	<c:choose>
				   		<c:when test="${item.possuiLinhas}">
				   			<a class="sublinharLink" href="detalhes-avaliacao/${item.checkPoint}/true">${item.stringLines}</a>
				   		</c:when>
				   		<c:otherwise>
				   			<c:if test="${item.stringLines=='---'}">Requer valida&ccedil;&atilde;o Humana</c:if>
				   		</c:otherwise>
				   	</c:choose>
	
	                </td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
			
<p><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/alert.gif" alt="alertas" height="19" width="20"> Avisos</p>	
					 	
															
<table class="${cssClass}_warning">
	<caption>Tabela de Avisos</caption>
	<thead>
		<tr>
		    <th id="aviso_numero_recomendacao_${cssClass}" class="topo2">Número</th>
			<th id="aviso_recomendacao_${cssClass}" class="topo2"> Recomendações </th>
			<th id="aviso_quantidade_${cssClass}" class="topo2"> Quantidade</th>
			<th id="aviso_linha_codigo_fonte_${cssClass}" class="topo2"> Linha(s) do código fonte</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${lista}" var="item">
			<c:if test="${not item.error }">
				<tr id="aviso_numero_recomendacao__${cssClass}_${item.checkPoint}">
			   		<td headers="aviso_numero_recomendacao_${cssClass}" class="celula"><a target="_blank" class="sublinharLink" href="http://emag.governoeletronico.gov.br/#r${item.checkPoint}">${item.checkPoint}</a></td>
			   		<td headers="aviso_recomendacao_${cssClass}" class="celula"> ${item.description}</td>
			   		<td headers="aviso_quantidade_${cssClass}" class="celula">${item.numberOfOccurrences}</td>
			   		<td headers="aviso_linha_codigo_fonte_${cssClass}" class="celula">
			   			<c:choose>
			   					<c:when test="${item.possuiLinhas}">
									<a class="sublinharLink" href="detalhes-avaliacao/${item.checkPoint}/false">${item.stringLines}</a>
			   					</c:when>
				
				   				<c:otherwise>
									<c:if test="${item.stringLines=='---'}">Requer valida&ccedil;&atilde;o Humana</c:if>
			   					</c:otherwise>
		       			</c:choose>
		       		</td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
			
	</table>
		
	<script type="text/javascript">
    	$('.${cssClass}_error').each(function(index){
  		    if($(this).find('tbody tr').length == 0){
    		  	$(this).before( "<p>A seção não apresentou erros!</p>" );
    		  	$(this).hide();
    		}
  		 });
		  
		 $('.${cssClass}_warning').each(function(index){
	  	    if($(this).find('tbody tr').length == 0){
	    	  $(this).before( "<p>A seção não apresentou avisos!</p>" );
	    	  $(this).hide();
	    	}
	  	 });
	</script>
