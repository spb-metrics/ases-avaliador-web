<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="lista" required="true" type="java.util.List" %>
<%@ attribute name="cssClass" required="true" type="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<p><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/stop.gif" alt="Erros" height="19" width="20"> Erros</p>
	<table id="tabelaErros2" class="${cssClass}_error">
	
		<thead>
			<tr>
				<td colspan="2" class="topo2"> Recomendações </td>
				<td width="9%" class="topo2"> Quantidade</td>
				<td width="56%" class="topo2"> Linha(s) do código fonte</td>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach items="${lista}" var="item">
				<c:if test="${item.error }">
					<tr>
					   <td class="celula" width="2%"><a target="_blank" class="sublinharLink" href="http://emag.governoeletronico.gov.br/#r${item.checkPoint}">${item.checkPoint}</a></td>
					   <td class="celula" width="60%" align="left"> ${item.description}</td>
					   
					   <td class="celula">${item.numberOfOccurrences}</td>
					   <td class="celula">
					   	<c:choose>
					   		<c:when test="${item.possuiLinhas }">
					   			<a class="sublinharLink" href="detalhes-avaliacao/${item.checkPoint}">${item.stringLines}</a>
					   		</c:when>
					   		<c:otherwise>
					   			${item.stringLines}
					   		</c:otherwise>
					   	</c:choose>
					   </td>
					</tr>
				</c:if>
			</c:forEach>
			
			</tbody>
								
		</table>
		<br><br>
		
		<p><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/alert.gif" alt="alertas" height="19" width="20"> Avisos</p>	
					 	
															
		<table width="62%" id="tabelaErros2" class="${cssClass}_warning">
			<thead>
				<tr>
					<td colspan="2" class="topo2"> Recomendações </td>
					<td width="9%" class="topo2"> Quantidade</td>
					<td width="56%" class="topo2"> Linha(s) do código fonte </td>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${lista}" var="item">
				<c:if test="${not item.error }">
	
					<tr>
					   <td class="celula" width="2%"><a target="_blank" class="sublinharLink" href="http://emag.governoeletronico.gov.br/#r${item.checkPoint}">${item.checkPoint}</a></td>
					   <td class="celula" width="60%" align="left"> ${item.description}</td>
					   
					   <td class="celula">${item.numberOfOccurrences}</td>
					   <td class="celula">
						<c:choose>
					   		<c:when test="${item.possuiLinhas }">
					   			<a class="sublinharLink" href="detalhes-avaliacao/${item.checkPoint}">${item.stringLines}</a>
					   		</c:when>
					   		<c:otherwise>
					   			${item.stringLines}
					   		</c:otherwise>
					   	</c:choose>
					   </td>
					</tr>
				</c:if>
			</c:forEach>
	
			</tbody>
			
		</table>
		<br><br>
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
