<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="lista" required="true" type="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<p><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/stop.gif" alt="Erros" height="19" width="20"> Erros</p>
	<table id="tabelaErros2">
	
		<tbody>
			
			<tr>
				<td colspan="2" class="topo2"> Recomendações </td>
				<td width="9%" class="topo2"> Quantidade</td>
				<td width="56%" class="topo2"> Detalhes</td>
			</tr>
			<c:forEach items="${lista}" var="item">
				<c:if test="${item.error }">
					<tr>
					   <td class="celula" width="2%">${item.checkPoint}</td>
					   <td class="celula" width="60%" align="left"> ${item.description}</td>
					   
					   <td class="celula">${item.numberOfOccurrences}</td>
					   <td class="celula">
					   
							<a href="#" class="sublinharLink">${item.stringLines}</a>
						
					   </td>
					</tr>
				</c:if>
			</c:forEach>
			
			</tbody>
								
		</table>
		<br><br>
		
		<p><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/alert.gif" alt="alertas" height="19" width="20"> Avisos</p>	
					 	
															
		<table width="62%" id="tabelaErros2">
			<tbody>
			
			<tr>
				<td colspan="2" class="topo2"> Recomendações </td>
				<td width="9%" class="topo2"> Quantidade</td>
				<td width="56%" class="topo2"> Linha(s) do código fonte </td>
			</tr>
			<c:forEach items="${lista}" var="item">
				<c:if test="${not item.error }">
	
					<tr>
					   <td class="celula" width="2%">${item.checkPoint}</td>
					   <td class="celula" width="60%" align="left"> ${item.description}</td>
					   
					   <td class="celula">${item.numberOfOccurrences}</td>
					   <td class="celula">
					   
							<a href="#" class="sublinharLink">${item.stringLines}</a>
					   
					   </td>
					</tr>
				</c:if>
			</c:forEach>
	
			</tbody>
			
		</table>
		<br><br>
