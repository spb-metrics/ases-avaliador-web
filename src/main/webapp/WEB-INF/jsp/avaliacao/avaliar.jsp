<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:baseLayout>
   <jsp:body>
      <div class="tile --NOVALUE--">	
		<div class="outstanding-header">
			<h2 class="outstanding-title">Página avaliada</h2>
		</div>
		<p>
		<c:if test="${not empty url}">
			<strong>Página:</strong> ${url}
			<br>
		</c:if>
		<strong>Título:</strong> governoeletronico
		<br>
		<strong>Tamanho:</strong> 29.8 KB (30475 bytes)
		<br>
		<strong>Data/Hora:02/09/2013 - 19:29 GMT</p>
     </div>
     
     <div class="tile --NOVALUE--">	
			<div class="outstanding-header">
				<h2 class="outstanding-title">Nota e Resumo da Avaliação de Acessibilidade</h2>
			</div>
				<p></p>
				<p></p>
				<div class="row" data-layout-type="row">
					<div class="cell width-5 position-2 " data-panel="">
						<div id="block">
							<div id="webaxscore" class="scoreB">Porcentagem
								<strong>ASES</strong>
								<span>${nota.valor}%</span>
							</div>
						</div>
					</div>
					<div class="cell width-7 position-6 " data-panel="">
						<table id="tabelaErros">
							<tbody>
							<tr>
								<td class="topo">Seção</td>
								<td class="topo"><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/stop.gif" alt="erro" height="20" width="20"> Erro(s) </td>
								<td class="topo"><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/alert.gif" alt="alerta" height="19" width="20"> Avisos </td>
							</tr>
							<c:forEach items="${listaResumo}" var="resumo">
								<tr>
								<td class="celula">${resumo.tipo.description}</td>
								<td class="celula">${resumo.quantidadeErros}</td>
								<td class="celula">${resumo.quantidadeAvisos}</td>
							</tr>
							</c:forEach>
							</tbody>
							<tfoot>
								<td class="topo">Total</td>
								<td class="topo">${totalErros}</td>
								<td class="topo">${totalAvisos}</td>
							</tfoot>
						</table> 
					</div>
				
				</div>
						
			</div>
			
			
			<div class="tile --NOVALUE--">
				<div class="outstanding-header">
    		    	<h2 class="outstanding-title">Detalhes da Avaliação</h2>
				</div>
					<div class="domtab">

						<ul class="domtabs">
							<li class=""><a href="#pri1">Marcação</a></li>
							<li class=""><a href="#pri2">Comportamento</a></li>
							<li class=""><a href="#pri3">Conteúdo / Informação</a></li>
							<li class=""><a href="#pri4">Apresentação / Design</a></li>
							<li class=""><a href="#pri5">Multimídia</a></li>
							<li class=""><a href="#pri6">Formulários</a></li>
						</ul>
					
						<div style="display: block;">
							<a name="pri1" id="pri1"></a>
							<t:listaResultado lista="${LISTA_MARK}"/>
						</div>
					 
					
						<div style="display: none;">
							
							<a name="pri2" id="pri2"></a>
							<t:listaResultado lista="${LISTA_BEHAVIOR}"/>
						</div>
					 
					
						<div style="display: none;">
						
							<a name="pri3" id="pri3"></a>
							<t:listaResultado lista="${LISTA_CONTENT_INFORMATION}"/>
						</div>
					 
						<div style="display: none;">
							<a name="pri4" id="pri4"></a>
							<t:listaResultado lista="${LISTA_PRESENTATION_DESIGN}"/>
						</div> 
					 
						<div style="display: none;">
							<a name="pri5" id="pri5"></a>
							<t:listaResultado lista="${LISTA_MULTIMEDIA}"/>
						</div>
					 
						<div style="display: none;">
							<a name="pri6" id="pri6"></a>
							<t:listaResultado lista="${LISTA_FORM}"/>
						</div>
					 
					</div>

			</div>
       		
       		
       		
       		
   </jsp:body>
</t:baseLayout>